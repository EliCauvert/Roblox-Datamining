local SquadsCore = script:FindFirstAncestor("SquadsCore")
local Parent = SquadsCore.Parent
local SetSquadPromptModule = require(SquadsCore.Actions.SetSquadPrompt)
local CloseSquadPromptModule = require(SquadsCore.Actions.CloseSquadPrompt)
local CryoModule = require(Parent.Cryo)

return require(Parent.Rodux).createReducer({ arguments = {} }, {
	[SetSquadPromptModule.name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { arguments = p2.arguments or {} })
	end,
	[CloseSquadPromptModule.name] = function(_, _)
		return { arguments = {} }
	end
})