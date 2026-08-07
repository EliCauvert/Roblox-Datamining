local typeof = typeof or type

local function _(p0) --[[ line: 6 | named "primitive" ]]
	-- upvalues: typeof (ref)
	return function(p1) --[[ line: 7 ]]
		-- upvalues: typeof (copy), p0 (ref)
		local var43 = typeof(p1)
		
		if var43 == p0 then
			return true
		end
		return false, string.format("%s expected, got %s", p0, var43)
	end
end

local t = {
	any = function(p2) --[[ line: 26 ]]
		if p2 == nil then
			return false, "any expected, got nil"
		end
		return true
	end
}
local var2 = "boolean"

function t.boolean(p3) --[[ line: 7 ]]
	-- upvalues: typeof (ref), var2 (ref)
	local var43 = typeof(p3)
	
	if var43 == var2 then
		return true
	end
	return false, string.format("%s expected, got %s", var2, var43)
end

local var3 = "thread"

function t.thread(p4) --[[ line: 7 ]]
	-- upvalues: typeof (ref), var3 (ref)
	local var43 = typeof(p4)
	
	if var43 == var3 then
		return true
	end
	return false, string.format("%s expected, got %s", var3, var43)
end

local var4 = "function"

function t.callback(p5) --[[ line: 7 ]]
	-- upvalues: typeof (ref), var4 (ref)
	local var43 = typeof(p5)
	
	if var43 == var4 then
		return true
	end
	return false, string.format("%s expected, got %s", var4, var43)
end

local var5 = "nil"

function t.none(p6) --[[ line: 7 ]]
	-- upvalues: typeof (ref), var5 (ref)
	local var43 = typeof(p6)
	
	if var43 == var5 then
		return true
	end
	return false, string.format("%s expected, got %s", var5, var43)
end

local var6 = "string"

function t.string(p7) --[[ line: 7 ]]
	-- upvalues: typeof (ref), var6 (ref)
	local var43 = typeof(p7)
	
	if var43 == var6 then
		return true
	end
	return false, string.format("%s expected, got %s", var6, var43)
end

local var7 = "table"

function t.table(p8) --[[ line: 7 ]]
	-- upvalues: typeof (ref), var7 (ref)
	local var43 = typeof(p8)
	
	if var43 == var7 then
		return true
	end
	return false, string.format("%s expected, got %s", var7, var43)
end

local var8 = "userdata"

function t.userdata(p9) --[[ line: 7 ]]
	-- upvalues: typeof (ref), var8 (ref)
	local var43 = typeof(p9)
	
	if var43 == var8 then
		return true
	end
	return false, string.format("%s expected, got %s", var8, var43)
end

function t.number(p10) --[[ line: 106 ]]
	-- upvalues: typeof (ref)
	local var44 = typeof(p10)
	
	if var44 ~= "number" then
		return false, string.format("number expected, got %s", var44)
	elseif p10 == p10 then
		return true
	end
	return false, "unexpected NaN value"
end

function t.nan(p11) --[[ line: 126 ]]
	if p11 == p11 then
		return false, "unexpected non-NaN value"
	end
	return true
end

local var9 = "Axes"

function t.Axes(p12) --[[ line: 7 ]]
	-- upvalues: typeof (ref), var9 (ref)
	local var43 = typeof(p12)
	
	if var43 == var9 then
		return true
	end
	return false, string.format("%s expected, got %s", var9, var43)
end

local var10 = "BrickColor"

function t.BrickColor(p13) --[[ line: 7 ]]
	-- upvalues: typeof (ref), var10 (ref)
	local var43 = typeof(p13)
	
	if var43 == var10 then
		return true
	end
	return false, string.format("%s expected, got %s", var10, var43)
end

local var11 = "CFrame"

function t.CFrame(p14) --[[ line: 7 ]]
	-- upvalues: typeof (ref), var11 (ref)
	local var43 = typeof(p14)
	
	if var43 == var11 then
		return true
	end
	return false, string.format("%s expected, got %s", var11, var43)
end

local var12 = "Color3"

function t.Color3(p15) --[[ line: 7 ]]
	-- upvalues: typeof (ref), var12 (ref)
	local var43 = typeof(p15)
	
	if var43 == var12 then
		return true
	end
	return false, string.format("%s expected, got %s", var12, var43)
end

local var13 = "ColorSequence"

function t.ColorSequence(p16) --[[ line: 7 ]]
	-- upvalues: typeof (ref), var13 (ref)
	local var43 = typeof(p16)
	
	if var43 == var13 then
		return true
	end
	return false, string.format("%s expected, got %s", var13, var43)
end

local var14 = "ColorSequenceKeypoint"

function t.ColorSequenceKeypoint(p17) --[[ line: 7 ]]
	-- upvalues: typeof (ref), var14 (ref)
	local var43 = typeof(p17)
	
	if var43 == var14 then
		return true
	end
	return false, string.format("%s expected, got %s", var14, var43)
end

local var15 = "DockWidgetPluginGuiInfo"

function t.DockWidgetPluginGuiInfo(p18) --[[ line: 7 ]]
	-- upvalues: typeof (ref), var15 (ref)
	local var43 = typeof(p18)
	
	if var43 == var15 then
		return true
	end
	return false, string.format("%s expected, got %s", var15, var43)
end

local var16 = "Faces"

function t.Faces(p19) --[[ line: 7 ]]
	-- upvalues: typeof (ref), var16 (ref)
	local var43 = typeof(p19)
	
	if var43 == var16 then
		return true
	end
	return false, string.format("%s expected, got %s", var16, var43)
end

local var17 = "Instance"

function t.Instance(p20) --[[ line: 7 ]]
	-- upvalues: typeof (ref), var17 (ref)
	local var43 = typeof(p20)
	
	if var43 == var17 then
		return true
	end
	return false, string.format("%s expected, got %s", var17, var43)
end

local var18 = "NumberRange"

function t.NumberRange(p21) --[[ line: 7 ]]
	-- upvalues: typeof (ref), var18 (ref)
	local var43 = typeof(p21)
	
	if var43 == var18 then
		return true
	end
	return false, string.format("%s expected, got %s", var18, var43)
end

local var19 = "NumberSequence"

function t.NumberSequence(p22) --[[ line: 7 ]]
	-- upvalues: typeof (ref), var19 (ref)
	local var43 = typeof(p22)
	
	if var43 == var19 then
		return true
	end
	return false, string.format("%s expected, got %s", var19, var43)
end

local var20 = "NumberSequenceKeypoint"

function t.NumberSequenceKeypoint(p23) --[[ line: 7 ]]
	-- upvalues: typeof (ref), var20 (ref)
	local var43 = typeof(p23)
	
	if var43 == var20 then
		return true
	end
	return false, string.format("%s expected, got %s", var20, var43)
end

local var21 = "PathWaypoint"

function t.PathWaypoint(p24) --[[ line: 7 ]]
	-- upvalues: typeof (ref), var21 (ref)
	local var43 = typeof(p24)
	
	if var43 == var21 then
		return true
	end
	return false, string.format("%s expected, got %s", var21, var43)
end

local var22 = "PhysicalProperties"

function t.PhysicalProperties(p25) --[[ line: 7 ]]
	-- upvalues: typeof (ref), var22 (ref)
	local var43 = typeof(p25)
	
	if var43 == var22 then
		return true
	end
	return false, string.format("%s expected, got %s", var22, var43)
end

local var23 = "Random"

function t.Random(p26) --[[ line: 7 ]]
	-- upvalues: typeof (ref), var23 (ref)
	local var43 = typeof(p26)
	
	if var43 == var23 then
		return true
	end
	return false, string.format("%s expected, got %s", var23, var43)
end

local var24 = "Ray"

function t.Ray(p27) --[[ line: 7 ]]
	-- upvalues: typeof (ref), var24 (ref)
	local var43 = typeof(p27)
	
	if var43 == var24 then
		return true
	end
	return false, string.format("%s expected, got %s", var24, var43)
end

local var25 = "Rect"

function t.Rect(p28) --[[ line: 7 ]]
	-- upvalues: typeof (ref), var25 (ref)
	local var43 = typeof(p28)
	
	if var43 == var25 then
		return true
	end
	return false, string.format("%s expected, got %s", var25, var43)
end

local var26 = "Region3"

function t.Region3(p29) --[[ line: 7 ]]
	-- upvalues: typeof (ref), var26 (ref)
	local var43 = typeof(p29)
	
	if var43 == var26 then
		return true
	end
	return false, string.format("%s expected, got %s", var26, var43)
end

local var27 = "Region3int16"

function t.Region3int16(p30) --[[ line: 7 ]]
	-- upvalues: typeof (ref), var27 (ref)
	local var43 = typeof(p30)
	
	if var43 == var27 then
		return true
	end
	return false, string.format("%s expected, got %s", var27, var43)
end

local var28 = "TweenInfo"

function t.TweenInfo(p31) --[[ line: 7 ]]
	-- upvalues: typeof (ref), var28 (ref)
	local var43 = typeof(p31)
	
	if var43 == var28 then
		return true
	end
	return false, string.format("%s expected, got %s", var28, var43)
end

local var29 = "UDim"

function t.UDim(p32) --[[ line: 7 ]]
	-- upvalues: typeof (ref), var29 (ref)
	local var43 = typeof(p32)
	
	if var43 == var29 then
		return true
	end
	return false, string.format("%s expected, got %s", var29, var43)
end

local var30 = "UDim2"

function t.UDim2(p33) --[[ line: 7 ]]
	-- upvalues: typeof (ref), var30 (ref)
	local var43 = typeof(p33)
	
	if var43 == var30 then
		return true
	end
	return false, string.format("%s expected, got %s", var30, var43)
end

local var31 = "Vector2"

function t.Vector2(p34) --[[ line: 7 ]]
	-- upvalues: typeof (ref), var31 (ref)
	local var43 = typeof(p34)
	
	if var43 == var31 then
		return true
	end
	return false, string.format("%s expected, got %s", var31, var43)
end

local var32 = "Vector3"

function t.Vector3(p35) --[[ line: 7 ]]
	-- upvalues: typeof (ref), var32 (ref)
	local var43 = typeof(p35)
	
	if var43 == var32 then
		return true
	end
	return false, string.format("%s expected, got %s", var32, var43)
end

local var33 = "Vector3int16"

function t.Vector3int16(p36) --[[ line: 7 ]]
	-- upvalues: typeof (ref), var33 (ref)
	local var43 = typeof(p36)
	
	if var43 == var33 then
		return true
	end
	return false, string.format("%s expected, got %s", var33, var43)
end

local var34 = "Enum"

function t.Enum(p37) --[[ line: 7 ]]
	-- upvalues: typeof (ref), var34 (ref)
	local var43 = typeof(p37)
	
	if var43 == var34 then
		return true
	end
	return false, string.format("%s expected, got %s", var34, var43)
end

local var35 = "EnumItem"

function t.EnumItem(p38) --[[ line: 7 ]]
	-- upvalues: typeof (ref), var35 (ref)
	local var43 = typeof(p38)
	
	if var43 == var35 then
		return true
	end
	return false, string.format("%s expected, got %s", var35, var43)
end

local var36 = "RBXScriptSignal"

function t.RBXScriptSignal(p39) --[[ line: 7 ]]
	-- upvalues: typeof (ref), var36 (ref)
	local var43 = typeof(p39)
	
	if var43 == var36 then
		return true
	end
	return false, string.format("%s expected, got %s", var36, var43)
end

local var37 = "RBXScriptConnection"

function t.RBXScriptConnection(p40) --[[ line: 7 ]]
	-- upvalues: typeof (ref), var37 (ref)
	local var43 = typeof(p40)
	
	if var43 == var37 then
		return true
	end
	return false, string.format("%s expected, got %s", var37, var43)
end

function t.literal(...) --[[ line: 406 ]]
	-- upvalues: t (ref)
	local var45 = select("#", ...)
	
	if var45 == 1 then
		local var46 = ...
		
		return function(p41) --[[ line: 410 ]]
			-- upvalues: var46 (ref)
			if p41 == var46 then
				return true
			end
			return false, string.format("expected %s, got %s", tostring(var46), tostring(p41))
		end
	end
	local t_1 = {}
	
	for i = 1, var45 do
		t_1[i] = t.literal(select(i, ...))
	end
	return t.union(unpack(t_1))
end

t.exactly = t.literal

function t.keyOf(p42) --[[ line: 439 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	for i in pairs(p42) do
		t_1[#t_1 + 1] = i
	end
	return t.literal(unpack(t_1))
end

function t.valueOf(p43) --[[ line: 454 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	for i, v in pairs(p43) do
		t_1[#t_1 + 1] = v
	end
	return t.literal(unpack(t_1))
end

function t.integer(p44) --[[ line: 469 ]]
	-- upvalues: t (ref)
	local var50, var51 = t.number(p44)
	
	if not var50 then
		return false, var51 or ""
	elseif p44 % 1 == 0 then
		return true
	end
	return false, string.format("integer expected, got %s", p44)
end

function t.numberMin(a) --[[ line: 488 ]]
	-- upvalues: t (ref)
	return function(p45) --[[ line: 489 ]]
		-- upvalues: t (copy), a (ref)
		local var52, var53 = t.number(p45)
		
		if not var52 then
			return false, var53 or ""
		elseif a <= p45 then
			return true
		end
		return false, string.format("number >= %s expected, got %s", a, p45)
	end
end

function t.numberMax(a) --[[ line: 509 ]]
	-- upvalues: t (ref)
	return function(p46) --[[ line: 510 ]]
		-- upvalues: t (copy), a (ref)
		local var54, var55 = t.number(p46)
		
		if not var54 then
			return false, var55
		elseif p46 <= a then
			return true
		end
		return false, string.format("number <= %s expected, got %s", a, p46)
	end
end

function t.numberMinExclusive(a) --[[ line: 530 ]]
	-- upvalues: t (ref)
	return function(p47) --[[ line: 531 ]]
		-- upvalues: t (copy), a (ref)
		local var56, var57 = t.number(p47)
		
		if not var56 then
			return false, var57 or ""
		elseif a < p47 then
			return true
		end
		return false, string.format("number > %s expected, got %s", a, p47)
	end
end

function t.numberMaxExclusive(a) --[[ line: 551 ]]
	-- upvalues: t (ref)
	return function(p48) --[[ line: 552 ]]
		-- upvalues: t (copy), a (ref)
		local var58, var59 = t.number(p48)
		
		if not var58 then
			return false, var59 or ""
		elseif p48 < a then
			return true
		end
		return false, string.format("number < %s expected, got %s", a, p48)
	end
end

t.numberPositive = t.numberMinExclusive(0)
t.numberNegative = t.numberMaxExclusive(0)

function t.numberConstrained(p49, p50) --[[ line: 587 ]]
	-- upvalues: t (ref)
	assert(t.number(p49) and t.number(p50))
	local var60 = t.numberMin(p49)
	local var61 = t.numberMax(p50)
	
	return function(p51) --[[ line: 591 ]]
		-- upvalues: var60 (ref), var61 (ref)
		local var62, var63 = var60(p51)
		
		if not var62 then
			return false, var63 or ""
		end
		local var64, var65 = var61(p51)
		
		if var64 then
			return true
		end
		return false, var65 or ""
	end
end

function t.numberConstrainedExclusive(p52, p53) --[[ line: 614 ]]
	-- upvalues: t (ref)
	assert(t.number(p52) and t.number(p53))
	local var66 = t.numberMinExclusive(p52)
	local var67 = t.numberMaxExclusive(p53)
	
	return function(p54) --[[ line: 618 ]]
		-- upvalues: var66 (ref), var67 (ref)
		local var68, var69 = var66(p54)
		
		if not var68 then
			return false, var69 or ""
		end
		local var70, var71 = var67(p54)
		
		if var70 then
			return true
		end
		return false, var71 or ""
	end
end

function t.match(p55) --[[ line: 640 ]]
	-- upvalues: t (ref)
	assert(t.string(p55))
	
	return function(p56) --[[ line: 642 ]]
		-- upvalues: t (copy), p55 (ref)
		local var72, var73 = t.string(p56)
		
		if not var72 then
			return false, var73
		elseif string.match(p56, p55) == nil then
			return false, string.format("\"%s\" failed to match pattern \"%s\"", p56, p55)
		end
		return true
	end
end

function t.optional(p57) --[[ line: 663 ]]
	-- upvalues: t (ref)
	assert(t.callback(p57))
	
	return function(p58) --[[ line: 665 ]]
		-- upvalues: p57 (ref)
		if p58 == nil then
			return true
		end
		local var74, var75 = p57(p58)
		
		if var74 then
			return true
		end
		return false, string.format("(optional) %s", var75 or "")
	end
end

function t.tuple(...) --[[ line: 685 ]]
	local list = { ... }
	
	return function(...) --[[ line: 687 ]]
		-- upvalues: list (ref)
		local list_1 = { ... }
		
		for i = 1, #list do
			local var78, var79 = list[i](list_1[i])
			
			if var78 ~= false then
				continue
			end
			return false, string.format("Bad tuple index #%s:\n\t%s", i, var79 or "")
		end
		return true
	end
end

function t.keys(p59) --[[ line: 706 ]]
	-- upvalues: t (ref)
	assert(t.callback(p59))
	
	return function(p60) --[[ line: 708 ]]
		-- upvalues: t (copy), p59 (ref)
		local var80, var81 = t.table(p60)
		
		if var80 == false then
			return false, var81 or ""
		end
		for i in pairs(p60) do
			local var82, var83 = p59(i)
			
			if var82 == false then
				return false, string.format("bad key %s:\n\t%s", tostring(i), var83 or "")
			end
		end
		return true
	end
end

function t.values(p61) --[[ line: 732 ]]
	-- upvalues: t (ref)
	assert(t.callback(p61))
	
	return function(p62) --[[ line: 734 ]]
		-- upvalues: t (copy), p61 (ref)
		local var84, var85 = t.table(p62)
		
		if var84 == false then
			return false, var85 or ""
		end
		for i, v in pairs(p62) do
			local var86, var87 = p61(v)
			
			if var86 == false then
				return false, string.format("bad value for key %s:\n\t%s", tostring(i), var87 or "")
			end
		end
		return true
	end
end

function t.map(p63, p64) --[[ line: 759 ]]
	-- upvalues: t (ref)
	assert(t.callback(p63), t.callback(p64))
	local var88 = t.keys(p63)
	local var89 = t.values(p64)
	
	return function(p65) --[[ line: 763 ]]
		-- upvalues: var88 (ref), var89 (ref)
		local var90, var91 = var88(p65)
		
		if not var90 then
			return false, var91 or ""
		end
		local var92, var93 = var89(p65)
		
		if var92 then
			return true
		end
		return false, var93 or ""
	end
end

local var38 = t.keys(t.integer)

function t.array(p66) --[[ line: 787 ]]
	-- upvalues: t (ref), var38 (ref)
	assert(t.callback(p66))
	local var94 = t.values(p66)
	
	return function(p67) --[[ line: 790 ]]
		-- upvalues: var38 (copy), var94 (ref)
		local var95, var96 = var38(p67)
		
		if var95 == false then
			return false, string.format("[array] %s", var96 or "")
		end
		local var97 = 0
		
		for i, v in ipairs(p67) do
			var97 += 1
		end
		for i_1 in pairs(p67) do
			if i_1 < 1 or var97 < i_1 then
				return false, string.format("[array] key %s must be sequential", tostring(i_1))
			end
		end
		local var98, var99 = var94(p67)
		
		if var98 then
			return true
		end
		return false, string.format("[array] %s", var99 or "")
	end
end

local var39 = t.array(t.callback)

function t.union(...) --[[ line: 829 ]]
	-- upvalues: var39 (ref)
	local list = { ... }
	assert(var39(list))
	
	return function(p68) --[[ line: 832 ]]
		-- upvalues: list (ref)
		for i, v in pairs(list) do
			if v(p68) then
				return true
			end
		end
		return false, "bad type for union"
	end
end

t.some = t.union

function t.intersection(...) --[[ line: 854 ]]
	-- upvalues: var39 (ref)
	local list = { ... }
	assert(var39(list))
	
	return function(p69) --[[ line: 857 ]]
		-- upvalues: list (ref)
		for i, v in pairs(list) do
			local var102, var103 = v(p69)
			
			if not var102 then
				return false, var103 or ""
			end
		end
		return true
	end
end

t.every = t.intersection
local var40 = t.map(t.any, t.callback)

function t.interface(p70) --[[ line: 883 ]]
	-- upvalues: var40 (ref), t (ref)
	assert(var40(p70))
	
	return function(p71) --[[ line: 885 ]]
		-- upvalues: t (copy), p70 (ref)
		local var104, var105 = t.table(p71)
		
		if var104 == false then
			return false, var105 or ""
		end
		for i, v in pairs(p70) do
			local var106, var107 = v(p71[i])
			
			if var106 == false then
				return false, string.format("[interface] bad value for %s:\n\t%s", tostring(i), var107 or "")
			end
		end
		return true
	end
end

function t.strictInterface(p72) --[[ line: 908 ]]
	-- upvalues: var40 (ref), t (ref)
	assert(var40(p72))
	
	return function(p73) --[[ line: 910 ]]
		-- upvalues: t (copy), p72 (ref)
		local var108, var109 = t.table(p73)
		
		if var108 == false then
			return false, var109 or ""
		end
		for i, v in pairs(p72) do
			local var110, var111 = v(p73[i])
			
			if var110 == false then
				return false, string.format("[interface] bad value for %s:\n\t%s", tostring(i), var111 or "")
			end
		end
		for i_1 in pairs(p73) do
			if not p72[i_1] then
				return false, string.format("[interface] unexpected field '%s'", tostring(i_1))
			end
		end
		return true
	end
end

function t.instanceOf(p74, p75) --[[ line: 941 ]]
	-- upvalues: t (ref)
	assert(t.string(p74))
	local var112 = if p75 ~= nil then t.children(p75) else nil
	
	return function(p76) --[[ line: 949 ]]
		-- upvalues: t (copy), p74 (ref), var112 (write)
		local var113, var114 = t.Instance(p76)
		
		if not var113 then
			return false, var114 or ""
		elseif p76.ClassName ~= p74 then
			return false, string.format("%s expected, got %s", p74, p76.ClassName)
		elseif var112 then
			local var115, var116 = var112(p76)
			
			if var115 then
				return true
			else
				return false, var116
			end
		end
	end
end

t.instance = t.instanceOf

function t.instanceIsA(p77, p78) --[[ line: 978 ]]
	-- upvalues: t (ref)
	assert(t.string(p77))
	local var117 = if p78 ~= nil then t.children(p78) else nil
	
	return function(p79) --[[ line: 986 ]]
		-- upvalues: t (copy), p77 (ref), var117 (write)
		local var118, var119 = t.Instance(p79)
		
		if not var118 then
			return false, var119 or ""
		elseif not p79:IsA(p77) then
			return false, string.format("%s expected, got %s", p77, p79.ClassName)
		elseif var117 then
			local var120, var121 = var117(p79)
			
			if var120 then
				return true
			else
				return false, var121
			end
		end
	end
end

function t.enum(p80) --[[ line: 1014 ]]
	-- upvalues: t (ref)
	assert(t.Enum(p80))
	
	return function(p81) --[[ line: 1016 ]]
		-- upvalues: t (copy), p80 (ref)
		local var122, var123 = t.EnumItem(p81)
		
		if not var122 then
			return false, var123
		elseif p81.EnumType == p80 then
			return true
		end
		return false, string.format("enum of %s expected, got enum of %s", tostring(p80), tostring(p81.EnumType))
	end
end

local var41 = t.tuple(t.callback, t.callback)

function t.wrap(p82, p83) --[[ line: 1041 ]]
	-- upvalues: var41 (ref)
	assert(var41(p82, p83))
	
	return function(...) --[[ line: 1043 ]]
		-- upvalues: p83 (ref), p82 (ref)
		assert(p83(...))
		
		return p82(...)
	end
end

function t.strict(p84) --[[ line: 1057 ]]
	return function(...) --[[ line: 1058 ]]
		-- upvalues: p84 (ref)
		assert(p84(...))
	end
end

local var42 = t.map(t.string, t.callback)

function t.children(p85) --[[ line: 1077 ]]
	-- upvalues: var42 (ref), t (ref)
	assert(var42(p85))
	
	return function(p86) --[[ line: 1080 ]]
		-- upvalues: t (copy), p85 (ref)
		local var124, var125 = t.Instance(p86)
		
		if not var124 then
			return false, var125 or ""
		end
		local var127
		local t_1 = {}
		
		for i, v in pairs(p86:GetChildren()) do
			var127 = v.Name
			
			if p85[var127] then
				if not t_1[var127] then
					t_1[var127] = v
					continue
				end
				return false, string.format("Cannot process multiple children with the same name \"%s\"", var127)
			end
		end
		for i_1, v_1 in pairs(p85) do
			var127, var128 = v_1(t_1[i_1])
			
			if not var127 then
				return false, string.format("[%s.%s] %s", p86:GetFullName(), i_1, var128 or "")
			end
		end
		return true
	end
end

return t