local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0)
	-- upvalues: t_1 (ref)
	return setmetatable({
		contact_name = if p0 == nil or p0.contact_name == nil then nil else p0.contact_name,
		avatar_thumbnail_url = if p0 == nil or p0.avatar_thumbnail_url == nil then nil else p0.avatar_thumbnail_url,
		headshot_thumbnail_url = if p0 == nil or p0.headshot_thumbnail_url == nil then nil else p0.headshot_thumbnail_url
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5 = 0
	
	if self.contact_name ~= nil then
		local var6, var7 = protoModule.writeTag(buff, var5, 1, protoModule.wireTypes.lengthDelimited)
		var6, var7 = protoModule.writeString(var6, var7, self.contact_name)
		buff = var6
		var5 = var7
	end
	if self.avatar_thumbnail_url ~= nil then
		local var8, var9 = protoModule.writeTag(buff, var5, 2, protoModule.wireTypes.lengthDelimited)
		var8, var9 = protoModule.writeString(var8, var9, self.avatar_thumbnail_url)
		buff = var8
		var5 = var9
	end
	if self.headshot_thumbnail_url ~= nil then
		local var10, var11 = protoModule.writeTag(buff, var5, 3, protoModule.wireTypes.lengthDelimited)
		var10, var11 = protoModule.writeString(var10, var11, self.headshot_thumbnail_url)
		buff = var10
		var5 = var11
	end
	local buff_1 = buffer.create(var5)
	buffer.copy(buff_1, 0, buff, 0, var5)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref)
	local var13 = t_1.new()
	local var14 = 0
	while var14 < buffer.len(p1) do
		local _ = nil
		local var15 = nil
		local var16, var17, var18 = protoModule.readTag(p1, var14)
		local var19 = var16
		var15 = var17
		var14 = var18
		
		if var15 == protoModule.wireTypes.varint then
			local _ = nil
			local var20, var21 = protoModule.readVarInt(p1, var14)
			local _ = var20
			var14 = var21
			continue
		end
		if var15 == protoModule.wireTypes.lengthDelimited then
			if var19 == 1 then
				local _ = nil
				local var22, var23 = protoModule.readBuffer(p1, var14)
				var14 = var23
				var13.contact_name = buffer.tostring(var22)
			elseif var19 == 2 then
				local _ = nil
				local var24, var25 = protoModule.readBuffer(p1, var14)
				var14 = var25
				var13.avatar_thumbnail_url = buffer.tostring(var24)
			elseif var19 == 3 then
				local _ = nil
				local var26, var27 = protoModule.readBuffer(p1, var14)
				var14 = var27
				var13.headshot_thumbnail_url = buffer.tostring(var26)
			else
				local _ = nil
				local var28, var29 = protoModule.readVarInt(p1, var14)
				var14 = var29 + var28
			end
		elseif var15 == protoModule.wireTypes.i32 then
			local _ = nil
			local var30, var31 = protoModule.readFixed32(p1, var14)
			local _ = var30
			var14 = var31
		elseif var15 == protoModule.wireTypes.i64 then
			local _ = nil
			local var32, var33 = protoModule.readFixed64(p1, var14)
			local _ = var32
			var14 = var33
		else
			error("Unsupported wire type: " .. var15)
		end
	end
	return var13
end

function t_1:jsonEncode()
	local t = {}
	
	if self.contact_name ~= nil then
		t.contactName = self.contact_name
	end
	if self.avatar_thumbnail_url ~= nil then
		t.avatarThumbnailUrl = self.avatar_thumbnail_url
	end
	if self.headshot_thumbnail_url ~= nil then
		t.headshotThumbnailUrl = self.headshot_thumbnail_url
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref)
	local var35 = t_1.new()
	
	if self.contact_name ~= nil then
		var35.contact_name = self.contact_name
	end
	if self.contactName ~= nil then
		var35.contact_name = self.contactName
	end
	if self.avatar_thumbnail_url ~= nil then
		var35.avatar_thumbnail_url = self.avatar_thumbnail_url
	end
	if self.avatarThumbnailUrl ~= nil then
		var35.avatar_thumbnail_url = self.avatarThumbnailUrl
	end
	if self.headshot_thumbnail_url ~= nil then
		var35.headshot_thumbnail_url = self.headshot_thumbnail_url
	end
	if self.headshotThumbnailUrl ~= nil then
		var35.headshot_thumbnail_url = self.headshotThumbnailUrl
	end
	return var35
end

t_1.descriptor = {
	name = "ContactData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContactData"
}
t.ContactData = t_1
typeRegistryModule.default:register(t.ContactData)

return { ContactData = t.ContactData }