local ConnectModule = require(script.connect)

return {
	StoreProvider = require(script.StoreProvider),
	StoreContext = require(script.StoreContext),
	connect = ConnectModule,
	UNSTABLE_connect2 = ConnectModule
}