local list = require(script:FindFirstAncestor("ExpChat").Parent.llama).List
local isBorderlessBubbleChatMessageModule = require(script.Parent.isBorderlessBubbleChatMessage)
local getBubbleDurationInMillisModule = require(script.Parent.getBubbleDurationInMillis)
local getBubbleChatStartTimeMillisModule = require(script.Parent.getBubbleChatStartTimeMillis)

return function(p1, p2, p3, p4)
	-- upvalues: isBorderlessBubbleChatMessageModule (ref), list (ref), getBubbleChatStartTimeMillisModule (ref), getBubbleDurationInMillisModule (ref)
	local var1 = 0
	
	for i = #p1, 1, -1 do
		if not p1[i].isVisibleInBubbleChat or not isBorderlessBubbleChatMessageModule(p1[i]) then
			continue
		end
		var1 = i
		break
	end
	local var2 = if var1 == #p1 then var1 else var1 + 1
	
	return list.filter(p1, function(p5, p6)
		-- upvalues: var2 (ref), p1 (ref), p3 (ref), p4 (ref), getBubbleChatStartTimeMillisModule (copy), getBubbleDurationInMillisModule (copy), p2 (ref)
		return var2 <= p6 and (#p1 - p3 < p6 and (p5.isVisibleInBubbleChat and p4 - getBubbleChatStartTimeMillisModule(p5) < getBubbleDurationInMillisModule(p5, p2)))
	end)
end