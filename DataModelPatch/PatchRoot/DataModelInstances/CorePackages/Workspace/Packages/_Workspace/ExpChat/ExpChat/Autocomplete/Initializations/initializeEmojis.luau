local Parent = script:FindFirstAncestor("ExpChat").Parent
local List = require(Parent.llama).List
local KeysResult = require(Parent.llama).Dictionary.keys((require(Parent.EmojiList)))

return function(p1)
	-- upvalues: List (copy), KeysResult (copy)
	List.map(KeysResult, function(p2)
		-- upvalues: p1 (copy)
		p1.trie:insert(p2)
	end)
	
	return p1.trie
end