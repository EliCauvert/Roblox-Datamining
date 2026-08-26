local parent = script.Parent.Parent.Parent
local jsutils = parent.jsutils
local luauPolyfillModule = require(parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object
local inspect = require(jsutils.inspect).inspect
local keyMap = require(jsutils.keyMap).keyMap
local graphQLError = require(parent.error.GraphQLError).GraphQLError
local language = parent.language
local kind = require(language.kinds).Kind
local print = require(language.printer).print
local definitionModule = require(parent.type.definition)
local isType = definitionModule.isType
local isRequiredArgument = definitionModule.isRequiredArgument
local specifiedDirectives = require(parent.type.directives).specifiedDirectives
local t = {}

function t.ProvidedRequiredArgumentsRule(p1)
	-- upvalues: object (ref), t (ref), keyMap (ref), isRequiredArgument (ref), inspect (ref), graphQLError (ref)
	return object.assign({}, t.ProvidedRequiredArgumentsOnDirectivesRule(p1), {
		Field = {
			leave = function(_, p2)
				-- upvalues: p1 (ref), keyMap (copy), isRequiredArgument (copy), inspect (copy), graphQLError (copy)
				local fieldDef = p1:getFieldDef()
				
				if not fieldDef then
					return false
				end
				local var1 = keyMap(p2.arguments or {}, function(p3)
					return p3.name.value
				end)
				
				for i, v in ipairs(fieldDef.args) do
					if not var1[v.name] and isRequiredArgument(v) then
						p1:reportError(graphQLError.new(("Field \"%s\" argument \"%s\" of type \"%s\" is required, but it was not provided."):format(fieldDef.name, v.name, inspect(v.type)), p2))
					end
				end
			end
		}
	})
end

function t.ProvidedRequiredArgumentsOnDirectivesRule(p2)
	-- upvalues: specifiedDirectives (ref), keyMap (ref), array (ref), isRequiredArgument (ref), kind (ref), object (ref), isType (ref), inspect (ref), print (ref), graphQLError (ref)
	local t = {}
	local schema = p2:getSchema()
	
	for i, v in ipairs(if schema then schema:getDirectives() else specifiedDirectives) do
		t[v.name] = keyMap(array.filter(v.args, isRequiredArgument), function(p3)
			return p3.name
		end)
	end
	for i_1, v_1 in ipairs(p2:getDocument().definitions) do
		if v_1.kind == kind.DIRECTIVE_DEFINITION then
			t[v_1.name.value] = keyMap(array.filter(v_1.arguments or {}, isRequiredArgumentNode), function(p3)
				return p3.name.value
			end)
		end
	end
	return {
		Directive = {
			leave = function(_, p3)
				-- upvalues: t (ref), keyMap (copy), object (copy), isType (copy), inspect (copy), print (copy), p2 (ref), graphQLError (copy)
				local value = p3.name.value
				local var1 = t[value]
				
				if var1 then
					local var2 = keyMap(p3.arguments or {}, function(p4)
						return p4.name.value
					end)
					
					for i, v in ipairs(object.keys(var1)) do
						if not var2[v] then
							local type = var1[v].type
							p2:reportError(graphQLError.new(("Directive \"@%s\" argument \"%s\" of type \"%s\" is required, but it was not provided."):format(value, v, isType(type) and inspect(type) or print(type)), p3))
						end
					end
				end
			end
		}
	}
end

function isRequiredArgumentNode(p3)
	-- upvalues: kind (ref)
	return p3.type.kind == kind.NON_NULL_TYPE and p3.defaultValue == nil
end

return t