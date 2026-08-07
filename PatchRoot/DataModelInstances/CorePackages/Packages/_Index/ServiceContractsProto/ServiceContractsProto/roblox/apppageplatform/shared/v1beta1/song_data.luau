-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:50 2026 Pacific Standard Time.

local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 53 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({
		id = if p0 == nil or p0.id == nil then "" else p0.id,
		media_asset_id = if p0 == nil or p0.media_asset_id == nil then "" else p0.media_asset_id,
		title = if p0 == nil or p0.title == nil then "" else p0.title,
		artist = if p0 == nil or p0.artist == nil then "" else p0.artist,
		album = if p0 == nil or p0.album == nil then "" else p0.album,
		album_art_asset_id = if p0 == nil or p0.album_art_asset_id == nil then 0 else p0.album_art_asset_id,
		is_private = if p0 == nil or p0.is_private == nil then false else p0.is_private,
		duration = if p0 == nil or p0.duration == nil then 0 else p0.duration
	}, t_1)
end

function t_1:encode() --[[ line: 66 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var6, var7 = protoModule.writeTag(buff, var5, 1, protoModule.wireTypes.lengthDelimited)
		var6, var7 = protoModule.writeString(var6, var7, self.id)
		buff = var6
		var5 = var7
	end
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		local var8, var9 = protoModule.writeTag(buff, var5, 2, protoModule.wireTypes.lengthDelimited)
		var8, var9 = protoModule.writeString(var8, var9, self.media_asset_id)
		buff = var8
		var5 = var9
	end
	if self.title ~= nil and self.title ~= "" then
		local var10, var11 = protoModule.writeTag(buff, var5, 3, protoModule.wireTypes.lengthDelimited)
		var10, var11 = protoModule.writeString(var10, var11, self.title)
		buff = var10
		var5 = var11
	end
	if self.artist ~= nil and self.artist ~= "" then
		local var12, var13 = protoModule.writeTag(buff, var5, 4, protoModule.wireTypes.lengthDelimited)
		var12, var13 = protoModule.writeString(var12, var13, self.artist)
		buff = var12
		var5 = var13
	end
	if self.album ~= nil and self.album ~= "" then
		local var14, var15 = protoModule.writeTag(buff, var5, 5, protoModule.wireTypes.lengthDelimited)
		var14, var15 = protoModule.writeString(var14, var15, self.album)
		buff = var14
		var5 = var15
	end
	if self.album_art_asset_id ~= nil and self.album_art_asset_id ~= 0 then
		local var16, var17 = protoModule.writeTag(buff, var5, 6, protoModule.wireTypes.varint)
		var16, var17 = protoModule.writeVarInt(var16, var17, self.album_art_asset_id)
		buff = var16
		var5 = var17
	end
	if self.is_private then
		local var18, var19 = protoModule.writeTag(buff, var5, 7, protoModule.wireTypes.varint)
		var18, var19 = protoModule.writeVarInt(var18, var19, if self.is_private then 1 else 0)
		buff = var18
		var5 = var19
	end
	if self.duration ~= nil and self.duration ~= 0 then
		local var20, var21 = protoModule.writeTag(buff, var5, 8, protoModule.wireTypes.i64)
		var20, var21 = protoModule.writeDouble(var20, var21, self.duration)
		buff = var20
		var5 = var21
	end
	local buff_1 = buffer.create(var5)
	buffer.copy(buff_1, 0, buff, 0, var5)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 115 ]]
	-- upvalues: t_1 (ref), protoModule (ref)
	local var23 = t_1.new()
	local var24 = 0
	while var24 < buffer.len(p1) do
		local _ = nil
		local var25 = nil
		local var26, var27, var28 = protoModule.readTag(p1, var24)
		local var29 = var26
		var25 = var27
		var24 = var28
		
		if var25 == protoModule.wireTypes.varint then
			if var29 == 6 then
				local _ = nil
				local var30, var31 = protoModule.readVarIntI64(p1, var24)
				var24 = var31
				var23.album_art_asset_id = var30
			elseif var29 == 7 then
				local _ = nil
				local var32, var33 = protoModule.readVarInt(p1, var24)
				var24 = var33
				var23.is_private = var32 ~= 0
			else
				local _ = nil
				local var34, var35 = protoModule.readVarInt(p1, var24)
				local _ = var34
				var24 = var35
			end
		end
		if var25 == protoModule.wireTypes.lengthDelimited then
			if var29 == 1 then
				local _ = nil
				local var36, var37 = protoModule.readBuffer(p1, var24)
				var24 = var37
				var23.id = buffer.tostring(var36)
			elseif var29 == 2 then
				local _ = nil
				local var38, var39 = protoModule.readBuffer(p1, var24)
				var24 = var39
				var23.media_asset_id = buffer.tostring(var38)
			elseif var29 == 3 then
				local _ = nil
				local var40, var41 = protoModule.readBuffer(p1, var24)
				var24 = var41
				var23.title = buffer.tostring(var40)
			elseif var29 == 4 then
				local _ = nil
				local var42, var43 = protoModule.readBuffer(p1, var24)
				var24 = var43
				var23.artist = buffer.tostring(var42)
			elseif var29 == 5 then
				local _ = nil
				local var44, var45 = protoModule.readBuffer(p1, var24)
				var24 = var45
				var23.album = buffer.tostring(var44)
			else
				local _ = nil
				local var46, var47 = protoModule.readVarInt(p1, var24)
				var24 = var47 + var46
			end
		elseif var25 == protoModule.wireTypes.i32 then
			local _ = nil
			local var48, var49 = protoModule.readFixed32(p1, var24)
			local _ = var48
			var24 = var49
		elseif var25 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var25)
		elseif var29 == 8 then
			local _ = nil
			local var50, var51 = protoModule.readDouble(p1, var24)
			var24 = var51
			var23.duration = var50
		else
			local _ = nil
			local var52, var53 = protoModule.readFixed64(p1, var24)
			local _ = var52
			var24 = var53
		end
	end
	return var23
end

function t_1:jsonEncode() --[[ line: 193 ]]
	-- upvalues: protoModule (ref)
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
		t.duration = protoModule.json.serializeNumber(self.duration)
	end
	return t
end

function t_1:jsonDecode() --[[ line: 231 ]]
	-- upvalues: t_1 (ref), protoModule (ref)
	local var55 = t_1.new()
	
	if self.id ~= nil then
		var55.id = self.id
	end
	if self.media_asset_id ~= nil then
		var55.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var55.media_asset_id = self.mediaAssetId
	end
	if self.title ~= nil then
		var55.title = self.title
	end
	if self.artist ~= nil then
		var55.artist = self.artist
	end
	if self.album ~= nil then
		var55.album = self.album
	end
	if self.album_art_asset_id ~= nil then
		var55.album_art_asset_id = self.album_art_asset_id
	end
	if self.albumArtAssetId ~= nil then
		var55.album_art_asset_id = self.albumArtAssetId
	end
	if self.is_private ~= nil then
		var55.is_private = self.is_private
	end
	if self.isPrivate ~= nil then
		var55.is_private = self.isPrivate
	end
	if self.duration ~= nil then
		var55.duration = protoModule.json.deserializeNumber(self.duration)
	end
	return var55
end

t_1.descriptor = {
	name = "SongData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SongData"
}
t.SongData = t_1
typeRegistryModule.default:register(t.SongData)

return { SongData = t.SongData }