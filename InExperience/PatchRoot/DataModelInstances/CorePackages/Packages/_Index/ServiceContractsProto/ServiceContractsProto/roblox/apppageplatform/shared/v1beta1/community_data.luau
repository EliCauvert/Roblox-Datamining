local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local Module = {}
Module.__index = Module

function Module.new(p1)
	-- upvalues: Module (copy)
	return (setmetatable({
		id = if p1 == nil or p1.id == nil then "" else p1.id,
		name = if p1 == nil or p1.name == nil then "" else p1.name,
		member_count = if p1 == nil or p1.member_count == nil then 0 else p1.member_count,
		description = if p1 == nil or p1.description == nil then "" else p1.description,
		is_verified = p1 ~= nil and p1.is_verified ~= nil and p1.is_verified
	}, Module))
end

function Module:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.id ~= nil and self.id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.id)
	end
	if self.name ~= nil and self.name ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.name)
	end
	if self.member_count ~= nil and self.member_count ~= 0 then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult3, WriteTagResult2_2, self.member_count)
	end
	if self.description ~= nil and self.description ~= "" then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.description)
	end
	if self.is_verified then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult5, WriteTagResult2_4, if self.is_verified then 1 else 0)
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
		Tag, Tag2, v17 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 3 then
				NewModule.member_count, v17 = ProtoModule.readVarIntI64(Buf, v1)
			elseif Tag == 5 then
				local VarInt
				VarInt, v17 = ProtoModule.readVarInt(Buf, v1)
				NewModule.is_verified = VarInt ~= 0
			else
				local _
				_, v17 = ProtoModule.readVarInt(Buf, v1)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v17 = ProtoModule.readBuffer(Buf, v1)
				NewModule.id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v17 = ProtoModule.readBuffer(Buf, v1)
				NewModule.name = buffer.tostring(Buffer2)
			elseif Tag == 4 then
				local Buffer3
				Buffer3, v17 = ProtoModule.readBuffer(Buf, v1)
				NewModule.description = buffer.tostring(Buffer3)
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt1
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
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.name ~= nil and self.name ~= "" then
		t.name = self.name
	end
	if self.member_count ~= nil and self.member_count ~= 0 then
		t.memberCount = self.member_count
	end
	if self.description ~= nil and self.description ~= "" then
		t.description = self.description
	end
	if self.is_verified then
		t.isVerified = self.is_verified
	end
	return t
end

function Module:jsonDecode()
	-- upvalues: Module (copy)
	local NewModule = Module.new()
	
	if self.id ~= nil then
		NewModule.id = self.id
	end
	if self.name ~= nil then
		NewModule.name = self.name
	end
	if self.member_count ~= nil then
		NewModule.member_count = self.member_count
	end
	if self.memberCount ~= nil then
		NewModule.member_count = self.memberCount
	end
	if self.description ~= nil then
		NewModule.description = self.description
	end
	if self.is_verified ~= nil then
		NewModule.is_verified = self.is_verified
	end
	if self.isVerified ~= nil then
		NewModule.is_verified = self.isVerified
	end
	return NewModule
end

Module.descriptor = {
	name = "CommunityData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CommunityData"
}
local config = { CommunityData = Module }
TypeRegistryModule.default:register(config.CommunityData)

return { CommunityData = config.CommunityData }