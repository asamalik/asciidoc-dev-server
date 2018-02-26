FROM fedora:28

RUN dnf -y install rubygem-ascii_binder inotify-tools && \
    dnf clean all

VOLUME /modularity
WORKDIR /modularity

CMD asciibinder package && \
    echo "" && \
    echo "=======================================================" && \
    echo "Server runs on http://localhost:8080" && \
    echo "" && \
    echo "The page will recompile every time you change a file." && \
    echo "=======================================================" && \
    echo "" && \
    #while inotifywait -re modify ./source; do rm -r build/doctrees; asciibinder package; done & \
    while inotifywait -re modify ./; do asciibinder package; done & \
    cd _package && python3 -m http.server 8080


    
