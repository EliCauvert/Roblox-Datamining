local t = {}

function t:__index(p1)
	-- upvalues: t (ref)
	return if type(p1) == "number" then self:at(p1) else t[p1]
end

function t:__len()
	return self:size()
end

function t:__newindex(p1, p2)
	self._indexToValue[p1] = p2
end

function t:__iter()
	local var1 = 0
	
	return function()
		-- upvalues: var1 (write), self (ref)
		var1 += 1
		
		return if var1 <= self._size then self._indexToValue[var1] else nil
	end
end

function t:add(p1)
	if self._valueToIndex[p1] then
		return false
	end
	local var1 = self._size + 1
	self._valueToIndex[p1] = var1
	self._indexToValue[var1] = p1
	self._size = var1
	
	return true
end

function t:prependAll(p1)
	local t = {}
	local t_1 = {}
	
	for i, v in p1 do
		if not self._valueToIndex[v] and not t_1[v] then
			t_1[v] = true
			table.insert(t, v)
		end
	end
	if #t == 0 then
		return false
	end
	local tCount = #t
	
	for i_1 = self._size, 1, -1 do
		local var1 = self._indexToValue[i_1]
		self._indexToValue[i_1 + tCount] = var1
		self._valueToIndex[var1] = i_1 + tCount
	end
	for i_2, v_1 in t do
		self._indexToValue[i_2] = v_1
		self._valueToIndex[v_1] = i_2
	end
	self._size += tCount
	
	return true
end

function t:remove(p2)
	if not self._valueToIndex[p2] then
		return false
	end
	local var2 = self._valueToIndex[p2]
	self._valueToIndex[p2] = nil
	
	for i = var2 + 1, self._size do
		local var3 = self._indexToValue[i]
		self._indexToValue[i - 1] = var3
		self._valueToIndex[var3] = i - 1
	end
	self._indexToValue[self._size] = nil
	self._size -= 1
	
	return true
end

function t:has(p3)
	return self._valueToIndex[p3] ~= nil
end

function t:clear()
	self._valueToIndex = {}
	self._indexToValue = {}
	self._size = 0
end

function t:size()
	return self._size
end

function t:at(p3)
	return if p3 < 1 or self._size < p3 then nil else self._indexToValue[p3]
end

function t:indexOf(p3)
	return self._valueToIndex[p3]
end

function t:toArray()
	return table.clone(self._indexToValue)
end

function t:values()
	return self._indexToValue
end

function t:clone()
	-- upvalues: t (ref)
	return t.new(self._indexToValue)
end

function t.new(p3)
	-- upvalues: t (ref)
	local tbl = setmetatable({ _size = 0, _valueToIndex = {}, _indexToValue = {} }, t)
	
	if p3 then
		for i, v in p3 do
			tbl:add(v)
		end
	end
	return tbl
end

return t