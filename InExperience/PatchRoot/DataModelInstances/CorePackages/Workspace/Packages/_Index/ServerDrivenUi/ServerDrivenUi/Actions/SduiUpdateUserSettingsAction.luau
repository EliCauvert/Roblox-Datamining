local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local updateUserSettings = require(parent.LegallySensitiveContent).updateUserSettings
local linkingProtocolModule = require(parent.LinkingProtocol)
local linkingProtocol = linkingProtocolModule.LinkingProtocol
local adConsentAttributionAdapter = linkingProtocolModule.AdConsentAttributionAdapter
local enableAdConsentUserSettingsPublish = game:DefineFastFlag("EnableAdConsentUserSettingsPublish", false)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType

return function(p0, _, p1, _)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), updateUserSettings (ref), enableAdConsentUserSettingsPublish (ref), adConsentAttributionAdapter (ref), linkingProtocol (ref)
	local var3 = if p0 then p0.actionParams else nil
	
	if var3 == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.UpdateUserSettings
		}, p1.appPage)
		
		return
	end
	assert(var3, "actionParams must exist")
	local settings = var3.settings
	
	if typeof(settings) ~= "table" or next(settings) == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = sduiActionType.UpdateUserSettings,
			message = `Invalid settings {settings}`
		}, p1.appPage)
		
		return
	end
	local auditData = var3.auditData
	
	if auditData ~= nil and typeof(auditData) ~= "string" then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = sduiActionType.UpdateUserSettings,
			message = `Invalid auditData {auditData}`
		}, p1.appPage)
		
		return
	end
	local ok, status = pcall(function()
		-- upvalues: updateUserSettings (copy), settings (ref), auditData (ref), enableAdConsentUserSettingsPublish (copy), adConsentAttributionAdapter (copy), linkingProtocol (copy), p1 (ref), sduiErrorType (copy), sduiActionType (copy)
		local var4 = updateUserSettings(settings, auditData)
		
		if enableAdConsentUserSettingsPublish then
			var4 = var4:andThen(function()
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
		var4:catch(function(p2)
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