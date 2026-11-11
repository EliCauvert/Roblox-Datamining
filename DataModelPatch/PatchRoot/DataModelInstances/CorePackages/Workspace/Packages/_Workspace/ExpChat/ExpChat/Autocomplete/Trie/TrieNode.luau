local TrieNodeModule = {}
TrieNodeModule.__index = TrieNodeModule

function TrieNodeModule.new(Data)
	-- upvalues: TrieNodeModule (copy)
	local t = {}
	setmetatable(t, TrieNodeModule)
	t.children = {}
	t.isEndOfWord = false
	t.data = Data
	
	return t
end

return TrieNodeModule