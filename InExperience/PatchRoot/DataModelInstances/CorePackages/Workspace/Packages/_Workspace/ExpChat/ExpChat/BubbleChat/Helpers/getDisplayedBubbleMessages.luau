local List = require(script:FindFirstAncestor("ExpChat").Parent.llama).List
local IsBorderlessBubbleChatMessageModule = require(script.Parent.isBorderlessBubbleChatMessage)
local GetBubbleDurationInMillisModule = require(script.Parent.getBubbleDurationInMillis)
local GetBubbleChatStartTimeMillisModule = require(script.Parent.getBubbleChatStartTimeMillis)

return function(p1, p2, p3, p4) --[[ Line: 18 | Named "getDisplayedBubbleMessages" ]]
	-- upvalues: IsBorderlessBubbleChatMessageModule (copy), List (copy), GetBubbleChatStartTimeMillisModule (copy), GetBubbleDurationInMillisModule (copy)
	local Count = 0
	
	for i = #p1, 1, -1 do
		if not p1[i].isVisibleInBubbleChat or not IsBorderlessBubbleChatMessageModule(p1[i]) then
			continue
		end
		Count = i
		break
	end
	local Count1: number = if Count == #p1 then Count else Count + 1
	
	return List.filter(p1, function(p5, p6): boolean --[[ Line: 36 ]]
		-- upvalues: Count1 (copy), p1 (copy), p3 (copy), p4 (copy), GetBubbleChatStartTimeMillisModule (upval), GetBubbleDurationInMillisModule (upval), p2 (copy)
		return Count1 <= p6 and #p1 - p3 < p6 and (p5.isVisibleInBubbleChat and p4 - GetBubbleChatStartTimeMillisModule(p5) < GetBubbleDurationInMillisModule(p5, p2))
	end)
end