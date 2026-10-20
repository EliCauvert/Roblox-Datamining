local _ = require(script:FindFirstAncestor("ChatUIPrimitives").UniversalMessage.Types)

return {
	expressionKey = function(p1): string
		return if p1.kind == "preset" then "preset:" .. p1.presetId elseif p1.kind == "emoji" then "emoji:" .. p1.emojiId elseif p1.kind == "asset" then "asset:" .. p1.assetId else "plain-text"
	end
}