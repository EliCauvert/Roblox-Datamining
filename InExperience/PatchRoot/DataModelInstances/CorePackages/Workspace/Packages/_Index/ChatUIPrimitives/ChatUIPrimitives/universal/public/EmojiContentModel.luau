local EmojiContentModelModule = require(script.Parent.Parent.ContentKinds.Emoji.EmojiContentModel)

return {
	fromEmoji = function(p1, p2, p3)
		-- upvalues: EmojiContentModelModule (copy)
		return EmojiContentModelModule.fromEmoji(p1, p2, p3)
	end
}