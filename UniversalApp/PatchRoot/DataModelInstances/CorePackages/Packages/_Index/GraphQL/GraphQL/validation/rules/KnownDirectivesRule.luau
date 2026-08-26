local parent = script.Parent.Parent.Parent
local array = require(parent.Parent.LuauPolyfill).Array
local graphQLError = require(parent.error.GraphQLError).GraphQLError
local language = parent.language
local jsutils = parent.jsutils
local inspect = require(jsutils.inspect).inspect
local invariant = require(jsutils.invariant).invariant
local kind = require(language.kinds).Kind
local directiveLocation = require(language.directiveLocation).DirectiveLocation
local specifiedDirectives = require(parent.type.directives).specifiedDirectives
local t = {}
local getDirectiveLocationForASTPath = nil
local getDirectiveLocationForOperation = nil

function t.KnownDirectivesRule(p1)
	-- upvalues: specifiedDirectives (ref), kind (ref), array (ref), graphQLError (ref), getDirectiveLocationForASTPath (write)
	local t = {}
	local schema = p1:getSchema()
	
	for i, v in ipairs(if schema then schema:getDirectives() else specifiedDirectives) do
		t[v.name] = v.locations
	end
	for i_1, v_1 in ipairs(p1:getDocument().definitions) do
		if v_1.kind == kind.DIRECTIVE_DEFINITION then
			t[v_1.name.value] = array.map(v_1.locations, function(p2)
				return p2.value
			end)
		end
	end
	return {
		Directive = function(_, p2, _, _, _, p3)
			-- upvalues: t (ref), p1 (ref), graphQLError (copy), getDirectiveLocationForASTPath (copy), array (copy)
			local value = p2.name.value
			local var1 = t[value]
			
			if not var1 then
				p1:reportError(graphQLError.new(("Unknown directive \"@%s\"."):format(value), p2))
				
				return
			end
			local var2 = getDirectiveLocationForASTPath(p3)
			
			if var2 and array.indexOf(var1, var2) == -1 then
				p1:reportError(graphQLError.new(("Directive \"@%s\" may not be used on %s."):format(value, var2), p2))
			end
		end
	}
end

getDirectiveLocationForASTPath = function(p2)
	-- upvalues: invariant (ref), array (ref), kind (ref), getDirectiveLocationForOperation (write), directiveLocation (ref)
	local var1 = p2[#p2]
	invariant(not array.isArray(var1))
	local kind_1 = var1.kind
	
	return if kind_1 == kind.OPERATION_DEFINITION then getDirectiveLocationForOperation(var1.operation) elseif kind_1 == kind.FIELD then directiveLocation.FIELD elseif kind_1 == kind.FRAGMENT_SPREAD then directiveLocation.FRAGMENT_SPREAD elseif kind_1 == kind.INLINE_FRAGMENT then directiveLocation.INLINE_FRAGMENT elseif kind_1 == kind.FRAGMENT_DEFINITION then directiveLocation.FRAGMENT_DEFINITION elseif kind_1 == kind.VARIABLE_DEFINITION then directiveLocation.VARIABLE_DEFINITION elseif kind_1 == kind.SCHEMA_DEFINITION or kind_1 == kind.SCHEMA_EXTENSION then directiveLocation.SCHEMA elseif kind_1 == kind.SCALAR_TYPE_DEFINITION or kind_1 == kind.SCALAR_TYPE_EXTENSION then directiveLocation.SCALAR elseif kind_1 == kind.OBJECT_TYPE_DEFINITION or kind_1 == kind.OBJECT_TYPE_EXTENSION then directiveLocation.OBJECT elseif kind_1 == kind.FIELD_DEFINITION then directiveLocation.FIELD_DEFINITION elseif kind_1 == kind.INTERFACE_TYPE_DEFINITION or kind_1 == kind.INTERFACE_TYPE_EXTENSION then directiveLocation.INTERFACE elseif kind_1 == kind.UNION_TYPE_DEFINITION or kind_1 == kind.UNION_TYPE_EXTENSION then directiveLocation.UNION elseif kind_1 == kind.ENUM_TYPE_DEFINITION or kind_1 == kind.ENUM_TYPE_EXTENSION then directiveLocation.ENUM elseif kind_1 == kind.ENUM_VALUE_DEFINITION then directiveLocation.ENUM_VALUE elseif kind_1 == kind.INPUT_OBJECT_TYPE_DEFINITION or kind_1 == kind.INPUT_OBJECT_TYPE_EXTENSION then directiveLocation.INPUT_OBJECT elseif kind_1 == kind.INPUT_VALUE_DEFINITION then if p2[#p2 - 2].kind == kind.INPUT_OBJECT_TYPE_DEFINITION then directiveLocation.INPUT_FIELD_DEFINITION else directiveLocation.ARGUMENT_DEFINITION else nil
end

getDirectiveLocationForOperation = function(p2)
	-- upvalues: directiveLocation (ref), invariant (ref), inspect (ref)
	if p2 == "query" then
		return directiveLocation.QUERY
	elseif p2 == "mutation" then
		return directiveLocation.MUTATION
	elseif p2 == "subscription" then
		return directiveLocation.SUBSCRIPTION
	end
	invariant(false, "Unexpected operation: " .. inspect(p2))
	
	return nil
end

return t