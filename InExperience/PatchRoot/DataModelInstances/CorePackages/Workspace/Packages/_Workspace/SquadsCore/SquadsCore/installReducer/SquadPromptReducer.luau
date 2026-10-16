local SquadsCore = script:FindFirstAncestor("SquadsCore")
local Parent = SquadsCore.Parent
local CryoModule = require(Parent.Cryo)

return require(Parent.Rodux).createReducer({ arguments = {} }, {
	[require(SquadsCore.Actions.SetSquadPrompt).name] = function(p1, p2) --[[ Line: 13 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { arguments = p2.arguments or {} })
	end,
	[require(SquadsCore.Actions.CloseSquadPrompt).name] = function(_, _) --[[ Line: 18 ]]
		return { arguments = {} }
	end
})