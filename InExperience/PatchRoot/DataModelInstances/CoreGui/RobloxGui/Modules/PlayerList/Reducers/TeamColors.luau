local corePackagesService = game:GetService("CorePackages")
local roduxModule = require(corePackagesService.Packages.Rodux)
local cryoModule = require(corePackagesService.Packages.Cryo)
local actions = script.Parent.Parent.Actions

return roduxModule.createReducer({}, {
	[require(actions.AddTeam).name] = function(p0, p1) --[[ line: 13 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p0, { [p1.team] = p1.team.TeamColor })
	end,
	[require(actions.RemoveTeam).name] = function(p2, p3) --[[ line: 19 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p2, { [p3.team] = cryoModule.None })
	end,
	[require(actions.SetTeamColor).name] = function(p4, p5) --[[ line: 25 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p4, { [p5.team] = p5.teamColor })
	end
})