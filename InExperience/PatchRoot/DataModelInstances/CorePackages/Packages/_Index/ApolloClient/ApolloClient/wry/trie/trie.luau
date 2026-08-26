local _ = require(script.Parent.Parent.Parent.Parent.LuauPolyfill)
local t = {}

local function defaultMakeData()
	return {}
end

local t_1 = {}
t_1.__index = t_1

function t_1.new(p1, p2)
	-- upvalues: defaultMakeData (ref), t_1 (ref)
	local var1 = p1
	local var2 = p2
	
	if var1 == nil then
		var1 = true
	end
	if var2 == nil then
		var2 = defaultMakeData
	end
	local tbl = setmetatable({}, t_1)
	tbl.weakness = var1
	tbl.makeData = var2
	
	return tbl
end

function t_1:lookup(...)
	return self:lookupArray({ ... })
end

function t_1:lookupArray(p1)
	local var1 = self
	
	for i, v in p1 do
		var1 = var1:getChildTrie(v)
	end
	if not var1.data then
		var1.data = self.makeData(table.clone(p1))
	end
	return var1.data
end

function t_1:getChildTrie(p2)
	-- upvalues: t_1 (ref)
	local weak
	local _ = nil
	
	if self.weakness then
		if self.weak == nil then
			self.weak = setmetatable({}, { __mode = "k" })
		end
		weak = self.weak
	elseif self.strong == nil then
		self.strong = {}
	end
	weak = self.strong
	local var2 = weak[p2]
	
	if not var2 then
		var2 = t_1.new(self.weakness, self.makeData)
		weak[p2] = var2
	end
	return var2
end

t.Trie = t_1

return t