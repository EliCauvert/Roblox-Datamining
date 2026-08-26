local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local cryoModule = require(parent.Cryo)

return require(parent.Rodux).createReducer({ arguments = {} }, {
	[require(squadsCore.Actions.SetSquadPrompt).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { arguments = p2.arguments or {} })
	end,
	[require(squadsCore.Actions.CloseSquadPrompt).name] = function(_, _)
		return { arguments = {} }
	end
})