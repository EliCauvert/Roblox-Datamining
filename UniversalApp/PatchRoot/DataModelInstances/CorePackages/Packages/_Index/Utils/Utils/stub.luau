local parent = script.Parent.Parent
local _ = require(parent.LuauPolyfill)
local t = {}
local graphQLModule = require(parent.GraphQL)
local graphQLObjectType = graphQLModule.GraphQLObjectType
local graphQLInterfaceType = graphQLModule.GraphQLInterfaceType
local graphQLInputObjectType = graphQLModule.GraphQLInputObjectType
local graphQLString = graphQLModule.GraphQLString
local graphQLInt = graphQLModule.GraphQLInt
local graphQLFloat = graphQLModule.GraphQLFloat
local graphQLBoolean = graphQLModule.GraphQLBoolean
local graphQLID = graphQLModule.GraphQLID
local kind = graphQLModule.Kind
local graphQLList = graphQLModule.GraphQLList
local graphQLNonNull = graphQLModule.GraphQLNonNull

local function createNamedStub(p1, p2)
	-- upvalues: graphQLObjectType (ref), graphQLInterfaceType (ref), graphQLInputObjectType (ref), graphQLString (ref)
	return (if p2 == "object" then graphQLObjectType elseif p2 == "interface" then graphQLInterfaceType else graphQLInputObjectType).new({ name = p1, fields = { _fake = { type = graphQLString } } })
end

t.createNamedStub = createNamedStub

local function createStub(p1, p2)
	-- upvalues: kind (ref), graphQLList (ref), createStub (ref), graphQLNonNull (ref), createNamedStub (ref)
	local kind_1 = p1.kind
	
	return if kind_1 == kind.LIST_TYPE then graphQLList.new(createStub(p1.type, p2)) elseif kind_1 == kind.NON_NULL_TYPE then graphQLNonNull.new(createStub(p1.type, p2)) elseif p2 == "output" then createNamedStub(p1.name.value, "object") else createNamedStub(p1.name.value, "input")
end

t.createStub = createStub

function t.isNamedStub(p1)
	if p1.getFields ~= nil then
		local fields = p1:getFields()
		
		for i, v in fields do
			return fields[tostring(table.unpack(v))].name == "_fake"
		end
	end
	return false
end

function t.getBuiltInForStub(p2)
	-- upvalues: graphQLInt (ref), graphQLFloat (ref), graphQLString (ref), graphQLBoolean (ref), graphQLID (ref)
	local name = p2.name
	
	return if name == graphQLInt.name then graphQLInt elseif name == graphQLFloat.name then graphQLFloat elseif name == graphQLString.name then graphQLString elseif name == graphQLBoolean.name then graphQLBoolean elseif name == graphQLID.name then graphQLID else p2
end

return t