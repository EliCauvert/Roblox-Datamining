local UserSearch = script:FindFirstAncestor("UserSearch")
local Parent = UserSearch.Parent
local FriendsNetworkingModule = require(UserSearch.Networking.FriendsNetworking)
local RODUXKEY = require(UserSearch.Common.Constants).RODUX_KEY
local GetDeepValueFunction = require(Parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local HydrateEmptyIdsHelperFunction = require(Parent.SocialCommon).Utils.hydrateEmptyIdsHelper

return function(Ids) --[[ Line: 14 ]]
	-- upvalues: GetDeepValueFunction (copy), RODUXKEY (copy), HydrateEmptyIdsHelperFunction (copy), FriendsNetworkingModule (copy)
	return function(p1) --[[ Line: 15 ]]
		-- upvalues: GetDeepValueFunction (upval), RODUXKEY (upval), HydrateEmptyIdsHelperFunction (upval), Ids (copy), FriendsNetworkingModule (upval)
		local State = p1:getState() or {}
		local DeepValue = GetDeepValueFunction(State, string.format("%s.Friends.friendshipStatus", RODUXKEY)) or {}
		
		return HydrateEmptyIdsHelperFunction({
			ids = Ids,
			selector = function(p2) --[[ Line: 21 ]]
				-- upvalues: DeepValue (copy)
				return DeepValue[p2]
			end,
			hydrate = function(TargetUserIds) --[[ Line: 24 ]]
				-- upvalues: p1 (copy), FriendsNetworkingModule (upval), State (copy)
				return p1:dispatch(FriendsNetworkingModule.GetFriendshipStatuses.API({
					currentUserId = State.LocalUserId,
					targetUserIds = TargetUserIds
				}))
			end
		})
	end
end