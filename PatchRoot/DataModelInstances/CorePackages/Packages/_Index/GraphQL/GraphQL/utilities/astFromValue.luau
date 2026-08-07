-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:37 2026 Pacific Standard Time.

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
local var5 = nil

local function astFromValue(p0, p1) --[[ line: 70 ]]
	-- upvalues: isNonNullType (ref), astFromValue (ref), nullModule (ref), kind (ref), isListType (ref), isIteratableObject (ref), isNotNillish (ref), isInputObjectType (ref), isObjectLike (ref), isLeafType (ref), isNillish (ref), number (ref), var5 (write), isEnumType (ref), graphQLID (ref), error (ref), inspect (ref), invariant (ref)
	if isNonNullType(p1) then
		local var7 = astFromValue(p0, p1.ofType)
		
		return if (var7 ~= nil and (var7 ~= nullModule and var7.kind)) == kind.NULL then nullModule else var7
	elseif p0 == nullModule then
		return { kind = kind.NULL }
	elseif p0 == nil then
		return nullModule
	elseif isListType(p1) then
		local ofType = p1.ofType
		
		if isIteratableObject(p0) then
			local t = {}
			
			for i, v in pairs(p0) do
				local var9 = astFromValue(v, ofType)
				
				if isNotNillish(var9) then
					table.insert(t, var9)
				end
			end
			return { kind = kind.LIST, values = t }
		else
			return astFromValue(p0, ofType)
		end
	elseif isInputObjectType(p1) then
		if not isObjectLike(p0) then
			return nullModule
		end
		local t = {}
		
		for i, v in ipairs(p1:getFields():values()) do
			local var11 = astFromValue(p0[v.name], v.type)
			
			if isNotNillish(var11) then
				table.insert(t, {
					kind = kind.OBJECT_FIELD,
					name = { kind = kind.NAME, value = v.name },
					value = var11
				})
			end
		end
		return { kind = kind.OBJECT, fields = t }
	elseif isLeafType(p1) then
		local var12 = p1:serialize(p0)
		
		if isNillish(var12) then
			return nullModule
		elseif typeof(var12) == "boolean" then
			return { kind = kind.BOOLEAN, value = var12 }
		elseif typeof(var12) == "number" and number.isFinite(var12) then
			local var13 = tostring(var12)
			
			return if var5:test(var13) then { kind = kind.INT, value = var13 } else { kind = kind.FLOAT, value = var13 }
		elseif typeof(var12) == "string" then
			return if isEnumType(p1) then { kind = kind.ENUM, value = var12 } elseif p1 == graphQLID and var5:test(var12) then { kind = kind.INT, value = var12 } else { kind = kind.STRING, value = var12 }
		end
		error(error.new(("Cannot convert value to AST: %s."):format(inspect(var12))))
	end
	invariant(false, "Unexpected input type: " .. inspect(p1))
end

var5 = regExpModule("^-?(?:0|[1-9][0-9]*)$")

return { astFromValue = astFromValue, NULL = nullModule }