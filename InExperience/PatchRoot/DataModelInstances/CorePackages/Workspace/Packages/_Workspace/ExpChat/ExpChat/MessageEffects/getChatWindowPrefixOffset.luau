local MessageEffectModule = require(script.Parent.MessageEffect)
local FIntExpChatMessageEffectChatWindowEnlargeTextSizeModule = require(script:FindFirstAncestor("ExpChat").Flags.FIntExpChatMessageEffectChatWindowEnlargeTextSize)

return function(List, p1: number): number
	-- upvalues: MessageEffectModule (copy), FIntExpChatMessageEffectChatWindowEnlargeTextSizeModule (copy)
	return if List and table.find(List, MessageEffectModule.ChatWindowEnlarge) then math.max(0, (math.round(FIntExpChatMessageEffectChatWindowEnlargeTextSizeModule * 0.44 - p1 / 2))) else 0
end