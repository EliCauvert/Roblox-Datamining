local parent = script:FindFirstAncestor("ExpChat").Parent
local list = require(parent.llama).List
local var1 = require(parent.llama).Dictionary.keys(require(parent.EmojiList))

return function(p1)
	-- upvalues: list (ref), var1 (ref)
	list.map(var1, function(p2)
		-- upvalues: p1 (ref)
		p1.trie:insert(p2)
	end)
	
	return p1.trie
end