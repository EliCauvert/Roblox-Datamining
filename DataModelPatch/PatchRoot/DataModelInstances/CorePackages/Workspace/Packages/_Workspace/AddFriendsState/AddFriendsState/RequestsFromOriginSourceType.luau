local AddFriendsState = script:FindFirstAncestor("AddFriendsState")
local Parent = AddFriendsState.Parent
local GetDeepValueFunction = require(Parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local CryoModule = require(Parent.Cryo)

return require(Parent.Rodux).createReducer({}, {
	[require(AddFriendsState.Networking.FriendsNetworking).GetFriendRequests.Succeeded.name] = function(p1, p2)
		-- upvalues: CryoModule (copy), GetDeepValueFunction (copy)
		return (CryoModule.Dictionary.join(p1 or {}, (CryoModule.List.foldLeft(p2.responseBody.data, function(FriendRequestOriginSourceTypes, p3)
			-- upvalues: GetDeepValueFunction (upval)
			FriendRequestOriginSourceTypes[tostring(p3.id)] = GetDeepValueFunction(p3, "friendRequest.originSourceType")
			
			return FriendRequestOriginSourceTypes
		end, {}))))
	end
})