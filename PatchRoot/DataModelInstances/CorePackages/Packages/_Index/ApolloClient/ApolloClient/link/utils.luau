-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:15 2026 Pacific Standard Time.

return {
	fromError = require(script.fromError).fromError,
	toPromise = require(script.toPromise).toPromise,
	fromPromise = require(script.fromPromise).fromPromise,
	throwServerError = require(script.throwServerError).throwServerError,
	validateOperation = require(script.validateOperation).validateOperation,
	createOperation = require(script.createOperation).createOperation,
	transformOperation = require(script.transformOperation).transformOperation
}