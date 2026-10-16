local OrderedMapModule = {}
OrderedMapModule.__index = OrderedMapModule

function OrderedMapModule.new(GetId, SortPredicate, ...) --[[ Line: 51 ]]
	-- upvalues: OrderedMapModule (copy)
	local config = {
		keys = {},
		values = {},
		getId = GetId,
		sortPredicate = SortPredicate
	}
	setmetatable(config, OrderedMapModule)
	OrderedMapModule._InsertInPlace(config, ...)
	
	return config
end

function OrderedMapModule:Get(Key) --[[ Line: 69 ]]
	return self.values[Key]
end

function OrderedMapModule:GetByIndex(p1) --[[ Line: 76 ]]
	local Key = self.keys[p1]
	
	return if Key == nil then nil else self.values[Key]
end

function OrderedMapModule:GetIds() --[[ Line: 89 ]]
	return self.keys
end

function OrderedMapModule:Length(): number --[[ Line: 96 ]]
	return #self.keys
end

function OrderedMapModule:Delete(...) --[[ Line: 109 ]]
	-- upvalues: OrderedMapModule (copy)
	local NewOrderedMap = OrderedMapModule.new(self.getId, self.sortPredicate)
	local Selected = select("#", ...)
	
	for i, value in pairs(self.values) do
		NewOrderedMap.values[i] = value
	end
	for i1 = 1, Selected do
		NewOrderedMap.values[select(i1, ...)] = nil
	end
	for _, key in ipairs(self.keys) do
		if NewOrderedMap.values[key] ~= nil then
			NewOrderedMap.keys[#NewOrderedMap.keys + 1] = key
		end
	end
	return NewOrderedMap
end

function OrderedMapModule:Insert(...) --[[ Line: 143 ]]
	-- upvalues: OrderedMapModule (copy)
	local CopyResult = self:_Copy()
	OrderedMapModule._InsertInPlace(CopyResult, ...)
	
	return CopyResult
end

function OrderedMapModule.First(p1) --[[ Line: 154 ]]
	return if p1.keys[1] then p1:Get(p1.keys[1]) else nil
end

function OrderedMapModule:Last() --[[ Line: 164 ]]
	local CountKeys = #self.keys
	
	return if self.keys[CountKeys] then self:Get(self.keys[CountKeys]) else nil
end

function OrderedMapModule:CreateIterator() --[[ Line: 181 ]]
	local Count = 0
	local CountKeys = #self.keys
	
	return function() --[[ Line: 186 ]]
		-- upvalues: Count (ref), CountKeys (copy), self (copy)
		Count += 1
		
		if Count <= CountKeys then
			local Key = self.keys[Count]
			
			return Key, self.values[Key], Count
		else
			return nil, nil, nil
		end
	end
end

function OrderedMapModule:CreateReverseIterator() --[[ Line: 206 ]]
	local Count = #self.keys + 1
	
	return function() --[[ Line: 210 ]]
		-- upvalues: Count (ref), self (copy)
		Count -= 1
		
		if Count > 0 then
			local Key = self.keys[Count]
			
			return Key, self.values[Key], Count
		else
			return nil, nil, nil
		end
	end
end

function OrderedMapModule:Map(Callback) --[[ Line: 233 ]]
	-- upvalues: OrderedMapModule (copy)
	local NewOrderedMap = OrderedMapModule.new(self.getId, self.sortPredicate)
	
	for i, value in self:CreateIterator() do
		NewOrderedMap:_InsertInPlaceUnsorted(Callback(value, i))
	end
	NewOrderedMap:_Sort()
	
	return NewOrderedMap
end

function OrderedMapModule:Merge(...) --[[ Line: 260 ]]
	local CopyResult = nil
	
	for i = 1, select("#", ...) do
		local Selected = select(i, ...)
		
		if Selected:Length() > 0 then
			if not CopyResult then
				CopyResult = self:_Copy()
			end
			for _, value in Selected:CreateIterator() do
				CopyResult:_InsertInPlaceUnsorted(value)
			end
		end
	end
	if CopyResult then
		CopyResult:_Sort()
		
		return CopyResult
	else
		return self
	end
end

function OrderedMapModule:_Copy() --[[ Line: 289 ]]
	-- upvalues: OrderedMapModule (copy)
	local NewOrderedMap = OrderedMapModule.new(self.getId, self.sortPredicate)
	
	for i, key in ipairs(self.keys) do
		NewOrderedMap.keys[i] = key
	end
	for i1, value in pairs(self.values) do
		NewOrderedMap.values[i1] = value
	end
	return NewOrderedMap
end

function OrderedMapModule:_InsertInPlaceUnsorted(...) --[[ Line: 309 ]]
	for i = 1, select("#", ...) do
		local Selected = select(i, ...)
		local Id = self.getId(Selected)
		
		if not self.values[Id] then
			table.insert(self.keys, Id)
		end
		self.values[Id] = Selected
	end
end

function OrderedMapModule:_Sort() --[[ Line: 328 ]]
	table.sort(self.keys, function(A, B) --[[ Line: 329 ]]
		-- upvalues: self (copy)
		return self.sortPredicate(self.values[A], self.values[B])
	end)
end

function OrderedMapModule:_InsertInPlace(...) --[[ Line: 342 ]]
	self:_InsertInPlaceUnsorted(...)
	self:_Sort()
end

return OrderedMapModule