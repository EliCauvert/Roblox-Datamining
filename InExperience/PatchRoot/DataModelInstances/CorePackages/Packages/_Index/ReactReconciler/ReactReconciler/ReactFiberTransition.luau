local ReactCurrentBatchConfig = require(script.Parent.Parent.Shared).ReactSharedInternals.ReactCurrentBatchConfig

return {
	NoTransition = 0,
	requestCurrentTransition = function() --[[ Line: 20 ]]
		-- upvalues: ReactCurrentBatchConfig (copy)
		return ReactCurrentBatchConfig.transition
	end
}