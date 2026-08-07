local list = require(script:FindFirstAncestor("ExpChat").Parent.llama).List
local trieNodeModule = require(script:FindFirstAncestor("Autocomplete").Trie.TrieNode)
local t = {}
t.__index = t

function t.new() --[[ line: 11 ]]
	-- upvalues: t (ref), trieNodeModule (ref)
	local t_1 = {}
	setmetatable(t_1, t)
	t_1.root = trieNodeModule.new("")
	
	return t_1
end

function t:insert(p0) --[[ line: 18 ]]
	-- upvalues: trieNodeModule (ref)
	local root = self.root
	
	for i = 1, #p0 do
		local substring = string.sub(p0, i, i)
		
		if not root.children[substring] then
			root.children[substring] = trieNodeModule.new(substring)
		end
		root = root.children[substring]
	end
	root.isEndOfWord = true
end

function t:autocomplete(p1) --[[ line: 30 ]]
	local substring
	local t = {}
	local root = self.root
	
	for i = 1, #p1 do
		substring = string.sub(p1, i, i)
		
		if not root.children[substring] then
			return t
		end
		root = root.children[substring]
	end
	return self:helper(root, t, string.sub(p1, 1, #p1 - 1))
end

function t:helper(p2, p3, p4) --[[ line: 45 ]]
	-- upvalues: list (ref)
	if p2.isEndOfWord then
		p3 = list.push(p3, p4 .. p2.data)
	end
	for i, v in pairs(p2.children) do
		p3 = self:helper(v, p3, p4 .. p2.data)
	end
	return p3
end

return t