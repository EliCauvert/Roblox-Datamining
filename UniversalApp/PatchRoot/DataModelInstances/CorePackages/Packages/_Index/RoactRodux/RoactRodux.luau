local connectModule = require(script.connect)

return {
	StoreProvider = require(script.StoreProvider),
	StoreContext = require(script.StoreContext),
	connect = connectModule,
	UNSTABLE_connect2 = connectModule
}