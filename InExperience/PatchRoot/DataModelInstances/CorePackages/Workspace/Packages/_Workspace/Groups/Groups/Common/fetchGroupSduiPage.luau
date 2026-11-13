local Parent = script:FindFirstAncestor("Groups").Parent
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local GetGroupSduiPageConfigModule = require(script.Parent.getGroupSduiPageConfig)
local Frozen = table.freeze({
	expanded = "GROUP_SIDEBAR_PRESENTATION_EXPANDED",
	compactTouch = "GROUP_SIDEBAR_PRESENTATION_COMPACT_TOUCH"
})
local Frozen1 = table.freeze({
	getDecodedResponse = function()
		return nil
	end
})

return function(p1, LoadTimer, p2, StaleTimeSec)
	-- upvalues: GetGroupSduiPageConfigModule (copy), Parent (copy), SduiSharedUtilitiesModule (copy), Frozen (copy), Frozen1 (copy)
	local Page = GetGroupSduiPageConfigModule.pages[p1.page]
	local Group = require(Parent.ServiceContractsProto).apppageplatform.groups[Page.protoModule]
	local GroupEntry = Group[`{Page.protoMessage}Request`]
	local config = {
		group_id = p1.groupId,
		client_capabilities = SduiSharedUtilitiesModule.SduiCapabilities.buildClientCapabilities(),
		cached_roblox_component_to_template_id = SduiSharedUtilitiesModule.getSduiTemplateStore().getCachedRobloxComponentToTemplateId(p1.surfaceKey)
	}
	
	if Page.hasPresentation then
		config.presentation = Frozen[p1.presentation or "expanded"]
	end
	local SduiApiStorePostConfigContentType = SduiSharedUtilitiesModule.SduiApiStorePostConfigContentType
	local NewGroupEntry = GroupEntry.new(config)
	
	return SduiSharedUtilitiesModule.getSduiApiStore().fetchIfNeeded({
		enableTemplateCache = true,
		responseType = SduiSharedUtilitiesModule.SduiResponseType.Protobuf,
		url = p1.url,
		surfaceKey = p1.surfaceKey,
		configKey = p1.configKey,
		loadTimer = LoadTimer,
		apiProto = Group[`{Page.protoMessage}Response`],
		postConfig = if Page.requestContentType == SduiApiStorePostConfigContentType.Proto then {
			contentType = SduiApiStorePostConfigContentType.Proto,
			protoMessage = GroupEntry,
			body = NewGroupEntry
		} else {
			contentType = SduiApiStorePostConfigContentType.Json,
			body = GroupEntry.jsonEncode(NewGroupEntry)
		},
		allowNoConfigsBuilt = Page.allowNoConfigsBuilt,
		cacheSingleEntryWithIdentifier = Page.cacheSingleEntryWithIdentifier,
		recoverFromError = if Page.keepsSavedPage then Frozen1 else nil,
		replaceOnFetch = Page.replacesSavedEntries,
		staleTimeSec = StaleTimeSec
	}, p2)
end