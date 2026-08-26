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

function t.ValuesOfCorrectTypeRule(p1)
	-- upvalues: getNullableType (ref), isListType (ref), isValidValueNode (write), getNamedType (ref), isInputObjectType (ref), keyMap (ref), isRequiredInputField (ref), inspect (ref), graphQLError (ref), suggestionList (ref), didYouMean (ref), isNonNullType (ref), print (ref)
	return {
		ListValue = function(_, p2)
			-- upvalues: getNullableType (copy), p1 (ref), isListType (copy), isValidValueNode (copy)
			if isListType(getNullableType(p1:getParentInputType())) then
				return
			end
			isValidValueNode(p1, p2)
			
			return false
		end,
		ObjectValue = function(_, p2)
			-- upvalues: getNamedType (copy), p1 (ref), isInputObjectType (copy), isValidValueNode (copy), keyMap (copy), isRequiredInputField (copy), inspect (copy), graphQLError (copy)
			local var1 = getNamedType(p1:getInputType())
			
			if not isInputObjectType(var1) then
				isValidValueNode(p1, p2)
				
				return false
			end
			local var2 = keyMap(p2.fields, function(p3)
				return p3.name.value
			end)
			
			for i, v in ipairs(var1:getFields():values()) do
				if not var2[v.name] and isRequiredInputField(v) then
					p1:reportError(graphQLError.new(("Field \"%s.%s\" of required type \"%s\" was not provided."):format(var1.name, v.name, inspect(v.type)), p2))
				end
			end
		end,
		ObjectField = function(_, p3)
			-- upvalues: getNamedType (copy), p1 (ref), isInputObjectType (copy), suggestionList (copy), graphQLError (copy), didYouMean (copy)
			local var3 = getNamedType(p1:getParentInputType())
			
			if not p1:getInputType() and isInputObjectType(var3) then
				p1:reportError(graphQLError.new(("Field \"%s\" is not defined by type \"%s\"."):format(p3.name.value, var3.name) .. didYouMean(suggestionList(p3.name.value, var3:getFields():keys())), p3))
			end
		end,
		NullValue = function(_, p3)
			-- upvalues: p1 (ref), isNonNullType (copy), graphQLError (copy), inspect (copy), print (copy)
			local inputType = p1:getInputType()
			
			if isNonNullType(inputType) then
				p1:reportError(graphQLError.new(("Expected value of type \"%s\", found %s."):format(inspect(inputType), print(p3)), p3))
			end
		end,
		EnumValue = function(_, p3)
			-- upvalues: isValidValueNode (copy), p1 (ref)
			return isValidValueNode(p1, p3)
		end,
		IntValue = function(_, p3)
			-- upvalues: isValidValueNode (copy), p1 (ref)
			return isValidValueNode(p1, p3)
		end,
		FloatValue = function(_, p3)
			-- upvalues: isValidValueNode (copy), p1 (ref)
			return isValidValueNode(p1, p3)
		end,
		StringValue = function(_, p3)
			-- upvalues: isValidValueNode (copy), p1 (ref)
			return isValidValueNode(p1, p3)
		end,
		BooleanValue = function(_, p3)
			-- upvalues: isValidValueNode (copy), p1 (ref)
			return isValidValueNode(p1, p3)
		end
	}
end

isValidValueNode = function(p2, p3)
	-- upvalues: getNamedType (ref), isLeafType (ref), inspect (ref), graphQLError (ref), print (ref), instanceOfModule (ref)
	local inputType = p2:getInputType()
	
	if not inputType then return end
	local var1 = getNamedType(inputType)
	
	if isLeafType(var1) then
		xpcall(function()
			-- upvalues: var1 (ref), p3 (ref), inspect (copy), inputType (ref), p2 (ref), graphQLError (copy), print (copy)
			if var1:parseLiteral(p3, nil) == nil then
				p2:reportError(graphQLError.new(("Expected value of type \"%s\", found %s."):format(inspect(inputType), print(p3)), p3))
			end
		end, function(p4)
			-- upvalues: inspect (copy), inputType (ref), instanceOfModule (copy), graphQLError (copy), p2 (ref), print (copy), p3 (ref)
			local var2 = inspect(inputType)
			
			if instanceOfModule(p4, graphQLError) then
				p2:reportError(p4)
				
				return
			end
			p2:reportError(graphQLError.new(("Expected value of type \"%s\", found %s; "):format(var2, print(p3)) .. p13.message, p3, nil, nil, nil, p4))
		end)
		
		return
	end
	p2:reportError(graphQLError.new(("Expected value of type \"%s\", found %s."):format(inspect(inputType), print(p3)), p3))
end

return t