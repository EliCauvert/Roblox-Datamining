local dEV = _G.__DEV__
local parent = script.Parent.Parent
local parent_1 = parent.Parent
local forEachModule = require(parent.Array.forEach)
local mapModule = require(parent.Array.map)
local isArrayModule = require(parent.Array.isArray)
local instanceOfModule = require(parent_1.InstanceOf)
local _ = require(parent_1.ES7Types)
local t = {}

function t.new(p1)
	-- upvalues: isArrayModule (ref), dEV (ref), instanceOfModule (ref), t (ref)
	local cloned = nil
	local cloned_1 = nil
	
	if p1 == nil then
		cloned = {}
		cloned_1 = {}
	elseif isArrayModule(p1) then
		if dEV and #p1 > 0 and typeof(p1[1]) ~= "table" then
			error("Value `" .. typeof(p1[1]) .. "` is not an entry object.\n " .. "Cannot create Map from {K, V} form, it must be { {K, V}... }")
		end
		cloned = table.create(#p1)
		cloned_1 = {}
		
		for i, v in p1 do
			local var1 = v[1]
			
			if dEV and var1 == nil then
				error("cannot create Map from a table that isn't an array.")
			end
			local var2 = v[2]
			
			if cloned_1[var1] == nil then
				table.insert(cloned, var1)
			end
			cloned_1[var1] = var2
		end
	elseif instanceOfModule(p1, t) then
		cloned = table.clone(p1._array)
		cloned_1 = table.clone(p1._map)
	else
		error(("`%s` `%s` is not iterable, cannot make Map using it"):format(typeof(p1), tostring(p1)))
	end
	return setmetatable({ size = #cloned, _map = cloned_1, _array = cloned }, t)
end

function t:set(p2, p3)
	if self._map[p2] == nil then
		self.size += 1
		table.insert(self._array, p2)
	end
	self._map[p2] = p3
	
	return self
end

function t:get(p2)
	return self._map[p2]
end

function t:clear()
	local _table = table
	self.size = 0
	_table.clear(self._map)
	_table.clear(self._array)
end

function t:delete(p2)
	if self._map[p2] == nil then
		return false
	end
	self.size -= 1
	self._map[p2] = nil
	local index = table.find(self._array, p2)
	
	if index then
		table.remove(self._array, index)
	end
	return true
end

function t:forEach(p2, p3)
	-- upvalues: dEV (ref), forEachModule (ref)
	if dEV and typeof(p2) ~= "function" then
		error("callback is not a function")
	end
	forEachModule(self._array, function(p4)
		-- upvalues: self (ref), p3 (ref), p2 (ref)
		local var3 = self._map[p4]
		
		if p3 == nil then
			p2(var3, p4, self)
			
			return
		end
		p2(p3, var3, p4, self)
	end)
end

function t:has(p2)
	return self._map[p2] ~= nil
end

function t:keys()
	return self._array
end

function t:values()
	-- upvalues: mapModule (ref)
	return mapModule(self._array, function(p2)
		-- upvalues: self (ref)
		return self._map[p2]
	end)
end

function t:entries()
	-- upvalues: mapModule (ref)
	return mapModule(self._array, function(p2)
		-- upvalues: self (ref)
		return { p2, self._map[p2] }
	end)
end

function t:ipairs()
	-- upvalues: dEV (ref)
	if dEV then
		warn(debug.traceback("`for _,_ in myMap:ipairs() do` is deprecated and will be removed in a future release, please use `for _,_ in myMap do` instead\n", 2))
	end
	return ipairs(self:entries())
end

function t:__iter()
	return next, self:entries()
end

function t:__index(p2)
	-- upvalues: t (ref), dEV (ref)
	local var3 = rawget(t, p2)
	
	if var3 ~= nil then
		return var3
	elseif dEV then
		assert(rawget(self, "_map"), "Map has been corrupted, and is missing private state! Did you accidentally call table.clear() instead of map:clear()?")
	end
	return t.get(self, p2)
end

function t:__newindex(p2, p3)
	self:set(p2, p3)
end

return t