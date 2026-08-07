-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:31 2026 Pacific Standard Time.

local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 47 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({
		can_join = if p0 == nil or p0.can_join == nil then false else p0.can_join,
		is_pending_approval = if p0 == nil or p0.is_pending_approval == nil then false else p0.is_pending_approval
	}, t_1)
end

function t_1:encode() --[[ line: 58 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5 = 0
	
	if self.can_join then
		local var6, var7 = protoModule.writeTag(buff, var5, 1, protoModule.wireTypes.varint)
		var6, var7 = protoModule.writeVarInt(var6, var7, if self.can_join then 1 else 0)
		buff = var6
		var5 = var7
	end
	if self.is_pending_approval then
		local var8, var9 = protoModule.writeTag(buff, var5, 2, protoModule.wireTypes.varint)
		var8, var9 = protoModule.writeVarInt(var8, var9, if self.is_pending_approval then 1 else 0)
		buff = var8
		var5 = var9
	end
	local buff_1 = buffer.create(var5)
	buffer.copy(buff_1, 0, buff, 0, var5)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 77 ]]
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
				var11.can_join = var18 ~= 0
			elseif var16 == 2 then
				local _ = nil
				local var20, var21 = protoModule.readVarInt(p1, var12)
				var12 = var21
				var11.is_pending_approval = var20 ~= 0
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

function t_1:jsonEncode() --[[ line: 125 ]]
	local t = {}
	
	if self.can_join then
		t.canJoin = self.can_join
	end
	if self.is_pending_approval then
		t.isPendingApproval = self.is_pending_approval
	end
	return t
end

function t_1:jsonDecode() --[[ line: 139 ]]
	-- upvalues: t_1 (ref)
	local var31 = t_1.new()
	
	if self.can_join ~= nil then
		var31.can_join = self.can_join
	end
	if self.canJoin ~= nil then
		var31.can_join = self.canJoin
	end
	if self.is_pending_approval ~= nil then
		var31.is_pending_approval = self.is_pending_approval
	end
	if self.isPendingApproval ~= nil then
		var31.is_pending_approval = self.isPendingApproval
	end
	return var31
end

t_1.descriptor = {
	name = "CommunityUserMembershipData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CommunityUserMembershipData"
}
t.CommunityUserMembershipData = t_1
typeRegistryModule.default:register(t.CommunityUserMembershipData)

return {
	CommunityUserMembershipData = t.CommunityUserMembershipData
}