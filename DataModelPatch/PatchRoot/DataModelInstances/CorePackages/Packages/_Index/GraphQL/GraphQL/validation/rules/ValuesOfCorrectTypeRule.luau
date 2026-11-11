local Parent = script.Parent.Parent.Parent
local Jsutils = Parent.jsutils
local InstanceOfModule = require(Jsutils.instanceOf)
local KeyMapFunction = require(Jsutils.keyMap).keyMap
local InspectFunction = require(Jsutils.inspect).inspect
local DidYouMeanFunction = require(Jsutils.didYouMean).didYouMean
local SuggestionListFunction = require(Jsutils.suggestionList).suggestionList
local GraphQLError = require(Parent.error.GraphQLError).GraphQLError
local PrintFunction = require(Parent.language.printer).print
local DefinitionModule = require(Parent.type.definition)
local IsLeafTypeFunction = DefinitionModule.isLeafType
local IsInputObjectTypeFunction = DefinitionModule.isInputObjectType
local IsListTypeFunction = DefinitionModule.isListType
local IsNonNullTypeFunction = DefinitionModule.isNonNullType
local IsRequiredInputFieldFunction = DefinitionModule.isRequiredInputField
local GetNullableTypeFunction = DefinitionModule.getNullableType
local GetNamedTypeFunction = DefinitionModule.getNamedType
local Callback = nil
local ValuesOfCorrectTypeRuleModule = {
	ValuesOfCorrectTypeRule = function(p1)
		-- upvalues: GetNullableTypeFunction (copy), IsListTypeFunction (copy), Callback (ref), GetNamedTypeFunction (copy), IsInputObjectTypeFunction (copy), KeyMapFunction (copy), IsRequiredInputFieldFunction (copy), InspectFunction (copy), GraphQLError (copy), SuggestionListFunction (copy), DidYouMeanFunction (copy), IsNonNullTypeFunction (copy), PrintFunction (copy)
		return {
			ListValue = function(_, p2): boolean?
				-- upvalues: GetNullableTypeFunction (upval), p1 (copy), IsListTypeFunction (upval), Callback (upval)
				if IsListTypeFunction((GetNullableTypeFunction(p1:getParentInputType()))) then return end
				Callback(p1, p2)
				
				return false
			end,
			ObjectValue = function(_, p2): boolean?
				-- upvalues: GetNamedTypeFunction (upval), p1 (copy), IsInputObjectTypeFunction (upval), Callback (upval), KeyMapFunction (upval), IsRequiredInputFieldFunction (upval), InspectFunction (upval), GraphQLError (upval)
				local NamedType = GetNamedTypeFunction(p1:getInputType())
				
				if not IsInputObjectTypeFunction(NamedType) then
					Callback(p1, p2)
					
					return false
				end
				local KeyMapResult = KeyMapFunction(p2.fields, function(p3)
					return p3.name.value
				end)
				
				for _, value in ipairs(NamedType:getFields():values()) do
					if not KeyMapResult[value.name] and IsRequiredInputFieldFunction(value) then
						p1:reportError(GraphQLError.new(("Field \"%s.%s\" of required type \"%s\" was not provided."):format(NamedType.name, value.name, (InspectFunction(value.type))), p2))
					end
				end
			end,
			ObjectField = function(_, p3)
				-- upvalues: GetNamedTypeFunction (upval), p1 (copy), IsInputObjectTypeFunction (upval), SuggestionListFunction (upval), GraphQLError (upval), DidYouMeanFunction (upval)
				local NamedType = GetNamedTypeFunction(p1:getParentInputType())
				
				if not p1:getInputType() and IsInputObjectTypeFunction(NamedType) then
					p1:reportError(GraphQLError.new(("Field \"%s\" is not defined by type \"%s\"."):format(p3.name.value, NamedType.name) .. DidYouMeanFunction((SuggestionListFunction(p3.name.value, NamedType:getFields():keys()))), p3))
				end
			end,
			NullValue = function(_, p3)
				-- upvalues: p1 (copy), IsNonNullTypeFunction (upval), GraphQLError (upval), InspectFunction (upval), PrintFunction (upval)
				local InputType = p1:getInputType()
				
				if IsNonNullTypeFunction(InputType) then
					p1:reportError(GraphQLError.new(("Expected value of type \"%s\", found %s."):format(InspectFunction(InputType), PrintFunction(p3)), p3))
				end
			end,
			EnumValue = function(_, p3)
				-- upvalues: Callback (upval), p1 (copy)
				return Callback(p1, p3)
			end,
			IntValue = function(_, p3)
				-- upvalues: Callback (upval), p1 (copy)
				return Callback(p1, p3)
			end,
			FloatValue = function(_, p3)
				-- upvalues: Callback (upval), p1 (copy)
				return Callback(p1, p3)
			end,
			StringValue = function(_, p3)
				-- upvalues: Callback (upval), p1 (copy)
				return Callback(p1, p3)
			end,
			BooleanValue = function(_, p3)
				-- upvalues: Callback (upval), p1 (copy)
				return Callback(p1, p3)
			end
		}
	end
}

Callback = function(p2, p3)
	-- upvalues: GetNamedTypeFunction (copy), IsLeafTypeFunction (copy), InspectFunction (copy), GraphQLError (copy), PrintFunction (copy), InstanceOfModule (copy)
	local InputType = p2:getInputType()
	
	if not InputType then return end
	local NamedType = GetNamedTypeFunction(InputType)
	
	if IsLeafTypeFunction(NamedType) then
		xpcall(function()
			-- upvalues: NamedType (copy), p3 (copy), InspectFunction (upval), InputType (copy), p2 (copy), GraphQLError (upval), PrintFunction (upval)
			if NamedType:parseLiteral(p3, nil) == nil then
				p2:reportError(GraphQLError.new(("Expected value of type \"%s\", found %s."):format(InspectFunction(InputType), PrintFunction(p3)), p3))
			end
		end, function(Err)
			-- upvalues: InspectFunction (upval), InputType (copy), InstanceOfModule (upval), GraphQLError (upval), p2 (copy), PrintFunction (upval), p3 (copy)
			local InspectResult = InspectFunction(InputType)
			
			if InstanceOfModule(Err, GraphQLError) then
				p2:reportError(Err)
				
				return
			else
				p2:reportError(GraphQLError.new(("Expected value of type \"%s\", found %s; "):format(InspectResult, PrintFunction(p3)) .. Err.message, p3, nil, nil, nil, Err))
			end
		end)
		
		return
	else
		p2:reportError(GraphQLError.new(("Expected value of type \"%s\", found %s."):format(InspectFunction(InputType), PrintFunction(p3)), p3))
	end
end

return ValuesOfCorrectTypeRuleModule