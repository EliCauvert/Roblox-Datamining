local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local Module = {}
Module.__index = Module

function Module.new(p1) --[[ Line: 45 ]]
	-- upvalues: Module (copy)
	return (setmetatable({
		creator_type = if p1 == nil or p1.creator_type == nil then "" else p1.creator_type,
		creator_id = if p1 == nil or p1.creator_id == nil then 0 else p1.creator_id,
		creator_name = if p1 == nil or p1.creator_name == nil then "" else p1.creator_name,
		is_verified = p1 ~= nil and p1.is_verified ~= nil and p1.is_verified
	}, Module))
end

function Module:encode() --[[ Line: 54 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.creator_type ~= nil and self.creator_type ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.creator_type)
	end
	if self.creator_id ~= nil and self.creator_id ~= 0 then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, self.creator_id)
	end
	if self.creator_name ~= nil and self.creator_name ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.creator_name)
	end
	if self.is_verified then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult4, WriteTagResult2_3, if self.is_verified then 1 else 0)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf) --[[ Line: 83 ]]
	-- upvalues: Module (copy), ProtoModule (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v15 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				NewModule.creator_id, v15 = ProtoModule.readVarIntI64(Buf, v1)
			elseif Tag == 4 then
				local VarInt
				VarInt, v15 = ProtoModule.readVarInt(Buf, v1)
				NewModule.is_verified = VarInt ~= 0
			else
				local _
				_, v15 = ProtoModule.readVarInt(Buf, v1)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v15 = ProtoModule.readBuffer(Buf, v1)
				NewModule.creator_type = buffer.tostring(Buffer1)
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v15 = ProtoModule.readBuffer(Buf, v1)
				NewModule.creator_name = buffer.tostring(Buffer2)
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v15 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v15 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode() --[[ Line: 141 ]]
	local t = {}
	
	if self.creator_type ~= nil and self.creator_type ~= "" then
		t.creatorType = self.creator_type
	end
	if self.creator_id ~= nil and self.creator_id ~= 0 then
		t.creatorId = self.creator_id
	end
	if self.creator_name ~= nil and self.creator_name ~= "" then
		t.creatorName = self.creator_name
	end
	if self.is_verified then
		t.isVerified = self.is_verified
	end
	return t
end

function Module:jsonDecode() --[[ Line: 163 ]]
	-- upvalues: Module (copy)
	local NewModule = Module.new()
	
	if self.creator_type ~= nil then
		NewModule.creator_type = self.creator_type
	end
	if self.creatorType ~= nil then
		NewModule.creator_type = self.creatorType
	end
	if self.creator_id ~= nil then
		NewModule.creator_id = self.creator_id
	end
	if self.creatorId ~= nil then
		NewModule.creator_id = self.creatorId
	end
	if self.creator_name ~= nil then
		NewModule.creator_name = self.creator_name
	end
	if self.creatorName ~= nil then
		NewModule.creator_name = self.creatorName
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
	name = "CreatorData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CreatorData"
}
local config = { CreatorData = Module }
TypeRegistryModule.default:register(config.CreatorData)

return { CreatorData = config.CreatorData }