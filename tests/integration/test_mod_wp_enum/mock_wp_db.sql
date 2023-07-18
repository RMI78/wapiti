CREATE DATABASE wordpress;

USE DATABASE wordpress;

CREATE TABLE wp_commentmeta (
    meta_id bigint unsigned NOT NULL AUTO_INCREMENT,
    comment_id bigint unsigned NOT NULL,
    meta_key varchar(255) DEFAULT NULL,
    meta_value longtext DEFAULT NULL,
    PRIMARY KEY (meta_id),
    KEY comment_id (comment_id),
    KEY meta_key (meta_key)
);

CREATE TABLE wp_comments (
    comment_ID bigint unsigned NOT NULL AUTO_INCREMENT,
    comment_post_ID bigint unsigned NOT NULL,
    comment_author tinytext NOT NULL,
    comment_author_email varchar(100) NOT NULL,
    comment_author_url varchar(200) NOT NULL,
    comment_author_IP varchar(100) NOT NULL,
    comment_date datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
    comment_date_gmt datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
    comment_content text NOT NULL,
    comment_karma int NOT NULL DEFAULT 0,
    comment_approved varchar(20) NOT NULL DEFAULT '1',
    comment_agent varchar(255) NOT NULL,
    comment_type varchar(20) NOT NULL DEFAULT 'comment',
    comment_parent bigint unsigned NOT NULL DEFAULT 0,
    user_id bigint unsigned NOT NULL DEFAULT 0,
    PRIMARY KEY (comment_ID),
    KEY comment_post_ID (comment_post_ID),
    KEY comment_author_email (comment_author_email),
    KEY comment_date_gmt (comment_date_gmt),
    KEY comment_approved (comment_approved),
    KEY comment_parent (comment_parent)
);

CREATE TABLE wp_links (
    link_id bigint unsigned NOT NULL AUTO_INCREMENT,
    link_url varchar(255) NOT NULL,
    link_name varchar(255) NOT NULL,
    link_image varchar(255) NOT NULL,
    link_target varchar(25) NOT NULL,
    link_description varchar(255) NOT NULL,
    link_visible varchar(20) NOT NULL DEFAULT 'Y',
    link_owner bigint unsigned NOT NULL DEFAULT 1,
    link_rating int NOT NULL DEFAULT 0,
    link_updated datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
    link_rel varchar(255) NOT NULL,
    link_notes mediumtext NOT NULL,
    link_rss varchar(255) NOT NULL,
    PRIMARY KEY (link_id),
    KEY link_visible (link_visible)
);

CREATE TABLE wp_postmeta (
    meta_id bigint unsigned NOT NULL AUTO_INCREMENT,
    post_id bigint unsigned NOT NULL,
    meta_key varchar(255) DEFAULT NULL,
    meta_value longtext DEFAULT NULL,
    PRIMARY KEY (meta_id),
    KEY post_id (post_id),
    KEY meta_key (meta_key)
);

CREATE TABLE wp_posts (
    ID bigint unsigned NOT NULL AUTO_INCREMENT,
    post_author bigint unsigned NOT NULL,
    post_date datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
    post_date_gmt datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
    post_content longtext NOT NULL,
    post_title text NOT NULL,
    post_excerpt text NOT NULL,
    post_status varchar(20) NOT NULL DEFAULT 'publish',
    comment_status varchar(20) NOT NULL DEFAULT 'open',
    ping_status varchar(20) NOT NULL DEFAULT 'open',
    post_password varchar(255) NOT NULL DEFAULT '',
    post_name varchar(200) NOT NULL,
    to_ping text NOT NULL,
    pinged text NOT NULL,
    post_modified datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
    post_modified_gmt datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
    post_content_filtered longtext NOT NULL,
    post_parent bigint unsigned NOT NULL DEFAULT '0',
    guid varchar(255) NOT NULL DEFAULT '',
    menu_order int NOT NULL DEFAULT '0',
    post_type varchar(20) NOT NULL DEFAULT 'post',
    post_mime_type varchar(100) NOT NULL DEFAULT '',
    comment_count bigint NOT NULL DEFAULT '0',
    PRIMARY KEY (ID),
    KEY post_author (post_author),
    KEY post_name (post_name),
    KEY post_type (post_type)
);

CREATE TABLE wp_term_relationships (
    object_id bigint unsigned NOT NULL DEFAULT '0',
    term_taxonomy_id bigint unsigned NOT NULL DEFAULT '0',
    term_order int NOT NULL DEFAULT '0',
    PRIMARY KEY (object_id, term_taxonomy_id)
);

CREATE TABLE wp_term_taxonomy (
    term_taxonomy_id bigint unsigned NOT NULL AUTO_INCREMENT,
    term_id bigint unsigned NOT NULL DEFAULT '0',
    taxonomy varchar(32) NOT NULL,
    description longtext NOT NULL DEFAULT '',
    parent bigint unsigned NOT NULL DEFAULT '0',
    count bigint NOT NULL DEFAULT '0',
    PRIMARY KEY (term_taxonomy_id),
    KEY term_id (term_id),
    KEY taxonomy (taxonomy)
);

CREATE TABLE wp_termmeta (
    meta_id bigint unsigned NOT NULL AUTO_INCREMENT,
    term_id bigint unsigned NOT NULL DEFAULT '0',
    meta_key varchar(255),
    meta_value longtext,
    PRIMARY KEY (meta_id),
    KEY term_id (term_id),
    KEY meta_key (meta_key)
);

CREATE TABLE wp_terms (
    term_id bigint unsigned NOT NULL AUTO_INCREMENT,
    name varchar(200) NOT NULL,
    slug varchar(200) NOT NULL,
    term_group bigint NOT NULL DEFAULT '0',
    PRIMARY KEY (term_id),
    KEY name (name),
    KEY slug (slug)
);

CREATE TABLE wp_usermeta (
    umeta_id bigint unsigned NOT NULL AUTO_INCREMENT,
    user_id bigint unsigned NOT NULL,
    meta_key varchar(255) DEFAULT NULL,
    meta_value longtext DEFAULT NULL,
    PRIMARY KEY (umeta_id),
    KEY user_id (user_id),
    KEY meta_key (meta_key)
);

CREATE TABLE wp_users (
    ID bigint unsigned NOT NULL AUTO_INCREMENT,
    user_login varchar(60) NOT NULL,
    user_pass varchar(255) NOT NULL,
    user_nicename varchar(50) NOT NULL,
    user_email varchar(100) NOT NULL,
    user_url varchar(100) NOT NULL,
    user_registered datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
    user_activation_key varchar(255) NOT NULL,
    user_status int NOT NULL DEFAULT 0,
    display_name varchar(250) NOT NULL,
    PRIMARY KEY (ID),
    KEY user_login (user_login),
    KEY user_nicename (user_nicename),
    KEY user_email (user_email)
);

INSERT INTO wp_users (ID, user_login, user_pass, user_nicename, user_email, user_url, user_registered, user_activation_key, user_status, display_name)
VALUES (1, 'Test', '$P$BBjw9AogP55EL3mp3f2NRAXUevyLbv1', 'test', 'test@mail.com', 'http://10.10.16.63', '2023-07-18 09:10:02', '', 0, 'Test');
