local _ = require(script.Parent.Parent.Parent.Parent.LuauPolyfill)
local t = {}

local function defaultMakeData()
	return {}
end

local t_1 = {}
t_1.__index = t_1

function t_1.new(p0, p1)
	-- upvalues: defaultMakeData (ref), t_1 (ref)
	local var3 = p0
	local var4 = p1
	
	if var3 == nil then
		var3 = true
	end
	if var4 == nil then
		var4 = defaultMakeData
	end
	local tbl = setmetatable({}, t_1)
	tbl.weakness = var3
	tbl.makeData = var4
	
	return tbl
end

function t_1:lookup(...)
	return self:lookupArray({ ... })
end

function t_1:lookupArray(p2)
	local var6 = self
	
	for i, v in p2 do
		var6 = var6:getChildTrie(v)
	end
	if not var6.data then
		var6.data = self.makeData(table.clone(p2))
	end
	return var6.data
end

function t_1:getChildTrie(p3)
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
	local var7 = weak[p3]
	
	if not var7 then
		var7 = t_1.new(self.weakness, self.makeData)
		weak[p3] = var7
	end
	return var7
end

t.Trie = t_1

return t