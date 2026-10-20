local DEV = _G.__DEV__
local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local ForEachModule = require(Parent.Array.forEach)
local MapModule1 = require(Parent.Array.map)
local IsArrayModule = require(Parent.Array.isArray)
local InstanceOfModule = require(Parent1.InstanceOf)
local _ = require(Parent1.ES7Types)
local MapModule = {}

function MapModule.new(Entry)
	-- upvalues: IsArrayModule (copy), DEV (copy), InstanceOfModule (copy), MapModule (copy)
	local List = nil
	local _map = nil
	
	if Entry == nil then
		List = {}
		_map = {}
	elseif IsArrayModule(Entry) then
		if DEV and #Entry > 0 and typeof(Entry[1]) ~= "table" then
			error("Value `" .. typeof(Entry[1]) .. "` is not an entry object.\n " .. "Cannot create Map from {K, V} form, it must be { {K, V}... }")
		end
		List = table.create(#Entry)
		_map = {}
		
		for _, value in Entry do
			local v1 = value[1]
			
			if DEV and v1 == nil then
				error("cannot create Map from a table that isn't an array.")
			end
			local Entry1 = value[2]
			
			if _map[v1] == nil then
				table.insert(List, v1)
			end
			_map[v1] = Entry1
		end
	elseif InstanceOfModule(Entry, MapModule) then
		List = table.clone(Entry._array)
		_map = table.clone(Entry._map)
	else
		error(("`%s` `%s` is not iterable, cannot make Map using it"):format(typeof(Entry), (tostring(Entry))))
	end
	return (setmetatable({ size = #List, _map = _map, _array = List }, MapModule))
end

function MapModule:set(p1, p2)
	if self._map[p1] == nil then
		self.size += 1
		table.insert(self._array, p1)
	end
	self._map[p1] = p2
	
	return self
end

function MapModule:get(p1)
	return self._map[p1]
end

function MapModule:clear()
	local v2 = table
	self.size = 0
	v2.clear(self._map)
	v2.clear(self._array)
end

function MapModule:delete(Value): boolean
	if self._map[Value] == nil then
		return false
	end
	self.size -= 1
	self._map[Value] = nil
	local FoundIndex: number? = table.find(self._array, Value)
	
	if FoundIndex then
		table.remove(self._array, FoundIndex)
	end
	return true
end

function MapModule:forEach(Callback, p1)
	-- upvalues: DEV (copy), ForEachModule (copy)
	if DEV and typeof(Callback) ~= "function" then
		error("callback is not a function")
	end
	ForEachModule(self._array, function(p2)
		-- upvalues: self (copy), p1 (copy), Callback (copy)
		local MapEntry = self._map[p2]
		
		if p1 == nil then
			Callback(MapEntry, p2, self)
			
			return
		else
			Callback(p1, MapEntry, p2, self)
		end
	end)
end

function MapModule:has(p1): boolean
	return self._map[p1] ~= nil
end

function MapModule:keys()
	return self._array
end

function MapModule:values()
	-- upvalues: MapModule1 (copy)
	return MapModule1(self._array, function(p1)
		-- upvalues: self (copy)
		return self._map[p1]
	end)
end

function MapModule:entries()
	-- upvalues: MapModule1 (copy)
	return MapModule1(self._array, function(p1)
		-- upvalues: self (copy)
		return { p1, self._map[p1] }
	end)
end

function MapModule:ipairs()
	-- upvalues: DEV (copy)
	if DEV then
		warn(debug.traceback("`for _,_ in myMap:ipairs() do` is deprecated and will be removed in a future release, please use `for _,_ in myMap do` instead\n", 2))
	end
	return ipairs(self:entries())
end

function MapModule:__iter()
	return next, self:entries()
end

function MapModule.__index(p1, p2)
	-- upvalues: MapModule (copy), DEV (copy)
	local RawValue = rawget(MapModule, p2)
	
	if RawValue ~= nil then
		return RawValue
	end
	if DEV then
		assert(rawget(p1, "_map"), "Map has been corrupted, and is missing private state! Did you accidentally call table.clear() instead of map:clear()?")
	end
	return MapModule.get(p1, p2)
end

function MapModule:__newindex(p1, p2)
	self:set(p1, p2)
end

return MapModule