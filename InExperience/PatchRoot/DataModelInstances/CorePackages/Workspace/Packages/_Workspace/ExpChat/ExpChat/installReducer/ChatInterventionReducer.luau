local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local dictionary = require(parent.llama).Dictionary

return require(parent.Rodux).createReducer({ timeoutData = { endTimestamp = 0, isEnforced = false } }, {
	[require(expChat.Actions.ChatTimeoutUpdated).name] = function(p1, p2)
		-- upvalues: dictionary (ref)
		return dictionary.join(p1, {
			timeoutData = {
				endTimestamp = p2.endTimestamp,
				isEnforced = p2.isEnforced
			}
		})
	end
})