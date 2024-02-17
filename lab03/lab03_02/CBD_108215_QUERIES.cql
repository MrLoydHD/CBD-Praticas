use cbd_108215_ex2;
-- Ex 2 b)

-- 7. Permitir a pesquisa de todos os vídeos de determinado autor;
SELECT * FROM videos_by_author;

-- 8. Permitir a pesquisa de comentários por utilizador, ordenado inversamente pela data;
SELECT * FROM comments_by_user;

-- 9. Permitir a pesquisa de comentários por vídeos, ordenado inversamente pela data;
SELECT * FROM comments_by_video;

-- 10. Permitir a pesquisa do rating médio de um vídeo e quantas vezes foi votado;
SELECT avg(rating_value) FROM video_ratings WHERE video_id = 1;

-- Ex 2 d)

-- 1. Os últimos 3 comentários introduzidos para um vídeo

SELECT * FROM comments_by_video WHERE video_id = 1 LIMIT 3; -- Esta consulta é viável, desde que comment_timestamp esteja em ordem decrescente.

-- 2. Lista das tags de determinado vídeo
SELECT tags FROM videos WHERE video_id = 2; -- Esta consulta é viável, desde que tags esteja indexado.

-- 3. Todos os vídeos com a tag "Aveiro"

-- without allow filtering, this query will fail because the tags column are not part of the primary key and the query is not filtering by the primary key

SELECT * FROM videos WHERE tags CONTAINS 'Aveiro' ALLOW FILTERING;

-- 4. Os últimos 5 eventos de determinado vídeo realizados por um utilizador

SELECT * FROM video_events WHERE video_id = 1 AND username = 'PTM' LIMIT 5;

-- 5. Vídeos partilhados por determinado utilizador num determinado período de tempo

SELECT * FROM videos_by_author WHERE author_username = 'Tiagovski' AND upload_timestamp > '2019-01-01' AND upload_timestamp < '2024-01-01';

-- 6. Os últimos 10 vídeos, ordenado inversamente pela data da partilhada

SELECT * FROM videos_by_upload_date LIMIT 10; --Needed to create a new table with the same data (plus upload_date) as videos_by_author but with a different primary key (upload_timestamp)
                                              -- or manipulate the data in the application layer to get the same result

-- 7. Todos os seguidores (followers) de determinado vídeo

SELECT follower_username FROM video_followers WHERE video_id = 1;

-- 8. Todos os comentários (dos vídeos) que determinado utilizador está a seguir (following)

SELECT * FROM user_following_comments WHERE username = 'OsPrimos'; --Era necessário criar uma nova tabela, caso contrário seria impossível consultar essas informações com apenas uma consulta.
-- Eu também posso fazer mais consultas para obter os comentários dos vídeos que o utilizador está seguindo, mas só obtenho os resultados do lado do cliente.

-- 9. Os 5 vídeos com maior rating

SELECT * FROM video_ratings LIMIT 5;
-- O resultado desta consulta não é o esperado porque para isso eu precisaria criar uma nova tabela ou usar múltiplas consultas com lógica de aplicação.

-- 10. Uma query que retorne todos os vídeos e que mostre claramente a forma pela qual estão ordenados

SELECT * FROM videos;

-- 11. Lista com as Tags existentes e o número de vídeos catalogados com cada uma delas

SELECT tags, count(*) FROM videos GROUP BY tags ALLOW FILTERING; --Esta consulta não é viavel pois tags ão fazem parte da chave primária sendo necessário usar allow filtering para que a mesma seja possivel

-- 12. Quantidade de comentários por vídeo

SELECT video_id, COUNT(*) FROM comments_by_video GROUP BY video_id;

-- 13. Rating máximo e mínimo de cada vídeo

SELECT video_id, MAX(rating_value), MIN(rating_value) FROM video_ratings GROUP BY video_id;


