-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:19 2026 Pacific Standard Time.

local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 47 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({
		following_count_by_type = if p0 == nil or p0.following_count_by_type == nil then 0 else p0.following_count_by_type,
		following_limit_by_type = if p0 == nil or p0.following_limit_by_type == nil then 0 else p0.following_limit_by_type
	}, t_1)
end

function t_1:encode() --[[ line: 60 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5 = 0
	
	if self.following_count_by_type ~= nil and self.following_count_by_type ~= 0 then
		local var6, var7 = protoModule.writeTag(buff, var5, 1, protoModule.wireTypes.varint)
		var6, var7 = protoModule.writeVarInt(var6, var7, self.following_count_by_type)
		buff = var6
		var5 = var7
	end
	if self.following_limit_by_type ~= nil and self.following_limit_by_type ~= 0 then
		local var8, var9 = protoModule.writeTag(buff, var5, 2, protoModule.wireTypes.varint)
		var8, var9 = protoModule.writeVarInt(var8, var9, self.following_limit_by_type)
		buff = var8
		var5 = var9
	end
	local buff_1 = buffer.create(var5)
	buffer.copy(buff_1, 0, buff, 0, var5)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 79 ]]
	-- upvalues: t_1 (ref), protoModule (ref)
	local var11 = t_1.new()
	local var12 = 0
	while var12 < buffer.len(p1) do
		local _ = nil
		local _ = nil
		local var13, var14, var15 = protoModule.readTag(p1, var12)
		local var16 = var13
		local var17 = var14
		var12 = var15
		
		if var17 == protoModule.wireTypes.varint then
			if var16 == 1 then
				local _ = nil
				local var18, var19 = protoModule.readVarIntI32(p1, var12)
				var12 = var19
				var11.following_count_by_type = var18
			elseif var16 == 2 then
				local _ = nil
				local var20, var21 = protoModule.readVarIntI32(p1, var12)
				var12 = var21
				var11.following_limit_by_type = var20
			else
				local _ = nil
				local var22, var23 = protoModule.readVarInt(p1, var12)
				local _ = var22
				var12 = var23
			end
		elseif var17 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var24, var25 = protoModule.readVarInt(p1, var12)
			var12 = var25 + var24
		elseif var17 == protoModule.wireTypes.i32 then
			local _ = nil
			local var26, var27 = protoModule.readFixed32(p1, var12)
			local _ = var26
			var12 = var27
		elseif var17 == protoModule.wireTypes.i64 then
			local _ = nil
			local var28, var29 = protoModule.readFixed64(p1, var12)
			local _ = var28
			var12 = var29
		else
			error("Unsupported wire type: " .. var17)
		end
	end
	return var11
end

function t_1:jsonEncode() --[[ line: 127 ]]
	local t = {}
	
	if self.following_count_by_type ~= nil and self.following_count_by_type ~= 0 then
		t.followingCountByType = self.following_count_by_type
	end
	if self.following_limit_by_type ~= nil and self.following_limit_by_type ~= 0 then
		t.followingLimitByType = self.following_limit_by_type
	end
	return t
end

function t_1:jsonDecode() --[[ line: 141 ]]
	-- upvalues: t_1 (ref)
	local var31 = t_1.new()
	
	if self.following_count_by_type ~= nil then
		var31.following_count_by_type = self.following_count_by_type
	end
	if self.followingCountByType ~= nil then
		var31.following_count_by_type = self.followingCountByType
	end
	if self.following_limit_by_type ~= nil then
		var31.following_limit_by_type = self.following_limit_by_type
	end
	if self.followingLimitByType ~= nil then
		var31.following_limit_by_type = self.followingLimitByType
	end
	return var31
end

t_1.descriptor = {
	name = "UniverseUserFollowLimitData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseUserFollowLimitData"
}
t.UniverseUserFollowLimitData = t_1
typeRegistryModule.default:register(t.UniverseUserFollowLimitData)

return {
	UniverseUserFollowLimitData = t.UniverseUserFollowLimitData
}