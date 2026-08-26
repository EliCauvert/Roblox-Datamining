local corePackagesService = game:GetService("CorePackages")
local roduxModule = require(corePackagesService.Packages.Rodux)
local cryoModule = require(corePackagesService.Packages.Cryo)
local actions = script.Parent.Parent.Actions

return roduxModule.createReducer({}, {
	[require(actions.AddPlayer).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, {
			[p2.userId] = {
				avatarIcon = nil,
				specialGroupIcon = nil,
				isPlaceOwner = game.CreatorType == Enum.CreatorType.User and p2.userId == game.CreatorId
			}
		})
	end,
	[require(actions.RemovePlayer).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { [p2.userId] = cryoModule.None })
	end,
	[require(actions.SetPlayerAvatarIcon).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, {
			[p2.userId] = {
				isPlaceOwner = p1[p2.userId].isPlaceOwner,
				avatarIcon = p2.avatarIcon,
				specialGroupIcon = p1[p2.userId].specialGroupIcon
			}
		})
	end,
	[require(actions.SetPlayerIsCreator).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, {
			[p2.userId] = {
				isPlaceOwner = p2.isCreator,
				avatarIcon = p1[p2.userId].avatarIcon,
				specialGroupIcon = p1[p2.userId].specialGroupIcon
			}
		})
	end,
	[require(actions.SetPlayerSpecialGroupIcon).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, {
			[p2.userId] = {
				isPlaceOwner = p1[p2.userId].isPlaceOwner,
				avatarIcon = p1[p2.userId].avatarIcon,
				specialGroupIcon = p2.specialGroupIcon
			}
		})
	end
})