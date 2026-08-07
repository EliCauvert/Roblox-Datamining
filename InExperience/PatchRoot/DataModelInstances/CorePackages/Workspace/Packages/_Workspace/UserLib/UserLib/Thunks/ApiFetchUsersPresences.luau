local userLib = script:FindFirstAncestor("UserLib")
local parent = userLib.Parent
local getFriendsActiveGamesPlaceIdsFromUsersPresenceModule = require(userLib.Utils.getFriendsActiveGamesPlaceIdsFromUsersPresence)
local receiveUsersPresenceModule = require(userLib.Utils.receiveUsersPresence)
local apiFetchGamesDataByPlaceIds = require(parent.GameDetailRodux).GamesByPlaceId.ApiFetchGamesDataByPlaceIds
local usersGetPresenceModule = require(userLib.Requests.UsersGetPresence)

return function(p0, p1) --[[ line: 12 ]]
	-- upvalues: usersGetPresenceModule (ref), receiveUsersPresenceModule (ref), getFriendsActiveGamesPlaceIdsFromUsersPresenceModule (ref), apiFetchGamesDataByPlaceIds (ref)
	return function(p2) --[[ line: 13 ]]
		-- upvalues: usersGetPresenceModule (copy), p0 (ref), p1 (ref), receiveUsersPresenceModule (copy), getFriendsActiveGamesPlaceIdsFromUsersPresenceModule (copy), apiFetchGamesDataByPlaceIds (copy)
		return usersGetPresenceModule(p0, p1):andThen(function(p3) --[[ line: 14 ]]
			-- upvalues: receiveUsersPresenceModule (copy), p2 (ref), getFriendsActiveGamesPlaceIdsFromUsersPresenceModule (copy), apiFetchGamesDataByPlaceIds (copy), p0 (copy)
			local userPresences = p3.responseBody.userPresences
			receiveUsersPresenceModule(userPresences, p2)
			p2:dispatch(apiFetchGamesDataByPlaceIds(p0, getFriendsActiveGamesPlaceIdsFromUsersPresenceModule(userPresences, p2)))
		end)
	end
end