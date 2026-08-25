local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local closeCentralOverlay = require(parent.CentralOverlay).Thunks.CloseCentralOverlay
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sduiActionType = sduiCoreSystemModule.SduiActionType

return function(p0, _, p1, _)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), closeCentralOverlay (ref)
	local var1 = if p0 then p0.actionParams else nil
	
	if var1 == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.DismissDialog
		}, p1.appPage)
		
		return
	end
	assert(var1, "actionParams must exist")
	
	if var1.dialogType == "centralOverlay" then
		p1.dependencies.dispatch(closeCentralOverlay())
	end
end