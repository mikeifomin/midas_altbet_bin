FROM mikeifomin/midas_wallet_base:v1

WORKDIR /usr/local/bin

COPY ./altbetd .
COPY ./altbet-cli .

RUN chmod +x ./* && \
    ln altbetd walletd && \
    ln altbet-cli wallet-cli

VOLUME ["/root/.altbet"]
EXPOSE 2238

RUN walletd --help || exit $(($? == 127))
