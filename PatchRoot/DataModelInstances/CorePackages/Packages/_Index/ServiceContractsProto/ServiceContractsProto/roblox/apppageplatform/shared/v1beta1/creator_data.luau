-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:31 2026 Pacific Standard Time.

local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 45 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({
		creator_type = if p0 == nil or p0.creator_type == nil then "" else p0.creator_type,
		creator_id = if p0 == nil or p0.creator_id == nil then 0 else p0.creator_id,
		creator_name = if p0 == nil or p0.creator_name == nil then "" else p0.creator_name,
		is_verified = if p0 == nil or p0.is_verified == nil then false else p0.is_verified
	}, t_1)
end

function t_1:encode() --[[ line: 54 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5 = 0
	
	if self.creator_type ~= nil and self.creator_type ~= "" then
		local var6, var7 = protoModule.writeTag(buff, var5, 1, protoModule.wireTypes.lengthDelimited)
		var6, var7 = protoModule.writeString(var6, var7, self.creator_type)
		buff = var6
		var5 = var7
	end
	if self.creator_id ~= nil and self.creator_id ~= 0 then
		local var8, var9 = protoModule.writeTag(buff, var5, 2, protoModule.wireTypes.varint)
		var8, var9 = protoModule.writeVarInt(var8, var9, self.creator_id)
		buff = var8
		var5 = var9
	end
	if self.creator_name ~= nil and self.creator_name ~= "" then
		local var10, var11 = protoModule.writeTag(buff, var5, 3, protoModule.wireTypes.lengthDelimited)
		var10, var11 = protoModule.writeString(var10, var11, self.creator_name)
		buff = var10
		var5 = var11
	end
	if self.is_verified then
		local var12, var13 = protoModule.writeTag(buff, var5, 4, protoModule.wireTypes.varint)
		var12, var13 = protoModule.writeVarInt(var12, var13, if self.is_verified then 1 else 0)
		buff = var12
		var5 = var13
	end
	local buff_1 = buffer.create(var5)
	buffer.copy(buff_1, 0, buff, 0, var5)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 83 ]]
	-- upvalues: t_1 (ref), protoModule (ref)
	local var15 = t_1.new()
	local var16 = 0
	while var16 < buffer.len(p1) do
		local _ = nil
		local var17 = nil
		local var18, var19, var20 = protoModule.readTag(p1, var16)
		local var21 = var18
		var17 = var19
		var16 = var20
		
		if var17 == protoModule.wireTypes.varint then
			if var21 == 2 then
				local _ = nil
				local var22, var23 = protoModule.readVarIntI64(p1, var16)
				var16 = var23
				var15.creator_id = var22
			elseif var21 == 4 then
				local _ = nil
				local var24, var25 = protoModule.readVarInt(p1, var16)
				var16 = var25
				var15.is_verified = var24 ~= 0
			else
				local _ = nil
				local var26, var27 = protoModule.readVarInt(p1, var16)
				local _ = var26
				var16 = var27
			end
		end
		if var17 == protoModule.wireTypes.lengthDelimited then
			if var21 == 1 then
				local _ = nil
				local var28, var29 = protoModule.readBuffer(p1, var16)
				var16 = var29
				var15.creator_type = buffer.tostring(var28)
			elseif var21 == 3 then
				local _ = nil
				local var30, var31 = protoModule.readBuffer(p1, var16)
				var16 = var31
				var15.creator_name = buffer.tostring(var30)
			else
				local _ = nil
				local var32, var33 = protoModule.readVarInt(p1, var16)
				var16 = var33 + var32
			end
		elseif var17 == protoModule.wireTypes.i32 then
			local _ = nil
			local var34, var35 = protoModule.readFixed32(p1, var16)
			local _ = var34
			var16 = var35
		elseif var17 == protoModule.wireTypes.i64 then
			local _ = nil
			local var36, var37 = protoModule.readFixed64(p1, var16)
			local _ = var36
			var16 = var37
		else
			error("Unsupported wire type: " .. var17)
		end
	end
	return var15
end

function t_1:jsonEncode() --[[ line: 141 ]]
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

function t_1:jsonDecode() --[[ line: 163 ]]
	-- upvalues: t_1 (ref)
	local var39 = t_1.new()
	
	if self.creator_type ~= nil then
		var39.creator_type = self.creator_type
	end
	if self.creatorType ~= nil then
		var39.creator_type = self.creatorType
	end
	if self.creator_id ~= nil then
		var39.creator_id = self.creator_id
	end
	if self.creatorId ~= nil then
		var39.creator_id = self.creatorId
	end
	if self.creator_name ~= nil then
		var39.creator_name = self.creator_name
	end
	if self.creatorName ~= nil then
		var39.creator_name = self.creatorName
	end
	if self.is_verified ~= nil then
		var39.is_verified = self.is_verified
	end
	if self.isVerified ~= nil then
		var39.is_verified = self.isVerified
	end
	return var39
end

t_1.descriptor = {
	name = "CreatorData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CreatorData"
}
t.CreatorData = t_1
typeRegistryModule.default:register(t.CreatorData)

return { CreatorData = t.CreatorData }