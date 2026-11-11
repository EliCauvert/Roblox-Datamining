local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local Actions = script.Parent.Parent.Actions

return (require(CorePackages.Packages.Rodux).createReducer({}, {
	[require(Actions.AddPlayer).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, {
			[p2.userId] = {
				avatarIcon = nil,
				specialGroupIcon = nil,
				isPlaceOwner = game.CreatorType == Enum.CreatorType.User and p2.userId == game.CreatorId
			}
		})
	end,
	[require(Actions.RemovePlayer).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { [p2.userId] = CryoModule.None })
	end,
	[require(Actions.SetPlayerAvatarIcon).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, {
			[p2.userId] = {
				isPlaceOwner = p1[p2.userId].isPlaceOwner,
				avatarIcon = p2.avatarIcon,
				specialGroupIcon = p1[p2.userId].specialGroupIcon
			}
		})
	end,
	[require(Actions.SetPlayerIsCreator).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, {
			[p2.userId] = {
				isPlaceOwner = p2.isCreator,
				avatarIcon = p1[p2.userId].avatarIcon,
				specialGroupIcon = p1[p2.userId].specialGroupIcon
			}
		})
	end,
	[require(Actions.SetPlayerSpecialGroupIcon).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, {
			[p2.userId] = {
				isPlaceOwner = p1[p2.userId].isPlaceOwner,
				avatarIcon = p1[p2.userId].avatarIcon,
				specialGroupIcon = p2.specialGroupIcon
			}
		})
	end
}))