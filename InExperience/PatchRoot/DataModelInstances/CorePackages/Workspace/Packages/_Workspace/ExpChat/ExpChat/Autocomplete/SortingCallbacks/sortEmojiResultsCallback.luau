local parent = script:FindFirstAncestor("ExpChat").Parent
local list = require(parent.llama).List
local emojiListModule = require(parent.EmojiList)

return function(p1)
	-- upvalues: list (ref), emojiListModule (ref)
	return list.sort(p1, function(p2, p3)
		-- upvalues: emojiListModule (copy)
		return if emojiListModule[p2].popularity == emojiListModule[p3].popularity then p2 < p3 else emojiListModule[p2].popularity < emojiListModule[p3].popularity
	end)
end