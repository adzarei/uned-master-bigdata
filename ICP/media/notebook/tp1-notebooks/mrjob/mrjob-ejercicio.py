import sys, os, re
from mrjob.job import MRJob
from mrjob.step import MRStep

class MRContadorDeClientesBuenos(MRJob):

   # Realiza la ordenacion secundaria
   MRJob.SORT_VALUES = True
   #MRJob.SORT_KEYS = True

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
               
   def reducer_join_clients_country(self, key, values):
       countries = [] # paises primero ya que llevan la clave 'A'
       for value in values:
           if value[0] == 'A':
               countries.append(value)
           if value[0] == 'B':
               for country in countries:
                   countryName = country[1][0]
                   yield [countryName], 1
                   
   def reducer_count_clients(self, country, counts):
       yield country, sum(counts)
       
       
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
