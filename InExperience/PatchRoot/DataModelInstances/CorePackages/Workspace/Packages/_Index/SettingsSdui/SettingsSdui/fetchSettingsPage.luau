local settingsSdui = script:FindFirstAncestor("SettingsSdui")
local parent = settingsSdui.Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local sduiResponseType = sduiSharedUtilitiesModule.SduiResponseType
local getSduiApiStore = sduiSharedUtilitiesModule.getSduiApiStore
local getSduiTemplateStore = sduiSharedUtilitiesModule.getSduiTemplateStore
local sduiApiStorePostConfigContentType = sduiSharedUtilitiesModule.SduiApiStorePostConfigContentType
local sduiCapabilities = sduiSharedUtilitiesModule.SduiCapabilities
local settingsSduiConstantsModule = require(settingsSdui.SettingsSduiConstants)
local settingsPageSessionModule = require(settingsSdui.SettingsPageSession)
local getSettingsPageUrlModule = require(settingsSdui.getSettingsPageUrl)
local buildSettingsPageRequestModule = require(settingsSdui.buildSettingsPageRequest)
local fFlagSduiAdvertiseRuntimeSupportSets = require(parent.SharedFlags).FFlagSduiAdvertiseRuntimeSupportSets

local function fetchSettingsPage(value, p1)
	-- upvalues: settingsSduiConstantsModule (ref), getSduiApiStore (ref), settingsPageSessionModule (ref), parent (ref), fFlagSduiAdvertiseRuntimeSupportSets (ref), sduiCapabilities (ref), getSduiTemplateStore (ref), appPage (ref), getSettingsPageUrlModule (ref), buildSettingsPageRequestModule (ref), sduiResponseType (ref), sduiApiStorePostConfigContentType (ref), fetchSettingsPage (ref)
	local configKey = settingsSduiConstantsModule.ConfigKey
	local var1 = getSduiApiStore()
	local _, data = var1.getData(configKey)
	
	if (p1 or data) and not var1.isInFlight(configKey) then
		settingsPageSessionModule:Refresh()
	end
	local serviceContractsProtoModule = require(parent.ServiceContractsProto)
	local settingsPage = serviceContractsProtoModule.apppageplatform.settings.settings_page
	
	return var1.fetchIfNeeded({
		enableTemplateCache = true,
		responseType = sduiResponseType.Protobuf,
		url = getSettingsPageUrlModule(),
		surfaceKey = appPage.Settings,
		configKey = configKey,
		loadTimer = value,
		apiProto = settingsPage.SettingsPageResponse,
		postConfig = {
			contentType = sduiApiStorePostConfigContentType.Json,
			body = buildSettingsPageRequestModule(settingsPage, {
				sessionId = settingsPageSessionModule:Get(),
				cachedRobloxComponentToTemplateId = getSduiTemplateStore().getCachedRobloxComponentToTemplateId(appPage.Settings),
				clientCapabilities = serviceContractsProtoModule.apppageplatform.shared.client_capabilities.ClientCapabilities.new({
					enabled_capabilities = if fFlagSduiAdvertiseRuntimeSupportSets then sduiCapabilities.getEnabledCapabilityNumbersWithoutExtendedMarker() else sduiCapabilities.getEnabledCapabilityNumbers(sduiCapabilities.getEnabledCapabilities())
				})
			})
		},
		refresh = function(p2)
			-- upvalues: fetchSettingsPage (copy)
			return fetchSettingsPage(p2, true)
		end
	}, p1)
end

return fetchSettingsPage