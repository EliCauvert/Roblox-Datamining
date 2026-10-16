local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local Actions = script.Parent.Parent.Actions

return (require(CorePackages.Packages.Rodux).createReducer({}, {
	[require(Actions.AddPlayer).name] = function(p1, p2) --[[ Line: 13 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { [p2.userId] = {} })
	end,
	[require(Actions.RemovePlayer).name] = function(p1, p2) --[[ Line: 19 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { [p2.userId] = CryoModule.None })
	end,
	[require(Actions.SetPlayerLeaderstat).name] = function(p1, p2) --[[ Line: 25 ]]
		-- upvalues: CryoModule (copy)
		return if p1[p2.userId] == nil then p1 else CryoModule.Dictionary.join(p1, {
			[p2.userId] = CryoModule.Dictionary.join(p1[p2.userId], { [p2.leaderstat] = p2.value })
		})
	end
}))