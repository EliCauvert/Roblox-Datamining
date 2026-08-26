local debugLuaArgCheck = game:DefineFastFlag("DebugLuaArgCheck", false)
local var1 = game:GetService("RunService"):IsStudio()
local t = {
	isEnabled = function()
		-- upvalues: debugLuaArgCheck (ref), var1 (ref)
		return debugLuaArgCheck or (_G.__TESTEZ_RUNNING_TEST__ or var1)
	end
}

local function _(p1, p2)
	-- upvalues: t (ref)
	if t.isEnabled() then
		assert(p1, p2)
	end
end

local function stubArgCheckFunction()
	return true
end

function t.wrap(p1)
	-- upvalues: t (ref), stubArgCheckFunction (ref)
	return if t.isEnabled() then p1 else stubArgCheckFunction
end

function t.isNonNegativeNumber(p1, p2)
	-- upvalues: t (ref)
	local var2 = typeof(p1) == "number" and p1 >= 0
	local formattedText = string.format("expects %s to be a non-negative number!", p2)
	
	if t.isEnabled() then
		assert(var2, formattedText)
	end
	return p1
end

function t.isType(p1, p2, p3)
	-- upvalues: t (ref)
	local var2 = typeof(p1) == p2
	local formattedText = string.format("expects %s to be a %s! it was: %s", p3, p2, typeof(p1))
	
	if t.isEnabled() then
		assert(var2, formattedText)
	end
	return p1
end

function t.isInTypes(p1, p2, p3)
	-- upvalues: t (ref)
	for i, v in ipairs(p2) do
		if typeof(p1) == v then
			return p1
		end
	end
	local formattedText = string.format("expects %s to be one of expectedTypes! it was: %s", p3, typeof(p1))
	
	if t.isEnabled() then
		assert(false, formattedText)
	end
	return p1
end

function t.isTypeOrNil(p4, p5, p6)
	-- upvalues: t (ref)
	local var2 = if p4 ~= nil then typeof(p4) == p5 else true
	local formattedText = string.format("expects %s to be a %s! it was: %s", p6, p5, typeof(p4))
	
	if t.isEnabled() then
		assert(var2, formattedText)
	end
	return p4
end

function t.isNotNil(p4, p5)
	-- upvalues: t (ref)
	local var2 = p4 ~= nil
	local formattedText = string.format("expects %s to be not nil!", p5)
	
	if t.isEnabled() then
		assert(var2, formattedText)
	end
	return p4
end

function t.isNonEmptyString(p4, p5)
	-- upvalues: t (ref)
	local var2 = typeof(p4) == "string" and p4 ~= ""
	local formattedText = string.format("expects %s to be a non-empty string!", p5)
	
	if t.isEnabled() then
		assert(var2, formattedText)
	end
	return p4
end

function t.isEqual(p4, p5, p6)
	-- upvalues: t (ref)
	local var2 = p4 == p5
	local formattedText = string.format("expects %s to equal %s! it was: %s", p6, tostring(p5), tostring(p4))
	
	if t.isEnabled() then
		assert(var2, formattedText)
	end
	return p4
end

function t.representsInteger(p4, p5)
	-- upvalues: t (ref)
	local var2 = tonumber(p4)
	local var3 = var2 ~= nil
	local formattedText = string.format("expects %s to represent a number!", p5)
	
	if t.isEnabled() then
		assert(var3, formattedText)
	end
	local var4 = var2 % 1 == 0
	local formattedText_1 = string.format("expects %s to represent an integer!", p5)
	
	if t.isEnabled() then
		assert(var4, formattedText_1)
	end
	return p4
end

function t.matchesInterface(p4, p5, p6, p7)
	-- upvalues: t (ref)
	if t.isEnabled() then
		local t_1 = {
			integer = t.representsInteger,
			nonEmptyString = t.isNonEmptyString
		}
		
		if type(p5) == "string" then
			if p7 and p7[p5] then
				t.matchesInterface(p4, p7[p5], p6, p7)
				
				return p4
			end
			local var2 = t_1[p5]
			
			if type(var2) == "function" then
				var2(p4, p6)
				
				return p4
			end
			t.isType(p4, p5, p6)
			
			return p4
		else
			t.isType(p4, "table", p6)
			
			if p5[1] == nil then
				for i, v in pairs(p5) do
					if string.sub(i, 1, 1) ~= "_" then
						local text = p6 .. "." .. i
						local var3 = p4[i]
						
						if p5._required and p5._required[i] or var3 ~= nil then
							t.matchesInterface(var3, v, text, p7)
						end
					end
				end
			else
				for i, v in ipairs(p4) do
					t.matchesInterface(v, p5[1], p6 .. "[" .. i .. "]", p7)
				end
				return p4
			end
		end
	end
	return p4
end

function t.assert(...)
	-- upvalues: t (ref)
	local var4, var5 = ...
	
	if t.isEnabled() then
		assert(var4, var5)
	end
end

return t