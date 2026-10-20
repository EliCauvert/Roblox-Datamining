local MessageEffectModule = require(script.Parent.MessageEffect)
local IsSingleSupportedEmojiModule = require(script.Parent.isSingleSupportedEmoji)

return function(p1)
	-- upvalues: IsSingleSupportedEmojiModule (copy), MessageEffectModule (copy)
	local List = {}
	
	if IsSingleSupportedEmojiModule(p1) then
		table.insert(List, MessageEffectModule.BorderlessBubbleChat)
		table.insert(List, MessageEffectModule.ChatWindowEnlarge)
	end
	return List
end