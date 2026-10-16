local Parent = script.Parent.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local Error1 = LuauPolyfillModule.Error
local Object = LuauPolyfillModule.Object
local PrintFunction = require(Parent.GraphQL).print
local _ = require(script.Parent["merge-typedefs_types"])
local IsSome = require(Parent.Utils).isSome
local Callback = nil

local function directiveAlreadyExists(FilterResult, p1) --[[ Line: 43 ]]
	-- upvalues: Boolean (copy), Array (copy)
	return Boolean.toJSBoolean(Array.find(FilterResult, function(p2): boolean --[[ Line: 49 ]]
		-- upvalues: p1 (copy)
		return p2.name.value == p1.name.value
	end))
end

local function _(p1, p2) --[[ Line: 54 | Named "nameAlreadyExists" ]]
	-- upvalues: Array (copy)
	return Array.some(p2, function(p3): boolean --[[ Line: 55 ]]
		-- upvalues: p1 (copy)
		return p3.value == p1.value
	end)
end

local function mergeArguments(Arguments, Arguments1) --[[ Line: 60 ]]
	-- upvalues: Array (copy), Callback (ref), Boolean (copy)
	local ConcatResult = Array.concat({}, Arguments1)
	
	for _, argument in Arguments do
		local Index: number = Array.findIndex(ConcatResult, function(p1): boolean --[[ Line: 73 ]]
			-- upvalues: argument (copy)
			return p1.name.value == argument.name.value
		end)
		
		if Index <= -1 then
			table.insert(ConcatResult, argument)
			continue
		end
		local ConcatResultEntry = ConcatResult[Index]
		
		if ConcatResultEntry.value.kind == "ListValue" then
			ConcatResultEntry.value.values = Callback(ConcatResultEntry.value.values, argument.value.values, function(p1, p2): boolean --[[ Line: 87 ]]
				-- upvalues: Boolean (upval), Array (upval)
				local Value = p1.value
				
				return not Boolean.toJSBoolean(Value) or not Array.some(p2, function(p3): boolean --[[ Line: 94 ]]
					-- upvalues: Value (copy)
					return p3.value == Value
				end)
			end)
		else
			ConcatResultEntry.value = argument.value
		end
	end
	return ConcatResult
end

local _ = function(p1) --[[ Line: 108 | Named "deduplicateDirectives" ]]
	-- upvalues: Array (copy), mergeArguments (copy), IsSome (copy)
	return (Array.filter(Array.map(p1, function(p2, Index, p3) --[[ Line: 112 ]]
		-- upvalues: Array (upval), mergeArguments (upval)
		local Index1 = Array.findIndex(p3, function(p4): boolean --[[ Line: 114 ]]
			-- upvalues: p2 (copy)
			return p4.name.value == p2.name.value
		end)
		
		if Index1 == Index then
			return p2
		else
			p2.arguments = mergeArguments(p2.arguments, p3[Index1].arguments)
			
			return nil
		end
	end), IsSome))
end

local function validateInputs(p1, p2) --[[ Line: 176 ]]
	-- upvalues: PrintFunction (copy), Object (copy), Boolean (copy), Error1 (copy)
	local PrintResult: string = PrintFunction(Object.assign({}, p1, { description = Object.None }))
	local PrintResult1: string = PrintFunction(Object.assign({}, p2, { description = Object.None }))
	
	if not Boolean.toJSBoolean(PrintResult:gsub("directive @w*d*", ""):gsub(" on .*$", "") == PrintResult1:gsub("directive @w*d*", ""):gsub(" on .*$", "")) then
		error(Error1.new(("Unable to merge GraphQL directive \"%s\". \nExisting directive:  \n\t%s \nReceived directive: \n\t%s"):format(tostring(p1.name.value), tostring(PrintResult1), (tostring(PrintResult)))))
	end
end

Callback = function(Values, Values1, Callback) --[[ Line: 229 | Named "deduplicateLists" ]]
	-- upvalues: Array (copy)
	return Array.concat(Values, Array.filter(Values1, function(p1) --[[ Line: 247 ]]
		-- upvalues: Callback (copy), Values (copy)
		return Callback(p1, Values)
	end))
end

return {
	mergeDirectives = function(p1, p2, p3) --[[ Line: 133 ]]
		-- upvalues: Boolean (copy), Array (copy), mergeArguments (copy), IsSome (copy), directiveAlreadyExists (copy)
		local T = if p1 == nil then {} else p1
		local T1 = if p2 == nil then {} else p2
		local ReverseDirectives = if p3 then p3.reverseDirectives else p3
		local FilterResult = Array.filter(Array.map(Array.concat({}, if Boolean.toJSBoolean(ReverseDirectives) then T else T1), function(p4, Index, p5) --[[ Line: 112 ]]
			-- upvalues: Array (upval), mergeArguments (upval)
			local Index1 = Array.findIndex(p5, function(p6): boolean --[[ Line: 114 ]]
				-- upvalues: p4 (copy)
				return p6.name.value == p4.name.value
			end)
			
			if Index1 == Index then
				return p4
			else
				p4.arguments = mergeArguments(p4.arguments, p5[Index1].arguments)
				
				return nil
			end
		end), IsSome)
		
		for _, value in if Boolean.toJSBoolean(ReverseDirectives) then T1 else T do
			if Boolean.toJSBoolean(directiveAlreadyExists(FilterResult, value)) then
				local Index = Array.findIndex(FilterResult, function(p4): boolean --[[ Line: 155 ]]
					-- upvalues: value (copy)
					return p4.name.value == value.name.value
				end)
				local FilterResultEntry = FilterResult[Index]
				FilterResult[Index].arguments = mergeArguments(Boolean.toJSBoolean(value.arguments) and value.arguments or {}, Boolean.toJSBoolean(FilterResultEntry.arguments) and FilterResultEntry.arguments or {})
			else
				table.insert(FilterResult, value)
			end
		end
		return FilterResult
	end,
	mergeDirective = function(p4, p5) --[[ Line: 201 ]]
		-- upvalues: validateInputs (copy), Object (copy), Array (copy)
		if p5 then
			validateInputs(p4, p5)
			
			return Object.assign({}, p4, {
				locations = Array.concat({}, p5.locations, Array.filter(p4.locations, function(p6): boolean --[[ Line: 219 ]]
					-- upvalues: p5 (copy), Array (upval)
					return not Array.some(p5.locations, function(p7): boolean --[[ Line: 55 ]]
						-- upvalues: p6 (copy)
						return p7.value == p6.value
					end)
				end))
			})
		else
			return p4
		end
	end
}