clear
clc

finish=7;
kontrol=1;

while kontrol~=finish
    
    kontrol=menu('Wizualizacji zbieżności', 'Podaj przedział [a,b]', 'Podaj przedział [c,d]', 'Podaj liczby punktów [n,m]', 'Podaj wektor współczynników ak', 'Podaj krotność n wielomianu Wn(x)', 'Wizualizuj zbieżność', 'FINISH');
    
    switch kontrol
        case 1
            ab = input('Podaj przedział jako wektor [a,b]');
        
        case 2
            cd = input('Podaj przedział jako wektor [c,d]');
            
        case 3
            nm = input('Podaj liczby punktów jako wektor [n,m]');
        case 4
            ak = input('Podaj wektor współczynników ak');
            
        case 5
            n = input('Podaj krotność wielomianu n:');
                        
        case 6
            %Check if polynomial is correct
            if length(ak)-n ~= 1
                disp("Błąd w długości wektora ak i rozmiarze wielomianu n")
                break
            end
            a = ab(1);
            b = ab(2);
            c = cd(1);
            d = cd(2);
            
            [fa, fad] = hermit(a, ak, n);
            [fb, fbd] = hermit(b, ak, n);
                        
            x = linspace(a, b, nm(1));
            y = linspace(c, d, nm(2));
            
            A = zeros(nm(1), nm(2));
            
            for i = 1:length(x)
                for j = 1:length(y)
                    x0 = x(i) + 1i*y(j);
                    [k, r] = newton(a, b, x0, ak, n);
                    A(i,j) = k;
                end
            end
            
            imagesc(A)
        case 7
            break
    end
end