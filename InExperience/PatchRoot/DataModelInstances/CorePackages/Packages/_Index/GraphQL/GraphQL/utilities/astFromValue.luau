local parent = script.Parent.Parent
local parent_1 = parent.Parent
local luaUtils = parent.luaUtils
local luauPolyfillModule = require(parent_1.LuauPolyfill)
local error = luauPolyfillModule.Error
local number = luauPolyfillModule.Number
local regExpModule = require(parent_1.RegExp)
local inspect = require(parent.jsutils.inspect).inspect
local invariant = require(parent.jsutils.invariant).invariant
local isObjectLike = require(parent.jsutils.isObjectLike).isObjectLike
local isIteratableObject = require(parent.jsutils.isIteratableObject).isIteratableObject
local _ = require(parent.language.ast)
local kind = require(parent.language.kinds).Kind
local graphQLID = require(parent.type.scalars).GraphQLID
local definitionModule = require(parent.type.definition)
local isLeafType = definitionModule.isLeafType
local isEnumType = definitionModule.isEnumType
local isInputObjectType = definitionModule.isInputObjectType
local isListType = definitionModule.isListType
local isNonNullType = definitionModule.isNonNullType
local nullModule = require(luaUtils.null)
local isNillishModule = require(luaUtils.isNillish)
local isNillish = isNillishModule.isNillish
local isNotNillish = isNillishModule.isNotNillish
local var1 = nil

local function astFromValue(p1, p2)
	-- upvalues: isNonNullType (ref), astFromValue (ref), nullModule (ref), kind (ref), isListType (ref), isIteratableObject (ref), isNotNillish (ref), isInputObjectType (ref), isObjectLike (ref), isLeafType (ref), isNillish (ref), number (ref), var1 (write), isEnumType (ref), graphQLID (ref), error (ref), inspect (ref), invariant (ref)
	if isNonNullType(p2) then
		local var2 = astFromValue(p1, p2.ofType)
		
		return if (var2 ~= nil and (var2 ~= nullModule and var2.kind)) == kind.NULL then nullModule else var2
	elseif p1 == nullModule then
		return { kind = kind.NULL }
	elseif p1 == nil then
		return nullModule
	elseif isListType(p2) then
		local ofType = p2.ofType
		
		if isIteratableObject(p1) then
			local t = {}
			
			for i, v in pairs(p1) do
				local var3 = astFromValue(v, ofType)
				
				if isNotNillish(var3) then
					table.insert(t, var3)
				end
			end
			return { kind = kind.LIST, values = t }
		else
			return astFromValue(p1, ofType)
		end
	elseif isInputObjectType(p2) then
		if not isObjectLike(p1) then
			return nullModule
		end
		local t = {}
		
		for i, v in ipairs(p2:getFields():values()) do
			local var4 = astFromValue(p1[v.name], v.type)
			
			if isNotNillish(var4) then
				table.insert(t, {
					kind = kind.OBJECT_FIELD,
					name = { kind = kind.NAME, value = v.name },
					value = var4
				})
			end
		end
		return { kind = kind.OBJECT, fields = t }
	elseif isLeafType(p2) then
		local var5 = p2:serialize(p1)
		
		if isNillish(var5) then
			return nullModule
		elseif typeof(var5) == "boolean" then
			return { kind = kind.BOOLEAN, value = var5 }
		elseif typeof(var5) == "number" and number.isFinite(var5) then
			local var6 = tostring(var5)
			
			return if var1:test(var6) then { kind = kind.INT, value = var6 } else { kind = kind.FLOAT, value = var6 }
		elseif typeof(var5) == "string" then
			return if isEnumType(p2) then { kind = kind.ENUM, value = var5 } elseif p2 == graphQLID and var1:test(var5) then { kind = kind.INT, value = var5 } else { kind = kind.STRING, value = var5 }
		end
		error(error.new(("Cannot convert value to AST: %s."):format(inspect(var5))))
	end
	invariant(false, "Unexpected input type: " .. inspect(p2))
end

var1 = regExpModule("^-?(?:0|[1-9][0-9]*)$")

return { astFromValue = astFromValue, NULL = nullModule }