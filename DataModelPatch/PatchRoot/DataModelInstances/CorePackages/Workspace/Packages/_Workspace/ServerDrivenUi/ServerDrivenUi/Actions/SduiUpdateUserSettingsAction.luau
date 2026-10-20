local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local UpdateUserSettingsFunction = require(Parent.LegallySensitiveContent).updateUserSettings
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType

return function(p1, _, p2, _)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), UpdateUserSettingsFunction (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = SduiActionType.UpdateUserSettings
		}, p2.appPage)
		
		return
	end
	assert(ActionParams, "actionParams must exist")
	local Settings = ActionParams.settings
	
	if typeof(Settings) ~= "table" or next(Settings) == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			name = SduiActionType.UpdateUserSettings,
			message = `Invalid settings {Settings}`
		}, p2.appPage)
		
		return
	end
	local AuditData = ActionParams.auditData
	
	if AuditData ~= nil and typeof(AuditData) ~= "string" then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			name = SduiActionType.UpdateUserSettings,
			message = `Invalid auditData {AuditData}`
		}, p2.appPage)
		
		return
	end
	local Success, Result = pcall(function()
		-- upvalues: UpdateUserSettingsFunction (upval), Settings (copy), AuditData (copy), p2 (copy), SduiErrorType (upval), SduiActionType (upval)
		UpdateUserSettingsFunction(Settings, AuditData):catch(function(Err)
			-- upvalues: p2 (upval), SduiErrorType (upval), SduiActionType (upval)
			p2.dependencies.logger.reportError(SduiErrorType.FailedToExecuteAction, {
				name = SduiActionType.UpdateUserSettings,
				message = tostring(Err)
			}, p2.appPage)
		end)
	end)
	
	if not Success then
		p2.dependencies.logger.reportError(SduiErrorType.FailedToExecuteAction, {
			name = SduiActionType.UpdateUserSettings,
			message = tostring(Result)
		}, p2.appPage)
		
		return
	end
end