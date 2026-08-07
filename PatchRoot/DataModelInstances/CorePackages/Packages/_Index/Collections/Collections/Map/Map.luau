-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:55 2026 Pacific Standard Time.

local dEV = _G.__DEV__
local parent = script.Parent.Parent
local parent_1 = parent.Parent
local forEachModule = require(parent.Array.forEach)
local mapModule = require(parent.Array.map)
local isArrayModule = require(parent.Array.isArray)
local instanceOfModule = require(parent_1.InstanceOf)
local _ = require(parent_1.ES7Types)
local t = {}

function t.new(p0) --[[ line: 39 ]]
	-- upvalues: isArrayModule (ref), dEV (ref), instanceOfModule (ref), t (ref)
	local cloned = nil
	local cloned_1 = nil
	
	if p0 == nil then
		cloned = {}
		cloned_1 = {}
	elseif isArrayModule(p0) then
		if dEV and #p0 > 0 and typeof(p0[1]) ~= "table" then
			error("Value `" .. typeof(p0[1]) .. "` is not an entry object.\n " .. "Cannot create Map from {K, V} form, it must be { {K, V}... }")
		end
		cloned = table.create(#p0)
		cloned_1 = {}
		
		for i, v in p0 do
			local var7 = v[1]
			
			if dEV and var7 == nil then
				error("cannot create Map from a table that isn't an array.")
			end
			local var8 = v[2]
			
			if cloned_1[var7] == nil then
				table.insert(cloned, var7)
			end
			cloned_1[var7] = var8
		end
	elseif instanceOfModule(p0, t) then
		cloned = table.clone(p0._array)
		cloned_1 = table.clone(p0._map)
	else
		error(("`%s` `%s` is not iterable, cannot make Map using it"):format(typeof(p0), tostring(p0)))
	end
	return setmetatable({ size = #cloned, _map = cloned_1, _array = cloned }, t)
end

function t:set(p1, p2) --[[ line: 88 ]]
	if self._map[p1] == nil then
		self.size += 1
		table.insert(self._array, p1)
	end
	self._map[p1] = p2
	
	return self
end

function t:get(p3) --[[ line: 100 ]]
	return self._map[p3]
end

function t:clear() --[[ line: 104 ]]
	local _table = table
	self.size = 0
	_table.clear(self._map)
	_table.clear(self._array)
end

function t:delete(p4) --[[ line: 111 ]]
	if self._map[p4] == nil then
		return false
	end
	self.size -= 1
	self._map[p4] = nil
	local index = table.find(self._array, p4)
	
	if index then
		table.remove(self._array, index)
	end
	return true
end

function t:forEach(p5, p6) --[[ line: 127 ]]
	-- upvalues: dEV (ref), forEachModule (ref)
	if dEV and typeof(p5) ~= "function" then
		error("callback is not a function")
	end
	forEachModule(self._array, function(p7) --[[ line: 134 ]]
		-- upvalues: self (ref), p6 (ref), p5 (ref)
		local var11 = self._map[p7]
		
		if p6 == nil then
			p5(var11, p7, self)
			
			return
		end
		p5(p6, var11, p7, self)
	end)
end

function t:has(p8) --[[ line: 145 ]]
	return self._map[p8] ~= nil
end

function t:keys() --[[ line: 149 ]]
	return self._array
end

function t:values() --[[ line: 153 ]]
	-- upvalues: mapModule (ref)
	return mapModule(self._array, function(p9) --[[ line: 154 ]]
		-- upvalues: self (ref)
		return self._map[p9]
	end)
end

function t:entries() --[[ line: 159 ]]
	-- upvalues: mapModule (ref)
	return mapModule(self._array, function(p10) --[[ line: 160 ]]
		-- upvalues: self (ref)
		return { p10, self._map[p10] }
	end)
end

function t:ipairs() --[[ line: 165 ]]
	-- upvalues: dEV (ref)
	if dEV then
		warn(debug.traceback("`for _,_ in myMap:ipairs() do` is deprecated and will be removed in a future release, please use `for _,_ in myMap do` instead\n", 2))
	end
	return ipairs(self:entries())
end

function t:__iter() --[[ line: 177 ]]
	return next, self:entries()
end

function t:__index(p11) --[[ line: 181 ]]
	-- upvalues: t (ref), dEV (ref)
	local var12 = rawget(t, p11)
	
	if var12 ~= nil then
		return var12
	elseif dEV then
		assert(rawget(self, "_map"), "Map has been corrupted, and is missing private state! Did you accidentally call table.clear() instead of map:clear()?")
	end
	return t.get(self, p11)
end

function t:__newindex(p12, p13) --[[ line: 197 ]]
	self:set(p12, p13)
end

return t