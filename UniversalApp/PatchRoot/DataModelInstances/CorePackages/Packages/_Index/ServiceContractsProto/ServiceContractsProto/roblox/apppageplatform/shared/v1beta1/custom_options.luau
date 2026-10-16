local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local Module = {}
Module.__index = Module

function Module.new(p1) --[[ Line: 44 ]]
	-- upvalues: Module (copy)
	return (setmetatable({
		name = if p1 == nil or p1.name == nil then "" else p1.name,
		description = if p1 == nil or p1.description == nil then "" else p1.description
	}, Module))
end

function Module:encode() --[[ Line: 51 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.name ~= nil and self.name ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.name)
	end
	if self.description ~= nil and self.description ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.description)
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
			local _
			_, v11 = ProtoModule.readVarInt(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v11 = ProtoModule.readBuffer(Buf, v1)
				NewModule.name = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v11 = ProtoModule.readBuffer(Buf, v1)
				NewModule.description = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt
			end
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
	
	if self.name ~= nil and self.name ~= "" then
		t.name = self.name
	end
	if self.description ~= nil and self.description ~= "" then
		t.description = self.description
	end
	return t
end

function Module:jsonDecode() --[[ Line: 132 ]]
	-- upvalues: Module (copy)
	local NewModule = Module.new()
	
	if self.name ~= nil then
		NewModule.name = self.name
	end
	if self.description ~= nil then
		NewModule.description = self.description
	end
	return NewModule
end

Module.descriptor = {
	name = "ClientSideHydrationField",
	fullName = "roblox.apppageplatform.shared.v1beta1.ClientSideHydrationField"
}
local config = { ClientSideHydrationField = Module }
TypeRegistryModule.default:register(config.ClientSideHydrationField)

return {
	ClientSideHydrationField = config.ClientSideHydrationField
}