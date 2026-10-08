local groupAnnouncementsSdui = script:FindFirstAncestor("GroupAnnouncementsSdui")
local parent = groupAnnouncementsSdui.Parent
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local sduiResponseType = sduiSharedUtilitiesModule.SduiResponseType
local getSduiApiStore = sduiSharedUtilitiesModule.getSduiApiStore
local getSduiTemplateStore = sduiSharedUtilitiesModule.getSduiTemplateStore
local sduiLoadTimer = sduiSharedUtilitiesModule.SduiLoadTimer
local sduiApiStorePostConfigContentType = sduiSharedUtilitiesModule.SduiApiStorePostConfigContentType
local sduiCapabilities = sduiSharedUtilitiesModule.SduiCapabilities
local groupAnnouncementSduiConstantsModule = require(groupAnnouncementsSdui.GroupAnnouncementSduiConstants)
local getGroupPeekPageUrlModule = require(groupAnnouncementsSdui.getGroupPeekPageUrl)

return function(p1, p2)
	-- upvalues: getGroupPeekPageUrlModule (ref), groupAnnouncementSduiConstantsModule (ref), sduiLoadTimer (ref), parent (ref), sduiCapabilities (ref), getSduiTemplateStore (ref), getSduiApiStore (ref), sduiResponseType (ref), sduiApiStorePostConfigContentType (ref)
	local var1 = getGroupPeekPageUrlModule(p1)
	local configKey = groupAnnouncementSduiConstantsModule.getConfigKey(p1)
	local appPage = groupAnnouncementSduiConstantsModule.AppPage
	local var2 = sduiLoadTimer.createLoadTimer(appPage)
	local serviceContractsProtoModule = require(parent.ServiceContractsProto)
	local groupPeekPage = serviceContractsProtoModule.apppageplatform.groups.group_peek_page
	
	return getSduiApiStore().fetchIfNeeded({
		enableTemplateCache = true,
		responseType = sduiResponseType.ProtobufJson,
		url = var1,
		surfaceKey = appPage,
		configKey = configKey,
		loadTimer = var2,
		apiProto = groupPeekPage.GroupPeekPageResponse,
		postConfig = {
			contentType = sduiApiStorePostConfigContentType.Proto,
			protoMessage = groupPeekPage.GroupPeekPageRequest,
			body = {
				group_id = p1,
				client_capabilities = serviceContractsProtoModule.apppageplatform.shared.client_capabilities.ClientCapabilities.new({
					enabled_capabilities = sduiCapabilities.getEnabledCapabilityNumbers({ "CAPABILITY_SUPPORTS_GROUP_ANNOUNCEMENTS" })
				}),
				cached_roblox_component_to_template_id = getSduiTemplateStore().getCachedRobloxComponentToTemplateId(appPage)
			}
		}
	}, p2)
end