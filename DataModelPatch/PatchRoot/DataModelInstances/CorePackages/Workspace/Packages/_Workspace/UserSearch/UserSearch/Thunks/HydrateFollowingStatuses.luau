local UserSearch = script:FindFirstAncestor("UserSearch")
local Parent = UserSearch.Parent
local FriendsNetworkingModule = require(UserSearch.Networking.FriendsNetworking)
local RODUXKEY = require(UserSearch.Common.Constants).RODUX_KEY
local GetDeepValueFunction = require(Parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local HydrateEmptyIdsHelperFunction = require(Parent.SocialCommon).Utils.hydrateEmptyIdsHelper

return function(Ids)
	-- upvalues: GetDeepValueFunction (copy), RODUXKEY (copy), HydrateEmptyIdsHelperFunction (copy), FriendsNetworkingModule (copy)
	return function(p1)
		-- upvalues: GetDeepValueFunction (upval), RODUXKEY (upval), HydrateEmptyIdsHelperFunction (upval), Ids (copy), FriendsNetworkingModule (upval)
		local DeepValue = GetDeepValueFunction(p1:getState() or {}, string.format("%s.Friends.followings.followingStatuses", RODUXKEY)) or {}
		
		return HydrateEmptyIdsHelperFunction({
			ids = Ids,
			selector = function(p2)
				-- upvalues: DeepValue (copy)
				return DeepValue[p2]
			end,
			hydrate = function(TargetUserIds)
				-- upvalues: p1 (copy), FriendsNetworkingModule (upval)
				return p1:dispatch(FriendsNetworkingModule.GetFollowingExists.API({ targetUserIds = TargetUserIds }))
			end
		})
	end
end