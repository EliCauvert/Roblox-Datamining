local subscribeModule = require(script.subscribe)

return {
	subscribe = subscribeModule.subscribe,
	createSourceEventStream = subscribeModule.createSourceEventStream
}