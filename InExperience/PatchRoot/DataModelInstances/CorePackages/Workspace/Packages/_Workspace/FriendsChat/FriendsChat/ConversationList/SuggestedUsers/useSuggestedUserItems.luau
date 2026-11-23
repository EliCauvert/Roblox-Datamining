local FriendsChat = script:FindFirstAncestor("FriendsChat")
local Parent = FriendsChat.Parent
local ReactModule = require(Parent.React)
local DataHydrationModule = require(Parent.DataHydration)
local LocalizationModule = require(Parent.Localization)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local ConversationListTrailingItemsModule = require(Parent.AppChat.ConversationListTrailingItems)
local _ = require(script.Parent.SuggestedUserTypes)
local UseFriendRequestSuggestionsModule = require(script.Parent.useFriendRequestSuggestions)
local UseInServerSuggestionsModule = require(script.Parent.useInServerSuggestions)
local UseIsUnderFriendCountThresholdModule = require(script.Parent.useIsUnderFriendCountThreshold)
local FIntFriendsChatSuggestedUsersFriendRequestCapModule = require(FriendsChat.Flags.FIntFriendsChatSuggestedUsersFriendRequestCap)
local FIntFriendsChatSuggestedUsersInServerCapModule = require(FriendsChat.Flags.FIntFriendsChatSuggestedUsersInServerCap)
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization
local config = { sectionHeader = "Feature.AddFriends.Heading.AddFriends" }
local config1 = { skipFetch = true }
local Frozen = table.freeze({})

local function isSameUserIdSet(List, List1): boolean
	for i in List do
		if not List1[i] then
			return false
		end
	end
	for i1 in List1 do
		if not List[i1] then
			return false
		end
	end
	return true
end

local function useFriendUserIds(List)
	-- upvalues: ReactModule (copy), DataHydrationModule (copy), SignalsModule (copy), config1 (copy), isSameUserIdSet (copy), SignalsReactModule (copy)
	return SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: DataHydrationModule (upval), SignalsModule (upval), List (copy), config1 (upval), isSameUserIdSet (upval)
		local GetResult = DataHydrationModule.Friends.FriendsStore.get()
		
		return SignalsModule.createComputed(function(p1)
			-- upvalues: List (upval), GetResult (copy), config1 (upval)
			local t = {}
			
			for _, value in List do
				if GetResult.GetFriendshipStatus(value, config1).data(p1) == Enum.FriendStatus.Friend then
					t[value] = true
				end
			end
			return t
		end, isSameUserIdSet)
	end, { (table.concat(List, ",")) })))
end

local function useUserIdsSeenSinceMount(SenderUserIds)
	-- upvalues: ReactModule (copy)
	local UseRefResult = ReactModule.useRef({})
	local UseRefResult1 = ReactModule.useRef({})
	local Flag = false
	
	for _, senderUserId in SenderUserIds do
		if not UseRefResult.current[senderUserId] then
			UseRefResult.current[senderUserId] = true
			Flag = true
		end
	end
	if Flag then
		local List = {}
		
		for i in UseRefResult.current do
			table.insert(List, i)
		end
		table.sort(List)
		UseRefResult1.current = List
	end
	return UseRefResult1.current
end

local function getSortedUserIds(List)
	local t = {}
	
	for _, value in List do
		for _, value1 in value do
			t[value1.userId] = true
		end
	end
	local List1 = {}
	
	for i in t do
		table.insert(List1, i)
	end
	table.sort(List1)
	
	return List1
end

local function keepShownItemsInPlace(List, FriendRequest, p1, FIntFriendsChatSuggestedUsersInServerCapModule)
	local FIntFriendsChatSuggestedUsersInServerCapModule1 = FIntFriendsChatSuggestedUsersInServerCapModule or 1e999
	local t = {}
	
	for _, value in List do
		t[value.userId] = value
	end
	local List1 = {}
	local t1 = {}
	local Count = 0
	
	for _, value1 in FriendRequest do
		local Entry = t[value1.userId]
		
		if Entry and Count < FIntFriendsChatSuggestedUsersInServerCapModule1 then
			Count += 1
			table.insert(List1, Entry)
			t1[value1.userId] = true
		elseif p1[value1.userId] then
			table.insert(List1, value1)
			t1[value1.userId] = true
		end
	end
	for _, value2 in List do
		if FIntFriendsChatSuggestedUsersInServerCapModule1 <= Count then break end
		if not t1[value2.userId] then
			Count += 1
			table.insert(List1, value2)
		end
	end
	return List1
end

local function toSourceItems(UserIds)
	local List = {}
	
	for _, userId in UserIds do
		table.insert(List, { userId = userId })
	end
	return List
end

local function appendSuggestedUsers(List, p2, List1, Source)
	-- upvalues: ConversationListTrailingItemsModule (copy)
	local List2 = {}
	
	for _, value in List1 do
		if not p2[value.userId] then
			p2[value.userId] = true
			table.insert(List2, value)
			table.insert(List, ConversationListTrailingItemsModule.suggestedUser({
				userId = value.userId,
				source = Source,
				request = value.request
			}))
		end
	end
	return List2
end

return function(p3)
	-- upvalues: UseLocalizationFunction (copy), config (copy), UseIsUnderFriendCountThresholdModule (copy), ReactModule (copy), UseFriendRequestSuggestionsModule (copy), FIntFriendsChatSuggestedUsersFriendRequestCapModule (copy), useUserIdsSeenSinceMount (copy), UseInServerSuggestionsModule (copy), toSourceItems (copy), useFriendUserIds (copy), getSortedUserIds (copy), Frozen (copy), ConversationListTrailingItemsModule (copy), appendSuggestedUsers (copy), keepShownItemsInPlace (copy), FIntFriendsChatSuggestedUsersInServerCapModule (copy)
	local UseLocalizationResult = UseLocalizationFunction(config)
	local UseIsUnderFriendCountThresholdModuleResult = UseIsUnderFriendCountThresholdModule()
	local UseRefResult = ReactModule.useRef(false)
	local Current = UseRefResult.current or UseIsUnderFriendCountThresholdModuleResult
	local UseFriendRequestSuggestionsModuleResult = UseFriendRequestSuggestionsModule(FIntFriendsChatSuggestedUsersFriendRequestCapModule, Current)
	local UseUserIdsSeenSinceMountResult = useUserIdsSeenSinceMount(UseFriendRequestSuggestionsModuleResult.senderUserIds)
	local UseInServerSuggestionsModuleResult = UseInServerSuggestionsModule(UseUserIdsSeenSinceMountResult, Current)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: toSourceItems (upval), UseInServerSuggestionsModuleResult (copy)
		return (toSourceItems(UseInServerSuggestionsModuleResult.userIds))
	end, { UseInServerSuggestionsModuleResult.userIds })
	local UseRefResult1 = ReactModule.useRef({ friendRequest = {}, inServer = {} })
	local UseFriendUserIdsResult = useFriendUserIds((getSortedUserIds({
		UseRefResult1.current.friendRequest,
		UseRefResult1.current.inServer,
		UseFriendRequestSuggestionsModuleResult.items,
		UseMemoResult
	})))
	local NoIsSearchActive: boolean = Current and (p3.hasFetchedAllConversations and not p3.isSearchActive)
	local IsLoading = UseFriendRequestSuggestionsModuleResult.isLoading or UseInServerSuggestionsModuleResult.isLoading
	local NoCurrent: boolean = IsLoading and not UseRefResult.current
	local SectionHeader = UseLocalizationResult.sectionHeader
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: NoIsSearchActive (copy), Frozen (upval), NoCurrent (copy), ConversationListTrailingItemsModule (upval), SectionHeader (copy), IsLoading (copy), UseRefResult1 (copy), appendSuggestedUsers (upval), keepShownItemsInPlace (upval), UseFriendRequestSuggestionsModuleResult (copy), UseFriendUserIdsResult (copy), UseUserIdsSeenSinceMountResult (copy), UseMemoResult (copy), FIntFriendsChatSuggestedUsersInServerCapModule (upval)
		if not NoIsSearchActive then
			return { items = Frozen }
		end
		if NoCurrent then
			local List = {
				ConversationListTrailingItemsModule.sectionHeader("suggestedUsers", SectionHeader)
			}
			table.insert(List, ConversationListTrailingItemsModule.suggestedUserPlaceholder(1))
			table.insert(List, ConversationListTrailingItemsModule.suggestedUserPlaceholder(2))
			
			return { items = List }
		end
		if IsLoading then
			return { items = Frozen }
		end
		local Current = UseRefResult1.current
		local Items = {}
		local t = {}
		local FriendRequest = appendSuggestedUsers(Items, t, keepShownItemsInPlace(UseFriendRequestSuggestionsModuleResult.items, Current.friendRequest, UseFriendUserIdsResult), "friendRequest")
		
		for _, value in UseUserIdsSeenSinceMountResult do
			t[value] = true
		end
		local Shown = {
			friendRequest = FriendRequest,
			inServer = appendSuggestedUsers(Items, t, keepShownItemsInPlace(UseMemoResult, Current.inServer, UseFriendUserIdsResult, FIntFriendsChatSuggestedUsersInServerCapModule), "inServer")
		}
		
		if #Items == 0 then
			return { items = Frozen, shown = Shown }
		else
			table.insert(Items, 1, ConversationListTrailingItemsModule.sectionHeader("suggestedUsers", SectionHeader))
			
			return { items = Items, shown = Shown }
		end
	end, {
		NoIsSearchActive, IsLoading, NoCurrent,
		UseFriendRequestSuggestionsModuleResult, UseUserIdsSeenSinceMountResult,
		UseMemoResult, UseFriendUserIdsResult, SectionHeader
	})
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseMemoResult1 (copy), UseRefResult1 (copy), UseRefResult (copy)
		local Shown = UseMemoResult1.shown
		
		if Shown == nil then return end
		UseRefResult1.current = Shown
		
		if #UseMemoResult1.items > 0 then
			UseRefResult.current = true
		end
	end, { UseMemoResult1 })
	local Items = UseMemoResult1.items
	local HasNewFriend = false
	
	for _, item in Items do
		if item.kind == "suggestedUser" and UseFriendUserIdsResult[item.userId] then
			HasNewFriend = true
			break
		end
	end
	return ReactModule.useMemo(function()
		-- upvalues: Items (copy), HasNewFriend (ref)
		return { items = Items, hasNewFriend = HasNewFriend }
	end, { Items, HasNewFriend })
end