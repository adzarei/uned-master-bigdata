from mrjob.job import MRJob 

import re 

# preparamos una expresion regular que recoja las palabras.  

WORD_RE = re.compile(r"[\w']+") 

class MRWordFreqCount(MRJob): 

    def mapper(self, _, line): 
       # Para cada palabra en la linea, emitimos un par <palabra, 1> 
        for word in WORD_RE.findall(line): 
            yield (word.lower(), 1) 

    # El combiner agrega los pares <palabra, 1> que se emitan en el mismo map. 
    def combiner(self, word, counts): 
        yield (word, sum(counts)) 

    #El reducer agrega los pares <palabra, X> que le llegan 
    def reducer(self, word, counts): 
        yield (word, sum(counts)) 

if __name__ == '__main__': 
     MRWordFreqCount.run() 
