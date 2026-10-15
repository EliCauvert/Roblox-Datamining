local messageEffectModule = require(script.Parent.MessageEffect)
local fIntExpChatMessageEffectChatWindowEnlargeTextSizeModule = require(script:FindFirstAncestor("ExpChat").Flags.FIntExpChatMessageEffectChatWindowEnlargeTextSize)

return function(p1, p2)
	-- upvalues: messageEffectModule (ref), fIntExpChatMessageEffectChatWindowEnlargeTextSizeModule (ref)
	return if p2 and table.find(p2, messageEffectModule.ChatWindowEnlarge) then `<font size='{fIntExpChatMessageEffectChatWindowEnlargeTextSizeModule}'>{p1}</font>` else p1
end