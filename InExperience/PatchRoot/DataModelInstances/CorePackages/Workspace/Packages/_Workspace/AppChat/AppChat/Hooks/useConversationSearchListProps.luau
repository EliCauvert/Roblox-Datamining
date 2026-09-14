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
local receivedConversationModule = require(appChat.Conversations.Actions.ReceivedConversation)
local fetchLatestConversationDetailsModule = require(appChat.Conversations.Thunks.fetchLatestConversationDetails)
local getConversationTimestampModule = require(appChat.Utils.getConversationTimestamp)
local getConversationTitleModule = require(appChat.Conversations.getConversationTitle)
local getLastMessageContentModule = require(appChat.Conversations.getLastMessageContent)
local getOtherParticipantsModule = require(appChat.Conversations.getOtherParticipants)
local searchIntroducedConversationIdsModule = require(appChat.Stores.searchIntroducedConversationIds)
local useConversationSearchModule = require(appChat.Hooks.useConversationSearch)
local t = {}
local t_1 = {}

local function _(p1)
	-- upvalues: dateTime (ref)
	return if typeof(p1) == "DateTime" then dateTime.fromUnixTimestamp(p1.UnixTimestamp) elseif type(p1) == "table" and typeof(p1.dateTime) == "DateTime" then p1 else nil
end

local function buildSearchItemList(p1, p2, p3)
	-- upvalues: cryoModule (ref), getOtherParticipantsModule (ref), dateTime (ref), getConversationTitleModule (ref), getLastMessageContentModule (ref), getConversationTimestampModule (ref)
	local t = {}
	
	for i, v in p1 do
		local var1 = if v.otherParticipants == nil then cryoModule.Dictionary.join(v, { otherParticipants = getOtherParticipantsModule(v, p2) }) else v
		
		if p3 or var1.conversationType ~= "MultiUserConversation" then
			local lastUpdated = var1.lastUpdated
			local var2 = if typeof(lastUpdated) == "DateTime" then dateTime.fromUnixTimestamp(lastUpdated.UnixTimestamp) elseif type(lastUpdated) == "table" and typeof(lastUpdated.dateTime) == "DateTime" then lastUpdated else nil
			table.insert(t, cryoModule.Dictionary.join(var1, {
				isSearchResult = true,
				title = getConversationTitleModule(var1),
				lastMessageContent = getLastMessageContentModule(var1) or "",
				shortRelativeTime = var2 and getConversationTimestampModule(var2),
				longRelativeTime = var2 and var2:GetLongRelativeTime(),
				unixTime = var2 and var2:GetUnixTimestamp()
			}))
		end
	end
	return t
end

return function(p4, p5, p6, p7, p8)
	-- upvalues: useConversationSearchModule (ref), useDispatch (ref), useStore (ref), reactModule (ref), getConversationStoreModule (ref), searchIntroducedConversationIdsModule (ref), signalsExperimentalModule (ref), receivedConversationModule (ref), conversationRoduxSeedModule (ref), fetchLatestConversationDetailsModule (ref), t (ref), buildSearchItemList (ref), t_1 (ref), roactPaginator (ref)
	local var3 = useConversationSearchModule(p4, p5)
	local var4 = useDispatch()
	local var5 = useStore()
	local var6 = reactModule.useCallback(function(p9)
		-- upvalues: getConversationStoreModule (copy), var5 (ref), searchIntroducedConversationIdsModule (copy), signalsExperimentalModule (copy), var4 (ref), receivedConversationModule (copy), conversationRoduxSeedModule (copy), fetchLatestConversationDetailsModule (copy), p8 (ref)
		local conversation = getConversationStoreModule(false).getConversation(p9, false)
		local var7 = conversation ~= nil and var5:getState().ChatAppReducer.Conversations[p9] == nil
		
		if var7 or searchIntroducedConversationIdsModule.has(p9) then
			signalsExperimentalModule.batch(function()
				-- upvalues: var7 (ref), var4 (copy), receivedConversationModule (copy), conversationRoduxSeedModule (copy), conversation (ref), searchIntroducedConversationIdsModule (copy), p9 (ref)
				if var7 then
					var4(receivedConversationModule(conversationRoduxSeedModule.normalizeStoreConversationForRodux(conversation)))
				end
				searchIntroducedConversationIdsModule.remove(p9)
			end)
			
			if not conversationRoduxSeedModule.isFriendsPlaceholderConversationId(p9) then
				var4(fetchLatestConversationDetailsModule(p9))
			end
		end
		if p8 ~= nil then
			p8(p9)
		end
	end, { var4, p8, var5 })
	local var7 = reactModule.useMemo(function()
		-- upvalues: var3 (ref), t (copy), buildSearchItemList (copy), p6 (ref), p7 (ref)
		return if var3.isActive then buildSearchItemList(var3.items, p6, p7) else t
	end, { var3.isActive, var3.items, p7, p6 })
	
	if var3.isActive then
		return true, {
			itemList = var7,
			conversationsIsFetching = var3.isFetching,
			oldestConversationIsFetched = var3.nextCursor == nil,
			[roactPaginator.loadNext] = function()
				-- upvalues: var3 (ref)
				var3.loadNext()
			end,
			isSearchActive = true,
			navigateToConversation = var6
		}
	end
	return false, t_1
end