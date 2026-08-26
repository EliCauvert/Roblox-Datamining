local list = require(script:FindFirstAncestor("ExpChat").Parent.llama).List
local trieNodeModule = require(script:FindFirstAncestor("Autocomplete").Trie.TrieNode)
local t = {}
t.__index = t

function t.new()
	-- upvalues: t (ref), trieNodeModule (ref)
	local t_1 = {}
	setmetatable(t_1, t)
	t_1.root = trieNodeModule.new("")
	
	return t_1
end

function t:insert(p1)
	-- upvalues: trieNodeModule (ref)
	local root = self.root
	
	for i = 1, #p1 do
		local substring = string.sub(p1, i, i)
		
		if not root.children[substring] then
			root.children[substring] = trieNodeModule.new(substring)
		end
		root = root.children[substring]
	end
	root.isEndOfWord = true
end

function t:autocomplete(p2)
	local substring
	local t = {}
	local root = self.root
	
	for i = 1, #p2 do
		substring = string.sub(p2, i, i)
		
		if not root.children[substring] then
			return t
		end
		root = root.children[substring]
	end
	return self:helper(root, t, string.sub(p2, 1, #p2 - 1))
end

function t:helper(p3, p4, p5)
	-- upvalues: list (ref)
	if p3.isEndOfWord then
		p4 = list.push(p4, p5 .. p2.data)
	end
	for i, v in pairs(p3.children) do
		p4 = self:helper(v, p4, p5 .. p2.data)
	end
	return p4
end

return t