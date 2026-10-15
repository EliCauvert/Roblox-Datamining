local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local dateTime = require(parent.Time).DateTime
local reactModule = require(parent.React)
local signalsExperimentalModule = require(parent.SignalsExperimental)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useStore = require(parent.RoactUtils).Hooks.RoactRodux.useStore
local roactPaginator = require(appChat.SocialLibraries).RoactPaginator
local conversationRoduxSeedModule = require(appChat.Utils.ConversationRoduxSeed)
local getConversationStoreModule = require(appChat.Stores.GetConversationStore)
local getConversationViewModelStoreModule = require(appChat.Stores.GetConversationViewModelStore)
local receivedConversationModule = require(appChat.Conversations.Actions.ReceivedConversation)
local fetchLatestConversationDetailsModule = require(appChat.Conversations.Thunks.fetchLatestConversationDetails)
local getConversationTimestampModule = require(appChat.Utils.getConversationTimestamp)
local getConversationTitleModule = require(appChat.Conversations.getConversationTitle)
local getLastMessageContentModule = require(appChat.Conversations.getLastMessageContent)
local getOtherParticipantsModule = require(appChat.Conversations.getOtherParticipants)
local searchIntroducedConversationIdsModule = require(appChat.Stores.searchIntroducedConversationIds)
local useConversationSearchModule = require(appChat.Hooks.useConversationSearch)
local useChatSearchResultsTelemetryModule = require(appChat.Hooks.useChatSearchResultsTelemetry)
local fFlagAppChatSearchSessionTelemetryModule = require(appChat.Flags.FFlagAppChatSearchSessionTelemetry)
local fFlagAppChatDerivedConversationLatestActivityModule = require(appChat.Flags.FFlagAppChatDerivedConversationLatestActivity)
local t = {}
local t_1 = {}

local function _(p1)
	-- upvalues: dateTime (ref)
	return if typeof(p1) == "DateTime" then dateTime.fromUnixTimestamp(p1.UnixTimestamp) elseif type(p1) == "table" and typeof(p1.dateTime) == "DateTime" then p1 else nil
end

local function getInboxRowFields(p1)
	-- upvalues: getConversationStoreModule (ref), getConversationViewModelStoreModule (ref), dateTime (ref)
	if getConversationStoreModule(false).getConversation(p1, false) == nil then
		return nil, nil
	end
	local var1 = getConversationViewModelStoreModule(false)
	local var2 = var1.getUnixTime(p1)(false)
	
	return if var2 ~= nil then nil else dateTime.fromUnixTimestamp(var2), var1.getSubtitle(p1)(false)
end

local function buildSearchItemList(p1, p2, p3)
	-- upvalues: cryoModule (ref), getOtherParticipantsModule (ref), dateTime (ref), getLastMessageContentModule (ref), fFlagAppChatDerivedConversationLatestActivityModule (ref), getInboxRowFields (ref), getConversationTitleModule (ref), getConversationTimestampModule (ref)
	local t = {}
	
	for i, v in p1 do
		local var1 = if v.otherParticipants == nil then cryoModule.Dictionary.join(v, { otherParticipants = getOtherParticipantsModule(v, p2) }) else v
		
		if p3 or var1.conversationType ~= "MultiUserConversation" then
			local lastUpdated = var1.lastUpdated
			local var2 = if typeof(lastUpdated) == "DateTime" then dateTime.fromUnixTimestamp(lastUpdated.UnixTimestamp) elseif type(lastUpdated) == "table" and typeof(lastUpdated.dateTime) == "DateTime" then lastUpdated else nil
			lastUpdated = getLastMessageContentModule(var1) or ""
			
			if fFlagAppChatDerivedConversationLatestActivityModule then
				local var3, var4 = getInboxRowFields(var1.id)
				var2 = var3 or var2
				lastUpdated = var4 or lastUpdated
			end
			table.insert(t, cryoModule.Dictionary.join(var1, {
				isSearchResult = true,
				title = getConversationTitleModule(var1),
				lastMessageContent = lastUpdated,
				shortRelativeTime = var2 and getConversationTimestampModule(var2),
				longRelativeTime = var2 and var2:GetLongRelativeTime(),
				unixTime = var2 and var2:GetUnixTimestamp()
			}))
		end
	end
	return t
end

return function(p4, p5, p6, p7, p8)
	-- upvalues: useConversationSearchModule (ref), useDispatch (ref), useStore (ref), reactModule (ref), getConversationStoreModule (ref), searchIntroducedConversationIdsModule (ref), signalsExperimentalModule (ref), receivedConversationModule (ref), conversationRoduxSeedModule (ref), fetchLatestConversationDetailsModule (ref), t (ref), buildSearchItemList (ref), fFlagAppChatSearchSessionTelemetryModule (ref), useChatSearchResultsTelemetryModule (ref), t_1 (ref), roactPaginator (ref)
	local var5 = useConversationSearchModule(p4, p5)
	local var6 = useDispatch()
	local var7 = useStore()
	local var8 = reactModule.useCallback(function(p9)
		-- upvalues: getConversationStoreModule (copy), var7 (ref), searchIntroducedConversationIdsModule (copy), signalsExperimentalModule (copy), var6 (ref), receivedConversationModule (copy), conversationRoduxSeedModule (copy), fetchLatestConversationDetailsModule (copy), p8 (ref)
		local conversation = getConversationStoreModule(false).getConversation(p9, false)
		local var9 = conversation ~= nil and var7:getState().ChatAppReducer.Conversations[p9] == nil
		
		if var9 or searchIntroducedConversationIdsModule.has(p9) then
			signalsExperimentalModule.batch(function()
				-- upvalues: var9 (ref), var6 (copy), receivedConversationModule (copy), conversationRoduxSeedModule (copy), conversation (ref), searchIntroducedConversationIdsModule (copy), p9 (ref)
				if var9 then
					var6(receivedConversationModule(conversationRoduxSeedModule.normalizeStoreConversationForRodux(conversation)))
				end
				searchIntroducedConversationIdsModule.remove(p9)
			end)
			
			if not conversationRoduxSeedModule.isFriendsPlaceholderConversationId(p9) then
				var6(fetchLatestConversationDetailsModule(p9))
			end
		end
		if p8 ~= nil then
			p8(p9)
		end
	end, { var6, p8, var7 })
	local var9 = reactModule.useMemo(function()
		-- upvalues: var5 (ref), t (copy), buildSearchItemList (copy), p6 (ref), p7 (ref)
		return if var5.isActive then buildSearchItemList(var5.items, p6, p7) else t
	end, { var5.isActive, var5.items, p7, p6 })
	
	if fFlagAppChatSearchSessionTelemetryModule then
		useChatSearchResultsTelemetryModule(var5, #var9)
	end
	if var5.isActive then
		return true, {
			itemList = var9,
			conversationsIsFetching = var5.isFetching,
			isSearchAwaitingResults = var5.isAwaitingResults,
			oldestConversationIsFetched = var5.nextCursor == nil,
			[roactPaginator.loadNext] = function()
				-- upvalues: var5 (ref)
				var5.loadNext()
			end,
			isSearchActive = true,
			navigateToConversation = var8
		}
	end
	return false, t_1
end