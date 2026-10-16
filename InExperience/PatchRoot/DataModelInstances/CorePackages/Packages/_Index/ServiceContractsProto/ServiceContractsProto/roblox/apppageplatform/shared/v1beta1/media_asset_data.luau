local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local Module = {}
Module.__index = Module

function Module.new(p1) --[[ Line: 47 ]]
	-- upvalues: Module (copy)
	return (setmetatable({
		image_id = if p1 == nil or p1.image_id == nil then "" else p1.image_id,
		asset_type_id = if p1 == nil or p1.asset_type_id == nil then 0 else p1.asset_type_id,
		video_hash = if p1 == nil or p1.video_hash == nil then "" else p1.video_hash,
		video_id = if p1 == nil or p1.video_id == nil then "" else p1.video_id,
		video_title = if p1 == nil or p1.video_title == nil then "" else p1.video_title
	}, Module))
end

function Module:encode() --[[ Line: 57 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.image_id ~= nil and self.image_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.image_id)
	end
	if self.asset_type_id ~= nil and self.asset_type_id ~= 0 then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, self.asset_type_id)
	end
	if self.video_hash ~= nil and self.video_hash ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.video_hash)
	end
	if self.video_id ~= nil and self.video_id ~= "" then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.video_id)
	end
	if self.video_title ~= nil and self.video_title ~= "" then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult5, WriteTagResult2_4, self.video_title)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf) --[[ Line: 91 ]]
	-- upvalues: Module (copy), ProtoModule (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v17 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				NewModule.asset_type_id, v17 = ProtoModule.readVarIntI64(Buf, v1)
			else
				local _
				_, v17 = ProtoModule.readVarInt(Buf, v1)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v17 = ProtoModule.readBuffer(Buf, v1)
				NewModule.image_id = buffer.tostring(Buffer1)
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v17 = ProtoModule.readBuffer(Buf, v1)
				NewModule.video_hash = buffer.tostring(Buffer2)
			elseif Tag == 4 then
				local Buffer3
				Buffer3, v17 = ProtoModule.readBuffer(Buf, v1)
				NewModule.video_id = buffer.tostring(Buffer3)
			elseif Tag == 5 then
				local Buffer4
				Buffer4, v17 = ProtoModule.readBuffer(Buf, v1)
				NewModule.video_title = buffer.tostring(Buffer4)
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

function Module:jsonEncode() --[[ Line: 154 ]]
	local t = {}
	
	if self.image_id ~= nil and self.image_id ~= "" then
		t.imageId = self.image_id
	end
	if self.asset_type_id ~= nil and self.asset_type_id ~= 0 then
		t.assetTypeId = self.asset_type_id
	end
	if self.video_hash ~= nil and self.video_hash ~= "" then
		t.videoHash = self.video_hash
	end
	if self.video_id ~= nil and self.video_id ~= "" then
		t.videoId = self.video_id
	end
	if self.video_title ~= nil and self.video_title ~= "" then
		t.videoTitle = self.video_title
	end
	return t
end

function Module:jsonDecode() --[[ Line: 180 ]]
	-- upvalues: Module (copy)
	local NewModule = Module.new()
	
	if self.image_id ~= nil then
		NewModule.image_id = self.image_id
	end
	if self.imageId ~= nil then
		NewModule.image_id = self.imageId
	end
	if self.asset_type_id ~= nil then
		NewModule.asset_type_id = self.asset_type_id
	end
	if self.assetTypeId ~= nil then
		NewModule.asset_type_id = self.assetTypeId
	end
	if self.video_hash ~= nil then
		NewModule.video_hash = self.video_hash
	end
	if self.videoHash ~= nil then
		NewModule.video_hash = self.videoHash
	end
	if self.video_id ~= nil then
		NewModule.video_id = self.video_id
	end
	if self.videoId ~= nil then
		NewModule.video_id = self.videoId
	end
	if self.video_title ~= nil then
		NewModule.video_title = self.video_title
	end
	if self.videoTitle ~= nil then
		NewModule.video_title = self.videoTitle
	end
	return NewModule
end

Module.descriptor = {
	name = "MediaAssetData",
	fullName = "roblox.apppageplatform.shared.v1beta1.MediaAssetData"
}
local config = { MediaAssetData = Module }
TypeRegistryModule.default:register(config.MediaAssetData)

return { MediaAssetData = config.MediaAssetData }