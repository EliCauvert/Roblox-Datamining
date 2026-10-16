local TrieModule = require(script:FindFirstAncestor("Autocomplete").Trie.Trie)
local AutocompleteTextModule = {}
AutocompleteTextModule.__index = AutocompleteTextModule

function AutocompleteTextModule.new(Callback) --[[ Line: 11 ]]
	-- upvalues: AutocompleteTextModule (copy), TrieModule (copy)
	local t = {}
	setmetatable(t, AutocompleteTextModule)
	t.trie = TrieModule.new()
	t.trie = Callback(t)
	
	return t
end

function AutocompleteTextModule:getResults(p1, Callback) --[[ Line: 22 ]]
	local AutocompleteResult = self.trie:autocomplete(p1)
	
	return if Callback then Callback(AutocompleteResult) else AutocompleteResult
end

return AutocompleteTextModule