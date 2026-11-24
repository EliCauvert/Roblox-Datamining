local FriendsChat = script:FindFirstAncestor("FriendsChat")
local Parent = FriendsChat.Parent
local DataHydrationModule = require(Parent.DataHydration)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local GetInServerPlayersStoreModule = require(FriendsChat.Stores.GetInServerPlayersStore)
local _ = require(script.Parent.SuggestedUserTypes)
local DataStatus = DataHydrationModule.DataStatus
local config = {
	[Enum.FriendStatus.NotFriend] = true,
	[Enum.FriendStatus.FriendRequestSent] = true,
	[Enum.FriendStatus.FriendRequestReceived] = true
}

local function isSameEligibility(p1, p2): boolean
	if p1.isPending ~= p2.isPending or p1.isEnabled ~= p2.isEnabled or #p1.userIds ~= #p2.userIds then
		return false
	end
	for i, userId in p1.userIds do
		if p2.userIds[i] ~= userId then
			return false
		end
	end
	return true
end

return function(List, IsEnabled)
	-- upvalues: ReactModule (copy), DataHydrationModule (copy), SignalsModule (copy), GetInServerPlayersStoreModule (copy), DataStatus (copy), config (copy), isSameEligibility (copy), SignalsReactModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: DataHydrationModule (upval), List (copy), SignalsModule (upval), IsEnabled (copy), GetInServerPlayersStoreModule (upval), DataStatus (upval), config (upval), isSameEligibility (upval)
		local GetResult = DataHydrationModule.Friends.FriendsStore.get()
		local t = {}
		
		for _, value in List do
			t[value] = true
		end
		return SignalsModule.createComputed(function(p3)
			-- upvalues: IsEnabled (upval), GetInServerPlayersStoreModule (upval), t (copy), GetResult (copy), DataStatus (upval), config (upval)
			if not IsEnabled then
				return { isPending = false, isEnabled = false, userIds = {} }
			end
			local UserIds = {}
			local IsPending = false
			local Count = 0
			
			for _, value in GetInServerPlayersStoreModule(false).getUserIds(p3) do
				if Count >= 25 then break end
				if not t[value] then
					Count += 1
					local FriendshipStatus = GetResult.GetFriendshipStatus(value)
					local DataResult = FriendshipStatus.data(p3)
					
					if DataResult == nil then
						IsPending = IsPending or FriendshipStatus.status(p3) == DataStatus.NotReady
					elseif config[DataResult] then
						table.insert(UserIds, value)
					end
				end
			end
			return {
				isEnabled = true,
				userIds = UserIds,
				isPending = IsPending
			}
		end, isSameEligibility)
	end, { table.concat(List, ","), IsEnabled })))
	local UseRefResult = ReactModule.useRef(false)
	local IsPending = not UseRefResult.current and (UseSignalStateResult.isPending or UseSignalStateResult.isEnabled ~= IsEnabled)
	ReactModule.useLayoutEffect(function()
		-- upvalues: IsPending (copy), IsEnabled (copy), UseRefResult (copy)
		if not IsPending and IsEnabled then
			UseRefResult.current = true
		end
	end, { IsPending, IsEnabled })
	
	return ReactModule.useMemo(function()
		-- upvalues: UseSignalStateResult (copy), IsPending (copy)
		return {
			userIds = UseSignalStateResult.userIds,
			isLoading = IsPending
		}
	end, { UseSignalStateResult, IsPending })
end