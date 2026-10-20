local TModule = require(script.Parent.Parent.Parent.Parent.t)

return TModule.strictInterface({
	targetValue = TModule.number,
	springParams = TModule.optional(TModule.strictInterface({
		frequency = TModule.number,
		dampingRatio = TModule.number
	}))
})