local List = require(script:FindFirstAncestor("ExpChat").Parent.llama).List
local TrieNodeModule = require(script:FindFirstAncestor("Autocomplete").Trie.TrieNode)
local TrieModule = {}
TrieModule.__index = TrieModule

function TrieModule.new()
	-- upvalues: TrieModule (copy), TrieNodeModule (copy)
	local t = {}
	setmetatable(t, TrieModule)
	t.root = TrieNodeModule.new("")
	
	return t
end

function TrieModule:insert(Text: string)
	-- upvalues: TrieNodeModule (copy)
	local Root = self.root
	
	for i = 1, #Text do
		local Segment = string.sub(Text, i, i)
		
		if not Root.children[Segment] then
			Root.children[Segment] = TrieNodeModule.new(Segment)
		end
		Root = Root.children[Segment]
	end
	Root.isEndOfWord = true
end

function TrieModule:autocomplete(Text: string)
	local HelperResult = {}
	local Root = self.root
	
	for i = 1, #Text do
		local Segment = string.sub(Text, i, i)
		
		if not Root.children[Segment] then
			return HelperResult
		end
		Root = Root.children[Segment]
	end
	return (self:helper(Root, HelperResult, (string.sub(Text, 1, #Text - 1))))
end

function TrieModule:helper(Root, HelperResult, Text)
	-- upvalues: List (copy)
	if Root.isEndOfWord then
		HelperResult = List.push(HelperResult, Text .. Root.data)
	end
	for _, child in pairs(Root.children) do
		HelperResult = self:helper(child, HelperResult, Text .. Root.data)
	end
	return HelperResult
end

return TrieModule