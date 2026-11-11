local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local Kind = require(Parent.GraphQL).Kind
local Error1 = LuauPolyfillModule.Error
local Number = LuauPolyfillModule.Number
local Object = LuauPolyfillModule.Object
local _01909 = nil

local function _(Value)
	-- upvalues: Number (copy)
	local Success, Result = pcall(function(): boolean
		-- upvalues: Value (copy), Number (upval)
		local Number: number? = tonumber(Value)
		
		return not Number.isNaN(Number) and Number ~= 1e999 and Number ~= -1e999
	end)
	
	return if Success then Result else false
end

local function astFromValueUntyped(Value)
	-- upvalues: Object (copy), Kind (copy), Boolean (copy), Array (copy), astFromValueUntyped (copy), Number (copy), _01909 (ref), Error1 (copy)
	if Value == Object.None then
		return { kind = Kind.NULL }
	end
	if Value == nil then
		return nil
	end
	if Boolean.toJSBoolean(Array.isArray(Value)) then
		local Values = {}
		
		for _, value in Value do
			local AstFromValueUntypedResult = astFromValueUntyped(value)
			
			if AstFromValueUntypedResult ~= nil then
				table.insert(Values, AstFromValueUntypedResult)
			end
		end
		return { kind = Kind.LIST, values = Values }
	elseif typeof(Value) == "table" then
		local Fields = {}
		
		for Value1 in Value do
			local AstFromValueUntypedResult = astFromValueUntyped(Value[tostring(Value1)])
			
			if Boolean.toJSBoolean(AstFromValueUntypedResult) then
				table.insert(Fields, {
					kind = Kind.OBJECT_FIELD,
					name = { kind = Kind.NAME, value = Value1 },
					value = AstFromValueUntypedResult
				})
			end
		end
		return { kind = Kind.OBJECT, fields = Fields }
	else
		if typeof(Value) == "boolean" then
			return { kind = Kind.BOOLEAN, value = Value }
		end
		local ToJSBooleanFunction = Boolean.toJSBoolean
		local v1 = false
		
		if typeof(Value) == "number" then
			local Success, Result = pcall(function(): boolean
				-- upvalues: Value (copy), Number (upval)
				local Number: number? = tonumber(Value)
				
				return not Number.isNaN(Number) and Number ~= 1e999 and Number ~= -1e999
			end)
			v1 = if Success then Result else false
		end
		if ToJSBooleanFunction(v1) then
			local Text = tostring(Value)
			
			return if Boolean.toJSBoolean(_01909:test(Text)) then { kind = Kind.INT, value = Text } else { kind = Kind.FLOAT, value = Text }
		elseif typeof(Value) == "string" then
			return { kind = Kind.STRING, value = Value }
		else
			error(Error1.new(("Cannot convert value to AST: %s."):format((tostring(Value)))))
		end
	end
end

_01909 = require(Parent.LuauRegExp)("^-?(?:0|[1-9][0-9]*)$")

return { astFromValueUntyped = astFromValueUntyped }