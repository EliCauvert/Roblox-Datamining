return {
	batch = require(script.Parent.SignalsScheduler).batch,
	createProxy = require(script.createProxy),
	createReducer = require(script.createReducer),
	onDisposed = require(script.onDisposed)
}