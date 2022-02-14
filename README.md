# Notes
**Disciplina**: FGA0210 - PARADIGMAS DE PROGRAMAÇÃO - T01 <br>
**Nro do Grupo**: 01<br>
**Paradigma**: Funcional<br>

## Alunos
|Matrícula | Aluno |
| -- | -- |
| 18/0138596  | Tomás Veloso Peixoto Matutino  | 
| 18/0100840  | Gabriel Azevedo Batalha        |
| 18/0054082  | Marcelo Victor de Sousa Silva  |
| 17/0115208  | Victor Levi Peixoto            | 
| 17/0013812  | João Matheus de Sousa Rodrigues| 
| 16/0049733  | Felipe Borges de Souza Chaves  | 
| 15/0058462  | Davi Antônio da Silva Santos   | 

## Sobre 
Este programa é um utilitário escrito em haskell para 
salvar notas rápidas usando a linha de comando.

## Screenshots
Adicione 2 ou mais screenshots do projeto em termos de interface e/ou funcionamento.

## Instalação 
**Linguagens**: Haskell<br>
**Tecnologias**: GHC, Docker<br>

### Utilizando docker(recomendado)

Para facilitar testes o sistema tem um container docker, primeiramente tenha 
instalado o [docker](https://docs.docker.com/engine/install/) e [docker-compose](https://docs.docker.com/compose/install/).

Após a instalação de ambos utilize o comando abaixo para entrar no ambiente.

```bash
    docker-compose run notes
```

Compile o código utilizando o seguinte comando

```bash
    ghc --make Main.hs
```

Após isso pode testar o executável com o nome de Main.

### Utilizando GHC

Caso já tenha uma instalação do GHC o binário pode ser gerado apeans com 

```bash
    ghc --make Main.hs
```

Todos os componentes utilizados neste projeto são *standard* do Haskell, porém,
dependendo do empacotamento realizado pode acontecer de não existir algumas referências 
em sua instalação. Caso tenha algum problema por favor tente utilizar o docker.


## Uso 
Explique como usar seu projeto, caso haja algum passo a passo após o comando de execução.

## Vídeo
Adicione 1 ou mais vídeos com a execução do projeto.

## Fontes

* Livro - [Learn You a Haskell for Great Good!](http://learnyouahaskell.com/chapters)
