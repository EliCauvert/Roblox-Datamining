local parent = script:FindFirstAncestor("GameDetail").Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local sduiResponseType = sduiSharedUtilitiesModule.SduiResponseType
local getSduiApiStore = sduiSharedUtilitiesModule.getSduiApiStore
local getSduiTemplateStore = sduiSharedUtilitiesModule.getSduiTemplateStore
local sduiApiStorePostConfigContentType = sduiSharedUtilitiesModule.SduiApiStorePostConfigContentType
local sduiCapabilities = sduiSharedUtilitiesModule.SduiCapabilities
local getExperienceDetailsUrlModule = require(script.Parent.getExperienceDetailsUrl)
local getExperienceDetailsPageKeyModule = require(script.Parent.getExperienceDetailsPageKey)
local fFlagSduiEdpClientTemplateCache = require(parent.SharedFlags).FFlagSduiEdpClientTemplateCache

return function(p0, p1, p2) --[[ line: 16 | named "fetchExperienceDetailsPage" ]]
	-- upvalues: getExperienceDetailsUrlModule (ref), parent (ref), fFlagSduiEdpClientTemplateCache (ref), sduiCapabilities (ref), getSduiTemplateStore (ref), appPage (ref), sduiApiStorePostConfigContentType (ref), getSduiApiStore (ref), sduiResponseType (ref), getExperienceDetailsPageKeyModule (ref)
	local var3 = getExperienceDetailsUrlModule(p0)
	local serviceContractsProtoModule = require(parent.ServiceContractsProto)
	local experienceDetailsPage = serviceContractsProtoModule.apppageplatform.experiencedetails.experience_details_page
	getSduiApiStore().fetchIfNeeded({
		responseType = sduiResponseType.Protobuf,
		url = var3,
		surfaceKey = appPage.ExperienceDetail,
		configKey = getExperienceDetailsPageKeyModule(p0),
		loadTimer = p1,
		apiProto = experienceDetailsPage.ExperienceDetailsPageResponse,
		postConfig = if fFlagSduiEdpClientTemplateCache then if fFlagSduiEdpClientTemplateCache then {
			contentType = sduiApiStorePostConfigContentType.Proto,
			protoMessage = experienceDetailsPage.ExperienceDetailsPageRequest,
			body = {
				cached_roblox_component_to_template_id = getSduiTemplateStore().getCachedRobloxComponentToTemplateId(appPage.ExperienceDetail),
				client_capabilities = serviceContractsProtoModule.apppageplatform.shared.client_capabilities.ClientCapabilities.new({
					enabled_capabilities = sduiCapabilities.getEnabledCapabilityNumbers({
						"CAPABILITY_SUPPORTS_EDP_PERSISTENT_ACTION_BAR_PLAY_BUTTON",
						"CAPABILITY_SUPPORTS_EDP_COMMUNITY_SECTION",
						"CAPABILITY_SUPPORTS_OPEN_EXPERIENCE_STORE_SEE_ALL_WITH_WEBVIEW_FALLBACK_ACTION",
						"CAPABILITY_SUPPORTS_PIN_SHORTCUT_ACTION"
					})
				})
			}
		} else nil else nil,
		enableTemplateCache = if fFlagSduiEdpClientTemplateCache then true else nil
	}, p2)
end