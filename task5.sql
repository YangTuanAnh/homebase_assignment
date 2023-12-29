CREATE TABLE "posts" (
	"id" serial PRIMARY KEY,
  	"title" varchar(255),
  	"content" text,
    "created_at" timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE "comments" (
    "id" serial PRIMARY KEY,
    "post_id" integer REFERENCES "posts"("id"),
    "username" varchar(255), -- for simplicity, without creating a new user
    "comment_text" text,
    "created_at" timestamp DEFAULT CURRENT_TIMESTAMP,
);

CREATE PROCEDURE manage_blog_posts(
    "operation" varchar(10),  -- 'add', 'retrieve', 'update', 'delete', 'add_comment', 'delete_comment', 'get_post_comments'
    "post_id" integer,
    "title" varchar(255),
    "content" text,
    "username" varchar(255),
    "comment_text" text
)
LANGUAGE plpgsql    
AS $$
BEGIN;
    IF operation = 'add' THEN
        -- Add a new post
        INSERT INTO posts (title, content) VALUES (title, content);

    ELSEIF operation = 'retrieve' THEN
        -- Retrieve post details
        SELECT * FROM posts WHERE post_id = post_id;

    ELSEIF operation = 'update' THEN
        -- Update a post
        UPDATE posts SET title = title, content = content WHERE post_id = post_id;

    ELSEIF operation = 'delete' THEN
        -- Delete a post and associated comments
        DELETE FROM posts WHERE post_id = post_id;

    ELSEIF operation = 'add_comment' THEN
        -- Add a comment to a post
        INSERT INTO comments (post_id, user_name, comment_text) VALUES (post_id, user_name, comment_text);

    ELSEIF operation = 'delete_comment' THEN
        -- Delete a comment
        DELETE FROM comments WHERE comment_id = comment_id;

    ELSEIF operation = 'get_post_comments' THEN
        -- Get comments for a specific post
        SELECT * FROM comments WHERE post_id = post_id;

    END IF;
END;$$;

-- example call: CALL manage_blog_posts('add', NULL, 'postgresql procedure creation', 'content', NULL, NULL)
-- expected output: a new entry for "posts", with given title and content