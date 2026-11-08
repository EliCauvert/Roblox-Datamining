local SendEmojiExpressionModule = require(script.Parent.sendEmojiExpression)
local SendPresetExpressionModule = require(script.Parent.sendPresetExpression)

return function(p1, p2, p3)
	-- upvalues: SendPresetExpressionModule (copy), SendEmojiExpressionModule (copy)
	return if p1.kind == "preset" then SendPresetExpressionModule(p1.presetId, p2) else p1.kind == "emoji" and SendEmojiExpressionModule(p1.unicode, p2, p3)
end