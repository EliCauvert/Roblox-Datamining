local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local Module = {}
Module.__index = Module

function Module.new(p1)
	-- upvalues: Module (copy)
	return (setmetatable({
		count = if p1 == nil or p1.count == nil then 0 else p1.count,
		is_visible = p1 ~= nil and p1.is_visible ~= nil and p1.is_visible
	}, Module))
end

function Module:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.count ~= nil and self.count ~= 0 then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, self.count)
	end
	if self.is_visible then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, if self.is_visible then 1 else 0)
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
				NewModule.count, v11 = ProtoModule.readVarIntI32(Buf, v1)
			elseif Tag == 2 then
				local VarInt
				VarInt, v11 = ProtoModule.readVarInt(Buf, v1)
				NewModule.is_visible = VarInt ~= 0
			else
				local _
				_, v11 = ProtoModule.readVarInt(Buf, v1)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v1)
			v1 = VarInt2 + VarInt1
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
	
	if self.count ~= nil and self.count ~= 0 then
		t.count = self.count
	end
	if self.is_visible then
		t.isVisible = self.is_visible
	end
	return t
end

function Module:jsonDecode()
	-- upvalues: Module (copy)
	local NewModule = Module.new()
	
	if self.count ~= nil then
		NewModule.count = self.count
	end
	if self.is_visible ~= nil then
		NewModule.is_visible = self.is_visible
	end
	if self.isVisible ~= nil then
		NewModule.is_visible = self.isVisible
	end
	return NewModule
end

Module.descriptor = {
	name = "NotificationBadgeData",
	fullName = "roblox.apppageplatform.shared.v1beta1.NotificationBadgeData"
}
local config = { NotificationBadgeData = Module }
TypeRegistryModule.default:register(config.NotificationBadgeData)

return { NotificationBadgeData = config.NotificationBadgeData }