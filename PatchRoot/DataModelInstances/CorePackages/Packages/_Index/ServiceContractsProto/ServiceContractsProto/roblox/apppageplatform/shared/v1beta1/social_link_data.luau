-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:50 2026 Pacific Standard Time.

local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 47 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({
		id = if p0 == nil or p0.id == nil then 0 else p0.id,
		title = if p0 == nil or p0.title == nil then "" else p0.title,
		url = if p0 == nil or p0.url == nil then "" else p0.url,
		type = if p0 == nil or p0.type == nil then "" else p0.type,
		community_id = if p0 == nil or p0.community_id == nil then 0 else p0.community_id
	}, t_1)
end

function t_1:encode() --[[ line: 57 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5 = 0
	
	if self.id ~= nil and self.id ~= 0 then
		local var6, var7 = protoModule.writeTag(buff, var5, 1, protoModule.wireTypes.varint)
		var6, var7 = protoModule.writeVarInt(var6, var7, self.id)
		buff = var6
		var5 = var7
	end
	if self.title ~= nil and self.title ~= "" then
		local var8, var9 = protoModule.writeTag(buff, var5, 2, protoModule.wireTypes.lengthDelimited)
		var8, var9 = protoModule.writeString(var8, var9, self.title)
		buff = var8
		var5 = var9
	end
	if self.url ~= nil and self.url ~= "" then
		local var10, var11 = protoModule.writeTag(buff, var5, 3, protoModule.wireTypes.lengthDelimited)
		var10, var11 = protoModule.writeString(var10, var11, self.url)
		buff = var10
		var5 = var11
	end
	if self.type ~= nil and self.type ~= "" then
		local var12, var13 = protoModule.writeTag(buff, var5, 4, protoModule.wireTypes.lengthDelimited)
		var12, var13 = protoModule.writeString(var12, var13, self.type)
		buff = var12
		var5 = var13
	end
	if self.community_id ~= nil and self.community_id ~= 0 then
		local var14, var15 = protoModule.writeTag(buff, var5, 5, protoModule.wireTypes.varint)
		var14, var15 = protoModule.writeVarInt(var14, var15, self.community_id)
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
			if var23 == 1 then
				local _ = nil
				local var24, var25 = protoModule.readVarIntI64(p1, var18)
				var18 = var25
				var17.id = var24
			elseif var23 == 5 then
				local _ = nil
				local var26, var27 = protoModule.readVarIntI64(p1, var18)
				var18 = var27
				var17.community_id = var26
			else
				local _ = nil
				local var28, var29 = protoModule.readVarInt(p1, var18)
				local _ = var28
				var18 = var29
			end
		end
		if var19 == protoModule.wireTypes.lengthDelimited then
			if var23 == 2 then
				local _ = nil
				local var30, var31 = protoModule.readBuffer(p1, var18)
				var18 = var31
				var17.title = buffer.tostring(var30)
			elseif var23 == 3 then
				local _ = nil
				local var32, var33 = protoModule.readBuffer(p1, var18)
				var18 = var33
				var17.url = buffer.tostring(var32)
			elseif var23 == 4 then
				local _ = nil
				local var34, var35 = protoModule.readBuffer(p1, var18)
				var18 = var35
				var17.type = buffer.tostring(var34)
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

function t_1:jsonDecode() --[[ line: 180 ]]
	-- upvalues: t_1 (ref)
	local var43 = t_1.new()
	
	if self.id ~= nil then
		var43.id = self.id
	end
	if self.title ~= nil then
		var43.title = self.title
	end
	if self.url ~= nil then
		var43.url = self.url
	end
	if self.type ~= nil then
		var43.type = self.type
	end
	if self.community_id ~= nil then
		var43.community_id = self.community_id
	end
	if self.communityId ~= nil then
		var43.community_id = self.communityId
	end
	return var43
end

t_1.descriptor = {
	name = "SocialLinkData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SocialLinkData"
}
t.SocialLinkData = t_1
typeRegistryModule.default:register(t.SocialLinkData)

return { SocialLinkData = t.SocialLinkData }