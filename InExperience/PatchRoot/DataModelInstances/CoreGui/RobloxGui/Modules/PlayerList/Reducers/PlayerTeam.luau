local corePackagesService = game:GetService("CorePackages")
local roduxModule = require(corePackagesService.Packages.Rodux)
local cryoModule = require(corePackagesService.Packages.Cryo)
local actions = script.Parent.Parent.Actions

return roduxModule.createReducer({}, {
	[require(actions.AddPlayerToTeam).name] = function(p0, p1) --[[ line: 12 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p0, { [p1.player.UserId] = p1.team })
	end,
	[require(actions.RemovePlayerFromTeam).name] = function(p2, p3) --[[ line: 18 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p2, { [p3.player.UserId] = cryoModule.None })
	end,
	[require(actions.RemovePlayer).name] = function(p4, p5) --[[ line: 24 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p4, { [p5.player.UserId] = cryoModule.None })
	end
})