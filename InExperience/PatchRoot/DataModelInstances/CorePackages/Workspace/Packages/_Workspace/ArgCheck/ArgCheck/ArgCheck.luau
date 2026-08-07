local debugLuaArgCheck = game:DefineFastFlag("DebugLuaArgCheck", false)
local var1 = game:GetService("RunService"):IsStudio()
local t = {
	isEnabled = function() --[[ line: 7 ]]
		-- upvalues: debugLuaArgCheck (ref), var1 (ref)
		return debugLuaArgCheck or (_G.__TESTEZ_RUNNING_TEST__ or var1)
	end
}

local function _(p0, p1) --[[ line: 11 | named "assert_" ]]
	-- upvalues: t (ref)
	if t.isEnabled() then
		assert(p0, p1)
	end
end

local function stubArgCheckFunction() --[[ line: 17 ]]
	return true
end

function t.wrap(p2) --[[ line: 43 ]]
	-- upvalues: t (ref), stubArgCheckFunction (ref)
	return if t.isEnabled() then p2 else stubArgCheckFunction
end

function t.isNonNegativeNumber(p3, p4) --[[ line: 47 ]]
	-- upvalues: t (ref)
	local var4 = typeof(p3) == "number" and p3 >= 0
	local formattedText = string.format("expects %s to be a non-negative number!", p4)
	
	if t.isEnabled() then
		assert(var4, formattedText)
	end
	return p3
end

function t.isType(p5, p6, p7) --[[ line: 54 ]]
	-- upvalues: t (ref)
	local var6 = typeof(p5) == p6
	local formattedText = string.format("expects %s to be a %s! it was: %s", p7, p6, typeof(p5))
	
	if t.isEnabled() then
		assert(var6, formattedText)
	end
	return p5
end

function t.isInTypes(p8, p9, p10) --[[ line: 63 ]]
	-- upvalues: t (ref)
	for i, v in ipairs(p9) do
		if typeof(p8) == v then
			return p8
		end
	end
	local formattedText = string.format("expects %s to be one of expectedTypes! it was: %s", p10, typeof(p8))
	
	if t.isEnabled() then
		assert(false, formattedText)
	end
	return p8
end

function t.isTypeOrNil(p11, p12, p13) --[[ line: 75 ]]
	-- upvalues: t (ref)
	local var9 = if p11 ~= nil then typeof(p11) == p12 else true
	local formattedText = string.format("expects %s to be a %s! it was: %s", p13, p12, typeof(p11))
	
	if t.isEnabled() then
		assert(var9, formattedText)
	end
	return p11
end

function t.isNotNil(p14, p15) --[[ line: 84 ]]
	-- upvalues: t (ref)
	local var11 = p14 ~= nil
	local formattedText = string.format("expects %s to be not nil!", p15)
	
	if t.isEnabled() then
		assert(var11, formattedText)
	end
	return p14
end

function t.isNonEmptyString(p16, p17) --[[ line: 90 ]]
	-- upvalues: t (ref)
	local var13 = typeof(p16) == "string" and p16 ~= ""
	local formattedText = string.format("expects %s to be a non-empty string!", p17)
	
	if t.isEnabled() then
		assert(var13, formattedText)
	end
	return p16
end

function t.isEqual(p18, p19, p20) --[[ line: 96 ]]
	-- upvalues: t (ref)
	local var15 = p18 == p19
	local formattedText = string.format("expects %s to equal %s! it was: %s", p20, tostring(p19), tostring(p18))
	
	if t.isEnabled() then
		assert(var15, formattedText)
	end
	return p18
end

function t.representsInteger(p21, p22) --[[ line: 106 ]]
	-- upvalues: t (ref)
	local var17 = tonumber(p21)
	local var18 = var17 ~= nil
	local formattedText = string.format("expects %s to represent a number!", p22)
	
	if t.isEnabled() then
		assert(var18, formattedText)
	end
	local var20 = var17 % 1 == 0
	local formattedText_1 = string.format("expects %s to represent an integer!", p22)
	
	if t.isEnabled() then
		assert(var20, formattedText_1)
	end
	return p21
end

function t.matchesInterface(p23, p24, p25, p26) --[[ line: 137 ]]
	-- upvalues: t (ref)
	if t.isEnabled() then
		local t_1 = {
			integer = t.representsInteger,
			nonEmptyString = t.isNonEmptyString
		}
		
		if type(p24) == "string" then
			if p26 and p26[p24] then
				t.matchesInterface(p23, p26[p24], p25, p26)
				
				return p23
			end
			local var23 = t_1[p24]
			
			if type(var23) == "function" then
				var23(p23, p25)
				
				return p23
			end
			t.isType(p23, p24, p25)
			
			return p23
		else
			t.isType(p23, "table", p25)
			
			if p24[1] == nil then
				for i, v in pairs(p24) do
					if string.sub(i, 1, 1) ~= "_" then
						local text = p25 .. "." .. i
						local var25 = p23[i]
						
						if p24._required and p24._required[i] or var25 ~= nil then
							t.matchesInterface(var25, v, text, p26)
						end
					end
				end
			else
				for i, v in ipairs(p23) do
					t.matchesInterface(v, p24[1], p25 .. "[" .. i .. "]", p26)
				end
				return p23
			end
		end
	end
	return p23
end

function t.assert(...) --[[ line: 179 ]]
	-- upvalues: t (ref)
	local var26, var27 = ...
	
	if t.isEnabled() then
		assert(var26, var27)
	end
end

return t