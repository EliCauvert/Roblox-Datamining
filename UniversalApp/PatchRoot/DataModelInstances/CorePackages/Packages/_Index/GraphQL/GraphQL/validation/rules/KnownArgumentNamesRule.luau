local Parent = script.Parent.Parent.Parent
local LuauPolyfillModule = require(Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Object = LuauPolyfillModule.Object
local GraphQLError = require(Parent.error.GraphQLError).GraphQLError
local Jsutils = Parent.jsutils
local DidYouMeanFunction = require(Jsutils.didYouMean).didYouMean
local SuggestionListFunction = require(Jsutils.suggestionList).suggestionList
local Kind = require(Parent.language.kinds).Kind
local SpecifiedDirectives = require(Parent.type.directives).specifiedDirectives
local KnownArgumentNamesRuleModule = {}

function KnownArgumentNamesRuleModule.KnownArgumentNamesRule(p1) --[[ Line: 31 ]]
	-- upvalues: Object (copy), KnownArgumentNamesRuleModule (copy), Array (copy), SuggestionListFunction (copy), GraphQLError (copy), DidYouMeanFunction (copy)
	return Object.assign({}, KnownArgumentNamesRuleModule.KnownArgumentNamesOnDirectivesRule(p1), {
		Argument = function(_, p2) --[[ Line: 33 ]]
			-- upvalues: p1 (copy), Array (upval), SuggestionListFunction (upval), GraphQLError (upval), DidYouMeanFunction (upval)
			local FieldDef = p1:getFieldDef()
			local ParentType = p1:getParentType()
			
			if not p1:getArgument() and FieldDef and ParentType then
				local Value = p2.name.value
				p1:reportError(GraphQLError.new(("Unknown argument \"%s\" on field \"%s.%s\"."):format(Value, ParentType.name, FieldDef.name) .. DidYouMeanFunction((SuggestionListFunction(Value, (Array.map(FieldDef.args, function(p3) --[[ Line: 40 ]]
					return p3.name
				end))))), p2))
			end
		end
	})
end

function KnownArgumentNamesRuleModule.KnownArgumentNamesOnDirectivesRule(p1) --[[ Line: 62 ]]
	-- upvalues: SpecifiedDirectives (copy), Array (copy), Kind (copy), SuggestionListFunction (copy), GraphQLError (copy), DidYouMeanFunction (copy)
	local MapResults = {}
	local Schema = p1:getSchema()
	local Directives = if Schema then Schema:getDirectives() else SpecifiedDirectives
	for _, directive in ipairs(Directives) do
		MapResults[directive.name] = Array.map(directive.args, function(p2) --[[ Line: 71 ]]
			return p2.name
		end)
	end
	for _, definition in ipairs(p1:getDocument().definitions) do
		if definition.kind == Kind.DIRECTIVE_DEFINITION then
			MapResults[definition.name.value] = Array.map(definition.arguments or {}, function(p2) --[[ Line: 82 ]]
				return p2.name.value
			end)
		end
	end
	return {
		Directive = function(_, p2): boolean --[[ Line: 89 ]]
			-- upvalues: MapResults (copy), Array (upval), SuggestionListFunction (upval), p1 (copy), GraphQLError (upval), DidYouMeanFunction (upval)
			local Value = p2.name.value
			local MapResult = MapResults[Value]
			
			if p2.arguments and MapResult then
				for _, argument in ipairs(p2.arguments) do
					local Value1 = argument.name.value
					
					if Array.indexOf(MapResult, Value1) == -1 then
						p1:reportError(GraphQLError.new(("Unknown argument \"%s\" on directive \"@%s\"."):format(Value1, Value) .. DidYouMeanFunction((SuggestionListFunction(Value1, MapResult))), argument))
					end
				end
			end
			return false
		end
	}
end

return KnownArgumentNamesRuleModule