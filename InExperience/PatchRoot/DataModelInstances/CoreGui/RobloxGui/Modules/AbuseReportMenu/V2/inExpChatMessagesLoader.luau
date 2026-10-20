local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local ExpChatSharedModule = require(CorePackages.Workspace.Packages.ExpChatShared)
local PromiseModule = require(CorePackages.Packages.Promise)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local ExpChatMessageHelpersModule = require(script.Parent.ExpChatMessageHelpers)
local EnrichMissingUsernamesFunction = require(script.Parent.inExpChatMessagesLoaderUsernameEnrichment).enrichMissingUsernames
local ChannelTabDisplayLabel = ExpChatSharedModule.ChannelTabDisplayLabel
local GetChannelTabsStoreFunction = require(CorePackages.Workspace.Packages.ExpChat).Stores.GetChannelTabsStore
local FFlagExpChatUseChannelTabsStore = SharedFlagsModule.FFlagExpChatUseChannelTabsStore
local FFlagExpChatUseSharedChannelTabDisplayLabel = SharedFlagsModule.FFlagExpChatUseSharedChannelTabDisplayLabel
local NewResult = require(CorePackages.Workspace.Packages.InExperienceLocales).Localization.new(game:GetService("LocalizationService").RobloxLocaleId)

local function getLocalizedChannelTabLabels()
	-- upvalues: ChannelTabDisplayLabel (copy), NewResult (copy)
	local LocalizationKeys = ChannelTabDisplayLabel.LocalizationKeys
	
	return {
		yourServer = NewResult:Format(LocalizationKeys.yourServer),
		moreServers = NewResult:Format(LocalizationKeys.moreServers),
		friends = NewResult:Format(LocalizationKeys.friends),
		system = NewResult:Format(LocalizationKeys.system),
		team = NewResult:Format(LocalizationKeys.team)
	}
end

return {
	type = "groupedListItem",
	fetch = function(_)
		-- upvalues: ExpChatSharedModule (copy), PromiseModule (copy), ExpChatMessageHelpersModule (copy), NewResult (copy), FFlagExpChatUseSharedChannelTabDisplayLabel (copy), ChannelTabDisplayLabel (copy), EnrichMissingUsernamesFunction (copy), GetChannelTabsStoreFunction (copy), getLocalizedChannelTabLabels (copy), FFlagExpChatUseChannelTabsStore (copy), Players (copy)
		local Store = ExpChatSharedModule.context.store
		
		if not Store then
			return PromiseModule.resolve({})
		end
		local State = Store:getState()
		local MessagesStore = ExpChatSharedModule.context.messagesStore
		
		if not MessagesStore then
			return PromiseModule.resolve({})
		end
		local ByMessageId = MessagesStore.getByMessageId(false) or {}
		local WindowMessagesInOrder = MessagesStore.getWindowMessagesInOrder(false) or {}
		local WindowMessagesInOrderByTabId = MessagesStore.getWindowMessagesInOrderByTabId(false) or {}
		local Translator = ExpChatSharedModule.context.translator
		
		if ExpChatMessageHelpersModule.areChannelTabsEnabled() then
			local AllTextChannels = State.TextChannels and State.TextChannels.allTextChannels or {}
			local AllChannelTabs = GetChannelTabsStoreFunction(false).getChannelTabsState(false).allChannelTabs
			local LocalizedChannelTabLabels = if FFlagExpChatUseSharedChannelTabDisplayLabel then getLocalizedChannelTabLabels() else nil
			local t = {}
			local List2 = {}
			
			for Id, value1 in pairs(WindowMessagesInOrderByTabId) do
				local CollectItemsResult = ExpChatMessageHelpersModule.collectItems(ByMessageId, value1)
				
				if #CollectItemsResult > 0 then
					local LocalizeStringResult = nil
					if FFlagExpChatUseSharedChannelTabDisplayLabel then
						local Type = nil
						if FFlagExpChatUseChannelTabsStore then
							local AllChannelTab = AllChannelTabs[Id]
							Type = if AllChannelTab then AllChannelTab.type else nil
						else
							local AllChannelTabs1 = State.ChannelTabs and State.ChannelTabs.allChannelTabs
							local AllChannelTab = AllChannelTabs1 and AllChannelTabs1[Id]
							Type = if AllChannelTab then AllChannelTab.Type else nil
						end
						LocalizeStringResult = if Type then ChannelTabDisplayLabel.getDisplayLabel(Type, Id, AllTextChannels[Id], Players.LocalPlayer, LocalizedChannelTabLabels) else Id
					else
						LocalizeStringResult = ExpChatMessageHelpersModule.localizeString(Translator, ExpChatMessageHelpersModule.formatChannelLabel(Id, AllTextChannels[Id]))
					end
					table.insert(List2, Id)
					t[Id] = {
						id = Id,
						label = LocalizeStringResult,
						items = CollectItemsResult
					}
				end
			end
			table.sort(List2, function(A, B): boolean
				-- upvalues: AllChannelTabs (copy), ExpChatMessageHelpersModule (upval)
				local AllChannelTab = AllChannelTabs[A]
				local AllChannelTab1 = AllChannelTabs[B]
				
				return if AllChannelTab and AllChannelTab1 then AllChannelTab.tabIndex < AllChannelTab1.tabIndex elseif AllChannelTab then true else not AllChannelTab1 and (A == ExpChatMessageHelpersModule.CHANNEL_GENERAL or B ~= ExpChatMessageHelpersModule.CHANNEL_GENERAL and A < B)
			end)
			local List = {}
			
			for _, value2 in ipairs(List2) do
				table.insert(List, t[value2])
			end
			return EnrichMissingUsernamesFunction(List)
		else
			local List = {}
			local List1 = {}
			
			for _, value in ipairs(WindowMessagesInOrder) do
				local ByMessageIdEntry = ByMessageId[value]
				
				if ByMessageIdEntry then
					if ByMessageIdEntry.textChannel then
						table.insert(List, value)
					else
						table.insert(List1, value)
					end
				end
			end
			local List3 = {}
			local CollectItemsResult = ExpChatMessageHelpersModule.collectItems(ByMessageId, List)
			ExpChatMessageHelpersModule.annotateWhisperItems(CollectItemsResult, ByMessageId, NewResult:Format("Feature.ReportAbuse.Label.SentPrivately"))
			
			if #CollectItemsResult > 0 then
				table.insert(List3, {
					id = ExpChatMessageHelpersModule.CHANNEL_GENERAL,
					label = NewResult:Format(if FFlagExpChatUseSharedChannelTabDisplayLabel then ChannelTabDisplayLabel.LocalizationKeys.yourServer else "CoreScripts.TextChat.ChannelTabs.Here"),
					items = CollectItemsResult
				})
			end
			local CollectItemsResult1 = ExpChatMessageHelpersModule.collectItems(ByMessageId, List1)
			
			if #CollectItemsResult1 > 0 then
				table.insert(List3, {
					id = ExpChatMessageHelpersModule.CHANNEL_GLOBAL,
					label = NewResult:Format("CoreScripts.TextChat.ChannelTabs.Global2"),
					items = CollectItemsResult1
				})
			end
			return EnrichMissingUsernamesFunction(List3)
		end
	end
}