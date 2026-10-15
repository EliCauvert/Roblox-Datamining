local isBorderlessBubbleChatMessageModule = require(script.Parent.isBorderlessBubbleChatMessage)
local _ = require(script.Parent.getBubbleChatDisplayText)

return function(p1)
	-- upvalues: isBorderlessBubbleChatMessageModule (ref)
	return if isBorderlessBubbleChatMessageModule(p1) and p1.bubbleChatReceivedAtMillis then p1.bubbleChatReceivedAtMillis else p1.timestamp.UnixTimestampMillis
end