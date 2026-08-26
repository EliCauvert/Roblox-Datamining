local t = {}
t.__index = t

function t.new(p1, p2, ...)
	-- upvalues: t (ref)
	local t_1 = { keys = {}, values = {}, getId = p1, sortPredicate = p2 }
	setmetatable(t_1, t)
	t._InsertInPlace(t_1, ...)
	
	return t_1
end

function t:Get(p1)
	return self.values[p1]
end

function t:GetByIndex(p1)
	local var1 = self.keys[p1]
	
	return if var1 == nil then nil else self.values[var1]
end

function t:GetIds()
	return self.keys
end

function t:Length()
	return #self.keys
end

function t:Delete(...)
	-- upvalues: t (ref)
	local var1 = t.new(self.getId, self.sortPredicate)
	local var2 = select("#", ...)
	
	for i, v in pairs(self.values) do
		var1.values[i] = v
	end
	for i_1 = 1, var2 do
		var1.values[select(i_1, ...)] = nil
	end
	for i_2, v_1 in ipairs(self.keys) do
		if var1.values[v_1] ~= nil then
			var1.keys[#var1.keys + 1] = v_1
		end
	end
	return var1
end

function t:Insert(...)
	-- upvalues: t (ref)
	local var3 = self:_Copy()
	t._InsertInPlace(var3, ...)
	
	return var3
end

function t:First()
	return if self.keys[1] then self:Get(self.keys[1]) else nil
end

function t:Last()
	local keysCount = #self.keys
	
	return if self.keys[keysCount] then self:Get(self.keys[keysCount]) else nil
end

function t:CreateIterator()
	local var3 = 0
	local keysCount = #self.keys
	
	return function()
		-- upvalues: var3 (write), keysCount (ref), self (ref)
		var3 += 1
		
		if var3 <= keysCount then
			local var4 = self.keys[var3]
			
			return var4, self.values[var4], var3
		end
		return nil, nil, nil
	end
end

function t:CreateReverseIterator()
	local var3 = #self.keys + 1
	
	return function()
		-- upvalues: var3 (write), self (ref)
		var3 -= 1
		
		if var3 > 0 then
			local var4 = self.keys[var3]
			
			return var4, self.values[var4], var3
		end
		return nil, nil, nil
	end
end

function t:Map(p1)
	-- upvalues: t (ref)
	local var3 = t.new(self.getId, self.sortPredicate)
	
	for i, v in self:CreateIterator() do
		var3:_InsertInPlaceUnsorted(p1(v, i))
	end
	var3:_Sort()
	
	return var3
end

function t:Merge(...)
	local var4 = nil
	
	for i = 1, select("#", ...) do
		local var5 = select(i, ...)
		
		if var5:Length() <= 0 then
			continue
		end
		if not var4 then
			var4 = self:_Copy()
		end
		for i, v in var5:CreateIterator() do
			var4:_InsertInPlaceUnsorted(v)
		end
	end
	if var4 then
		var4:_Sort()
		
		return var4
	end
	return self
end

function t:_Copy()
	-- upvalues: t (ref)
	local var6 = t.new(self.getId, self.sortPredicate)
	
	for i, v in ipairs(self.keys) do
		var6.keys[i] = v
	end
	for i_1, v_1 in pairs(self.values) do
		var6.values[i_1] = v_1
	end
	return var6
end

function t:_InsertInPlaceUnsorted(...)
	for i = 1, select("#", ...) do
		local var7 = select(i, ...)
		local id = self.getId(var7)
		
		if not self.values[id] then
			table.insert(self.keys, id)
		end
		self.values[id] = var7
	end
end

function t:_Sort()
	table.sort(self.keys, function(p2, p3)
		-- upvalues: self (ref)
		return self.sortPredicate(self.values[p2], self.values[p3])
	end)
end

function t:_InsertInPlace(...)
	self:_InsertInPlaceUnsorted(...)
	self:_Sort()
end

return t