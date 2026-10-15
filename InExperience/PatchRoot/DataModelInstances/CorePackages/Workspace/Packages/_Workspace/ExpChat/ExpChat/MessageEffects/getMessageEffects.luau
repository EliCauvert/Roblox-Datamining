local messageEffectModule = require(script.Parent.MessageEffect)
local isSingleSupportedEmojiModule = require(script.Parent.isSingleSupportedEmoji)

return function(p1)
	-- upvalues: isSingleSupportedEmojiModule (ref), messageEffectModule (ref)
	local t = {}
	
	if isSingleSupportedEmojiModule(p1) then
		table.insert(t, messageEffectModule.BorderlessBubbleChat)
		table.insert(t, messageEffectModule.ChatWindowEnlarge)
	end
	return t
end