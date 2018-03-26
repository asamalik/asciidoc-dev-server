FROM fedora:28

RUN dnf -y install /usr/bin/gem ruby inotify-tools open-sans-fonts ruby-devel redhat-rpm-config patch git && \
    dnf -y group install "C Development Tools and Libraries" && \
    dnf clean all && \
    gem install ascii_binder

RUN cd /tmp && \
    git clone https://github.com/redhataccess/ascii_binder && \
    cd ascii_binder && \
    gem build ascii_binder.gemspec && \
    gem install ./ascii_binder-0.1.15.1.gem


VOLUME /modularity
WORKDIR /modularity

CMD asciibinder package -t 0 && \
    echo "" && \
    echo "=======================================================" && \
    echo "Server runs on http://localhost:8080" && \
    echo "" && \
    echo "The page will recompile every time you change a file." && \
    echo "=======================================================" && \
    echo "" && \
    #while inotifywait -re modify ./source; do rm -r build/doctrees; asciibinder package; done & \
    while inotifywait -re modify ./; do asciibinder package -t 0; done & \
    cd _package && python3 -m http.server 8080


    
