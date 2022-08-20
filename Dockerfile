FROM dart

#RUN apt-get update
#RUN apt-get -y install g++-multilib git python3 curl xz-utils ninja-build
#RUN git config --global user.name "Bert Bruggeman"
#RUN git config --global user.email "bbruggeman1974@gmail.com"
#WORKDIR /dart-sdk/depot_tools/
#RUN git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git /dart-sdk/depot_tools/
#RUN export PATH="$PATH:/dart-sdk/depot_tools/"
#WORKDIR /dart-sdk/
#RUN ls /dart-sdk/
#RUN /dart-sdk/depot_tools/fetch dart
#RUN ls /dart-sdk/
#WORKDIR /dart-sdk/sdk
#RUN ls
#RUN ./tools/build.py --no-goma --mode release --arch ia32 create_sdk
#RUN ls

# RUN apt-get update
#RUN apt-get install -y apt-utils
#RUN apt-get install -y apt-transport-https wget git
#RUN wget -qO /etc/apt/trusted.gpg.d/dart_linux_signing_key.asc https://dl-ssl.google.com/linux/linux_signing_key.pub
#RUN wget -qO /etc/apt/sources.list.d/dart_dev.list https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_dev.list
#RUN curl https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_testing.list > /etc/apt/sources.list.d/dart_testing.list
#RUN curl https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_unstable.list > /etc/apt/sources.list.d/dart_unstable.list
#RUN apt update
#RUN apt install -y dart
#UN dart upgrade 
#WORKDIR /unpub_server_bb
WORKDIR /app
COPY ./unpub_server_bb ./unpub_server_bb
COPY ./unpub ./unpub
RUN cd /app/unpub/unpub && dart pub get && ls
RUN cd /app/unpub_server_bb && dart pub get && ls
#run cp ./app.dart /root/.pub-cache/hosted/pub.dartlang.org/unpub-2.0.0/lib/src/app.dart

WORKDIR /app/unpub_server_bb
ENTRYPOINT ["dart", "run" ]
