local corePackagesService = game:GetService("CorePackages")
local roduxModule = require(corePackagesService.Packages.Rodux)
local cryoModule = require(corePackagesService.Packages.Cryo)
local actions = script.Parent.Parent.Actions

return roduxModule.createReducer({}, {
	[require(actions.AddPlayer).name] = function(p0, p1) --[[ line: 15 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p0, {
			[p1.userId] = {
				avatarIcon = nil,
				specialGroupIcon = nil,
				isPlaceOwner = game.CreatorType == Enum.CreatorType.User and p1.userId == game.CreatorId
			}
		})
	end,
	[require(actions.RemovePlayer).name] = function(p2, p3) --[[ line: 25 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p2, { [p3.userId] = cryoModule.None })
	end,
	[require(actions.SetPlayerAvatarIcon).name] = function(p4, p5) --[[ line: 31 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p4, {
			[p5.userId] = {
				isPlaceOwner = p4[p5.userId].isPlaceOwner,
				avatarIcon = p5.avatarIcon,
				specialGroupIcon = p4[p5.userId].specialGroupIcon
			}
		})
	end,
	[require(actions.SetPlayerIsCreator).name] = function(p6, p7) --[[ line: 41 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p6, {
			[p7.userId] = {
				isPlaceOwner = p7.isCreator,
				avatarIcon = p6[p7.userId].avatarIcon,
				specialGroupIcon = p6[p7.userId].specialGroupIcon
			}
		})
	end,
	[require(actions.SetPlayerSpecialGroupIcon).name] = function(p8, p9) --[[ line: 51 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p8, {
			[p9.userId] = {
				isPlaceOwner = p8[p9.userId].isPlaceOwner,
				avatarIcon = p8[p9.userId].avatarIcon,
				specialGroupIcon = p9.specialGroupIcon
			}
		})
	end
})