local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local closeCentralOverlay = require(parent.CentralOverlay).Thunks.CloseCentralOverlay
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sduiActionType = sduiCoreSystemModule.SduiActionType

return function(p1, _, p2, _)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), closeCentralOverlay (ref)
	local var1 = if p1 then p1.actionParams else nil
	
	if var1 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.DismissDialog
		}, p2.appPage)
		
		return
	end
	assert(var1, "actionParams must exist")
	
	if var1.dialogType == "centralOverlay" then
		p2.dependencies.dispatch(closeCentralOverlay())
	end
end