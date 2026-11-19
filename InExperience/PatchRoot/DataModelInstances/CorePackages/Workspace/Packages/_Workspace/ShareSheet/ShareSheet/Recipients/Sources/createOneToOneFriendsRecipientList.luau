local ShareSheet = script:FindFirstAncestor("ShareSheet")
local Parent = ShareSheet.Parent
local DataHydrationUtilsModule = require(Parent.DataHydration.DataHydrationUtils)
local FriendsModule = require(Parent.DataHydration.Friends)
local SignalsModule = require(Parent.Signals)
local ListRecipientsStatusModule = require(ShareSheet.Recipients.ListRecipientsStatus)
local ShareSheetConstantsModule = require(ShareSheet.ShareSheetConstants)
local _ = require(ShareSheet.Types)
local CreateFriendRecipientListModule = require(script.Parent.createFriendRecipientList)

local function createFriendsSearchRecipientList(Query)
	-- upvalues: DataHydrationUtilsModule (copy), SignalsModule (copy), ListRecipientsStatusModule (copy), FriendsModule (copy), ShareSheetConstantsModule (copy), CreateFriendRecipientListModule (copy)
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
	
	return CreateFriendRecipientListModule({
		getPage = Signal,
		fetchNextPage = function()
			-- upvalues: fetchPage (copy), Signal (copy)
			fetchPage(Signal(false).nextPageToken)
		end,
		refresh = function()
			-- upvalues: fetchPage (copy)
			fetchPage(nil)
		end
	})
end

return function()
	-- upvalues: FriendsModule (copy), SignalsModule (copy), ListRecipientsStatusModule (copy), CreateFriendRecipientListModule (copy), createFriendsSearchRecipientList (copy)
	local GetResult = FriendsModule.FriendsStore.get()
	local AllFriends = GetResult.GetAllFriends()
	local AllFriendsStatus = GetResult.GetAllFriendsStatus()
	
	return CreateFriendRecipientListModule({
		getPage = SignalsModule.createComputed(function(p1)
			-- upvalues: AllFriends (copy), AllFriendsStatus (copy), ListRecipientsStatusModule (upval)
			local AllFriendsResult = AllFriends(p1)
			local AllFriendsStatusResult = AllFriendsStatus(p1)
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
	})
end