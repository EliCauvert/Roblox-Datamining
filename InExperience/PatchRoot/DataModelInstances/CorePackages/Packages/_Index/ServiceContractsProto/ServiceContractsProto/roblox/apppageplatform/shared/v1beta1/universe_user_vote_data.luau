local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local Module = {}
Module.__index = Module

function Module.new(p1)
	-- upvalues: Module (copy)
	return (setmetatable({
		user_vote = if p1 == nil or p1.user_vote == nil then nil else p1.user_vote,
		can_vote = p1 ~= nil and p1.can_vote ~= nil and p1.can_vote,
		reason_for_not_voteable = if p1 == nil or p1.reason_for_not_voteable == nil then "" else p1.reason_for_not_voteable
	}, Module))
end

function Module:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.user_vote ~= nil then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, if self.user_vote then 1 else 0)
	end
	if self.can_vote then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, if self.can_vote then 1 else 0)
	end
	if self.reason_for_not_voteable ~= nil and self.reason_for_not_voteable ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.reason_for_not_voteable)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf)
	-- upvalues: Module (copy), ProtoModule (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v13 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarInt
				VarInt, v13 = ProtoModule.readVarInt(Buf, v1)
				NewModule.user_vote = VarInt ~= 0
			elseif Tag == 2 then
				local VarInt1
				VarInt1, v13 = ProtoModule.readVarInt(Buf, v1)
				NewModule.can_vote = VarInt1 ~= 0
			else
				local _
				_, v13 = ProtoModule.readVarInt(Buf, v1)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 3 then
				local Buffer1
				Buffer1, v13 = ProtoModule.readBuffer(Buf, v1)
				NewModule.reason_for_not_voteable = buffer.tostring(Buffer1)
			else
				local VarInt2, VarInt2_1 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2_1 + VarInt2
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v13 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v13 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode()
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

function Module:jsonDecode()
	-- upvalues: Module (copy)
	local NewModule = Module.new()
	
	if self.user_vote ~= nil then
		NewModule.user_vote = self.user_vote
	end
	if self.userVote ~= nil then
		NewModule.user_vote = self.userVote
	end
	if self.can_vote ~= nil then
		NewModule.can_vote = self.can_vote
	end
	if self.canVote ~= nil then
		NewModule.can_vote = self.canVote
	end
	if self.reason_for_not_voteable ~= nil then
		NewModule.reason_for_not_voteable = self.reason_for_not_voteable
	end
	if self.reasonForNotVoteable ~= nil then
		NewModule.reason_for_not_voteable = self.reasonForNotVoteable
	end
	return NewModule
end

Module.descriptor = {
	name = "UniverseUserVoteData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseUserVoteData"
}
local config = { UniverseUserVoteData = Module }
TypeRegistryModule.default:register(config.UniverseUserVoteData)

return { UniverseUserVoteData = config.UniverseUserVoteData }