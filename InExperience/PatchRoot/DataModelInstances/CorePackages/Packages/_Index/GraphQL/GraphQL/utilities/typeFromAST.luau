local parent = script.Parent.Parent
local inspect = require(parent.jsutils.inspect).inspect
local invariant = require(parent.jsutils.invariant).invariant
local _ = require(parent.language.ast)
local kind = require(parent.language.kinds).Kind
local definitionModule = require(parent.type.definition)
local graphQLList = definitionModule.GraphQLList
local graphQLNonNull = definitionModule.GraphQLNonNull
local _ = require(parent.type.schema)

local function typeFromAST(p1, p2)
	-- upvalues: kind (ref), typeFromAST (ref), graphQLList (ref), graphQLNonNull (ref), invariant (ref), inspect (ref)
	local _ = nil
	
	if p2.kind == kind.LIST_TYPE then
		local var1 = typeFromAST(p1, p2.type)
		
		return var1 and graphQLList.new(var1)
	elseif p2.kind == kind.NON_NULL_TYPE then
		local var2 = typeFromAST(p1, p2.type)
		
		return var2 and graphQLNonNull.new(var2)
	elseif p2.kind == kind.NAMED_TYPE then
		return p1:getType(p2.name.value)
	end
	invariant(false, "Unexpected type node: " .. inspect(p2))
	
	return nil
end

return { typeFromAST = typeFromAST }