local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
		id = if p1 == nil or p1.id == nil then 0 else p1.id,
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		url = if p1 == nil or p1.url == nil then "" else p1.url,
		type = if p1 == nil or p1.type == nil then "" else p1.type,
		community_id = if p1 == nil or p1.community_id == nil then 0 else p1.community_id
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.id ~= nil and self.id ~= 0 then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var7 = protoModule.writeVarInt(var2, var3, self.id)
		buff = var2
		var1 = var3
	end
	if self.title ~= nil and self.title ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var9 = protoModule.writeString(var4, var5, self.title)
		buff = var4
		var1 = var5
	end
	if self.url ~= nil and self.url ~= "" then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var6, var11 = protoModule.writeString(var6, var7, self.url)
		buff = var6
		var1 = var7
	end
	if self.type ~= nil and self.type ~= "" then
		local var8, var9 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var8, var13 = protoModule.writeString(var8, var9, self.type)
		buff = var8
		var1 = var9
	end
	if self.community_id ~= nil and self.community_id ~= 0 then
		local var10, var11 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.varint)
		var10, var15 = protoModule.writeVarInt(var10, var11, self.community_id)
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
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI64(p1, var2)
				var2 = var9
				var1.id = var8
			elseif var7 == 5 then
				local _ = nil
				local var10, var11 = protoModule.readVarIntI64(p1, var2)
				var2 = var11
				var1.community_id = var10
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				local _ = var12
				var2 = var13
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.title = buffer.tostring(var14)
			elseif var7 == 3 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.url = buffer.tostring(var16)
			elseif var7 == 4 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.type = buffer.tostring(var18)
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
	
	if self.id ~= nil and self.id ~= 0 then
		t.id = self.id
	end
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.url ~= nil and self.url ~= "" then
		t.url = self.url
	end
	if self.type ~= nil and self.type ~= "" then
		t.type = self.type
	end
	if self.community_id ~= nil and self.community_id ~= 0 then
		t.communityId = self.community_id
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref)
	local var26 = t_1.new()
	
	if self.id ~= nil then
		var26.id = self.id
	end
	if self.title ~= nil then
		var26.title = self.title
	end
	if self.url ~= nil then
		var26.url = self.url
	end
	if self.type ~= nil then
		var26.type = self.type
	end
	if self.community_id ~= nil then
		var26.community_id = self.community_id
	end
	if self.communityId ~= nil then
		var26.community_id = self.communityId
	end
	return var26
end

t_1.descriptor = {
	name = "SocialLinkData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SocialLinkData"
}
t.SocialLinkData = t_1
typeRegistryModule.default:register(t.SocialLinkData)

return { SocialLinkData = t.SocialLinkData }