-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:37 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local parent_1 = parent.Parent
local jsutils = parent.jsutils
local luaUtils = parent.luaUtils
local luauPolyfillModule = require(parent_1.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object
local inspect = require(jsutils.inspect).inspect
local invariant = require(jsutils.invariant).invariant
local didYouMean = require(jsutils.didYouMean).didYouMean
local isObjectLike = require(jsutils.isObjectLike).isObjectLike
local suggestionList = require(jsutils.suggestionList).suggestionList
local printPathArray = require(jsutils.printPathArray).printPathArray
local addPath = require(jsutils.Path).addPath
local instanceOfModule = require(jsutils.instanceOf)
local nullModule = require(luaUtils.null)
local isNillishModule = require(luaUtils.isNillish)
local isNillish = isNillishModule.isNillish
local isNotNillish = isNillishModule.isNotNillish
local pathToArray = require(jsutils.Path).pathToArray
local isIteratableObject = require(jsutils.isIteratableObject).isIteratableObject
local graphQLError = require(parent.error.GraphQLError).GraphQLError
local definitionModule = require(parent.type.definition)
local isLeafType = definitionModule.isLeafType
local isInputObjectType = definitionModule.isInputObjectType
local isListType = definitionModule.isListType
local isNonNullType = definitionModule.isNonNullType
local coerceInputValueImpl = nil
local defaultOnError = nil

local function coerceInputValue(p0, p1, p2) --[[ line: 55 ]]
	-- upvalues: defaultOnError (write), coerceInputValueImpl (write)
	return coerceInputValueImpl(p0, p1, p2 or defaultOnError)
end

defaultOnError = function(p3, p4, p5) --[[ line: 60 | named "defaultOnError" ]]
	-- upvalues: inspect (ref), printPathArray (ref)
	local text = "Invalid value " .. inspect(p4)
	
	if #p3 > 0 then
		text ..= " at \"value" .. printPathArray(p3) .. "\""
	end
	p5.message = text .. ": " .. p5.message
	error(p5)
end

coerceInputValueImpl = function(p6, p7, p8, p9) --[[ line: 69 | named "coerceInputValueImpl" ]]
	-- upvalues: isNonNullType (ref), isNotNillish (ref), coerceInputValueImpl (write), pathToArray (ref), graphQLError (ref), inspect (ref), isNillish (ref), nullModule (ref), isListType (ref), isIteratableObject (ref), array (ref), addPath (ref), isInputObjectType (ref), isObjectLike (ref), object (ref), suggestionList (ref), didYouMean (ref), isLeafType (ref), instanceOfModule (ref), invariant (ref)
	if isNonNullType(p7) then
		if isNotNillish(p6) then
			return coerceInputValueImpl(p6, p7.ofType, p8, p9)
		end
		p8(pathToArray(p9), p6, graphQLError.new("Expected non-nullable type \"" .. inspect(p7) .. "\" not to be null."))
		
		return
	elseif isNillish(p6) then
		return nullModule
	elseif isListType(p7) then
		local ofType = p7.ofType
		
		return if isIteratableObject(p6) then array.from(p6, function(p10, p11) --[[ line: 97 ]]
			-- upvalues: addPath (copy), p9 (ref), coerceInputValueImpl (copy), ofType (ref), p8 (ref)
			return coerceInputValueImpl(p10, ofType, p8, addPath(p9, p11, nil))
		end) else { coerceInputValueImpl(p6, ofType, p8, p9) }
	elseif isInputObjectType(p7) then
		if not isObjectLike(p6) then
			p8(pathToArray(p9), p6, graphQLError.new("Expected type \"" .. p7.name .. "\" to be an object."))
			
			return
		end
		local t = {}
		local fields = p7:getFields()
		
		for i, v in ipairs(fields:values()) do
			local name = p6[v.name]
			
			if name ~= nil then
				t[v.name] = coerceInputValueImpl(name, v.type, p8, addPath(p9, v.name, p7.name))
			elseif v.defaultValue ~= nil then
				t[v.name] = v.defaultValue
			elseif isNonNullType(v.type) then
				p8(pathToArray(p9), p6, graphQLError.new("Field \"" .. v.name .. "\" of required type \"" .. inspect(v.type) .. "\" was not provided."))
			end
		end
		for i, v_1 in ipairs(object.keys(p6)) do
			if not fields:get(v_1) then
				p8(pathToArray(p9), p6, graphQLError.new(("Field \"%s\" is not defined by type \"%s\".%s"):format(v_1, p7.name, didYouMean(suggestionList(v_1, p7:getFields():keys())))))
			end
		end
		return t
	elseif not isLeafType(p7) then
		invariant(false, "Unexpected input type: " .. inspect(p7))
		
		return
	end
	local _ = nil
	local ok, status = pcall(p7.parseValue, p7, p6)
	
	if ok then
		local var11 = status
		
		if var11 == nil then
			p8(pathToArray(p9), p6, graphQLError.new(("Expected type \"%s\"."):format(p7.name)))
		end
		return var11
	elseif instanceOfModule(status, graphQLError) then
		p8(pathToArray(p9), p6, status)
		
		return
	end
	p8(pathToArray(p9), p6, graphQLError.new("Expected type \"" .. p7.name .. "\". " .. status.message, nil, nil, nil, nil, status))
end

return { coerceInputValue = coerceInputValue }