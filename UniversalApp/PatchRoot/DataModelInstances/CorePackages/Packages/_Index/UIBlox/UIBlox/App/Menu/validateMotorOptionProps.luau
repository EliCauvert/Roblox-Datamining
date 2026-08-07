local tModule = require(script.Parent.Parent.Parent.Parent.t)

return tModule.strictInterface({
	targetValue = tModule.number,
	springParams = tModule.optional(tModule.strictInterface({
		frequency = tModule.number,
		dampingRatio = tModule.number
	}))
})