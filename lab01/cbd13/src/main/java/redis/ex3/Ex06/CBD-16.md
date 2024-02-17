1. **Jedis**: É uma biblioteca Java que fornece uma API para interagir com o Redis. Ela é usada para conectar e executar comandos no servidor Redis.

2. **loggedIn**: Uma variável booleana que controla se o utilizador está autenticado no sistema ou não.

3. **utilizador**: Armazena o nome de utilizador atualmente autenticado no sistema.

4. **separador**: Uma string usada para separar secções no menu de interação do utilizador.

5. **chaveUtilizadores**: Uma chave no Redis que armazena um conjunto (set) de todos os nomes de utilizador registados no sistema.

6. **chaveSeguidores**: Uma chave no Redis que armazena um conjunto (set) de seguidores para um utilizador específico. O nome da chave é gerado concatenando o nome do utilizador seguido de ":seguidores".

7. **chavePostsUtilizador**: Uma chave no Redis que armazena uma lista (list) de mensagens/posts de um utilizador específico. O nome da chave é gerado concatenando o nome do utilizador seguido de ":posts".

Aqui estão as principais operações realizadas no Redis com essas estruturas de dados:

- `jedis.sadd(chaveUtilizadores, utilizador)`: Adiciona o nome de utilizador ao conjunto de utilizadores registados.

- `jedis.sismember(chaveUtilizadores, usernameASeguir)`: Verifica se um utilizador está no conjunto de utilizadores registados.

- `jedis.sadd(chaveSeguidores, this.utilizador)`: Adiciona o nome do utilizador atual ao conjunto de seguidores de outro utilizador.

- `jedis.srem(chaveSeguidores, this.utilizador)`: Remove o nome do utilizador atual do conjunto de seguidores de outro utilizador.

- `jedis.smembers(chaveSeguidores)`: Retorna todos os seguidores de um utilizador como um conjunto.

- `jedis.rpush(chavePostsUtilizador, post)`: Adiciona um post à lista de posts de um utilizador.

- `jedis.lrange(chavePostsUtilizador, 0, -1)`: Retorna todos os posts de um utilizador como uma lista.

- `jedis.flushDB()`: Limpa a base de dados Redis, removendo todas as chaves e dados relacionados com o sistema de mensagens.


