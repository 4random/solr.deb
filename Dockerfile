FROM solr:7.7.3

USER root

RUN apt-get update && apt-get install --no-install-recommends --yes hunspell-hu

COPY --chown=solr:solr ./var/solr/data/opensemanticsearch /opt/solr/server/solr/opensemanticsearch

COPY --chown=solr:solr ./src/open-semantic-entity-search-api/src/solr/opensemanticsearch-entities /opt/solr/server/solr/opensemanticsearch-entities

# Create symbolic links for hunspell
RUN ln -s /usr/share/hunspell /opt/solr/server/solr/opensemanticsearch/conf/lang/hunspell
RUN ln -s /usr/share/hunspell /opt/solr/server/solr/opensemanticsearch-entities/conf/lang/hunspell

USER solr
