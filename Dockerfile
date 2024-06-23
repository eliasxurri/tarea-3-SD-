FROM bde2020/hadoop-base:2.0.0-hadoop2.7.4-java8

# Actualizar las fuentes de apt para Jessie
RUN echo "deb http://archive.debian.org/debian/ jessie main" > /etc/apt/sources.list && \
    echo "deb-src http://archive.debian.org/debian/ jessie main" >> /etc/apt/sources.list && \
    echo "deb http://archive.debian.org/debian-security jessie/updates main" >> /etc/apt/sources.list && \
    echo "deb-src http://archive.debian.org/debian-security jessie/updates main" >> /etc/apt/sources.list

# Copiar el archivo 99archive para deshabilitar la validación de fecha
COPY 99archive /etc/apt/apt.conf.d/99archive

# Agregar la opción --force-yes para permitir la instalación de paquetes no autenticados
RUN apt-get update && apt-get install -y --force-yes wget openjdk-8-jdk \
    && wget http://archive.apache.org/dist/pig/pig-0.17.0/pig-0.17.0.tar.gz \
    && tar -xzvf pig-0.17.0.tar.gz \
    && mv pig-0.17.0 /opt/ \
    && ln -s /opt/pig-0.17.0 /opt/pig \
    && rm pig-0.17.0.tar.gz

ENV PATH $PATH:/opt/pig/bin

# Copiar archivos de configuración de Hadoop
COPY core-site.xml /opt/hadoop/etc/hadoop/core-site.xml
COPY hdfs-site.xml /opt/hadoop/etc/hadoop/hdfs-site.xml

CMD ["tail", "-f", "/dev/null"]
