local parent = script.Parent.Parent
local parent_1 = parent.Parent
local cryoModule = require(parent_1.Cryo)
local _ = require(parent.Types)

return require(parent_1.Rodux).createReducer({}, {
	[require(parent.Actions.PromptDismissed).name] = function(p0, p1) --[[ line: 16 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.List.filter(p0, function(p2) --[[ line: 17 ]]
			-- upvalues: p1 (ref)
			return p2.PromptId ~= p1.promptId
		end)
	end,
	[require(parent.Actions.PromptTriggered).name] = function(p3, p4) --[[ line: 22 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.List.join(p3, {
			{
				PromptData = p4.promptData,
				PromptType = p4.promptType,
				PromptId = p4.promptId
			}
		})
	end
})