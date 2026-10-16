local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local Module = {}
Module.__index = Module

function Module.new(p1) --[[ Line: 47 ]]
	-- upvalues: Module (copy)
	return (setmetatable({
		following_count_by_type = if p1 == nil or p1.following_count_by_type == nil then 0 else p1.following_count_by_type,
		following_limit_by_type = if p1 == nil or p1.following_limit_by_type == nil then 0 else p1.following_limit_by_type
	}, Module))
end

function Module:encode() --[[ Line: 60 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.following_count_by_type ~= nil and self.following_count_by_type ~= 0 then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, self.following_count_by_type)
	end
	if self.following_limit_by_type ~= nil and self.following_limit_by_type ~= 0 then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, self.following_limit_by_type)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf) --[[ Line: 79 ]]
	-- upvalues: Module (copy), ProtoModule (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v11 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				NewModule.following_count_by_type, v11 = ProtoModule.readVarIntI32(Buf, v1)
			elseif Tag == 2 then
				NewModule.following_limit_by_type, v11 = ProtoModule.readVarIntI32(Buf, v1)
			else
				local _
				_, v11 = ProtoModule.readVarInt(Buf, v1)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v1)
			v1 = VarInt2 + VarInt
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v11 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v11 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode() --[[ Line: 127 ]]
	local t = {}
	
	if self.following_count_by_type ~= nil and self.following_count_by_type ~= 0 then
		t.followingCountByType = self.following_count_by_type
	end
	if self.following_limit_by_type ~= nil and self.following_limit_by_type ~= 0 then
		t.followingLimitByType = self.following_limit_by_type
	end
	return t
end

function Module:jsonDecode() --[[ Line: 141 ]]
	-- upvalues: Module (copy)
	local NewModule = Module.new()
	
	if self.following_count_by_type ~= nil then
		NewModule.following_count_by_type = self.following_count_by_type
	end
	if self.followingCountByType ~= nil then
		NewModule.following_count_by_type = self.followingCountByType
	end
	if self.following_limit_by_type ~= nil then
		NewModule.following_limit_by_type = self.following_limit_by_type
	end
	if self.followingLimitByType ~= nil then
		NewModule.following_limit_by_type = self.followingLimitByType
	end
	return NewModule
end

Module.descriptor = {
	name = "UniverseUserFollowLimitData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseUserFollowLimitData"
}
local config = { UniverseUserFollowLimitData = Module }
TypeRegistryModule.default:register(config.UniverseUserFollowLimitData)

return {
	UniverseUserFollowLimitData = config.UniverseUserFollowLimitData
}