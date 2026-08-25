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
local var8 = localization.new(localizationService.RobloxLocaleId)

local function getLocalizedChannelTabLabels()
	-- upvalues: channelTabDisplayLabel (ref), var8 (ref)
	local localizationKeys = channelTabDisplayLabel.LocalizationKeys
	
	return {
		yourServer = var8:Format(localizationKeys.yourServer),
		moreServers = var8:Format(localizationKeys.moreServers),
		friends = var8:Format(localizationKeys.friends),
		system = var8:Format(localizationKeys.system),
		team = var8:Format(localizationKeys.team)
	}
end

return {
	type = "groupedListItem",
	fetch = function(_)
		-- upvalues: expChatSharedModule (ref), promiseModule (ref), fFlagExpChatUseMessagesStore (ref), expChatMessageHelpersModule (ref), var8 (ref), fFlagExpChatUseSharedChannelTabDisplayLabel (ref), channelTabDisplayLabel (ref), enrichMissingUsernames (ref), getChannelTabsStore (ref), getLocalizedChannelTabLabels (ref), fFlagExpChatUseChannelTabsStore (ref), playersService (ref)
		local store = expChatSharedModule.context.store
		
		if not store then
			return promiseModule.resolve({})
		end
		local var11, var12, var13
		local state = store:getState()
		local _ = nil
		local _ = nil
		local _ = nil
		
		if fFlagExpChatUseMessagesStore then
			local messagesStore = expChatSharedModule.context.messagesStore
			
			if not messagesStore then
				return promiseModule.resolve({})
			end
			var11 = messagesStore.getByMessageId(false) or {}
			var12 = messagesStore.getWindowMessagesInOrder(false) or {}
			var13 = messagesStore.getWindowMessagesInOrderByTabId(false) or {}
		else
			local messages = state and state.Messages
			
			if not messages then
				return promiseModule.resolve({})
			end
			var11 = messages.byMessageId or {}
			var12 = messages.windowMessagesInOrder or {}
			var13 = messages.windowMessagesInOrderByTabId or {}
		end
		local translator = expChatSharedModule.context.translator
		
		if expChatMessageHelpersModule.areChannelTabsEnabled() then
			local v_1
			local var22 = if state.TextChannels then state.TextChannels.allTextChannels else {}
			local allChannelTabs = getChannelTabsStore(false).getChannelTabsState(false).allChannelTabs
			local var23 = if fFlagExpChatUseSharedChannelTabDisplayLabel then getLocalizedChannelTabLabels() else nil
			local t = {}
			local t_1 = {}
			
			for i, v in pairs(var13) do
				v_1 = expChatMessageHelpersModule.collectItems(var11, v)
				
				if #v_1 > 0 then
					local var31
					local _ = nil
					
					if fFlagExpChatUseSharedChannelTabDisplayLabel then
						local var28
						local _ = nil
						
						if fFlagExpChatUseChannelTabsStore then
							local var27 = allChannelTabs[i]
							var28 = if var27 then var27.type else nil
						else
							local allChannelTabs_1 = state.ChannelTabs and state.ChannelTabs.allChannelTabs
							local var30 = allChannelTabs_1 and allChannelTabs_1[i]
							var28 = if var30 then var30.Type else nil
						end
						var31 = if var28 then channelTabDisplayLabel.getDisplayLabel(var28, i, var22[i], playersService.LocalPlayer, var23) else i
					else
						var31 = expChatMessageHelpersModule.localizeString(translator, expChatMessageHelpersModule.formatChannelLabel(i, var22[i]))
					end
					table.insert(t_1, i)
					t[i] = { id = i, label = var31, items = v_1 }
				end
			end
			table.sort(t_1, function(p0, p1)
				-- upvalues: allChannelTabs (ref), expChatMessageHelpersModule (copy)
				local var32 = allChannelTabs[p0]
				local var33 = allChannelTabs[p1]
				
				return if var32 and var33 then var32.tabIndex < var33.tabIndex elseif var32 then true elseif var33 then false else p0 == expChatMessageHelpersModule.CHANNEL_GENERAL or (if p1 == expChatMessageHelpersModule.CHANNEL_GENERAL then false else p0 < p1)
			end)
			local t_2 = {}
			
			for i_1, v_1 in ipairs(t_1) do
				table.insert(t_2, t[v_1])
			end
			return enrichMissingUsernames(t_2)
		else
			local var15 = var12
			local t = {}
			local t_1 = {}
			
			for i, v in ipairs(var15) do
				local var21 = var11[v]
				
				if var21 then
					if var21.textChannel then
						table.insert(t, v)
					else
						table.insert(t_1, v)
					end
				end
			end
			local t_2 = {}
			local var19 = expChatMessageHelpersModule.collectItems(var11, t)
			expChatMessageHelpersModule.annotateWhisperItems(var19, var11, var8:Format("Feature.ReportAbuse.Label.SentPrivately"))
			
			if #var19 > 0 then
				table.insert(t_2, {
					id = expChatMessageHelpersModule.CHANNEL_GENERAL,
					label = var8:Format(if fFlagExpChatUseSharedChannelTabDisplayLabel then channelTabDisplayLabel.LocalizationKeys.yourServer else "CoreScripts.TextChat.ChannelTabs.Here"),
					items = var19
				})
			end
			local var20 = expChatMessageHelpersModule.collectItems(var11, t_1)
			
			if #var20 > 0 then
				table.insert(t_2, {
					id = expChatMessageHelpersModule.CHANNEL_GLOBAL,
					label = var8:Format("CoreScripts.TextChat.ChannelTabs.Global2"),
					items = var20
				})
			end
			return enrichMissingUsernames(t_2)
		end
	end
}