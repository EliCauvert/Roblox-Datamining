local parent = script:FindFirstAncestor("AuthCommon").Parent
local IXPServiceWrapper = require(parent.IXPServiceWrapper).IXPServiceWrapper
local appBtidLayers = require(parent.ExperimentLayers).AppBtidLayers

return function()
	-- upvalues: IXPServiceWrapper (ref), appBtidLayers (ref)
	local accountRecoveryUILayerBTIDLayerData = IXPServiceWrapper:GetBTIDLayerData(appBtidLayers.AccountRecoveryUILayer)
	IXPServiceWrapper:LogBrowserTrackerLayerExposure(appBtidLayers.AccountRecoveryUILayer)
	
	return if accountRecoveryUILayerBTIDLayerData then accountRecoveryUILayerBTIDLayerData.shouldShowLuafiedRecoveryFlow or false else false
end