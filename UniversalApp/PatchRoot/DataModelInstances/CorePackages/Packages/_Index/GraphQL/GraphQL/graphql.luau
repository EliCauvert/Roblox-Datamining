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

function t.graphql(p1)
	-- upvalues: promiseModule (ref), graphqlImpl (write)
	return promiseModule.new(function(p2)
		-- upvalues: graphqlImpl (copy), p1 (ref)
		return p2(graphqlImpl(p1))
	end)
end

function t.graphqlSync(p1)
	-- upvalues: graphqlImpl (write), isPromise (ref), error (ref)
	local var1 = graphqlImpl(p1)
	
	if isPromise(var1) then
		error(error.new("GraphQL execution failed to complete synchronously."))
	end
	return var1
end

graphqlImpl = function(p1)
	-- upvalues: validateSchema (ref), parse (ref), validate (ref), execute (ref)
	local schema = p1.schema
	local source = p1.source
	local rootValue = p1.rootValue
	local contextValue = p1.contextValue
	local variableValues = p1.variableValues
	local operationName = p1.operationName
	local fieldResolver = p1.fieldResolver
	local typeResolver = p1.typeResolver
	local var1 = validateSchema(schema)
	
	if #var1 > 0 then
		return { errors = var1 }
	end
	local var2 = nil
	local ok, status = pcall(function()
		-- upvalues: var2 (write), parse (copy), source (ref)
		var2 = parse(source)
	end)
	
	if not ok then
		return { errors = { status } }
	end
	local var3 = validate(schema, var2)
	
	return if #var3 > 0 then { errors = var3 } else execute({
		schema = schema,
		document = var2,
		rootValue = rootValue,
		contextValue = contextValue,
		variableValues = variableValues,
		operationName = operationName,
		fieldResolver = fieldResolver,
		typeResolver = typeResolver
	})
end

return t