# AgruparPlacas
Organizador de placas utilizando ponteiros em pascal.

#Documentação:

procedure leitura;
    Parametros: var p:String;
    Resultado: nenhum;
    Descrição: Responsável por pegar o valor que o usuário informar na tela.
    
procedure IniciaPlacas
    Parametros: var Fila:ptPlacas;
    Resultado: nenhum;
    Descrição: Inicia o ponteiro que vai armazenar as placas do sistema.

function IncluiPlaca
    Parametros: var fila:ptPlaca
                inf:Sring;
    Resultado: ptPlaca;
    Descrição: Aloca um espaço na memória e depois insere o valor da placa informada dentro deste 
    espaço. No final retorna o endereço que esta placa foi inserida.

function ExcluiPlaca
    Parametros: var fila:ptPlaca;
                inf:String;
    Resultado: Boolean;
    Descrição: Percorre todos os valores de uma determinada sequencia de placas, ao encontrar um 
    valor igual ao informado pelo usuário ele exclui este registro e refaz as ligações. 
    
function ListaPlacas
    Parametros: fila:ptPlaca
    Resultado: byte;
    Descrição:  Percorre toda a sequencia de placas informando seus respectivos valores. Ao chegar 
    no final retorna a quantidade de placas listadas.
    
function RetornaCodPlaca
    Parametros: placa:String;
    Resultado: String;
    Descrição: Retorna o código da placa informada. Exemplo, AAA-1234 -> AAA-[12]34 -> 12.
    
procedure IniciaElementos
    Parametros: var Fila:ptElemento;
    Resultado: nenhum;
    Descrição: Inicia o ponteiro que vai armazenar os elementos do sistema.

function IncluiElemento
    Parametros: var fila:ptElemento
                inf:Sring;
    Resultado: ptElemento;
    Descrição: Aloca um espaço na memória e depois insere o do código do elemento dentro deste espaço.
    No final retorna o endereço que este elemento foi inserido. Esta função segue uma lógica de 
    inserção sequencial, do menor para o maior, toda vez que um novo elemento é inserido ele ajusta 
    a estrutura para alocar ele na sua posição correta.   

function ExcluiElemento
    Parametros: var fila:ptElemento;
                inf:String;
    Resultado: Boolean;
    Descrição: Percorre todos os elementos, ao encontrar um valor igual ao informado ele exclui este
    registro e refaz as ligações.     
    
function ListaElementos
    Parametros: fila:ptPlaca
    Resultado: byte;
    Descrição:  Percorre toda a sequencia de elementos informando seus códigos e chamando a função 
    ListaPlacas para listar seu "sub-ponteiro" que esta armazenando as placas. Ao chegar no final 
    retorna a quantidade de elementos listados.
    
function RetornaElemento
    Parametros: codPlaca:String;
                element:ptElemento;
    Resultado: ptElemento;
    Descrição: Percorre toda a sequência de placas até achar o endereço referente ao código informado.
    No final define como resultado o endereço encontrado.
    
function IncluiPlacaElemento
    Parametros: pl:String;
                var element:ptlElemento
    Resultado: nenhum;
    Descrição: Insere a placa dentro de um elemento. Se o elemento não existir ele cria e depois 
    insere a placa dentro dele.
    
function ExcluiPlacaElemento
    Parametros: pl:String;
                var element:ptlElemento
    Resultado: nenhum;
    Descrição: Ele seleciona o elemento em que a placa pertence, depois de localizar o elemento, ele
    percorre as placas e deleta a placa correspondente. Se após remover a placa o elemento ficar 
    vazio, ele remove o elemento também.    
                
    
