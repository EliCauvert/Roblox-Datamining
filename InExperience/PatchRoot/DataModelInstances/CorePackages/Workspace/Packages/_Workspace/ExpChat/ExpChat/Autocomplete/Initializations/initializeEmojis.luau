local parent = script:FindFirstAncestor("ExpChat").Parent
local list = require(parent.llama).List
local var0 = require(parent.llama).Dictionary.keys(require(parent.EmojiList))

return function(p0) --[[ line: 9 ]]
	-- upvalues: list (ref), var0 (ref)
	list.map(var0, function(p1) --[[ line: 10 ]]
		-- upvalues: p0 (ref)
		p0.trie:insert(p1)
	end)
	
	return p0.trie
end