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

function isDirective(p1)
	-- upvalues: instanceOfModule (ref), t (write)
	return instanceOfModule(p1, t)
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

function t.new(p1)
	-- upvalues: toObjMap (ref), devAssert (ref), array (ref), isObjectLike (ref), instanceOfModule (ref), map (ref), coerceToMap (ref), t (write)
	local t_1 = {
		name = p1.name,
		description = p1.description,
		locations = p1.locations,
		isRepeatable = if p1.isRepeatable then true else false,
		extensions = p1.extensions and toObjMap(p1.extensions),
		astNode = p1.astNode
	}
	devAssert(p1.name, "Directive must be named.")
	devAssert(array.isArray(p1.locations), ("@%s locations must be an Array."):format(p1.name))
	local var1 = if p1.args then p1.args else {}
	devAssert(isObjectLike(var1) and (not (array.isArray(var1) and next(var1) ~= nil) or instanceOfModule(var1, map)), ("@%s args must be an object with argument names as keys."):format(p1.name))
	t_1.args = array.map(coerceToMap(var1):entries(), function(p2)
		-- upvalues: toObjMap (copy)
		local var2 = p2[2]
		
		return {
			name = p2[1],
			description = var2.description,
			type = var2.type,
			defaultValue = var2.defaultValue,
			deprecationReason = var2.deprecationReason,
			extensions = var2.extensions and toObjMap(var2.extensions),
			astNode = var2.astNode
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

local var1 = t.new({
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
local var2 = t.new({
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
local var3 = t.new({
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
local var4 = t.new({
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
local var5 = object.freeze({ var1, var2, var3, var4 })

return {
	DEFAULT_DEPRECATION_REASON = "No longer supported",
	isDirective = isDirective,
	assertDirective = assertDirective,
	GraphQLDirective = t,
	GraphQLIncludeDirective = var1,
	GraphQLSkipDirective = var2,
	GraphQLDeprecatedDirective = var3,
	GraphQLSpecifiedByDirective = var4,
	specifiedDirectives = var5,
	isSpecifiedDirective = function(p1)
		-- upvalues: array (ref), var5 (ref)
		return array.some(var5, function(p2)
			-- upvalues: p1 (ref)
			return p2.name == p1.name
		end)
	end
}