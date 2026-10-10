local getFFlagVoiceDebugConsoleV2Module = require(script.Parent.Components.VoiceDebug.GetFFlagVoiceDebugConsoleV2)
local t = {}
t.__index = t

function t.new(p1)
	-- upvalues: t (ref)
	assert(p1, "Cannot initialize CircularBuffer with nil")
	assert(p1 > 0, "Cannot initialize CircularBuffer to size < 1")
	local t_1 = {}
	setmetatable(t_1, t)
	t_1._data = {}
	t_1._backIndex = 0
	t_1._maxSize = p1
	
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
	local var1 = self:iterator()
	local var2 = var1:next()
	local t = {}
	local var3 = 0
	while var2 and var3 < p1 do
		local var4 = var3 + 1
		t[var4] = { entry = var2 }
		
		if t[var3] then
			t[var3]._next = t[var4]
		end
		var3 = var4
		var2 = var1:next()
	end
	self._data = t
	self._backIndex = var3
	self._maxSize = p1
end

function t:getFrontIndex()
	local var5 = self._backIndex + 1
	
	return if self._data[var5] then var5 else 1
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

if getFFlagVoiceDebugConsoleV2Module() then
	function t:clone()
		-- upvalues: t (ref)
		local var5 = t.new(self._maxSize)
		local t_1 = {}
		
		for i, v in self._data do
			t_1[i] = { entry = v.entry }
		end
		for i_1, v_1 in self._data do
			if v_1._next then
				t_1[i_1]._next = t_1[i_1 % self._maxSize + 1]
			end
		end
		var5._data = t_1
		var5._backIndex = self._backIndex
		
		return var5
	end
end
function t:at(p2)
	assert(p2, "Cannot index CircularBuffer with nil")
	local var6 = (self:getFrontIndex() + p2 - 2) % self._maxSize + 1
	
	return if self._data[var6] then self._data[var6].entry else nil
end

function t:reverseAt(p2)
	local var6 = (self._backIndex - p2) % self._maxSize + 1
	
	return if self._data[var6] then self._data[var6].entry else nil
end

function t:push_back(p2)
	local backIndex = self._backIndex
	local var6 = self._backIndex + 1
	
	if self._maxSize < var6 then
		var6 = 1
	end
	local var7 = self._data[var6]
	self._data[var6] = { entry = p2 }
	
	if backIndex > 0 then
		self._data[backIndex]._next = self._data[var6]
		
		if var7 then
			var7._next = nil
		end
	end
	self._backIndex = var6
	
	return var7 and var7.entry
end

return t