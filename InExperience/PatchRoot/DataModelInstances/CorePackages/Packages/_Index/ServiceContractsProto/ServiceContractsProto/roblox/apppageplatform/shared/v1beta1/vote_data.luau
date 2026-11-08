local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local _ = require(script.Parent.custom_options)
local Module = {}
Module.__index = Module

function Module.new(p1)
	-- upvalues: Module (copy)
	return (setmetatable({
		total_up_votes = if p1 == nil or p1.total_up_votes == nil then 0 else p1.total_up_votes,
		total_down_votes = if p1 == nil or p1.total_down_votes == nil then 0 else p1.total_down_votes,
		user_vote = if p1 == nil or p1.user_vote == nil then nil else p1.user_vote
	}, Module))
end

function Module:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.total_up_votes ~= nil and self.total_up_votes ~= 0 then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, self.total_up_votes)
	end
	if self.total_down_votes ~= nil and self.total_down_votes ~= 0 then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, self.total_down_votes)
	end
	if self.user_vote ~= nil then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult3, WriteTagResult2_2, if self.user_vote then 1 else 0)
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
		Tag, Tag2, v14 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				NewModule.total_up_votes, v14 = ProtoModule.readVarIntI64(Buf, v1)
			elseif Tag == 2 then
				NewModule.total_down_votes, v14 = ProtoModule.readVarIntI64(Buf, v1)
			elseif Tag == 3 then
				local VarInt
				VarInt, v14 = ProtoModule.readVarInt(Buf, v1)
				NewModule.user_vote = VarInt ~= 0
			else
				local _
				_, v14 = ProtoModule.readVarInt(Buf, v1)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v1)
			v1 = VarInt2 + VarInt1
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v14 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v14 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode()
	local t = {}
	
	if self.total_up_votes ~= nil and self.total_up_votes ~= 0 then
		t.totalUpVotes = self.total_up_votes
	end
	if self.total_down_votes ~= nil and self.total_down_votes ~= 0 then
		t.totalDownVotes = self.total_down_votes
	end
	if self.user_vote ~= nil then
		t.userVote = self.user_vote
	end
	return t
end

function Module:jsonDecode()
	-- upvalues: Module (copy)
	local NewModule = Module.new()
	
	if self.total_up_votes ~= nil then
		NewModule.total_up_votes = self.total_up_votes
	end
	if self.totalUpVotes ~= nil then
		NewModule.total_up_votes = self.totalUpVotes
	end
	if self.total_down_votes ~= nil then
		NewModule.total_down_votes = self.total_down_votes
	end
	if self.totalDownVotes ~= nil then
		NewModule.total_down_votes = self.totalDownVotes
	end
	if self.user_vote ~= nil then
		NewModule.user_vote = self.user_vote
	end
	if self.userVote ~= nil then
		NewModule.user_vote = self.userVote
	end
	return NewModule
end

Module.descriptor = {
	name = "VoteData",
	fullName = "roblox.apppageplatform.shared.v1beta1.VoteData"
}
local config = { VoteData = Module }
TypeRegistryModule.default:register(config.VoteData)

return { VoteData = config.VoteData }