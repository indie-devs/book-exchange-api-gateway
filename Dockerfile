FROM kong/kong-gateway:2.8.1.0-alpine

COPY ./plugins/ /usr/local/custom/kong/plugins/

COPY ./setup.plugins.sh .

USER root

RUN ["chmod", "+x", "./setup.plugins.sh"]
RUN [ "./setup.plugins.sh"]

WORKDIR /tmp

RUN luarocks pack kong-plugin-auth-middleware 1.0.1-1

WORKDIR /

ENV KONG_PLUGINS=kong-auth-middleware

RUN luarocks install /tmp/kong-plugin-auth-middleware*

RUN ["chmod", "+x", "./docker-entrypoint.sh"]

USER kong

ENTRYPOINT [ "./docker-entrypoint.sh"]

STOPSIGNAL SIGQUIT

CMD ["kong", "docker-start"]
