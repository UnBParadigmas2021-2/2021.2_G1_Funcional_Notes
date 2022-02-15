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

### Comando Inicial 
![1-main](https://user-images.githubusercontent.com/88738347/153972395-3daedeba-4fd0-49f7-902c-4150a25bc2d9.png)

### Criar Nota
![2-create-note](https://user-images.githubusercontent.com/88738347/153972415-c1687813-7ec2-4671-9192-801b1f0b6ebf.png)

### Listar Notas
![3-list-notes](https://user-images.githubusercontent.com/88738347/153972696-b4237097-1405-4ba5-88e9-31a2296edbae.png)

### Listar Notas Por Etiqueta
![4-list-notes-by-tag](https://user-images.githubusercontent.com/88738347/153972702-f71a3400-bf59-4d7a-8e93-4620aa4ef9c1.png)

### Excluir Nota
![5-delete](https://user-images.githubusercontent.com/88738347/153972575-4aebe4e0-0f76-4892-a6c5-7d1e1cb4ce09.png)

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
O vídeo que contém a utilização do projeto está presente na seguinte pasta:
./videos/Utilizacao.mp4

## Vídeo
O vídeo que contém a apresentação está presente na seguinte pasta:
./videos/Apresentacao.mp4

## Fontes

* Livro - [Learn You a Haskell for Great Good!](http://learnyouahaskell.com/chapters)
