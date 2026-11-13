local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local RoduxModule = require(Parent.Rodux)
local Dictionary = require(Parent.llama).Dictionary

return RoduxModule.createReducer({ timeoutData = { endTimestamp = 0, isEnforced = false } }, {
	[require(ExpChat.Actions.ChatTimeoutUpdated).name] = function(p1, p2)
		-- upvalues: Dictionary (copy)
		return Dictionary.join(p1, {
			timeoutData = {
				endTimestamp = p2.endTimestamp,
				isEnforced = p2.isEnforced
			}
		})
	end
})