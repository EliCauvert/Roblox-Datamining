local corePackagesService = game:GetService("CorePackages")
local localizationService = game:GetService("LocalizationService")
local expChatModule = require(corePackagesService.Workspace.Packages.ExpChat)
local expChatSharedModule = require(corePackagesService.Workspace.Packages.ExpChatShared)
local localization = require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization
local promiseModule = require(corePackagesService.Packages.Promise)
local expChatMessageHelpersModule = require(script.Parent.ExpChatMessageHelpers)
local enrichMissingUsernames = require(script.Parent.inExpChatMessagesLoaderUsernameEnrichment).enrichMissingUsernames
local getChannelTabsStore = expChatModule.Stores.GetChannelTabsStore
local fFlagExpChatUseMessagesStore = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagExpChatUseMessagesStore
local var6 = localization.new(localizationService.RobloxLocaleId)

return {
	type = "groupedListItem",
	fetch = function(_) --[[ line: 23 ]]
		-- upvalues: expChatSharedModule (ref), promiseModule (ref), fFlagExpChatUseMessagesStore (ref), expChatMessageHelpersModule (ref), var6 (ref), enrichMissingUsernames (ref), getChannelTabsStore (ref)
		local store = expChatSharedModule.context.store
		
		if not store then
			return promiseModule.resolve({})
		end
		local var8, var9, var10
		local state = store:getState()
		local _ = nil
		local _ = nil
		local _ = nil
		
		if fFlagExpChatUseMessagesStore then
			local messagesStore = expChatSharedModule.context.messagesStore
			
			if not messagesStore then
				return promiseModule.resolve({})
			end
			var8 = messagesStore.getByMessageId(false) or {}
			var9 = messagesStore.getWindowMessagesInOrder(false) or {}
			var10 = messagesStore.getWindowMessagesInOrderByTabId(false) or {}
		else
			local messages = state and state.Messages
			
			if not messages then
				return promiseModule.resolve({})
			end
			var8 = messages.byMessageId or {}
			var9 = messages.windowMessagesInOrder or {}
			var10 = messages.windowMessagesInOrderByTabId or {}
		end
		local translator = expChatSharedModule.context.translator
		
		if expChatMessageHelpersModule.areChannelTabsEnabled() then
			local var19 = if state.TextChannels then state.TextChannels.allTextChannels else {}
			local allChannelTabs = getChannelTabsStore(false).getChannelTabsState(false).allChannelTabs
			local t = {}
			local t_1 = {}
			
			for i, v in pairs(var10) do
				local var23 = expChatMessageHelpersModule.collectItems(var8, v)
				
				if #var23 > 0 then
					local var24 = expChatMessageHelpersModule.formatChannelLabel(i, var19[i])
					table.insert(t_1, i)
					t[i] = {
						id = i,
						label = expChatMessageHelpersModule.localizeString(translator, var24),
						items = var23
					}
				end
			end
			table.sort(t_1, function(p0, p1) --[[ line: 124 ]]
				-- upvalues: allChannelTabs (ref), expChatMessageHelpersModule (copy)
				local var25 = allChannelTabs[p0]
				local var26 = allChannelTabs[p1]
				
				return if var25 and var26 then var25.tabIndex < var26.tabIndex elseif var25 then true elseif var26 then false else p0 == expChatMessageHelpersModule.CHANNEL_GENERAL or (if p1 == expChatMessageHelpersModule.CHANNEL_GENERAL then false else p0 < p1)
			end)
			local t_2 = {}
			
			for i_1, v_1 in ipairs(t_1) do
				table.insert(t_2, t[v_1])
			end
			return enrichMissingUsernames(t_2)
		else
			local var12 = var9
			local t = {}
			local t_1 = {}
			
			for i, v in ipairs(var12) do
				local var18 = var8[v]
				
				if var18 then
					if var18.textChannel then
						table.insert(t, v)
					else
						table.insert(t_1, v)
					end
				end
			end
			local t_2 = {}
			local var16 = expChatMessageHelpersModule.collectItems(var8, t)
			expChatMessageHelpersModule.annotateWhisperItems(var16, var8, var6:Format("Feature.ReportAbuse.Label.SentPrivately"))
			
			if #var16 > 0 then
				table.insert(t_2, {
					id = expChatMessageHelpersModule.CHANNEL_GENERAL,
					label = var6:Format("CoreScripts.TextChat.ChannelTabs.Here"),
					items = var16
				})
			end
			local var17 = expChatMessageHelpersModule.collectItems(var8, t_1)
			
			if #var17 > 0 then
				table.insert(t_2, {
					id = expChatMessageHelpersModule.CHANNEL_GLOBAL,
					label = var6:Format("CoreScripts.TextChat.ChannelTabs.Global2"),
					items = var17
				})
			end
			return enrichMissingUsernames(t_2)
		end
	end
}