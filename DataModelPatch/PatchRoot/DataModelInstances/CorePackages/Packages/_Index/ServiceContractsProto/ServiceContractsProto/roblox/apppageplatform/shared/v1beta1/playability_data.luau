local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local Module = {}
Module.__index = Module

function Module.new(p1)
	-- upvalues: Module (copy)
	return (setmetatable({
		is_playable = p1 ~= nil and p1.is_playable ~= nil and p1.is_playable,
		playability_status = if p1 == nil or p1.playability_status == nil then "" else p1.playability_status
	}, Module))
end

function Module:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.is_playable then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, if self.is_playable then 1 else 0)
	end
	if self.playability_status ~= nil and self.playability_status ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.playability_status)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf)
	-- upvalues: Module (copy), ProtoModule (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v11 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarInt
				VarInt, v11 = ProtoModule.readVarInt(Buf, v1)
				NewModule.is_playable = VarInt ~= 0
			else
				local _
				_, v11 = ProtoModule.readVarInt(Buf, v1)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v11 = ProtoModule.readBuffer(Buf, v1)
				NewModule.playability_status = buffer.tostring(Buffer1)
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v11 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v11 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode()
	local t = {}
	
	if self.is_playable then
		t.isPlayable = self.is_playable
	end
	if self.playability_status ~= nil and self.playability_status ~= "" then
		t.playabilityStatus = self.playability_status
	end
	return t
end

function Module:jsonDecode()
	-- upvalues: Module (copy)
	local NewModule = Module.new()
	
	if self.is_playable ~= nil then
		NewModule.is_playable = self.is_playable
	end
	if self.isPlayable ~= nil then
		NewModule.is_playable = self.isPlayable
	end
	if self.playability_status ~= nil then
		NewModule.playability_status = self.playability_status
	end
	if self.playabilityStatus ~= nil then
		NewModule.playability_status = self.playabilityStatus
	end
	return NewModule
end

Module.descriptor = {
	name = "PlayabilityData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PlayabilityData"
}
local config = { PlayabilityData = Module }
TypeRegistryModule.default:register(config.PlayabilityData)

return { PlayabilityData = config.PlayabilityData }