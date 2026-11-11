local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Error1 = LuauPolyfillModule.Error
local Map = LuauPolyfillModule.Map
local Object = LuauPolyfillModule.Object
local CoerceToMapFunction = LuauPolyfillModule.coerceToMap
local _ = require(Parent.jsutils.ObjMap)
local _ = require(script.Parent.Parent.jsutils.ObjMap)
local InspectFunction = require(script.Parent.Parent.jsutils.inspect).inspect
local ToObjMapFunction = require(script.Parent.Parent.jsutils.toObjMap).toObjMap
local DevAssertFunction = require(script.Parent.Parent.jsutils.devAssert).devAssert
local InstanceOfModule = require(script.Parent.Parent.jsutils.instanceOf)
local IsObjectLikeFunction = require(script.Parent.Parent.jsutils.isObjectLike).isObjectLike
local _ = require(script.Parent.Parent.language.ast)
local DirectiveLocation = require(script.Parent.Parent.language.directiveLocation).DirectiveLocation
local DefinitionModule = require(script.Parent.definition)
local ScalarsModule = require(script.Parent.scalars)
local GraphQLString = ScalarsModule.GraphQLString
local GraphQLBoolean = ScalarsModule.GraphQLBoolean
local ArgsToArgsConfigFunction = DefinitionModule.argsToArgsConfig
local GraphQLNonNull = DefinitionModule.GraphQLNonNull
local Module = nil

function isDirective(p1)
	-- upvalues: InstanceOfModule (copy), Module (ref)
	return InstanceOfModule(p1, Module)
end

function assertDirective(p1)
	-- upvalues: Error1 (copy), InspectFunction (copy)
	if not isDirective(p1) then
		error(Error1.new(("Expected %s to be a GraphQL directive."):format(InspectFunction(p1))))
	end
	return p1
end

Module = {}
Module.__index = Module

function Module.new(GraphQLBoolean)
	-- upvalues: ToObjMapFunction (copy), DevAssertFunction (copy), Array (copy), IsObjectLikeFunction (copy), InstanceOfModule (copy), Map (copy), CoerceToMapFunction (copy), Module (ref)
	local config = {
		name = GraphQLBoolean.name,
		description = GraphQLBoolean.description,
		locations = GraphQLBoolean.locations,
		isRepeatable = if GraphQLBoolean.isRepeatable then true else false,
		extensions = GraphQLBoolean.extensions and ToObjMapFunction(GraphQLBoolean.extensions),
		astNode = GraphQLBoolean.astNode
	}
	DevAssertFunction(GraphQLBoolean.name, "Directive must be named.")
	DevAssertFunction(Array.isArray(GraphQLBoolean.locations), ("@%s locations must be an Array."):format(GraphQLBoolean.name))
	local Args = if GraphQLBoolean.args then GraphQLBoolean.args else {}
	DevAssertFunction(IsObjectLikeFunction(Args) and not (Array.isArray(Args) and next(Args) ~= nil) or InstanceOfModule(Args, Map), ("@%s args must be an object with argument names as keys."):format(GraphQLBoolean.name))
	config.args = Array.map(CoerceToMapFunction(Args):entries(), function(Entry)
		-- upvalues: ToObjMapFunction (upval)
		local Entry1 = Entry[2]
		
		return {
			name = Entry[1],
			description = Entry1.description,
			type = Entry1.type,
			defaultValue = Entry1.defaultValue,
			deprecationReason = Entry1.deprecationReason,
			extensions = Entry1.extensions and ToObjMapFunction(Entry1.extensions),
			astNode = Entry1.astNode
		}
	end)
	
	return (setmetatable(config, Module))
end

function Module:toConfig()
	-- upvalues: ArgsToArgsConfigFunction (copy)
	return {
		name = self.name,
		description = self.description,
		locations = self.locations,
		args = ArgsToArgsConfigFunction(self.args),
		isRepeatable = self.isRepeatable,
		extensions = self.extensions,
		astNode = self.astNode
	}
end

function Module:__tostring()
	return self:toString()
end

function Module:toString(): string
	return "@" .. self.name
end

function Module:toJSON()
	return self:toString()
end

local Include = Module.new({
	name = "include",
	description = "Directs the executor to include this field or fragment only when the `if` argument is true.",
	locations = {
		DirectiveLocation.FIELD,
		DirectiveLocation.FRAGMENT_SPREAD,
		DirectiveLocation.INLINE_FRAGMENT
	},
	args = Map.new({
		{
			"if",
			{
				description = "Included when true.",
				type = GraphQLNonNull.new(GraphQLBoolean)
			}
		}
	})
})
local Skip = Module.new({
	name = "skip",
	description = "Directs the executor to skip this field or fragment when the `if` argument is true.",
	locations = {
		DirectiveLocation.FIELD,
		DirectiveLocation.FRAGMENT_SPREAD,
		DirectiveLocation.INLINE_FRAGMENT
	},
	args = Map.new({
		{
			"if",
			{
				description = "Skipped when true.",
				type = GraphQLNonNull.new(GraphQLBoolean)
			}
		}
	})
})
local Deprecated = Module.new({
	name = "deprecated",
	description = "Marks an element of a GraphQL schema as no longer supported.",
	locations = {
		DirectiveLocation.FIELD_DEFINITION,
		DirectiveLocation.ARGUMENT_DEFINITION,
		DirectiveLocation.INPUT_FIELD_DEFINITION,
		DirectiveLocation.ENUM_VALUE
	},
	args = Map.new({
		{
			"reason",
			{
				description = "Explains why this element was deprecated, usually also including a suggestion for how to access supported similar data. Formatted using the Markdown syntax, as specified by [CommonMark](https://commonmark.org/).",
				defaultValue = "No longer supported",
				type = GraphQLString
			}
		}
	})
})
local SpecifiedBy = Module.new({
	name = "specifiedBy",
	description = "Exposes a URL that specifies the behaviour of this scalar.",
	locations = { DirectiveLocation.SCALAR },
	args = Map.new({
		{
			"url",
			{
				description = "The URL that specifies the behaviour of this scalar.",
				type = GraphQLNonNull.new(GraphQLString)
			}
		}
	})
})
local FreezeResult = Object.freeze({ Include, Skip, Deprecated, SpecifiedBy })

return {
	DEFAULT_DEPRECATION_REASON = "No longer supported",
	isDirective = isDirective,
	assertDirective = assertDirective,
	GraphQLDirective = Module,
	GraphQLIncludeDirective = Include,
	GraphQLSkipDirective = Skip,
	GraphQLDeprecatedDirective = Deprecated,
	GraphQLSpecifiedByDirective = SpecifiedBy,
	specifiedDirectives = FreezeResult,
	isSpecifiedDirective = function(p1)
		-- upvalues: Array (copy), FreezeResult (copy)
		return Array.some(FreezeResult, function(p2): boolean
			-- upvalues: p1 (copy)
			return p2.name == p1.name
		end)
	end
}