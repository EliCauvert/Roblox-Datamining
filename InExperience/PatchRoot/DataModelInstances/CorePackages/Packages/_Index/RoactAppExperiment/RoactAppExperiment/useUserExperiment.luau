local OnUserLayerLoadingStatusChanged = require(script.Parent.makeUseExperiment)("OnUserLayerLoadingStatusChanged", "GetUserLayerLoadingStatus", "GetUserLayerVariables", "LogUserLayerExposure", "GetUserStatusForLayer")

return function(p1, p2, p3)
	-- upvalues: OnUserLayerLoadingStatusChanged (copy)
	return OnUserLayerLoadingStatusChanged(p1, p2, p3)
end