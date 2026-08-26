local parent = script.Parent.Parent.Parent
local luauPolyfillModule = require(parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object
local graphQLError = require(parent.error.GraphQLError).GraphQLError
local language = parent.language
local jsutils = parent.jsutils
local didYouMean = require(jsutils.didYouMean).didYouMean
local suggestionList = require(jsutils.suggestionList).suggestionList
local kind = require(language.kinds).Kind
local specifiedDirectives = require(parent.type.directives).specifiedDirectives
local t = {}

function t.KnownArgumentNamesRule(p1)
	-- upvalues: object (ref), t (ref), array (ref), suggestionList (ref), graphQLError (ref), didYouMean (ref)
	return object.assign({}, t.KnownArgumentNamesOnDirectivesRule(p1), {
		Argument = function(_, p2)
			-- upvalues: p1 (ref), array (copy), suggestionList (copy), graphQLError (copy), didYouMean (copy)
			local argument = p1:getArgument()
			local fieldDef = p1:getFieldDef()
			local parentType = p1:getParentType()
			
			if not argument and fieldDef and parentType then
				local value = p2.name.value
				p1:reportError(graphQLError.new(("Unknown argument \"%s\" on field \"%s.%s\"."):format(value, parentType.name, fieldDef.name) .. didYouMean(suggestionList(value, array.map(fieldDef.args, function(p3)
					return p3.name
				end))), p2))
			end
		end
	})
end

function t.KnownArgumentNamesOnDirectivesRule(p1)
	-- upvalues: specifiedDirectives (ref), array (ref), kind (ref), suggestionList (ref), graphQLError (ref), didYouMean (ref)
	local t = {}
	local schema = p1:getSchema()
	
	for i, v in ipairs(if schema then schema:getDirectives() else specifiedDirectives) do
		t[v.name] = array.map(v.args, function(p2)
			return p2.name
		end)
	end
	for i_1, v_1 in ipairs(p1:getDocument().definitions) do
		if v_1.kind == kind.DIRECTIVE_DEFINITION then
			t[v_1.name.value] = array.map(v_1.arguments or {}, function(p2)
				return p2.name.value
			end)
		end
	end
	return {
		Directive = function(_, p2)
			-- upvalues: t (ref), array (copy), suggestionList (copy), p1 (ref), graphQLError (copy), didYouMean (copy)
			local value = p2.name.value
			local var1 = t[value]
			
			if p2.arguments and var1 then
				for i, v in ipairs(p2.arguments) do
					local value_1 = v.name.value
					
					if array.indexOf(var1, value_1) == -1 then
						p1:reportError(graphQLError.new(("Unknown argument \"%s\" on directive \"@%s\"."):format(value_1, value) .. didYouMean(suggestionList(value_1, var1)), v))
					end
				end
			end
			return false
		end
	}
end

return t