local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local StructModule = require(script.Parent.Parent.Parent.Parent.Parent.google.protobuf.struct)
local Module = {}
Module.__index = Module

function Module.new(p1)
	-- upvalues: Module (copy)
	return (setmetatable({
		saved = if p1 == nil or p1.saved == nil then nil else p1.saved,
		catalogs = if p1 == nil or p1.catalogs == nil then nil else p1.catalogs,
		capabilities = if p1 == nil or p1.capabilities == nil then nil else p1.capabilities
	}, Module))
end

function Module:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.saved ~= nil then
		local EncodeResult = self.saved:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.catalogs ~= nil then
		local EncodeResult = self.catalogs:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.capabilities ~= nil then
		local EncodeResult = self.capabilities:encode()
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf)
	-- upvalues: Module (copy), ProtoModule (copy), StructModule (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v17 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v17 = ProtoModule.readVarInt(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v17 = ProtoModule.readBuffer(Buf, v1)
				NewModule.saved = StructModule.Struct.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v17 = ProtoModule.readBuffer(Buf, v1)
				NewModule.catalogs = StructModule.Struct.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v17 = ProtoModule.readBuffer(Buf, v1)
				NewModule.capabilities = StructModule.Struct.decode(Buffer3)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v17 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v17 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode()
	local t = {}
	
	if self.saved ~= nil then
		t.saved = self.saved:jsonEncode()
	end
	if self.catalogs ~= nil then
		t.catalogs = self.catalogs:jsonEncode()
	end
	if self.capabilities ~= nil then
		t.capabilities = self.capabilities:jsonEncode()
	end
	return t
end

function Module:jsonDecode()
	-- upvalues: Module (copy), StructModule (copy)
	local NewModule = Module.new()
	
	if self.saved ~= nil then
		NewModule.saved = StructModule.Struct.jsonDecode(self.saved)
	end
	if self.catalogs ~= nil then
		NewModule.catalogs = StructModule.Struct.jsonDecode(self.catalogs)
	end
	if self.capabilities ~= nil then
		NewModule.capabilities = StructModule.Struct.jsonDecode(self.capabilities)
	end
	return NewModule
end

Module.descriptor = {
	name = "ConfigDrivenFormInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConfigDrivenFormInputData"
}
local config = { ConfigDrivenFormInputData = Module }
TypeRegistryModule.default:register(config.ConfigDrivenFormInputData)

return {
	ConfigDrivenFormInputData = config.ConfigDrivenFormInputData
}