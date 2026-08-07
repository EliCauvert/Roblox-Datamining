local trieModule = require(script:FindFirstAncestor("Autocomplete").Trie.Trie)
local t = {}
t.__index = t

function t.new(p0) --[[ line: 11 ]]
	-- upvalues: t (ref), trieModule (ref)
	local t_1 = {}
	setmetatable(t_1, t)
	t_1.trie = trieModule.new()
	t_1.trie = p0(t_1)
	
	return t_1
end

function t:getResults(p1, p2) --[[ line: 22 ]]
	local var3 = self.trie:autocomplete(p1)
	
	return if p2 then p2(var3) else var3
end

return t