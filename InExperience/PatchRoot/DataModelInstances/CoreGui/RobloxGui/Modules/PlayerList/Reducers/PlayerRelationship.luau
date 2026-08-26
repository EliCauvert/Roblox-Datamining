local corePackagesService = game:GetService("CorePackages")
local roduxModule = require(corePackagesService.Packages.Rodux)
local cryoModule = require(corePackagesService.Packages.Cryo)
local actions = script.Parent.Parent.Actions

return roduxModule.createReducer({}, {
	[require(actions.AddPlayer).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, {
			[p2.userId] = {
				isBlocked = false,
				isFollowing = false,
				isFollower = false,
				friendStatus = Enum.FriendStatus.Unknown
			}
		})
	end,
	[require(actions.RemovePlayer).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { [p2.userId] = cryoModule.None })
	end,
	[require(actions.SetPlayerIsBlocked).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, {
			[p2.userId] = {
				isBlocked = p2.isBlocked,
				friendStatus = p1[p2.userId].friendStatus,
				isFollowing = p1[p2.userId].isFollowing,
				isFollower = p1[p2.userId].isFollower
			}
		})
	end,
	[require(actions.SetPlayerFollowRelationship).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, {
			[p2.userId] = {
				isBlocked = p1[p2.userId].isBlocked,
				friendStatus = p1[p2.userId].friendStatus,
				isFollowing = p2.isFollowing,
				isFollower = p2.isFollower
			}
		})
	end,
	[require(actions.SetPlayerIsFollowing).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, {
			[p2.userId] = {
				isBlocked = p1[p2.userId].isBlocked,
				friendStatus = p1[p2.userId].friendStatus,
				isFollowing = p2.isFollowing,
				isFollower = p1[p2.userId].isFollower
			}
		})
	end,
	[require(actions.SetPlayerFriendStatus).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, {
			[p2.userId] = {
				isBlocked = p1[p2.userId].isBlocked,
				friendStatus = p2.friendStatus,
				isFollowing = p1[p2.userId].isFollowing,
				isFollower = p1[p2.userId].isFollower
			}
		})
	end
})