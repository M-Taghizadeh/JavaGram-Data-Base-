CREATE DATABASE JavaGram_DB

CREATE TABLE tbl_users(
    user_id int NOT null AUTO_INCREMENT,
    name varchar(50) NOT null,
    last_name varchar(50) NOT null,
    user_name varchar(30) UNIQUE,
    pass varchar(50) NOT null,
    email varchar(50) NOT null,
    country varchar(50) NOT null,
    
    PRIMARY KEY(user_id, user_name)
)

CREATE TABLE tbl_post(
    user_name varchar(30), 
    post_txt text,
    post_pic longblob,
    sharing_date date DEFAULT CURRENT_TIMESTAMP,
  
    FOREIGN KEY (user_name) REFERENCES tbl_users(user_name)
)

CREATE TABLE tbl_follow(
    user_name1 varchar(30) not null,
    user_name2 varchar(30) not null, 
    
    FOREIGN KEY (user_name1) REFERENCES tbl_users(user_name),
    FOREIGN KEY (user_name2) REFERENCES tbl_users(user_name)
)

CREATE TABLE tbl_comments(
    user_name1 varchar(30) not null,
    user_name2 varchar(30) not null,
    post text,
    post_date datetime,
    comment_text varchar(200),
    comment_date datetime DEFAULT CURRENT_TIMESTAMP,
   	
    FOREIGN KEY (user_name1) REFERENCES tbl_users(user_name),
    FOREIGN KEY (user_name2) REFERENCES tbl_users(user_name)
)


CREATE TABLE tbl_like_post(
    user_name1 varchar(30) not null,
    user_name2 varchar(30) not null,
    post text not null,
    like_date datetime DEFAULT CURRENT_TIMESTAMP,
        
    FOREIGN KEY (user_name1) REFERENCES tbl_users(user_name),
    FOREIGN KEY (user_name2) REFERENCES tbl_users(user_name)
)

CREATE TABLE tbl_private_messages(
    user_name1 varchar(30) not null,
    user_name2 varchar(30) not null,
    message_txt text,
    date datetime DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (user_name1) REFERENCES tbl_users(user_name),
    FOREIGN KEY (user_name2) REFERENCES tbl_users(user_name)
)



