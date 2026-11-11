local AddFriendsState = script:FindFirstAncestor("AddFriendsState")
local Parent = AddFriendsState.Parent
local LlamaModule = require(Parent.llama)

return require(Parent.Rodux).createReducer({}, {
	[require(AddFriendsState.Networking.FriendsNetworking).GetFollowingExists.Succeeded.name] = function(p1, p2)
		-- upvalues: LlamaModule (copy)
		local t = {}
		LlamaModule.List.every(p2.responseBody.followings, function(p3): boolean
			-- upvalues: t (copy)
			t[tostring(p3.userId)] = { isFollowing = p3.isFollowing, isFollowed = p3.isFollowed }
			
			return true
		end)
		
		return LlamaModule.Dictionary.join(p1, t)
	end
})