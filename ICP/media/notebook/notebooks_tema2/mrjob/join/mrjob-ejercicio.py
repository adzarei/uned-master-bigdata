import sys, os, re
from mrjob.job import MRJob

class MRJoin(MRJob):

  # Realiza la ordenacion secundaria
  SORT_VALUES = True

  def mapper(self, _, line):
    splits = line.rstrip("\n").split(",")

    if len(splits) == 2: # datos de paises
      symbol = 'A' # ordenamos los paises antes que los datos de personas
      country2digit = splits[1]
      yield country2digit, [symbol, splits]
    else: #  datos de personas
      symbol = 'B'
      country2digit = splits[2]
      yield country2digit, [symbol, splits]

  def reducer(self, key, values):
    countries = [] # paises primero ya que llevan la clave 'A'
    for value in values:
      if value[0] == 'A':
        countries.append(value)
      if value[0] == 'B':
        for country in countries:
          yield key, country[1:] + value[1:]

if __name__ == '__main__':
    MRJoin.run()
