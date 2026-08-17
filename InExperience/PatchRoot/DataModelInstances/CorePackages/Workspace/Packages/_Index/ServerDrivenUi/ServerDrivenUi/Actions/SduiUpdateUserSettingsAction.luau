local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local updateUserSettings = require(parent.LegallySensitiveContent).updateUserSettings
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType

return function(p0, _, p1, _) --[[ line: 14 ]]
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), updateUserSettings (ref)
	local var1 = if p0 then p0.actionParams else nil
	
	if var1 == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.UpdateUserSettings
		}, p1.appPage)
		
		return
	end
	assert(var1, "actionParams must exist")
	local settings = var1.settings
	
	if typeof(settings) ~= "table" or next(settings) == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = sduiActionType.UpdateUserSettings,
			message = `Invalid settings {settings}`
		}, p1.appPage)
		
		return
	end
	local auditData = var1.auditData
	
	if auditData ~= nil and typeof(auditData) ~= "string" then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = sduiActionType.UpdateUserSettings,
			message = `Invalid auditData {auditData}`
		}, p1.appPage)
		
		return
	end
	local ok, status = pcall(function() --[[ line: 48 ]]
		-- upvalues: updateUserSettings (copy), settings (ref), auditData (ref), p1 (ref), sduiErrorType (copy), sduiActionType (copy)
		updateUserSettings(settings, auditData):catch(function(p2) --[[ line: 49 ]]
			-- upvalues: p1 (copy), sduiErrorType (copy), sduiActionType (copy)
			p1.dependencies.logger.reportError(sduiErrorType.FailedToExecuteAction, {
				name = sduiActionType.UpdateUserSettings,
				message = tostring(p2)
			}, p1.appPage)
		end)
	end)
	
	if ok then
		return
	end
	p1.dependencies.logger.reportError(sduiErrorType.FailedToExecuteAction, {
		name = sduiActionType.UpdateUserSettings,
		message = tostring(status)
	}, p1.appPage)
end