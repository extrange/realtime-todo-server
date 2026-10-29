import { mkdirSync } from "node:fs";
import { dirname } from "node:path";

import { SQLite } from "@hocuspocus/extension-sqlite";
import { Server } from "@hocuspocus/server";

const DEFAULT_HOST = "0.0.0.0";
const DEFAULT_PORT = 1234;
const DEFAULT_DATABASE_PATH = "data/db.sqlite";

function parsePort(value: string | undefined): number {
	if (value === undefined) {
		return DEFAULT_PORT;
	}

	const port = Number(value);

	if (!Number.isInteger(port) || port < 1 || port > 65535) {
		throw new Error(
			`PORT must be an integer between 1 and 65535 (received "${value}")`,
		);
	}

	return port;
}

const databasePath = process.env.DATABASE_PATH ?? DEFAULT_DATABASE_PATH;

// better-sqlite3 does not create missing parent directories.
if (databasePath !== ":memory:") {
	mkdirSync(dirname(databasePath), { recursive: true });
}

const server = new Server({
	address: process.env.HOST ?? DEFAULT_HOST,
	port: parsePort(process.env.PORT),
	extensions: [new SQLite({ database: databasePath })],
});

server.listen().catch((error: unknown) => {
	console.error("Failed to start the server:", error);
	process.exitCode = 1;
});
