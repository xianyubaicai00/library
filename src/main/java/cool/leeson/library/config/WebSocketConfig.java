package cool.leeson.library.config;

import cool.leeson.library.controller.message.ChatHandler;
import cool.leeson.library.dao.SchoolNotificationDao;
import cool.leeson.library.dao.UserInfoDao;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer {
    private final SchoolNotificationDao schoolNotificationDao;
    private final UserInfoDao userInfoDao;

    public WebSocketConfig(SchoolNotificationDao schoolNotificationDao, UserInfoDao userInfoDao) {
        this.schoolNotificationDao = schoolNotificationDao;
        this.userInfoDao = userInfoDao;
    }

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        registry.addHandler(new ChatHandler(userInfoDao, schoolNotificationDao), "/chat")
                .setAllowedOrigins("*");  // 允许所有来源连接
    }
}
