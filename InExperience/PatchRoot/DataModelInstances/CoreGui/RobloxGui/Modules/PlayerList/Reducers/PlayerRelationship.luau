local corePackagesService = game:GetService("CorePackages")
local roduxModule = require(corePackagesService.Packages.Rodux)
local cryoModule = require(corePackagesService.Packages.Cryo)
local actions = script.Parent.Parent.Actions

return roduxModule.createReducer({}, {
	[require(actions.AddPlayer).name] = function(p0, p1)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p0, {
			[p1.userId] = {
				isBlocked = false,
				isFollowing = false,
				isFollower = false,
				friendStatus = Enum.FriendStatus.Unknown
			}
		})
	end,
	[require(actions.RemovePlayer).name] = function(p2, p3)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p2, { [p3.userId] = cryoModule.None })
	end,
	[require(actions.SetPlayerIsBlocked).name] = function(p4, p5)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p4, {
			[p5.userId] = {
				isBlocked = p5.isBlocked,
				friendStatus = p4[p5.userId].friendStatus,
				isFollowing = p4[p5.userId].isFollowing,
				isFollower = p4[p5.userId].isFollower
			}
		})
	end,
	[require(actions.SetPlayerFollowRelationship).name] = function(p6, p7)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p6, {
			[p7.userId] = {
				isBlocked = p6[p7.userId].isBlocked,
				friendStatus = p6[p7.userId].friendStatus,
				isFollowing = p7.isFollowing,
				isFollower = p7.isFollower
			}
		})
	end,
	[require(actions.SetPlayerIsFollowing).name] = function(p8, p9)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p8, {
			[p9.userId] = {
				isBlocked = p8[p9.userId].isBlocked,
				friendStatus = p8[p9.userId].friendStatus,
				isFollowing = p9.isFollowing,
				isFollower = p8[p9.userId].isFollower
			}
		})
	end,
	[require(actions.SetPlayerFriendStatus).name] = function(p10, p11)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p10, {
			[p11.userId] = {
				isBlocked = p10[p11.userId].isBlocked,
				friendStatus = p11.friendStatus,
				isFollowing = p10[p11.userId].isFollowing,
				isFollower = p10[p11.userId].isFollower
			}
		})
	end
})