local LinkedHashMapModule = {}
LinkedHashMapModule.__index = LinkedHashMapModule

function LinkedHashMapModule.new()
	-- upvalues: LinkedHashMapModule (copy)
	return (setmetatable({ _keys = {}, _present = {}, _values = {} }, LinkedHashMapModule))
end

function LinkedHashMapModule.newMap(p1)
	-- upvalues: LinkedHashMapModule (copy)
	local NewLinkedHashMap = LinkedHashMapModule.new()
	
	for i, value in p1:entrySet() do
		NewLinkedHashMap:put(i, value)
	end
	return NewLinkedHashMap
end

local Frozen = table.freeze((setmetatable({
	_keys = table.freeze({}),
	_present = table.freeze({}),
	_values = table.freeze({})
}, LinkedHashMapModule)))

function LinkedHashMapModule.of()
	-- upvalues: Frozen (copy)
	return Frozen
end

function LinkedHashMapModule:put(p2, p3)
	local Value = self._values[p2]
	
	if self._present[p2] == nil then
		table.insert(self._keys, p2)
		self._present[p2] = true
	end
	self._values[p2] = p3
	
	return Value
end

function LinkedHashMapModule:remove(Value)
	if self._present[Value] == nil then
		return nil
	else
		local Value1 = self._values[Value]
		table.remove(self._keys, table.find(self._keys, Value))
		self._present[Value] = nil
		self._values[Value] = nil
		
		return Value1
	end
end

function LinkedHashMapModule:get(p2)
	return self._values[p2]
end

function LinkedHashMapModule:containsKey(p2): boolean
	return self._present[p2] ~= nil
end

function LinkedHashMapModule:size(): number
	return #self._keys
end

function LinkedHashMapModule:isEmpty(): boolean
	return #self._keys == 0
end

function LinkedHashMapModule:entrySet()
	local Keys = self._keys
	local Values = self._values
	local Count = 0
	
	return function()
		-- upvalues: Count (ref), Keys (copy), Values (copy)
		Count += 1
		local Key = Keys[Count]
		
		if Key == nil then
			return nil, nil
		else
			return Key, Values[Key]
		end
	end
end

return LinkedHashMapModule