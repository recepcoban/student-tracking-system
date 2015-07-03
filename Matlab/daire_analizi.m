function sonuc=daire_analizi(r,x,y)
    sonuc=0;
    n=0;
    for j=y:y+11
        for i=x:x+11
            if r(j,i) <= 80
                n=n+1;
            end
        end
        if n >= 90
            sonuc=1;
        end     
    end
end