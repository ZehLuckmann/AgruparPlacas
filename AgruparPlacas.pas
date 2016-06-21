Program Trabalho ;
                
uses crt;

type ptPlaca = ^placa;   
     placa = record     
         dado: String;    
         prox: ptPlaca;       
     end;                   

		ptElemento = ^elemento;   
    elemento = record     
         dado: String;
				 placas : ptPlaca;     
         prox:ptElemento;
				 ant:ptElemento;       
     end;
		 
		 
var ElementoInicio: ptElemento;
		Placas: ptPlaca;
		p : String;
		op : Integer;  

Procedure leitura(var p : String);
begin                               
    clrscr;                         
    WRITE ('Digite a placa: ');      
    readln (p);                   
end;                                                                    

//FUNÇÔES PARA O REGISTRO DAS PLACAS
Procedure IniciaPlacas(Var fila:ptPlaca);
Begin                                
   fila:=nil;                        
End;                      

Function IncluiPlaca(Var fila:ptPlaca;inf:String): ptPlaca;
var aux,ant,aux2:ptPlaca;                            
Begin                                               
	new(aux);                                        
	if aux=nil then 
	begin                            
		gotoxy (5,20);                                
		write ('Memoria cheia');                      
		readkey;                                      
		IncluiPlaca:=nil;                         
	end                                              
	else                                             
	Begin                                         
		
		aux2:=fila;                                
		ant:=fila;                                 
		
		while (aux2^.prox <> nil) do 
		begin         
			ant:=aux2;                             
			aux2:=aux2^.prox;                      
		end;                                       		
		
		if (fila=nil) then 
		begin                                   
			aux^.dado:=inf;	
			aux^.prox:=fila;	
			fila:=aux;      	
		end                
		else                
		begin 
			aux^.dado:=inf;           
			aux^.prox:=nil;           
			aux2^.prox:=aux;          
		end;          
		                
		IncluiPlaca:=aux;		
	End;                               
End;

function ExcluiPlaca (Var fila:ptPlaca;inf:String) : boolean;
var aux,ant:ptPlaca;
Begin
	ExcluiPlaca := True;
	if fila=nil then begin
		ExcluiPlaca := False;
		Writeln('Não existem registros');
		readkey;
  end
  else if fila^.dado = inf then
  begin	 
	 aux := fila^.prox;	 
	 fila := aux;
  end
  else
  Begin
		ant := fila;
		aux := fila;
		
		while (inf <> aux^.dado) and (aux^.prox <> nil) do 
		begin
		  ant := aux;
		  aux := aux^.prox;
		end;    
		
		if (aux^.dado = inf)  then			
			ant^.prox := aux^.prox
		else if (aux^.prox = nil)  then
		begin
			ExcluiPlaca := False;
			Writeln('Placa não encontrada!');
			readkey;
		end;
		   		
		dispose(aux);	
	End;      	      
End;

Function ListaPlacas (fila:ptPlaca):byte;
var aux: ptPlaca;
i:byte;
Begin
	if fila=nil then
		i:=0
	else
	Begin
		i:=0;
		aux:=fila;
		while aux <> nil do
		begin
			i:=i+1;
			writeln('-----',i,' - ',aux^.dado);
			aux:=aux^.prox;
		end;
	End;
	ListaPlacas:=i
End;

Function RetornaCodPlaca(placa : String) : String;
begin
	RetornaCodPlaca := placa[5] + placa[6];               
end;

//FUNÇÔES PARA O REGISTRO DOS ElementoInicio
Procedure IniciaElementoInicio(Var fila:ptElemento);
Begin                                
   fila:=nil;                        
End;                      

Function IncluiElemento(Var fila:ptElemento;inf:String) : ptElemento;
var aux,ant,aux2:ptElemento;                            
Begin                                               
	new(aux);                                        
	if aux=nil then 
	begin                            
		gotoxy (5,20);                                
		write ('Memoria cheia');                      
		readkey;                                      		
	end                                              
	else                                             
	Begin                                         
		if (fila=nil) then 
		begin     
			aux^.dado:=inf;   
			aux^.prox:=fila;	
			fila:=aux;      	
		end                
		else if inf < fila^.dado then		
		begin
			aux^.dado:=inf;   
			aux^.prox:=fila;           
			fila:=aux;          
		end
		else                
		begin			
			ant:=fila; 
			aux2:=fila;                                 
				
			while (inf > aux2^.dado) and (aux2 <> nil) do 
			begin
	      ant := aux2;
	      aux2 := aux2^.prox;
	    end;    
		  
			aux^.dado:=inf;   
		  aux^.prox := aux2;	    
			ant^.prox := aux;	    
		end;          
	End;                               
	
	IncluiElemento := aux;
End;

function ExcluiElemento (Var fila:ptElemento;inf:String) : boolean;
var aux,ant:ptElemento;
Begin
	ExcluiElemento := True;
	if fila=nil then begin
		ExcluiElemento := False;
		Writeln('Não existem registros');
		readkey;
  end
  else if fila^.dado = inf then
  begin	 
	 aux := fila^.prox;	 
	 fila := aux;
  end
  else
  Begin
		ant := fila;
		aux := fila;
		
		while (inf <> aux^.dado) and (aux^.prox <> nil) do 
		begin
		  ant := aux;
		  aux := aux^.prox;
		end;    
		
		if (aux^.dado = inf)  then			
			ant^.prox := aux^.prox
		else if (aux^.prox = nil)  then
		begin
			ExcluiElemento := False;
			Writeln('Elemento não encontrado!');
			readkey;
		end;
		   		
		dispose(aux);	
	End;      	      
End;

Function ListaElementoInicio (fila:ptElemento):byte;
var aux: ptElemento;
i:byte;
Begin
	if fila=nil then
		i:=0
	else
	Begin
		i:=0;
		aux:=fila;
		while aux <> nil do
		begin
			i:=i+1;
			writeln(i,' - ',aux^.dado);
			writeln (ListaPlacas(aux^.placas),' placas');			
			writeln('');
			aux:=aux^.prox;
		end;
	End;
	ListaElementoInicio:=i
End;

Function RetornaElemento(codPlaca : String; element : ptElemento) : ptElemento;
var aux, resultado: ptElemento;
Begin
	if element=nil then
		resultado := nil
	else
	Begin
		aux:=element;
		while aux <> nil do
		begin
			if aux^.dado = codPlaca then
				resultado := aux;
			
			aux:=aux^.prox;
		end;
	End;        	
	RetornaElemento:=resultado;
End;

//
procedure IncluiPlacaElemento(pl : String; var element : ptElemento);
var el : ptElemento;
		codPlaca : String;
begin
	codPlaca := RetornaCodPlaca(pl);	
	el := RetornaElemento(codPlaca, element);	
	if el <> nil then
		IncluiPlaca(el^.placas, pl)
	else
	begin
		el := IncluiElemento(element, codPlaca);		
		IncluiPlaca(el^.placas, pl);
	end;			
end;

procedure ExcluiPlacaElemento(pl : String; var element : ptElemento);
var el : ptElemento;
		codPlaca : String;
begin
	codPlaca := RetornaCodPlaca(pl);
	el := RetornaElemento(codPlaca, element);
	
	if ExcluiPlaca(el^.placas, pl) then		
	begin
		if el^.placas = nil then
			ExcluiElemento(element, codPlaca);
			
		Writeln('Placa removida!');
		readkey;		
	end;
end;

//MAIN    
Begin
  
IniciaElementoInicio(ElementoInicio);

op := -1;

while op <> 0 do
begin
 clrscr;
 writeln ('0-Sair');
 writeln ('1-Incluir');
 writeln ('2-Remover');
 writeln ('3-Contar Elementos');
 readln (op);
 writeln;
 case op of
    1: begin
         leitura(p);
				 IncluiPlacaElemento(p, ElementoInicio);	                 
       end;
    2: begin
        leitura(p);
				ExcluiPlacaElemento(p, ElementoInicio);
       end;
    3: begin     
         writeln (ListaElementoInicio(ElementoInicio),' Elementos');         
         readkey;
       end;
 end;
end;
  
End.