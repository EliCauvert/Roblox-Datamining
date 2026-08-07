local parent = script.Parent.Parent.Parent
local language = parent.language
local jsutils = parent.jsutils
local instanceOfModule = require(jsutils.instanceOf)
local keyMap = require(jsutils.keyMap).keyMap
local inspect = require(jsutils.inspect).inspect
local didYouMean = require(jsutils.didYouMean).didYouMean
local suggestionList = require(jsutils.suggestionList).suggestionList
local graphQLError = require(parent.error.GraphQLError).GraphQLError
local print = require(language.printer).print
local definitionModule = require(parent.type.definition)
local isLeafType = definitionModule.isLeafType
local isInputObjectType = definitionModule.isInputObjectType
local isListType = definitionModule.isListType
local isNonNullType = definitionModule.isNonNullType
local isRequiredInputField = definitionModule.isRequiredInputField
local getNullableType = definitionModule.getNullableType
local getNamedType = definitionModule.getNamedType
local t = {}
local isValidValueNode = nil

function t.ValuesOfCorrectTypeRule(p0) --[[ line: 41 ]]
	-- upvalues: getNullableType (ref), isListType (ref), isValidValueNode (write), getNamedType (ref), isInputObjectType (ref), keyMap (ref), isRequiredInputField (ref), inspect (ref), graphQLError (ref), suggestionList (ref), didYouMean (ref), isNonNullType (ref), print (ref)
	return {
		ListValue = function(_, p1) --[[ line: 43 ]]
			-- upvalues: getNullableType (copy), p0 (ref), isListType (copy), isValidValueNode (copy)
			if isListType(getNullableType(p0:getParentInputType())) then
				return
			end
			isValidValueNode(p0, p1)
			
			return false
		end,
		ObjectValue = function(_, p2) --[[ line: 53 ]]
			-- upvalues: getNamedType (copy), p0 (ref), isInputObjectType (copy), isValidValueNode (copy), keyMap (copy), isRequiredInputField (copy), inspect (copy), graphQLError (copy)
			local var4 = getNamedType(p0:getInputType())
			
			if not isInputObjectType(var4) then
				isValidValueNode(p0, p2)
				
				return false
			end
			local var5 = keyMap(p2.fields, function(p3) --[[ line: 60 ]]
				return p3.name.value
			end)
			
			for i, v in ipairs(var4:getFields():values()) do
				if not var5[v.name] and isRequiredInputField(v) then
					p0:reportError(graphQLError.new(("Field \"%s.%s\" of required type \"%s\" was not provided."):format(var4.name, v.name, inspect(v.type)), p2))
				end
			end
		end,
		ObjectField = function(_, p4) --[[ line: 82 ]]
			-- upvalues: getNamedType (copy), p0 (ref), isInputObjectType (copy), suggestionList (copy), graphQLError (copy), didYouMean (copy)
			local var6 = getNamedType(p0:getParentInputType())
			
			if not p0:getInputType() and isInputObjectType(var6) then
				p0:reportError(graphQLError.new(("Field \"%s\" is not defined by type \"%s\"."):format(p4.name.value, var6.name) .. didYouMean(suggestionList(p4.name.value, var6:getFields():keys())), p4))
			end
		end,
		NullValue = function(_, p5) --[[ line: 102 ]]
			-- upvalues: p0 (ref), isNonNullType (copy), graphQLError (copy), inspect (copy), print (copy)
			local inputType = p0:getInputType()
			
			if isNonNullType(inputType) then
				p0:reportError(graphQLError.new(("Expected value of type \"%s\", found %s."):format(inspect(inputType), print(p5)), p5))
			end
		end,
		EnumValue = function(_, p6) --[[ line: 116 ]]
			-- upvalues: isValidValueNode (copy), p0 (ref)
			return isValidValueNode(p0, p6)
		end,
		IntValue = function(_, p7) --[[ line: 119 ]]
			-- upvalues: isValidValueNode (copy), p0 (ref)
			return isValidValueNode(p0, p7)
		end,
		FloatValue = function(_, p8) --[[ line: 122 ]]
			-- upvalues: isValidValueNode (copy), p0 (ref)
			return isValidValueNode(p0, p8)
		end,
		StringValue = function(_, p9) --[[ line: 125 ]]
			-- upvalues: isValidValueNode (copy), p0 (ref)
			return isValidValueNode(p0, p9)
		end,
		BooleanValue = function(_, p10) --[[ line: 128 ]]
			-- upvalues: isValidValueNode (copy), p0 (ref)
			return isValidValueNode(p0, p10)
		end
	}
end

isValidValueNode = function(p11, p12) --[[ line: 138 | named "isValidValueNode" ]]
	-- upvalues: getNamedType (ref), isLeafType (ref), inspect (ref), graphQLError (ref), print (ref), instanceOfModule (ref)
	local inputType = p11:getInputType()
	
	if not inputType then return end
	local var9 = getNamedType(inputType)
	
	if isLeafType(var9) then
		xpcall(function() --[[ line: 160 ]]
			-- upvalues: var9 (ref), p12 (ref), inspect (copy), inputType (ref), p11 (ref), graphQLError (copy), print (copy)
			if var9:parseLiteral(p12, nil) == nil then
				p11:reportError(graphQLError.new(("Expected value of type \"%s\", found %s."):format(inspect(inputType), print(p12)), p12))
			end
		end, function(p13) --[[ line: 173 ]]
			-- upvalues: inspect (copy), inputType (ref), instanceOfModule (copy), graphQLError (copy), p11 (ref), print (copy), p12 (ref)
			local var10 = inspect(inputType)
			
			if instanceOfModule(p13, graphQLError) then
				p11:reportError(p13)
				
				return
			end
			p11:reportError(graphQLError.new(("Expected value of type \"%s\", found %s; "):format(var10, print(p12)) .. p13.message, p12, nil, nil, nil, p13))
		end)
		
		return
	end
	p11:reportError(graphQLError.new(("Expected value of type \"%s\", found %s."):format(inspect(inputType), print(p12)), p12))
end

return t