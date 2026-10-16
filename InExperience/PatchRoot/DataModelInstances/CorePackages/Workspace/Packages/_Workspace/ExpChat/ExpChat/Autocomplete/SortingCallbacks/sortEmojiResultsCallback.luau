local Parent = script:FindFirstAncestor("ExpChat").Parent
local List = require(Parent.llama).List
local EmojiListModule = require(Parent.EmojiList)

return function(p1) --[[ Line: 6 ]]
	-- upvalues: List (copy), EmojiListModule (copy)
	return List.sort(p1, function(p2, p3): boolean --[[ Line: 10 ]]
		-- upvalues: EmojiListModule (upval)
		return if EmojiListModule[p2].popularity == EmojiListModule[p3].popularity then p2 < p3 else EmojiListModule[p2].popularity < EmojiListModule[p3].popularity
	end)
end