local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local Module = {}
Module.__index = Module

function Module.new(p1)
	-- upvalues: Module (copy)
	return (setmetatable({
		id = if p1 == nil or p1.id == nil then "" else p1.id,
		media_asset_id = if p1 == nil or p1.media_asset_id == nil then "" else p1.media_asset_id,
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		artist = if p1 == nil or p1.artist == nil then "" else p1.artist,
		album = if p1 == nil or p1.album == nil then "" else p1.album,
		album_art_asset_id = if p1 == nil or p1.album_art_asset_id == nil then 0 else p1.album_art_asset_id,
		is_private = p1 ~= nil and p1.is_private ~= nil and p1.is_private,
		duration = if p1 == nil or p1.duration == nil then 0 else p1.duration
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
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.media_asset_id)
	end
	if self.title ~= nil and self.title ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.title)
	end
	if self.artist ~= nil and self.artist ~= "" then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.artist)
	end
	if self.album ~= nil and self.album ~= "" then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult5, WriteTagResult2_4, self.album)
	end
	if self.album_art_asset_id ~= nil and self.album_art_asset_id ~= 0 then
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult6, WriteTagResult2_5, self.album_art_asset_id)
	end
	if self.is_private then
		local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult7, WriteTagResult2_6, if self.is_private then 1 else 0)
	end
	if self.duration ~= nil and self.duration ~= 0 then
		local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(Buf, Count, 8, ProtoModule.wireTypes.i64)
		Buf, Count = ProtoModule.writeDouble(WriteTagResult8, WriteTagResult2_7, self.duration)
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
		Tag, Tag2, v23 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 6 then
				NewModule.album_art_asset_id, v23 = ProtoModule.readVarIntI64(Buf, v1)
			elseif Tag == 7 then
				local VarInt
				VarInt, v23 = ProtoModule.readVarInt(Buf, v1)
				NewModule.is_private = VarInt ~= 0
			else
				local _
				_, v23 = ProtoModule.readVarInt(Buf, v1)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v23 = ProtoModule.readBuffer(Buf, v1)
				NewModule.id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v23 = ProtoModule.readBuffer(Buf, v1)
				NewModule.media_asset_id = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v23 = ProtoModule.readBuffer(Buf, v1)
				NewModule.title = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v23 = ProtoModule.readBuffer(Buf, v1)
				NewModule.artist = buffer.tostring(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v23 = ProtoModule.readBuffer(Buf, v1)
				NewModule.album = buffer.tostring(Buffer5)
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v23 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			if Tag == 8 then
				NewModule.duration, v23 = ProtoModule.readDouble(Buf, v1)
			else
				local _
				_, v23 = ProtoModule.readFixed64(Buf, v1)
			end
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode()
	-- upvalues: ProtoModule (copy)
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		t.mediaAssetId = self.media_asset_id
	end
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.artist ~= nil and self.artist ~= "" then
		t.artist = self.artist
	end
	if self.album ~= nil and self.album ~= "" then
		t.album = self.album
	end
	if self.album_art_asset_id ~= nil and self.album_art_asset_id ~= 0 then
		t.albumArtAssetId = self.album_art_asset_id
	end
	if self.is_private then
		t.isPrivate = self.is_private
	end
	if self.duration ~= nil and self.duration ~= 0 then
		t.duration = ProtoModule.json.serializeNumber(self.duration)
	end
	return t
end

function Module:jsonDecode()
	-- upvalues: Module (copy), ProtoModule (copy)
	local NewModule = Module.new()
	
	if self.id ~= nil then
		NewModule.id = self.id
	end
	if self.media_asset_id ~= nil then
		NewModule.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		NewModule.media_asset_id = self.mediaAssetId
	end
	if self.title ~= nil then
		NewModule.title = self.title
	end
	if self.artist ~= nil then
		NewModule.artist = self.artist
	end
	if self.album ~= nil then
		NewModule.album = self.album
	end
	if self.album_art_asset_id ~= nil then
		NewModule.album_art_asset_id = self.album_art_asset_id
	end
	if self.albumArtAssetId ~= nil then
		NewModule.album_art_asset_id = self.albumArtAssetId
	end
	if self.is_private ~= nil then
		NewModule.is_private = self.is_private
	end
	if self.isPrivate ~= nil then
		NewModule.is_private = self.isPrivate
	end
	if self.duration ~= nil then
		NewModule.duration = ProtoModule.json.deserializeNumber(self.duration)
	end
	return NewModule
end

Module.descriptor = {
	name = "SongData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SongData"
}
local config = { SongData = Module }
TypeRegistryModule.default:register(config.SongData)

return { SongData = config.SongData }