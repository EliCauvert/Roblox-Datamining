-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:19 2026 Pacific Standard Time.

local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 46 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({
		user_vote = if p0 == nil or p0.user_vote == nil then nil else p0.user_vote,
		can_vote = if p0 == nil or p0.can_vote == nil then false else p0.can_vote,
		reason_for_not_voteable = if p0 == nil or p0.reason_for_not_voteable == nil then "" else p0.reason_for_not_voteable
	}, t_1)
end

function t_1:encode() --[[ line: 56 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5 = 0
	
	if self.user_vote ~= nil then
		local var6, var7 = protoModule.writeTag(buff, var5, 1, protoModule.wireTypes.varint)
		var6, var7 = protoModule.writeVarInt(var6, var7, if self.user_vote then 1 else 0)
		buff = var6
		var5 = var7
	end
	if self.can_vote then
		local var8, var9 = protoModule.writeTag(buff, var5, 2, protoModule.wireTypes.varint)
		var8, var9 = protoModule.writeVarInt(var8, var9, if self.can_vote then 1 else 0)
		buff = var8
		var5 = var9
	end
	if self.reason_for_not_voteable ~= nil and self.reason_for_not_voteable ~= "" then
		local var10, var11 = protoModule.writeTag(buff, var5, 3, protoModule.wireTypes.lengthDelimited)
		var10, var11 = protoModule.writeString(var10, var11, self.reason_for_not_voteable)
		buff = var10
		var5 = var11
	end
	local buff_1 = buffer.create(var5)
	buffer.copy(buff_1, 0, buff, 0, var5)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 80 ]]
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
			if var19 == 1 then
				local _ = nil
				local var20, var21 = protoModule.readVarInt(p1, var14)
				var14 = var21
				var13.user_vote = var20 ~= 0
			elseif var19 == 2 then
				local _ = nil
				local var22, var23 = protoModule.readVarInt(p1, var14)
				var14 = var23
				var13.can_vote = var22 ~= 0
			else
				local _ = nil
				local var24, var25 = protoModule.readVarInt(p1, var14)
				local _ = var24
				var14 = var25
			end
		end
		if var15 == protoModule.wireTypes.lengthDelimited then
			if var19 == 3 then
				local _ = nil
				local var26, var27 = protoModule.readBuffer(p1, var14)
				var14 = var27
				var13.reason_for_not_voteable = buffer.tostring(var26)
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

function t_1:jsonEncode() --[[ line: 133 ]]
	local t = {}
	
	if self.user_vote ~= nil then
		t.userVote = self.user_vote
	end
	if self.can_vote then
		t.canVote = self.can_vote
	end
	if self.reason_for_not_voteable ~= nil and self.reason_for_not_voteable ~= "" then
		t.reasonForNotVoteable = self.reason_for_not_voteable
	end
	return t
end

function t_1:jsonDecode() --[[ line: 151 ]]
	-- upvalues: t_1 (ref)
	local var35 = t_1.new()
	
	if self.user_vote ~= nil then
		var35.user_vote = self.user_vote
	end
	if self.userVote ~= nil then
		var35.user_vote = self.userVote
	end
	if self.can_vote ~= nil then
		var35.can_vote = self.can_vote
	end
	if self.canVote ~= nil then
		var35.can_vote = self.canVote
	end
	if self.reason_for_not_voteable ~= nil then
		var35.reason_for_not_voteable = self.reason_for_not_voteable
	end
	if self.reasonForNotVoteable ~= nil then
		var35.reason_for_not_voteable = self.reasonForNotVoteable
	end
	return var35
end

t_1.descriptor = {
	name = "UniverseUserVoteData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseUserVoteData"
}
t.UniverseUserVoteData = t_1
typeRegistryModule.default:register(t.UniverseUserVoteData)

return { UniverseUserVoteData = t.UniverseUserVoteData }