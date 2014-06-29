concatf s1 s2 = s1 ++ s2;
mixarray x y= x ++ y;
iff x = ((if(x>5) then  x + 6;
		else x/2) *2) + 1;
getElement arreglo i = arreglo !! i
sqa l b j e = take l [b,j..e]
listapar lista = [value | value<-lista,even value];
listaimpar lista = [value | value<-lista,odd value];
