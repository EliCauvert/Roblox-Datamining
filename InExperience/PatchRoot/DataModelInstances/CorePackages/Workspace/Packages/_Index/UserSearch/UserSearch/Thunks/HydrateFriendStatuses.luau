local userSearch = script:FindFirstAncestor("UserSearch")
local parent = userSearch.Parent
local friendsNetworkingModule = require(userSearch.Networking.FriendsNetworking)
local RODUX_KEY = require(userSearch.Common.Constants).RODUX_KEY
local getDeepValue = require(parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local hydrateEmptyIdsHelper = require(parent.SocialCommon).Utils.hydrateEmptyIdsHelper

return function(p1)
	-- upvalues: getDeepValue (ref), RODUX_KEY (ref), hydrateEmptyIdsHelper (ref), friendsNetworkingModule (ref)
	return function(p2)
		-- upvalues: getDeepValue (copy), RODUX_KEY (copy), hydrateEmptyIdsHelper (copy), p1 (ref), friendsNetworkingModule (copy)
		local var1 = p2:getState() or {}
		local var2 = getDeepValue(var1, string.format("%s.Friends.friendshipStatus", RODUX_KEY)) or {}
		
		return hydrateEmptyIdsHelper({
			ids = p1,
			selector = function(p3)
				-- upvalues: var2 (ref)
				return var2[p3]
			end,
			hydrate = function(p3)
				-- upvalues: p2 (ref), friendsNetworkingModule (copy), var1 (ref)
				return p2:dispatch(friendsNetworkingModule.GetFriendshipStatuses.API({ currentUserId = var1.LocalUserId, targetUserIds = p3 }))
			end
		})
	end
end