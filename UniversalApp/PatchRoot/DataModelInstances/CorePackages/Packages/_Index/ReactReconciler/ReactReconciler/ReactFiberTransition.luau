local reactCurrentBatchConfig = require(script.Parent.Parent.Shared).ReactSharedInternals.ReactCurrentBatchConfig

return {
	NoTransition = 0,
	requestCurrentTransition = function()
		-- upvalues: reactCurrentBatchConfig (ref)
		return reactCurrentBatchConfig.transition
	end
}