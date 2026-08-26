local map = require(script.Parent.Parent.Parent.LuauPolyfill).Map
local t = {}

local function defaultDispose() end

local t_1 = {}
t_1.__index = t_1

function t_1.new(p1, p2)
	-- upvalues: defaultDispose (ref), t_1 (ref), map (ref)
	local var1 = p1
	local var2 = p2
	
	if var1 == nil then
		var1 = 1e999
	end
	if var2 == nil then
		var2 = defaultDispose
	end
	local tbl = setmetatable({}, t_1)
	tbl.map = map.new(nil)
	tbl.newest = nil
	tbl.oldest = nil
	tbl.max = var1
	tbl.dispose = var2
	
	return tbl
end

function t_1:has(p1)
	return self.map:has(p1)
end

function t_1:get(p1)
	local var1 = self:getNode(p1)
	
	return var1 and var1.value
end

function t_1:getNode(p1)
	local var1 = self.map:get(p1)
	
	if var1 and var1 ~= self.newest then
		local older = var1.older
		local newer = var1.newer
		
		if newer then
			newer.older = older
		end
		if older then
			older.newer = newer
		end
		var1.older = self.newest
		var1.older.newer = var1
		var1.newer = nil
		self.newest = var1
		
		if var1 == self.oldest then
			self.oldest = newer
		end
	end
	return var1
end

function t_1:set(p1, p2)
	local var1 = self:getNode(p1)
	
	if var1 then
		var1.value = p2
		
		return var1.value
	end
	local t = { newer = nil, key = p1, value = p2, older = self.newest }
	
	if self.newest then
		self.newest.newer = t
	end
	self.newest = t
	self.oldest = self.oldest or t
	self.map:set(p1, t)
	
	return t.value
end

function t_1:clean()
	while self.oldest and self.max < self.map.size do
		self:delete(self.oldest.key)
	end
end

function t_1:delete(p1)
	local var1 = self.map:get(p1)
	
	if not var1 then
		return false
	elseif var1 == self.newest then
		self.newest = var1.older
	end
	if var1 == self.oldest then
		self.oldest = var1.newer
	end
	if var1.newer then
		var1.newer.older = var1.older
	end
	if var1.older then
		var1.older.newer = var1.newer
	end
	self.map:delete(p1)
	self.dispose(var1.value, p1)
	
	return true
end

t.Cache = t_1

return t