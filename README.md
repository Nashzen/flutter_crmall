# teste_flutter_crmall

Teste feito utilizando a [API de desenvolvedores da Marvel](https://developer.marvel.com)

## Considerações

Utilizei o [Pacote GetX](https://pub.dev/packages/get) como gerenciador de estado e rotas da aplicação, e para fazer as requisições HTTP, utilizei o [Pacote Http.dart](https://pub.dev/packages/http). 

OBS: A versão utilizada para desenvolver o projeto foi a BETA 1.26.0-17.8.pre.
OBS²: Como a API está toda documentada em inglês, preferi desenvolver todas as telas em inglês também.

## Demonstração do projeto

A aplicação consiste em uma listagem das HQs disponíveis na API da Marvel, a aplicação consiste em:

Uma tela de login (não possui autenticação, qualquer usuário consegue acessar)
![](/screenshots/login.png)

A tela principal do aplicativo, mostrando todas as HQs disponíveis
![](/screenshots/lista_quadrinhos.png)

Os detalhes do quadrinho selecionado, com o botão para adicioná-lo ao seu carrinho de compras
![](/screenshots/detalhes_quadrinho.png)

O carrinho de compras, com a lista de todos os pedidos adicionados
![](/screenshots/carrinho_compras.png)

E o checkout, pedindo as informações do seu cartão de crédito para conclusão da compra (não há nenhuma validação)
![](/screenshots/acheckout.png)




