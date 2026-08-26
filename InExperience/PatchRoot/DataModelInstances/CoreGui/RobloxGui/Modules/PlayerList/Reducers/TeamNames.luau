local corePackagesService = game:GetService("CorePackages")
local roduxModule = require(corePackagesService.Packages.Rodux)
local cryoModule = require(corePackagesService.Packages.Cryo)
local actions = script.Parent.Parent.Actions

return roduxModule.createReducer({}, {
	[require(actions.AddTeam).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { [p2.team] = p2.team.Name })
	end,
	[require(actions.RemoveTeam).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { [p2.team] = cryoModule.None })
	end,
	[require(actions.SetTeamName).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { [p2.team] = p2.teamName })
	end
})