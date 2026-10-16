local SettingsSdui = script:FindFirstAncestor("SettingsSdui")
local Parent = SettingsSdui.Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local SduiResponseType = SduiSharedUtilitiesModule.SduiResponseType
local GetSduiApiStoreFunction = SduiSharedUtilitiesModule.getSduiApiStore
local GetSduiTemplateStoreFunction = SduiSharedUtilitiesModule.getSduiTemplateStore
local SduiApiStorePostConfigContentType = SduiSharedUtilitiesModule.SduiApiStorePostConfigContentType
local SduiCapabilities = SduiSharedUtilitiesModule.SduiCapabilities
local SettingsSduiConstantsModule = require(SettingsSdui.SettingsSduiConstants)
local SettingsPageSessionModule = require(SettingsSdui.SettingsPageSession)
local GetSettingsPageUrlModule = require(SettingsSdui.getSettingsPageUrl)
local BuildSettingsPageRequestModule = require(SettingsSdui.buildSettingsPageRequest)
local FFlagSduiAdvertiseRuntimeSupportSets = require(Parent.SharedFlags).FFlagSduiAdvertiseRuntimeSupportSets

local function fetchSettingsPage(LoadTimer, p1) --[[ Line: 20 ]]
	-- upvalues: SettingsSduiConstantsModule (copy), GetSduiApiStoreFunction (copy), SettingsPageSessionModule (copy), Parent (copy), FFlagSduiAdvertiseRuntimeSupportSets (copy), SduiCapabilities (copy), GetSduiTemplateStoreFunction (copy), AppPage (copy), GetSettingsPageUrlModule (copy), BuildSettingsPageRequestModule (copy), SduiResponseType (copy), SduiApiStorePostConfigContentType (copy), fetchSettingsPage (copy)
	local ConfigKey = SettingsSduiConstantsModule.ConfigKey
	local SduiApiStore = GetSduiApiStoreFunction()
	local _, Data2 = SduiApiStore.getData(ConfigKey)
	
	if (p1 or Data2) and not SduiApiStore.isInFlight(ConfigKey) then
		SettingsPageSessionModule:Refresh()
	end
	local ServiceContractsProtoModule = require(Parent.ServiceContractsProto)
	local SettingsPage = ServiceContractsProtoModule.apppageplatform.settings.settings_page
	
	return SduiApiStore.fetchIfNeeded({
		enableTemplateCache = true,
		responseType = SduiResponseType.Protobuf,
		url = GetSettingsPageUrlModule(),
		surfaceKey = AppPage.Settings,
		configKey = ConfigKey,
		loadTimer = LoadTimer,
		apiProto = SettingsPage.SettingsPageResponse,
		postConfig = {
			contentType = SduiApiStorePostConfigContentType.Json,
			body = BuildSettingsPageRequestModule(SettingsPage, {
				sessionId = SettingsPageSessionModule:Get(),
				cachedRobloxComponentToTemplateId = GetSduiTemplateStoreFunction().getCachedRobloxComponentToTemplateId(AppPage.Settings),
				clientCapabilities = ServiceContractsProtoModule.apppageplatform.shared.client_capabilities.ClientCapabilities.new({
					enabled_capabilities = if FFlagSduiAdvertiseRuntimeSupportSets then SduiCapabilities.getEnabledCapabilityNumbersWithoutExtendedMarker() else SduiCapabilities.getEnabledCapabilityNumbers(SduiCapabilities.getEnabledCapabilities())
				})
			})
		},
		refresh = function(LoadTimer) --[[ Line: 63 ]]
			-- upvalues: fetchSettingsPage (upval)
			return fetchSettingsPage(LoadTimer, true)
		end
	}, p1)
end

return fetchSettingsPage