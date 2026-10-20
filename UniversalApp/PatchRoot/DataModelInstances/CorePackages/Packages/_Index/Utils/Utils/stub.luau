local Parent = script.Parent.Parent
local _ = require(Parent.LuauPolyfill)
local GraphQLModule = require(Parent.GraphQL)
local GraphQLObjectType = GraphQLModule.GraphQLObjectType
local GraphQLInterfaceType = GraphQLModule.GraphQLInterfaceType
local GraphQLInputObjectType = GraphQLModule.GraphQLInputObjectType
local GraphQLString = GraphQLModule.GraphQLString
local GraphQLInt = GraphQLModule.GraphQLInt
local GraphQLFloat = GraphQLModule.GraphQLFloat
local GraphQLBoolean = GraphQLModule.GraphQLBoolean
local GraphQLID = GraphQLModule.GraphQLID
local Kind = GraphQLModule.Kind
local GraphQLList = GraphQLModule.GraphQLList
local GraphQLNonNull = GraphQLModule.GraphQLNonNull

local function createNamedStub(Name, p1)
	-- upvalues: GraphQLObjectType (copy), GraphQLInterfaceType (copy), GraphQLInputObjectType (copy), GraphQLString (copy)
	return (if p1 == "object" then GraphQLObjectType elseif p1 == "interface" then GraphQLInterfaceType else GraphQLInputObjectType).new({
		name = Name,
		fields = { _fake = { type = GraphQLString } }
	})
end

local function createStub(Type, p1)
	-- upvalues: Kind (copy), GraphQLList (copy), createStub (copy), GraphQLNonNull (copy), createNamedStub (copy)
	local Kind1 = Type.kind
	
	return if Kind1 == Kind.LIST_TYPE then GraphQLList.new(createStub(Type.type, p1)) elseif Kind1 == Kind.NON_NULL_TYPE then GraphQLNonNull.new(createStub(Type.type, p1)) elseif p1 == "output" then createNamedStub(Type.name.value, "object") else createNamedStub(Type.name.value, "input")
end

return {
	createNamedStub = createNamedStub,
	createStub = createStub,
	isNamedStub = function(p1): boolean
		if p1.getFields ~= nil then
			local Fields = p1:getFields()
			
			for _, field in Fields do
				return Fields[tostring((table.unpack(field)))].name == "_fake"
			end
		end
		return false
	end,
	getBuiltInForStub = function(p2)
		-- upvalues: GraphQLInt (copy), GraphQLFloat (copy), GraphQLString (copy), GraphQLBoolean (copy), GraphQLID (copy)
		local Name = p2.name
		
		return if Name == GraphQLInt.name then GraphQLInt elseif Name == GraphQLFloat.name then GraphQLFloat elseif Name == GraphQLString.name then GraphQLString elseif Name == GraphQLBoolean.name then GraphQLBoolean elseif Name == GraphQLID.name then GraphQLID else p2
	end
}