local typeof = typeof or type

local function _(p1)
	-- upvalues: typeof (ref)
	return function(p2)
		-- upvalues: typeof (copy), p1 (ref)
		local var1 = typeof(p2)
		
		if var1 == p1 then
			return true
		end
		return false, string.format("%s expected, got %s", p1, var1)
	end
end

local t = {
	any = function(p1)
		if p1 == nil then
			return false, "any expected, got nil"
		end
		return true
	end
}
local var1 = "boolean"

function t.boolean(p1)
	-- upvalues: typeof (ref), var1 (ref)
	local var2 = typeof(p1)
	
	if var2 == var1 then
		return true
	end
	return false, string.format("%s expected, got %s", var1, var2)
end

local var2 = "thread"

function t.thread(p1)
	-- upvalues: typeof (ref), var2 (ref)
	local var3 = typeof(p1)
	
	if var3 == var2 then
		return true
	end
	return false, string.format("%s expected, got %s", var2, var3)
end

local var3 = "function"

function t.callback(p1)
	-- upvalues: typeof (ref), var3 (ref)
	local var4 = typeof(p1)
	
	if var4 == var3 then
		return true
	end
	return false, string.format("%s expected, got %s", var3, var4)
end

local var4 = "nil"

function t.none(p1)
	-- upvalues: typeof (ref), var4 (ref)
	local var5 = typeof(p1)
	
	if var5 == var4 then
		return true
	end
	return false, string.format("%s expected, got %s", var4, var5)
end

local var5 = "string"

function t.string(p1)
	-- upvalues: typeof (ref), var5 (ref)
	local var6 = typeof(p1)
	
	if var6 == var5 then
		return true
	end
	return false, string.format("%s expected, got %s", var5, var6)
end

local var6 = "table"

function t.table(p1)
	-- upvalues: typeof (ref), var6 (ref)
	local var7 = typeof(p1)
	
	if var7 == var6 then
		return true
	end
	return false, string.format("%s expected, got %s", var6, var7)
end

local var7 = "userdata"

function t.userdata(p1)
	-- upvalues: typeof (ref), var7 (ref)
	local var8 = typeof(p1)
	
	if var8 == var7 then
		return true
	end
	return false, string.format("%s expected, got %s", var7, var8)
end

function t.number(p1)
	-- upvalues: typeof (ref)
	local var8 = typeof(p1)
	
	if var8 ~= "number" then
		return false, string.format("number expected, got %s", var8)
	elseif p1 == p1 then
		return true
	end
	return false, "unexpected NaN value"
end

function t.nan(p1)
	if p1 == p1 then
		return false, "unexpected non-NaN value"
	end
	return true
end

local var8 = "Axes"

function t.Axes(p1)
	-- upvalues: typeof (ref), var8 (ref)
	local var9 = typeof(p1)
	
	if var9 == var8 then
		return true
	end
	return false, string.format("%s expected, got %s", var8, var9)
end

local var9 = "BrickColor"

function t.BrickColor(p1)
	-- upvalues: typeof (ref), var9 (ref)
	local var10 = typeof(p1)
	
	if var10 == var9 then
		return true
	end
	return false, string.format("%s expected, got %s", var9, var10)
end

local var10 = "CFrame"

function t.CFrame(p1)
	-- upvalues: typeof (ref), var10 (ref)
	local var11 = typeof(p1)
	
	if var11 == var10 then
		return true
	end
	return false, string.format("%s expected, got %s", var10, var11)
end

local var11 = "Color3"

function t.Color3(p1)
	-- upvalues: typeof (ref), var11 (ref)
	local var12 = typeof(p1)
	
	if var12 == var11 then
		return true
	end
	return false, string.format("%s expected, got %s", var11, var12)
end

local var12 = "ColorSequence"

function t.ColorSequence(p1)
	-- upvalues: typeof (ref), var12 (ref)
	local var13 = typeof(p1)
	
	if var13 == var12 then
		return true
	end
	return false, string.format("%s expected, got %s", var12, var13)
end

local var13 = "ColorSequenceKeypoint"

function t.ColorSequenceKeypoint(p1)
	-- upvalues: typeof (ref), var13 (ref)
	local var14 = typeof(p1)
	
	if var14 == var13 then
		return true
	end
	return false, string.format("%s expected, got %s", var13, var14)
end

local var14 = "DockWidgetPluginGuiInfo"

function t.DockWidgetPluginGuiInfo(p1)
	-- upvalues: typeof (ref), var14 (ref)
	local var15 = typeof(p1)
	
	if var15 == var14 then
		return true
	end
	return false, string.format("%s expected, got %s", var14, var15)
end

local var15 = "Faces"

function t.Faces(p1)
	-- upvalues: typeof (ref), var15 (ref)
	local var16 = typeof(p1)
	
	if var16 == var15 then
		return true
	end
	return false, string.format("%s expected, got %s", var15, var16)
end

local var16 = "Instance"

function t.Instance(p1)
	-- upvalues: typeof (ref), var16 (ref)
	local var17 = typeof(p1)
	
	if var17 == var16 then
		return true
	end
	return false, string.format("%s expected, got %s", var16, var17)
end

local var17 = "NumberRange"

function t.NumberRange(p1)
	-- upvalues: typeof (ref), var17 (ref)
	local var18 = typeof(p1)
	
	if var18 == var17 then
		return true
	end
	return false, string.format("%s expected, got %s", var17, var18)
end

local var18 = "NumberSequence"

function t.NumberSequence(p1)
	-- upvalues: typeof (ref), var18 (ref)
	local var19 = typeof(p1)
	
	if var19 == var18 then
		return true
	end
	return false, string.format("%s expected, got %s", var18, var19)
end

local var19 = "NumberSequenceKeypoint"

function t.NumberSequenceKeypoint(p1)
	-- upvalues: typeof (ref), var19 (ref)
	local var20 = typeof(p1)
	
	if var20 == var19 then
		return true
	end
	return false, string.format("%s expected, got %s", var19, var20)
end

local var20 = "PathWaypoint"

function t.PathWaypoint(p1)
	-- upvalues: typeof (ref), var20 (ref)
	local var21 = typeof(p1)
	
	if var21 == var20 then
		return true
	end
	return false, string.format("%s expected, got %s", var20, var21)
end

local var21 = "PhysicalProperties"

function t.PhysicalProperties(p1)
	-- upvalues: typeof (ref), var21 (ref)
	local var22 = typeof(p1)
	
	if var22 == var21 then
		return true
	end
	return false, string.format("%s expected, got %s", var21, var22)
end

local var22 = "Random"

function t.Random(p1)
	-- upvalues: typeof (ref), var22 (ref)
	local var23 = typeof(p1)
	
	if var23 == var22 then
		return true
	end
	return false, string.format("%s expected, got %s", var22, var23)
end

local var23 = "Ray"

function t.Ray(p1)
	-- upvalues: typeof (ref), var23 (ref)
	local var24 = typeof(p1)
	
	if var24 == var23 then
		return true
	end
	return false, string.format("%s expected, got %s", var23, var24)
end

local var24 = "Rect"

function t.Rect(p1)
	-- upvalues: typeof (ref), var24 (ref)
	local var25 = typeof(p1)
	
	if var25 == var24 then
		return true
	end
	return false, string.format("%s expected, got %s", var24, var25)
end

local var25 = "Region3"

function t.Region3(p1)
	-- upvalues: typeof (ref), var25 (ref)
	local var26 = typeof(p1)
	
	if var26 == var25 then
		return true
	end
	return false, string.format("%s expected, got %s", var25, var26)
end

local var26 = "Region3int16"

function t.Region3int16(p1)
	-- upvalues: typeof (ref), var26 (ref)
	local var27 = typeof(p1)
	
	if var27 == var26 then
		return true
	end
	return false, string.format("%s expected, got %s", var26, var27)
end

local var27 = "TweenInfo"

function t.TweenInfo(p1)
	-- upvalues: typeof (ref), var27 (ref)
	local var28 = typeof(p1)
	
	if var28 == var27 then
		return true
	end
	return false, string.format("%s expected, got %s", var27, var28)
end

local var28 = "UDim"

function t.UDim(p1)
	-- upvalues: typeof (ref), var28 (ref)
	local var29 = typeof(p1)
	
	if var29 == var28 then
		return true
	end
	return false, string.format("%s expected, got %s", var28, var29)
end

local var29 = "UDim2"

function t.UDim2(p1)
	-- upvalues: typeof (ref), var29 (ref)
	local var30 = typeof(p1)
	
	if var30 == var29 then
		return true
	end
	return false, string.format("%s expected, got %s", var29, var30)
end

local var30 = "Vector2"

function t.Vector2(p1)
	-- upvalues: typeof (ref), var30 (ref)
	local var31 = typeof(p1)
	
	if var31 == var30 then
		return true
	end
	return false, string.format("%s expected, got %s", var30, var31)
end

local var31 = "Vector3"

function t.Vector3(p1)
	-- upvalues: typeof (ref), var31 (ref)
	local var32 = typeof(p1)
	
	if var32 == var31 then
		return true
	end
	return false, string.format("%s expected, got %s", var31, var32)
end

local var32 = "Vector3int16"

function t.Vector3int16(p1)
	-- upvalues: typeof (ref), var32 (ref)
	local var33 = typeof(p1)
	
	if var33 == var32 then
		return true
	end
	return false, string.format("%s expected, got %s", var32, var33)
end

local var33 = "Enum"

function t.Enum(p1)
	-- upvalues: typeof (ref), var33 (ref)
	local var34 = typeof(p1)
	
	if var34 == var33 then
		return true
	end
	return false, string.format("%s expected, got %s", var33, var34)
end

local var34 = "EnumItem"

function t.EnumItem(p1)
	-- upvalues: typeof (ref), var34 (ref)
	local var35 = typeof(p1)
	
	if var35 == var34 then
		return true
	end
	return false, string.format("%s expected, got %s", var34, var35)
end

local var35 = "RBXScriptSignal"

function t.RBXScriptSignal(p1)
	-- upvalues: typeof (ref), var35 (ref)
	local var36 = typeof(p1)
	
	if var36 == var35 then
		return true
	end
	return false, string.format("%s expected, got %s", var35, var36)
end

local var36 = "RBXScriptConnection"

function t.RBXScriptConnection(p1)
	-- upvalues: typeof (ref), var36 (ref)
	local var37 = typeof(p1)
	
	if var37 == var36 then
		return true
	end
	return false, string.format("%s expected, got %s", var36, var37)
end

function t.literal(...)
	-- upvalues: t (ref)
	local var37 = select("#", ...)
	
	if var37 == 1 then
		local var38 = ...
		
		return function(p1)
			-- upvalues: var38 (ref)
			if p1 == var38 then
				return true
			end
			return false, string.format("expected %s, got %s", tostring(var38), tostring(p1))
		end
	end
	local t_1 = {}
	
	for i = 1, var37 do
		t_1[i] = t.literal(select(i, ...))
	end
	return t.union(unpack(t_1))
end

t.exactly = t.literal

function t.keyOf(p1)
	-- upvalues: t (ref)
	local t_1 = {}
	
	for i in pairs(p1) do
		t_1[#t_1 + 1] = i
	end
	return t.literal(unpack(t_1))
end

function t.valueOf(p2)
	-- upvalues: t (ref)
	local t_1 = {}
	
	for i, v in pairs(p2) do
		t_1[#t_1 + 1] = v
	end
	return t.literal(unpack(t_1))
end

function t.integer(p3)
	-- upvalues: t (ref)
	local var39, var40 = t.number(p3)
	
	if not var39 then
		return false, var40 or ""
	elseif p3 % 1 == 0 then
		return true
	end
	return false, string.format("integer expected, got %s", p3)
end

function t.numberMin(a)
	-- upvalues: t (ref)
	return function(p3)
		-- upvalues: t (copy), a (ref)
		local var39, var40 = t.number(p3)
		
		if not var39 then
			return false, var40 or ""
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
		local var39, var40 = t.number(p3)
		
		if not var39 then
			return false, var40
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
		local var39, var40 = t.number(p3)
		
		if not var39 then
			return false, var40 or ""
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
		local var39, var40 = t.number(p3)
		
		if not var39 then
			return false, var40 or ""
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
	assert(t.number(p3) and t.number(p4))
	local var39 = t.numberMin(p3)
	local var40 = t.numberMax(p4)
	
	return function(p5)
		-- upvalues: var39 (ref), var40 (ref)
		local var41, var42 = var39(p5)
		
		if not var41 then
			return false, var42 or ""
		end
		local var43, var44 = var40(p5)
		
		if var43 then
			return true
		end
		return false, var44 or ""
	end
end

function t.numberConstrainedExclusive(p3, p4)
	-- upvalues: t (ref)
	assert(t.number(p3) and t.number(p4))
	local var39 = t.numberMinExclusive(p3)
	local var40 = t.numberMaxExclusive(p4)
	
	return function(p5)
		-- upvalues: var39 (ref), var40 (ref)
		local var41, var42 = var39(p5)
		
		if not var41 then
			return false, var42 or ""
		end
		local var43, var44 = var40(p5)
		
		if var43 then
			return true
		end
		return false, var44 or ""
	end
end

function t.match(p3)
	-- upvalues: t (ref)
	assert(t.string(p3))
	
	return function(p4)
		-- upvalues: t (copy), p3 (ref)
		local var39, var40 = t.string(p4)
		
		if not var39 then
			return false, var40
		elseif string.match(p4, p3) == nil then
			return false, string.format("\"%s\" failed to match pattern \"%s\"", p4, p3)
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
		local var39, var40 = p3(p4)
		
		if var39 then
			return true
		end
		return false, string.format("(optional) %s", var40 or "")
	end
end

function t.tuple(...)
	local list = { ... }
	
	return function(...)
		-- upvalues: list (ref)
		local list_1 = { ... }
		
		for i = 1, #list do
			local var39, var40 = list[i](list_1[i])
			
			if var39 ~= false then
				continue
			end
			return false, string.format("Bad tuple index #%s:\n\t%s", i, var40 or "")
		end
		return true
	end
end

function t.keys(p3)
	-- upvalues: t (ref)
	assert(t.callback(p3))
	
	return function(p4)
		-- upvalues: t (copy), p3 (ref)
		local var39, var40 = t.table(p4)
		
		if var39 == false then
			return false, var40 or ""
		end
		for i in pairs(p4) do
			local var41, var42 = p3(i)
			
			if var41 == false then
				return false, string.format("bad key %s:\n\t%s", tostring(i), var42 or "")
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
		local var39, var40 = t.table(p5)
		
		if var39 == false then
			return false, var40 or ""
		end
		for i, v in pairs(p5) do
			local var41, var42 = p4(v)
			
			if var41 == false then
				return false, string.format("bad value for key %s:\n\t%s", tostring(i), var42 or "")
			end
		end
		return true
	end
end

function t.map(p5, p6)
	-- upvalues: t (ref)
	assert(t.callback(p5), t.callback(p6))
	local var39 = t.keys(p5)
	local var40 = t.values(p6)
	
	return function(p7)
		-- upvalues: var39 (ref), var40 (ref)
		local var41, var42 = var39(p7)
		
		if not var41 then
			return false, var42 or ""
		end
		local var43, var44 = var40(p7)
		
		if var43 then
			return true
		end
		return false, var44 or ""
	end
end

local var39 = t.keys(t.integer)

function t.array(p5)
	-- upvalues: t (ref), var39 (ref)
	assert(t.callback(p5))
	local var40 = t.values(p5)
	
	return function(p6)
		-- upvalues: var39 (copy), var40 (ref)
		local var41, var42 = var39(p6)
		
		if var41 == false then
			return false, string.format("[array] %s", var42 or "")
		end
		local var43 = 0
		
		for i, v in ipairs(p6) do
			var43 += 1
		end
		for i_1 in pairs(p6) do
			if i_1 < 1 or var43 < i_1 then
				return false, string.format("[array] key %s must be sequential", tostring(i_1))
			end
		end
		local var44, var45 = var40(p6)
		
		if var44 then
			return true
		end
		return false, string.format("[array] %s", var45 or "")
	end
end

local var46 = t.array(t.callback)

function t.union(...)
	-- upvalues: var46 (ref)
	local list = { ... }
	assert(var46(list))
	
	return function(p7)
		-- upvalues: list (ref)
		for i, v in pairs(list) do
			if v(p7) then
				return true
			end
		end
		return false, "bad type for union"
	end
end

t.some = t.union

function t.intersection(...)
	-- upvalues: var46 (ref)
	local list = { ... }
	assert(var46(list))
	
	return function(p7)
		-- upvalues: list (ref)
		for i, v in pairs(list) do
			local var47, var48 = v(p7)
			
			if not var47 then
				return false, var48 or ""
			end
		end
		return true
	end
end

t.every = t.intersection
local var47 = t.map(t.any, t.callback)

function t.interface(p7)
	-- upvalues: var47 (ref), t (ref)
	assert(var47(p7))
	
	return function(p8)
		-- upvalues: t (copy), p7 (ref)
		local var48, var49 = t.table(p8)
		
		if var48 == false then
			return false, var49 or ""
		end
		for i, v in pairs(p7) do
			local var50, var51 = v(p8[i])
			
			if var50 == false then
				return false, string.format("[interface] bad value for %s:\n\t%s", tostring(i), var51 or "")
			end
		end
		return true
	end
end

function t.strictInterface(p8)
	-- upvalues: var47 (ref), t (ref)
	assert(var47(p8))
	
	return function(p9)
		-- upvalues: t (copy), p8 (ref)
		local var48, var49 = t.table(p9)
		
		if var48 == false then
			return false, var49 or ""
		end
		for i, v in pairs(p8) do
			local var50, var51 = v(p9[i])
			
			if var50 == false then
				return false, string.format("[interface] bad value for %s:\n\t%s", tostring(i), var51 or "")
			end
		end
		for i_1 in pairs(p9) do
			if not p8[i_1] then
				return false, string.format("[interface] unexpected field '%s'", tostring(i_1))
			end
		end
		return true
	end
end

function t.instanceOf(p10, p11)
	-- upvalues: t (ref)
	assert(t.string(p10))
	local var52 = if p11 ~= nil then t.children(p11) else nil
	
	return function(p12)
		-- upvalues: t (copy), p10 (ref), var52 (write)
		local var53, var54 = t.Instance(p12)
		
		if not var53 then
			return false, var54 or ""
		elseif p12.ClassName ~= p10 then
			return false, string.format("%s expected, got %s", p10, p12.ClassName)
		elseif var52 then
			local var55, var56 = var52(p12)
			
			if var55 then
				return true
			else
				return false, var56
			end
		end
	end
end

t.instance = t.instanceOf

function t.instanceIsA(p10, p11)
	-- upvalues: t (ref)
	assert(t.string(p10))
	local var52 = if p11 ~= nil then t.children(p11) else nil
	
	return function(p12)
		-- upvalues: t (copy), p10 (ref), var52 (write)
		local var53, var54 = t.Instance(p12)
		
		if not var53 then
			return false, var54 or ""
		elseif not p12:IsA(p10) then
			return false, string.format("%s expected, got %s", p10, p12.ClassName)
		elseif var52 then
			local var55, var56 = var52(p12)
			
			if var55 then
				return true
			else
				return false, var56
			end
		end
	end
end

function t.enum(p10)
	-- upvalues: t (ref)
	assert(t.Enum(p10))
	
	return function(p11)
		-- upvalues: t (copy), p10 (ref)
		local var52, var53 = t.EnumItem(p11)
		
		if not var52 then
			return false, var53
		elseif p11.EnumType == p10 then
			return true
		end
		return false, string.format("enum of %s expected, got enum of %s", tostring(p10), tostring(p11.EnumType))
	end
end

local var52 = t.tuple(t.callback, t.callback)

function t.wrap(p10, p11)
	-- upvalues: var52 (ref)
	assert(var52(p10, p11))
	
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

local var53 = t.map(t.string, t.callback)

function t.children(p10)
	-- upvalues: var53 (ref), t (ref)
	assert(var53(p10))
	
	return function(p11)
		-- upvalues: t (copy), p10 (ref)
		local var54, var55 = t.Instance(p11)
		
		if not var54 then
			return false, var55 or ""
		end
		local var56
		local t_1 = {}
		
		for i, v in pairs(p11:GetChildren()) do
			var56 = v.Name
			
			if p10[var56] then
				if not t_1[var56] then
					t_1[var56] = v
					continue
				end
				return false, string.format("Cannot process multiple children with the same name \"%s\"", var56)
			end
		end
		for i_1, v_1 in pairs(p10) do
			var56, var128 = v_1(t_1[i_1])
			
			if not var56 then
				return false, string.format("[%s.%s] %s", p11:GetFullName(), i_1, var128 or "")
			end
		end
		return true
	end
end

return t