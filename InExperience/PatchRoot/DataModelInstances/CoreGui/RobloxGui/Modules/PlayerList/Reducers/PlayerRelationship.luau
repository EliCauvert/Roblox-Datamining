local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local Actions = script.Parent.Parent.Actions

return (require(CorePackages.Packages.Rodux).createReducer({}, {
	[require(Actions.AddPlayer).name] = function(p1, p2) --[[ Line: 16 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, {
			[p2.userId] = {
				isBlocked = false,
				isFollowing = false,
				isFollower = false,
				friendStatus = Enum.FriendStatus.Unknown
			}
		})
	end,
	[require(Actions.RemovePlayer).name] = function(p1, p2) --[[ Line: 27 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { [p2.userId] = CryoModule.None })
	end,
	[require(Actions.SetPlayerIsBlocked).name] = function(p1, p2) --[[ Line: 33 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, {
			[p2.userId] = {
				isBlocked = p2.isBlocked,
				friendStatus = p1[p2.userId].friendStatus,
				isFollowing = p1[p2.userId].isFollowing,
				isFollower = p1[p2.userId].isFollower
			}
		})
	end,
	[require(Actions.SetPlayerFollowRelationship).name] = function(p1, p2) --[[ Line: 44 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, {
			[p2.userId] = {
				isBlocked = p1[p2.userId].isBlocked,
				friendStatus = p1[p2.userId].friendStatus,
				isFollowing = p2.isFollowing,
				isFollower = p2.isFollower
			}
		})
	end,
	[require(Actions.SetPlayerIsFollowing).name] = function(p1, p2) --[[ Line: 55 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, {
			[p2.userId] = {
				isBlocked = p1[p2.userId].isBlocked,
				friendStatus = p1[p2.userId].friendStatus,
				isFollowing = p2.isFollowing,
				isFollower = p1[p2.userId].isFollower
			}
		})
	end,
	[require(Actions.SetPlayerFriendStatus).name] = function(p1, p2) --[[ Line: 66 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, {
			[p2.userId] = {
				isBlocked = p1[p2.userId].isBlocked,
				friendStatus = p2.friendStatus,
				isFollowing = p1[p2.userId].isFollowing,
				isFollower = p1[p2.userId].isFollower
			}
		})
	end
}))