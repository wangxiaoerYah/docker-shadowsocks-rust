FROM rust:latest

RUN date && rm -rf /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && timedatectl set-ntp true && apt update && apt upgrade -y && apt dist-upgrade -y 

RUN apt install curl gcc make libssl-dev pkg-config libsodium

RUN cargo install shadowsocks-rust

ENTRYPOINT ["/root/.cargo/bin/ssmanager"]
