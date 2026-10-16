local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local Module = {}
Module.__index = Module

function Module.new(p1) --[[ Line: 46 ]]
	-- upvalues: Module (copy)
	return (setmetatable({
		id = if p1 == nil or p1.id == nil then "" else p1.id,
		rank = if p1 == nil or p1.rank == nil then nil else p1.rank,
		score = if p1 == nil or p1.score == nil then 0 else p1.score
	}, Module))
end

function Module:encode() --[[ Line: 54 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.id ~= nil and self.id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.id)
	end
	if self.rank ~= nil then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, self.rank)
	end
	if self.score ~= nil and self.score ~= 0 then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult3, WriteTagResult2_2, self.score)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf) --[[ Line: 78 ]]
	-- upvalues: Module (copy), ProtoModule (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v13 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				NewModule.rank, v13 = ProtoModule.readVarIntI64(Buf, v1)
			elseif Tag == 3 then
				NewModule.score, v13 = ProtoModule.readVarIntI64(Buf, v1)
			else
				local _
				_, v13 = ProtoModule.readVarInt(Buf, v1)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v13 = ProtoModule.readBuffer(Buf, v1)
				NewModule.id = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt
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

function Module:jsonEncode() --[[ Line: 131 ]]
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.rank ~= nil then
		t.rank = self.rank
	end
	if self.score ~= nil and self.score ~= 0 then
		t.score = self.score
	end
	return t
end

function Module:jsonDecode() --[[ Line: 149 ]]
	-- upvalues: Module (copy)
	local NewModule = Module.new()
	
	if self.id ~= nil then
		NewModule.id = self.id
	end
	if self.rank ~= nil then
		NewModule.rank = self.rank
	end
	if self.score ~= nil then
		NewModule.score = self.score
	end
	return NewModule
end

Module.descriptor = {
	name = "LeaderboardStatsData",
	fullName = "roblox.apppageplatform.shared.v1beta1.LeaderboardStatsData"
}
local config = { LeaderboardStatsData = Module }
TypeRegistryModule.default:register(config.LeaderboardStatsData)

return { LeaderboardStatsData = config.LeaderboardStatsData }