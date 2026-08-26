local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
		user_vote = if p1 == nil or p1.user_vote == nil then nil else p1.user_vote,
		can_vote = if p1 == nil or p1.can_vote == nil then false else p1.can_vote,
		reason_for_not_voteable = if p1 == nil or p1.reason_for_not_voteable == nil then "" else p1.reason_for_not_voteable
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.user_vote ~= nil then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var7 = protoModule.writeVarInt(var2, var3, if self.user_vote then 1 else 0)
		buff = var2
		var1 = var3
	end
	if self.can_vote then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.varint)
		var4, var9 = protoModule.writeVarInt(var4, var5, if self.can_vote then 1 else 0)
		buff = var4
		var1 = var5
	end
	if self.reason_for_not_voteable ~= nil and self.reason_for_not_voteable ~= "" then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var6, var11 = protoModule.writeString(var6, var7, self.reason_for_not_voteable)
		buff = var6
		var1 = var7
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
				local var8, var9 = protoModule.readVarInt(p1, var2)
				var2 = var9
				var1.user_vote = var8 ~= 0
			elseif var7 == 2 then
				local _ = nil
				local var10, var11 = protoModule.readVarInt(p1, var2)
				var2 = var11
				var1.can_vote = var10 ~= 0
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				local _ = var12
				var2 = var13
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.reason_for_not_voteable = buffer.tostring(var14)
			else
				local _ = nil
				local var16, var17 = protoModule.readVarInt(p1, var2)
				var2 = var17 + var16
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var18, var19 = protoModule.readFixed32(p1, var2)
			local _ = var18
			var2 = var19
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var20, var21 = protoModule.readFixed64(p1, var2)
			local _ = var20
			var2 = var21
		else
			error("Unsupported wire type: " .. var15)
		end
	end
	return var1
end

function t_1:jsonEncode()
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

function t_1:jsonDecode()
	-- upvalues: t_1 (ref)
	local var22 = t_1.new()
	
	if self.user_vote ~= nil then
		var22.user_vote = self.user_vote
	end
	if self.userVote ~= nil then
		var22.user_vote = self.userVote
	end
	if self.can_vote ~= nil then
		var22.can_vote = self.can_vote
	end
	if self.canVote ~= nil then
		var22.can_vote = self.canVote
	end
	if self.reason_for_not_voteable ~= nil then
		var22.reason_for_not_voteable = self.reason_for_not_voteable
	end
	if self.reasonForNotVoteable ~= nil then
		var22.reason_for_not_voteable = self.reasonForNotVoteable
	end
	return var22
end

t_1.descriptor = {
	name = "UniverseUserVoteData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseUserVoteData"
}
t.UniverseUserVoteData = t_1
typeRegistryModule.default:register(t.UniverseUserVoteData)

return { UniverseUserVoteData = t.UniverseUserVoteData }