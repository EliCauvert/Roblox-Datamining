-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:37 2026 Pacific Standard Time.

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

local var0 = function(p0, p1) --[[ line: 44 ]]
	-- upvalues: devAssert (ref), kind (ref), assertValidSDL (ref), extendSchemaImpl (ref), specifiedDirectives (ref), array (ref), graphQLSchema (ref)
	devAssert(p0 ~= nil and p0.kind == kind.DOCUMENT, "Must provide valid Document AST.")
	
	if p1 ~= nil and not p1.assumeValid and not p1.assumeValidSDL then
		assertValidSDL(p0)
	end
	local var1 = extendSchemaImpl({
		description = nil,
		extensions = nil,
		assumeValid = false,
		types = {},
		directives = {},
		extensionASTNodes = {}
	}, p0, p1)
	
	if var1.astNode == nil then
		for i, v in ipairs(var1.types) do
			if v.name == "Query" then
				var1.query = v
			elseif v.name == "Mutation" then
				var1.mutation = v
			elseif v.name == "Subscription" then
				var1.subscription = v
			end
		end
	end
	local directives = var1.directives
	
	for i, v in ipairs(specifiedDirectives) do
		if array.every(directives, function(p2) --[[ line: 86 ]]
			-- upvalues: v (ref)
			return p2.name ~= v.name
		end) then
			table.insert(directives, v)
		end
	end
	return graphQLSchema.new(var1)
end

return {
	buildASTSchema = var0,
	buildSchema = function(p3, p4) --[[ line: 97 ]]
		-- upvalues: parse (ref), var0 (ref)
		return var0(parse(p3, {
			noLocation = if p4 then p4.noLocation else nil,
			experimentalFragmentVariables = if p4 then p4.experimentalFragmentVariables else nil
		}), {
			assumeValidSDL = if p4 then p4.assumeValidSDL else nil,
			assumeValid = if p4 then p4.assumeValid else nil
		})
	end,
	parse = parse
}