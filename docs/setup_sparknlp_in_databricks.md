# How To Set-Up Spark NLP in Databricks

## 1. Install the necessary libraries in your cluster

Go to Compute -> Your Cluster -> Libraries -> Install new -> Add sparknlp python package and sparknlp maven coordinates

*If you'd like to do speech-to-text, you can add the librosa python package as well.*

## 2. Test your install in a notebook with the given code and your cluster

```
from sparknlp.base import Pipeline, DocumentAssembler
from sparknlp.annotator import Tokenizer, XlmRoBertaForTokenClassification, NerConverter
import pyspark.sql.functions as F

documentAssembler = DocumentAssembler() \
    .setInputCol("text") \
    .setOutputCol("document")

tokenizer = Tokenizer() \
    .setInputCols("document") \
    .setOutputCol("token")

token_classifier = XlmRoBertaForTokenClassification.pretrained("xlmroberta_ner_base_finetuned_ner_wolof","wo") \
    .setInputCols(["document", "token"]) \
    .setOutputCol("ner")

ner_converter = NerConverter()\
    .setInputCols(["document", "token", "ner"])\
    .setOutputCol("ner_chunk")

pipeline = Pipeline(stages=[documentAssembler, tokenizer, token_classifier, ner_converter])

data = spark.createDataFrame([["I like cheese when it's in the fridge."]]).toDF("text")

result = pipeline.fit(data).transform(data)
```
*The original code can be found in the Spark NLP docs [here](https://sparknlp.org/demo).*
