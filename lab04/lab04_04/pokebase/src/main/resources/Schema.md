### Nós (Entidades)

1. **Pokémon**: Representa um Pokémon individual.
   - Propriedades: Nome, Peso, Altura, Geração, se é Lendário, etc.
2. **Tipo**: Representa um tipo de Pokémon (ex: Fogo, Água, Grama).
   - Propriedades: Nome do Tipo.
3. **Habilidade**: Representa uma habilidade que os Pokémon podem ter.
   - Propriedades: Nome da Habilidade.
4. **Geração**: Representa a geração a que um Pokémon pertence.
   - Propriedades: Número da Geração.
5. **Categoria (Lendário, etc.)**: Representa uma categoria especial de Pokémon, como Lendário.
   - Propriedades: Nome da Categoria.

### Relações

1. **É_DE_TIPO**: Liga um Pokémon ao seu Tipo.
   - Direção: Pokémon -> Tipo
2. **TEM_HABILIDADE**: Liga um Pokémon à sua Habilidade.
   - Direção: Pokémon -> Habilidade
3. **PERTENCE_A_GERAÇÃO**: Liga um Pokémon à sua Geração.
   - Direção: Pokémon -> Geração
4. **É_CATEGORIA**: Liga um Pokémon à sua Categoria especial (se aplicável).
   - Direção: Pokémon -> Categoria
5. **EVOLUI_PARA**: Liga um Pokémon à sua forma evoluída.
   - Direção: Pokémon -> Pokémon
6. **EFICAZ_CONTRA**: Liga um Tipo a outro Tipo que é fraco contra ele.
   - Direção: Tipo -> Tipo
7. **FRACO_CONTRA**: Liga um Pokémon a tipos contra os quais é fraco.
   - Direção: Pokémon -> Tipo
8. **RESISTENTE_A**: Liga um Pokémon a tipos contra os quais é resistente.
   - Direção: Pokémon -> Tipo

### Exemplo de Esquema Visual

```cypher
(Pokémon) -[É_DE_TIPO]-> (Tipo)
(Pokémon) -[TEM_HABILIDADE]-> (Habilidade)
(Pokémon) -[PERTENCE_A_GERAÇÃO]-> (Geração)
(Pokémon) -[É_CATEGORIA]-> (Categoria)
(Pokémon) -[EVOLUI_PARA]-> (Pokémon)
(Pokémon) -[FRACO_CONTRA]-> (Tipo)
(Pokémon) -[RESISTENTE_A]-> (Tipo)
(Tipo) -[EFICAZ_CONTRA]-> (Tipo)
```
