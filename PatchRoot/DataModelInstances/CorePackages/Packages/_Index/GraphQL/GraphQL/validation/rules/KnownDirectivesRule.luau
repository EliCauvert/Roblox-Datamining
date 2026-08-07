-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:39 2026 Pacific Standard Time.

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

function t.KnownDirectivesRule(p0) --[[ line: 35 ]]
	-- upvalues: specifiedDirectives (ref), kind (ref), array (ref), graphQLError (ref), getDirectiveLocationForASTPath (write)
	local t = {}
	local schema = p0:getSchema()
	
	for i, v in ipairs(if schema then schema:getDirectives() else specifiedDirectives) do
		t[v.name] = v.locations
	end
	for i_1, v_1 in ipairs(p0:getDocument().definitions) do
		if v_1.kind == kind.DIRECTIVE_DEFINITION then
			t[v_1.name.value] = array.map(v_1.locations, function(p1) --[[ line: 50 ]]
				return p1.value
			end)
		end
	end
	return {
		Directive = function(_, p2, _, _, _, p3) --[[ line: 57 ]]
			-- upvalues: t (ref), p0 (ref), graphQLError (copy), getDirectiveLocationForASTPath (copy), array (copy)
			local value = p2.name.value
			local var5 = t[value]
			
			if not var5 then
				p0:reportError(graphQLError.new(("Unknown directive \"@%s\"."):format(value), p2))
				
				return
			end
			local var6 = getDirectiveLocationForASTPath(p3)
			
			if var6 and array.indexOf(var5, var6) == -1 then
				p0:reportError(graphQLError.new(("Directive \"@%s\" may not be used on %s."):format(value, var6), p2))
			end
		end
	}
end

getDirectiveLocationForASTPath = function(p4) --[[ line: 83 | named "getDirectiveLocationForASTPath" ]]
	-- upvalues: invariant (ref), array (ref), kind (ref), getDirectiveLocationForOperation (write), directiveLocation (ref)
	local var7 = p4[#p4]
	invariant(not array.isArray(var7))
	local kind_1 = var7.kind
	
	return if kind_1 == kind.OPERATION_DEFINITION then getDirectiveLocationForOperation(var7.operation) elseif kind_1 == kind.FIELD then directiveLocation.FIELD elseif kind_1 == kind.FRAGMENT_SPREAD then directiveLocation.FRAGMENT_SPREAD elseif kind_1 == kind.INLINE_FRAGMENT then directiveLocation.INLINE_FRAGMENT elseif kind_1 == kind.FRAGMENT_DEFINITION then directiveLocation.FRAGMENT_DEFINITION elseif kind_1 == kind.VARIABLE_DEFINITION then directiveLocation.VARIABLE_DEFINITION elseif kind_1 == kind.SCHEMA_DEFINITION or kind_1 == kind.SCHEMA_EXTENSION then directiveLocation.SCHEMA elseif kind_1 == kind.SCALAR_TYPE_DEFINITION or kind_1 == kind.SCALAR_TYPE_EXTENSION then directiveLocation.SCALAR elseif kind_1 == kind.OBJECT_TYPE_DEFINITION or kind_1 == kind.OBJECT_TYPE_EXTENSION then directiveLocation.OBJECT elseif kind_1 == kind.FIELD_DEFINITION then directiveLocation.FIELD_DEFINITION elseif kind_1 == kind.INTERFACE_TYPE_DEFINITION or kind_1 == kind.INTERFACE_TYPE_EXTENSION then directiveLocation.INTERFACE elseif kind_1 == kind.UNION_TYPE_DEFINITION or kind_1 == kind.UNION_TYPE_EXTENSION then directiveLocation.UNION elseif kind_1 == kind.ENUM_TYPE_DEFINITION or kind_1 == kind.ENUM_TYPE_EXTENSION then directiveLocation.ENUM elseif kind_1 == kind.ENUM_VALUE_DEFINITION then directiveLocation.ENUM_VALUE elseif kind_1 == kind.INPUT_OBJECT_TYPE_DEFINITION or kind_1 == kind.INPUT_OBJECT_TYPE_EXTENSION then directiveLocation.INPUT_OBJECT elseif kind_1 == kind.INPUT_VALUE_DEFINITION then if p4[#p4 - 2].kind == kind.INPUT_OBJECT_TYPE_DEFINITION then directiveLocation.INPUT_FIELD_DEFINITION else directiveLocation.ARGUMENT_DEFINITION else nil
end

getDirectiveLocationForOperation = function(p5) --[[ line: 146 | named "getDirectiveLocationForOperation" ]]
	-- upvalues: directiveLocation (ref), invariant (ref), inspect (ref)
	if p5 == "query" then
		return directiveLocation.QUERY
	elseif p5 == "mutation" then
		return directiveLocation.MUTATION
	elseif p5 == "subscription" then
		return directiveLocation.SUBSCRIPTION
	end
	invariant(false, "Unexpected operation: " .. inspect(p5))
	
	return nil
end

return t