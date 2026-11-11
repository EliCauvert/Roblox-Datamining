local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local LuaUtils = Parent.luaUtils
local LuauPolyfillModule = require(Parent1.LuauPolyfill)
local Error1 = LuauPolyfillModule.Error
local Number = LuauPolyfillModule.Number
local InspectFunction = require(Parent.jsutils.inspect).inspect
local InvariantFunction = require(Parent.jsutils.invariant).invariant
local IsObjectLikeFunction = require(Parent.jsutils.isObjectLike).isObjectLike
local IsIteratableObjectFunction = require(Parent.jsutils.isIteratableObject).isIteratableObject
local _ = require(Parent.language.ast)
local Kind = require(Parent.language.kinds).Kind
local GraphQLID = require(Parent.type.scalars).GraphQLID
local DefinitionModule = require(Parent.type.definition)
local IsLeafTypeFunction = DefinitionModule.isLeafType
local IsEnumTypeFunction = DefinitionModule.isEnumType
local IsInputObjectTypeFunction = DefinitionModule.isInputObjectType
local IsListTypeFunction = DefinitionModule.isListType
local IsNonNullTypeFunction = DefinitionModule.isNonNullType
local NullModule = require(LuaUtils.null)
local IsNillishModule = require(LuaUtils.isNillish)
local IsNillishFunction = IsNillishModule.isNillish
local IsNotNillishFunction = IsNillishModule.isNotNillish
local _01909 = nil

local function astFromValue(List, OfType)
	-- upvalues: IsNonNullTypeFunction (copy), astFromValue (copy), NullModule (copy), Kind (copy), IsListTypeFunction (copy), IsIteratableObjectFunction (copy), IsNotNillishFunction (copy), IsInputObjectTypeFunction (copy), IsObjectLikeFunction (copy), IsLeafTypeFunction (copy), IsNillishFunction (copy), Number (copy), _01909 (ref), IsEnumTypeFunction (copy), GraphQLID (copy), Error1 (copy), InspectFunction (copy), InvariantFunction (copy)
	if IsNonNullTypeFunction(OfType) then
		local AstFromValueResult = astFromValue(List, OfType.ofType)
		local Kind1 = AstFromValueResult ~= nil and (AstFromValueResult ~= NullModule and AstFromValueResult.kind)
		
		return if Kind1 == Kind.NULL then NullModule else AstFromValueResult
	end
	if List == NullModule then
		return { kind = Kind.NULL }
	end
	if List == nil then
		return NullModule
	end
	if IsListTypeFunction(OfType) then
		local OfType1 = OfType.ofType
		
		if not IsIteratableObjectFunction(List) then
			return astFromValue(List, OfType1)
		end
		local Values = {}
		
		for _, value in pairs(List) do
			local AstFromValueResult = astFromValue(value, OfType1)
			
			if IsNotNillishFunction(AstFromValueResult) then
				table.insert(Values, AstFromValueResult)
			end
		end
		return { kind = Kind.LIST, values = Values }
	elseif IsInputObjectTypeFunction(OfType) then
		if not IsObjectLikeFunction(List) then
			return NullModule
		end
		local Fields = {}
		
		for _, value1 in ipairs(OfType:getFields():values()) do
			local AstFromValueResult = astFromValue(List[value1.name], value1.type)
			
			if IsNotNillishFunction(AstFromValueResult) then
				table.insert(Fields, {
					kind = Kind.OBJECT_FIELD,
					name = { kind = Kind.NAME, value = value1.name },
					value = AstFromValueResult
				})
			end
		end
		return { kind = Kind.OBJECT, fields = Fields }
	else
		if IsLeafTypeFunction(OfType) then
			local SerializeResult = OfType:serialize(List)
			
			if IsNillishFunction(SerializeResult) then
				return NullModule
			end
			if typeof(SerializeResult) == "boolean" then
				return { kind = Kind.BOOLEAN, value = SerializeResult }
			end
			if typeof(SerializeResult) == "number" and Number.isFinite(SerializeResult) then
				local Text = tostring(SerializeResult)
				
				return if _01909:test(Text) then { kind = Kind.INT, value = Text } else { kind = Kind.FLOAT, value = Text }
			end
			if typeof(SerializeResult) == "string" then
				return if IsEnumTypeFunction(OfType) then { kind = Kind.ENUM, value = SerializeResult } elseif OfType == GraphQLID and _01909:test(SerializeResult) then { kind = Kind.INT, value = SerializeResult } else { kind = Kind.STRING, value = SerializeResult }
			end
			error(Error1.new(("Cannot convert value to AST: %s."):format(InspectFunction(SerializeResult))))
		end
		InvariantFunction(false, "Unexpected input type: " .. InspectFunction(OfType))
	end
end

_01909 = require(Parent1.RegExp)("^-?(?:0|[1-9][0-9]*)$")

return { astFromValue = astFromValue, NULL = NullModule }