package cool.leeson.library.controller.message;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import cool.leeson.library.dao.SchoolNotificationDao;
import cool.leeson.library.dao.UserInfoDao;
import cool.leeson.library.entity.library.SchoolNotification;
import cool.leeson.library.entity.user.UserInfo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Collectors;

@Component
@Slf4j
@RequiredArgsConstructor
public class ChatHandler extends TextWebSocketHandler {
    private Map<String, WebSocketSession> sessions = new ConcurrentHashMap<>();
    @Autowired
    private ObjectMapper objectMapper = new ObjectMapper();
    private final UserInfoDao userInfoDao;
    private final SchoolNotificationDao schoolNotificationDao;

    @Override
    public void afterConnectionEstablished(WebSocketSession session) {
        sessions.put(session.getId(), session);
    }

    @Override
    public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        SchoolNotification schoolNotification = new SchoolNotification();
        String payload = message.getPayload();
        log.info("接收到消息{}", payload);

        // 解析消息
        JsonNode jsonNode = objectMapper.readTree(payload);
        String messageType = jsonNode.get("type").asText();
        JsonNode contentNode = jsonNode.get("content");

        if (contentNode == null) {
            log.error("Received message content is null.");
            return;
        }

        if ("message".equals(messageType)) {
            // 将 content 部分解析为 SchoolNotification 对象
            schoolNotification = objectMapper.treeToValue(contentNode, SchoolNotification.class);
            log.info("接收到消息，内容是{}", schoolNotification);
            if (!Objects.equals(schoolNotification.getUserId(), "admin")) {
                schoolNotification.setView(1);
            } else {
                schoolNotification.setView(0);
            }
            schoolNotification.setNotificationId(UUID.randomUUID().toString());
            schoolNotification.setDate(new Date());
            //获取到用户的名称当title用
            UserInfo userInfo = userInfoDao.queryById(schoolNotification.getUserId());
            schoolNotification.setTitle(userInfo.getNickName());
            // 保存消息到数据库
            log.info("难道是没注入成功？{}", schoolNotificationDao);
            this.schoolNotificationDao.insert(schoolNotification);
        }

        // 广播消息给其他用户
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        schoolNotification.setFormattedDate(sdf.format(schoolNotification.getDate()));
        String notificationJson = objectMapper.writeValueAsString(schoolNotification);
        TextMessage notificationMessage = new TextMessage(notificationJson);
        for (WebSocketSession sess : sessions.values()) {
//            if (sess.isOpen() && !sess.getId().equals(session.getId())) {
            sess.sendMessage(notificationMessage);
            log.info("发送消息{}", notificationMessage);
//            }
        }
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) {
        sessions.remove(session.getId());
    }
}
