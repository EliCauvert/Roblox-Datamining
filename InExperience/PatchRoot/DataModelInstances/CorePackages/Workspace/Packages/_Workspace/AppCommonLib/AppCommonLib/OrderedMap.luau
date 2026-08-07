local t = {}
t.__index = t

function t.new(p0, p1, ...) --[[ line: 51 ]]
	-- upvalues: t (ref)
	local t_1 = { keys = {}, values = {}, getId = p0, sortPredicate = p1 }
	setmetatable(t_1, t)
	t._InsertInPlace(t_1, ...)
	
	return t_1
end

function t:Get(p2) --[[ line: 69 ]]
	return self.values[p2]
end

function t:GetByIndex(p3) --[[ line: 76 ]]
	local var2 = self.keys[p3]
	
	return if var2 == nil then nil else self.values[var2]
end

function t:GetIds() --[[ line: 89 ]]
	return self.keys
end

function t:Length() --[[ line: 96 ]]
	return #self.keys
end

function t:Delete(...) --[[ line: 109 ]]
	-- upvalues: t (ref)
	local var3 = t.new(self.getId, self.sortPredicate)
	local var4 = select("#", ...)
	
	for i, v in pairs(self.values) do
		var3.values[i] = v
	end
	for i_1 = 1, var4 do
		var3.values[select(i_1, ...)] = nil
	end
	for i_2, v_1 in ipairs(self.keys) do
		if var3.values[v_1] ~= nil then
			var3.keys[#var3.keys + 1] = v_1
		end
	end
	return var3
end

function t:Insert(...) --[[ line: 143 ]]
	-- upvalues: t (ref)
	local var5 = self:_Copy()
	t._InsertInPlace(var5, ...)
	
	return var5
end

function t:First() --[[ line: 154 ]]
	return if self.keys[1] then self:Get(self.keys[1]) else nil
end

function t:Last() --[[ line: 164 ]]
	local keysCount = #self.keys
	
	return if self.keys[keysCount] then self:Get(self.keys[keysCount]) else nil
end

function t:CreateIterator() --[[ line: 181 ]]
	local var7 = 0
	local keysCount = #self.keys
	
	return function() --[[ line: 186 ]]
		-- upvalues: var7 (write), keysCount (ref), self (ref)
		var7 += 1
		
		if var7 <= keysCount then
			local var9 = self.keys[var7]
			
			return var9, self.values[var9], var7
		end
		return nil, nil, nil
	end
end

function t:CreateReverseIterator() --[[ line: 206 ]]
	local var10 = #self.keys + 1
	
	return function() --[[ line: 210 ]]
		-- upvalues: var10 (write), self (ref)
		var10 -= 1
		
		if var10 > 0 then
			local var11 = self.keys[var10]
			
			return var11, self.values[var11], var10
		end
		return nil, nil, nil
	end
end

function t:Map(p4) --[[ line: 233 ]]
	-- upvalues: t (ref)
	local var12 = t.new(self.getId, self.sortPredicate)
	
	for i, v in self:CreateIterator() do
		var12:_InsertInPlaceUnsorted(p4(v, i))
	end
	var12:_Sort()
	
	return var12
end

function t:Merge(...) --[[ line: 260 ]]
	local var13 = nil
	
	for i = 1, select("#", ...) do
		local var14 = select(i, ...)
		
		if var14:Length() <= 0 then
			continue
		end
		if not var13 then
			var13 = self:_Copy()
		end
		for i, v in var14:CreateIterator() do
			var13:_InsertInPlaceUnsorted(v)
		end
	end
	if var13 then
		var13:_Sort()
		
		return var13
	end
	return self
end

function t:_Copy() --[[ line: 289 ]]
	-- upvalues: t (ref)
	local var15 = t.new(self.getId, self.sortPredicate)
	
	for i, v in ipairs(self.keys) do
		var15.keys[i] = v
	end
	for i_1, v_1 in pairs(self.values) do
		var15.values[i_1] = v_1
	end
	return var15
end

function t:_InsertInPlaceUnsorted(...) --[[ line: 309 ]]
	for i = 1, select("#", ...) do
		local var16 = select(i, ...)
		local id = self.getId(var16)
		
		if not self.values[id] then
			table.insert(self.keys, id)
		end
		self.values[id] = var16
	end
end

function t:_Sort() --[[ line: 328 ]]
	table.sort(self.keys, function(p5, p6) --[[ line: 329 ]]
		-- upvalues: self (ref)
		return self.sortPredicate(self.values[p5], self.values[p6])
	end)
end

function t:_InsertInPlace(...) --[[ line: 342 ]]
	self:_InsertInPlaceUnsorted(...)
	self:_Sort()
end

return t