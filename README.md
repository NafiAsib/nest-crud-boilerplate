## Description

CRUD boilerplate with [Nest](https://github.com/nestjs/nest)

## Installation

```bash
$ pnpm install
```

## Running the app

```bash
docker compose up -d --build
```

To get log

```bash
docker compose logs -f
```

Only NestJS console log

```bash
docker compose logs api -f
```

```bash
# development
$ pnpm run start

# watch mode
$ pnpm run start:dev

# production mode
$ pnpm run start:prod
```

## Test

```bash
# unit tests
$ pnpm run test

# e2e tests
$ pnpm run test:e2e

# test coverage
$ pnpm run test:cov
```
