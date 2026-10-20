local Parent = script.Parent
local Parent1 = Parent.Parent
local Error1 = require(Parent1.LuauPolyfill).Error
local PromiseModule = require(Parent1.Promise)
local _ = require(Parent.jsutils.PromiseOrValue)
local IsPromiseFunction = require(Parent.jsutils.isPromise).isPromise
local _ = require(Parent.language.source)
local ParseFunction = require(Parent.language.parser).parse
local _ = require(Parent.type.definition)
local _ = require(Parent.type.schema)
local ValidateFunction = require(Parent.validation.validate).validate
local ValidateSchemaFunction = require(Parent.type.validate).validateSchema
local ExecuteFunction = require(Parent.execution.execute).execute
local Callback = nil
local GraphqlModule = {
	graphql = function(p1)
		-- upvalues: PromiseModule (copy), Callback (ref)
		return PromiseModule.new(function(Callback1)
			-- upvalues: Callback (upval), p1 (copy)
			return Callback1(Callback(p1))
		end)
	end,
	graphqlSync = function(p1)
		-- upvalues: Callback (ref), IsPromiseFunction (copy), Error1 (copy)
		local CallbackResult = Callback(p1)
		
		if IsPromiseFunction(CallbackResult) then
			error(Error1.new("GraphQL execution failed to complete synchronously."))
		end
		return CallbackResult
	end
}

Callback = function(p1)
	-- upvalues: ValidateSchemaFunction (copy), ParseFunction (copy), ValidateFunction (copy), ExecuteFunction (copy)
	local Schema = p1.schema
	local Source = p1.source
	local RootValue = p1.rootValue
	local ContextValue = p1.contextValue
	local VariableValues = p1.variableValues
	local OperationName = p1.operationName
	local FieldResolver = p1.fieldResolver
	local TypeResolver = p1.typeResolver
	local ValidateSchemaResult = ValidateSchemaFunction(Schema)
	
	if #ValidateSchemaResult > 0 then
		return { errors = ValidateSchemaResult }
	end
	local Document = nil
	local Success, Result = pcall(function()
		-- upvalues: Document (ref), ParseFunction (upval), Source (copy)
		Document = ParseFunction(Source)
	end)
	
	if Success then
		local ValidateResult = ValidateFunction(Schema, Document)
		
		return if #ValidateResult > 0 then { errors = ValidateResult } else ExecuteFunction({
			schema = Schema,
			document = Document,
			rootValue = RootValue,
			contextValue = ContextValue,
			variableValues = VariableValues,
			operationName = OperationName,
			fieldResolver = FieldResolver,
			typeResolver = TypeResolver
		})
	else
		return { errors = { Result } }
	end
end

return GraphqlModule