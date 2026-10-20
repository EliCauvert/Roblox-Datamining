local MessageEffectModule = require(script.Parent.MessageEffect)
local FIntExpChatMessageEffectChatWindowEnlargeTextSizeModule = require(script:FindFirstAncestor("ExpChat").Flags.FIntExpChatMessageEffectChatWindowEnlargeTextSize)

return function(p1, List)
	-- upvalues: MessageEffectModule (copy), FIntExpChatMessageEffectChatWindowEnlargeTextSizeModule (copy)
	return if List and table.find(List, MessageEffectModule.ChatWindowEnlarge) then `<font size='{FIntExpChatMessageEffectChatWindowEnlargeTextSizeModule}'>{p1}</font>` else p1
end