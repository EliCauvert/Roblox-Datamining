local corePackagesService = game:GetService("CorePackages")
local localizationService = game:GetService("LocalizationService")
local expChatModule = require(corePackagesService.Workspace.Packages.ExpChat)
local expChatSharedModule = require(corePackagesService.Workspace.Packages.ExpChatShared)
local localization = require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization
local promiseModule = require(corePackagesService.Packages.Promise)
local expChatMessageHelpersModule = require(script.Parent.ExpChatMessageHelpers)
local enrichMissingUsernames = require(script.Parent.inExpChatMessagesLoaderUsernameEnrichment).enrichMissingUsernames
local getChannelTabsStore = expChatModule.Stores.GetChannelTabsStore
local var6 = localization.new(localizationService.RobloxLocaleId)

return {
	type = "groupedListItem",
	fetch = function(_) --[[ line: 20 ]]
		-- upvalues: expChatSharedModule (ref), promiseModule (ref), expChatMessageHelpersModule (ref), var6 (ref), enrichMissingUsernames (ref), getChannelTabsStore (ref)
		local store = expChatSharedModule.context.store
		
		if not store then
			return promiseModule.resolve({})
		end
		local state = store:getState()
		local messages = state and state.Messages
		
		if not messages then
			return promiseModule.resolve({})
		end
		local byMessageId = messages.byMessageId or {}
		local translator = expChatSharedModule.context.translator
		
		if expChatMessageHelpersModule.areChannelTabsEnabled() then
			local windowMessagesInOrderByTabId = messages.windowMessagesInOrderByTabId or {}
			local var18 = if state.TextChannels then state.TextChannels.allTextChannels else {}
			local allChannelTabs = getChannelTabsStore(false).getChannelTabsState(false).allChannelTabs
			local t = {}
			local t_1 = {}
			
			for i, v in pairs(windowMessagesInOrderByTabId) do
				local var22 = expChatMessageHelpersModule.collectItems(byMessageId, v)
				
				if #var22 > 0 then
					local var23 = expChatMessageHelpersModule.formatChannelLabel(i, var18[i])
					table.insert(t_1, i)
					t[i] = {
						id = i,
						label = expChatMessageHelpersModule.localizeString(translator, var23),
						items = var22
					}
				end
			end
			table.sort(t_1, function(p0, p1) --[[ line: 105 ]]
				-- upvalues: allChannelTabs (ref), expChatMessageHelpersModule (copy)
				local var24 = allChannelTabs[p0]
				local var25 = allChannelTabs[p1]
				
				return if var24 and var25 then var24.tabIndex < var25.tabIndex elseif var24 then true elseif var25 then false else p0 == expChatMessageHelpersModule.CHANNEL_GENERAL or (if p1 == expChatMessageHelpersModule.CHANNEL_GENERAL then false else p0 < p1)
			end)
			local t_2 = {}
			
			for i_1, v_1 in ipairs(t_1) do
				table.insert(t_2, t[v_1])
			end
			return enrichMissingUsernames(t_2)
		else
			local windowMessagesInOrder = messages.windowMessagesInOrder or {}
			local t = {}
			local t_1 = {}
			
			for i, v in ipairs(windowMessagesInOrder) do
				local var16 = byMessageId[v]
				
				if var16 then
					if var16.textChannel then
						table.insert(t, v)
					else
						table.insert(t_1, v)
					end
				end
			end
			local t_2 = {}
			local var14 = expChatMessageHelpersModule.collectItems(byMessageId, t)
			expChatMessageHelpersModule.annotateWhisperItems(var14, byMessageId, var6:Format("Feature.ReportAbuse.Label.SentPrivately"))
			
			if #var14 > 0 then
				table.insert(t_2, {
					id = expChatMessageHelpersModule.CHANNEL_GENERAL,
					label = var6:Format("CoreScripts.TextChat.ChannelTabs.Here"),
					items = var14
				})
			end
			local var15 = expChatMessageHelpersModule.collectItems(byMessageId, t_1)
			
			if #var15 > 0 then
				table.insert(t_2, {
					id = expChatMessageHelpersModule.CHANNEL_GLOBAL,
					label = var6:Format("CoreScripts.TextChat.ChannelTabs.Global2"),
					items = var15
				})
			end
			return enrichMissingUsernames(t_2)
		end
	end
}