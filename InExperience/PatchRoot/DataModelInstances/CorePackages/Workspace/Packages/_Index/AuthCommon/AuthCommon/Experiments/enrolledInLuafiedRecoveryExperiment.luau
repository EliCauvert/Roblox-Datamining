local Parent = script:FindFirstAncestor("AuthCommon").Parent
local IXPServiceWrapper = require(Parent.IXPServiceWrapper).IXPServiceWrapper
local AppBtidLayers = require(Parent.ExperimentLayers).AppBtidLayers

return function() --[[ Line: 7 | Named "enrolledInLuafiedRecoveryExperiment" ]]
	-- upvalues: IXPServiceWrapper (copy), AppBtidLayers (copy)
	local BTIDLayerData = IXPServiceWrapper:GetBTIDLayerData(AppBtidLayers.AccountRecoveryUILayer)
	IXPServiceWrapper:LogBrowserTrackerLayerExposure(AppBtidLayers.AccountRecoveryUILayer)
	
	return BTIDLayerData and BTIDLayerData.shouldShowLuafiedRecoveryFlow or false
end