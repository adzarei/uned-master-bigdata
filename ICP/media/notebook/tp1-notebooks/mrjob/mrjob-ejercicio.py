import sys, os, re
from mrjob.job import MRJob
from mrjob.step import MRStep

class MRContadorDeClientesBuenos(MRJob):

   # Realiza la ordenacion secundaria.
   MRJob.SORT_VALUES = True

   # Mapper encargado de separar los paises y datos de personas con simbolo A o B respectivamente
   # y filtrar los clientes buenos, ya que son los que nos interesan.
   def map_and_filter(self, _, line):
       splits = line.rstrip("\n").split(",")

       if len(splits) == 2: # datos de paises
           symbol = 'A' # ordenamos los paises antes que los datos de personas
           country2digit = splits[1]
           yield country2digit, [symbol, splits]
       else: #  datos de personas
           if splits[1].lower() == "bueno":
               symbol = 'B'
               country2digit = splits[2]
               yield country2digit, [symbol, splits]
               
   # Reducer encargado de hacer el join  entre pises y cliente y contar los clientes.
   # Devuelve el nombre del pais y '1' contabilizando 1 cliente bueno para ese pais.
   def reducer_join_clients_country(self, key, values):
       countries = [] # paises primero ya que llevan la clave 'A' 
       for value in values:
           if value[0] == 'A':
               countries.append(value)
           if value[0] == 'B':
               for country in countries:
                   countryName = country[1][0]
                   yield [countryName], 1
   
   # Reducer encargado sumar los '1's por pais.
   # Como cada reducer recibirá los valores (1) por clave, la operación sum() de python los suma y vuelve el total.
   def reducer_count_clients(self, country, counts):
       yield country, sum(counts)
       
   # Usamos steps() para definir el orden en el que se ejecutarán los mappers y reducers.    
   def steps(self):
       return [
           MRStep(
               mapper=self.map_and_filter,
               reducer=self.reducer_join_clients_country),
           MRStep(
               reducer=self.reducer_count_clients
           )
       ]
   
   
if __name__ == '__main__':
   MRContadorDeClientesBuenos.run()
