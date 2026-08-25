local t = {}
t.__index = t

function t.new(p0)
	-- upvalues: t (ref)
	assert(p0, "Cannot initialize CircularBuffer with nil")
	assert(p0 > 0, "Cannot initialize CircularBuffer to size < 1")
	local t_1 = {}
	setmetatable(t_1, t)
	t_1._data = {}
	t_1._backIndex = 0
	t_1._maxSize = p0
	
	return t_1
end

function t:reset()
	self._data = {}
	self._backIndex = 0
end

function t:getSize()
	return #self._data
end

function t:getMaxSize()
	return self._maxSize
end

function t:setSize(p1)
	assert(p1, "Cannot set CircularBuffer with nil")
	assert(p1 > 0, "Cannot set CircularBuffer to size < 1")
	
	if p1 == self._maxSize then return end
	local var2 = self:iterator()
	local var3 = var2:next()
	local t = {}
	local var5 = 0
	while var3 and var5 < p1 do
		local var6 = var5 + 1
		t[var6] = { entry = var3 }
		
		if t[var5] then
			t[var5]._next = t[var6]
		end
		var5 = var6
		var3 = var2:next()
	end
	self._data = t
	self._backIndex = var5
	self._maxSize = p1
end

function t:getFrontIndex()
	local var7 = self._backIndex + 1
	
	return if self._data[var7] then var7 else 1
end

function t:front()
	local frontIndex = self:getFrontIndex()
	
	return if self._data[frontIndex] then self._data[frontIndex].entry else nil
end

function t:back()
	return if self._data[self._backIndex] then self._data[self._backIndex].entry else nil
end

function t:iterator()
	return {
		data = self._data[self:getFrontIndex()],
		next = function(p2)
			local data = p2.data
			
			if data then
				p2.data = p2.data._next
			end
			return data and data.entry
		end
	}
end

function t:getData()
	return self._data
end

function t:at(p3)
	assert(p3, "Cannot index CircularBuffer with nil")
	local var9 = (self:getFrontIndex() + p3 - 2) % self._maxSize + 1
	
	return if self._data[var9] then self._data[var9].entry else nil
end

function t:reverseAt(p4)
	local var10 = (self._backIndex - p4) % self._maxSize + 1
	
	return if self._data[var10] then self._data[var10].entry else nil
end

function t:push_back(p5)
	local backIndex = self._backIndex
	local var11 = self._backIndex + 1
	
	if self._maxSize < var11 then
		var11 = 1
	end
	local var12 = self._data[var11]
	self._data[var11] = { entry = p5 }
	
	if backIndex > 0 then
		self._data[backIndex]._next = self._data[var11]
		
		if var12 then
			var12._next = nil
		end
	end
	self._backIndex = var11
	
	return var12 and var12.entry
end

return t