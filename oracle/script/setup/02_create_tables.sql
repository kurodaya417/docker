ALTER SESSION SET CONTAINER=XEPDB1;

conn user1/user1@XEPDB1
show user

CREATE TABLE event (
    id               RAW(16)        PRIMARY KEY,
    title            VARCHAR2(255)  NOT NULL,
    description      CLOB,
    event_date             TIMESTAMP      NOT NULL,
    image_url        VARCHAR2(512),
    max_participants NUMBER(5)      NOT NULL,
    host_user_id     RAW(16)        NOT NULL,
    created_at       TIMESTAMP      DEFAULT CURRENT_TIMESTAMP,
    updated_at       TIMESTAMP
);

CREATE TABLE participation (
    id         RAW(16)       PRIMARY KEY,
    user_id    RAW(16)       NOT NULL,
    event_id   RAW(16)       NOT NULL,
    joined_at  TIMESTAMP     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT fk_event FOREIGN KEY (event_id) REFERENCES event(id) ON DELETE CASCADE,
    CONSTRAINT uq_user_event UNIQUE (user_id, event_id)
);

CREATE TABLE app_user (
    id       RAW(16)        PRIMARY KEY,
    username VARCHAR2(100)  UNIQUE NOT NULL,
    email    VARCHAR2(255)  UNIQUE NOT NULL
);
