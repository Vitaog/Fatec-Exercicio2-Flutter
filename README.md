# Aplicativo Flutter - Consumo de API e Exibição em ListView

## Descrição

Este projeto é um aplicativo em Flutter que consome informações de usuários de um endpoint público e exibe esses dados em uma **ListView**. Cada item da lista alterna entre duas cores de fundo (verde-claro e azul-claro) para melhorar a legibilidade. Além disso, informações como **Cidade**, **Email**, **Nome de Usuário** e **Empresa** são destacadas com títulos em negrito para uma melhor organização visual.

## Funcionalidades

- Consumo de dados via HTTP a partir de um endpoint.
- Exibição das informações em um formato de lista organizada.
- Alternância de cores de fundo para melhorar a visualização.
- Títulos em negrito para facilitar a identificação das informações.

## Tecnologias Utilizadas

- **Flutter**: Framework para o desenvolvimento do aplicativo.
- **Dart**: Linguagem de programação utilizada.
- **HTTP**: Para realizar requisições à API.

## Instruções de Execução

1. **Clone o Repositório**:
   ```bash
   git clone https://github.com/seu-usuario/seu-repositorio.git

2. **Instale as Dependências: No diretório raiz do projeto, execute:**
   ```bash
   flutter pub get
3. **Execute o Aplicativo: Conecte um dispositivo ou emulador e execute:**
   ```bash
   flutter run
## Endpoints Utilizados
O aplicativo consome informações da API pública:

https://jsonplaceholder.typicode.com/users

## Organização do Código
O método fetchUsers() faz a requisição HTTP para obter os dados da API.
A ListView alterna as cores de fundo entre verde-claro e azul-claro com base na posição do item (pares e ímpares).
Informações importantes, como Nome, Cidade, Telefone, e Empresa são exibidas com títulos em negrito.
