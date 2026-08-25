local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local error = luauPolyfillModule.Error
local map = luauPolyfillModule.Map
local object = luauPolyfillModule.Object
local coerceToMap = luauPolyfillModule.coerceToMap
local _ = require(parent.jsutils.ObjMap)
local _ = require(script.Parent.Parent.jsutils.ObjMap)
local inspect = require(script.Parent.Parent.jsutils.inspect).inspect
local toObjMap = require(script.Parent.Parent.jsutils.toObjMap).toObjMap
local devAssert = require(script.Parent.Parent.jsutils.devAssert).devAssert
local instanceOfModule = require(script.Parent.Parent.jsutils.instanceOf)
local isObjectLike = require(script.Parent.Parent.jsutils.isObjectLike).isObjectLike
local _ = require(script.Parent.Parent.language.ast)
local directiveLocation = require(script.Parent.Parent.language.directiveLocation).DirectiveLocation
local definitionModule = require(script.Parent.definition)
local scalarsModule = require(script.Parent.scalars)
local graphQLString = scalarsModule.GraphQLString
local graphQLBoolean = scalarsModule.GraphQLBoolean
local argsToArgsConfig = definitionModule.argsToArgsConfig
local graphQLNonNull = definitionModule.GraphQLNonNull
local t = nil

function isDirective(p0)
	-- upvalues: instanceOfModule (ref), t (write)
	return instanceOfModule(p0, t)
end

function assertDirective(p1)
	-- upvalues: error (ref), inspect (ref)
	if not isDirective(p1) then
		error(error.new(("Expected %s to be a GraphQL directive."):format(inspect(p1))))
	end
	return p1
end

t = {}
t.__index = t

function t.new(p2)
	-- upvalues: toObjMap (ref), devAssert (ref), array (ref), isObjectLike (ref), instanceOfModule (ref), map (ref), coerceToMap (ref), t (write)
	local t_1 = {
		name = p2.name,
		description = p2.description,
		locations = p2.locations,
		isRepeatable = if p2.isRepeatable then true else false,
		extensions = p2.extensions and toObjMap(p2.extensions),
		astNode = p2.astNode
	}
	devAssert(p2.name, "Directive must be named.")
	devAssert(array.isArray(p2.locations), ("@%s locations must be an Array."):format(p2.name))
	local var11 = if p2.args then p2.args else {}
	devAssert(isObjectLike(var11) and (not (array.isArray(var11) and next(var11) ~= nil) or instanceOfModule(var11, map)), ("@%s args must be an object with argument names as keys."):format(p2.name))
	t_1.args = array.map(coerceToMap(var11):entries(), function(p3)
		-- upvalues: toObjMap (copy)
		local var12 = p3[2]
		
		return {
			name = p3[1],
			description = var12.description,
			type = var12.type,
			defaultValue = var12.defaultValue,
			deprecationReason = var12.deprecationReason,
			extensions = var12.extensions and toObjMap(var12.extensions),
			astNode = var12.astNode
		}
	end)
	
	return setmetatable(t_1, t)
end

function t:toConfig()
	-- upvalues: argsToArgsConfig (ref)
	return {
		name = self.name,
		description = self.description,
		locations = self.locations,
		args = argsToArgsConfig(self.args),
		isRepeatable = self.isRepeatable,
		extensions = self.extensions,
		astNode = self.astNode
	}
end

function t:__tostring()
	return self:toString()
end

function t:toString()
	return "@" .. self.name
end

function t:toJSON()
	return self:toString()
end

local var5 = t.new({
	name = "include",
	description = "Directs the executor to include this field or fragment only when the `if` argument is true.",
	locations = {
		directiveLocation.FIELD,
		directiveLocation.FRAGMENT_SPREAD,
		directiveLocation.INLINE_FRAGMENT
	},
	args = map.new({
		{
			"if",
			{
				description = "Included when true.",
				type = graphQLNonNull.new(graphQLBoolean)
			}
		}
	})
})
local var6 = t.new({
	name = "skip",
	description = "Directs the executor to skip this field or fragment when the `if` argument is true.",
	locations = {
		directiveLocation.FIELD,
		directiveLocation.FRAGMENT_SPREAD,
		directiveLocation.INLINE_FRAGMENT
	},
	args = map.new({
		{
			"if",
			{
				description = "Skipped when true.",
				type = graphQLNonNull.new(graphQLBoolean)
			}
		}
	})
})
local var7 = t.new({
	name = "deprecated",
	description = "Marks an element of a GraphQL schema as no longer supported.",
	locations = {
		directiveLocation.FIELD_DEFINITION,
		directiveLocation.ARGUMENT_DEFINITION,
		directiveLocation.INPUT_FIELD_DEFINITION,
		directiveLocation.ENUM_VALUE
	},
	args = map.new({
		{
			"reason",
			{
				description = "Explains why this element was deprecated, usually also including a suggestion for how to access supported similar data. Formatted using the Markdown syntax, as specified by [CommonMark](https://commonmark.org/).",
				defaultValue = "No longer supported",
				type = graphQLString
			}
		}
	})
})
local var8 = t.new({
	name = "specifiedBy",
	description = "Exposes a URL that specifies the behaviour of this scalar.",
	locations = { directiveLocation.SCALAR },
	args = map.new({
		{
			"url",
			{
				description = "The URL that specifies the behaviour of this scalar.",
				type = graphQLNonNull.new(graphQLString)
			}
		}
	})
})
local var9 = object.freeze({ var5, var6, var7, var8 })

return {
	DEFAULT_DEPRECATION_REASON = "No longer supported",
	isDirective = isDirective,
	assertDirective = assertDirective,
	GraphQLDirective = t,
	GraphQLIncludeDirective = var5,
	GraphQLSkipDirective = var6,
	GraphQLDeprecatedDirective = var7,
	GraphQLSpecifiedByDirective = var8,
	specifiedDirectives = var9,
	isSpecifiedDirective = function(p4)
		-- upvalues: array (ref), var9 (ref)
		return array.some(var9, function(p5)
			-- upvalues: p4 (ref)
			return p5.name == p4.name
		end)
	end
}