import { Server } from "@hocuspocus/server";
import { SQLite } from "@hocuspocus/extension-sqlite";

const server = new Server({
	address: "0.0.0.0",
	port: 1234,
	extensions: [new SQLite({ database: "db.sqlite" })],
});

server.listen();
