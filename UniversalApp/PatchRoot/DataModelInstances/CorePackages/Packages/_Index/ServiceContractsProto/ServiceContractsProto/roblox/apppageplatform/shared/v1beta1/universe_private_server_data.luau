local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local Module = {}
Module.__index = Module

function Module.new(p1) --[[ Line: 45 ]]
	-- upvalues: Module (copy)
	return (setmetatable({
		private_servers_enabled = p1 ~= nil and p1.private_servers_enabled ~= nil and p1.private_servers_enabled
	}, Module))
end

function Module:encode() --[[ Line: 55 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.private_servers_enabled then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, if self.private_servers_enabled then 1 else 0)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf) --[[ Line: 69 ]]
	-- upvalues: Module (copy), ProtoModule (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v9 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarInt
				VarInt, v9 = ProtoModule.readVarInt(Buf, v1)
				NewModule.private_servers_enabled = VarInt ~= 0
			else
				local _
				_, v9 = ProtoModule.readVarInt(Buf, v1)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v1)
			v1 = VarInt2 + VarInt1
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v9 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v9 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode() --[[ Line: 112 ]]
	local t = {}
	
	if self.private_servers_enabled then
		t.privateServersEnabled = self.private_servers_enabled
	end
	return t
end

function Module:jsonDecode() --[[ Line: 122 ]]
	-- upvalues: Module (copy)
	local NewModule = Module.new()
	
	if self.private_servers_enabled ~= nil then
		NewModule.private_servers_enabled = self.private_servers_enabled
	end
	if self.privateServersEnabled ~= nil then
		NewModule.private_servers_enabled = self.privateServersEnabled
	end
	return NewModule
end

Module.descriptor = {
	name = "UniversePrivateServerData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniversePrivateServerData"
}
local config = { UniversePrivateServerData = Module }
TypeRegistryModule.default:register(config.UniversePrivateServerData)

return {
	UniversePrivateServerData = config.UniversePrivateServerData
}