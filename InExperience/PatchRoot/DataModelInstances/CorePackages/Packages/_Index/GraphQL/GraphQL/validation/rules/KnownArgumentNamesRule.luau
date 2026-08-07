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

function t.KnownArgumentNamesRule(p0) --[[ line: 31 ]]
	-- upvalues: object (ref), t (ref), array (ref), suggestionList (ref), graphQLError (ref), didYouMean (ref)
	return object.assign({}, t.KnownArgumentNamesOnDirectivesRule(p0), {
		Argument = function(_, p1) --[[ line: 33 ]]
			-- upvalues: p0 (ref), array (copy), suggestionList (copy), graphQLError (copy), didYouMean (copy)
			local argument = p0:getArgument()
			local fieldDef = p0:getFieldDef()
			local parentType = p0:getParentType()
			
			if not argument and fieldDef and parentType then
				local value = p1.name.value
				p0:reportError(graphQLError.new(("Unknown argument \"%s\" on field \"%s.%s\"."):format(value, parentType.name, fieldDef.name) .. didYouMean(suggestionList(value, array.map(fieldDef.args, function(p2) --[[ line: 40 ]]
					return p2.name
				end))), p1))
			end
		end
	})
end

function t.KnownArgumentNamesOnDirectivesRule(p3) --[[ line: 62 ]]
	-- upvalues: specifiedDirectives (ref), array (ref), kind (ref), suggestionList (ref), graphQLError (ref), didYouMean (ref)
	local t = {}
	local schema = p3:getSchema()
	
	for i, v in ipairs(if schema then schema:getDirectives() else specifiedDirectives) do
		t[v.name] = array.map(v.args, function(p4) --[[ line: 71 ]]
			return p4.name
		end)
	end
	for i_1, v_1 in ipairs(p3:getDocument().definitions) do
		if v_1.kind == kind.DIRECTIVE_DEFINITION then
			t[v_1.name.value] = array.map(v_1.arguments or {}, function(p5) --[[ line: 82 ]]
				return p5.name.value
			end)
		end
	end
	return {
		Directive = function(_, p6) --[[ line: 89 ]]
			-- upvalues: t (ref), array (copy), suggestionList (copy), p3 (ref), graphQLError (copy), didYouMean (copy)
			local value = p6.name.value
			local var7 = t[value]
			
			if p6.arguments and var7 then
				for i, v in ipairs(p6.arguments) do
					local value_1 = v.name.value
					
					if array.indexOf(var7, value_1) == -1 then
						p3:reportError(graphQLError.new(("Unknown argument \"%s\" on directive \"@%s\"."):format(value_1, value) .. didYouMean(suggestionList(value_1, var7)), v))
					end
				end
			end
			return false
		end
	}
end

return t