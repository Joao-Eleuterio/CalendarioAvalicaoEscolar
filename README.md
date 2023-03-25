# Mini-Projeto de Computção Móvel
Enunciado: [Mini_Projeto_2022_23.docx.pdf](https://github.com/Joao-Eleuterio/CalendarioAvalicaoEscolar/files/11069444/Mini_Projeto_2022_23.docx.pdf)

Realizado por: João Eleutério a22007237

## **Screenshots dos ecrãs**

* Página DashBoard
<p>
<img src ="https://user-images.githubusercontent.com/79324505/223451466-c1020038-7840-47a9-b16f-2df63e0ed130.png">
</p>

* Página Lista
<p>
<img src ="https://user-images.githubusercontent.com/79324505/223532343-4be7e86c-1508-4c61-abb3-83554d39358b.png">
</p>

* Página Registo
<p>
<img src ="https://user-images.githubusercontent.com/79324505/223451607-c7a3bf16-ea1c-4c44-8630-920836826132.png">
</p>

* Página Consulta
<p>
<img src ="https://user-images.githubusercontent.com/79324505/223451629-9afa793c-064b-4f13-93b6-cb2a6382bf5f.png">
</p>

* Página Edita
<p>
<img src ="https://user-images.githubusercontent.com/79324505/223451664-e06eff6e-7b27-4dcf-a975-8b645f7652e4.png">
</p>


## **Identificar as funcionalidades**
<p>
<img src ="https://user-images.githubusercontent.com/79324505/222975306-48f19442-9c66-4894-8ec2-7b6f105b371c.png">
</p>

### **DashBoard**

Foram realizadas todas as funcionalidades do dashboard sendo elas:
```
* Nível médio de dificuldade das avaliações dos próximos 7 dias
* Nível médio de dificuldade das avaliações entre os 7 e os 14 dias (futuro)
```
<sup> Estas duas funcionalidades são demonstradas em gráficos circulares e como indica mostram a média de no nível de dificuldade das avaliações num certo intervalo. Tem um timer que refaz os gráficos de minuto a minuto.</sup>

Outra funcionalidade é:
```
* Lista com as avaliações dos próximos 7 dias (com os mesmos dados do ecrã anteriormente referenciados)
```
<sup> Esta funcionalidade é demonstrada em Cards mostrando as avaliações do dia de hoje até 7 dias que existam. Caso exista avaliações no dia irá aparecer um cartão em laranja e com um simbolo de numero 1, se for no dia seguinte irá aparecer em um cinzento azulado com um simbolo de numero 2 e os restantes dias serão apresentados a cinza claro com um simbolo de numero 3. Esta funcionalidade tem tambem que se hoje for sexta-feira as avaliações de sábado, domingo e segunda-feira sejam consideradas "dia seguinte". Tem um timer que refaz a lista de minuto a minuto. </sup>

### **Lista**
Foram realizadas todas as funcionalidades da listagem de avaliações sendo elas:
```
* Listar as avaliações
* Ir para a página de consulta da avaliação
```
<sup> Esta funcionalidade é demonstrada por Cards mostrando as avaliações existentes e nos Cards não aparece o campo das observações das avaliações. Quando se clica numa avaliação é nos levado para outra página que é a Consultar Avaliação. </sup>

Outra funcionalidade é:
```
* Swipe para eliminar
```
<sup> Nesta funcionalidade é realizada quando se dá swipe para a esquerda num Card da avaliação que deseja e elimina automaticamente mas somente eliminará as avaliações futuras sendo o utilizador informado com uma mensagem de sucesso ou erro. </sup>

### **Registo**
Foi realizada funcionalidade de registar avaliações sendo ela:
```
* Criar nova avaliação
```
<sup> Nesta funcionalidade foi usado vários widgets de formulario sendo eles: TextFormField (para nome de disciplina, nivel de dificuldade e para observações), DropdownButtonFormField (para tipo de avaliação) e DateTimeFormField (para a data). Neste formulário tambem existem restrições como ter que preencher obrigatóriamente todos os campos menos as observações, no nivel de dificuldade só pode colocar números de 1 a 5, na data só pode colocar datas futuras e nas observações só se pode escrever até 200 caracteres. Após preencher tem um botão de submit para criar a avaliação. </sup>

### **Consulta**
Foram realizadas todas as funcionalidades da listagem de avaliações sendo elas:
```
* Consultar os detalhes da avaliação
```
<sup> Nesta funcionalidade é mostrado os detalhes da avaliação anteriormente escolhida na lista de avaliações. Onde aqui já mostra todos os detalhes da avaliação(incluindo observações). </sup>

```
* Editar avaliação apresentada
* Eliminar avaliação apresentada
```
<sup> Nestas funcionalidades são dois botões que um deles elimina e volta para a página de listagem com uma mensagem (sucesso ou erro dependendo da data como explicado a cima) no outro irá aparecer uma mensagem de erro se for passada ou então irá para uma página que é a página de editar. </sup>

```
* Dealer 
```
<sup> Nesta funcionalidade o utilizador irá conseguir partilhar a avaliação anteriormente escolhida enviado assim um texto via mensagem, email,...  </sup>

### **Edita**
Foi realizada funcionalidade de registar avaliações sendo ela:
```
* Editar de avaliação
```
<sup> Nesta funcionalidade é possivel ver um formulário identico ao de criar avaliação só que os campos já estão pré preenchidos pelos detalhes da avaliação (é possível realizar isto com initialValue em cada widget após isso temos um botão de dar submit onde irá atualizar a avaliação ou então um botão de voltar onde iremos para a página da listagem. </sup>

### **Testes Unitários**
Foram realiazdos 10 testes unitários para testar a aplicação sendo um deles o teste do dealer que testa a mensagem que será enviada.

## **Funcionalidade “Dealer”** 
Esta funcionalidade foi implementada na página Colsulta, como dito anteriormente, foi utilizado um IconButton que onde tem o formato de Icons.share e está localizado na AppBar no canto superior direito da página(como representado na primeira figura abaixo). Após clicar irá aparecer um menu para escolher qual app quer enviar o texto (como representado na segunda figura abaixo) e quando enviada a mensagem por exemplo na app mensagens irá resultar num texto parecido ao da terceira figura abaixo.

<p>
<img src ="https://user-images.githubusercontent.com/79324505/223532606-795cec78-1df4-4342-9f17-9f6cf3a2a4de.png">
</p><p>
<img src ="https://user-images.githubusercontent.com/79324505/223530340-9480182f-ab05-48b3-ba71-083f105bc4b8.png">
</p>
<p>
<img src ="https://user-images.githubusercontent.com/79324505/223530896-ef2be710-2f4d-4871-b2ef-ea82bc2cd9ea.png">
</p>


## **Previsão de Nota**
>Nota: 19
