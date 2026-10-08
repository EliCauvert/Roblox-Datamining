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
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagSduiEdpClientTemplateCache = sharedFlagsModule.FFlagSduiEdpClientTemplateCache
local fFlagSduiEdpTemplatePrewarm = sharedFlagsModule.FFlagSduiEdpTemplatePrewarm
local fFlagSduiAdvertiseRuntimeSupportSets = sharedFlagsModule.FFlagSduiAdvertiseRuntimeSupportSets
local fFlagInfoTableStableItemKeys = sharedFlagsModule.FFlagInfoTableStableItemKeys
local fFlagLuaAppEdpMomentVideo = sharedFlagsModule.FFlagLuaAppEdpMomentVideo

return function(p1, p2, p3)
	-- upvalues: getExperienceDetailsUrlModule (ref), parent (ref), fFlagSduiEdpClientTemplateCache (ref), fFlagSduiAdvertiseRuntimeSupportSets (ref), sduiCapabilities (ref), fFlagSduiEdpTemplatePrewarm (ref), fFlagLuaAppEdpMomentVideo (ref), fFlagInfoTableStableItemKeys (ref), getSduiTemplateStore (ref), appPage (ref), sduiApiStorePostConfigContentType (ref), getSduiApiStore (ref), sduiResponseType (ref), getExperienceDetailsPageKeyModule (ref)
	local var1 = getExperienceDetailsUrlModule(p1)
	local serviceContractsProtoModule = require(parent.ServiceContractsProto)
	local experienceDetailsPage = serviceContractsProtoModule.apppageplatform.experiencedetails.experience_details_page
	local t = nil
	
	if fFlagSduiEdpClientTemplateCache then
		local var2
		local clientCapabilities = serviceContractsProtoModule.apppageplatform.shared.client_capabilities.ClientCapabilities
		local _ = nil
		
		if fFlagSduiAdvertiseRuntimeSupportSets then
			var2 = sduiCapabilities.buildClientCapabilities()
		else
			local enabledCapabilityNumbers
			local _ = nil
			
			if fFlagSduiEdpTemplatePrewarm then
				enabledCapabilityNumbers = sduiCapabilities.getEnabledCapabilityNumbers(sduiCapabilities.getEnabledCapabilities())
			else
				local list = {
					"CAPABILITY_SUPPORTS_EDP_PERSISTENT_ACTION_BAR_PLAY_BUTTON",
					"CAPABILITY_SUPPORTS_EDP_COMMUNITY_SECTION",
					"CAPABILITY_SUPPORTS_EDP_BUILD_TAG",
					"CAPABILITY_SUPPORTS_OPEN_EXPERIENCE_STORE_SEE_ALL_WITH_WEBVIEW_FALLBACK_ACTION",
					"CAPABILITY_SUPPORTS_PIN_SHORTCUT_ACTION",
					"CAPABILITY_SUPPORTS_SCALED_PLAY_BUTTON_AND_IMAGE_SIZES",
					"CAPABILITY_SUPPORTS_CONTAINER_QUERIES",
					"CAPABILITY_SUPPORTS_EDP_EARLY_ACCESS_UPSELL",
					if fFlagLuaAppEdpMomentVideo then "CAPABILITY_SUPPORTS_EDP_MEDIA_GALLERY_MOMENT_VIDEO" else nil
				}
				
				if fFlagInfoTableStableItemKeys then
					table.insert(list, "CAPABILITY_SUPPORTS_EDP_INFO_TABLE_STABLE_ITEM_KEYS")
				end
				enabledCapabilityNumbers = sduiCapabilities.getEnabledCapabilityNumbers(list)
			end
			var2 = clientCapabilities.new({ enabled_capabilities = enabledCapabilityNumbers })
		end
		t = {
			contentType = sduiApiStorePostConfigContentType.Proto,
			protoMessage = experienceDetailsPage.ExperienceDetailsPageRequest,
			body = {
				cached_roblox_component_to_template_id = getSduiTemplateStore().getCachedRobloxComponentToTemplateId(appPage.ExperienceDetail),
				client_capabilities = var2
			}
		}
	end
	getSduiApiStore().fetchIfNeeded({
		responseType = sduiResponseType.Protobuf,
		url = var1,
		surfaceKey = appPage.ExperienceDetail,
		configKey = getExperienceDetailsPageKeyModule(p1),
		loadTimer = p2,
		apiProto = experienceDetailsPage.ExperienceDetailsPageResponse,
		postConfig = if fFlagSduiEdpClientTemplateCache then t else nil,
		enableTemplateCache = if fFlagSduiEdpClientTemplateCache then true else nil
	}, p3)
end