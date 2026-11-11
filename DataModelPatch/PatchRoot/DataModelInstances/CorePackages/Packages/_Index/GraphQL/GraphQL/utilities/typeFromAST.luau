local Parent = script.Parent.Parent
local InspectFunction = require(Parent.jsutils.inspect).inspect
local InvariantFunction = require(Parent.jsutils.invariant).invariant
local _ = require(Parent.language.ast)
local Kind = require(Parent.language.kinds).Kind
local DefinitionModule = require(Parent.type.definition)
local GraphQLList = DefinitionModule.GraphQLList
local GraphQLNonNull = DefinitionModule.GraphQLNonNull
local _ = require(Parent.type.schema)

local function typeFromAST(p1, Type)
	-- upvalues: Kind (copy), typeFromAST (copy), GraphQLList (copy), GraphQLNonNull (copy), InvariantFunction (copy), InspectFunction (copy)
	if Type.kind == Kind.LIST_TYPE then
		local TypeFromASTResult = typeFromAST(p1, Type.type)
		
		return TypeFromASTResult and GraphQLList.new(TypeFromASTResult)
	elseif Type.kind == Kind.NON_NULL_TYPE then
		local TypeFromASTResult = typeFromAST(p1, Type.type)
		
		return TypeFromASTResult and GraphQLNonNull.new(TypeFromASTResult)
	elseif Type.kind == Kind.NAMED_TYPE then
		return p1:getType(Type.name.value)
	else
		InvariantFunction(false, "Unexpected type node: " .. InspectFunction(Type))
		
		return nil
	end
end

return { typeFromAST = typeFromAST }