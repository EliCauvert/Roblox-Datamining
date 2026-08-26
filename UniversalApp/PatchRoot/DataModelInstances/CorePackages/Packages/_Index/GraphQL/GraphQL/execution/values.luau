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

local var1 = function(p1, p2, p3, p4)
	-- upvalues: coerceVariableValues (write), graphQLError (ref)
	local t = {}
	local var2 = if p4 ~= nil then p4.maxErrors else nil
	local ok, status = pcall(coerceVariableValues, p1, p2, p3, function(p5)
		-- upvalues: var2 (write), t (ref), graphQLError (copy)
		if var2 ~= nil and var2 <= #t then
			error(graphQLError.new("Too many errors processing variables, error limit reached. Execution aborted."))
		end
		table.insert(t, p5)
	end)
	
	if not ok then
		table.insert(t, status)
	end
	return if #t == 0 then { coerced = status } else { errors = t }
end

coerceVariableValues = function(p1, p2, p3, p4)
	-- upvalues: typeFromAST (ref), isInputType (ref), print (ref), graphQLError (ref), hasOwnProperty (write), valueFromAST (ref), isNonNullType (ref), inspect (ref), nullModule (ref), coerceInputValue (ref), printPathArray (ref)
	local value
	local t = {}
	
	for i, v in ipairs(p2) do
		value = v.variable.name.value
		local var2 = typeFromAST(p1, v.type)
		
		if not isInputType(var2) then
			p4(graphQLError.new(("Variable \"$%s\" expected value of type \"%s\" which cannot be used as an input type."):format(value, print(v.type)), v.type))
			continue
		end
		if hasOwnProperty(p3, value) then
			local var3 = p3[value]
			
			if var3 == nullModule and isNonNullType(var2) then
				p4(graphQLError.new(("Variable \"$%s\" of non-null type \"%s\" must not be null."):format(value, inspect(var2)), v))
			else
				t[value] = coerceInputValue(var3, var2, function(p5, p6, p7)
					-- upvalues: value (ref), inspect (copy), printPathArray (copy), p4 (ref), graphQLError (copy), v (ref)
					local text = ("Variable \"$%s\" got invalid value "):format(value) .. inspect(p6)
					
					if #p5 > 0 then
						text ..= (" at \"%s%s\""):format(value, printPathArray(p5))
					end
					p4(graphQLError.new(text .. "; " .. p11.message, v, nil, nil, nil, p7.originalError))
				end)
			end
		elseif v.defaultValue then
			t[value] = valueFromAST(v.defaultValue, var2)
		elseif isNonNullType(var2) then
			p4(graphQLError.new(("Variable \"$%s\" of required type \"%s\" was not provided."):format(value, inspect(var2)), v))
		end
	end
	return t
end

local function getArgumentValues(p5, p6, p7)
	-- upvalues: keyMap (ref), isNonNullType (ref), graphQLError (ref), inspect (ref), kind (ref), hasOwnProperty (write), isNillish (ref), valueFromAST (ref), print (ref)
	local t = {}
	local var4 = keyMap(if p6.arguments then p6.arguments else {}, function(p8)
		return p8.name.value
	end)
	
	for i, v in ipairs(p5.args) do
		local name = v.name
		local type = v.type
		local var5 = var4[name]
		
		if not var5 then
			if v.defaultValue ~= nil then
				t[name] = v.defaultValue
			elseif isNonNullType(type) then
				error(graphQLError.new(("Argument \"%s\" of required type \"%s\" "):format(name, inspect(type)) .. "was not provided.", p6))
			end
		end
		local value_1
		local value = var5.value
		local var6 = value.kind == kind.NULL
		
		if value.kind == kind.VARIABLE then
			value_1 = value.name.value
			
			if p7 ~= nil and hasOwnProperty(p7, value_1) then
				var6 = isNillish(p7[value_1])
			elseif v.defaultValue ~= nil then
				t[name] = v.defaultValue
			elseif isNonNullType(type) then
				error(graphQLError.new(("Argument \"%s\" of required type \"%s\" "):format(name, inspect(type)) .. ("was provided the variable \"$%s\" which was not provided a runtime value."):format(value_1), value))
			end
		end
		if var6 and isNonNullType(type) then
			error(graphQLError.new(("Argument \"%s\" of non-null type \"%s\" "):format(name, inspect(type)) .. "must not be null.", value))
		end
		value_1 = valueFromAST(value, type, p7)
		
		if value_1 == nil then
			error(graphQLError.new(("Argument \"%s\" has invalid value %s."):format(name, print(value)), value))
		end
		t[name] = value_1
	end
	return t
end

hasOwnProperty = function(p8, p9)
	return p8[p9] ~= nil
end

return {
	getVariableValues = var1,
	getArgumentValues = getArgumentValues,
	getDirectiveValues = function(p8, p9, p10)
		-- upvalues: array (ref), getArgumentValues (write)
		local var7 = if p9.directives then array.find(p9.directives, function(p11)
			-- upvalues: p8 (ref)
			return p11.name.value == p8.name
		end) else nil
		
		return if var7 then getArgumentValues(p8, var7, p10) else nil
	end
}