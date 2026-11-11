local Parent = script.Parent.Parent
local Array = require(Parent.Parent.LuauPolyfill).Array
local NullModule = require(Parent.luaUtils.null)
local IsNillishFunction = require(Parent.luaUtils.isNillish).isNillish
local _ = require(Parent.jsutils.ObjMap)
local KeyMapFunction = require(Parent.jsutils.keyMap).keyMap
local InspectFunction = require(Parent.jsutils.inspect).inspect
local PrintPathArrayFunction = require(Parent.jsutils.printPathArray).printPathArray
local GraphQLError = require(Parent.error.GraphQLError).GraphQLError
local Language = Parent.language
local _ = require(Language.ast)
local Kind = require(Language.kinds).Kind
local PrintFunction = require(Language.printer).print
local Type = Parent.type
local _ = require(Type.schema)
local _ = require(Type.definition)
local _ = require(Type.directives)
local DefinitionModule = require(Parent.type.definition)
local IsInputTypeFunction = DefinitionModule.isInputType
local IsNonNullTypeFunction = DefinitionModule.isNonNullType
local TypeFromASTFunction = require(Parent.utilities.typeFromAST).typeFromAST
local ValueFromASTFunction = require(Parent.utilities.valueFromAST).valueFromAST
local CoerceInputValueFunction = require(Parent.utilities.coerceInputValue).coerceInputValue
local CoerceVariableValues = nil
local getArgumentValues = nil
local Callback = nil

local function GetVariableValues(p1, p2, p3, p4)
	-- upvalues: CoerceVariableValues (ref), GraphQLError (copy)
	local List = {}
	local MaxErrors = if p4 == nil then nil else p4.maxErrors
	local Success, Result = pcall(CoerceVariableValues, p1, p2, p3, function(p5)
		-- upvalues: MaxErrors (ref), List (copy), GraphQLError (upval)
		if MaxErrors ~= nil and MaxErrors <= #List then
			error(GraphQLError.new("Too many errors processing variables, error limit reached. Execution aborted."))
		end
		table.insert(List, p5)
	end)
	
	if not Success then
		table.insert(List, Result)
	end
	return if #List == 0 then { coerced = Result } else { errors = List }
end

CoerceVariableValues = function(p1, List, p2, Callback1: (any) -> ())
	-- upvalues: TypeFromASTFunction (copy), IsInputTypeFunction (copy), PrintFunction (copy), GraphQLError (copy), Callback (ref), ValueFromASTFunction (copy), IsNonNullTypeFunction (copy), InspectFunction (copy), NullModule (copy), CoerceInputValueFunction (copy), PrintPathArrayFunction (copy)
	local t = {}
	
	for _, value in ipairs(List) do
		local Value = value.variable.name.value
		local TypeFromASTResult = TypeFromASTFunction(p1, value.type)
		
		if not IsInputTypeFunction(TypeFromASTResult) then
			Callback1(GraphQLError.new(("Variable \"$%s\" expected value of type \"%s\" which cannot be used as an input type."):format(Value, (PrintFunction(value.type))), value.type))
			continue
		end
		if Callback(p2, Value) then
			local NullModule1 = p2[Value]
			
			if NullModule1 == NullModule and IsNonNullTypeFunction(TypeFromASTResult) then
				Callback1(GraphQLError.new(("Variable \"$%s\" of non-null type \"%s\" must not be null."):format(Value, (InspectFunction(TypeFromASTResult))), value))
			else
				t[Value] = CoerceInputValueFunction(NullModule1, TypeFromASTResult, function(p3, p4, p5)
					-- upvalues: Value (copy), InspectFunction (upval), PrintPathArrayFunction (upval), Callback1 (copy), GraphQLError (upval), value (copy)
					local Text = ("Variable \"$%s\" got invalid value "):format(Value) .. InspectFunction(p4)
					
					if #p3 > 0 then
						Text ..= (" at \"%s%s\""):format(Value, PrintPathArrayFunction(p3))
					end
					Callback1(GraphQLError.new(Text .. "; " .. p5.message, value, nil, nil, nil, p5.originalError))
				end)
			end
		elseif value.defaultValue then
			t[Value] = ValueFromASTFunction(value.defaultValue, TypeFromASTResult)
		elseif IsNonNullTypeFunction(TypeFromASTResult) then
			Callback1(GraphQLError.new(("Variable \"$%s\" of required type \"%s\" was not provided."):format(Value, (InspectFunction(TypeFromASTResult))), value))
		end
	end
	return t
end

getArgumentValues = function(p3, FindResult, p4)
	-- upvalues: KeyMapFunction (copy), IsNonNullTypeFunction (copy), GraphQLError (copy), InspectFunction (copy), Kind (copy), Callback (ref), IsNillishFunction (copy), ValueFromASTFunction (copy), PrintFunction (copy)
	local DefaultValues = {}
	local KeyMapResult = KeyMapFunction(if FindResult.arguments then FindResult.arguments else {}, function(p5)
		return p5.name.value
	end)
	
	for _, arg in ipairs(p3.args) do
		local Name = arg.name
		local Type = arg.type
		local KeyMapResultEntry = KeyMapResult[Name]
		
		if KeyMapResultEntry then
			local Value = KeyMapResultEntry.value
			local IsKindMatch = Value.kind == Kind.NULL
			
			if Value.kind == Kind.VARIABLE then
				local Value1 = Value.name.value
				
				if p4 ~= nil and Callback(p4, Value1) then
					IsKindMatch = IsNillishFunction(p4[Value1])
				else
					if arg.defaultValue ~= nil then
						DefaultValues[Name] = arg.defaultValue
						continue
					elseif IsNonNullTypeFunction(Type) then
						error(GraphQLError.new(("Argument \"%s\" of required type \"%s\" "):format(Name, InspectFunction(Type)) .. ("was provided the variable \"$%s\" which was not provided a runtime value."):format(Value1), Value))
						continue
					end
					continue
				end
			end
			if IsKindMatch and IsNonNullTypeFunction(Type) then
				error(GraphQLError.new(("Argument \"%s\" of non-null type \"%s\" "):format(Name, InspectFunction(Type)) .. "must not be null.", Value))
			end
			local ValueFromASTResult = ValueFromASTFunction(Value, Type, p4)
			
			if ValueFromASTResult == nil then
				error(GraphQLError.new(("Argument \"%s\" has invalid value %s."):format(Name, PrintFunction(Value)), Value))
			end
			DefaultValues[Name] = ValueFromASTResult
		elseif arg.defaultValue ~= nil then
			DefaultValues[Name] = arg.defaultValue
		elseif IsNonNullTypeFunction(Type) then
			error(GraphQLError.new(("Argument \"%s\" of required type \"%s\" "):format(Name, InspectFunction(Type)) .. "was not provided.", FindResult))
		end
	end
	return DefaultValues
end

Callback = function(p5, p6): boolean
	return p5[p6] ~= nil
end

return {
	getVariableValues = GetVariableValues,
	getArgumentValues = getArgumentValues,
	getDirectiveValues = function(p5, p6, p7)
		-- upvalues: Array (copy), getArgumentValues (ref)
		local FindResult = if p6.directives then Array.find(p6.directives, function(p8): boolean
			-- upvalues: p5 (copy)
			return p8.name.value == p5.name
		end) else nil
		
		return if FindResult then getArgumentValues(p5, FindResult, p7) else nil
	end
}