local MessageEffectModule = require(script.Parent.MessageEffect)
local FIntExpChatMessageEffectChatWindowEnlargeTextSizeModule = require(script:FindFirstAncestor("ExpChat").Flags.FIntExpChatMessageEffectChatWindowEnlargeTextSize)

return function(List, p1: number, p2: number): number
	-- upvalues: MessageEffectModule (copy), FIntExpChatMessageEffectChatWindowEnlargeTextSizeModule (copy)
	return if List and table.find(List, MessageEffectModule.ChatWindowEnlarge) then math.clamp(FIntExpChatMessageEffectChatWindowEnlargeTextSizeModule / math.min(p1, p2), 1, 3) else 1
end