local Parent = script.Parent.Parent
local Jsutils = Parent.jsutils
local LuaUtils = Parent.luaUtils
local LuauPolyfillModule = require(Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Object = LuauPolyfillModule.Object
local InspectFunction = require(Jsutils.inspect).inspect
local InvariantFunction = require(Jsutils.invariant).invariant
local DidYouMeanFunction = require(Jsutils.didYouMean).didYouMean
local IsObjectLikeFunction = require(Jsutils.isObjectLike).isObjectLike
local SuggestionListFunction = require(Jsutils.suggestionList).suggestionList
local PrintPathArrayFunction = require(Jsutils.printPathArray).printPathArray
local AddPathFunction = require(Jsutils.Path).addPath
local InstanceOfModule = require(Jsutils.instanceOf)
local NullModule = require(LuaUtils.null)
local IsNillishModule = require(LuaUtils.isNillish)
local IsNillishFunction = IsNillishModule.isNillish
local IsNotNillishFunction = IsNillishModule.isNotNillish
local PathToArrayFunction = require(Jsutils.Path).pathToArray
local IsIteratableObjectFunction = require(Jsutils.isIteratableObject).isIteratableObject
local GraphQLError = require(Parent.error.GraphQLError).GraphQLError
local DefinitionModule = require(Parent.type.definition)
local IsLeafTypeFunction = DefinitionModule.isLeafType
local IsInputObjectTypeFunction = DefinitionModule.isInputObjectType
local IsListTypeFunction = DefinitionModule.isListType
local IsNonNullTypeFunction = DefinitionModule.isNonNullType
local Callback = nil
local DefaultOnError = nil

local function coerceInputValue(p1, p2, p3)
	-- upvalues: DefaultOnError (ref), Callback (ref)
	return Callback(p1, p2, if p3 then p3 else DefaultOnError)
end

DefaultOnError = function(p1, p2, p3)
	-- upvalues: InspectFunction (copy), PrintPathArrayFunction (copy)
	local Text = "Invalid value " .. InspectFunction(p2)
	
	if #p1 > 0 then
		Text ..= " at \"value" .. PrintPathArrayFunction(p1) .. "\""
	end
	p3.message = Text .. ": " .. p3.message
	error(p3)
end

Callback = function(p1, OfType, Callback1: (any, any, any) -> (), p2)
	-- upvalues: IsNonNullTypeFunction (copy), IsNotNillishFunction (copy), Callback (ref), PathToArrayFunction (copy), GraphQLError (copy), InspectFunction (copy), IsNillishFunction (copy), NullModule (copy), IsListTypeFunction (copy), IsIteratableObjectFunction (copy), Array (copy), AddPathFunction (copy), IsInputObjectTypeFunction (copy), IsObjectLikeFunction (copy), Object (copy), SuggestionListFunction (copy), DidYouMeanFunction (copy), IsLeafTypeFunction (copy), InstanceOfModule (copy), InvariantFunction (copy)
	if not IsNonNullTypeFunction(OfType) then
		if IsNillishFunction(p1) then
			return NullModule
		end
		if IsListTypeFunction(OfType) then
			local OfType1 = OfType.ofType
			
			return if IsIteratableObjectFunction(p1) then Array.from(p1, function(p3, p4)
				-- upvalues: AddPathFunction (upval), p2 (copy), Callback (upval), OfType1 (copy), Callback1 (copy)
				return Callback(p3, OfType1, Callback1, (AddPathFunction(p2, p4, nil)))
			end) else { Callback(p1, OfType1, Callback1, p2) }
		end
		if IsInputObjectTypeFunction(OfType) then
			if not IsObjectLikeFunction(p1) then
				Callback1(PathToArrayFunction(p2), p1, GraphQLError.new("Expected type \"" .. OfType.name .. "\" to be an object."))
				
				return
			end
			local DefaultValues = {}
			local Fields = OfType:getFields()
			
			for _, value in ipairs(Fields:values()) do
				local v1 = p1[value.name]
				
				if v1 ~= nil then
					DefaultValues[value.name] = Callback(v1, value.type, Callback1, AddPathFunction(p2, value.name, OfType.name))
					continue
				end
				if value.defaultValue ~= nil then
					DefaultValues[value.name] = value.defaultValue
				elseif IsNonNullTypeFunction(value.type) then
					Callback1(PathToArrayFunction(p2), p1, GraphQLError.new("Field \"" .. value.name .. "\" of required type \"" .. InspectFunction(value.type) .. "\" was not provided."))
				end
			end
			for _, value1 in ipairs(Object.keys(p1)) do
				if not Fields:get(value1) then
					Callback1(PathToArrayFunction(p2), p1, GraphQLError.new(("Field \"%s\" is not defined by type \"%s\".%s"):format(value1, OfType.name, DidYouMeanFunction((SuggestionListFunction(value1, OfType:getFields():keys()))))))
				end
			end
			return DefaultValues
		else
			if not IsLeafTypeFunction(OfType) then
				InvariantFunction(false, "Unexpected input type: " .. InspectFunction(OfType))
				
				return
			end
			local Success, Result = pcall(OfType.parseValue, OfType, p1)
			
			if Success then
				if Result == nil then
					Callback1(PathToArrayFunction(p2), p1, GraphQLError.new(("Expected type \"%s\"."):format(OfType.name)))
				end
				return Result
			elseif InstanceOfModule(Result, GraphQLError) then
				Callback1(PathToArrayFunction(p2), p1, Result)
				
				return
			else
				Callback1(PathToArrayFunction(p2), p1, GraphQLError.new("Expected type \"" .. OfType.name .. "\". " .. Result.message, nil, nil, nil, nil, Result))
				
				return
			end
		end
	elseif IsNotNillishFunction(p1) then
		return Callback(p1, OfType.ofType, Callback1, p2)
	else
		Callback1(PathToArrayFunction(p2), p1, GraphQLError.new("Expected non-nullable type \"" .. InspectFunction(OfType) .. "\" not to be null."))
	end
end

return { coerceInputValue = coerceInputValue }