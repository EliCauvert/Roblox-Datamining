local userLib = script:FindFirstAncestor("UserLib")
local parent = userLib.Parent
local getFriendsActiveGamesPlaceIdsFromUsersPresenceModule = require(userLib.Utils.getFriendsActiveGamesPlaceIdsFromUsersPresence)
local receiveUsersPresenceModule = require(userLib.Utils.receiveUsersPresence)
local apiFetchGamesDataByPlaceIds = require(parent.GameDetailRodux).GamesByPlaceId.ApiFetchGamesDataByPlaceIds
local usersGetPresenceModule = require(userLib.Requests.UsersGetPresence)

return function(p1, p2)
	-- upvalues: usersGetPresenceModule (ref), receiveUsersPresenceModule (ref), getFriendsActiveGamesPlaceIdsFromUsersPresenceModule (ref), apiFetchGamesDataByPlaceIds (ref)
	return function(p3)
		-- upvalues: usersGetPresenceModule (copy), p1 (ref), p2 (ref), receiveUsersPresenceModule (copy), getFriendsActiveGamesPlaceIdsFromUsersPresenceModule (copy), apiFetchGamesDataByPlaceIds (copy)
		return usersGetPresenceModule(p1, p2):andThen(function(p4)
			-- upvalues: receiveUsersPresenceModule (copy), p3 (ref), getFriendsActiveGamesPlaceIdsFromUsersPresenceModule (copy), apiFetchGamesDataByPlaceIds (copy), p1 (copy)
			local userPresences = p4.responseBody.userPresences
			receiveUsersPresenceModule(userPresences, p3)
			p3:dispatch(apiFetchGamesDataByPlaceIds(p1, getFriendsActiveGamesPlaceIdsFromUsersPresenceModule(userPresences, p3)))
		end)
	end
end