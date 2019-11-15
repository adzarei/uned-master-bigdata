import sys, os, re
from mrjob.job import MRJob
from mrjob.step import MRStep

class MRPaisMaxClientesBuenos(MRJob):

   # Realiza la ordenacion secundaria
   MRJob.SORT_VALUES = True

   # Igual que en el ejercicio 1.1
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
               
   # Igual que en el ejercicio 1.1            
   def reducer_join_clients_country(self, key, values):
       countries = [] # paises primero ya que llevan la clave 'A'
       for value in values:
           if value[0] == 'A':
               countries.append(value)
           if value[0] == 'B':
               for country in countries:
                   countryName = country[1][0]
                   yield [countryName], 1
   
   # Este reducer se encarga de devolver cada pais y la suma de clientes buenos que tiene.
   # Cabe destacar que, como queremos que el resultado de este reducer se trabaje en el mismo reducer, tenemos que
   # usar una misma key en el yield. Como no nos importa que key usar, utilizamos 'None'.
   # Devolvemos una tupla (Nº total de clientes buenos, pais).
   def reducer_count_clients(self, country, counts):
       yield None, (sum(counts), country)
   
   
   # Este reducer se encarga de devolver el número máximo de clientes buenos y el pais.
   # Aplica la función max de python sobre la lista de tuplas y devuelve la tupla con mas clientes buenos.
   # Nota: Sólo devuelve 1 en caso de estar empatados.
   def reducer_max_clients_bueno(self, _, country_pair):
       yield max(country_pair)
       
       
   # Usamos steps para definir el orden de los mappers y reducers.
   def steps(self):
       return [
           MRStep(
               mapper=self.map_and_filter,
               reducer=self.reducer_join_clients_country),
           MRStep(
               reducer=self.reducer_count_clients
           ),
           MRStep(
               reducer=self.reducer_max_clients_bueno
           )
       ]
   
   
if __name__ == '__main__':
   MRPaisMaxClientesBuenos.run()
