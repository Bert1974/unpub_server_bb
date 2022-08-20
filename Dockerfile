FROM dart

WORKDIR /app
COPY ./unpub_server_bb ./unpub_server_bb
COPY ./unpub ./unpub
RUN cd /app/unpub/unpub && dart pub get
RUN cd /app/unpub_server_bb && dart pub get

WORKDIR /app/unpub_server_bb
ENTRYPOINT ["dart", "run" ]
