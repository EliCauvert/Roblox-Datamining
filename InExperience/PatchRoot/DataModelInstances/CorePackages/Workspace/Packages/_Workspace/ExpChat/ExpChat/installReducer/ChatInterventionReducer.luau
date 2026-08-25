local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local dictionary = require(parent.llama).Dictionary

return require(parent.Rodux).createReducer({ timeoutData = { endTimestamp = 0, isEnforced = false } }, {
	[require(expChat.Actions.ChatTimeoutUpdated).name] = function(p0, p1)
		-- upvalues: dictionary (ref)
		return dictionary.join(p0, {
			timeoutData = {
				endTimestamp = p1.endTimestamp,
				isEnforced = p1.isEnforced
			}
		})
	end
})