local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
		image_id = if p1 == nil or p1.image_id == nil then "" else p1.image_id,
		asset_type_id = if p1 == nil or p1.asset_type_id == nil then 0 else p1.asset_type_id,
		video_hash = if p1 == nil or p1.video_hash == nil then "" else p1.video_hash,
		video_id = if p1 == nil or p1.video_id == nil then "" else p1.video_id,
		video_title = if p1 == nil or p1.video_title == nil then "" else p1.video_title
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.image_id ~= nil and self.image_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var7 = protoModule.writeString(var2, var3, self.image_id)
		buff = var2
		var1 = var3
	end
	if self.asset_type_id ~= nil and self.asset_type_id ~= 0 then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.varint)
		var4, var9 = protoModule.writeVarInt(var4, var5, self.asset_type_id)
		buff = var4
		var1 = var5
	end
	if self.video_hash ~= nil and self.video_hash ~= "" then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var6, var11 = protoModule.writeString(var6, var7, self.video_hash)
		buff = var6
		var1 = var7
	end
	if self.video_id ~= nil and self.video_id ~= "" then
		local var8, var9 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var8, var13 = protoModule.writeString(var8, var9, self.video_id)
		buff = var8
		var1 = var9
	end
	if self.video_title ~= nil and self.video_title ~= "" then
		local var10, var11 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
		var10, var15 = protoModule.writeString(var10, var11, self.video_title)
		buff = var10
		var1 = var11
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
			if var7 == 2 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI64(p1, var2)
				var2 = var9
				var1.asset_type_id = var8
			else
				local _ = nil
				local var10, var11 = protoModule.readVarInt(p1, var2)
				local _ = var10
				var2 = var11
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.image_id = buffer.tostring(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.video_hash = buffer.tostring(var14)
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.video_id = buffer.tostring(var16)
			elseif var7 == 5 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.video_title = buffer.tostring(var18)
			else
				local _ = nil
				local var20, var21 = protoModule.readVarInt(p1, var2)
				var2 = var21 + var20
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var22, var23 = protoModule.readFixed32(p1, var2)
			local _ = var22
			var2 = var23
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var24, var25 = protoModule.readFixed64(p1, var2)
			local _ = var24
			var2 = var25
		else
			error("Unsupported wire type: " .. var19)
		end
	end
	return var1
end

function t_1:jsonEncode()
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

function t_1:jsonDecode()
	-- upvalues: t_1 (ref)
	local var26 = t_1.new()
	
	if self.image_id ~= nil then
		var26.image_id = self.image_id
	end
	if self.imageId ~= nil then
		var26.image_id = self.imageId
	end
	if self.asset_type_id ~= nil then
		var26.asset_type_id = self.asset_type_id
	end
	if self.assetTypeId ~= nil then
		var26.asset_type_id = self.assetTypeId
	end
	if self.video_hash ~= nil then
		var26.video_hash = self.video_hash
	end
	if self.videoHash ~= nil then
		var26.video_hash = self.videoHash
	end
	if self.video_id ~= nil then
		var26.video_id = self.video_id
	end
	if self.videoId ~= nil then
		var26.video_id = self.videoId
	end
	if self.video_title ~= nil then
		var26.video_title = self.video_title
	end
	if self.videoTitle ~= nil then
		var26.video_title = self.videoTitle
	end
	return var26
end

t_1.descriptor = {
	name = "MediaAssetData",
	fullName = "roblox.apppageplatform.shared.v1beta1.MediaAssetData"
}
t.MediaAssetData = t_1
typeRegistryModule.default:register(t.MediaAssetData)

return { MediaAssetData = t.MediaAssetData }