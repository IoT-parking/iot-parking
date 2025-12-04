FROM ghcr.io/foundry-rs/foundry:latest

# KROK 1: Przełączamy się na roota, aby mieć uprawnienia do chmod i instalacji
USER root

WORKDIR /app

# KROK 2: Inicjalizacja (bez flagi --no-commit, która powodowała poprzedni błąd)
RUN forge init --force

# Instalacja bibliotek
RUN forge install OpenZeppelin/openzeppelin-contracts

# Kopiowanie plików
COPY src/ src/
COPY script/ script/
COPY entrypoint.sh .

# KROK 3: Teraz chmod zadziała, bo jesteśmy rootem
RUN chmod +x entrypoint.sh

EXPOSE 8545

ENTRYPOINT ["./entrypoint.sh"]