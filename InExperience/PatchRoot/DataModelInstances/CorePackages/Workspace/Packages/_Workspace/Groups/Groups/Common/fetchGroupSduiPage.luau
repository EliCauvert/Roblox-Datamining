local Parent = script:FindFirstAncestor("Groups").Parent
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local _ = require(script.Parent.getGroupSduiPageConfig)
local Frozen = table.freeze({
	GroupSidebarSection = { "group_sidebar_section_page", "GroupSidebarSectionPage" }
})

return function(p1, LoadTimer, p2, StaleTimeSec)
	-- upvalues: Parent (copy), Frozen (copy), SduiSharedUtilitiesModule (copy)
	local ServiceContractsProtoModule = require(Parent.ServiceContractsProto)
	local Unpacked, Unpacked2 = table.unpack(Frozen[p1.surfaceKey])
	local Group = ServiceContractsProtoModule.apppageplatform.groups[Unpacked]
	local GroupEntry = Group[`{Unpacked2}Request`]
	
	return SduiSharedUtilitiesModule.getSduiApiStore().fetchIfNeeded({
		enableTemplateCache = true,
		responseType = SduiSharedUtilitiesModule.SduiResponseType.Protobuf,
		url = p1.url,
		surfaceKey = p1.surfaceKey,
		configKey = p1.configKey,
		loadTimer = LoadTimer,
		apiProto = Group[`{Unpacked2}Response`],
		postConfig = {
			contentType = SduiSharedUtilitiesModule.SduiApiStorePostConfigContentType.Json,
			body = GroupEntry.jsonEncode((GroupEntry.new({
				group_id = p1.groupId,
				client_capabilities = SduiSharedUtilitiesModule.SduiCapabilities.buildClientCapabilities(),
				cached_roblox_component_to_template_id = SduiSharedUtilitiesModule.getSduiTemplateStore().getCachedRobloxComponentToTemplateId(p1.surfaceKey)
			})))
		},
		staleTimeSec = StaleTimeSec
	}, p2)
end