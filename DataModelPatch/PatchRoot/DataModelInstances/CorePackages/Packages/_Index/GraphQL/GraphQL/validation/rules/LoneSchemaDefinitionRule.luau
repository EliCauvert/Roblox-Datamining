local Parent = script.Parent.Parent.Parent
local GraphQLError = require(Parent.error.GraphQLError).GraphQLError
local IsNillishModule = require(Parent.luaUtils.isNillish)
local IsNillishFunction = IsNillishModule.isNillish
local IsNotNillishFunction = IsNillishModule.isNotNillish

return {
	LoneSchemaDefinitionRule = function(p1)
		-- upvalues: IsNillishFunction (copy), IsNotNillishFunction (copy), GraphQLError (copy)
		local Schema = p1:getSchema()
		local AstNode = nil
		
		if Schema then
			AstNode = Schema.astNode
			
			if IsNillishFunction(AstNode) then
				AstNode = Schema:getQueryType()
			end
			if IsNillishFunction(AstNode) then
				AstNode = Schema:getMutationType()
			end
			if IsNillishFunction(AstNode) then
				AstNode = Schema:getSubscriptionType()
			end
		end
		local Count = 0
		
		return {
			SchemaDefinition = function(_, p2)
				-- upvalues: IsNotNillishFunction (upval), AstNode (ref), p1 (copy), GraphQLError (upval), Count (ref)
				if IsNotNillishFunction(AstNode) then
					p1:reportError(GraphQLError.new("Cannot define a new schema within a schema extension.", p2))
					
					return
				end
				if Count > 0 then
					p1:reportError(GraphQLError.new("Must provide only one schema definition.", p2))
				end
				Count += 1
			end
		}
	end
}