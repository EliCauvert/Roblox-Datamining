local CorePackages = game:GetService("CorePackages")
local GetFriendsActiveGamesPlaceIdsFromUsersPresenceFunction = require(CorePackages.Workspace.Packages.UserLib).Utils.getFriendsActiveGamesPlaceIdsFromUsersPresence
local ApiFetchGamesDataByPlaceIdsFunction = require(CorePackages.Workspace.Packages.GameDetailRodux).GamesByPlaceId.ApiFetchGamesDataByPlaceIds

return function(p1, p2)
	-- upvalues: GetFriendsActiveGamesPlaceIdsFromUsersPresenceFunction (copy), ApiFetchGamesDataByPlaceIdsFunction (copy)
	return function(p3)
		-- upvalues: GetFriendsActiveGamesPlaceIdsFromUsersPresenceFunction (upval), p2 (copy), ApiFetchGamesDataByPlaceIdsFunction (upval), p1 (copy)
		p3:dispatch(ApiFetchGamesDataByPlaceIdsFunction(p1, (GetFriendsActiveGamesPlaceIdsFromUsersPresenceFunction(p2, p3))))
	end
end