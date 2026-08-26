local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
		id = if p1 == nil or p1.id == nil then "" else p1.id,
		media_asset_id = if p1 == nil or p1.media_asset_id == nil then "" else p1.media_asset_id,
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		artist = if p1 == nil or p1.artist == nil then "" else p1.artist,
		album = if p1 == nil or p1.album == nil then "" else p1.album,
		album_art_asset_id = if p1 == nil or p1.album_art_asset_id == nil then 0 else p1.album_art_asset_id,
		is_private = if p1 == nil or p1.is_private == nil then false else p1.is_private,
		duration = if p1 == nil or p1.duration == nil then 0 else p1.duration
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var7 = protoModule.writeString(var2, var3, self.id)
		buff = var2
		var1 = var3
	end
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var9 = protoModule.writeString(var4, var5, self.media_asset_id)
		buff = var4
		var1 = var5
	end
	if self.title ~= nil and self.title ~= "" then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var6, var11 = protoModule.writeString(var6, var7, self.title)
		buff = var6
		var1 = var7
	end
	if self.artist ~= nil and self.artist ~= "" then
		local var8, var9 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var8, var13 = protoModule.writeString(var8, var9, self.artist)
		buff = var8
		var1 = var9
	end
	if self.album ~= nil and self.album ~= "" then
		local var10, var11 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
		var10, var15 = protoModule.writeString(var10, var11, self.album)
		buff = var10
		var1 = var11
	end
	if self.album_art_asset_id ~= nil and self.album_art_asset_id ~= 0 then
		local var12, var13 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.varint)
		var12, var17 = protoModule.writeVarInt(var12, var13, self.album_art_asset_id)
		buff = var12
		var1 = var13
	end
	if self.is_private then
		local var14, var15 = protoModule.writeTag(buff, var1, 7, protoModule.wireTypes.varint)
		var14, var19 = protoModule.writeVarInt(var14, var15, if self.is_private then 1 else 0)
		buff = var14
		var1 = var15
	end
	if self.duration ~= nil and self.duration ~= 0 then
		local var16, var17 = protoModule.writeTag(buff, var1, 8, protoModule.wireTypes.i64)
		var16, var21 = protoModule.writeDouble(var16, var17, self.duration)
		buff = var16
		var1 = var17
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
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 6 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI64(p1, var2)
				var2 = var9
				var1.album_art_asset_id = var8
			elseif var7 == 7 then
				local _ = nil
				local var10, var11 = protoModule.readVarInt(p1, var2)
				var2 = var11
				var1.is_private = var10 ~= 0
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				local _ = var12
				var2 = var13
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.id = buffer.tostring(var14)
			elseif var7 == 2 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.media_asset_id = buffer.tostring(var16)
			elseif var7 == 3 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.title = buffer.tostring(var18)
			elseif var7 == 4 then
				local _ = nil
				local var20, var21 = protoModule.readBuffer(p1, var2)
				var2 = var21
				var1.artist = buffer.tostring(var20)
			elseif var7 == 5 then
				local _ = nil
				local var22, var23 = protoModule.readBuffer(p1, var2)
				var2 = var23
				var1.album = buffer.tostring(var22)
			else
				local _ = nil
				local var24, var25 = protoModule.readVarInt(p1, var2)
				var2 = var25 + var24
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var26, var27 = protoModule.readFixed32(p1, var2)
			local _ = var26
			var2 = var27
		elseif var3 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var25)
		elseif var7 == 8 then
			local _ = nil
			local var28, var29 = protoModule.readDouble(p1, var2)
			var2 = var29
			var1.duration = var28
		else
			local _ = nil
			local var30, var31 = protoModule.readFixed64(p1, var2)
			local _ = var30
			var2 = var31
		end
	end
	return var1
end

function t_1:jsonEncode()
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

function t_1:jsonDecode()
	-- upvalues: t_1 (ref), protoModule (ref)
	local var32 = t_1.new()
	
	if self.id ~= nil then
		var32.id = self.id
	end
	if self.media_asset_id ~= nil then
		var32.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var32.media_asset_id = self.mediaAssetId
	end
	if self.title ~= nil then
		var32.title = self.title
	end
	if self.artist ~= nil then
		var32.artist = self.artist
	end
	if self.album ~= nil then
		var32.album = self.album
	end
	if self.album_art_asset_id ~= nil then
		var32.album_art_asset_id = self.album_art_asset_id
	end
	if self.albumArtAssetId ~= nil then
		var32.album_art_asset_id = self.albumArtAssetId
	end
	if self.is_private ~= nil then
		var32.is_private = self.is_private
	end
	if self.isPrivate ~= nil then
		var32.is_private = self.isPrivate
	end
	if self.duration ~= nil then
		var32.duration = protoModule.json.deserializeNumber(self.duration)
	end
	return var32
end

t_1.descriptor = {
	name = "SongData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SongData"
}
t.SongData = t_1
typeRegistryModule.default:register(t.SongData)

return { SongData = t.SongData }