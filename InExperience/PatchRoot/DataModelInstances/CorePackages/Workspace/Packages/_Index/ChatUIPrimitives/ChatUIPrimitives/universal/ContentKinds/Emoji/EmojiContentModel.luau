local _ = require(script.Parent.Parent.Parent.Types)
local _ = require(script.Parent.EmojiTypes)
local EmojiContentModelModule = {
	detailFromEmoji = function(EmojiId, Unicode, Name)
		return {
			fallbackText = if Unicode == nil or Unicode == "" then nil else Unicode,
			emojiId = EmojiId,
			unicode = Unicode,
			name = Name
		}
	end
}

function EmojiContentModelModule.fromEmoji(EmojiId, Unicode, Name)
	-- upvalues: EmojiContentModelModule (copy)
	return {
		emoji = EmojiContentModelModule.detailFromEmoji(EmojiId, Unicode, Name)
	}
end

function EmojiContentModelModule.draftFromEmoji(EmojiId, Unicode)
	return { emoji = { emojiId = EmojiId, unicode = Unicode } }
end

function EmojiContentModelModule.getDisplayText(p1)
	return if p1.unicode == nil or p1.unicode == "" then if p1.fallbackText == nil or p1.fallbackText == "" then p1.name or "" else p1.fallbackText else p1.unicode
end

function EmojiContentModelModule.getDetail(p1)
	return p1.emoji
end

function EmojiContentModelModule.getDraft(p1)
	return p1.emoji
end

function EmojiContentModelModule.fromDraft(p1)
	-- upvalues: EmojiContentModelModule (copy)
	local Draft = EmojiContentModelModule.getDraft(p1)
	
	return if Draft == nil then nil else EmojiContentModelModule.fromEmoji(Draft.emojiId, Draft.unicode, nil)
end

return EmojiContentModelModule