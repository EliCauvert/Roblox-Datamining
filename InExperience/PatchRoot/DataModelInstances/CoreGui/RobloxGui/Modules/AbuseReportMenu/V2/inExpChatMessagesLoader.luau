local corePackagesService = game:GetService("CorePackages")
local localizationService = game:GetService("LocalizationService")
local playersService = game:GetService("Players")
local expChatModule = require(corePackagesService.Workspace.Packages.ExpChat)
local expChatSharedModule = require(corePackagesService.Workspace.Packages.ExpChatShared)
local localization = require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization
local promiseModule = require(corePackagesService.Packages.Promise)
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local expChatMessageHelpersModule = require(script.Parent.ExpChatMessageHelpers)
local enrichMissingUsernames = require(script.Parent.inExpChatMessagesLoaderUsernameEnrichment).enrichMissingUsernames
local channelTabDisplayLabel = expChatSharedModule.ChannelTabDisplayLabel
local getChannelTabsStore = expChatModule.Stores.GetChannelTabsStore
local fFlagExpChatUseChannelTabsStore = sharedFlagsModule.FFlagExpChatUseChannelTabsStore
local fFlagExpChatUseMessagesStore = sharedFlagsModule.FFlagExpChatUseMessagesStore
local fFlagExpChatUseSharedChannelTabDisplayLabel = sharedFlagsModule.FFlagExpChatUseSharedChannelTabDisplayLabel
local var1 = localization.new(localizationService.RobloxLocaleId)

local function getLocalizedChannelTabLabels()
	-- upvalues: channelTabDisplayLabel (ref), var1 (ref)
	local localizationKeys = channelTabDisplayLabel.LocalizationKeys
	
	return {
		yourServer = var1:Format(localizationKeys.yourServer),
		moreServers = var1:Format(localizationKeys.moreServers),
		friends = var1:Format(localizationKeys.friends),
		system = var1:Format(localizationKeys.system),
		team = var1:Format(localizationKeys.team)
	}
end

return {
	type = "groupedListItem",
	fetch = function(_)
		-- upvalues: expChatSharedModule (ref), promiseModule (ref), fFlagExpChatUseMessagesStore (ref), expChatMessageHelpersModule (ref), var1 (ref), fFlagExpChatUseSharedChannelTabDisplayLabel (ref), channelTabDisplayLabel (ref), enrichMissingUsernames (ref), getChannelTabsStore (ref), getLocalizedChannelTabLabels (ref), fFlagExpChatUseChannelTabsStore (ref), playersService (ref)
		local store = expChatSharedModule.context.store
		
		if not store then
			return promiseModule.resolve({})
		end
		local var2, var3, var4
		local state = store:getState()
		local _ = nil
		local _ = nil
		local _ = nil
		
		if fFlagExpChatUseMessagesStore then
			local messagesStore = expChatSharedModule.context.messagesStore
			
			if not messagesStore then
				return promiseModule.resolve({})
			end
			var2 = messagesStore.getByMessageId(false) or {}
			var3 = messagesStore.getWindowMessagesInOrder(false) or {}
			var4 = messagesStore.getWindowMessagesInOrderByTabId(false) or {}
		else
			local messages = state and state.Messages
			
			if not messages then
				return promiseModule.resolve({})
			end
			var2 = messages.byMessageId or {}
			var3 = messages.windowMessagesInOrder or {}
			var4 = messages.windowMessagesInOrderByTabId or {}
		end
		local translator = expChatSharedModule.context.translator
		
		if expChatMessageHelpersModule.areChannelTabsEnabled() then
			local v_1
			local var5 = if state.TextChannels then state.TextChannels.allTextChannels else {}
			local allChannelTabs = getChannelTabsStore(false).getChannelTabsState(false).allChannelTabs
			local var6 = if fFlagExpChatUseSharedChannelTabDisplayLabel then getLocalizedChannelTabLabels() else nil
			local t = {}
			local t_1 = {}
			
			for i, v in pairs(var4) do
				v_1 = expChatMessageHelpersModule.collectItems(var2, v)
				
				if #v_1 > 0 then
					local var7
					local _ = nil
					
					if fFlagExpChatUseSharedChannelTabDisplayLabel then
						local var8
						local _ = nil
						
						if fFlagExpChatUseChannelTabsStore then
							local var9 = allChannelTabs[i]
							var8 = if var9 then var9.type else nil
						else
							local allChannelTabs_1 = state.ChannelTabs and state.ChannelTabs.allChannelTabs
							local var10 = allChannelTabs_1 and allChannelTabs_1[i]
							var8 = if var10 then var10.Type else nil
						end
						var7 = if var8 then channelTabDisplayLabel.getDisplayLabel(var8, i, var5[i], playersService.LocalPlayer, var6) else i
					else
						var7 = expChatMessageHelpersModule.localizeString(translator, expChatMessageHelpersModule.formatChannelLabel(i, var5[i]))
					end
					table.insert(t_1, i)
					t[i] = { id = i, label = var7, items = v_1 }
				end
			end
			table.sort(t_1, function(p1, p2)
				-- upvalues: allChannelTabs (ref), expChatMessageHelpersModule (copy)
				local var11 = allChannelTabs[p1]
				local var12 = allChannelTabs[p2]
				
				return if var11 and var12 then var11.tabIndex < var12.tabIndex elseif var11 then true elseif var12 then false else p1 == expChatMessageHelpersModule.CHANNEL_GENERAL or (if p2 == expChatMessageHelpersModule.CHANNEL_GENERAL then false else p1 < p2)
			end)
			local t_2 = {}
			
			for i_1, v_1 in ipairs(t_1) do
				table.insert(t_2, t[v_1])
			end
			return enrichMissingUsernames(t_2)
		else
			local var11 = var3
			local t = {}
			local t_1 = {}
			
			for i, v in ipairs(var11) do
				local var12 = var2[v]
				
				if var12 then
					if var12.textChannel then
						table.insert(t, v)
					else
						table.insert(t_1, v)
					end
				end
			end
			local t_2 = {}
			local var13 = expChatMessageHelpersModule.collectItems(var2, t)
			expChatMessageHelpersModule.annotateWhisperItems(var13, var2, var1:Format("Feature.ReportAbuse.Label.SentPrivately"))
			
			if #var13 > 0 then
				table.insert(t_2, {
					id = expChatMessageHelpersModule.CHANNEL_GENERAL,
					label = var1:Format(if fFlagExpChatUseSharedChannelTabDisplayLabel then channelTabDisplayLabel.LocalizationKeys.yourServer else "CoreScripts.TextChat.ChannelTabs.Here"),
					items = var13
				})
			end
			local var14 = expChatMessageHelpersModule.collectItems(var2, t_1)
			
			if #var14 > 0 then
				table.insert(t_2, {
					id = expChatMessageHelpersModule.CHANNEL_GLOBAL,
					label = var1:Format("CoreScripts.TextChat.ChannelTabs.Global2"),
					items = var14
				})
			end
			return enrichMissingUsernames(t_2)
		end
	end
}