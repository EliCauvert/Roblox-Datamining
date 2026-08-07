local parent = script.Parent.Parent
local array = require(parent.Parent.LuauPolyfill).Array
local nullModule = require(parent.luaUtils.null)
local isNillish = require(parent.luaUtils.isNillish).isNillish
local _ = require(parent.jsutils.ObjMap)
local keyMap = require(parent.jsutils.keyMap).keyMap
local inspect = require(parent.jsutils.inspect).inspect
local printPathArray = require(parent.jsutils.printPathArray).printPathArray
local graphQLError = require(parent.error.GraphQLError).GraphQLError
local language = parent.language
local _ = require(language.ast)
local kind = require(language.kinds).Kind
local print = require(language.printer).print
local type = parent.type
local _ = require(type.schema)
local _ = require(type.definition)
local _ = require(type.directives)
local definitionModule = require(parent.type.definition)
local isInputType = definitionModule.isInputType
local isNonNullType = definitionModule.isNonNullType
local typeFromAST = require(parent.utilities.typeFromAST).typeFromAST
local valueFromAST = require(parent.utilities.valueFromAST).valueFromAST
local coerceInputValue = require(parent.utilities.coerceInputValue).coerceInputValue
local _ = nil
local coerceVariableValues = nil
local _ = nil
local _ = nil
local hasOwnProperty = nil

local var4 = function(p0, p1, p2, p3) --[[ line: 79 ]]
	-- upvalues: coerceVariableValues (write), graphQLError (ref)
	local t = {}
	local var7 = if p3 ~= nil then p3.maxErrors else nil
	local ok, status = pcall(coerceVariableValues, p0, p1, p2, function(p4) --[[ line: 91 ]]
		-- upvalues: var7 (write), t (ref), graphQLError (copy)
		if var7 ~= nil and var7 <= #t then
			error(graphQLError.new("Too many errors processing variables, error limit reached. Execution aborted."))
		end
		table.insert(t, p4)
	end)
	
	if not ok then
		table.insert(t, status)
	end
	return if #t == 0 then { coerced = status } else { errors = t }
end

coerceVariableValues = function(p5, p6, p7, p8) --[[ line: 113 | named "coerceVariableValues" ]]
	-- upvalues: typeFromAST (ref), isInputType (ref), print (ref), graphQLError (ref), hasOwnProperty (write), valueFromAST (ref), isNonNullType (ref), inspect (ref), nullModule (ref), coerceInputValue (ref), printPathArray (ref)
	local value
	local t = {}
	
	for i, v in ipairs(p6) do
		value = v.variable.name.value
		local var9 = typeFromAST(p5, v.type)
		
		if not isInputType(var9) then
			p8(graphQLError.new(("Variable \"$%s\" expected value of type \"%s\" which cannot be used as an input type."):format(value, print(v.type)), v.type))
			continue
		end
		if hasOwnProperty(p7, value) then
			local var10 = p7[value]
			
			if var10 == nullModule and isNonNullType(var9) then
				p8(graphQLError.new(("Variable \"$%s\" of non-null type \"%s\" must not be null."):format(value, inspect(var9)), v))
			else
				t[value] = coerceInputValue(var10, var9, function(p9, p10, p11) --[[ line: 174 ]]
					-- upvalues: value (ref), inspect (copy), printPathArray (copy), p8 (ref), graphQLError (copy), v (ref)
					local text = ("Variable \"$%s\" got invalid value "):format(value) .. inspect(p10)
					
					if #p9 > 0 then
						text ..= (" at \"%s%s\""):format(value, printPathArray(p9))
					end
					p8(graphQLError.new(text .. "; " .. p11.message, v, nil, nil, nil, p11.originalError))
				end)
			end
		elseif v.defaultValue then
			t[value] = valueFromAST(v.defaultValue, var9)
		elseif isNonNullType(var9) then
			p8(graphQLError.new(("Variable \"$%s\" of required type \"%s\" was not provided."):format(value, inspect(var9)), v))
		end
	end
	return t
end

local function getArgumentValues(p12, p13, p14) --[[ line: 207 ]]
	-- upvalues: keyMap (ref), isNonNullType (ref), graphQLError (ref), inspect (ref), kind (ref), hasOwnProperty (write), isNillish (ref), valueFromAST (ref), print (ref)
	local t = {}
	local var13 = keyMap(if p13.arguments then p13.arguments else {}, function(p15) --[[ line: 217 ]]
		return p15.name.value
	end)
	
	for i, v in ipairs(p12.args) do
		local name = v.name
		local type = v.type
		local var14 = var13[name]
		
		if not var14 then
			if v.defaultValue ~= nil then
				t[name] = v.defaultValue
			elseif isNonNullType(type) then
				error(graphQLError.new(("Argument \"%s\" of required type \"%s\" "):format(name, inspect(type)) .. "was not provided.", p13))
			end
		end
		local value_1
		local value = var14.value
		local var15 = value.kind == kind.NULL
		
		if value.kind == kind.VARIABLE then
			value_1 = value.name.value
			
			if p14 ~= nil and hasOwnProperty(p14, value_1) then
				var15 = isNillish(p14[value_1])
			elseif v.defaultValue ~= nil then
				t[name] = v.defaultValue
			elseif isNonNullType(type) then
				error(graphQLError.new(("Argument \"%s\" of required type \"%s\" "):format(name, inspect(type)) .. ("was provided the variable \"$%s\" which was not provided a runtime value."):format(value_1), value))
			end
		end
		if var15 and isNonNullType(type) then
			error(graphQLError.new(("Argument \"%s\" of non-null type \"%s\" "):format(name, inspect(type)) .. "must not be null.", value))
		end
		value_1 = valueFromAST(value, type, p14)
		
		if value_1 == nil then
			error(graphQLError.new(("Argument \"%s\" has invalid value %s."):format(name, print(value)), value))
		end
		t[name] = value_1
	end
	return t
end

hasOwnProperty = function(p16, p17) --[[ line: 325 | named "hasOwnProperty" ]]
	return p16[p17] ~= nil
end

return {
	getVariableValues = var4,
	getArgumentValues = getArgumentValues,
	getDirectiveValues = function(p18, p19, p20) --[[ line: 305 ]]
		-- upvalues: array (ref), getArgumentValues (write)
		local var16 = if p19.directives then array.find(p19.directives, function(p21) --[[ line: 312 ]]
			-- upvalues: p18 (ref)
			return p21.name.value == p18.name
		end) else nil
		
		return if var16 then getArgumentValues(p18, var16, p20) else nil
	end
}