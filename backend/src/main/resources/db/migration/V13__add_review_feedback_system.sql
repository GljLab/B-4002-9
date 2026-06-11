CREATE TABLE review_rounds (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    post_id BIGINT NOT NULL,
    reviewer_id BIGINT NOT NULL,
    result VARCHAR(20) NULL,
    modification_note TEXT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_review_rounds_post FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE,
    CONSTRAINT fk_review_rounds_reviewer FOREIGN KEY (reviewer_id) REFERENCES users(id),
    CONSTRAINT idx_review_rounds_post_id (post_id)
);

CREATE TABLE review_comments (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    round_id BIGINT NOT NULL,
    content TEXT NOT NULL,
    priority VARCHAR(20) NOT NULL DEFAULT 'SUGGESTION',
    paragraph_index INT NULL,
    position_start INT NULL,
    position_end INT NULL,
    author_reply TEXT NULL,
    author_resolved TINYINT(1) NOT NULL DEFAULT 0,
    author_replied_at DATETIME NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_review_comments_round FOREIGN KEY (round_id) REFERENCES review_rounds(id) ON DELETE CASCADE,
    CONSTRAINT idx_review_comments_round_id (round_id)
);

CREATE TABLE review_templates (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    content TEXT NOT NULL,
    priority VARCHAR(20) NOT NULL DEFAULT 'SUGGESTION',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NULL
);
