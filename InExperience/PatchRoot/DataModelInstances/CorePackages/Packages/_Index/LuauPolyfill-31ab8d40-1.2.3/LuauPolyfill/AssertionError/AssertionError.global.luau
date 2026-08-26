local parent = script.Parent.Parent
local parent_1 = parent.Parent
local collectionsModule = require(parent_1.Collections)
local array = collectionsModule.Array
local object = collectionsModule.Object
local booleanModule = require(parent_1.Boolean)
local stringModule = require(parent_1.String)
local _ = require(parent_1.ES7Types)
local inspect = collectionsModule.inspect
local errorModule = require(parent.Error)
local instanceOfModule = require(parent_1.InstanceOf)
local t = {
	stderr = {
		isTTY = false,
		columns = 0,
		hasColors = function(...)
			return true
		end
	}
}

function ErrorCaptureStackTrace(p1, ...)
	-- upvalues: errorModule (ref)
	errorModule.captureStackTrace(p1, ...)
end

local function _(p1)
	return p1
end

local var1 = ""
local var2 = ""
local var3 = ""
local var4 = ""
local t_1 = {
	deepStrictEqual = "Expected values to be strictly deep-equal:",
	strictEqual = "Expected values to be strictly equal:",
	strictEqualObject = "Expected \"actual\" to be reference-equal to \"expected\":",
	deepEqual = "Expected values to be loosely deep-equal:",
	notDeepStrictEqual = "Expected \"actual\" not to be strictly deep-equal to:",
	notStrictEqual = "Expected \"actual\" to be strictly unequal to:",
	notStrictEqualObject = "Expected \"actual\" not to be reference-equal to \"expected\":",
	notDeepEqual = "Expected \"actual\" not to be loosely deep-equal to:",
	notIdentical = "Values have same structure but are not reference-equal:",
	notDeepEqualUnequal = "Expected values not to be loosely deep-equal:"
}

local _ = function(p1)
	-- upvalues: object (ref)
	local t = {}
	
	for i, v in object.keys(p1) do
		t[v] = p1[v]
	end
	t.message = p1.message
	
	return t
end

local _ = function(p2)
	-- upvalues: inspect (ref)
	return inspect(p2, {
		compact = false,
		customInspect = false,
		depth = 1000,
		maxArrayLength = 1e999,
		showHidden = false,
		showProxy = false,
		sorted = true,
		getters = true
	})
end

local function createErrDiff(p2, p3, p4)
	-- upvalues: inspect (ref), stringModule (ref), booleanModule (ref), t_1 (ref), t (ref), var1 (write), var4 (write), array (ref), var2 (write), var3 (write)
	local var5 = ""
	local var6 = ""
	local var7 = ""
	local var8 = false
	local var9 = inspect(p2, {
		compact = false,
		customInspect = false,
		depth = 1000,
		maxArrayLength = 1e999,
		showHidden = false,
		showProxy = false,
		sorted = true,
		getters = true
	})
	local var10 = stringModule.split(var9, "\n")
	local var11 = stringModule.split(inspect(p3, {
		compact = false,
		customInspect = false,
		depth = 1000,
		maxArrayLength = 1e999,
		showHidden = false,
		showProxy = false,
		sorted = true,
		getters = true
	}), "\n")
	local var12 = 0
	local var13 = ""
	
	if p4 == "strictEqual" and (typeof(p2) == "table" and p2 ~= nil and (typeof(p3) == "table" and p3 ~= nil) or typeof(p2) == "function" and typeof(p3) == "function") then
		p4 = "strictEqualObject"
	end
	if #var10 == 1 and #var11 == 1 and var10[1] ~= var11[1] then
		local var14 = var10[1]
		local var15 = if booleanModule.toJSBoolean(false) then var11[1] else var11[1]
		local var16 = string.len(var14) + string.len(var15)
		
		if var16 <= 12 then
			if (typeof(p2) ~= "table" or p2 == nil) and (typeof(p3) ~= "table" or p3 == nil) and (p2 ~= 0 or p3 ~= 0) then
				return ("%s\n\n"):format(t_1[p4]) .. ("%s !== %s\n"):format(var10[1], var11[1])
			end
		elseif p4 ~= "strictEqualObject" and var16 < (if t.stderr.isTTY then t.stderr.columns else 80) then
			while string.sub(var14, var12 + 1, var12 + 1) == string.sub(var15, var12 + 1, var12 + 1) do
				var12 += 1
			end
			if var12 > 2 then
				var13 = ("\n  %s^"):format(string.rep(" ", var12))
				var12 = 0
			end
		end
	end
	local var17 = var10[#var10]
	local var18 = var11[#var11]
	while var17 == var18 do
		local var19 = var12
		var12 += 1
		
		if var19 < 3 then
			var7 = ("\n  %s%s"):format(var17, var7)
		else
			var5 = var17
		end
		table.remove(var10)
		table.remove(var11)
		
		if #var10 == 0 or #var11 == 0 then break end
		var17 = var10[#var10]
		var18 = var11[#var11]
	end
	local maxValue = math.max(#var10, #var11)
	
	if maxValue == 0 then
		local var20 = stringModule.split(var9, "\n")
		
		if #var20 > 50 then
			var20[47] = ("%s...%s"):format(var1, var4)
			while #var20 > 47 do
				table.remove(var20)
			end
		end
		return ("%s\n\n"):format("Values have same structure but are not reference-equal:") .. ("%s\n"):format(array.join(var20, "\n"))
	elseif var12 >= 5 then
		var7 = ("\n%s...%s%s"):format(var1, var4, var7)
		var8 = true
	end
	if var5 ~= "" then
		var7 = ("\n  %s%s"):format(var5, var7)
		var5 = ""
	end
	local var21 = 0
	local var22 = 0
	local text = t_1[p4] .. ("\n%s+ actual%s %s- expected%s"):format(var2, var4, var3, var4)
	local var23 = (" %s...%s Lines skipped"):format(var1, var4)
	local var24 = var10
	local var25 = ("%s+%s"):format(var2, var4)
	local var20Count = #var11
	
	if #var10 < maxValue then
		var24 = var11
		var25 = ("%s-%s"):format(var3, var4)
		var20Count = #var10
	end
	for i = 1, maxValue do
		local _ = i
		
		if var20Count >= i then
			local var26 = var11[i]
			local var27 = var10[i]
			local var28 = var27 ~= var26 and (if booleanModule.toJSBoolean(stringModule.endsWith(var27, ",")) then stringModule.slice(var27, 0, -1) ~= var26 else not booleanModule.toJSBoolean(stringModule.endsWith(var27, ",")))
			
			if var28 and stringModule.endsWith(var26, ",") and stringModule.slice(var26, 0, -1) == var27 then
				var28 = false
				var27 ..= ","
			end
			if var28 then
				if var22 > 2 then
					if var22 > 3 then
						if var22 > 4 then
							if var22 == 5 then
								var6 ..= ("\n  %s"):format(var10[i - 3])
								var21 += 1
							else
								var6 ..= ("\n%s...%s"):format(var1, var4)
								var8 = true
							end
						end
						var6 ..= ("\n  %s"):format(var10[i - 2])
						var21 += 1
					end
					var6 ..= ("\n  %s"):format(var10[i - 1])
					var21 += 1
				end
				var22 = 0
				var6 ..= ("\n%s+%s %s"):format(var2, var4, var27)
				var5 ..= ("\n%s-%s %s"):format(var3, var4, var26)
				var21 += 2
			else
				var6 ..= var5
				var5 = ""
				var22 += 1
				
				if var22 <= 2 then
					var6 ..= ("\n  %s"):format(var27)
					var21 += 1
				end
			end
			if var21 <= 50 or i >= maxValue - 2 then
				continue
			end
			return ("%s%s\n%s\n%s...%s%s\n"):format(text, var23, var6, var1, var4, var5) .. ("%s...%s"):format(var1, var4)
		end
		if var22 > 2 then
			if var22 > 3 then
				if var22 > 4 then
					if var22 == 5 then
						var6 ..= ("\n  %s"):format(var24[i - 3])
						var21 += 1
					else
						var6 ..= ("\n%s...%s"):format(var1, var4)
						var8 = true
					end
				end
				var6 ..= ("\n  %s"):format(var24[i - 2])
				var21 += 1
			end
			var6 ..= ("\n  %s"):format(var24[i - 1])
			var21 += 1
		end
		var22 = 0
		
		if var24 == var10 then
			var6 ..= ("\n%s %s"):format(var25, var24[i])
		else
			var5 ..= ("\n%s %s"):format(var25, var24[i])
		end
		var21 += 1
	end
	return ("%s%s\n%s%s%s%s"):format(text, if var8 then var23 else "", var6, var5, var7, var13)
end

local assertionError = setmetatable({}, { __index = errorModule })
assertionError.__index = assertionError

function assertionError:__tostring()
	return self:toString()
end

function assertionError.new(p5)
	-- upvalues: errorModule (ref), assertionError (ref), t (ref), var1 (write), var2 (write), var4 (write), var3 (write), array (ref), object (ref), instanceOfModule (ref), createErrDiff (ref), t_1 (ref), stringModule (ref), inspect (ref), booleanModule (ref)
	local assertionError_1
	local _ = nil
	local message = p5.message
	local operator = p5.operator
	local stackStartFn = p5.stackStartFn
	local actual = p5.actual
	local expected = p5.expected
	
	if message == nil then
		if t.stderr.isTTY then
			if t.stderr:hasColors() then
				var1 = "\27[34m"
				var2 = "\27[32m"
				var4 = "\27[39m"
				var3 = "\27[31m"
			else
				var1 = ""
				var2 = ""
				var4 = ""
				var3 = ""
			end
		end
		if typeof(actual) == "table" and actual ~= nil and (typeof(expected) == "table" and expected ~= nil) and (array.indexOf(object.keys(actual), "stack") ~= -1 and instanceOfModule(actual, errorModule) and (array.indexOf(object.keys(expected), "stack") ~= -1 and instanceOfModule(expected, errorModule))) then
			local t_2 = {}
			
			for i, v in object.keys(actual) do
				t_2[v] = actual[v]
			end
			t_2.message = actual.message
			actual = t_2
			local var29 = expected
			local t_3 = {}
			
			for i, v_1 in object.keys(var29) do
				t_3[v_1] = var29[v_1]
			end
			t_3.message = var29.message
			expected = t_3
		end
		if operator == "deepStrictEqual" or operator == "strictEqual" then
			assertionError_1 = setmetatable(errorModule.new(createErrDiff(actual, expected, operator)), assertionError)
		elseif operator == "notDeepStrictEqual" or operator == "notStrictEqual" then
			local var30 = t_1[operator]
			local var31 = stringModule.split(inspect(actual, {
				compact = false,
				customInspect = false,
				depth = 1000,
				maxArrayLength = 1e999,
				showHidden = false,
				showProxy = false,
				sorted = true,
				getters = true
			}), "\n")
			
			if operator == "notStrictEqual" and (typeof(actual) == "table" and actual ~= nil or typeof(actual) == "function") then
				var30 = "Expected \"actual\" not to be reference-equal to \"expected\":"
			end
			if #var31 > 50 then
				var31[47] = ("%s...%s"):format(var1, var4)
				while #var31 > 47 do
					table.remove(var31)
				end
			end
			assertionError_1 = if #var31 == 1 then setmetatable(errorModule.new(("%s%s%s"):format(var30, if string.len(var31[1]) > 5 then "\n\n" else " ", var31[1])), assertionError) else setmetatable(errorModule.new(("%s\n\n%s\n"):format(var30, array.join(var31, "\n"))), assertionError)
		else
			local var32 = inspect(actual, {
				compact = false,
				customInspect = false,
				depth = 1000,
				maxArrayLength = 1e999,
				showHidden = false,
				showProxy = false,
				sorted = true,
				getters = true
			})
			local var33 = inspect(expected, {
				compact = false,
				customInspect = false,
				depth = 1000,
				maxArrayLength = 1e999,
				showHidden = false,
				showProxy = false,
				sorted = true,
				getters = true
			})
			local var34 = t_1[tostring(operator)]
			
			if operator == "notDeepEqual" and var32 == var33 then
				var32 = ("%s\n\n%s"):format(var34, var32)
				
				if string.len(var32) > 1024 then
					var32 = ("%s..."):format(stringModule.slice(var32, 0, 1021))
				end
				assertionError_1 = setmetatable(errorModule.new(var32), assertionError)
			elseif string.len(var32) > 512 then
				var32 = ("%s..."):format(stringModule.slice(var32, 0, 509))
			end
			if string.len(var33) > 512 then
				var33 = ("%s..."):format(stringModule.slice(var33, 0, 509))
			end
			if operator == "deepEqual" then
				var32 = ("%s\n\n%s\n\nshould loosely deep-equal\n\n"):format(var34, var32)
			else
				local var35 = t_1[("%sUnequal"):format(tostring(operator))]
				
				if booleanModule.toJSBoolean(var35) then
					var32 = ("%s\n\n%s\n\nshould not loosely deep-equal\n\n"):format(var35, var32)
				else
					var33 = (" %s %s"):format(tostring(operator), var33)
				end
			end
			assertionError_1 = setmetatable(errorModule.new(("%s%s"):format(var32, var33)), assertionError)
		end
	else
		assertionError_1 = setmetatable(errorModule.new(tostring(message)), assertionError)
	end
	assertionError_1.generatedMessage = not booleanModule.toJSBoolean(message)
	assertionError_1.name = "AssertionError [ERR_ASSERTION]"
	assertionError_1.code = "ERR_ASSERTION"
	assertionError_1.actual = actual
	assertionError_1.expected = expected
	assertionError_1.operator = operator
	ErrorCaptureStackTrace(assertionError_1, stackStartFn or assertionError.new)
	assertionError_1.name = "AssertionError"
	
	return assertionError_1
end

function assertionError:toString()
	return ("%s [%s]: %s"):format(self.name, self.code, self.message)
end

assertionError.name = "AssertionError"

return { AssertionError = assertionError }