local Parent = script:FindFirstAncestor("GameDetail").Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local SduiResponseType = SduiSharedUtilitiesModule.SduiResponseType
local GetSduiApiStoreFunction = SduiSharedUtilitiesModule.getSduiApiStore
local GetSduiTemplateStoreFunction = SduiSharedUtilitiesModule.getSduiTemplateStore
local SduiApiStorePostConfigContentType = SduiSharedUtilitiesModule.SduiApiStorePostConfigContentType
local SduiCapabilities = SduiSharedUtilitiesModule.SduiCapabilities
local GetExperienceDetailsUrlModule = require(script.Parent.getExperienceDetailsUrl)
local GetExperienceDetailsPageKeyModule = require(script.Parent.getExperienceDetailsPageKey)
local FFlagSduiEdpClientTemplateCache = require(Parent.SharedFlags).FFlagSduiEdpClientTemplateCache

return function(p1, LoadTimer, p2)
	-- upvalues: GetExperienceDetailsUrlModule (copy), Parent (copy), FFlagSduiEdpClientTemplateCache (copy), SduiCapabilities (copy), GetSduiTemplateStoreFunction (copy), AppPage (copy), SduiApiStorePostConfigContentType (copy), GetSduiApiStoreFunction (copy), SduiResponseType (copy), GetExperienceDetailsPageKeyModule (copy)
	local ServiceContractsProtoModule = require(Parent.ServiceContractsProto)
	local ExperienceDetailsPage = ServiceContractsProtoModule.apppageplatform.experiencedetails.experience_details_page
	local Config = if FFlagSduiEdpClientTemplateCache then {
		contentType = SduiApiStorePostConfigContentType.Proto,
		protoMessage = ExperienceDetailsPage.ExperienceDetailsPageRequest,
		body = {
			cached_roblox_component_to_template_id = GetSduiTemplateStoreFunction().getCachedRobloxComponentToTemplateId(AppPage.ExperienceDetail),
			client_capabilities = ServiceContractsProtoModule.apppageplatform.shared.client_capabilities.ClientCapabilities.new({
				enabled_capabilities = SduiCapabilities.getEnabledCapabilityNumbers({
					"CAPABILITY_SUPPORTS_EDP_PERSISTENT_ACTION_BAR_PLAY_BUTTON",
					"CAPABILITY_SUPPORTS_OPEN_EXPERIENCE_STORE_SEE_ALL_WITH_WEBVIEW_FALLBACK_ACTION"
				})
			})
		}
	} else nil
	GetSduiApiStoreFunction().fetchIfNeeded({
		responseType = SduiResponseType.Protobuf,
		url = GetExperienceDetailsUrlModule(p1),
		surfaceKey = AppPage.ExperienceDetail,
		configKey = GetExperienceDetailsPageKeyModule(p1),
		loadTimer = LoadTimer,
		apiProto = ExperienceDetailsPage.ExperienceDetailsPageResponse,
		postConfig = if FFlagSduiEdpClientTemplateCache then Config else nil,
		enableTemplateCache = if FFlagSduiEdpClientTemplateCache then true else nil
	}, p2)
end