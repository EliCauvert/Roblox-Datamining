local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local Actions = script.Parent.Parent.Actions

return (require(CorePackages.Packages.Rodux).createReducer({}, {
	[require(Actions.AddTeam).name] = function(p1, p2) --[[ Line: 13 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { [p2.team] = p2.team.TeamColor })
	end,
	[require(Actions.RemoveTeam).name] = function(p1, p2) --[[ Line: 19 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { [p2.team] = CryoModule.None })
	end,
	[require(Actions.SetTeamColor).name] = function(p1, p2) --[[ Line: 25 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { [p2.team] = p2.teamColor })
	end
}))