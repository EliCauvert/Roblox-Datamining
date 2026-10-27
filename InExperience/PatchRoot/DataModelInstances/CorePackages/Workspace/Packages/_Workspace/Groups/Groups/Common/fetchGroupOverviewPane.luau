local Parent = script:FindFirstAncestor("Groups").Parent
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local _ = require(script.Parent.getGroupOverviewPaneConfig)

return function(p1, LoadTimer, p2)
	-- upvalues: Parent (copy), SduiSharedUtilitiesModule (copy)
	local GroupOverviewPage = require(Parent.ServiceContractsProto).apppageplatform.groups.group_overview_page
	
	return SduiSharedUtilitiesModule.getSduiApiStore().fetchIfNeeded({
		enableTemplateCache = true,
		allowNoConfigsBuilt = true,
		responseType = SduiSharedUtilitiesModule.SduiResponseType.Protobuf,
		url = p1.url,
		surfaceKey = p1.surfaceKey,
		configKey = p1.configKey,
		loadTimer = LoadTimer,
		apiProto = GroupOverviewPage.GroupOverviewPageResponse,
		postConfig = {
			contentType = SduiSharedUtilitiesModule.SduiApiStorePostConfigContentType.Proto,
			protoMessage = GroupOverviewPage.GroupOverviewPageRequest,
			body = {
				group_id = p1.groupId,
				client_capabilities = SduiSharedUtilitiesModule.SduiCapabilities.buildClientCapabilities(),
				cached_roblox_component_to_template_id = SduiSharedUtilitiesModule.getSduiTemplateStore().getCachedRobloxComponentToTemplateId(p1.surfaceKey)
			}
		}
	}, p2)
end