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
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagSduiEdpClientTemplateCache = SharedFlagsModule.FFlagSduiEdpClientTemplateCache
local FFlagSduiEdpTemplatePrewarm = SharedFlagsModule.FFlagSduiEdpTemplatePrewarm
local FFlagSduiAdvertiseRuntimeSupportSets = SharedFlagsModule.FFlagSduiAdvertiseRuntimeSupportSets
local FFlagInfoTableStableItemKeys = SharedFlagsModule.FFlagInfoTableStableItemKeys
local FFlagLuaAppEdpMomentVideo = SharedFlagsModule.FFlagLuaAppEdpMomentVideo

return function(p1, LoadTimer, p2)
	-- upvalues: GetExperienceDetailsUrlModule (copy), Parent (copy), FFlagSduiEdpClientTemplateCache (copy), FFlagSduiAdvertiseRuntimeSupportSets (copy), SduiCapabilities (copy), FFlagSduiEdpTemplatePrewarm (copy), FFlagLuaAppEdpMomentVideo (copy), FFlagInfoTableStableItemKeys (copy), GetSduiTemplateStoreFunction (copy), AppPage (copy), SduiApiStorePostConfigContentType (copy), GetSduiApiStoreFunction (copy), SduiResponseType (copy), GetExperienceDetailsPageKeyModule (copy)
	local ExperienceDetailsUrlModule = GetExperienceDetailsUrlModule(p1)
	local ServiceContractsProtoModule = require(Parent.ServiceContractsProto)
	local ExperienceDetailsPage = ServiceContractsProtoModule.apppageplatform.experiencedetails.experience_details_page
	local v1 = nil
	
	if FFlagSduiEdpClientTemplateCache then
		local ClientCapabilities = ServiceContractsProtoModule.apppageplatform.shared.client_capabilities.ClientCapabilities
		local ClientCapabilities1 = nil
		
		if FFlagSduiAdvertiseRuntimeSupportSets then
			ClientCapabilities1 = SduiCapabilities.buildClientCapabilities()
		else
			local EnabledCapabilityNumbers = nil
			if FFlagSduiEdpTemplatePrewarm then
				EnabledCapabilityNumbers = SduiCapabilities.getEnabledCapabilityNumbers((SduiCapabilities.getEnabledCapabilities()))
			else
				local List = {
					"CAPABILITY_SUPPORTS_EDP_PERSISTENT_ACTION_BAR_PLAY_BUTTON",
					"CAPABILITY_SUPPORTS_EDP_COMMUNITY_SECTION",
					"CAPABILITY_SUPPORTS_EDP_BUILD_TAG",
					"CAPABILITY_SUPPORTS_OPEN_EXPERIENCE_STORE_SEE_ALL_WITH_WEBVIEW_FALLBACK_ACTION",
					"CAPABILITY_SUPPORTS_PIN_SHORTCUT_ACTION",
					"CAPABILITY_SUPPORTS_SCALED_PLAY_BUTTON_AND_IMAGE_SIZES",
					"CAPABILITY_SUPPORTS_CONTAINER_QUERIES",
					"CAPABILITY_SUPPORTS_EDP_EARLY_ACCESS_UPSELL",
					if FFlagLuaAppEdpMomentVideo then "CAPABILITY_SUPPORTS_EDP_MEDIA_GALLERY_MOMENT_VIDEO" else nil
				}
				
				if FFlagInfoTableStableItemKeys then
					table.insert(List, "CAPABILITY_SUPPORTS_EDP_INFO_TABLE_STABLE_ITEM_KEYS")
				end
				EnabledCapabilityNumbers = SduiCapabilities.getEnabledCapabilityNumbers(List)
			end
			ClientCapabilities1 = ClientCapabilities.new({ enabled_capabilities = EnabledCapabilityNumbers })
		end
		v1 = {
			contentType = SduiApiStorePostConfigContentType.Proto,
			protoMessage = ExperienceDetailsPage.ExperienceDetailsPageRequest,
			body = {
				cached_roblox_component_to_template_id = GetSduiTemplateStoreFunction().getCachedRobloxComponentToTemplateId(AppPage.ExperienceDetail),
				client_capabilities = ClientCapabilities1
			}
		}
	end
	GetSduiApiStoreFunction().fetchIfNeeded({
		responseType = SduiResponseType.Protobuf,
		url = ExperienceDetailsUrlModule,
		surfaceKey = AppPage.ExperienceDetail,
		configKey = GetExperienceDetailsPageKeyModule(p1),
		loadTimer = LoadTimer,
		apiProto = ExperienceDetailsPage.ExperienceDetailsPageResponse,
		postConfig = if FFlagSduiEdpClientTemplateCache then v1 else nil,
		enableTemplateCache = if FFlagSduiEdpClientTemplateCache then true else nil
	}, p2)
end