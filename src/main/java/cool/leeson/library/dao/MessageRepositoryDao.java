package cool.leeson.library.dao;

import cool.leeson.library.entity.message.MessageEntity;

public interface MessageRepositoryDao {
    void save(MessageEntity messageEntity);
}
