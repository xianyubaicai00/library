package cool.leeson.library.entity.message;


import java.time.LocalDateTime;

public class MessageEntity {
    @Override
    public String toString() {
        return "MessageEntity{" +
                "id=" + id +
                ", content='" + content + '\'' +
                ", timestamp=" + timestamp +
                '}';
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public LocalDateTime getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(LocalDateTime timestamp) {
        this.timestamp = timestamp;
    }

    private Long id;

    private String content;

    private LocalDateTime timestamp;

    // Getters and setters
}

