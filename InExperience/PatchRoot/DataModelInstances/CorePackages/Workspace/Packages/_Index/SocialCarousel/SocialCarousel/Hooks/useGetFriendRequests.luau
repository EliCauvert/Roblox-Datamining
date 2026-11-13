local Parent = script:FindFirstAncestor("SocialCarousel").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local FriendsRequestsModule = require(Parent.DataHydration.FriendsRequests)
local GetResult = require(Parent.DataHydration).Friends.FriendsStore.get()
local GetResult1 = FriendsRequestsModule.FriendsRequestsStore.get()
local config = { skipFetch = true }

return function(Enabled)
	-- upvalues: ReactModule (copy), GetResult1 (copy), SignalsModule (copy), GetResult (copy), config (copy), SignalsReactModule (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Enabled (copy), GetResult1 (upval)
		return if Enabled == false then nil else GetResult1.getFriendsRequests()
	end, { Enabled })
	
	return SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), UseMemoResult (copy), GetResult (upval), config (upval)
		return SignalsModule.createComputed(function(p1)
			-- upvalues: UseMemoResult (upval), GetResult (upval), config (upval)
			local DataResult = if UseMemoResult then UseMemoResult.data(p1) else nil
			
			if not DataResult then
				return {}
			end
			local List = {}
			
			for _, request in DataResult.requests do
				local FriendshipStatus = GetResult.GetFriendshipStatus(request.id, config)
				local DataResult1 = if FriendshipStatus then FriendshipStatus.data(p1) else nil
				
				if DataResult1 == nil or DataResult1 == Enum.FriendStatus.FriendRequestReceived then
					table.insert(List, request)
				end
			end
			return List
		end)
	end, { UseMemoResult })))
end