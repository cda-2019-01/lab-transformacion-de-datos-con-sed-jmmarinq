#Agregar 0 a los dias y meses de un solo digito
sed 's/\([0-9]\)\/\([0-9]\)\//0\1\/0\2\//' data.csv > data2.csv
#Reemplazar los / por -
sed 's/\//-/g' data2.csv > data3.csv
#Agregar el 20 a los años
sed 's/-\([0-9][0-9]\);/-20\1;/' data3.csv > data4.csv
#Transformar fecha de YYYY/MM/DD a DD/MM/AA
sed 's/\([0-9][0-9]\)-\([0-9][0-9]\)-\([0-9][0-9][0-9][0-9]\);/\3-\2-\1;/' data4.csv > data5.csv
#Reemplazar minusculas por mayusculas
tr '[:lower:]' '[:upper:]' < data5.csv > data6.csv
#Reemplazar /;N por ;\N
sed 's/;N/;\\N/g' data6.csv > data7.csv
#Reemplazar ;; por ;\N;
sed 's/;;/;\\N;/g' data7.csv > data8.csv
#Poner al final \N despues del ;
sed 's/;\r$/;\\N/g' data8.csv > data9.csv
#Cambiar ; por ,
sed 's/;/,/g' data9.csv > data10.csv
#Cambiar los decimales por .
sed 's/,\([0-9][0-9][0-9]\),\([0-9]\)/,\1.\2/' data10.csv > data11.csv
#Agregar Blank line
#sed -i -e '$a\ ' data11.csv
#Remover archivos transititorios
rm data2.csv
rm data3.csv
rm data4.csv
rm data5.csv
rm data6.csv
rm data7.csv
rm data8.csv
rm data9.csv
rm data10.csv

