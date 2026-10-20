local OnBrowserTrackerLayerLoadingStatusChanged = require(script.Parent.makeUseExperiment)("OnBrowserTrackerLayerLoadingStatusChanged", "GetBrowserTrackerLayerLoadingStatus", "GetBrowserTrackerLayerVariables", "LogBrowserTrackerLayerExposure", "GetBrowserTrackerStatusForLayer")

return function(p1, p2, p3)
	-- upvalues: OnBrowserTrackerLayerLoadingStatusChanged (copy)
	return OnBrowserTrackerLayerLoadingStatusChanged(p1, p2, p3)
end