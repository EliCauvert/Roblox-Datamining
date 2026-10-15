local isBorderlessBubbleChatMessageModule = require(script.Parent.isBorderlessBubbleChatMessage)
local _ = require(script.Parent.getBubbleChatDisplayText)

return function(p1, p2)
	-- upvalues: isBorderlessBubbleChatMessageModule (ref)
	return if isBorderlessBubbleChatMessageModule(p1) then 3400 else p2
end