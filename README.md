# Projeto de Simulação de Empréstimo

Este projeto consiste em uma aplicação para simulação de empréstimos, com funcionalidades de login e simulação de empréstimo.

## Clonar o Repositório

Para clonar este repositório, execute o seguinte comando: git clone https://github.com/Matheus-o-alves/empresta_super_app.git

## Rodar o Projeto

### Requisitos

- Flutter SDK instalado
- Dispositivo Android/iOS ou Emulador

### Passos

1. Clone este repositório:

2. Navegue até o diretório do projeto:
        cd empresta_super_app

3. Instale as dependências:
        flutter pub get

4.  Execute o comando:
        flutter pub run build_runner build 

5. Execute o projeto:


## Funcionalidades

### Login

- Página de login onde o usuário pode autenticar-se fornecendo suas credenciais.
- Observação - No momento o aplicativo não está verificando as credencias, para fazer login basta preencher o campo de usuário e senha

### Simulação de Empréstimo

- Permite ao usuário simular um empréstimo, inserindo o valor desejado, selecionando instituições financeiras e convênios, e escolhendo o número de parcelas.

## Configuração do Host da API

Para o correto funcionamento do projeto, é necessário inserir o host da máquina onde está sendo executada a API local. Esta configuração deve ser feita nos arquivos dentro da pasta `data/usecases`. O projeto consome uma API local que pode ser encontrada em: [API Comparador](https://github.com/Matheus-o-alves/api_comparador).

Certifique-se de que o servidor da API esteja rodando para que o projeto funcione corretamente.

## Notas

- Certifique-se de configurar as rotas corretas para as requisições HTTP de acordo com a API fornecida.
- Este projeto é um exemplo básico e pode ser estendido com mais funcionalidades, como validações de entrada, feedbacks visuais, entre outros.
