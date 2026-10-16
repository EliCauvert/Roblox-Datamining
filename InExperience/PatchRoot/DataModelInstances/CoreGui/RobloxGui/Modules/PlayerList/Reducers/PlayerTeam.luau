local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local Actions = script.Parent.Parent.Actions

return (require(CorePackages.Packages.Rodux).createReducer({}, {
	[require(Actions.AddPlayerToTeam).name] = function(p1, p2) --[[ Line: 12 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { [p2.player.UserId] = p2.team })
	end,
	[require(Actions.RemovePlayerFromTeam).name] = function(p1, p2) --[[ Line: 18 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { [p2.player.UserId] = CryoModule.None })
	end,
	[require(Actions.RemovePlayer).name] = function(p1, p2) --[[ Line: 24 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { [p2.player.UserId] = CryoModule.None })
	end
}))