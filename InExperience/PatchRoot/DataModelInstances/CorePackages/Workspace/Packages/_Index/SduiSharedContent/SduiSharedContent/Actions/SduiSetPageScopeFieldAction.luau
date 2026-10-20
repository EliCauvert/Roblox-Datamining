local SduiCoreSystemModule = require(script:FindFirstAncestor("SduiSharedContent").Parent.SduiCoreSystem)
local GetSduiClientPageScopeFunction = SduiCoreSystemModule.getSduiClientPageScope
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiActionParams = SduiCoreSystemModule.SduiActionParams
local GetStringParamFunction = SduiActionParams.getStringParam
local GetBooleanParamFunction = SduiActionParams.getBooleanParam

return function(p1, _, p2, _)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), GetStringParamFunction (copy), GetSduiClientPageScopeFunction (copy), GetBooleanParamFunction (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = SduiActionType.SetPageScopeField
		}, p2.appPage)
		
		return
	end
	local FieldName = GetStringParamFunction(ActionParams, "fieldName")
	
	if FieldName == nil or FieldName == "" then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParam: fieldName",
			propName = "fieldName",
			name = SduiActionType.SetPageScopeField
		}, p2.appPage)
		
		return
	end
	local Value = GetStringParamFunction(ActionParams, "value")
	
	if Value == nil and ActionParams.value ~= nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "actionParam value must be a string",
			propName = "value",
			name = SduiActionType.SetPageScopeField
		}, p2.appPage)
		
		return
	end
	local ConfigKey = p2.configKey
	
	if ConfigKey == nil then
		p2.dependencies.logger.reportError(SduiErrorType.FailedToExecuteAction, {
			message = "Missing sduiContext.configKey; no client page scope to write to",
			name = SduiActionType.SetPageScopeField
		}, p2.appPage)
		
		return
	end
	local SduiClientPageScope = GetSduiClientPageScopeFunction(ConfigKey)
	
	if not GetBooleanParamFunction(ActionParams, "setIfUnset", false) then
		SduiClientPageScope.set(FieldName, Value)
		
		return
	end
	local GetResult = SduiClientPageScope.get(FieldName)
	
	if GetResult == nil or GetResult == "" then
		SduiClientPageScope.set(FieldName, Value)
	end
end