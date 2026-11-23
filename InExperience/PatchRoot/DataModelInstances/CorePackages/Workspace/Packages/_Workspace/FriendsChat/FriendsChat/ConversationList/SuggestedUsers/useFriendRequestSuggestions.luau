local Parent = script:FindFirstAncestor("FriendsChat").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local DataHydrationModule = require(Parent.DataHydration)
local FriendRequestsModule = require(Parent.FriendRequests)
local _ = require(script.Parent.SuggestedUserTypes)
local UseGetFriendRequestsListFunction = FriendRequestsModule.useGetFriendRequestsList
local GetResult = DataHydrationModule.Friends.FriendsStore.get()
local config = { skipFetch = true }

return function(p1, p2)
	-- upvalues: UseGetFriendRequestsListFunction (copy), config (copy), ReactModule (copy), SignalsModule (copy), GetResult (copy), SignalsReactModule (copy)
	local UseGetFriendRequestsListResult, UseGetFriendRequestsListResult2 = UseGetFriendRequestsListFunction(if p2 then nil else config)
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), UseGetFriendRequestsListResult (copy), GetResult (upval), config (upval)
		return SignalsModule.createComputed(function(p3)
			-- upvalues: UseGetFriendRequestsListResult (upval), GetResult (upval), config (upval)
			local List = {}
			
			for _, value in UseGetFriendRequestsListResult do
				local DataResult = GetResult.GetFriendshipStatus(value.id, config).data(p3)
				
				if DataResult == nil or DataResult == Enum.FriendStatus.FriendRequestReceived then
					table.insert(List, value)
				end
			end
			return List
		end)
	end, { UseGetFriendRequestsListResult })))
	
	return ReactModule.useMemo(function()
		-- upvalues: UseSignalStateResult (copy), p1 (copy), UseGetFriendRequestsListResult2 (copy)
		local Items = {}
		local SenderUserIds = {}
		
		for i, Request in UseSignalStateResult do
			if i <= p1 then
				table.insert(Items, { userId = Request.id, request = Request })
			end
			table.insert(SenderUserIds, Request.id)
		end
		return {
			items = Items,
			isLoading = UseGetFriendRequestsListResult2,
			senderUserIds = SenderUserIds
		}
	end, {
		UseSignalStateResult,
		UseGetFriendRequestsListResult2,
		p1
	})
end