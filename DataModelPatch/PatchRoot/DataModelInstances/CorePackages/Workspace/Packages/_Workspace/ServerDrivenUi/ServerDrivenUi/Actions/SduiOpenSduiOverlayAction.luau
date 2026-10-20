local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local SetCentralOverlayFunction = require(Parent.CentralOverlay).Actions.SetCentralOverlay

return function(p1, _, p2)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = SduiActionType.OpenSduiOverlay
		}, p2.appPage)
		
		return
	end
	assert(ActionParams, "actionParams must exist")
	local ConfigKey = ActionParams.configKey
	local Identifier = ActionParams.identifier
	
	if not ConfigKey then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing configKey in action params",
			name = SduiActionType.OpenSduiOverlay
		}, p2.appPage)
		
		return
	end
	if Identifier then
		p2.dependencies.dispatch(SetCentralOverlayFunction(CentralOverlayType.SduiOverlay, {
			configKey = ConfigKey,
			identifier = Identifier,
			appPage = p2.appPage
		}))
		
		return
	else
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing identifier in action params",
			name = SduiActionType.OpenSduiOverlay
		}, p2.appPage)
	end
end