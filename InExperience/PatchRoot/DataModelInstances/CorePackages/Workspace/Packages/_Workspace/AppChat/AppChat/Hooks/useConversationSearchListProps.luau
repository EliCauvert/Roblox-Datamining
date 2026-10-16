local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local _DateTime = require(Parent.Time).DateTime
local ReactModule = require(Parent.React)
local SignalsExperimentalModule = require(Parent.SignalsExperimental)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseStoreFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useStore
local RoactPaginator = require(AppChat.SocialLibraries).RoactPaginator
local ConversationRoduxSeedModule = require(AppChat.Utils.ConversationRoduxSeed)
local GetConversationStoreModule = require(AppChat.Stores.GetConversationStore)
local GetConversationViewModelStoreModule = require(AppChat.Stores.GetConversationViewModelStore)
local ReceivedConversationModule = require(AppChat.Conversations.Actions.ReceivedConversation)
local FetchLatestConversationDetailsModule = require(AppChat.Conversations.Thunks.fetchLatestConversationDetails)
local GetConversationTimestampModule = require(AppChat.Utils.getConversationTimestamp)
local GetConversationTitleModule = require(AppChat.Conversations.getConversationTitle)
local GetLastMessageContentModule = require(AppChat.Conversations.getLastMessageContent)
local GetOtherParticipantsModule = require(AppChat.Conversations.getOtherParticipants)
local SearchIntroducedConversationIdsModule = require(AppChat.Stores.searchIntroducedConversationIds)
local UseConversationSearchModule = require(AppChat.Hooks.useConversationSearch)
local UseChatSearchResultsTelemetryModule = require(AppChat.Hooks.useChatSearchResultsTelemetry)
local FFlagAppChatSearchSessionTelemetryModule = require(AppChat.Flags.FFlagAppChatSearchSessionTelemetry)
local FFlagAppChatDerivedConversationLatestActivityModule = require(AppChat.Flags.FFlagAppChatDerivedConversationLatestActivity)
local t = {}
local t1 = {}

local function _(p1) --[[ Line: 32 | Named "toLuaDateTime" ]]
	-- upvalues: _DateTime (copy)
	return if typeof(p1) == "DateTime" then _DateTime.fromUnixTimestamp(p1.UnixTimestamp) elseif type(p1) == "table" and typeof(p1.dateTime) == "DateTime" then p1 else nil
end

local function getInboxRowFields(Id) --[[ Line: 43 ]]
	-- upvalues: GetConversationStoreModule (copy), GetConversationViewModelStoreModule (copy), _DateTime (copy)
	if GetConversationStoreModule(false).getConversation(Id, false) == nil then
		return nil, nil
	else
		local ConversationViewModelStoreModule = GetConversationViewModelStoreModule(false)
		local v1 = ConversationViewModelStoreModule.getUnixTime(Id)(false)
		
		return if v1 == nil then nil else _DateTime.fromUnixTimestamp(v1), ConversationViewModelStoreModule.getSubtitle(Id)(false)
	end
end

local function buildSearchItemList(Items, p1, p2) --[[ Line: 57 ]]
	-- upvalues: CryoModule (copy), GetOtherParticipantsModule (copy), _DateTime (copy), GetLastMessageContentModule (copy), FFlagAppChatDerivedConversationLatestActivityModule (copy), getInboxRowFields (copy), GetConversationTitleModule (copy), GetConversationTimestampModule (copy)
	local JoinResults = {}
	
	for _, item in Items do
		local JoinResult = if item.otherParticipants == nil then CryoModule.Dictionary.join(item, { otherParticipants = GetOtherParticipantsModule(item, p1) }) else item
		
		if p2 or JoinResult.conversationType ~= "MultiUserConversation" then
			local LastUpdated = JoinResult.lastUpdated
			local FromUnixTimestampResult = if typeof(LastUpdated) == "DateTime" then _DateTime.fromUnixTimestamp(LastUpdated.UnixTimestamp) elseif type(LastUpdated) == "table" and typeof(LastUpdated.dateTime) == "DateTime" then LastUpdated else nil
			local LastMessageContentModule = GetLastMessageContentModule(JoinResult) or ""
			
			if FFlagAppChatDerivedConversationLatestActivityModule then
				local InboxRowFields, InboxRowFields2 = getInboxRowFields(JoinResult.id)
				FromUnixTimestampResult = InboxRowFields or FromUnixTimestampResult
				LastMessageContentModule = InboxRowFields2 or LastMessageContentModule
			end
			table.insert(JoinResults, CryoModule.Dictionary.join(JoinResult, {
				isSearchResult = true,
				title = GetConversationTitleModule(JoinResult),
				lastMessageContent = LastMessageContentModule,
				shortRelativeTime = FromUnixTimestampResult and GetConversationTimestampModule(FromUnixTimestampResult),
				longRelativeTime = FromUnixTimestampResult and FromUnixTimestampResult:GetLongRelativeTime(),
				unixTime = FromUnixTimestampResult and FromUnixTimestampResult:GetUnixTimestamp()
			}))
		end
	end
	return JoinResults
end

return function(p3, p4, p5, p6, Callback) --[[ Line: 103 | Named "useConversationSearchListProps" ]]
	-- upvalues: UseConversationSearchModule (copy), UseDispatchFunction (copy), UseStoreFunction (copy), ReactModule (copy), GetConversationStoreModule (copy), SearchIntroducedConversationIdsModule (copy), SignalsExperimentalModule (copy), ReceivedConversationModule (copy), ConversationRoduxSeedModule (copy), FetchLatestConversationDetailsModule (copy), t (copy), buildSearchItemList (copy), FFlagAppChatSearchSessionTelemetryModule (copy), UseChatSearchResultsTelemetryModule (copy), t1 (copy), RoactPaginator (copy)
	local UseConversationSearchModuleResult = UseConversationSearchModule(p3, p4)
	local UseDispatchResult = UseDispatchFunction()
	local UseStoreResult = UseStoreFunction()
	local UseResult = ReactModule.useCallback(function(p7) --[[ Line: 119 ]]
		-- upvalues: GetConversationStoreModule (upval), UseStoreResult (copy), SearchIntroducedConversationIdsModule (upval), SignalsExperimentalModule (upval), UseDispatchResult (copy), ReceivedConversationModule (upval), ConversationRoduxSeedModule (upval), FetchLatestConversationDetailsModule (upval), Callback (copy)
		local Conversation = GetConversationStoreModule(false).getConversation(p7, false)
		local State = UseStoreResult:getState()
		local NoConversation: boolean = Conversation ~= nil and State.ChatAppReducer.Conversations[p7] == nil
		
		if NoConversation or SearchIntroducedConversationIdsModule.has(p7) then
			SignalsExperimentalModule.batch(function() --[[ Line: 129 ]]
				-- upvalues: NoConversation (copy), UseDispatchResult (upval), ReceivedConversationModule (upval), ConversationRoduxSeedModule (upval), Conversation (copy), SearchIntroducedConversationIdsModule (upval), p7 (copy)
				if NoConversation then
					UseDispatchResult(ReceivedConversationModule(ConversationRoduxSeedModule.normalizeStoreConversationForRodux(Conversation)))
				end
				SearchIntroducedConversationIdsModule.remove(p7)
			end)
			
			if not ConversationRoduxSeedModule.isFriendsPlaceholderConversationId(p7) then
				UseDispatchResult(FetchLatestConversationDetailsModule(p7))
			end
		end
		if Callback ~= nil then
			Callback(p7)
		end
	end, { UseDispatchResult, Callback, UseStoreResult })
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 150 ]]
		-- upvalues: UseConversationSearchModuleResult (copy), t (upval), buildSearchItemList (upval), p5 (copy), p6 (copy)
		return if UseConversationSearchModuleResult.isActive then buildSearchItemList(UseConversationSearchModuleResult.items, p5, p6) else t
	end, {
		UseConversationSearchModuleResult.isActive,
		UseConversationSearchModuleResult.items,
		p6,
		p5
	})
	
	if FFlagAppChatSearchSessionTelemetryModule then
		UseChatSearchResultsTelemetryModule(UseConversationSearchModuleResult, #UseMemoResult)
	end
	if UseConversationSearchModuleResult.isActive then
		return true, {
			itemList = UseMemoResult,
			conversationsIsFetching = UseConversationSearchModuleResult.isFetching,
			isSearchAwaitingResults = UseConversationSearchModuleResult.isAwaitingResults,
			oldestConversationIsFetched = UseConversationSearchModuleResult.nextCursor == nil,
			[RoactPaginator.loadNext] = function() --[[ Line: 176 ]]
				-- upvalues: UseConversationSearchModuleResult (copy)
				UseConversationSearchModuleResult.loadNext()
			end,
			isSearchActive = true,
			navigateToConversation = UseResult
		}
	else
		return false, t1
	end
end