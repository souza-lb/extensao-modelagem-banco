<h1 align=center>Projeto de Extensão Modelagem Banco de Dados Para Negócio</h1>

<b>Ambiente de desenvolvimento básico do projeto com a utilização do PgAdmin4 v8.4  e PostgreSQL v16.2</b>

Este repositório fornece:

* docker-compose-yml: Define as configurações básicas dos contêineres tais como portas
usadas, versões e volumes de persistência.

* banco.sql: Cria as tabelas do banco de dados.

* var_amb.env: Define as variáveis de ambiente dos 2 contêineres, senhas, usuários etc.

* dockerfile: Altera os locales da imagem usada no Postgresql

* README.md: Estas instruções que você encontra abaixo.

Para criar o ambiente você vai precisar basicamente de:

* git
* docker
* docker-compose

Sistema Operacional Utilizado:  GNU/Linux Debian 12.

para instalação dos pacotes básicos 
execute no terminal:

```bash
$ sudo apt install git docker.io docker-compose
```

Com o git instalado basta clonar este repositório com:

```bash
git clone https://github.com/souza-lb/estudo-pgadmin-postgresql.git
```

Dentro da pasta do repositório que acabou de clonar execute:

```bash
sudo docker-compose build
```

Isso vai damorar um pouco na primera vez pois vai baixar as imagens para o repositório local.

após finalizar rode para subir os contêineres:

```bash
$ sudo docker-compose up
```

Você também pode rodar o comando acima com o parâmetro -d como resultado seu terminal fica livre

```bash
$ sudo docker-compose up -d
```

Para interromper todos os contêineres rodando use:

```bash
$ sudo docker stop $(sudo docker ps -aq)
```

Não feche a janela do terminal apenas minimize. 
Em seguida abra o navegador e acesse: localhost:80.
Se você seguiu todos os passos até aqui você terá a tela de login do PgAdmin4 no seu navegador e seu banco rodando.

Agora falta configurar os dados de login do PgAdmin

Lembrando que para logar na tela inicial do pgadmin você usa os dados abaixo:

``
Username/Email Adress: admin@admin.com
senha: postgres
``

Apos iniciar use a opção adicionar novo servidor e use os dados abaixo:

<b>Na aba General:</b>

``nome: postgres``

<b>Na aba Conexão:</b>

``host: postgresql-16.2``

``port: 5432``

``maintenance database: postgres``

``username: postgres``

``senha: postgres``

<b>Marque se quiser a opção salvar senha.</b>

<b>Clique em salvar.</b>

<b>Pronto se tudo deu certo você está com o PgAdmin4 e PostgreSQL rodando em contêineres
que você pode pausar com facilidade e não consumir recursos da sua maquina quando 
não estão em uso.</b>

Para interromper os dois contêineres basta fechar a janela do terminal que você rodou
o comando "sudo docker-compose up"

Elementos relevantes que você deve levar em consideração:

Aqui eu não abordei profundamente o uso docker. Tentei ser o mais sintêtico possível.
Uma pessoa que não tenha um conhecimento muito consolidado de docker, mesmo assim, consegue
ter ao final um ambiente para estudo funcional.

Usar o docker dá uma certo trabalho inicial que compensa. Muita gente vem do ambiente windows e
não está muito familiarizado com o uso do terminal para tarefas (Acredite é bem mais rápido executar 
algumas tarefas repetitivas pelo terminal.

Você ao usar conteiner tem umas vantagens como:

Padronização de ambiente: Facilita a reprodução do ambiente de desenvolvimento em diferentes
máquinas com facilidade e diminuido a perda de tempo com configurações manuais

Independência do sistema: Independente do sistema utilizado a replicação do ambiente original é facilitada
e automatizada.

Aprendizado de novas ferramentas: Durante esse processo serão utilizadas ferramentas como git e docker sem
custos extras na aquisição de licenças.

<b>Para retornar o Docker para sua configuração inicial execute os comandos abaixo (Atenção não execute em produção!)</b>

Rode cada um dos comandos abaixo no terminal:

```bash
$ sudo docker container prune
```
<b>( apaga todos os contêineres)</b>

```bash
$ sudo docker volume prune
```
<b>( apaga todos os volumes)</b>

```bash
$ sudo docker network prune
```
<b>( apaga todas as redes virtuais)</b>


<b>Apague a pasta que você rodou o git clone


Faça a clonagem do repositório mais uma vez

Rode novamente</b>

```bash
$ sudo docker-compose build
```

```bash
$ sudo docker-compose up -d
```

<b>Pronto o docker retornou para a configuração original.</b>


Atenção foi adicionado o sudo ao inicio de cada comando neste ambiente não foi utilizada conta de administrador. Se você não usa sudo ou adicionou seu usuário ao grupo docker não precisa adicionar o sudo antes de cada comando. Mas leve em consideração a orientação em: https://wiki.debian.org/Docker
Para minimizar o consumo de recursos quando fora de uso e evitar o reinicio automatico dos contêineres
no reboot da máquina, o arquivo docker-compose.yml foi alterado para "restart: on-failure", se você acha conveniente
os contêineres já carregarem após o reboot pode optar por manter a opção "restart: aways" como anteriormente.

![Tela pgadmin3](/tela_pgadmin4.png)

PgAdmin4 Rodando Localmente.

![Tela docker](/tela_docker.png)

Docker container rodando localmente.

Este tutorial foi elaborado por <b>Leonardo Bruno</b><p>
<br>202301011744@alunos.estacio.br</br>
<b>souzalb@proton.me</b>

