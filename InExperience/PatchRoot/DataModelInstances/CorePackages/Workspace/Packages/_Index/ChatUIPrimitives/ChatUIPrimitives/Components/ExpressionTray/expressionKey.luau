local _ = require(script:FindFirstAncestor("ChatUIPrimitives").UniversalMessage.Types)

return {
	expressionKey = function(p1)
		return if p1.kind == "preset" then "preset:" .. p0.presetId elseif p1.kind == "emoji" then "emoji:" .. p0.emojiId elseif p1.kind == "asset" then "asset:" .. p0.assetId else "plain-text"
	end
}