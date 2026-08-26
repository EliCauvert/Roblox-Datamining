local array = require(script.Parent.Parent.Parent.LuauPolyfill).Array
local devAssert = require(script.Parent.Parent.jsutils.devAssert).devAssert
local _ = require(script.Parent.Parent.language.source)
local _ = require(script.Parent.Parent.language.ast)
local kind = require(script.Parent.Parent.language.kinds).Kind
local parse = require(script.Parent.Parent.language.parser).parse
local assertValidSDL = require(script.Parent.Parent.validation.validate).assertValidSDL
local graphQLSchema = require(script.Parent.Parent.type.schema).GraphQLSchema
local specifiedDirectives = require(script.Parent.Parent.type.directives).specifiedDirectives
local extendSchemaImpl = require(script.Parent.extendSchema).extendSchemaImpl

local var1 = function(p1, p2)
	-- upvalues: devAssert (ref), kind (ref), assertValidSDL (ref), extendSchemaImpl (ref), specifiedDirectives (ref), array (ref), graphQLSchema (ref)
	devAssert(p1 ~= nil and p1.kind == kind.DOCUMENT, "Must provide valid Document AST.")
	
	if p2 ~= nil and not p2.assumeValid and not p2.assumeValidSDL then
		assertValidSDL(p1)
	end
	local var2 = extendSchemaImpl({
		description = nil,
		extensions = nil,
		assumeValid = false,
		types = {},
		directives = {},
		extensionASTNodes = {}
	}, p1, p2)
	
	if var2.astNode == nil then
		for i, v in ipairs(var2.types) do
			if v.name == "Query" then
				var2.query = v
			elseif v.name == "Mutation" then
				var2.mutation = v
			elseif v.name == "Subscription" then
				var2.subscription = v
			end
		end
	end
	local directives = var2.directives
	
	for i, v in ipairs(specifiedDirectives) do
		if array.every(directives, function(p3)
			-- upvalues: v (ref)
			return p3.name ~= v.name
		end) then
			table.insert(directives, v)
		end
	end
	return graphQLSchema.new(var2)
end

return {
	buildASTSchema = var1,
	buildSchema = function(p3, p4)
		-- upvalues: parse (ref), var1 (ref)
		return var1(parse(p3, {
			noLocation = if p4 then p4.noLocation else nil,
			experimentalFragmentVariables = if p4 then p4.experimentalFragmentVariables else nil
		}), {
			assumeValidSDL = if p4 then p4.assumeValidSDL else nil,
			assumeValid = if p4 then p4.assumeValid else nil
		})
	end,
	parse = parse
}