local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local appPage = require(parent.RobloxAppEnums).AppPage
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sduiActionType = sduiCoreSystemModule.SduiActionType
local getStringParam = sduiCoreSystemModule.SduiActionParams.getStringParam

return function(p0, _, p1, _) --[[ line: 21 | named "SduiNavigateAction" ]]
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), getStringParam (ref), appPage (ref)
	local var1 = if p0 then p0.actionParams else nil
	
	if var1 == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.Navigate
		}, p1.appPage)
		
		return
	end
	local var2 = getStringParam(var1, "destination")
	
	if var2 == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParam: destination",
			propName = "destination",
			name = sduiActionType.Navigate
		}, p1.appPage)
		
		return
	end
	local var3 = appPage[var2]
	
	if var3 == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			propName = "destination",
			name = sduiActionType.Navigate,
			message = `Unknown destination: {var2}`
		}, p1.appPage)
		
		return
	end
	p1.dependencies.getNavigation().navigate(var3)
end