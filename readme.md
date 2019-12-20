# Elasticsearch + Sudachi + Kibana
本リポジトリは、形態素解析器Sudachiを組み込んだElasticsearchのDockerコンテナを提供します。
また同時にKibanaコンテナの立ち上げも実施します。

# Installation
## Step 1: Get system dictionary
* [SudachiDictリポジトリ](https://github.com/WorksApplications/SudachiDict) にアクセスしシステム辞書(full)をダウンロード
* 解凍後 ```system_small.dic```を ```./config``` ディレクトリに格納

## Step 2: Build Countainer Images
```
docker-compose build
```

## Step 3: Start Elasticsearch & Kibana
```
docker-compose up
```

## Step 4: Enjoy!
* Elasticsearch: http://localhost:9200
* Kibana: http://localhost:5601