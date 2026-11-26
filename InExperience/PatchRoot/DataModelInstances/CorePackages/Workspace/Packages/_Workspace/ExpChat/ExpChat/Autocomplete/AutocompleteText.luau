local Autocomplete = script:FindFirstAncestor("Autocomplete")
local FFlagExpChatAutocompleteSortedIndexModule = require(script:FindFirstAncestor("ExpChat").Flags.FFlagExpChatAutocompleteSortedIndex)
local SortedPrefixIndexModule = require(Autocomplete.SortedPrefixIndex)
local TrieModule = require(Autocomplete.Trie.Trie)
local AutocompleteTextModule = {}
AutocompleteTextModule.__index = AutocompleteTextModule

function AutocompleteTextModule.new(Callback)
	-- upvalues: AutocompleteTextModule (copy), FFlagExpChatAutocompleteSortedIndexModule (copy), SortedPrefixIndexModule (copy), TrieModule (copy)
	local t = {}
	setmetatable(t, AutocompleteTextModule)
	t.trie = if FFlagExpChatAutocompleteSortedIndexModule then SortedPrefixIndexModule.new() else TrieModule.new()
	t.trie = Callback(t)
	
	if FFlagExpChatAutocompleteSortedIndexModule then
		t.trie:finalize()
	end
	return t
end

function AutocompleteTextModule:getResults(p1, Callback)
	local AutocompleteResult = self.trie:autocomplete(p1)
	
	return if Callback then Callback(AutocompleteResult) else AutocompleteResult
end

return AutocompleteTextModule