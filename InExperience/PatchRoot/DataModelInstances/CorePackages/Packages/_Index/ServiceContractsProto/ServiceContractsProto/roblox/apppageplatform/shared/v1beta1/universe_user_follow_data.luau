local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local Module = {}
Module.__index = Module

function Module.new(p1) --[[ Line: 44 ]]
	-- upvalues: Module (copy)
	return (setmetatable({
		can_follow = p1 ~= nil and p1.can_follow ~= nil and p1.can_follow,
		is_following = p1 ~= nil and p1.is_following ~= nil and p1.is_following
	}, Module))
end

function Module:encode() --[[ Line: 51 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.can_follow then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, if self.can_follow then 1 else 0)
	end
	if self.is_following then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, if self.is_following then 1 else 0)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf) --[[ Line: 70 ]]
	-- upvalues: Module (copy), ProtoModule (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v11 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarInt
				VarInt, v11 = ProtoModule.readVarInt(Buf, v1)
				NewModule.can_follow = VarInt ~= 0
			elseif Tag == 2 then
				local VarInt1
				VarInt1, v11 = ProtoModule.readVarInt(Buf, v1)
				NewModule.is_following = VarInt1 ~= 0
			else
				local _
				_, v11 = ProtoModule.readVarInt(Buf, v1)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			local VarInt2, VarInt2_1 = ProtoModule.readVarInt(Buf, v1)
			v1 = VarInt2_1 + VarInt2
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

function Module:jsonEncode() --[[ Line: 118 ]]
	local t = {}
	
	if self.can_follow then
		t.canFollow = self.can_follow
	end
	if self.is_following then
		t.isFollowing = self.is_following
	end
	return t
end

function Module:jsonDecode() --[[ Line: 132 ]]
	-- upvalues: Module (copy)
	local NewModule = Module.new()
	
	if self.can_follow ~= nil then
		NewModule.can_follow = self.can_follow
	end
	if self.canFollow ~= nil then
		NewModule.can_follow = self.canFollow
	end
	if self.is_following ~= nil then
		NewModule.is_following = self.is_following
	end
	if self.isFollowing ~= nil then
		NewModule.is_following = self.isFollowing
	end
	return NewModule
end

Module.descriptor = {
	name = "UniverseUserFollowData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseUserFollowData"
}
local config = { UniverseUserFollowData = Module }
TypeRegistryModule.default:register(config.UniverseUserFollowData)

return { UniverseUserFollowData = config.UniverseUserFollowData }