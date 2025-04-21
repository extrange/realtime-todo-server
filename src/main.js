"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const server_1 = require("@hocuspocus/server");
const extension_sqlite_1 = require("@hocuspocus/extension-sqlite");
const server = new server_1.Hocuspocus({
    address: "0.0.0.0",
    port: 1234,
    extensions: [new extension_sqlite_1.SQLite({ database: "db.sqlite" })],
});
server.listen();
