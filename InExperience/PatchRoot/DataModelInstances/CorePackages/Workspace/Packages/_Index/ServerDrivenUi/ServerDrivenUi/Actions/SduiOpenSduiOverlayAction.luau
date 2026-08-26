local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local centralOverlayType = require(parent.RobloxAppEnums).CentralOverlayType
local setCentralOverlay = require(parent.CentralOverlay).Actions.SetCentralOverlay

return function(p1, _, p2)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), setCentralOverlay (ref), centralOverlayType (ref)
	local var1 = if p1 then p1.actionParams else nil
	
	if var1 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.OpenSduiOverlay
		}, p2.appPage)
		
		return
	end
	assert(var1, "actionParams must exist")
	local configKey = var1.configKey
	local identifier = var1.identifier
	
	if not configKey then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing configKey in action params",
			name = sduiActionType.OpenSduiOverlay
		}, p2.appPage)
		
		return
	elseif identifier then
		p2.dependencies.dispatch(setCentralOverlay(centralOverlayType.SduiOverlay, {
			configKey = configKey,
			identifier = identifier,
			appPage = p2.appPage
		}))
		
		return
	end
	p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
		message = "Missing identifier in action params",
		name = sduiActionType.OpenSduiOverlay
	}, p2.appPage)
end