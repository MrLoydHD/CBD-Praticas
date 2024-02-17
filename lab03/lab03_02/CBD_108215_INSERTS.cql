-- Insert users
INSERT INTO cbd_108215_ex2.users (id, username, name, email, registration_timestamp) VALUES ( 1, 'OsPrimos', 'Os Primos', 'osprimos@email.com', toTimestamp(now()));
INSERT INTO cbd_108215_ex2.users (id, username, name, email, registration_timestamp) VALUES ( 2, 'Tiagovski', 'tiagovski', 'tiagovski@email.com', toTimestamp(now()));
INSERT INTO cbd_108215_ex2.users (id, username, name, email, registration_timestamp) VALUES ( 3, 'Wuant', 'Paulo Pinto', 'wuant@email.com', toTimestamp(now()));
INSERT INTO cbd_108215_ex2.users (id, username, name, email, registration_timestamp) VALUES ( 4, 'RicFazeres', 'Ricardo Fazeres', 'ric@email.com', toTimestamp(now()));
INSERT INTO cbd_108215_ex2.users (id, username, name, email, registration_timestamp) VALUES ( 5, 'PTM', 'Pedro Teixera da Mota', 'ptm@email.com', toTimestamp(now()));
INSERT INTO cbd_108215_ex2.users (id, username, name, email, registration_timestamp) VALUES ( 6, 'D4rkFrame', 'Dark Frame', 'dframe@email.com', toTimestamp(now()));
INSERT INTO cbd_108215_ex2.users (id, username, name, email, registration_timestamp) VALUES ( 7, 'SirKazzio', 'Antony Kazzio', 'bots@email.com', toTimestamp(now()));
INSERT INTO cbd_108215_ex2.users (id, username, name, email, registration_timestamp) VALUES ( 8, 'Vinnicius13', 'Vinnicius', 'vin13@email.com', toTimestamp(now()));
INSERT INTO cbd_108215_ex2.users (id, username, name, email, registration_timestamp) VALUES ( 9, 'Flygon2003', 'Flygas', 'flygon@email.com', toTimestamp(now()));
INSERT INTO cbd_108215_ex2.users (id, username, name, email, registration_timestamp) VALUES ( 10, 'Dayzer', 'Tomas', 'dayzer@email.com', toTimestamp(now()));

-- Insert videos
INSERT INTO cbd_108215_ex2.videos (video_id, author_username, name, description, tags, upload_timestamp) VALUES ( 1, 'OsPrimos', 'Os Primos react: Chentric - Melhor Francesinha', 'Primos reagem ao God Chentric', {'react', 'comedy'}, toTimestamp(now()));
INSERT INTO cbd_108215_ex2.videos (video_id, author_username, name, description, tags, upload_timestamp) VALUES ( 2, 'OsPrimos', 'Os Primos react: Tiagovksi Lambo', 'Primos reagem ao lambo do vksi', {'react', 'comedy'}, toTimestamp(now()));
INSERT INTO cbd_108215_ex2.videos (video_id, author_username, name, description, tags, upload_timestamp) VALUES ( 3, 'Wuant', 'Canção de engate', 'Wuant a cantar bue bem', {'music', 'rock'}, toTimestamp(now()));
INSERT INTO cbd_108215_ex2.videos (video_id, author_username, name, description, tags, upload_timestamp) VALUES ( 4, 'RicFazeres', 'Novo Setup', 'Novo setup patrocinado pela vodafone', {'vlog', 'pub', 'sliceoflife'}, toTimestamp(now()));
INSERT INTO cbd_108215_ex2.videos (video_id, author_username, name, description, tags, upload_timestamp) VALUES ( 5, 'PTM', 'Espetaculo de verão', 'Espetaculo de comedia', {'comedy', 'darkhumor'}, toTimestamp(now()));
INSERT INTO cbd_108215_ex2.videos (video_id, author_username, name, description, tags, upload_timestamp) VALUES ( 6, 'D4rkFrame', 'FNAF 4 - Ep1', 'Gameplay de Five Night and Freedys', {'gameplay', 'horror'}, toTimestamp(now()));
INSERT INTO cbd_108215_ex2.videos (video_id, author_username, name, description, tags, upload_timestamp) VALUES ( 7, 'SirKazzio', 'Minecraft Server - O Começo', 'Começo de um servidor de minecraft', {'gameplay', 'casual'}, toTimestamp(now()));
INSERT INTO cbd_108215_ex2.videos (video_id, author_username, name, description, tags, upload_timestamp) VALUES ( 8, 'Vinnicius13', 'Casa automatica episodio 800', 'Mais um episodio da casa automatica', {'gameplay', 'casual'}, toTimestamp(now()));
INSERT INTO cbd_108215_ex2.videos (video_id, author_username, name, description, tags, upload_timestamp) VALUES ( 9, 'Flygon2003', 'Flygon2003 - HardCore Nuzlocke', 'Pokemon hardcore Nuzlocke', {'gameplay', 'hardcore'}, toTimestamp(now()));
INSERT INTO cbd_108215_ex2.videos (video_id, author_username, name, description, tags, upload_timestamp) VALUES ( 10, 'Dayzer', 'FIFA 10', 'Gameplay de FIFA 10', {'futebol', 'gameplay'}, toTimestamp(now()));
INSERT INTO cbd_108215_ex2.videos (video_id, author_username, name, description, tags, upload_timestamp) VALUES ( 11, 'Tiagovski', 'tiagovski - Lambo', 'Review do meu novo lamborghini', {'car', 'vlog'}, toTimestamp(now()));
INSERT INTO cbd_108215_ex2.videos (video_id, author_username, name, description, tags, upload_timestamp) VALUES ( 12, 'Tiagovski', 'tiagovski - Ferrari', 'Review do meu novo ferrari', {'car', 'vlog'}, toTimestamp(now()));

-- Insert videos_by_author
INSERT INTO cbd_108215_ex2.videos_by_author (video_id, author_username, name, description, tags, upload_timestamp) VALUES ( 1, 'OsPrimos', 'Os Primos react: Chentric - Melhor Francesinha', 'Primos reagem ao God Chentric', {'react', 'comedy'}, toTimestamp(now()));
INSERT INTO cbd_108215_ex2.videos_by_author (video_id, author_username, name, description, tags, upload_timestamp) VALUES ( 2, 'OsPrimos', 'Os Primos react: Tiagovksi Lambo', 'Primos reagem ao lambo do vksi', {'react', 'comedy'}, toTimestamp(now()));
INSERT INTO cbd_108215_ex2.videos_by_author (video_id, author_username, name, description, tags, upload_timestamp) VALUES ( 3, 'Wuant', 'Canção de engate', 'Wuant a cantar bue bem', {'music', 'rock'}, toTimestamp(now()));
INSERT INTO cbd_108215_ex2.videos_by_author (video_id, author_username, name, description, tags, upload_timestamp) VALUES ( 4, 'RicFazeres', 'Novo Setup', 'Novo setup patrocinado pela vodafone', {'vlog', 'pub', 'sliceoflife'}, toTimestamp(now()));
INSERT INTO cbd_108215_ex2.videos_by_author (video_id, author_username, name, description, tags, upload_timestamp) VALUES ( 5, 'PTM', 'Espetaculo de verão', 'Espetaculo de comedia', {'comedy', 'darkhumor'}, toTimestamp(now()));
INSERT INTO cbd_108215_ex2.videos_by_author (video_id, author_username, name, description, tags, upload_timestamp) VALUES ( 6, 'D4rkFrame', 'FNAF 4 - Ep1', 'Gameplay de Five Night and Freedys', {'gameplay', 'horror'}, toTimestamp(now()));
INSERT INTO cbd_108215_ex2.videos_by_author (video_id, author_username, name, description, tags, upload_timestamp) VALUES ( 7, 'SirKazzio', 'Minecraft Server - O Começo', 'Começo de um servidor de minecraft', {'gameplay', 'casual'}, toTimestamp(now()));
INSERT INTO cbd_108215_ex2.videos_by_author (video_id, author_username, name, description, tags, upload_timestamp) VALUES ( 8, 'Vinnicius13', 'Casa automatica episodio 800', 'Mais um episodio da casa automatica', {'gameplay', 'casual'}, toTimestamp(now()));
INSERT INTO cbd_108215_ex2.videos_by_author (video_id, author_username, name, description, tags, upload_timestamp) VALUES ( 9, 'Flygon2003', 'Flygon2003 - HardCore Nuzlocke', 'Pokemon hardcore Nuzlocke', {'gameplay', 'hardcore'}, toTimestamp(now()));
INSERT INTO cbd_108215_ex2.videos_by_author (video_id, author_username, name, description, tags, upload_timestamp) VALUES ( 10, 'Dayzer', 'FIFA 10', 'Gameplay de FIFA 10', {'futebol', 'gameplay'}, toTimestamp(now()));
INSERT INTO cbd_108215_ex2.videos_by_author (video_id, author_username, name, description, tags, upload_timestamp) VALUES ( 11, 'Tiagovski', 'tiagovski - Lambo', 'Review do meu novo lamborghini', {'car', 'vlog'}, toTimestamp(now()));
INSERT INTO cbd_108215_ex2.videos_by_author (video_id, author_username, name, description, tags, upload_timestamp) VALUES ( 12, 'Tiagovski', 'tiagovski - Ferrari', 'Review do meu novo ferrari', {'car', 'vlog'}, toTimestamp(now()));

-- Insert videos_by_upload_date (APENAS PARA FAZER O 2D 6)
INSERT INTO cbd_108215_ex2.videos_by_upload_date (upload_date, upload_timestamp, video_id, author_username, description, name, tags) VALUES ( '2023-08-01', toTimestamp(now()), 1, 'OsPrimos', 'Primos reagem ao God Chentric', 'Os Primos react: Chentric - Melhor Francesinha', {'react', 'comedy'});
INSERT INTO cbd_108215_ex2.videos_by_upload_date (upload_date, upload_timestamp, video_id, author_username, description, name, tags) VALUES ( '2023-08-01', toTimestamp(now()), 2, 'OsPrimos', 'Primos reagem ao lambo do vksi', 'Os Primos react: Tiagovksi Lambo', {'react', 'comedy'});
INSERT INTO cbd_108215_ex2.videos_by_upload_date (upload_date, upload_timestamp, video_id, author_username, description, name, tags) VALUES ( '2023-08-01', toTimestamp(now()), 3, 'Wuant', 'Wuant a cantar bue bem', 'Canção de engate', {'music', 'rock'});
INSERT INTO cbd_108215_ex2.videos_by_upload_date (upload_date, upload_timestamp, video_id, author_username, description, name, tags) VALUES ( '2023-08-01', toTimestamp(now()), 4, 'RicFazeres', 'Novo setup patrocinado pela vodafone', 'Novo Setup', {'vlog', 'pub', 'sliceoflife'});
INSERT INTO cbd_108215_ex2.videos_by_upload_date (upload_date, upload_timestamp, video_id, author_username, description, name, tags) VALUES ( '2023-08-01', toTimestamp(now()), 5, 'PTM', 'Espetaculo de comedia', 'Espetaculo de verão', {'comedy', 'darkhumor'});
INSERT INTO cbd_108215_ex2.videos_by_upload_date (upload_date, upload_timestamp, video_id, author_username, description, name, tags) VALUES ( '2023-08-01', toTimestamp(now()), 6, 'D4rkFrame', 'Gameplay de Five Night and Freedys', 'FNAF 4 - Ep1', {'gameplay', 'horror'});
INSERT INTO cbd_108215_ex2.videos_by_upload_date (upload_date, upload_timestamp, video_id, author_username, description, name, tags) VALUES ( '2023-08-01', toTimestamp(now()), 7, 'SirKazzio', 'Começo de um servidor de minecraft', 'Minecraft Server - O Começo', {'gameplay', 'casual'});
INSERT INTO cbd_108215_ex2.videos_by_upload_date (upload_date, upload_timestamp, video_id, author_username, description, name, tags) VALUES ( '2023-08-01', toTimestamp(now()), 8, 'Vinnicius13', 'Mais um episodio da casa automatica', 'Casa automatica episodio 800', {'gameplay', 'casual'});
INSERT INTO cbd_108215_ex2.videos_by_upload_date (upload_date, upload_timestamp, video_id, author_username, description, name, tags) VALUES ( '2023-08-01', toTimestamp(now()), 9, 'Flygon2003', 'Pokemon hardcore Nuzlocke', 'Flygon2003 - HardCore Nuzlocke', {'gameplay', 'hardcore'});
INSERT INTO cbd_108215_ex2.videos_by_upload_date (upload_date, upload_timestamp, video_id, author_username, description, name, tags) VALUES ( '2023-08-01', toTimestamp(now()), 10, 'Dayzer', 'Gameplay de FIFA 10', 'FIFA 10', {'futebol', 'gameplay'});
INSERT INTO cbd_108215_ex2.videos_by_upload_date (upload_date, upload_timestamp, video_id, author_username, description, name, tags) VALUES ( '2023-08-01', toTimestamp(now()), 11, 'Tiagovski', 'Review do meu novo lamborghini', 'tiagovski - Lambo', {'car', 'vlog'});
INSERT INTO cbd_108215_ex2.videos_by_upload_date (upload_date, upload_timestamp, video_id, author_username, description, name, tags) VALUES ( '2023-08-01', toTimestamp(now()), 12, 'Tiagovski', 'Review do meu novo ferrari', 'tiagovski - Ferrari', {'car', 'vlog'});


-- Insert comments
INSERT INTO cbd_108215_ex2.comments(comment_id, author_username, comment, comment_timestamp, video_id) VALUES ( 1, 'Wuant', 'Muito bom Primos', toTimestamp(now()), 1);
INSERT INTO cbd_108215_ex2.comments(comment_id, author_username, comment, comment_timestamp, video_id) VALUES ( 2, 'RicFazeres', 'Muito mau Primos', toTimestamp(now()), 1);
INSERT INTO cbd_108215_ex2.comments(comment_id, author_username, comment, comment_timestamp, video_id) VALUES ( 3, 'Os Primos', 'UABO', toTimestamp(now()), 3);
INSERT INTO cbd_108215_ex2.comments(comment_id, author_username, comment, comment_timestamp, video_id) VALUES ( 4, 'Os Primos', ' bom', toTimestamp(now()), 4);
INSERT INTO cbd_108215_ex2.comments(comment_id, author_username, comment, comment_timestamp, video_id) VALUES ( 5, 'Wuant', 'Top Chucha', toTimestamp(now()), 5);
INSERT INTO cbd_108215_ex2.comments(comment_id, author_username, comment, comment_timestamp, video_id) VALUES ( 6, 'D4rkFrame', 'Tive de comentar o meu proprio video, sad', toTimestamp(now()), 6);
INSERT INTO cbd_108215_ex2.comments(comment_id, author_username, comment, comment_timestamp, video_id) VALUES ( 7, 'Tiagovski', 'Muita bom', toTimestamp(now()), 7);
INSERT INTO cbd_108215_ex2.comments(comment_id, author_username, comment, comment_timestamp, video_id) VALUES ( 8, 'Tiagovski', 'Muita bom 2', toTimestamp(now()), 8);
INSERT INTO cbd_108215_ex2.comments(comment_id, author_username, comment, comment_timestamp, video_id) VALUES ( 9, 'Flygon2003', 'Muito bom', toTimestamp(now()), 8);
INSERT INTO cbd_108215_ex2.comments(comment_id, author_username, comment, comment_timestamp, video_id) VALUES ( 10, 'Dayzer', 'Muito bom', toTimestamp(now()), 11);
INSERT INTO cbd_108215_ex2.comments(comment_id, author_username, comment, comment_timestamp, video_id) VALUES ( 11, 'Tiagovski', 'Muito bom', toTimestamp(now()), 10);
INSERT INTO cbd_108215_ex2.comments(comment_id, author_username, comment, comment_timestamp, video_id) VALUES ( 12, 'Tiagovski', 'Afinal não curti', toTimestamp(now()), 10);

-- Insert comments_by_video
INSERT INTO cbd_108215_ex2.comments_by_video(comment_id, author_username, comment, comment_timestamp, video_id) VALUES ( 1, 'Wuant', 'Muito bom Primos', toTimestamp(now()), 1);
INSERT INTO cbd_108215_ex2.comments_by_video(comment_id, author_username, comment, comment_timestamp, video_id) VALUES ( 2, 'RicFazeres', 'Muito mau Primos', toTimestamp(now()), 1);
INSERT INTO cbd_108215_ex2.comments_by_video(comment_id, author_username, comment, comment_timestamp, video_id) VALUES ( 3, 'Os Primos', 'UABO', toTimestamp(now()), 3);
INSERT INTO cbd_108215_ex2.comments_by_video(comment_id, author_username, comment, comment_timestamp, video_id) VALUES ( 4, 'Os Primos', ' bom', toTimestamp(now()), 4);
INSERT INTO cbd_108215_ex2.comments_by_video(comment_id, author_username, comment, comment_timestamp, video_id) VALUES ( 5, 'Wuant', 'Top Chucha', toTimestamp(now()), 5);
INSERT INTO cbd_108215_ex2.comments_by_video(comment_id, author_username, comment, comment_timestamp, video_id) VALUES ( 6, 'D4rkFrame', 'Tive de comentar o meu proprio video, sad', toTimestamp(now()), 6);
INSERT INTO cbd_108215_ex2.comments_by_video(comment_id, author_username, comment, comment_timestamp, video_id) VALUES ( 7, 'Tiagovski', 'Muita bom', toTimestamp(now()), 7);
INSERT INTO cbd_108215_ex2.comments_by_video(comment_id, author_username, comment, comment_timestamp, video_id) VALUES ( 8, 'Tiagovski', 'Muita bom 2', toTimestamp(now()), 8);
INSERT INTO cbd_108215_ex2.comments_by_video(comment_id, author_username, comment, comment_timestamp, video_id) VALUES ( 9, 'Flygon2003', 'Muito bom', toTimestamp(now()), 8);
INSERT INTO cbd_108215_ex2.comments_by_video(comment_id, author_username, comment, comment_timestamp, video_id) VALUES ( 10, 'Dayzer', 'Muito bom', toTimestamp(now()), 11);
INSERT INTO cbd_108215_ex2.comments_by_video(comment_id, author_username, comment, comment_timestamp, video_id) VALUES ( 11, 'Tiagovski', 'Muito bom', toTimestamp(now()), 10);
INSERT INTO cbd_108215_ex2.comments_by_video(comment_id, author_username, comment, comment_timestamp, video_id) VALUES ( 12, 'Tiagovski', 'Afinal não curti', toTimestamp(now()), 10);
INSERT INTO cbd_108215_ex2.comments_by_video(comment_id, author_username, comment, comment_timestamp, video_id) VALUES ( 13, 'Wuant', 'Muito bom Primos', toTimestamp(now()), 1);
INSERT INTO cbd_108215_ex2.comments_by_video(comment_id, author_username, comment, comment_timestamp, video_id) VALUES ( 14, 'RicFazeres', 'Muito mau Primos', toTimestamp(now()), 1);

-- Insert comments_by_user
INSERT INTO cbd_108215_ex2.comments_by_user(comment_id, author_username, comment, comment_timestamp, video_id) VALUES ( 1, 'Wuant', 'Muito bom Primos', toTimestamp(now()), 1);
INSERT INTO cbd_108215_ex2.comments_by_user(comment_id, author_username, comment, comment_timestamp, video_id) VALUES ( 2, 'RicFazeres', 'Muito mau Primos', toTimestamp(now()), 1);
INSERT INTO cbd_108215_ex2.comments_by_user(comment_id, author_username, comment, comment_timestamp, video_id) VALUES ( 3, 'Os Primos', 'UABO', toTimestamp(now()), 3);
INSERT INTO cbd_108215_ex2.comments_by_user(comment_id, author_username, comment, comment_timestamp, video_id) VALUES ( 4, 'Os Primos', ' bom', toTimestamp(now()), 4);
INSERT INTO cbd_108215_ex2.comments_by_user(comment_id, author_username, comment, comment_timestamp, video_id) VALUES ( 5, 'Wuant', 'Top Chucha', toTimestamp(now()), 5);
INSERT INTO cbd_108215_ex2.comments_by_user(comment_id, author_username, comment, comment_timestamp, video_id) VALUES ( 6, 'D4rkFrame', 'Tive de comentar o meu proprio video, sad', toTimestamp(now()), 6);
INSERT INTO cbd_108215_ex2.comments_by_user(comment_id, author_username, comment, comment_timestamp, video_id) VALUES ( 7, 'Tiagovski', 'Muita bom', toTimestamp(now()), 7);
INSERT INTO cbd_108215_ex2.comments_by_user(comment_id, author_username, comment, comment_timestamp, video_id) VALUES ( 8, 'Tiagovski', 'Muita bom 2', toTimestamp(now()), 8);
INSERT INTO cbd_108215_ex2.comments_by_user(comment_id, author_username, comment, comment_timestamp, video_id) VALUES ( 9, 'Flygon2003', 'Muito bom', toTimestamp(now()), 8);
INSERT INTO cbd_108215_ex2.comments_by_user(comment_id, author_username, comment, comment_timestamp, video_id) VALUES ( 10, 'Dayzer', 'Muito bom', toTimestamp(now()), 11);
INSERT INTO cbd_108215_ex2.comments_by_user(comment_id, author_username, comment, comment_timestamp, video_id) VALUES ( 11, 'Tiagovski', 'Muito bom', toTimestamp(now()), 10);
INSERT INTO cbd_108215_ex2.comments_by_user(comment_id, author_username, comment, comment_timestamp, video_id) VALUES ( 12, 'Tiagovski', 'Afinal não curti', toTimestamp(now()), 10);

-- Insert user_following_comments
INSERT INTO cbd_108215_ex2.user_following_comments(username, video_id, comment_id, comment, comment_timestamp) VALUES ( 'OsPrimos', 1, 1, 'Muito bom Primos', toTimestamp(now()));
INSERT INTO cbd_108215_ex2.user_following_comments(username, video_id, comment_id, comment, comment_timestamp) VALUES ( 'OsPrimos', 1, 2, 'Muito mau Primos', toTimestamp(now()));
INSERT INTO cbd_108215_ex2.user_following_comments(username, video_id, comment_id, comment, comment_timestamp) VALUES ( 'OsPrimos', 3, 3, 'UABO', toTimestamp(now()));
INSERT INTO cbd_108215_ex2.user_following_comments(username, video_id, comment_id, comment, comment_timestamp) VALUES ( 'OsPrimos', 4, 4, ' bom', toTimestamp(now()));
INSERT INTO cbd_108215_ex2.user_following_comments(username, video_id, comment_id, comment, comment_timestamp) VALUES ( 'OsPrimos', 5, 5, 'Top Chucha', toTimestamp(now()));
INSERT INTO cbd_108215_ex2.user_following_comments(username, video_id, comment_id, comment, comment_timestamp) VALUES ( 'OsPrimos', 6, 6, 'Tive de comentar o meu proprio video, sad', toTimestamp(now()));
INSERT INTO cbd_108215_ex2.user_following_comments(username, video_id, comment_id, comment, comment_timestamp) VALUES ( 'OsPrimos', 7, 7, 'Muita bom', toTimestamp(now()));
INSERT INTO cbd_108215_ex2.user_following_comments(username, video_id, comment_id, comment, comment_timestamp) VALUES ( 'OsPrimos', 8, 8, 'Muita bom 2', toTimestamp(now()));

-- Insert video_followers;
INSERT INTO cbd_108215_ex2.video_followers(video_id, follower_username) VALUES ( 1, 'OsPrimos');
INSERT INTO cbd_108215_ex2.video_followers(video_id, follower_username) VALUES ( 1, 'Wuant');
INSERT INTO cbd_108215_ex2.video_followers(video_id, follower_username) VALUES ( 1, 'RicFazeres');
INSERT INTO cbd_108215_ex2.video_followers(video_id, follower_username) VALUES ( 2, 'PTM');
INSERT INTO cbd_108215_ex2.video_followers(video_id, follower_username) VALUES ( 2, 'D4rkFrame');
INSERT INTO cbd_108215_ex2.video_followers(video_id, follower_username) VALUES ( 2, 'SirKazzio');
INSERT INTO cbd_108215_ex2.video_followers(video_id, follower_username) VALUES ( 3, 'Vinnicius13');
INSERT INTO cbd_108215_ex2.video_followers(video_id, follower_username) VALUES ( 3, 'Flygon2003');
INSERT INTO cbd_108215_ex2.video_followers(video_id, follower_username) VALUES ( 3, 'Dayzer');
INSERT INTO cbd_108215_ex2.video_followers(video_id, follower_username) VALUES ( 4, 'OsPrimos');
INSERT INTO cbd_108215_ex2.video_followers(video_id, follower_username) VALUES ( 4, 'Wuant');
INSERT INTO cbd_108215_ex2.video_followers(video_id, follower_username) VALUES ( 5, 'RicFazeres');
INSERT INTO cbd_108215_ex2.video_followers(video_id, follower_username) VALUES ( 5, 'PTM');
INSERT INTO cbd_108215_ex2.video_followers(video_id, follower_username) VALUES ( 6, 'D4rkFrame');
INSERT INTO cbd_108215_ex2.video_followers(video_id, follower_username) VALUES ( 7, 'SirKazzio');
INSERT INTO cbd_108215_ex2.video_followers(video_id, follower_username) VALUES ( 8, 'Vinnicius13');
INSERT INTO cbd_108215_ex2.video_followers(video_id, follower_username) VALUES ( 8, 'Flygon2003');
INSERT INTO cbd_108215_ex2.video_followers(video_id, follower_username) VALUES ( 9, 'Dayzer');
INSERT INTO cbd_108215_ex2.video_followers(video_id, follower_username) VALUES ( 9, 'OsPrimos');
INSERT INTO cbd_108215_ex2.video_followers(video_id, follower_username) VALUES ( 9, 'Wuant');
INSERT INTO cbd_108215_ex2.video_followers(video_id, follower_username) VALUES ( 10, 'RicFazeres');
INSERT INTO cbd_108215_ex2.video_followers(video_id, follower_username) VALUES ( 10, 'PTM');
INSERT INTO cbd_108215_ex2.video_followers(video_id, follower_username) VALUES ( 11, 'D4rkFrame');
INSERT INTO cbd_108215_ex2.video_followers(video_id, follower_username) VALUES ( 11, 'SirKazzio');
INSERT INTO cbd_108215_ex2.video_followers(video_id, follower_username) VALUES ( 12, 'Vinnicius13');
INSERT INTO cbd_108215_ex2.video_followers(video_id, follower_username) VALUES ( 12, 'Flygon2003');
INSERT INTO cbd_108215_ex2.video_followers(video_id, follower_username) VALUES ( 8, 'Tiagovski');
INSERT INTO cbd_108215_ex2.video_followers(video_id, follower_username) VALUES ( 11, 'Tiagovski');


-- Insert video_events
INSERT INTO cbd_108215_ex2.video_events(video_id, event_timestamp, username, event_type, video_timestamp) VALUES ( 1, toTimestamp(now()), 'OsPrimos', 'PLAY', toTimestamp(now()));
INSERT INTO cbd_108215_ex2.video_events(video_id, event_timestamp, username, event_type, video_timestamp) VALUES ( 1, toTimestamp(now()), 'Wuant', 'PAUSE', toTimestamp(now()));
INSERT INTO cbd_108215_ex2.video_events(video_id, event_timestamp, username, event_type, video_timestamp) VALUES ( 1, toTimestamp(now()), 'RicFazeres', 'PLAY', toTimestamp(now()));
INSERT INTO cbd_108215_ex2.video_events(video_id, event_timestamp, username, event_type, video_timestamp) VALUES ( 1, toTimestamp(now()), 'PTM', 'PLAY', toTimestamp(now()));
INSERT INTO cbd_108215_ex2.video_events(video_id, event_timestamp, username, event_type, video_timestamp) VALUES ( 1, toTimestamp(now()), 'PTM', 'PAUSE', toTimestamp(now()));
INSERT INTO cbd_108215_ex2.video_events(video_id, event_timestamp, username, event_type, video_timestamp) VALUES ( 1, toTimestamp(now()), 'PTM', 'PLAY', toTimestamp(now()));
INSERT INTO cbd_108215_ex2.video_events(video_id, event_timestamp, username, event_type, video_timestamp) VALUES ( 1, toTimestamp(now()), 'PTM', 'PAUSE', toTimestamp(now()));
INSERT INTO cbd_108215_ex2.video_events(video_id, event_timestamp, username, event_type, video_timestamp) VALUES ( 1, toTimestamp(now()), 'PTM', 'STOP', toTimestamp(now()));
INSERT INTO cbd_108215_ex2.video_events(video_id, event_timestamp, username, event_type, video_timestamp) VALUES ( 1, toTimestamp(now()), 'D4rkFrame', 'STOP', toTimestamp(now()));
INSERT INTO cbd_108215_ex2.video_events(video_id, event_timestamp, username, event_type, video_timestamp) VALUES ( 2, toTimestamp(now()), 'PTM', 'PAUSE', toTimestamp(now()));
INSERT INTO cbd_108215_ex2.video_events(video_id, event_timestamp, username, event_type, video_timestamp) VALUES ( 2, toTimestamp(now()), 'D4rkFrame', 'PLAY', toTimestamp(now()));
INSERT INTO cbd_108215_ex2.video_events(video_id, event_timestamp, username, event_type, video_timestamp) VALUES ( 2, toTimestamp(now()), 'SirKazzio', 'PAUSE', toTimestamp(now()));
INSERT INTO cbd_108215_ex2.video_events(video_id, event_timestamp, username, event_type, video_timestamp) VALUES ( 3, toTimestamp(now()), 'Vinnicius13', 'PLAY', toTimestamp(now()));
INSERT INTO cbd_108215_ex2.video_events(video_id, event_timestamp, username, event_type, video_timestamp) VALUES ( 3, toTimestamp(now()), 'Flygon2003', 'STOP', toTimestamp(now()));
INSERT INTO cbd_108215_ex2.video_events(video_id, event_timestamp, username, event_type, video_timestamp) VALUES ( 3, toTimestamp(now()), 'Dayzer', 'PLAY', toTimestamp(now()));
INSERT INTO cbd_108215_ex2.video_events(video_id, event_timestamp, username, event_type, video_timestamp) VALUES ( 4, toTimestamp(now()), 'OsPrimos', 'PAUSE', toTimestamp(now()));
INSERT INTO cbd_108215_ex2.video_events(video_id, event_timestamp, username, event_type, video_timestamp) VALUES ( 4, toTimestamp(now()), 'Wuant', 'PLAY', toTimestamp(now()));
INSERT INTO cbd_108215_ex2.video_events(video_id, event_timestamp, username, event_type, video_timestamp) VALUES ( 5, toTimestamp(now()), 'RicFazeres', 'PAUSE', toTimestamp(now()));
INSERT INTO cbd_108215_ex2.video_events(video_id, event_timestamp, username, event_type, video_timestamp) VALUES ( 5, toTimestamp(now()), 'PTM', 'STOP', toTimestamp(now()));

-- Insert video_ratings
INSERT INTO cbd_108215_ex2.video_ratings(video_id, rating_id, rating_value) VALUES ( 1, 1, 5);
INSERT INTO cbd_108215_ex2.video_ratings(video_id, rating_id, rating_value) VALUES ( 1, 2, 4);
INSERT INTO cbd_108215_ex2.video_ratings(video_id, rating_id, rating_value) VALUES ( 1, 3, 3);
INSERT INTO cbd_108215_ex2.video_ratings(video_id, rating_id, rating_value) VALUES ( 1, 4, 2);
INSERT INTO cbd_108215_ex2.video_ratings(video_id, rating_id, rating_value) VALUES ( 1, 5, 1);
INSERT INTO cbd_108215_ex2.video_ratings(video_id, rating_id, rating_value) VALUES ( 2, 6, 5);
INSERT INTO cbd_108215_ex2.video_ratings(video_id, rating_id, rating_value) VALUES ( 2, 7, 4);
INSERT INTO cbd_108215_ex2.video_ratings(video_id, rating_id, rating_value) VALUES ( 2, 8, 3);
INSERT INTO cbd_108215_ex2.video_ratings(video_id, rating_id, rating_value) VALUES ( 2, 9, 2);
INSERT INTO cbd_108215_ex2.video_ratings(video_id, rating_id, rating_value) VALUES ( 2, 10, 1);
INSERT INTO cbd_108215_ex2.video_ratings(video_id, rating_id, rating_value) VALUES ( 3, 11, 5);
INSERT INTO cbd_108215_ex2.video_ratings(video_id, rating_id, rating_value) VALUES ( 3, 12, 4);
INSERT INTO cbd_108215_ex2.video_ratings(video_id, rating_id, rating_value) VALUES ( 3, 13, 3);
INSERT INTO cbd_108215_ex2.video_ratings(video_id, rating_id, rating_value) VALUES ( 3, 14, 2);
INSERT INTO cbd_108215_ex2.video_ratings(video_id, rating_id, rating_value) VALUES ( 3, 15, 1);
INSERT INTO cbd_108215_ex2.video_ratings(video_id, rating_id, rating_value) VALUES ( 4, 16, 5);
INSERT INTO cbd_108215_ex2.video_ratings(video_id, rating_id, rating_value) VALUES ( 4, 17, 4);
INSERT INTO cbd_108215_ex2.video_ratings(video_id, rating_id, rating_value) VALUES ( 4, 18, 3);


