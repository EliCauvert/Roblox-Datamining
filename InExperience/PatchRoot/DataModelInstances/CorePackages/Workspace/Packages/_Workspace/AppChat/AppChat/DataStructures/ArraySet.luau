local t = {}

function t:__index(p0)
	-- upvalues: t (ref)
	return if type(p0) == "number" then self:at(p0) else t[p0]
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

function t:add(p3)
	if self._valueToIndex[p3] then
		return false
	end
	local var2 = self._size + 1
	self._valueToIndex[p3] = var2
	self._indexToValue[var2] = p3
	self._size = var2
	
	return true
end

function t:prependAll(p4)
	local t = {}
	local t_1 = {}
	
	for i, v in p4 do
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
		local var6 = self._indexToValue[i_1]
		self._indexToValue[i_1 + tCount] = var6
		self._valueToIndex[var6] = i_1 + tCount
	end
	for i_2, v_1 in t do
		self._indexToValue[i_2] = v_1
		self._valueToIndex[v_1] = i_2
	end
	self._size += tCount
	
	return true
end

function t:remove(p5)
	if not self._valueToIndex[p5] then
		return false
	end
	local var7 = self._valueToIndex[p5]
	self._valueToIndex[p5] = nil
	
	for i = var7 + 1, self._size do
		local var8 = self._indexToValue[i]
		self._indexToValue[i - 1] = var8
		self._valueToIndex[var8] = i - 1
	end
	self._indexToValue[self._size] = nil
	self._size -= 1
	
	return true
end

function t:has(p6)
	return self._valueToIndex[p6] ~= nil
end

function t:clear()
	self._valueToIndex = {}
	self._indexToValue = {}
	self._size = 0
end

function t:size()
	return self._size
end

function t:at(p7)
	return if p7 < 1 or self._size < p7 then nil else self._indexToValue[p7]
end

function t:indexOf(p8)
	return self._valueToIndex[p8]
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

function t.new(p9)
	-- upvalues: t (ref)
	local tbl = setmetatable({ _size = 0, _valueToIndex = {}, _indexToValue = {} }, t)
	
	if p9 then
		for i, v in p9 do
			tbl:add(v)
		end
	end
	return tbl
end

return t