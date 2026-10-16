local Parent = script.Parent.Parent.Parent
local Array = require(Parent.Parent.LuauPolyfill).Array
local GraphQLError = require(Parent.error.GraphQLError).GraphQLError
local Language = Parent.language
local Jsutils = Parent.jsutils
local InspectFunction = require(Jsutils.inspect).inspect
local InvariantFunction = require(Jsutils.invariant).invariant
local Kind = require(Language.kinds).Kind
local DirectiveLocation = require(Language.directiveLocation).DirectiveLocation
local SpecifiedDirectives = require(Parent.type.directives).specifiedDirectives
local Callback = nil
local Callback1 = nil
local KnownDirectivesRuleModule = {
	KnownDirectivesRule = function(p1) --[[ Line: 35 ]]
		-- upvalues: SpecifiedDirectives (copy), Kind (copy), Array (copy), GraphQLError (copy), Callback (ref)
		local MapResults = {}
		local Schema = p1:getSchema()
		local Directives = if Schema then Schema:getDirectives() else SpecifiedDirectives
		for _, directive in ipairs(Directives) do
			MapResults[directive.name] = directive.locations
		end
		for _, definition in ipairs(p1:getDocument().definitions) do
			if definition.kind == Kind.DIRECTIVE_DEFINITION then
				MapResults[definition.name.value] = Array.map(definition.locations, function(p2) --[[ Line: 50 ]]
					return p2.value
				end)
			end
		end
		return {
			Directive = function(_, p2, _, _, _, p3) --[[ Line: 57 ]]
				-- upvalues: MapResults (copy), p1 (copy), GraphQLError (upval), Callback (upval), Array (upval)
				local Value = p2.name.value
				local MapResult = MapResults[Value]
				
				if not MapResult then
					p1:reportError(GraphQLError.new(("Unknown directive \"@%s\"."):format(Value), p2))
					
					return
				end
				local CallbackResult = Callback(p3)
				
				if CallbackResult and Array.indexOf(MapResult, CallbackResult) == -1 then
					p1:reportError(GraphQLError.new(("Directive \"@%s\" may not be used on %s."):format(Value, CallbackResult), p2))
				end
			end
		}
	end
}

Callback = function(p2) --[[ Line: 83 | Named "getDirectiveLocationForASTPath" ]]
	-- upvalues: InvariantFunction (copy), Array (copy), Kind (copy), Callback1 (ref), DirectiveLocation (copy)
	local v1 = p2[#p2]
	InvariantFunction(not Array.isArray(v1))
	local Kind1 = v1.kind
	
	return if Kind1 == Kind.OPERATION_DEFINITION then Callback1(v1.operation) elseif Kind1 == Kind.FIELD then DirectiveLocation.FIELD elseif Kind1 == Kind.FRAGMENT_SPREAD then DirectiveLocation.FRAGMENT_SPREAD elseif Kind1 == Kind.INLINE_FRAGMENT then DirectiveLocation.INLINE_FRAGMENT elseif Kind1 == Kind.FRAGMENT_DEFINITION then DirectiveLocation.FRAGMENT_DEFINITION elseif Kind1 == Kind.VARIABLE_DEFINITION then DirectiveLocation.VARIABLE_DEFINITION elseif Kind1 == Kind.SCHEMA_DEFINITION or Kind1 == Kind.SCHEMA_EXTENSION then DirectiveLocation.SCHEMA elseif Kind1 == Kind.SCALAR_TYPE_DEFINITION or Kind1 == Kind.SCALAR_TYPE_EXTENSION then DirectiveLocation.SCALAR elseif Kind1 == Kind.OBJECT_TYPE_DEFINITION or Kind1 == Kind.OBJECT_TYPE_EXTENSION then DirectiveLocation.OBJECT elseif Kind1 == Kind.FIELD_DEFINITION then DirectiveLocation.FIELD_DEFINITION elseif Kind1 == Kind.INTERFACE_TYPE_DEFINITION or Kind1 == Kind.INTERFACE_TYPE_EXTENSION then DirectiveLocation.INTERFACE elseif Kind1 == Kind.UNION_TYPE_DEFINITION or Kind1 == Kind.UNION_TYPE_EXTENSION then DirectiveLocation.UNION elseif Kind1 == Kind.ENUM_TYPE_DEFINITION or Kind1 == Kind.ENUM_TYPE_EXTENSION then DirectiveLocation.ENUM elseif Kind1 == Kind.ENUM_VALUE_DEFINITION then DirectiveLocation.ENUM_VALUE elseif Kind1 == Kind.INPUT_OBJECT_TYPE_DEFINITION or Kind1 == Kind.INPUT_OBJECT_TYPE_EXTENSION then DirectiveLocation.INPUT_OBJECT elseif Kind1 == Kind.INPUT_VALUE_DEFINITION then p2[#p2 - 2].kind == Kind.INPUT_OBJECT_TYPE_DEFINITION and DirectiveLocation.INPUT_FIELD_DEFINITION or DirectiveLocation.ARGUMENT_DEFINITION else nil
end

Callback1 = function(Operation) --[[ Line: 146 | Named "getDirectiveLocationForOperation" ]]
	-- upvalues: DirectiveLocation (copy), InvariantFunction (copy), InspectFunction (copy)
	if Operation == "query" then
		return DirectiveLocation.QUERY
	elseif Operation == "mutation" then
		return DirectiveLocation.MUTATION
	elseif Operation == "subscription" then
		return DirectiveLocation.SUBSCRIPTION
	else
		InvariantFunction(false, "Unexpected operation: " .. InspectFunction(Operation))
		
		return nil
	end
end

return KnownDirectivesRuleModule