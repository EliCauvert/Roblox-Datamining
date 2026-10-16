local Map = require(script.Parent.Parent.Parent.LuauPolyfill).Map

local function defaultDispose() --[[ Line: 21 ]] end

local Module = {}
Module.__index = Module

function Module.new(Max, Dispose) --[[ Line: 51 ]]
	-- upvalues: defaultDispose (copy), Module (copy), Map (copy)
	local Max1: number = Max
	local Dispose1 = Dispose
	
	if Max1 == nil then
		Max1 = 1e999
	end
	if Dispose1 == nil then
		Dispose1 = defaultDispose
	end
	local self = setmetatable({}, Module)
	self.map = Map.new(nil)
	self.newest = nil
	self.oldest = nil
	self.max = Max1
	self.dispose = Dispose1
	
	return self
end

function Module:has(p1) --[[ Line: 73 ]]
	return self.map:has(p1)
end

function Module:get(p1) --[[ Line: 77 ]]
	local Node = self:getNode(p1)
	
	return if Node then Node.value else Node
end

function Module:getNode(Key) --[[ Line: 87 ]]
	local GetResult = self.map:get(Key)
	
	if GetResult and GetResult ~= self.newest then
		local Older = GetResult.older
		local Newer = GetResult.newer
		
		if Newer then
			Newer.older = Older
		end
		if Older then
			Older.newer = Newer
		end
		GetResult.older = self.newest
		GetResult.older.newer = GetResult
		GetResult.newer = nil
		self.newest = GetResult
		
		if GetResult == self.oldest then
			self.oldest = Newer
		end
	end
	return GetResult
end

function Module:set(Key, Value) --[[ Line: 121 ]]
	local Node = self:getNode(Key)
	
	if Node then
		Node.value = Value
		
		return Node.value
	end
	local Newer = {
		newer = nil,
		key = Key,
		value = Value,
		older = self.newest
	}
	
	if self.newest then
		self.newest.newer = Newer
	end
	self.newest = Newer
	self.oldest = self.oldest or Newer
	self.map:set(Key, Newer)
	
	return Newer.value
end

function Module:clean() --[[ Line: 152 ]]
	while self.oldest and self.max < self.map.size do
		self:delete(self.oldest.key)
	end
end

function Module:delete(Key): boolean --[[ Line: 160 ]]
	local GetResult = self.map:get(Key)
	
	if not GetResult then
		return false
	end
	if GetResult == self.newest then
		self.newest = GetResult.older
	end
	if GetResult == self.oldest then
		self.oldest = GetResult.newer
	end
	if GetResult.newer then
		GetResult.newer.older = GetResult.older
	end
	if GetResult.older then
		GetResult.older.newer = GetResult.newer
	end
	self.map:delete(Key)
	self.dispose(GetResult.value, Key)
	
	return true
end

return { Cache = Module }