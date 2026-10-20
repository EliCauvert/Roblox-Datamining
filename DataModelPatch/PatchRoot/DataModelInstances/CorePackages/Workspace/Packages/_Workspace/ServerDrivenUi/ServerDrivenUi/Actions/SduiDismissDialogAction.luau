local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local CloseCentralOverlayFunction = require(Parent.CentralOverlay).Thunks.CloseCentralOverlay
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local SduiActionType = SduiCoreSystemModule.SduiActionType

return function(p1, _, p2, _)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), CloseCentralOverlayFunction (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = SduiActionType.DismissDialog
		}, p2.appPage)
		
		return
	end
	assert(ActionParams, "actionParams must exist")
	
	if ActionParams.dialogType == "centralOverlay" then
		p2.dependencies.dispatch(CloseCentralOverlayFunction())
	end
end