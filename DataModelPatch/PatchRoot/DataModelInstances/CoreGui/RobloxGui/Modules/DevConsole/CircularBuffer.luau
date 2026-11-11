local CircularBufferModule = {}
CircularBufferModule.__index = CircularBufferModule

function CircularBufferModule.new(_maxSize: number)
	-- upvalues: CircularBufferModule (copy)
	assert(_maxSize, "Cannot initialize CircularBuffer with nil")
	assert(_maxSize > 0, "Cannot initialize CircularBuffer to size < 1")
	local t = {}
	setmetatable(t, CircularBufferModule)
	t._data = {}
	t._backIndex = 0
	t._maxSize = _maxSize
	
	return t
end

function CircularBufferModule:reset()
	self._data = {}
	self._backIndex = 0
end

function CircularBufferModule:getSize(): number
	return #self._data
end

function CircularBufferModule:getMaxSize()
	return self._maxSize
end

function CircularBufferModule:setSize(_maxSize: number)
	assert(_maxSize, "Cannot set CircularBuffer with nil")
	assert(_maxSize > 0, "Cannot set CircularBuffer to size < 1")
	
	if _maxSize == self._maxSize then return end
	local IteratorResult = self:iterator()
	local Key = IteratorResult:next()
	local _data = {}
	local _backIndex = 0
	while Key and _backIndex < _maxSize do
		local NewBackIndex = _backIndex + 1
		_data[NewBackIndex] = { entry = Key }
		
		if _data[_backIndex] then
			_data[_backIndex]._next = _data[NewBackIndex]
		end
		_backIndex = NewBackIndex
		Key = IteratorResult:next()
	end
	self._data = _data
	self._backIndex = _backIndex
	self._maxSize = _maxSize
end

function CircularBufferModule:getFrontIndex(): number
	local NewBackIndex = self._backIndex + 1
	
	return if self._data[NewBackIndex] then NewBackIndex else 1
end

function CircularBufferModule:front()
	local FrontIndex = self:getFrontIndex()
	
	return if self._data[FrontIndex] then self._data[FrontIndex].entry else nil
end

function CircularBufferModule.back(p1)
	return if p1._data[p1._backIndex] then p1._data[p1._backIndex].entry else nil
end

function CircularBufferModule:iterator()
	return {
		data = self._data[self:getFrontIndex()],
		next = function(p1)
			local Data = p1.data
			
			if Data then
				p1.data = p1.data._next
			end
			return Data and Data.entry
		end
	}
end

function CircularBufferModule:getData()
	return self._data
end

function CircularBufferModule:at(p1)
	assert(p1, "Cannot index CircularBuffer with nil")
	local NewFrontIndex = (self:getFrontIndex() + p1 - 2) % self._maxSize + 1
	
	return if self._data[NewFrontIndex] then self._data[NewFrontIndex].entry else nil
end

function CircularBufferModule:reverseAt(p1)
	local NewBackIndex = (self._backIndex - p1) % self._maxSize + 1
	
	return if self._data[NewBackIndex] then self._data[NewBackIndex].entry else nil
end

function CircularBufferModule:push_back(Entry)
	local BackIndex: number = self._backIndex
	local NewBackIndex = self._backIndex + 1
	
	if self._maxSize < NewBackIndex then
		NewBackIndex = 1
	end
	local Entry1 = self._data[NewBackIndex]
	self._data[NewBackIndex] = { entry = Entry }
	
	if BackIndex > 0 then
		self._data[BackIndex]._next = self._data[NewBackIndex]
		
		if Entry1 then
			Entry1._next = nil
		end
	end
	self._backIndex = NewBackIndex
	
	return Entry1 and Entry1.entry
end

return CircularBufferModule