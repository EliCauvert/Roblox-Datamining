local SubscribeModule = require(script.subscribe)

return {
	subscribe = SubscribeModule.subscribe,
	createSourceEventStream = SubscribeModule.createSourceEventStream
}