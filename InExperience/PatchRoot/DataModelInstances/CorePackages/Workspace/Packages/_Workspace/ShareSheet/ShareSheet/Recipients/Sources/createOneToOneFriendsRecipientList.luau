local ShareSheet = script:FindFirstAncestor("ShareSheet")
local Parent = ShareSheet.Parent
local DataHydrationUtilsModule = require(Parent.DataHydration.DataHydrationUtils)
local FriendsModule = require(Parent.DataHydration.Friends)
local SignalsModule = require(Parent.Signals)
local ListRecipientsStatusModule = require(ShareSheet.Recipients.ListRecipientsStatus)
local RecipientModule = require(ShareSheet.Recipients.Recipient)
local ShareSheetConstantsModule = require(ShareSheet.ShareSheetConstants)
local _ = require(ShareSheet.Types)

local function _(p1)
	if (tonumber(p1) or 0) <= 0 then
		error(`Friends returned an invalid user id: {p1}`)
	end
end

local function areSameRecipients(List, p1): boolean
	if #List ~= #p1 then
		return false
	end
	for i, value in List do
		if p1[i] ~= value then
			return false
		end
	end
	return true
end

local function createFriendRecipientList(FriendRecipientList)
	-- upvalues: SignalsModule (copy), RecipientModule (copy), areSameRecipients (copy)
	local t = {}
	local Computed = SignalsModule.createComputed(function(p2)
		-- upvalues: FriendRecipientList (copy), t (copy), RecipientModule (upval)
		local List = {}
		local t1 = {}
		
		for _, userId in FriendRecipientList.getPage(p2).userIds do
			if (tonumber(userId) or 0) <= 0 then
				error(`Friends returned an invalid user id: {userId}`)
			end
			if t1[userId] then
				error(`Duplicate user id in the friends page: {userId}`)
			end
			t1[userId] = true
			local Entry = t[userId] or RecipientModule.fromUserId(userId)
			t[userId] = Entry
			table.insert(List, Entry)
		end
		return List
	end, areSameRecipients)
	local Computed1 = SignalsModule.createComputed(function(p3)
		-- upvalues: FriendRecipientList (copy), Computed (copy)
		local Page = FriendRecipientList.getPage(p3)
		
		return {
			recipients = Computed(p3),
			status = Page.status,
			nextPageToken = Page.nextPageToken,
			isFetchingNextPage = Page.isFetchingNextPage
		}
	end)
	
	return {
		getResult = Computed1,
		refresh = FriendRecipientList.refresh,
		search = FriendRecipientList.search,
		loadMore = function(NextPageToken)
			-- upvalues: Computed1 (copy), FriendRecipientList (copy)
			local ComputedResult = Computed1(false)
			
			if ComputedResult.nextPageToken == NextPageToken and not ComputedResult.isFetchingNextPage then
				FriendRecipientList.fetchNextPage()
			end
		end
	}
end

local function createFriendsSearchRecipientList(Query)
	-- upvalues: DataHydrationUtilsModule (copy), SignalsModule (copy), ListRecipientsStatusModule (copy), FriendsModule (copy), ShareSheetConstantsModule (copy), createFriendRecipientList (copy)
	local LocalPlayerUserId = DataHydrationUtilsModule.getLocalPlayerUserId()
	local Signal, Signal2 = SignalsModule.createSignal({
		isFetchingNextPage = false,
		userIds = {},
		status = ListRecipientsStatusModule.Loading
	})
	
	local function fetchPage(Cursor)
		-- upvalues: Signal (copy), Signal2 (copy), ListRecipientsStatusModule (upval), FriendsModule (upval), LocalPlayerUserId (copy), Query (copy), ShareSheetConstantsModule (upval)
		local SignalResult = Signal(false)
		Signal2({
			userIds = SignalResult.userIds,
			status = if Cursor or #SignalResult.userIds > 0 then ListRecipientsStatusModule.Ready else ListRecipientsStatusModule.Loading,
			nextPageToken = SignalResult.nextPageToken,
			isFetchingNextPage = Cursor ~= nil
		})
		FriendsModule.Requests.SearchFriendsByQuery(LocalPlayerUserId, {
			query = Query,
			limit = ShareSheetConstantsModule.FIntShareSheetFriendsSearchPageSize,
			cursor = Cursor
		}):andThen(function(Result)
			-- upvalues: Cursor (copy), Signal (upval), Signal2 (upval), ListRecipientsStatusModule (upval)
			local Copy = if Cursor then table.clone(Signal(false).userIds) else {}
			local t = {}
			
			for _, value in Copy do
				t[value] = true
			end
			if Result and Result.PageItems then
				for _, pageItem in Result.PageItems do
					local Text = tostring(pageItem.id)
					
					if Text ~= "-1" and not t[Text] then
						t[Text] = true
						table.insert(Copy, Text)
					end
				end
			end
			local NextCursor = if Result then Result.NextCursor else nil
			Signal2({
				isFetchingNextPage = false,
				userIds = Copy,
				status = ListRecipientsStatusModule.Ready,
				nextPageToken = if NextCursor == "" then nil else NextCursor
			})
		end):catch(function()
			-- upvalues: Signal (upval), Signal2 (upval), ListRecipientsStatusModule (upval)
			local SignalResult = Signal(false)
			Signal2({
				isFetchingNextPage = false,
				userIds = SignalResult.userIds,
				status = ListRecipientsStatusModule.Failed,
				nextPageToken = SignalResult.nextPageToken
			})
		end)
	end
	
	return (createFriendRecipientList({
		getPage = Signal,
		fetchNextPage = function()
			-- upvalues: fetchPage (copy), Signal (copy)
			fetchPage(Signal(false).nextPageToken)
		end,
		refresh = function()
			-- upvalues: fetchPage (copy)
			fetchPage(nil)
		end
	}))
end

return function()
	-- upvalues: FriendsModule (copy), SignalsModule (copy), ListRecipientsStatusModule (copy), createFriendRecipientList (copy), createFriendsSearchRecipientList (copy)
	local GetResult = FriendsModule.FriendsStore.get()
	local AllFriends = GetResult.GetAllFriends()
	local AllFriendsStatus = GetResult.GetAllFriendsStatus()
	
	return (createFriendRecipientList({
		getPage = SignalsModule.createComputed(function(p2)
			-- upvalues: AllFriends (copy), AllFriendsStatus (copy), ListRecipientsStatusModule (upval)
			local AllFriendsResult = AllFriends(p2)
			local AllFriendsStatusResult = AllFriendsStatus(p2)
			local IsFailed = AllFriendsStatusResult == "Failed"
			local UserIds = {}
			
			if AllFriendsResult ~= nil then
				for _, friend in AllFriendsResult.friends do
					if friend.id ~= "-1" then
						table.insert(UserIds, friend.id)
					end
				end
			end
			return {
				userIds = UserIds,
				status = if IsFailed then ListRecipientsStatusModule.Failed elseif AllFriendsResult == nil then ListRecipientsStatusModule.Loading else ListRecipientsStatusModule.Ready,
				nextPageToken = if AllFriendsResult == nil or not AllFriendsResult.hasMore then nil else AllFriendsResult.nextCursor,
				isFetchingNextPage = AllFriendsResult ~= nil and AllFriendsStatusResult == "NotReady"
			}
		end),
		fetchNextPage = GetResult.FetchMoreFriends,
		refresh = function() end,
		search = createFriendsSearchRecipientList
	}))
end