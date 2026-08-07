-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:38 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local inspect = require(parent.jsutils.inspect).inspect
local invariant = require(parent.jsutils.invariant).invariant
local _ = require(parent.language.ast)
local kind = require(parent.language.kinds).Kind
local definitionModule = require(parent.type.definition)
local graphQLList = definitionModule.GraphQLList
local graphQLNonNull = definitionModule.GraphQLNonNull
local _ = require(parent.type.schema)

local function typeFromAST(p0, p1) --[[ line: 33 ]]
	-- upvalues: kind (ref), typeFromAST (ref), graphQLList (ref), graphQLNonNull (ref), invariant (ref), inspect (ref)
	local _ = nil
	
	if p1.kind == kind.LIST_TYPE then
		local var2 = typeFromAST(p0, p1.type)
		
		return var2 and graphQLList.new(var2)
	elseif p1.kind == kind.NON_NULL_TYPE then
		local var3 = typeFromAST(p0, p1.type)
		
		return var3 and graphQLNonNull.new(var3)
	elseif p1.kind == kind.NAMED_TYPE then
		return p0:getType(p1.name.value)
	end
	invariant(false, "Unexpected type node: " .. inspect(p1))
	
	return nil
end

return { typeFromAST = typeFromAST }