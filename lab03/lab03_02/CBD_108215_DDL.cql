CREATE KEYSPACE IF NOT EXISTS cbd_108215_ex2 WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'}  AND durable_writes = true;
USE cbd_108215_ex2;

DROP TABLE IF EXISTS users;
CREATE TABLE IF NOT EXISTS users (
    id int PRIMARY KEY,
    username text,
    name text,
    email text,
    registration_timestamp timestamp
);

DROP TABLE IF EXISTS videos;
CREATE TABLE IF NOT EXISTS videos (
    video_id int,
    author_username text,
    name text,
    description text,
    tags set<text>,
    upload_timestamp timestamp,
    PRIMARY KEY (video_id, upload_timestamp)
);

DROP TABLE IF EXISTS videos_by_author;
CREATE TABLE IF NOT EXISTS videos_by_author (
    video_id int,
    author_username text,
    name text,
    description text,
    tags set<text>,
    upload_timestamp timestamp,
    PRIMARY KEY (author_username, upload_timestamp, video_id)
);

-- Tabela criada para permitir que o 2 d) 6 seja feito da maneira mais eficiente que consegui pensar
DROP TABLE IF EXISTS videos_by_upload_date;
CREATE TABLE IF NOT EXISTS videos_by_upload_date(
    upload_date DATE,
    upload_timestamp TIMESTAMP,
    video_id int,
    author_username TEXT,
    name TEXT,
    description TEXT,
    tags SET<TEXT>,
    PRIMARY KEY (upload_date, upload_timestamp, video_id)
) WITH CLUSTERING ORDER BY (upload_timestamp DESC, video_id ASC);


DROP TABLE IF EXISTS comments;
CREATE TABLE IF NOT EXISTS comments (
    comment_id int PRIMARY KEY,
    video_id int,
    author_username TEXT,
    comment TEXT,
    comment_timestamp TIMESTAMP
);

DROP TABLE IF EXISTS comments_by_video;
CREATE TABLE IF NOT EXISTS comments_by_video (
    video_id int,
    comment_id int,
    author_username TEXT,
    comment TEXT,
    comment_timestamp TIMESTAMP,
    PRIMARY KEY (video_id, comment_timestamp)
) WITH CLUSTERING ORDER BY (comment_timestamp DESC);

DROP TABLE IF EXISTS comments_by_user;
CREATE TABLE IF NOT EXISTS comments_by_user(
    comment_id int,
    video_id int,
    comment TEXT,
    author_username TEXT,
    comment_timestamp TIMESTAMP,
    PRIMARY KEY (author_username, comment_timestamp)
) WITH CLUSTERING ORDER BY (comment_timestamp DESC);

-- Tabela criada para permitir que o 2 d) 8 seja feito da maneira mais eficiente que consegui pensar
DROP TABLE IF EXISTS user_following_comments;
CREATE TABLE user_following_comments (
    username TEXT,
    video_id int,
    comment_id int,
    comment TEXT,
    comment_timestamp TIMESTAMP,
    PRIMARY KEY ((username), video_id, comment_timestamp)
) WITH CLUSTERING ORDER BY (video_id ASC, comment_timestamp DESC);



DROP TABLE IF EXISTS video_followers;
CREATE TABLE IF NOT EXISTS video_followers(
    video_id int,
    follower_username TEXT,
    PRIMARY KEY (video_id, follower_username)
);

DROP TABLE IF EXISTS video_events;
CREATE TABLE IF NOT EXISTS video_events(
    video_id int,
    username TEXT,
    event_timestamp TIMESTAMP,
    video_timestamp TIMESTAMP,
    event_type TEXT,
    PRIMARY KEY ((video_id, username), event_timestamp)
) WITH CLUSTERING ORDER BY (event_timestamp DESC);

DROP TABLE IF EXISTS video_ratings;
CREATE TABLE video_ratings (
    video_id int,
    rating_id int,
    rating_value INT,
    PRIMARY KEY (video_id, rating_id)
) WITH CLUSTERING ORDER BY (rating_id DESC);
