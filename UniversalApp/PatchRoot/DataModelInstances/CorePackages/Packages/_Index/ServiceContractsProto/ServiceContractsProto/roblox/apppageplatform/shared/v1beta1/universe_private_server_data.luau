local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
		private_servers_enabled = if p1 == nil or p1.private_servers_enabled == nil then false else p1.private_servers_enabled
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.private_servers_enabled then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var7 = protoModule.writeVarInt(var2, var3, if self.private_servers_enabled then 1 else 0)
		buff = var2
		var1 = var3
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref)
	local var1 = t_1.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local _ = nil
		local var3, var4, var5 = protoModule.readTag(p1, var2)
		local var6 = var3
		local var7 = var4
		var2 = var5
		
		if var7 == protoModule.wireTypes.varint then
			if var6 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarInt(p1, var2)
				var2 = var9
				var1.private_servers_enabled = var8 ~= 0
			else
				local _ = nil
				local var10, var11 = protoModule.readVarInt(p1, var2)
				local _ = var10
				var2 = var11
			end
		elseif var7 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var12, var13 = protoModule.readVarInt(p1, var2)
			var2 = var13 + var12
		elseif var7 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var7 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var15)
		end
	end
	return var1
end

function t_1:jsonEncode()
	local t = {}
	
	if self.private_servers_enabled then
		t.privateServersEnabled = self.private_servers_enabled
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref)
	local var18 = t_1.new()
	
	if self.private_servers_enabled ~= nil then
		var18.private_servers_enabled = self.private_servers_enabled
	end
	if self.privateServersEnabled ~= nil then
		var18.private_servers_enabled = self.privateServersEnabled
	end
	return var18
end

t_1.descriptor = {
	name = "UniversePrivateServerData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniversePrivateServerData"
}
t.UniversePrivateServerData = t_1
typeRegistryModule.default:register(t.UniversePrivateServerData)

return { UniversePrivateServerData = t.UniversePrivateServerData }