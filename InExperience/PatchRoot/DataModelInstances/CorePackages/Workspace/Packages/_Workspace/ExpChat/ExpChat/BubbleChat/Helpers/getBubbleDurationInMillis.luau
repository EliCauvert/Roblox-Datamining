local IsBorderlessBubbleChatMessageModule = require(script.Parent.isBorderlessBubbleChatMessage)
local _ = require(script.Parent.getBubbleChatDisplayText)

return function(p1, p2) --[[ Line: 7 | Named "getBubbleDurationInMillis" ]]
	-- upvalues: IsBorderlessBubbleChatMessageModule (copy)
	return if IsBorderlessBubbleChatMessageModule(p1) then 3400 else p2
end