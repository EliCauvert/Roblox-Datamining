local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local CryoModule = require(Parent1.Cryo)
local _ = require(Parent.Types)

return require(Parent1.Rodux).createReducer({}, {
	[require(Parent.Actions.PromptDismissed).name] = function(p1, p2) --[[ Line: 16 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.List.filter(p1, function(p3): boolean --[[ Line: 17 ]]
			-- upvalues: p2 (copy)
			return p3.PromptId ~= p2.promptId
		end)
	end,
	[require(Parent.Actions.PromptTriggered).name] = function(p1, p2) --[[ Line: 22 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.List.join(p1, {
			{
				PromptData = p2.promptData,
				PromptType = p2.promptType,
				PromptId = p2.promptId
			}
		})
	end
})