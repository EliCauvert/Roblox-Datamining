local parent = script:FindFirstAncestor("ExpChat").Parent
local list = require(parent.llama).List
local emojiListModule = require(parent.EmojiList)

return function(p0) --[[ line: 6 ]]
	-- upvalues: list (ref), emojiListModule (ref)
	return list.sort(p0, function(p1, p2) --[[ line: 10 ]]
		-- upvalues: emojiListModule (copy)
		return if emojiListModule[p1].popularity == emojiListModule[p2].popularity then p1 < p2 else emojiListModule[p1].popularity < emojiListModule[p2].popularity
	end)
end