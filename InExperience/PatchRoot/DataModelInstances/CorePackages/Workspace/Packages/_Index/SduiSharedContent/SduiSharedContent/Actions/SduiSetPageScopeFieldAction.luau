local sduiCoreSystemModule = require(script:FindFirstAncestor("SduiSharedContent").Parent.SduiCoreSystem)
local getSduiClientPageScope = sduiCoreSystemModule.getSduiClientPageScope
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiActionParams = sduiCoreSystemModule.SduiActionParams
local getStringParam = sduiActionParams.getStringParam
local getBooleanParam = sduiActionParams.getBooleanParam

return function(value, _, p1, _)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), getStringParam (ref), getSduiClientPageScope (ref), getBooleanParam (ref)
	local var1 = if value then value.actionParams else nil
	
	if var1 == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.SetPageScopeField
		}, p1.appPage)
		
		return
	end
	local var2 = getStringParam(var1, "fieldName")
	
	if var2 == nil or var2 == "" then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParam: fieldName",
			propName = "fieldName",
			name = sduiActionType.SetPageScopeField
		}, p1.appPage)
		
		return
	end
	local var3 = getStringParam(var1, "value")
	
	if var3 == nil and var1.value ~= nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "actionParam value must be a string",
			propName = "value",
			name = sduiActionType.SetPageScopeField
		}, p1.appPage)
		
		return
	end
	local configKey = p1.configKey
	
	if configKey == nil then
		p1.dependencies.logger.reportError(sduiErrorType.FailedToExecuteAction, {
			message = "Missing sduiContext.configKey; no client page scope to write to",
			name = sduiActionType.SetPageScopeField
		}, p1.appPage)
		
		return
	end
	local var4 = getSduiClientPageScope(configKey)
	
	if not getBooleanParam(var1, "setIfUnset", false) then
		var4.set(var2, var3)
		
		return
	end
	local var5 = var4.get(var2)
	
	if var5 == nil or var5 == "" then
		var4.set(var2, var3)
	end
end