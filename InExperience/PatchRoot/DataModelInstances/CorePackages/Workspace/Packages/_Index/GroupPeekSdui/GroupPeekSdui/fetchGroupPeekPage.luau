local GroupPeekSdui = script:FindFirstAncestor("GroupPeekSdui")
local Parent = GroupPeekSdui.Parent
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local SduiResponseType = SduiSharedUtilitiesModule.SduiResponseType
local GetSduiApiStoreFunction = SduiSharedUtilitiesModule.getSduiApiStore
local GetSduiTemplateStoreFunction = SduiSharedUtilitiesModule.getSduiTemplateStore
local SduiLoadTimer = SduiSharedUtilitiesModule.SduiLoadTimer
local SduiApiStorePostConfigContentType = SduiSharedUtilitiesModule.SduiApiStorePostConfigContentType
local SduiCapabilities = SduiSharedUtilitiesModule.SduiCapabilities
local GroupPeekSduiConstantsModule = require(GroupPeekSdui.GroupPeekSduiConstants)
local GetGroupPeekPageUrlModule = require(GroupPeekSdui.getGroupPeekPageUrl)

return function(Group_id, p1)
	-- upvalues: GetGroupPeekPageUrlModule (copy), GroupPeekSduiConstantsModule (copy), SduiLoadTimer (copy), Parent (copy), SduiCapabilities (copy), GetSduiTemplateStoreFunction (copy), GetSduiApiStoreFunction (copy), SduiResponseType (copy), SduiApiStorePostConfigContentType (copy)
	local AppPage = GroupPeekSduiConstantsModule.AppPage
	local ServiceContractsProtoModule = require(Parent.ServiceContractsProto)
	local GroupPeekPage = ServiceContractsProtoModule.apppageplatform.groups.group_peek_page
	
	return GetSduiApiStoreFunction().fetchIfNeeded({
		enableTemplateCache = true,
		staleTimeSec = 30,
		responseType = SduiResponseType.ProtobufJson,
		url = GetGroupPeekPageUrlModule(Group_id),
		surfaceKey = AppPage,
		configKey = GroupPeekSduiConstantsModule.getConfigKey(Group_id),
		loadTimer = SduiLoadTimer.createLoadTimer(AppPage),
		apiProto = GroupPeekPage.GroupPeekPageResponse,
		postConfig = {
			contentType = SduiApiStorePostConfigContentType.Proto,
			protoMessage = GroupPeekPage.GroupPeekPageRequest,
			body = {
				group_id = Group_id,
				client_capabilities = ServiceContractsProtoModule.apppageplatform.shared.client_capabilities.ClientCapabilities.new({
					enabled_capabilities = SduiCapabilities.getEnabledCapabilityNumbers({
						"CAPABILITY_SUPPORTS_GROUP_ANNOUNCEMENTS",
						"CAPABILITY_SUPPORTS_GROUP_CONTENT_REACTIONS"
					})
				}),
				cached_roblox_component_to_template_id = GetSduiTemplateStoreFunction().getCachedRobloxComponentToTemplateId(AppPage)
			}
		}
	}, p1)
end