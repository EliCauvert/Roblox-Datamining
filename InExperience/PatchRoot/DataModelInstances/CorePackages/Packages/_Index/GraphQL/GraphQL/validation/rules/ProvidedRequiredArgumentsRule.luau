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

function t.ProvidedRequiredArgumentsRule(p0)
	-- upvalues: object (ref), t (ref), keyMap (ref), isRequiredArgument (ref), inspect (ref), graphQLError (ref)
	return object.assign({}, t.ProvidedRequiredArgumentsOnDirectivesRule(p0), {
		Field = {
			leave = function(_, p1)
				-- upvalues: p0 (ref), keyMap (copy), isRequiredArgument (copy), inspect (copy), graphQLError (copy)
				local fieldDef = p0:getFieldDef()
				
				if not fieldDef then
					return false
				end
				local var4 = keyMap(p1.arguments or {}, function(p2)
					return p2.name.value
				end)
				
				for i, v in ipairs(fieldDef.args) do
					if not var4[v.name] and isRequiredArgument(v) then
						p0:reportError(graphQLError.new(("Field \"%s\" argument \"%s\" of type \"%s\" is required, but it was not provided."):format(fieldDef.name, v.name, inspect(v.type)), p1))
					end
				end
			end
		}
	})
end

function t.ProvidedRequiredArgumentsOnDirectivesRule(p3)
	-- upvalues: specifiedDirectives (ref), keyMap (ref), array (ref), isRequiredArgument (ref), kind (ref), object (ref), isType (ref), inspect (ref), print (ref), graphQLError (ref)
	local t = {}
	local schema = p3:getSchema()
	
	for i, v in ipairs(if schema then schema:getDirectives() else specifiedDirectives) do
		t[v.name] = keyMap(array.filter(v.args, isRequiredArgument), function(p4)
			return p4.name
		end)
	end
	for i_1, v_1 in ipairs(p3:getDocument().definitions) do
		if v_1.kind == kind.DIRECTIVE_DEFINITION then
			t[v_1.name.value] = keyMap(array.filter(v_1.arguments or {}, isRequiredArgumentNode), function(p5)
				return p5.name.value
			end)
		end
	end
	return {
		Directive = {
			leave = function(_, p6)
				-- upvalues: t (ref), keyMap (copy), object (copy), isType (copy), inspect (copy), print (copy), p3 (ref), graphQLError (copy)
				local value = p6.name.value
				local var7 = t[value]
				
				if var7 then
					local var8 = keyMap(p6.arguments or {}, function(p7)
						return p7.name.value
					end)
					
					for i, v in ipairs(object.keys(var7)) do
						if not var8[v] then
							local type = var7[v].type
							p3:reportError(graphQLError.new(("Directive \"@%s\" argument \"%s\" of type \"%s\" is required, but it was not provided."):format(value, v, isType(type) and inspect(type) or print(type)), p6))
						end
					end
				end
			end
		}
	}
end

function isRequiredArgumentNode(p8)
	-- upvalues: kind (ref)
	return p8.type.kind == kind.NON_NULL_TYPE and p8.defaultValue == nil
end

return t