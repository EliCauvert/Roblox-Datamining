local parent = script.Parent
local parent_1 = parent.Parent
local error = require(parent_1.LuauPolyfill).Error
local promiseModule = require(parent_1.Promise)
local _ = require(parent.jsutils.PromiseOrValue)
local isPromise = require(parent.jsutils.isPromise).isPromise
local _ = require(parent.language.source)
local parse = require(parent.language.parser).parse
local _ = require(parent.type.definition)
local _ = require(parent.type.schema)
local validate = require(parent.validation.validate).validate
local validateSchema = require(parent.type.validate).validateSchema
local execute = require(parent.execution.execute).execute
local t = {}
local graphqlImpl = nil

function t.graphql(p0)
	-- upvalues: promiseModule (ref), graphqlImpl (write)
	return promiseModule.new(function(p1)
		-- upvalues: graphqlImpl (copy), p0 (ref)
		return p1(graphqlImpl(p0))
	end)
end

function t.graphqlSync(p2)
	-- upvalues: graphqlImpl (write), isPromise (ref), error (ref)
	local var3 = graphqlImpl(p2)
	
	if isPromise(var3) then
		error(error.new("GraphQL execution failed to complete synchronously."))
	end
	return var3
end

graphqlImpl = function(p3)
	-- upvalues: validateSchema (ref), parse (ref), validate (ref), execute (ref)
	local schema = p3.schema
	local source = p3.source
	local rootValue = p3.rootValue
	local contextValue = p3.contextValue
	local variableValues = p3.variableValues
	local operationName = p3.operationName
	local fieldResolver = p3.fieldResolver
	local typeResolver = p3.typeResolver
	local var4 = validateSchema(schema)
	
	if #var4 > 0 then
		return { errors = var4 }
	end
	local var5 = nil
	local ok, status = pcall(function()
		-- upvalues: var5 (write), parse (copy), source (ref)
		var5 = parse(source)
	end)
	
	if not ok then
		return { errors = { status } }
	end
	local var6 = validate(schema, var5)
	
	return if #var6 > 0 then { errors = var6 } else execute({
		schema = schema,
		document = var5,
		rootValue = rootValue,
		contextValue = contextValue,
		variableValues = variableValues,
		operationName = operationName,
		fieldResolver = fieldResolver,
		typeResolver = typeResolver
	})
end

return t