local ArraySetModule = {}

function ArraySetModule.__index(p1, p2)
	-- upvalues: ArraySetModule (copy)
	return if type(p2) == "number" then p1:at(p2) else ArraySetModule[p2]
end

function ArraySetModule:__len()
	return self:size()
end

function ArraySetModule:__newindex(p1, p2)
	self._indexToValue[p1] = p2
end

function ArraySetModule.__iter(p1)
	local Count = 0
	
	return function()
		-- upvalues: Count (ref), p1 (copy)
		Count += 1
		
		return if Count <= p1._size then p1._indexToValue[Count] else nil
	end
end

function ArraySetModule:add(p1): boolean
	if self._valueToIndex[p1] then
		return false
	else
		local NewSize = self._size + 1
		self._valueToIndex[p1] = NewSize
		self._indexToValue[NewSize] = p1
		self._size = NewSize
		
		return true
	end
end

function ArraySetModule:prependAll(List): boolean
	local List1 = {}
	local t = {}
	
	for _, value in List do
		if not self._valueToIndex[value] and not t[value] then
			t[value] = true
			table.insert(List1, value)
		end
	end
	if #List1 == 0 then
		return false
	end
	local CountList1 = #List1
	
	for i = self._size, 1, -1 do
		local IndexToValueEntry = self._indexToValue[i]
		self._indexToValue[i + CountList1] = IndexToValueEntry
		self._valueToIndex[IndexToValueEntry] = i + CountList1
	end
	for i1, value1 in List1 do
		self._indexToValue[i1] = value1
		self._valueToIndex[value1] = i1
	end
	self._size += CountList1
	
	return true
end

function ArraySetModule:remove(p1): boolean
	if not self._valueToIndex[p1] then
		return false
	end
	self._valueToIndex[p1] = nil
	
	for i = self._valueToIndex[p1] + 1, self._size do
		local IndexToValueEntry = self._indexToValue[i]
		self._indexToValue[i - 1] = IndexToValueEntry
		self._valueToIndex[IndexToValueEntry] = i - 1
	end
	self._indexToValue[self._size] = nil
	self._size -= 1
	
	return true
end

function ArraySetModule:has(p2): boolean
	return self._valueToIndex[p2] ~= nil
end

function ArraySetModule:clear()
	self._valueToIndex = {}
	self._indexToValue = {}
	self._size = 0
end

function ArraySetModule:size()
	return self._size
end

function ArraySetModule.at(p2, p3: number)
	return if p3 < 1 or p2._size < p3 then nil else p2._indexToValue[p3]
end

function ArraySetModule:indexOf(p2)
	return self._valueToIndex[p2]
end

function ArraySetModule:toArray()
	return table.clone(self._indexToValue)
end

function ArraySetModule:values()
	return self._indexToValue
end

function ArraySetModule:clone()
	-- upvalues: ArraySetModule (copy)
	return ArraySetModule.new(self._indexToValue)
end

function ArraySetModule.new(IndexToValue)
	-- upvalues: ArraySetModule (copy)
	local self = setmetatable({ _size = 0, _valueToIndex = {}, _indexToValue = {} }, ArraySetModule)
	
	if IndexToValue then
		for _, value in IndexToValue do
			self:add(value)
		end
	end
	return self
end

return ArraySetModule