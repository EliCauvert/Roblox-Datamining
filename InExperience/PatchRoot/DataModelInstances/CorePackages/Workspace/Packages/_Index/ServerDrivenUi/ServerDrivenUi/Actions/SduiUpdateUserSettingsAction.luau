local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local updateUserSettings = require(parent.LegallySensitiveContent).updateUserSettings
local linkingProtocolModule = require(parent.LinkingProtocol)
local linkingProtocol = linkingProtocolModule.LinkingProtocol
local adConsentAttributionAdapter = linkingProtocolModule.AdConsentAttributionAdapter
local enableAdConsentUserSettingsPublish = game:DefineFastFlag("EnableAdConsentUserSettingsPublish", false)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType

return function(p1, _, p2, _)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), updateUserSettings (ref), enableAdConsentUserSettingsPublish (ref), adConsentAttributionAdapter (ref), linkingProtocol (ref)
	local var1 = if p1 then p1.actionParams else nil
	
	if var1 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.UpdateUserSettings
		}, p2.appPage)
		
		return
	end
	assert(var1, "actionParams must exist")
	local settings = var1.settings
	
	if typeof(settings) ~= "table" or next(settings) == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = sduiActionType.UpdateUserSettings,
			message = `Invalid settings {settings}`
		}, p2.appPage)
		
		return
	end
	local auditData = var1.auditData
	
	if auditData ~= nil and typeof(auditData) ~= "string" then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = sduiActionType.UpdateUserSettings,
			message = `Invalid auditData {auditData}`
		}, p2.appPage)
		
		return
	end
	local ok, status = pcall(function()
		-- upvalues: updateUserSettings (copy), settings (ref), auditData (ref), enableAdConsentUserSettingsPublish (copy), adConsentAttributionAdapter (copy), linkingProtocol (copy), p2 (ref), sduiErrorType (copy), sduiActionType (copy)
		local var2 = updateUserSettings(settings, auditData)
		
		if enableAdConsentUserSettingsPublish then
			var2 = var2:andThen(function()
				-- upvalues: settings (copy), adConsentAttributionAdapter (copy), linkingProtocol (copy)
				local allowSellShareData = settings.allowSellShareData
				
				if allowSellShareData ~= nil then
					adConsentAttributionAdapter.resolveAndPublish(linkingProtocol.default, "ConsentChanged", function()
						-- upvalues: allowSellShareData (ref)
						return allowSellShareData
					end)
				end
			end)
		end
		var2:catch(function(p3)
			-- upvalues: p2 (copy), sduiErrorType (copy), sduiActionType (copy)
			p2.dependencies.logger.reportError(sduiErrorType.FailedToExecuteAction, {
				name = sduiActionType.UpdateUserSettings,
				message = tostring(p3)
			}, p2.appPage)
		end)
	end)
	
	if ok then
		return
	end
	p2.dependencies.logger.reportError(sduiErrorType.FailedToExecuteAction, {
		name = sduiActionType.UpdateUserSettings,
		message = tostring(status)
	}, p2.appPage)
end