local CorePackages = game:GetService("CorePackages")
local ExpChatSharedModule = require(CorePackages.Workspace.Packages.ExpChatShared)
local PromiseModule = require(CorePackages.Packages.Promise)
local ExpChatMessageHelpersModule = require(script.Parent.ExpChatMessageHelpers)
local EnrichMissingUsernamesFunction = require(script.Parent.inExpChatMessagesLoaderUsernameEnrichment).enrichMissingUsernames
local GetChannelTabsStoreFunction = require(CorePackages.Workspace.Packages.ExpChat).Stores.GetChannelTabsStore
local FFlagExpChatUseMessagesStore = require(CorePackages.Workspace.Packages.SharedFlags).FFlagExpChatUseMessagesStore
local NewResult = require(CorePackages.Workspace.Packages.InExperienceLocales).Localization.new(game:GetService("LocalizationService").RobloxLocaleId)

return {
	type = "groupedListItem",
	fetch = function(_)
		-- upvalues: ExpChatSharedModule (copy), PromiseModule (copy), FFlagExpChatUseMessagesStore (copy), ExpChatMessageHelpersModule (copy), NewResult (copy), EnrichMissingUsernamesFunction (copy), GetChannelTabsStoreFunction (copy)
		local Store = ExpChatSharedModule.context.store
		
		if not Store then
			return PromiseModule.resolve({})
		end
		local State = Store:getState()
		local WindowMessagesInOrder = nil
		local WindowMessagesInOrderByTabId = nil
		local ByMessageId = nil
		
		if FFlagExpChatUseMessagesStore then
			local MessagesStore = ExpChatSharedModule.context.messagesStore
			
			if not MessagesStore then
				return PromiseModule.resolve({})
			end
			ByMessageId = MessagesStore.getByMessageId(false) or {}
			WindowMessagesInOrder = MessagesStore.getWindowMessagesInOrder(false) or {}
			WindowMessagesInOrderByTabId = MessagesStore.getWindowMessagesInOrderByTabId(false) or {}
		else
			local Messages = State and State.Messages
			
			if not Messages then
				return PromiseModule.resolve({})
			end
			ByMessageId = Messages.byMessageId or {}
			WindowMessagesInOrder = Messages.windowMessagesInOrder or {}
			WindowMessagesInOrderByTabId = Messages.windowMessagesInOrderByTabId or {}
		end
		local Translator = ExpChatSharedModule.context.translator
		
		if ExpChatMessageHelpersModule.areChannelTabsEnabled() then
			local AllTextChannels = State.TextChannels and State.TextChannels.allTextChannels or {}
			local AllChannelTabs = GetChannelTabsStoreFunction(false).getChannelTabsState(false).allChannelTabs
			local t = {}
			local List2 = {}
			
			for Id, value1 in pairs(WindowMessagesInOrderByTabId) do
				local CollectItemsResult = ExpChatMessageHelpersModule.collectItems(ByMessageId, value1)
				
				if #CollectItemsResult > 0 then
					local FormatChannelLabelResult = ExpChatMessageHelpersModule.formatChannelLabel(Id, AllTextChannels[Id])
					table.insert(List2, Id)
					t[Id] = {
						id = Id,
						label = ExpChatMessageHelpersModule.localizeString(Translator, FormatChannelLabelResult),
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
					label = NewResult:Format("CoreScripts.TextChat.ChannelTabs.Here"),
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