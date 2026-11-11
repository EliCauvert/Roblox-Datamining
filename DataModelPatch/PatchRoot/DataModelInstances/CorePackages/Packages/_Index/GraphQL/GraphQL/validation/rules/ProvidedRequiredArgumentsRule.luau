local Parent = script.Parent.Parent.Parent
local Jsutils = Parent.jsutils
local LuauPolyfillModule = require(Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Object = LuauPolyfillModule.Object
local InspectFunction = require(Jsutils.inspect).inspect
local KeyMapFunction = require(Jsutils.keyMap).keyMap
local GraphQLError = require(Parent.error.GraphQLError).GraphQLError
local Language = Parent.language
local Kind = require(Language.kinds).Kind
local PrintFunction = require(Language.printer).print
local DefinitionModule = require(Parent.type.definition)
local IsTypeFunction = DefinitionModule.isType
local IsRequiredArgumentFunction = DefinitionModule.isRequiredArgument
local SpecifiedDirectives = require(Parent.type.directives).specifiedDirectives
local ProvidedRequiredArgumentsRuleModule = {}

function ProvidedRequiredArgumentsRuleModule.ProvidedRequiredArgumentsRule(p1)
	-- upvalues: Object (copy), ProvidedRequiredArgumentsRuleModule (copy), KeyMapFunction (copy), IsRequiredArgumentFunction (copy), InspectFunction (copy), GraphQLError (copy)
	return Object.assign({}, ProvidedRequiredArgumentsRuleModule.ProvidedRequiredArgumentsOnDirectivesRule(p1), {
		Field = {
			leave = function(_, p2): boolean?
				-- upvalues: p1 (copy), KeyMapFunction (upval), IsRequiredArgumentFunction (upval), InspectFunction (upval), GraphQLError (upval)
				local FieldDef = p1:getFieldDef()
				
				if not FieldDef then
					return false
				end
				local KeyMapResult = KeyMapFunction(p2.arguments or {}, function(p3)
					return p3.name.value
				end)
				
				for _, arg in ipairs(FieldDef.args) do
					if not KeyMapResult[arg.name] and IsRequiredArgumentFunction(arg) then
						p1:reportError(GraphQLError.new(("Field \"%s\" argument \"%s\" of type \"%s\" is required, but it was not provided."):format(FieldDef.name, arg.name, (InspectFunction(arg.type))), p2))
					end
				end
			end
		}
	})
end

function ProvidedRequiredArgumentsRuleModule.ProvidedRequiredArgumentsOnDirectivesRule(p2)
	-- upvalues: SpecifiedDirectives (copy), KeyMapFunction (copy), Array (copy), IsRequiredArgumentFunction (copy), Kind (copy), Object (copy), IsTypeFunction (copy), InspectFunction (copy), PrintFunction (copy), GraphQLError (copy)
	local t = {}
	local Schema = p2:getSchema()
	local Directives = if Schema then Schema:getDirectives() else SpecifiedDirectives
	for _, directive in ipairs(Directives) do
		t[directive.name] = KeyMapFunction(Array.filter(directive.args, IsRequiredArgumentFunction), function(p3)
			return p3.name
		end)
	end
	for _, definition in ipairs(p2:getDocument().definitions) do
		if definition.kind == Kind.DIRECTIVE_DEFINITION then
			t[definition.name.value] = KeyMapFunction(Array.filter(definition.arguments or {}, isRequiredArgumentNode), function(p3)
				return p3.name.value
			end)
		end
	end
	return {
		Directive = {
			leave = function(_, p3)
				-- upvalues: t (copy), KeyMapFunction (upval), Object (upval), IsTypeFunction (upval), InspectFunction (upval), PrintFunction (upval), p2 (copy), GraphQLError (upval)
				local Value = p3.name.value
				local Entry = t[Value]
				
				if Entry then
					local KeyMapResult = KeyMapFunction(p3.arguments or {}, function(p4)
						return p4.name.value
					end)
					
					for _, value in ipairs(Object.keys(Entry)) do
						if not KeyMapResult[value] then
							local Type = Entry[value].type
							p2:reportError(GraphQLError.new(("Directive \"@%s\" argument \"%s\" of type \"%s\" is required, but it was not provided."):format(Value, value, IsTypeFunction(Type) and InspectFunction(Type) or PrintFunction(Type)), p3))
						end
					end
				end
			end
		}
	}
end

function isRequiredArgumentNode(p3): boolean
	-- upvalues: Kind (copy)
	return p3.type.kind == Kind.NON_NULL_TYPE and p3.defaultValue == nil
end

return ProvidedRequiredArgumentsRuleModule