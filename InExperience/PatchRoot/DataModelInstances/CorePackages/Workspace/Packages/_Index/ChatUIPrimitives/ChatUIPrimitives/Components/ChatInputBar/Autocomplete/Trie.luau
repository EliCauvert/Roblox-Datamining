local t = {}
t.__index = t

function t.new(p0) --[[ line: 4 ]]
	-- upvalues: t (ref)
	local tbl = setmetatable({}, t)
	tbl.children = {}
	tbl.isEndOfWord = false
	tbl.data = p0
	
	return tbl
end

local t_1 = {}
t_1.__index = t_1

function t_1.new() --[[ line: 15 ]]
	-- upvalues: t_1 (ref), t (ref)
	local tbl = setmetatable({}, t_1)
	tbl.root = t.new("")
	
	return tbl
end

function t_1:insert(p1) --[[ line: 21 ]]
	-- upvalues: t (ref)
	local root = self.root
	
	for i = 1, #p1 do
		local substring = string.sub(p1, i, i)
		
		if not root.children[substring] then
			root.children[substring] = t.new(substring)
		end
		root = root.children[substring]
	end
	root.isEndOfWord = true
end

function t_1:autocomplete(p2) --[[ line: 33 ]]
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
	self:_collect(root, t, string.sub(p2, 1, #p2 - 1))
	
	return t
end

function t_1:_collect(p3, p4, p5) --[[ line: 48 ]]
	if p3.isEndOfWord then
		table.insert(p4, p5 .. p3.data)
	end
	for i, v in pairs(p3.children) do
		self:_collect(v, p4, p5 .. p3.data)
	end
end

return t_1