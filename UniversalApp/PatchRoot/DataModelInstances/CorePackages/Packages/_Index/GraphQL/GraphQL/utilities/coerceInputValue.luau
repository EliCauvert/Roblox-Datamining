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

local function coerceInputValue(p1, p2, p3)
	-- upvalues: defaultOnError (write), coerceInputValueImpl (write)
	return coerceInputValueImpl(p1, p2, p3 or defaultOnError)
end

defaultOnError = function(p1, p2, p3)
	-- upvalues: inspect (ref), printPathArray (ref)
	local text = "Invalid value " .. inspect(p2)
	
	if #p1 > 0 then
		text ..= " at \"value" .. printPathArray(p1) .. "\""
	end
	p3.message = text .. ": " .. p5.message
	error(p3)
end

coerceInputValueImpl = function(p1, p2, p3, p4)
	-- upvalues: isNonNullType (ref), isNotNillish (ref), coerceInputValueImpl (write), pathToArray (ref), graphQLError (ref), inspect (ref), isNillish (ref), nullModule (ref), isListType (ref), isIteratableObject (ref), array (ref), addPath (ref), isInputObjectType (ref), isObjectLike (ref), object (ref), suggestionList (ref), didYouMean (ref), isLeafType (ref), instanceOfModule (ref), invariant (ref)
	if isNonNullType(p2) then
		if isNotNillish(p1) then
			return coerceInputValueImpl(p1, p2.ofType, p3, p4)
		end
		p3(pathToArray(p4), p1, graphQLError.new("Expected non-nullable type \"" .. inspect(p2) .. "\" not to be null."))
		
		return
	elseif isNillish(p1) then
		return nullModule
	elseif isListType(p2) then
		local ofType = p2.ofType
		
		return if isIteratableObject(p1) then array.from(p1, function(p5, p6)
			-- upvalues: addPath (copy), p4 (ref), coerceInputValueImpl (copy), ofType (ref), p3 (ref)
			return coerceInputValueImpl(p5, ofType, p3, addPath(p4, p6, nil))
		end) else { coerceInputValueImpl(p1, ofType, p3, p4) }
	elseif isInputObjectType(p2) then
		if not isObjectLike(p1) then
			p3(pathToArray(p4), p1, graphQLError.new("Expected type \"" .. p7.name .. "\" to be an object."))
			
			return
		end
		local t = {}
		local fields = p2:getFields()
		
		for i, v in ipairs(fields:values()) do
			local name = p1[v.name]
			
			if name ~= nil then
				t[v.name] = coerceInputValueImpl(name, v.type, p3, addPath(p4, v.name, p2.name))
			elseif v.defaultValue ~= nil then
				t[v.name] = v.defaultValue
			elseif isNonNullType(v.type) then
				p3(pathToArray(p4), p1, graphQLError.new("Field \"" .. v.name .. "\" of required type \"" .. inspect(v.type) .. "\" was not provided."))
			end
		end
		for i, v_1 in ipairs(object.keys(p1)) do
			if not fields:get(v_1) then
				p3(pathToArray(p4), p1, graphQLError.new(("Field \"%s\" is not defined by type \"%s\".%s"):format(v_1, p2.name, didYouMean(suggestionList(v_1, p2:getFields():keys())))))
			end
		end
		return t
	elseif not isLeafType(p2) then
		invariant(false, "Unexpected input type: " .. inspect(p2))
		
		return
	end
	local _ = nil
	local ok, status = pcall(p2.parseValue, p2, p1)
	
	if ok then
		local var1 = status
		
		if var1 == nil then
			p3(pathToArray(p4), p1, graphQLError.new(("Expected type \"%s\"."):format(p2.name)))
		end
		return var1
	elseif instanceOfModule(status, graphQLError) then
		p3(pathToArray(p4), p1, status)
		
		return
	end
	p3(pathToArray(p4), p1, graphQLError.new("Expected type \"" .. p7.name .. "\". " .. status.message, nil, nil, nil, nil, status))
end

return { coerceInputValue = coerceInputValue }