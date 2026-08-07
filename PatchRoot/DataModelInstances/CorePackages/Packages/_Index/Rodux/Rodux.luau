-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:05 2026 Pacific Standard Time.

return {
	Store = require(script.Store),
	createReducer = require(script.createReducer),
	combineReducers = require(script.combineReducers),
	makeActionCreator = require(script.makeActionCreator),
	loggerMiddleware = require(script.loggerMiddleware).middleware,
	thunkMiddleware = require(script.thunkMiddleware),
	makeThunkMiddleware = require(script.makeThunkMiddleware)
}