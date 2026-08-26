local t = {
	type = function(p1)
		return function(p2)
			-- upvalues: p1 (ref)
			local var1 = type(p2)
			
			if var1 == p1 then
				return true
			end
			return false, string.format("%s expected, got %s", p1, var1)
		end
	end,
	typeof = function(p1)
		return function(p2)
			-- upvalues: p1 (ref)
			local var1 = typeof(p2)
			
			if var1 == p1 then
				return true
			end
			return false, string.format("%s expected, got %s", p1, var1)
		end
	end,
	any = function(p1)
		if p1 == nil then
			return false, "any expected, got nil"
		end
		return true
	end
}
t.boolean = t.typeof("boolean")
t.thread = t.typeof("thread")
t.callback = t.typeof("function")
t["function"] = t.callback
t.none = t.typeof("nil")
t["nil"] = t.none
t.string = t.typeof("string")
t.table = t.typeof("table")
t.userdata = t.type("userdata")

function t.number(p1)
	local var1 = typeof(p1)
	
	if var1 ~= "number" then
		return false, string.format("number expected, got %s", var1)
	elseif p1 == p1 then
		return true
	end
	return false, "unexpected NaN value"
end

function t.nan(p1)
	local var1 = typeof(p1)
	
	if var1 ~= "number" then
		return false, string.format("number expected, got %s", var1)
	elseif p1 == p1 then
		return false, "unexpected non-NaN value"
	end
	return true
end

t.Axes = t.typeof("Axes")
t.BrickColor = t.typeof("BrickColor")
t.CatalogSearchParams = t.typeof("CatalogSearchParams")
t.CFrame = t.typeof("CFrame")
t.Color3 = t.typeof("Color3")
t.ColorSequence = t.typeof("ColorSequence")
t.ColorSequenceKeypoint = t.typeof("ColorSequenceKeypoint")
t.DateTime = t.typeof("DateTime")
t.DockWidgetPluginGuiInfo = t.typeof("DockWidgetPluginGuiInfo")
t.Enum = t.typeof("Enum")
t.EnumItem = t.typeof("EnumItem")
t.Enums = t.typeof("Enums")
t.Faces = t.typeof("Faces")
t.Instance = t.typeof("Instance")
t.NumberRange = t.typeof("NumberRange")
t.NumberSequence = t.typeof("NumberSequence")
t.NumberSequenceKeypoint = t.typeof("NumberSequenceKeypoint")
t.PathWaypoint = t.typeof("PathWaypoint")
t.PhysicalProperties = t.typeof("PhysicalProperties")
t.Random = t.typeof("Random")
t.Ray = t.typeof("Ray")
t.RaycastParams = t.typeof("RaycastParams")
t.RaycastResult = t.typeof("RaycastResult")
t.RBXScriptConnection = t.typeof("RBXScriptConnection")
t.RBXScriptSignal = t.typeof("RBXScriptSignal")
t.Rect = t.typeof("Rect")
t.Region3 = t.typeof("Region3")
t.Region3int16 = t.typeof("Region3int16")
t.TweenInfo = t.typeof("TweenInfo")
t.UDim = t.typeof("UDim")
t.UDim2 = t.typeof("UDim2")
t.Vector2 = t.typeof("Vector2")
t.Vector2int16 = t.typeof("Vector2int16")
t.Vector3 = t.typeof("Vector3")
t.Vector3int16 = t.typeof("Vector3int16")

function t.literal(...)
	-- upvalues: t (ref)
	local var1 = select("#", ...)
	
	if var1 == 1 then
		local var2 = ...
		
		return function(p1)
			-- upvalues: var2 (ref)
			if p1 == var2 then
				return true
			end
			return false, string.format("expected %s, got %s", tostring(var2), tostring(p1))
		end
	end
	local t_1 = {}
	
	for i = 1, var1 do
		t_1[i] = t.literal(select(i, ...))
	end
	return t.union(table.unpack(t_1, 1, var1))
end

t.exactly = t.literal

function t.keyOf(p1)
	-- upvalues: t (ref)
	local t_1 = {}
	local var3 = 0
	
	for i in pairs(p1) do
		var3 += 1
		t_1[var3] = i
	end
	return t.literal(table.unpack(t_1, 1, var3))
end

function t.valueOf(p2)
	-- upvalues: t (ref)
	local t_1 = {}
	local var4 = 0
	
	for i, v in pairs(p2) do
		var4 += 1
		t_1[var4] = v
	end
	return t.literal(table.unpack(t_1, 1, var4))
end

function t.integer(p3)
	-- upvalues: t (ref)
	local var5, var6 = t.number(p3)
	
	if not var5 then
		return false, var6 or ""
	elseif p3 % 1 == 0 then
		return true
	end
	return false, string.format("integer expected, got %s", p3)
end

function t.numberMin(a)
	-- upvalues: t (ref)
	return function(p3)
		-- upvalues: t (copy), a (ref)
		local var5, var6 = t.number(p3)
		
		if not var5 then
			return false, var6 or ""
		elseif a <= p3 then
			return true
		end
		return false, string.format("number >= %s expected, got %s", a, p3)
	end
end

function t.numberMax(a)
	-- upvalues: t (ref)
	return function(p3)
		-- upvalues: t (copy), a (ref)
		local var5, var6 = t.number(p3)
		
		if not var5 then
			return false, var6
		elseif p3 <= a then
			return true
		end
		return false, string.format("number <= %s expected, got %s", a, p3)
	end
end

function t.numberMinExclusive(a)
	-- upvalues: t (ref)
	return function(p3)
		-- upvalues: t (copy), a (ref)
		local var5, var6 = t.number(p3)
		
		if not var5 then
			return false, var6 or ""
		elseif a < p3 then
			return true
		end
		return false, string.format("number > %s expected, got %s", a, p3)
	end
end

function t.numberMaxExclusive(a)
	-- upvalues: t (ref)
	return function(p3)
		-- upvalues: t (copy), a (ref)
		local var5, var6 = t.number(p3)
		
		if not var5 then
			return false, var6 or ""
		elseif p3 < a then
			return true
		end
		return false, string.format("number < %s expected, got %s", a, p3)
	end
end

t.numberPositive = t.numberMinExclusive(0)
t.numberNegative = t.numberMaxExclusive(0)

function t.numberConstrained(p3, p4)
	-- upvalues: t (ref)
	assert(t.number(p3))
	assert(t.number(p4))
	local var5 = t.numberMin(p3)
	local var6 = t.numberMax(p4)
	
	return function(p5)
		-- upvalues: var5 (ref), var6 (ref)
		local var7, var8 = var5(p5)
		
		if not var7 then
			return false, var8 or ""
		end
		local var9, var10 = var6(p5)
		
		if var9 then
			return true
		end
		return false, var10 or ""
	end
end

function t.numberConstrainedExclusive(p3, p4)
	-- upvalues: t (ref)
	assert(t.number(p3))
	assert(t.number(p4))
	local var5 = t.numberMinExclusive(p3)
	local var6 = t.numberMaxExclusive(p4)
	
	return function(p5)
		-- upvalues: var5 (ref), var6 (ref)
		local var7, var8 = var5(p5)
		
		if not var7 then
			return false, var8 or ""
		end
		local var9, var10 = var6(p5)
		
		if var9 then
			return true
		end
		return false, var10 or ""
	end
end

function t.match(p3)
	-- upvalues: t (ref)
	assert(t.string(p3))
	
	return function(p4)
		-- upvalues: t (copy), p3 (ref)
		local var5, var6 = t.string(p4)
		
		if not var5 then
			return false, var6
		elseif string.match(p4, p3) == nil then
			return false, string.format("%q failed to match pattern %q", p4, p3)
		end
		return true
	end
end

function t.optional(p3)
	-- upvalues: t (ref)
	assert(t.callback(p3))
	
	return function(p4)
		-- upvalues: p3 (ref)
		if p4 == nil then
			return true
		end
		local var5, var6 = p3(p4)
		
		if var5 then
			return true
		end
		return false, string.format("(optional) %s", var6 or "")
	end
end

function t.tuple(...)
	local list = { ... }
	
	return function(...)
		-- upvalues: list (ref)
		local list_1 = { ... }
		
		for i, v in ipairs(list) do
			local var5, var6 = v(list_1[i])
			
			if var5 == false then
				return false, string.format("Bad tuple index #%s:\n\t%s", i, var6 or "")
			end
		end
		return true
	end
end

function t.keys(p3)
	-- upvalues: t (ref)
	assert(t.callback(p3))
	
	return function(p4)
		-- upvalues: t (copy), p3 (ref)
		local var5, var6 = t.table(p4)
		
		if var5 == false then
			return false, var6 or ""
		end
		for i in pairs(p4) do
			local var7, var8 = p3(i)
			
			if var7 == false then
				return false, string.format("bad key %s:\n\t%s", tostring(i), var8 or "")
			end
		end
		return true
	end
end

function t.values(p4)
	-- upvalues: t (ref)
	assert(t.callback(p4))
	
	return function(p5)
		-- upvalues: t (copy), p4 (ref)
		local var5, var6 = t.table(p5)
		
		if var5 == false then
			return false, var6 or ""
		end
		for i, v in pairs(p5) do
			local var7, var8 = p4(v)
			
			if var7 == false then
				return false, string.format("bad value for key %s:\n\t%s", tostring(i), var8 or "")
			end
		end
		return true
	end
end

function t.map(p5, p6)
	-- upvalues: t (ref)
	assert(t.callback(p5))
	assert(t.callback(p6))
	local var5 = t.keys(p5)
	local var6 = t.values(p6)
	
	return function(p7)
		-- upvalues: var5 (ref), var6 (ref)
		local var7, var8 = var5(p7)
		
		if not var7 then
			return false, var8 or ""
		end
		local var9, var10 = var6(p7)
		
		if var9 then
			return true
		end
		return false, var10 or ""
	end
end

function t.set(value)
	-- upvalues: t (ref)
	return t.map(value, t.literal(true))
end

local var5 = t.keys(t.integer)

function t.array(p5)
	-- upvalues: t (ref), var5 (ref)
	assert(t.callback(p5))
	local var6 = t.values(p5)
	
	return function(p6)
		-- upvalues: var5 (copy), var6 (ref)
		local var7, var8 = var5(p6)
		
		if var7 == false then
			return false, string.format("[array] %s", var8 or "")
		end
		local var9 = 0
		
		for i in ipairs(p6) do
			var9 += 1
		end
		for i_1 in pairs(p6) do
			if i_1 < 1 or var9 < i_1 then
				return false, string.format("[array] key %s must be sequential", tostring(i_1))
			end
		end
		local var10, var11 = var6(p6)
		
		if var10 then
			return true
		end
		return false, string.format("[array] %s", var11 or "")
	end
end

function t.strictArray(...)
	-- upvalues: t (ref), var5 (ref)
	local list = { ... }
	assert(t.array(t.callback)(list))
	
	return function(p7)
		-- upvalues: var5 (copy), list (ref)
		local var12, var13 = var5(p7)
		
		if var12 == false then
			return false, string.format("[strictArray] %s", var13 or "")
		elseif #list < #p7 then
			return false, string.format("[strictArray] Array size exceeds limit of %d", #list)
		end
		for i, v in pairs(list) do
			local var14, var15 = v(p7[i])
			
			if not var14 then
				return false, string.format("[strictArray] Array index #%d - %s", i, var15)
			end
		end
		return true
	end
end

local var12 = t.array(t.callback)

function t.union(...)
	-- upvalues: var12 (ref)
	local list = { ... }
	assert(var12(list))
	
	return function(p7)
		-- upvalues: list (ref)
		for i, v in ipairs(list) do
			if v(p7) then
				return true
			end
		end
		return false, "bad type for union"
	end
end

t.some = t.union

function t.intersection(...)
	-- upvalues: var12 (ref)
	local list = { ... }
	assert(var12(list))
	
	return function(p7)
		-- upvalues: list (ref)
		for i, v in ipairs(list) do
			local var13, var14 = v(p7)
			
			if not var13 then
				return false, var14 or ""
			end
		end
		return true
	end
end

t.every = t.intersection
local var13 = t.map(t.any, t.callback)

function t.interface(p7)
	-- upvalues: var13 (ref), t (ref)
	assert(var13(p7))
	
	return function(p8)
		-- upvalues: t (copy), p7 (ref)
		local var14, var15 = t.table(p8)
		
		if var14 == false then
			return false, var15 or ""
		end
		for i, v in pairs(p7) do
			local var16, var17 = v(p8[i])
			
			if var16 == false then
				return false, string.format("[interface] bad value for %s:\n\t%s", tostring(i), var17 or "")
			end
		end
		return true
	end
end

function t.strictInterface(p8)
	-- upvalues: var13 (ref), t (ref)
	assert(var13(p8))
	
	return function(p9)
		-- upvalues: t (copy), p8 (ref)
		local var14, var15 = t.table(p9)
		
		if var14 == false then
			return false, var15 or ""
		end
		for i, v in pairs(p8) do
			local var16, var17 = v(p9[i])
			
			if var16 == false then
				return false, string.format("[interface] bad value for %s:\n\t%s", tostring(i), var17 or "")
			end
		end
		for i_1 in pairs(p9) do
			if not p8[i_1] then
				return false, string.format("[interface] unexpected field %q", tostring(i_1))
			end
		end
		return true
	end
end

function t.instanceOf(p10, p11)
	-- upvalues: t (ref)
	assert(t.string(p10))
	local var18 = if p11 ~= nil then t.children(p11) else nil
	
	return function(p12)
		-- upvalues: t (copy), p10 (ref), var18 (write)
		local var19, var20 = t.Instance(p12)
		
		if not var19 then
			return false, var20 or ""
		elseif p12.ClassName ~= p10 then
			return false, string.format("%s expected, got %s", p10, p12.ClassName)
		elseif var18 then
			local var21, var22 = var18(p12)
			
			if var21 then
				return true
			else
				return false, var22
			end
		end
	end
end

t.instance = t.instanceOf

function t.instanceIsA(p10, p11)
	-- upvalues: t (ref)
	assert(t.string(p10))
	local var18 = if p11 ~= nil then t.children(p11) else nil
	
	return function(p12)
		-- upvalues: t (copy), p10 (ref), var18 (write)
		local var19, var20 = t.Instance(p12)
		
		if not var19 then
			return false, var20 or ""
		elseif not p12:IsA(p10) then
			return false, string.format("%s expected, got %s", p10, p12.ClassName)
		elseif var18 then
			local var21, var22 = var18(p12)
			
			if var21 then
				return true
			else
				return false, var22
			end
		end
	end
end

function t.enum(p10)
	-- upvalues: t (ref)
	assert(t.Enum(p10))
	
	return function(p11)
		-- upvalues: t (copy), p10 (ref)
		local var18, var19 = t.EnumItem(p11)
		
		if not var18 then
			return false, var19
		elseif p11.EnumType == p10 then
			return true
		end
		return false, string.format("enum of %s expected, got enum of %s", tostring(p10), tostring(p11.EnumType))
	end
end

local var18 = t.tuple(t.callback, t.callback)

function t.wrap(p10, p11)
	-- upvalues: var18 (ref)
	assert(var18(p10, p11))
	
	return function(...)
		-- upvalues: p11 (ref), p10 (ref)
		assert(p11(...))
		
		return p10(...)
	end
end

function t.strict(p10)
	return function(...)
		-- upvalues: p10 (ref)
		assert(p10(...))
	end
end

local var19 = t.map(t.string, t.callback)

function t.children(p10)
	-- upvalues: var19 (ref), t (ref)
	assert(var19(p10))
	
	return function(p11)
		-- upvalues: t (copy), p10 (ref)
		local var20, var21 = t.Instance(p11)
		
		if not var20 then
			return false, var21 or ""
		end
		local var22
		local t_1 = {}
		
		for i, v in ipairs(p11:GetChildren()) do
			var22 = v.Name
			
			if p10[var22] then
				if not t_1[var22] then
					t_1[var22] = v
					continue
				end
				return false, string.format("Cannot process multiple children with the same name %q", var22)
			end
		end
		for i_1, v_1 in pairs(p10) do
			var22, var100 = v_1(t_1[i_1])
			
			if not var22 then
				return false, string.format("[%s.%s] %s", p11:GetFullName(), i_1, var100 or "")
			end
		end
		return true
	end
end

return t