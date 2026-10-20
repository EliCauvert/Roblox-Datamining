local ReactCurrentBatchConfig = require(script.Parent.Parent.Shared).ReactSharedInternals.ReactCurrentBatchConfig

return {
	NoTransition = 0,
	requestCurrentTransition = function()
		-- upvalues: ReactCurrentBatchConfig (copy)
		return ReactCurrentBatchConfig.transition
	end
}