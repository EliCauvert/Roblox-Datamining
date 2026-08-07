-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:18 2026 Pacific Standard Time.

local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 44 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({
		can_follow = if p0 == nil or p0.can_follow == nil then false else p0.can_follow,
		is_following = if p0 == nil or p0.is_following == nil then false else p0.is_following
	}, t_1)
end

function t_1:encode() --[[ line: 51 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5 = 0
	
	if self.can_follow then
		local var6, var7 = protoModule.writeTag(buff, var5, 1, protoModule.wireTypes.varint)
		var6, var7 = protoModule.writeVarInt(var6, var7, if self.can_follow then 1 else 0)
		buff = var6
		var5 = var7
	end
	if self.is_following then
		local var8, var9 = protoModule.writeTag(buff, var5, 2, protoModule.wireTypes.varint)
		var8, var9 = protoModule.writeVarInt(var8, var9, if self.is_following then 1 else 0)
		buff = var8
		var5 = var9
	end
	local buff_1 = buffer.create(var5)
	buffer.copy(buff_1, 0, buff, 0, var5)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 70 ]]
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
				local var18, var19 = protoModule.readVarInt(p1, var12)
				var12 = var19
				var11.can_follow = var18 ~= 0
			elseif var16 == 2 then
				local _ = nil
				local var20, var21 = protoModule.readVarInt(p1, var12)
				var12 = var21
				var11.is_following = var20 ~= 0
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

function t_1:jsonEncode() --[[ line: 118 ]]
	local t = {}
	
	if self.can_follow then
		t.canFollow = self.can_follow
	end
	if self.is_following then
		t.isFollowing = self.is_following
	end
	return t
end

function t_1:jsonDecode() --[[ line: 132 ]]
	-- upvalues: t_1 (ref)
	local var31 = t_1.new()
	
	if self.can_follow ~= nil then
		var31.can_follow = self.can_follow
	end
	if self.canFollow ~= nil then
		var31.can_follow = self.canFollow
	end
	if self.is_following ~= nil then
		var31.is_following = self.is_following
	end
	if self.isFollowing ~= nil then
		var31.is_following = self.isFollowing
	end
	return var31
end

t_1.descriptor = {
	name = "UniverseUserFollowData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseUserFollowData"
}
t.UniverseUserFollowData = t_1
typeRegistryModule.default:register(t.UniverseUserFollowData)

return { UniverseUserFollowData = t.UniverseUserFollowData }