local reactCurrentBatchConfig = require(script.Parent.Parent.Shared).ReactSharedInternals.ReactCurrentBatchConfig

return {
	NoTransition = 0,
	requestCurrentTransition = function() --[[ line: 20 ]]
		-- upvalues: reactCurrentBatchConfig (ref)
		return reactCurrentBatchConfig.transition
	end
}