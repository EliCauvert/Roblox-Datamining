local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local cryoModule = require(parent.Cryo)

return require(parent.Rodux).createReducer({ arguments = {} }, {
	[require(squadsCore.Actions.SetSquadPrompt).name] = function(p0, p1)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p0, { arguments = p1.arguments or {} })
	end,
	[require(squadsCore.Actions.CloseSquadPrompt).name] = function(_, _)
		return { arguments = {} }
	end
})