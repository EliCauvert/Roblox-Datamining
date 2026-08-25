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

local function createNamedStub(p0, p1)
	-- upvalues: graphQLObjectType (ref), graphQLInterfaceType (ref), graphQLInputObjectType (ref), graphQLString (ref)
	return (if p1 == "object" then graphQLObjectType elseif p1 == "interface" then graphQLInterfaceType else graphQLInputObjectType).new({ name = p0, fields = { _fake = { type = graphQLString } } })
end

t.createNamedStub = createNamedStub

local function createStub(p2, p3)
	-- upvalues: kind (ref), graphQLList (ref), createStub (ref), graphQLNonNull (ref), createNamedStub (ref)
	local kind_1 = p2.kind
	
	return if kind_1 == kind.LIST_TYPE then graphQLList.new(createStub(p2.type, p3)) elseif kind_1 == kind.NON_NULL_TYPE then graphQLNonNull.new(createStub(p2.type, p3)) elseif p3 == "output" then createNamedStub(p2.name.value, "object") else createNamedStub(p2.name.value, "input")
end

t.createStub = createStub

function t.isNamedStub(p4)
	if p4.getFields ~= nil then
		local fields = p4:getFields()
		
		for i, v in fields do
			return fields[tostring(table.unpack(v))].name == "_fake"
		end
	end
	return false
end

function t.getBuiltInForStub(p5)
	-- upvalues: graphQLInt (ref), graphQLFloat (ref), graphQLString (ref), graphQLBoolean (ref), graphQLID (ref)
	local name = p5.name
	
	return if name == graphQLInt.name then graphQLInt elseif name == graphQLFloat.name then graphQLFloat elseif name == graphQLString.name then graphQLString elseif name == graphQLBoolean.name then graphQLBoolean elseif name == graphQLID.name then graphQLID else p5
end

return t