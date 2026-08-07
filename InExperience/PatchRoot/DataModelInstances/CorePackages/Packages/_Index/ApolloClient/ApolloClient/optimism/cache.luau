local map = require(script.Parent.Parent.Parent.LuauPolyfill).Map
local t = {}

local function defaultDispose() --[[ line: 21 ]] end

local t_1 = {}
t_1.__index = t_1

function t_1.new(p0, p1) --[[ line: 51 ]]
	-- upvalues: defaultDispose (ref), t_1 (ref), map (ref)
	local var3 = p0
	local var4 = p1
	
	if var3 == nil then
		var3 = 1e999
	end
	if var4 == nil then
		var4 = defaultDispose
	end
	local tbl = setmetatable({}, t_1)
	tbl.map = map.new(nil)
	tbl.newest = nil
	tbl.oldest = nil
	tbl.max = var3
	tbl.dispose = var4
	
	return tbl
end

function t_1:has(p2) --[[ line: 73 ]]
	return self.map:has(p2)
end

function t_1:get(p3) --[[ line: 77 ]]
	local var6 = self:getNode(p3)
	
	return var6 and var6.value
end

function t_1:getNode(p4) --[[ line: 87 ]]
	local var7 = self.map:get(p4)
	
	if var7 and var7 ~= self.newest then
		local older = var7.older
		local newer = var7.newer
		
		if newer then
			newer.older = older
		end
		if older then
			older.newer = newer
		end
		var7.older = self.newest
		var7.older.newer = var7
		var7.newer = nil
		self.newest = var7
		
		if var7 == self.oldest then
			self.oldest = newer
		end
	end
	return var7
end

function t_1:set(p5, p6) --[[ line: 121 ]]
	local var8 = self:getNode(p5)
	
	if var8 then
		var8.value = p6
		
		return var8.value
	end
	local t = { newer = nil, key = p5, value = p6, older = self.newest }
	
	if self.newest then
		self.newest.newer = t
	end
	self.newest = t
	self.oldest = self.oldest or t
	self.map:set(p5, t)
	
	return t.value
end

function t_1:clean() --[[ line: 152 ]]
	while self.oldest and self.max < self.map.size do
		self:delete(self.oldest.key)
	end
end

function t_1:delete(p7) --[[ line: 160 ]]
	local var10 = self.map:get(p7)
	
	if not var10 then
		return false
	elseif var10 == self.newest then
		self.newest = var10.older
	end
	if var10 == self.oldest then
		self.oldest = var10.newer
	end
	if var10.newer then
		var10.newer.older = var10.older
	end
	if var10.older then
		var10.older.newer = var10.newer
	end
	self.map:delete(p7)
	self.dispose(var10.value, p7)
	
	return true
end

t.Cache = t_1

return t