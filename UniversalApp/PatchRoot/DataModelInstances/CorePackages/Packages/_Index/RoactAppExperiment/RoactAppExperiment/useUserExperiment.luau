local var1 = require(script.Parent.makeUseExperiment)("OnUserLayerLoadingStatusChanged", "GetUserLayerLoadingStatus", "GetUserLayerVariables", "LogUserLayerExposure", "GetUserStatusForLayer")

return function(p1, p2, p3)
	-- upvalues: var1 (ref)
	return var1(p1, p2, p3)
end