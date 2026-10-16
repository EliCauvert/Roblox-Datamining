local Parent = script:FindFirstAncestor("SettingsSdui").Parent
local UpdateUserSettingsFunction = require(Parent.LegallySensitiveContent).updateUserSettings
local LinkingProtocolModule = require(Parent.LinkingProtocol)
local LinkingProtocol = LinkingProtocolModule.LinkingProtocol
local AdConsentAttributionAdapter = LinkingProtocolModule.AdConsentAttributionAdapter
local ReadCachedAdConsentRegionFunction = LinkingProtocolModule.readCachedAdConsentRegion
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagEnableAdConsentUserSettingsPublish = SharedFlagsModule.FFlagEnableAdConsentUserSettingsPublish
local FFlagAdConsentForwardCachedRegion = SharedFlagsModule.FFlagAdConsentForwardCachedRegion
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType

return function(p1, _, p2, _) --[[ Line: 24 ]]
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), UpdateUserSettingsFunction (copy), FFlagEnableAdConsentUserSettingsPublish (copy), FFlagAdConsentForwardCachedRegion (copy), ReadCachedAdConsentRegionFunction (copy), AdConsentAttributionAdapter (copy), LinkingProtocol (copy)
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
	local Success, Result = pcall(function() --[[ Line: 58 ]]
		-- upvalues: UpdateUserSettingsFunction (upval), Settings (copy), AuditData (copy), FFlagEnableAdConsentUserSettingsPublish (upval), FFlagAdConsentForwardCachedRegion (upval), ReadCachedAdConsentRegionFunction (upval), AdConsentAttributionAdapter (upval), LinkingProtocol (upval), p2 (copy), SduiErrorType (upval), SduiActionType (upval)
		local UpdateUserSettingsResult = UpdateUserSettingsFunction(Settings, AuditData)
		
		if FFlagEnableAdConsentUserSettingsPublish then
			UpdateUserSettingsResult = UpdateUserSettingsResult:andThen(function() --[[ Line: 64 ]]
				-- upvalues: Settings (upval), FFlagAdConsentForwardCachedRegion (upval), ReadCachedAdConsentRegionFunction (upval), AdConsentAttributionAdapter (upval), LinkingProtocol (upval)
				local AllowSellShareData = Settings.allowSellShareData
				
				if AllowSellShareData ~= nil then
					AdConsentAttributionAdapter.resolveAndPublish(LinkingProtocol.default, "ConsentChanged", function() --[[ Line: 68 ]]
						-- upvalues: AllowSellShareData (copy)
						return AllowSellShareData
					end, if FFlagAdConsentForwardCachedRegion then ReadCachedAdConsentRegionFunction() else nil)
				end
			end)
		end
		UpdateUserSettingsResult:catch(function(Err) --[[ Line: 74 ]]
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