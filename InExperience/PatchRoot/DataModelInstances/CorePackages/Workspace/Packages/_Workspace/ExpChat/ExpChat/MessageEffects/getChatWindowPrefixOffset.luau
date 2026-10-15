local messageEffectModule = require(script.Parent.MessageEffect)
local fIntExpChatMessageEffectChatWindowEnlargeTextSizeModule = require(script:FindFirstAncestor("ExpChat").Flags.FIntExpChatMessageEffectChatWindowEnlargeTextSize)

return function(value, p1)
	-- upvalues: messageEffectModule (ref), fIntExpChatMessageEffectChatWindowEnlargeTextSizeModule (ref)
	return if value and table.find(value, messageEffectModule.ChatWindowEnlarge) then math.max(0, math.round(fIntExpChatMessageEffectChatWindowEnlargeTextSizeModule * 0.44 - p1 / 2)) else 0
end