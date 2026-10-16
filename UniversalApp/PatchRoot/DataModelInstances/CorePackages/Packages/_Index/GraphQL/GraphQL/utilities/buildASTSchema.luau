local Array = require(script.Parent.Parent.Parent.LuauPolyfill).Array
local DevAssertFunction = require(script.Parent.Parent.jsutils.devAssert).devAssert
local _ = require(script.Parent.Parent.language.source)
local _ = require(script.Parent.Parent.language.ast)
local Kind = require(script.Parent.Parent.language.kinds).Kind
local ParseFunction = require(script.Parent.Parent.language.parser).parse
local AssertValidSDLFunction = require(script.Parent.Parent.validation.validate).assertValidSDL
local GraphQLSchema = require(script.Parent.Parent.type.schema).GraphQLSchema
local SpecifiedDirectives = require(script.Parent.Parent.type.directives).specifiedDirectives
local ExtendSchemaImplFunction = require(script.Parent.extendSchema).extendSchemaImpl

local function BuildASTSchema(p1, p2) --[[ Line: 44 ]]
	-- upvalues: DevAssertFunction (copy), Kind (copy), AssertValidSDLFunction (copy), ExtendSchemaImplFunction (copy), SpecifiedDirectives (copy), Array (copy), GraphQLSchema (copy)
	DevAssertFunction(p1 ~= nil and p1.kind == Kind.DOCUMENT, "Must provide valid Document AST.")
	
	if p2 ~= nil and not p2.assumeValid and not p2.assumeValidSDL then
		AssertValidSDLFunction(p1)
	end
	local ExtendSchemaImplResult = ExtendSchemaImplFunction({
		description = nil,
		extensions = nil,
		assumeValid = false,
		types = {},
		directives = {},
		extensionASTNodes = {}
	}, p1, p2)
	
	if ExtendSchemaImplResult.astNode == nil then
		for _, _type in ipairs(ExtendSchemaImplResult.types) do
			if _type.name == "Query" then
				ExtendSchemaImplResult.query = _type
			elseif _type.name == "Mutation" then
				ExtendSchemaImplResult.mutation = _type
			elseif _type.name == "Subscription" then
				ExtendSchemaImplResult.subscription = _type
			end
		end
	end
	local Directives = ExtendSchemaImplResult.directives
	
	for _, specifiedDirective in ipairs(SpecifiedDirectives) do
		if Array.every(Directives, function(p3): boolean --[[ Line: 86 ]]
			-- upvalues: specifiedDirective (copy)
			return p3.name ~= specifiedDirective.name
		end) then
			table.insert(Directives, specifiedDirective)
		end
	end
	return GraphQLSchema.new(ExtendSchemaImplResult)
end

return {
	buildASTSchema = BuildASTSchema,
	buildSchema = function(p3, p4) --[[ Line: 97 ]]
		-- upvalues: ParseFunction (copy), BuildASTSchema (copy)
		return BuildASTSchema(ParseFunction(p3, {
			noLocation = if p4 then p4.noLocation else nil,
			experimentalFragmentVariables = if p4 then p4.experimentalFragmentVariables else nil
		}), {
			assumeValidSDL = if p4 then p4.assumeValidSDL else nil,
			assumeValid = if p4 then p4.assumeValid else nil
		})
	end,
	parse = ParseFunction
}