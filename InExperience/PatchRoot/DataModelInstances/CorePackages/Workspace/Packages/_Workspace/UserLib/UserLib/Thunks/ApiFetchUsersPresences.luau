local UserLib = script:FindFirstAncestor("UserLib")
local GetFriendsActiveGamesPlaceIdsFromUsersPresenceModule = require(UserLib.Utils.getFriendsActiveGamesPlaceIdsFromUsersPresence)
local ReceiveUsersPresenceModule = require(UserLib.Utils.receiveUsersPresence)
local ApiFetchGamesDataByPlaceIdsFunction = require(UserLib.Parent.GameDetailRodux).GamesByPlaceId.ApiFetchGamesDataByPlaceIds
local UsersGetPresenceModule = require(UserLib.Requests.UsersGetPresence)

return function(p1, p2) --[[ Line: 12 ]]
	-- upvalues: UsersGetPresenceModule (copy), ReceiveUsersPresenceModule (copy), GetFriendsActiveGamesPlaceIdsFromUsersPresenceModule (copy), ApiFetchGamesDataByPlaceIdsFunction (copy)
	return function(p3) --[[ Line: 13 ]]
		-- upvalues: UsersGetPresenceModule (upval), p1 (copy), p2 (copy), ReceiveUsersPresenceModule (upval), GetFriendsActiveGamesPlaceIdsFromUsersPresenceModule (upval), ApiFetchGamesDataByPlaceIdsFunction (upval)
		return UsersGetPresenceModule(p1, p2):andThen(function(Result) --[[ Line: 14 ]]
			-- upvalues: ReceiveUsersPresenceModule (upval), p3 (copy), GetFriendsActiveGamesPlaceIdsFromUsersPresenceModule (upval), ApiFetchGamesDataByPlaceIdsFunction (upval), p1 (upval)
			local UserPresences = Result.responseBody.userPresences
			ReceiveUsersPresenceModule(UserPresences, p3)
			p3:dispatch(ApiFetchGamesDataByPlaceIdsFunction(p1, (GetFriendsActiveGamesPlaceIdsFromUsersPresenceModule(UserPresences, p3))))
		end)
	end
end