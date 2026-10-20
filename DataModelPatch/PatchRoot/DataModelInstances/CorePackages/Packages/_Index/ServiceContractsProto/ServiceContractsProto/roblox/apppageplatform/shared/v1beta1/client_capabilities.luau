local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local CapabilityModule = require(script.Parent.capability)
local Module = {}
Module.__index = Module

function Module.new(p1)
	-- upvalues: Module (copy)
	return (setmetatable({
		enabled_capabilities = if p1 == nil or p1.enabled_capabilities == nil then {} else p1.enabled_capabilities,
		proto_version = if p1 == nil or p1.proto_version == nil then "" else p1.proto_version
	}, Module))
end

function Module:encode()
	-- upvalues: ProtoModule (copy), CapabilityModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.enabled_capabilities ~= nil and #self.enabled_capabilities > 0 then
		for _, enabledCapability in self.enabled_capabilities do
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
			Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, CapabilityModule.Capability.toNumber(enabledCapability))
		end
	end
	if self.proto_version ~= nil and self.proto_version ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.proto_version)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf)
	-- upvalues: Module (copy), ProtoModule (copy), CapabilityModule (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v12 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v12 = ProtoModule.readVarIntI32(Buf, v1)
				table.insert(NewModule.enabled_capabilities, CapabilityModule.Capability.fromNumber(VarIntI32) or VarIntI32)
			else
				local _
				_, v12 = ProtoModule.readVarInt(Buf, v1)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v12 = ProtoModule.readBuffer(Buf, v1)
				NewModule.proto_version = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v12 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v12 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode()
	-- upvalues: CapabilityModule (copy)
	local t = {}
	
	if self.enabled_capabilities ~= nil and #self.enabled_capabilities > 0 then
		local EnabledCapabilities = {}
		
		for _, enabledCapability in self.enabled_capabilities do
			table.insert(EnabledCapabilities, if typeof(enabledCapability) == "number" then enabledCapability else CapabilityModule.Capability.toNumber(enabledCapability))
		end
		t.enabledCapabilities = EnabledCapabilities
	end
	if self.proto_version ~= nil and self.proto_version ~= "" then
		t.protoVersion = self.proto_version
	end
	return t
end

function Module:jsonDecode()
	-- upvalues: Module (copy), CapabilityModule (copy)
	local NewModule = Module.new()
	
	if self.enabled_capabilities ~= nil then
		local Enabled_capabilities = {}
		
		for _, enabledCapability in self.enabled_capabilities do
			table.insert(Enabled_capabilities, (if typeof(enabledCapability) == "number" then CapabilityModule.Capability.fromNumber(enabledCapability) else CapabilityModule.Capability.fromName(enabledCapability)) or enabledCapability)
		end
		NewModule.enabled_capabilities = Enabled_capabilities
	end
	if self.enabledCapabilities ~= nil then
		local Enabled_capabilities = {}
		
		for _, enabledCapability1 in self.enabledCapabilities do
			table.insert(Enabled_capabilities, (if typeof(enabledCapability1) == "number" then CapabilityModule.Capability.fromNumber(enabledCapability1) else CapabilityModule.Capability.fromName(enabledCapability1)) or enabledCapability1)
		end
		NewModule.enabled_capabilities = Enabled_capabilities
	end
	if self.proto_version ~= nil then
		NewModule.proto_version = self.proto_version
	end
	if self.protoVersion ~= nil then
		NewModule.proto_version = self.protoVersion
	end
	return NewModule
end

Module.descriptor = {
	name = "ClientCapabilities",
	fullName = "roblox.apppageplatform.shared.v1beta1.ClientCapabilities"
}
local config = { ClientCapabilities = Module }
TypeRegistryModule.default:register(config.ClientCapabilities)

return { ClientCapabilities = config.ClientCapabilities }