local parent = script.Parent.Parent
local parent_1 = parent.Parent
local cryoModule = require(parent_1.Cryo)
local _ = require(parent.Types)

return require(parent_1.Rodux).createReducer({}, {
	[require(parent.Actions.PromptDismissed).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.List.filter(p1, function(p3)
			-- upvalues: p2 (ref)
			return p3.PromptId ~= p2.promptId
		end)
	end,
	[require(parent.Actions.PromptTriggered).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.List.join(p1, {
			{
				PromptData = p2.promptData,
				PromptType = p2.promptType,
				PromptId = p2.promptId
			}
		})
	end
})