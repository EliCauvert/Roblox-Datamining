local TModule = {
	type = function(ValueType)
		return function(p1)
			-- upvalues: ValueType (copy)
			local ValueType1 = type(p1)
			
			if ValueType1 == ValueType then
				return true
			else
				return false, string.format("%s expected, got %s", ValueType, ValueType1)
			end
		end
	end,
	typeof = function(ValueType)
		return function(p1)
			-- upvalues: ValueType (copy)
			local ValueType1 = typeof(p1)
			
			if ValueType1 == ValueType then
				return true
			else
				return false, string.format("%s expected, got %s", ValueType, ValueType1)
			end
		end
	end,
	any = function(p1)
		if p1 == nil then
			return false, "any expected, got nil"
		else
			return true
		end
	end
}
TModule.boolean = TModule.typeof("boolean")
TModule.thread = TModule.typeof("thread")
TModule.callback = TModule.typeof("function")
TModule["function"] = TModule.callback
TModule.none = TModule.typeof("nil")
TModule["nil"] = TModule.none
TModule.string = TModule.typeof("string")
TModule.table = TModule.typeof("table")
TModule.userdata = TModule.type("userdata")

function TModule.number(p1)
	local ValueType = typeof(p1)
	
	if ValueType ~= "number" then
		return false, string.format("number expected, got %s", ValueType)
	elseif p1 == p1 then
		return true
	else
		return false, "unexpected NaN value"
	end
end

function TModule.nan(p1)
	local ValueType = typeof(p1)
	
	if ValueType ~= "number" then
		return false, string.format("number expected, got %s", ValueType)
	elseif p1 == p1 then
		return false, "unexpected non-NaN value"
	else
		return true
	end
end

TModule.Axes = TModule.typeof("Axes")
TModule.BrickColor = TModule.typeof("BrickColor")
TModule.CatalogSearchParams = TModule.typeof("CatalogSearchParams")
TModule.CFrame = TModule.typeof("CFrame")
TModule.Color3 = TModule.typeof("Color3")
TModule.ColorSequence = TModule.typeof("ColorSequence")
TModule.ColorSequenceKeypoint = TModule.typeof("ColorSequenceKeypoint")
TModule.DateTime = TModule.typeof("DateTime")
TModule.DockWidgetPluginGuiInfo = TModule.typeof("DockWidgetPluginGuiInfo")
TModule.Enum = TModule.typeof("Enum")
TModule.EnumItem = TModule.typeof("EnumItem")
TModule.Enums = TModule.typeof("Enums")
TModule.Faces = TModule.typeof("Faces")
TModule.Instance = TModule.typeof("Instance")
TModule.NumberRange = TModule.typeof("NumberRange")
TModule.NumberSequence = TModule.typeof("NumberSequence")
TModule.NumberSequenceKeypoint = TModule.typeof("NumberSequenceKeypoint")
TModule.PathWaypoint = TModule.typeof("PathWaypoint")
TModule.PhysicalProperties = TModule.typeof("PhysicalProperties")
TModule.Random = TModule.typeof("Random")
TModule.Ray = TModule.typeof("Ray")
TModule.RaycastParams = TModule.typeof("RaycastParams")
TModule.RaycastResult = TModule.typeof("RaycastResult")
TModule.RBXScriptConnection = TModule.typeof("RBXScriptConnection")
TModule.RBXScriptSignal = TModule.typeof("RBXScriptSignal")
TModule.Rect = TModule.typeof("Rect")
TModule.Region3 = TModule.typeof("Region3")
TModule.Region3int16 = TModule.typeof("Region3int16")
TModule.TweenInfo = TModule.typeof("TweenInfo")
TModule.UDim = TModule.typeof("UDim")
TModule.UDim2 = TModule.typeof("UDim2")
TModule.Vector2 = TModule.typeof("Vector2")
TModule.Vector2int16 = TModule.typeof("Vector2int16")
TModule.Vector3 = TModule.typeof("Vector3")
TModule.Vector3int16 = TModule.typeof("Vector3int16")

function TModule.literal(...)
	-- upvalues: TModule (copy)
	local Selected = select("#", ...)
	
	if Selected == 1 then
		local v1 = (...)
		
		return function(p1)
			-- upvalues: v1 (copy)
			if p1 == v1 then
				return true
			else
				return false, string.format("expected %s, got %s", tostring(v1), (tostring(p1)))
			end
		end
	end
	local LiteralResults = {}
	
	for i = 1, Selected do
		LiteralResults[i] = TModule.literal((select(i, ...)))
	end
	return TModule.union(table.unpack(LiteralResults, 1, Selected))
end

TModule.exactly = TModule.literal

function TModule.keyOf(List)
	-- upvalues: TModule (copy)
	local t = {}
	local Count = 0
	
	for i in pairs(List) do
		Count += 1
		t[Count] = i
	end
	return TModule.literal(table.unpack(t, 1, Count))
end

function TModule.valueOf(List)
	-- upvalues: TModule (copy)
	local t = {}
	local Count = 0
	
	for _, value in pairs(List) do
		Count += 1
		t[Count] = value
	end
	return TModule.literal(table.unpack(t, 1, Count))
end

function TModule.integer(p1: number)
	-- upvalues: TModule (copy)
	local NumberResult, NumberResult2 = TModule.number(p1)
	
	if not NumberResult then
		return false, NumberResult2 or ""
	elseif p1 % 1 == 0 then
		return true
	else
		return false, string.format("integer expected, got %s", p1)
	end
end

function TModule.numberMin(p1)
	-- upvalues: TModule (copy)
	return function(p2)
		-- upvalues: TModule (upval), p1 (copy)
		local NumberResult, NumberResult2 = TModule.number(p2)
		
		if not NumberResult then
			return false, NumberResult2 or ""
		elseif p1 <= p2 then
			return true
		else
			return false, string.format("number >= %s expected, got %s", p1, p2)
		end
	end
end

function TModule.numberMax(p1)
	-- upvalues: TModule (copy)
	return function(p2)
		-- upvalues: TModule (upval), p1 (copy)
		local NumberResult, NumberResult2 = TModule.number(p2)
		
		if not NumberResult then
			return false, NumberResult2
		elseif p2 <= p1 then
			return true
		else
			return false, string.format("number <= %s expected, got %s", p1, p2)
		end
	end
end

function TModule.numberMinExclusive(p1)
	-- upvalues: TModule (copy)
	return function(p2)
		-- upvalues: TModule (upval), p1 (copy)
		local NumberResult, NumberResult2 = TModule.number(p2)
		
		if not NumberResult then
			return false, NumberResult2 or ""
		elseif p1 < p2 then
			return true
		else
			return false, string.format("number > %s expected, got %s", p1, p2)
		end
	end
end

function TModule.numberMaxExclusive(p1)
	-- upvalues: TModule (copy)
	return function(p2)
		-- upvalues: TModule (upval), p1 (copy)
		local NumberResult, NumberResult2 = TModule.number(p2)
		
		if not NumberResult then
			return false, NumberResult2 or ""
		elseif p2 < p1 then
			return true
		else
			return false, string.format("number < %s expected, got %s", p1, p2)
		end
	end
end

TModule.numberPositive = TModule.numberMinExclusive(0)
TModule.numberNegative = TModule.numberMaxExclusive(0)

function TModule.numberConstrained(p1, p2)
	-- upvalues: TModule (copy)
	assert(TModule.number(p1))
	assert(TModule.number(p2))
	local NumberMinResult = TModule.numberMin(p1)
	local NumberMaxResult = TModule.numberMax(p2)
	
	return function(p3)
		-- upvalues: NumberMinResult (copy), NumberMaxResult (copy)
		local NumberMinResultResult, NumberMinResultResult2 = NumberMinResult(p3)
		
		if not NumberMinResultResult then
			return false, NumberMinResultResult2 or ""
		end
		local NumberMaxResultResult, NumberMaxResultResult2 = NumberMaxResult(p3)
		
		if NumberMaxResultResult then
			return true
		else
			return false, NumberMaxResultResult2 or ""
		end
	end
end

function TModule.numberConstrainedExclusive(p1, p2)
	-- upvalues: TModule (copy)
	assert(TModule.number(p1))
	assert(TModule.number(p2))
	local NumberMinExclusiveResult = TModule.numberMinExclusive(p1)
	local NumberMaxExclusiveResult = TModule.numberMaxExclusive(p2)
	
	return function(p3)
		-- upvalues: NumberMinExclusiveResult (copy), NumberMaxExclusiveResult (copy)
		local NumberMinExclusiveResultResult, NumberMinExclusiveResultResult2 = NumberMinExclusiveResult(p3)
		
		if not NumberMinExclusiveResultResult then
			return false, NumberMinExclusiveResultResult2 or ""
		end
		local NumberMaxExclusiveResultResult, NumberMaxExclusiveResultResult2 = NumberMaxExclusiveResult(p3)
		
		if NumberMaxExclusiveResultResult then
			return true
		else
			return false, NumberMaxExclusiveResultResult2 or ""
		end
	end
end

function TModule.match(Pattern)
	-- upvalues: TModule (copy)
	assert(TModule.string(Pattern))
	
	return function(Text: string)
		-- upvalues: TModule (upval), Pattern (copy)
		local v2, v3 = TModule.string(Text)
		
		if not v2 then
			return false, v3
		elseif string.match(Text, Pattern) == nil then
			return false, string.format("%q failed to match pattern %q", Text, Pattern)
		else
			return true
		end
	end
end

function TModule.optional(Callback)
	-- upvalues: TModule (copy)
	assert(TModule.callback(Callback))
	
	return function(p1)
		-- upvalues: Callback (copy)
		if p1 == nil then
			return true
		end
		local CallbackResult, CallbackResult2 = Callback(p1)
		
		if CallbackResult then
			return true
		else
			return false, string.format("(optional) %s", CallbackResult2 or "")
		end
	end
end

function TModule.tuple(...)
	local list = { ... }
	
	return function(...)
		-- upvalues: list (copy)
		local list1 = { ... }
		local v2 = nil
		
		for i, value in ipairs(list) do
			local v3
			v3, v45 = value(list1[i])
			
			if v3 == false then
				return false, string.format("Bad tuple index #%s:\n\t%s", i, v2 or "")
			end
		end
		return true
	end
end

function TModule.keys(Callback)
	-- upvalues: TModule (copy)
	assert(TModule.callback(Callback))
	
	return function(List)
		-- upvalues: TModule (upval), Callback (copy)
		local v2, v3 = TModule.table(List)
		
		if v2 == false then
			return false, v3 or ""
		end
		local CallbackResult2 = nil
		for i in pairs(List) do
			local CallbackResult
			CallbackResult, CallbackResult2 = Callback(i)
			
			if CallbackResult == false then
				return false, string.format("bad key %s:\n\t%s", tostring(i), CallbackResult2 or "")
			end
		end
		return true
	end
end

function TModule.values(Callback)
	-- upvalues: TModule (copy)
	assert(TModule.callback(Callback))
	
	return function(List)
		-- upvalues: TModule (upval), Callback (copy)
		local v2, v3 = TModule.table(List)
		
		if v2 == false then
			return false, v3 or ""
		end
		local CallbackResult2 = nil
		for i, value in pairs(List) do
			local CallbackResult
			CallbackResult, CallbackResult2 = Callback(value)
			
			if CallbackResult == false then
				return false, string.format("bad value for key %s:\n\t%s", tostring(i), CallbackResult2 or "")
			end
		end
		return true
	end
end

function TModule.map(Any, Callback)
	-- upvalues: TModule (copy)
	assert(TModule.callback(Any))
	assert(TModule.callback(Callback))
	local KeysResult = TModule.keys(Any)
	local ValuesResult = TModule.values(Callback)
	
	return function(p1)
		-- upvalues: KeysResult (copy), ValuesResult (copy)
		local KeysResultResult, KeysResultResult2 = KeysResult(p1)
		
		if not KeysResultResult then
			return false, KeysResultResult2 or ""
		end
		local ValuesResultResult, ValuesResultResult2 = ValuesResult(p1)
		
		if ValuesResultResult then
			return true
		else
			return false, ValuesResultResult2 or ""
		end
	end
end

function TModule.set(p1)
	-- upvalues: TModule (copy)
	return TModule.map(p1, TModule.literal(true))
end

local KeysResult = TModule.keys(TModule.integer)

function TModule.array(Callback)
	-- upvalues: TModule (copy), KeysResult (copy)
	assert(TModule.callback(Callback))
	local ValuesResult = TModule.values(Callback)
	
	return function(List)
		-- upvalues: KeysResult (upval), ValuesResult (copy)
		local KeysResultResult, KeysResultResult2 = KeysResult(List)
		
		if KeysResultResult == false then
			return false, string.format("[array] %s", KeysResultResult2 or "")
		end
		local Count = 0
		
		for i in ipairs(List) do
			Count += 1
		end
		for i in pairs(List) do
			if i < 1 or Count < i then
				return false, string.format("[array] key %s must be sequential", (tostring(i)))
			end
		end
		local ValuesResultResult, ValuesResultResult2 = ValuesResult(List)
		
		if ValuesResultResult then
			return true
		else
			return false, string.format("[array] %s", ValuesResultResult2 or "")
		end
	end
end

function TModule.strictArray(...)
	-- upvalues: TModule (copy), KeysResult (copy)
	local list = { ... }
	assert(TModule.array(TModule.callback)(list))
	
	return function(p1)
		-- upvalues: KeysResult (upval), list (copy)
		local KeysResultResult, KeysResultResult2 = KeysResult(p1)
		
		if KeysResultResult == false then
			return false, string.format("[strictArray] %s", KeysResultResult2 or "")
		end
		if #list < #p1 then
			return false, string.format("[strictArray] Array size exceeds limit of %d", #list)
		end
		local v2 = nil
		for i, value in pairs(list) do
			local v3
			v3, v70 = value(p1[i])
			
			if not v3 then
				return false, string.format("[strictArray] Array index #%d - %s", i, v2)
			end
		end
		return true
	end
end

local ArrayResult = TModule.array(TModule.callback)

function TModule.union(...)
	-- upvalues: ArrayResult (copy)
	local list = { ... }
	assert(ArrayResult(list))
	
	return function(p1)
		-- upvalues: list (copy)
		for _, value in ipairs(list) do
			if value(p1) then
				return true
			end
		end
		return false, "bad type for union"
	end
end

TModule.some = TModule.union

function TModule.intersection(...)
	-- upvalues: ArrayResult (copy)
	local list = { ... }
	assert(ArrayResult(list))
	
	return function(p1)
		-- upvalues: list (copy)
		local v2 = nil
		for _, value in ipairs(list) do
			local v3
			v3, v74 = value(p1)
			
			if not v3 then
				return false, v2 or ""
			end
		end
		return true
	end
end

TModule.every = TModule.intersection
local MapResult = TModule.map(TModule.any, TModule.callback)

function TModule.interface(p1)
	-- upvalues: MapResult (copy), TModule (copy)
	assert(MapResult(p1))
	
	return function(p2)
		-- upvalues: TModule (upval), p1 (copy)
		local v2, v3 = TModule.table(p2)
		
		if v2 == false then
			return false, v3 or ""
		end
		local v4 = nil
		for i, value in pairs(p1) do
			local v5
			v5, v78 = value(p2[i])
			
			if v5 == false then
				return false, string.format("[interface] bad value for %s:\n\t%s", tostring(i), v4 or "")
			end
		end
		return true
	end
end

function TModule.strictInterface(p2)
	-- upvalues: MapResult (copy), TModule (copy)
	assert(MapResult(p2))
	
	return function(List)
		-- upvalues: TModule (upval), p2 (copy)
		local v2, v3 = TModule.table(List)
		
		if v2 == false then
			return false, v3 or ""
		end
		local v4 = nil
		for i, value in pairs(p2) do
			local v5
			v5, v82 = value(List[i])
			
			if v5 == false then
				return false, string.format("[interface] bad value for %s:\n\t%s", tostring(i), v4 or "")
			end
		end
		for i1 in pairs(List) do
			if not p2[i1] then
				return false, string.format("[interface] unexpected field %q", (tostring(i1)))
			end
		end
		return true
	end
end

function TModule.instanceOf(ClassName, p3)
	-- upvalues: TModule (copy)
	assert(TModule.string(ClassName))
	local ChildrenResult = if p3 == nil then nil else TModule.children(p3)
	
	return function(p4)
		-- upvalues: TModule (upval), ClassName (copy), ChildrenResult (ref)
		local v6, v7 = TModule.Instance(p4)
		
		if not v6 then
			return false, v7 or ""
		end
		if p4.ClassName ~= ClassName then
			return false, string.format("%s expected, got %s", ClassName, p4.ClassName)
		end
		if ChildrenResult then
			local ChildrenResultResult, ChildrenResultResult2 = ChildrenResult(p4)
			
			if not ChildrenResultResult then
				return false, ChildrenResultResult2
			end
		end
		return true
	end
end

TModule.instance = TModule.instanceOf

function TModule.instanceIsA(ClassName, p3)
	-- upvalues: TModule (copy)
	assert(TModule.string(ClassName))
	local ChildrenResult = if p3 == nil then nil else TModule.children(p3)
	
	return function(Object)
		-- upvalues: TModule (upval), ClassName (copy), ChildrenResult (ref)
		local v6, v7 = TModule.Instance(Object)
		
		if not v6 then
			return false, v7 or ""
		end
		if not Object:IsA(ClassName) then
			return false, string.format("%s expected, got %s", ClassName, Object.ClassName)
		end
		if ChildrenResult then
			local ChildrenResultResult, ChildrenResultResult2 = ChildrenResult(Object)
			
			if not ChildrenResultResult then
				return false, ChildrenResultResult2
			end
		end
		return true
	end
end

function TModule.enum(EnumType)
	-- upvalues: TModule (copy)
	assert(TModule.Enum(EnumType))
	
	return function(p3)
		-- upvalues: TModule (upval), EnumType (copy)
		local EnumItemResult, EnumItemResult2 = TModule.EnumItem(p3)
		
		if not EnumItemResult then
			return false, EnumItemResult2
		elseif p3.EnumType == EnumType then
			return true
		else
			return false, string.format("enum of %s expected, got enum of %s", tostring(EnumType), (tostring(p3.EnumType)))
		end
	end
end

local TupleResult = TModule.tuple(TModule.callback, TModule.callback)

function TModule.wrap(Callback, Callback1)
	-- upvalues: TupleResult (copy)
	assert(TupleResult(Callback, Callback1))
	
	return function(...)
		-- upvalues: Callback1 (copy), Callback (copy)
		assert(Callback1(...))
		
		return Callback(...)
	end
end

function TModule.strict(Callback)
	return function(...)
		-- upvalues: Callback (copy)
		assert(Callback(...))
	end
end

local MapResult1 = TModule.map(TModule.string, TModule.callback)

function TModule.children(p3)
	-- upvalues: MapResult1 (copy), TModule (copy)
	assert(MapResult1(p3))
	
	return function(Object)
		-- upvalues: TModule (upval), p3 (copy)
		local v6, v7 = TModule.Instance(Object)
		
		if not v6 then
			return false, v7 or ""
		end
		local t = {}
		local Name = nil
		
		for i, child in ipairs(Object:GetChildren()) do
			Name = child.Name
			
			if p3[Name] then
				if t[Name] then
					return false, string.format("Cannot process multiple children with the same name %q", Name)
				end
				t[Name] = child
			end
		end
		local v8 = nil
		for i, value in pairs(p3) do
			local v9
			v9, v100 = value(t[i])
			
			if not v9 then
				return false, string.format("[%s.%s] %s", Object:GetFullName(), i, v8 or "")
			end
		end
		return true
	end
end

return TModule