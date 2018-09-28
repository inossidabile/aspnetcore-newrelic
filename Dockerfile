FROM microsoft/dotnet:2.1-aspnetcore-runtime AS worker

RUN echo 'deb http://apt.newrelic.com/debian/ newrelic non-free' | tee /etc/apt/sources.list.d/newrelic.list
RUN apt-get update
RUN apt-get install -y gnupg2
RUN curl -O https://download.newrelic.com/548C16BF.gpg 
RUN apt-key add 548C16BF.gpg
RUN apt-get update
RUN apt-get install -y newrelic-netcore20-agent

ENV CORECLR_ENABLE_PROFILING=1 \
CORECLR_PROFILER={36032161-FFC0-4B61-B559-F6C5D41BAE5A} \
CORECLR_NEWRELIC_HOME=/usr/local/newrelic-netcore20-agent \
CORECLR_PROFILER_PATH=/usr/local/newrelic-netcore20-agent/libNewRelicProfiler.so

