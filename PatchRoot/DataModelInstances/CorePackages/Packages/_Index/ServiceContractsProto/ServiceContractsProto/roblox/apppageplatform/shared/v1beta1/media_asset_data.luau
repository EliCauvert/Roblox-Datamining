-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:36 2026 Pacific Standard Time.

local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 47 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({
		image_id = if p0 == nil or p0.image_id == nil then "" else p0.image_id,
		asset_type_id = if p0 == nil or p0.asset_type_id == nil then 0 else p0.asset_type_id,
		video_hash = if p0 == nil or p0.video_hash == nil then "" else p0.video_hash,
		video_id = if p0 == nil or p0.video_id == nil then "" else p0.video_id,
		video_title = if p0 == nil or p0.video_title == nil then "" else p0.video_title
	}, t_1)
end

function t_1:encode() --[[ line: 57 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5 = 0
	
	if self.image_id ~= nil and self.image_id ~= "" then
		local var6, var7 = protoModule.writeTag(buff, var5, 1, protoModule.wireTypes.lengthDelimited)
		var6, var7 = protoModule.writeString(var6, var7, self.image_id)
		buff = var6
		var5 = var7
	end
	if self.asset_type_id ~= nil and self.asset_type_id ~= 0 then
		local var8, var9 = protoModule.writeTag(buff, var5, 2, protoModule.wireTypes.varint)
		var8, var9 = protoModule.writeVarInt(var8, var9, self.asset_type_id)
		buff = var8
		var5 = var9
	end
	if self.video_hash ~= nil and self.video_hash ~= "" then
		local var10, var11 = protoModule.writeTag(buff, var5, 3, protoModule.wireTypes.lengthDelimited)
		var10, var11 = protoModule.writeString(var10, var11, self.video_hash)
		buff = var10
		var5 = var11
	end
	if self.video_id ~= nil and self.video_id ~= "" then
		local var12, var13 = protoModule.writeTag(buff, var5, 4, protoModule.wireTypes.lengthDelimited)
		var12, var13 = protoModule.writeString(var12, var13, self.video_id)
		buff = var12
		var5 = var13
	end
	if self.video_title ~= nil and self.video_title ~= "" then
		local var14, var15 = protoModule.writeTag(buff, var5, 5, protoModule.wireTypes.lengthDelimited)
		var14, var15 = protoModule.writeString(var14, var15, self.video_title)
		buff = var14
		var5 = var15
	end
	local buff_1 = buffer.create(var5)
	buffer.copy(buff_1, 0, buff, 0, var5)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 91 ]]
	-- upvalues: t_1 (ref), protoModule (ref)
	local var17 = t_1.new()
	local var18 = 0
	while var18 < buffer.len(p1) do
		local _ = nil
		local var19 = nil
		local var20, var21, var22 = protoModule.readTag(p1, var18)
		local var23 = var20
		var19 = var21
		var18 = var22
		
		if var19 == protoModule.wireTypes.varint then
			if var23 == 2 then
				local _ = nil
				local var24, var25 = protoModule.readVarIntI64(p1, var18)
				var18 = var25
				var17.asset_type_id = var24
			else
				local _ = nil
				local var26, var27 = protoModule.readVarInt(p1, var18)
				local _ = var26
				var18 = var27
			end
		end
		if var19 == protoModule.wireTypes.lengthDelimited then
			if var23 == 1 then
				local _ = nil
				local var28, var29 = protoModule.readBuffer(p1, var18)
				var18 = var29
				var17.image_id = buffer.tostring(var28)
			elseif var23 == 3 then
				local _ = nil
				local var30, var31 = protoModule.readBuffer(p1, var18)
				var18 = var31
				var17.video_hash = buffer.tostring(var30)
			elseif var23 == 4 then
				local _ = nil
				local var32, var33 = protoModule.readBuffer(p1, var18)
				var18 = var33
				var17.video_id = buffer.tostring(var32)
			elseif var23 == 5 then
				local _ = nil
				local var34, var35 = protoModule.readBuffer(p1, var18)
				var18 = var35
				var17.video_title = buffer.tostring(var34)
			else
				local _ = nil
				local var36, var37 = protoModule.readVarInt(p1, var18)
				var18 = var37 + var36
			end
		elseif var19 == protoModule.wireTypes.i32 then
			local _ = nil
			local var38, var39 = protoModule.readFixed32(p1, var18)
			local _ = var38
			var18 = var39
		elseif var19 == protoModule.wireTypes.i64 then
			local _ = nil
			local var40, var41 = protoModule.readFixed64(p1, var18)
			local _ = var40
			var18 = var41
		else
			error("Unsupported wire type: " .. var19)
		end
	end
	return var17
end

function t_1:jsonEncode() --[[ line: 154 ]]
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

function t_1:jsonDecode() --[[ line: 180 ]]
	-- upvalues: t_1 (ref)
	local var43 = t_1.new()
	
	if self.image_id ~= nil then
		var43.image_id = self.image_id
	end
	if self.imageId ~= nil then
		var43.image_id = self.imageId
	end
	if self.asset_type_id ~= nil then
		var43.asset_type_id = self.asset_type_id
	end
	if self.assetTypeId ~= nil then
		var43.asset_type_id = self.assetTypeId
	end
	if self.video_hash ~= nil then
		var43.video_hash = self.video_hash
	end
	if self.videoHash ~= nil then
		var43.video_hash = self.videoHash
	end
	if self.video_id ~= nil then
		var43.video_id = self.video_id
	end
	if self.videoId ~= nil then
		var43.video_id = self.videoId
	end
	if self.video_title ~= nil then
		var43.video_title = self.video_title
	end
	if self.videoTitle ~= nil then
		var43.video_title = self.videoTitle
	end
	return var43
end

t_1.descriptor = {
	name = "MediaAssetData",
	fullName = "roblox.apppageplatform.shared.v1beta1.MediaAssetData"
}
t.MediaAssetData = t_1
typeRegistryModule.default:register(t.MediaAssetData)

return { MediaAssetData = t.MediaAssetData }