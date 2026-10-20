local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local Module = {}
Module.__index = Module

function Module.new(p1)
	-- upvalues: Module (copy)
	return (setmetatable({
		can_join = p1 ~= nil and p1.can_join ~= nil and p1.can_join,
		is_pending_approval = p1 ~= nil and p1.is_pending_approval ~= nil and p1.is_pending_approval
	}, Module))
end

function Module:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.can_join then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, if self.can_join then 1 else 0)
	end
	if self.is_pending_approval then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, if self.is_pending_approval then 1 else 0)
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
		Tag, Tag2, v11 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarInt
				VarInt, v11 = ProtoModule.readVarInt(Buf, v1)
				NewModule.can_join = VarInt ~= 0
			elseif Tag == 2 then
				local VarInt1
				VarInt1, v11 = ProtoModule.readVarInt(Buf, v1)
				NewModule.is_pending_approval = VarInt1 ~= 0
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

function Module:jsonEncode()
	local t = {}
	
	if self.can_join then
		t.canJoin = self.can_join
	end
	if self.is_pending_approval then
		t.isPendingApproval = self.is_pending_approval
	end
	return t
end

function Module:jsonDecode()
	-- upvalues: Module (copy)
	local NewModule = Module.new()
	
	if self.can_join ~= nil then
		NewModule.can_join = self.can_join
	end
	if self.canJoin ~= nil then
		NewModule.can_join = self.canJoin
	end
	if self.is_pending_approval ~= nil then
		NewModule.is_pending_approval = self.is_pending_approval
	end
	if self.isPendingApproval ~= nil then
		NewModule.is_pending_approval = self.isPendingApproval
	end
	return NewModule
end

Module.descriptor = {
	name = "CommunityUserMembershipData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CommunityUserMembershipData"
}
local config = { CommunityUserMembershipData = Module }
TypeRegistryModule.default:register(config.CommunityUserMembershipData)

return {
	CommunityUserMembershipData = config.CommunityUserMembershipData
}