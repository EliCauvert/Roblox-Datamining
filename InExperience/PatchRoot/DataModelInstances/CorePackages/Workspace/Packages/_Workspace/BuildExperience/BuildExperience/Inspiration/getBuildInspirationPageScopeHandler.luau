local SduiCoreSystemModule = require(script:FindFirstAncestor("BuildExperience").Parent.SduiCoreSystem)
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType

return function(p1, p2, Name)
	-- upvalues: SduiCoreSystemModule (copy), SduiErrorType (copy)
	local ConfigKey = p1.configKey
	local GetResult = if ConfigKey then SduiCoreSystemModule.getSduiClientPageScope(ConfigKey).get(p2) else nil
	
	if typeof(GetResult) == "function" then
		return GetResult
	else
		p1.dependencies.logger.reportError(SduiErrorType.FailedToExecuteAction, {
			name = Name,
			message = `No {p2} handler for page {ConfigKey}`
		}, p1.appPage)
		
		return nil
	end
end