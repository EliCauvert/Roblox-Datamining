local IsBorderlessBubbleChatMessageModule = require(script.Parent.isBorderlessBubbleChatMessage)
local _ = require(script.Parent.getBubbleChatDisplayText)

return function(p1) --[[ Line: 9 | Named "getBubbleChatStartTimeMillis" ]]
	-- upvalues: IsBorderlessBubbleChatMessageModule (copy)
	return if IsBorderlessBubbleChatMessageModule(p1) and p1.bubbleChatReceivedAtMillis then p1.bubbleChatReceivedAtMillis else p1.timestamp.UnixTimestampMillis
end