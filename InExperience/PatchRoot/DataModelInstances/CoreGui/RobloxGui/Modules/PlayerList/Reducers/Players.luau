local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local Actions = script.Parent.Parent.Actions

return (require(CorePackages.Packages.Rodux).createReducer({}, {
	[require(Actions.AddPlayer).name] = function(p1, p2) --[[ Line: 11 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.List.join(p1, { p2.player })
	end,
	[require(Actions.RemovePlayer).name] = function(p1, p2) --[[ Line: 15 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.List.filter(p1, function(Player): boolean --[[ Line: 16 ]]
			-- upvalues: p2 (copy)
			return Player ~= p2.player
		end)
	end
}))