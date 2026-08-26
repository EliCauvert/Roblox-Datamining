local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local appPage = require(parent.RobloxAppEnums).AppPage
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sduiActionType = sduiCoreSystemModule.SduiActionType
local getStringParam = sduiCoreSystemModule.SduiActionParams.getStringParam

return function(p1, _, p2, _)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), getStringParam (ref), appPage (ref)
	local var1 = if p1 then p1.actionParams else nil
	
	if var1 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.Navigate
		}, p2.appPage)
		
		return
	end
	local var2 = getStringParam(var1, "destination")
	
	if var2 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParam: destination",
			propName = "destination",
			name = sduiActionType.Navigate
		}, p2.appPage)
		
		return
	end
	local var3 = appPage[var2]
	
	if var3 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			propName = "destination",
			name = sduiActionType.Navigate,
			message = `Unknown destination: {var2}`
		}, p2.appPage)
		
		return
	end
	p2.dependencies.getNavigation().navigate(var3)
end