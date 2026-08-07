local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local centralOverlayType = require(parent.RobloxAppEnums).CentralOverlayType
local setCentralOverlay = require(parent.CentralOverlay).Actions.SetCentralOverlay

return function(p0, _, p1) --[[ line: 14 | named "SduiOpenSduiOverlayAction" ]]
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), setCentralOverlay (ref), centralOverlayType (ref)
	local var1 = if p0 then p0.actionParams else nil
	
	if var1 == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.OpenSduiOverlay
		}, p1.appPage)
		
		return
	end
	assert(var1, "actionParams must exist")
	local configKey = var1.configKey
	local identifier = var1.identifier
	
	if not configKey then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing configKey in action params",
			name = sduiActionType.OpenSduiOverlay
		}, p1.appPage)
		
		return
	elseif identifier then
		p1.dependencies.dispatch(setCentralOverlay(centralOverlayType.SduiOverlay, {
			configKey = configKey,
			identifier = identifier,
			appPage = p1.appPage
		}))
		
		return
	end
	p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
		message = "Missing identifier in action params",
		name = sduiActionType.OpenSduiOverlay
	}, p1.appPage)
end