FROM ubuntu:24.04

# Instala SSH y herramientas básicas con soporte de colores
RUN apt-get update && apt-get install -y \
    openssh-server \
    sudo \
    bash \
    git \
    tree \
    nano \
    vim \
    less \
    locales \
    man \
    manpages \
    wget \
    curl \
    bash-completion \
    && mkdir /var/run/sshd
# Configura locale para evitar problemas de caracteres
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Establece la contraseña para root
RUN echo 'root:Inegi2025' | chpasswd

# Crea el usuario 'alumno' con bash, home y acceso sudo (si lo deseas)
RUN useradd -m -s /bin/bash alumno && \
    echo 'alumno:Inegi2025' | chpasswd && \
    usermod -aG sudo alumno

# Copia configuración con colores a /home/alumno/.bashrc
RUN echo 'export LS_OPTIONS="--color=auto"' >> /home/alumno/.bashrc && \
    echo 'eval "$(dircolors)"' >> /home/alumno/.bashrc && \
    echo 'alias ls="ls $LS_OPTIONS"' >> /home/alumno/.bashrc && \
    echo 'alias ll="ls -l $LS_OPTIONS"' >> /home/alumno/.bashrc && \
    echo 'alias la="ls -A $LS_OPTIONS"' >> /home/alumno/.bashrc && \
    echo 'alias l="ls -CF $LS_OPTIONS"' >> /home/alumno/.bashrc && \
    echo 'export PS1="\[\e[0;36m\]\u@\h:\[\e[0;34m\]\w\[\e[0m\] \$ "' >> /home/alumno/.bashrc && \
    chown alumno:alumno /home/alumno/.bashrc

# Configura SSH para permitir login por contraseña
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config

# Expone el puerto SSH
EXPOSE 22

# Comando final: inicia el servicio SSH
CMD ["/usr/sbin/sshd", "-D"]
