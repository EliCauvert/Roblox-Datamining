local messageEffectModule = require(script.Parent.MessageEffect)
local fIntExpChatMessageEffectChatWindowEnlargeTextSizeModule = require(script:FindFirstAncestor("ExpChat").Flags.FIntExpChatMessageEffectChatWindowEnlargeTextSize)

return function(p1, p2, p3)
	-- upvalues: messageEffectModule (ref), fIntExpChatMessageEffectChatWindowEnlargeTextSizeModule (ref)
	return if p1 and table.find(p1, messageEffectModule.ChatWindowEnlarge) then math.clamp(fIntExpChatMessageEffectChatWindowEnlargeTextSizeModule / math.min(p2, p3), 1, 3) else 1
end