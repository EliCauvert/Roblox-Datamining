-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:44 2026 Pacific Standard Time.

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
		hasColors = function(...) --[[ line: 48 ]]
			return true
		end
	}
}

function ErrorCaptureStackTrace(p0, ...) --[[ line: 55 ]]
	-- upvalues: errorModule (ref)
	errorModule.captureStackTrace(p0, ...)
end

local function _(p1) --[[ line: 60 | named "removeColors" ]]
	return p1
end

local var6 = ""
local var7 = ""
local var8 = ""
local var9 = ""
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

local _ = function(p2) --[[ line: 88 | named "copyError" ]]
	-- upvalues: object (ref)
	local t = {}
	
	for i, v in object.keys(p2) do
		t[v] = p2[v]
	end
	t.message = p2.message
	
	return t
end

local _ = function(p3) --[[ line: 99 | named "inspectValue" ]]
	-- upvalues: inspect (ref)
	return inspect(p3, {
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

local function createErrDiff(p4, p5, p6) --[[ line: 114 ]]
	-- upvalues: inspect (ref), stringModule (ref), booleanModule (ref), t_1 (ref), t (ref), var6 (write), var9 (write), array (ref), var7 (write), var8 (write)
	local var14 = ""
	local var15 = ""
	local var16 = ""
	local var17 = false
	local var18 = inspect(p4, {
		compact = false,
		customInspect = false,
		depth = 1000,
		maxArrayLength = 1e999,
		showHidden = false,
		showProxy = false,
		sorted = true,
		getters = true
	})
	local var19 = stringModule.split(var18, "\n")
	local var20 = stringModule.split(inspect(p5, {
		compact = false,
		customInspect = false,
		depth = 1000,
		maxArrayLength = 1e999,
		showHidden = false,
		showProxy = false,
		sorted = true,
		getters = true
	}), "\n")
	local var21 = 0
	local var22 = ""
	
	if p6 == "strictEqual" and (typeof(p4) == "table" and p4 ~= nil and (typeof(p5) == "table" and p5 ~= nil) or typeof(p4) == "function" and typeof(p5) == "function") then
		p6 = "strictEqualObject"
	end
	if #var19 == 1 and #var20 == 1 and var19[1] ~= var20[1] then
		local var23 = var19[1]
		local var24 = if booleanModule.toJSBoolean(false) then var20[1] else var20[1]
		local var25 = string.len(var23) + string.len(var24)
		
		if var25 <= 12 then
			if (typeof(p4) ~= "table" or p4 == nil) and (typeof(p5) ~= "table" or p5 == nil) and (p4 ~= 0 or p5 ~= 0) then
				return ("%s\n\n"):format(t_1[p6]) .. ("%s !== %s\n"):format(var19[1], var20[1])
			end
		elseif p6 ~= "strictEqualObject" and var25 < (if t.stderr.isTTY then t.stderr.columns else 80) then
			while string.sub(var23, var21 + 1, var21 + 1) == string.sub(var24, var21 + 1, var21 + 1) do
				var21 += 1
			end
			if var21 > 2 then
				var22 = ("\n  %s^"):format(string.rep(" ", var21))
				var21 = 0
			end
		end
	end
	local var26 = var19[#var19]
	local var27 = var20[#var20]
	while var26 == var27 do
		local var28 = var21
		var21 += 1
		
		if var28 < 3 then
			var16 = ("\n  %s%s"):format(var26, var16)
		else
			var14 = var26
		end
		table.remove(var19)
		table.remove(var20)
		
		if #var19 == 0 or #var20 == 0 then break end
		var26 = var19[#var19]
		var27 = var20[#var20]
	end
	local maxValue = math.max(#var19, #var20)
	
	if maxValue == 0 then
		local var30 = stringModule.split(var18, "\n")
		
		if #var30 > 50 then
			var30[47] = ("%s...%s"):format(var6, var9)
			while #var30 > 47 do
				table.remove(var30)
			end
		end
		return ("%s\n\n"):format("Values have same structure but are not reference-equal:") .. ("%s\n"):format(array.join(var30, "\n"))
	elseif var21 >= 5 then
		var16 = ("\n%s...%s%s"):format(var6, var9, var16)
		var17 = true
	end
	if var14 ~= "" then
		var16 = ("\n  %s%s"):format(var14, var16)
		var14 = ""
	end
	local var31 = 0
	local var32 = 0
	local text = t_1[p6] .. ("\n%s+ actual%s %s- expected%s"):format(var7, var9, var8, var9)
	local var34 = (" %s...%s Lines skipped"):format(var6, var9)
	local var35 = var19
	local var36 = ("%s+%s"):format(var7, var9)
	local var20Count = #var20
	
	if #var19 < maxValue then
		var35 = var20
		var36 = ("%s-%s"):format(var8, var9)
		var20Count = #var19
	end
	for i = 1, maxValue do
		local _ = i
		
		if var20Count >= i then
			local var38 = var20[i]
			local var39 = var19[i]
			local var40 = var39 ~= var38 and (if booleanModule.toJSBoolean(stringModule.endsWith(var39, ",")) then stringModule.slice(var39, 0, -1) ~= var38 else not booleanModule.toJSBoolean(stringModule.endsWith(var39, ",")))
			
			if var40 and stringModule.endsWith(var38, ",") and stringModule.slice(var38, 0, -1) == var39 then
				var40 = false
				var39 ..= ","
			end
			if var40 then
				if var32 > 2 then
					if var32 > 3 then
						if var32 > 4 then
							if var32 == 5 then
								var15 ..= ("\n  %s"):format(var19[i - 3])
								var31 += 1
							else
								var15 ..= ("\n%s...%s"):format(var6, var9)
								var17 = true
							end
						end
						var15 ..= ("\n  %s"):format(var19[i - 2])
						var31 += 1
					end
					var15 ..= ("\n  %s"):format(var19[i - 1])
					var31 += 1
				end
				var32 = 0
				var15 ..= ("\n%s+%s %s"):format(var7, var9, var39)
				var14 ..= ("\n%s-%s %s"):format(var8, var9, var38)
				var31 += 2
			else
				var15 ..= var14
				var14 = ""
				var32 += 1
				
				if var32 <= 2 then
					var15 ..= ("\n  %s"):format(var39)
					var31 += 1
				end
			end
			if var31 <= 50 or i >= maxValue - 2 then
				continue
			end
			return ("%s%s\n%s\n%s...%s%s\n"):format(text, var34, var15, var6, var9, var14) .. ("%s...%s"):format(var6, var9)
		end
		if var32 > 2 then
			if var32 > 3 then
				if var32 > 4 then
					if var32 == 5 then
						var15 ..= ("\n  %s"):format(var35[i - 3])
						var31 += 1
					else
						var15 ..= ("\n%s...%s"):format(var6, var9)
						var17 = true
					end
				end
				var15 ..= ("\n  %s"):format(var35[i - 2])
				var31 += 1
			end
			var15 ..= ("\n  %s"):format(var35[i - 1])
			var31 += 1
		end
		var32 = 0
		
		if var35 == var19 then
			var15 ..= ("\n%s %s"):format(var36, var35[i])
		else
			var14 ..= ("\n%s %s"):format(var36, var35[i])
		end
		var31 += 1
	end
	return ("%s%s\n%s%s%s%s"):format(text, if var17 then var34 else "", var15, var14, var16, var22)
end

local assertionError = setmetatable({}, { __index = errorModule })
assertionError.__index = assertionError

function assertionError:__tostring() --[[ line: 394 ]]
	return self:toString()
end

function assertionError.new(p7) --[[ line: 407 ]]
	-- upvalues: errorModule (ref), assertionError (ref), t (ref), var6 (write), var7 (write), var9 (write), var8 (write), array (ref), object (ref), instanceOfModule (ref), createErrDiff (ref), t_1 (ref), stringModule (ref), inspect (ref), booleanModule (ref)
	local assertionError_1
	local _ = nil
	local message = p7.message
	local operator = p7.operator
	local stackStartFn = p7.stackStartFn
	local actual = p7.actual
	local expected = p7.expected
	
	if message == nil then
		if t.stderr.isTTY then
			if t.stderr:hasColors() then
				var6 = "\27[34m"
				var7 = "\27[32m"
				var9 = "\27[39m"
				var8 = "\27[31m"
			else
				var6 = ""
				var7 = ""
				var9 = ""
				var8 = ""
			end
		end
		if typeof(actual) == "table" and actual ~= nil and (typeof(expected) == "table" and expected ~= nil) and (array.indexOf(object.keys(actual), "stack") ~= -1 and instanceOfModule(actual, errorModule) and (array.indexOf(object.keys(expected), "stack") ~= -1 and instanceOfModule(expected, errorModule))) then
			local t_2 = {}
			
			for i, v in object.keys(actual) do
				t_2[v] = actual[v]
			end
			t_2.message = actual.message
			actual = t_2
			local var43 = expected
			local t_3 = {}
			
			for i, v_1 in object.keys(var43) do
				t_3[v_1] = var43[v_1]
			end
			t_3.message = var43.message
			expected = t_3
		end
		if operator == "deepStrictEqual" or operator == "strictEqual" then
			assertionError_1 = setmetatable(errorModule.new(createErrDiff(actual, expected, operator)), assertionError)
		elseif operator == "notDeepStrictEqual" or operator == "notStrictEqual" then
			local var49 = t_1[operator]
			local var50 = stringModule.split(inspect(actual, {
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
				var49 = "Expected \"actual\" not to be reference-equal to \"expected\":"
			end
			if #var50 > 50 then
				var50[47] = ("%s...%s"):format(var6, var9)
				while #var50 > 47 do
					table.remove(var50)
				end
			end
			assertionError_1 = if #var50 == 1 then setmetatable(errorModule.new(("%s%s%s"):format(var49, if string.len(var50[1]) > 5 then "\n\n" else " ", var50[1])), assertionError) else setmetatable(errorModule.new(("%s\n\n%s\n"):format(var49, array.join(var50, "\n"))), assertionError)
		else
			local var45 = inspect(actual, {
				compact = false,
				customInspect = false,
				depth = 1000,
				maxArrayLength = 1e999,
				showHidden = false,
				showProxy = false,
				sorted = true,
				getters = true
			})
			local var46 = inspect(expected, {
				compact = false,
				customInspect = false,
				depth = 1000,
				maxArrayLength = 1e999,
				showHidden = false,
				showProxy = false,
				sorted = true,
				getters = true
			})
			local var47 = t_1[tostring(operator)]
			
			if operator == "notDeepEqual" and var45 == var46 then
				var45 = ("%s\n\n%s"):format(var47, var45)
				
				if string.len(var45) > 1024 then
					var45 = ("%s..."):format(stringModule.slice(var45, 0, 1021))
				end
				assertionError_1 = setmetatable(errorModule.new(var45), assertionError)
			elseif string.len(var45) > 512 then
				var45 = ("%s..."):format(stringModule.slice(var45, 0, 509))
			end
			if string.len(var46) > 512 then
				var46 = ("%s..."):format(stringModule.slice(var46, 0, 509))
			end
			if operator == "deepEqual" then
				var45 = ("%s\n\n%s\n\nshould loosely deep-equal\n\n"):format(var47, var45)
			else
				local var48 = t_1[("%sUnequal"):format(tostring(operator))]
				
				if booleanModule.toJSBoolean(var48) then
					var45 = ("%s\n\n%s\n\nshould not loosely deep-equal\n\n"):format(var48, var45)
				else
					var46 = (" %s %s"):format(tostring(operator), var46)
				end
			end
			assertionError_1 = setmetatable(errorModule.new(("%s%s"):format(var45, var46)), assertionError)
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

function assertionError:toString() --[[ line: 576 ]]
	return ("%s [%s]: %s"):format(self.name, self.code, self.message)
end

assertionError.name = "AssertionError"

return { AssertionError = assertionError }