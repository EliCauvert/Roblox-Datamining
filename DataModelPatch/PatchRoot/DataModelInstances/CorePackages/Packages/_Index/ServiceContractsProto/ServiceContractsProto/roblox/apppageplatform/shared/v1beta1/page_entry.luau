local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local SurfacingModule = require(script.Parent.surfacing)
local Module = {}
Module.__index = Module

function Module.new(p1)
	-- upvalues: Module (copy)
	return (setmetatable({
		roblox_component = if p1 == nil or p1.roblox_component == nil then "" else p1.roblox_component,
		identifier = if p1 == nil or p1.identifier == nil then "" else p1.identifier,
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		category = if p1 == nil or p1.category == nil then "" else p1.category,
		surfacing = if p1 == nil or p1.surfacing == nil then nil else p1.surfacing
	}, Module))
end

function Module:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.roblox_component)
	end
	if self.identifier ~= nil and self.identifier ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.identifier)
	end
	if self.title ~= nil and self.title ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.title)
	end
	if self.category ~= nil and self.category ~= "" then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.category)
	end
	if self.surfacing ~= nil then
		local EncodeResult = self.surfacing:encode()
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult5, WriteTagResult2_4, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf)
	-- upvalues: Module (copy), ProtoModule (copy), SurfacingModule (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v19 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v19 = ProtoModule.readVarInt(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v19 = ProtoModule.readBuffer(Buf, v1)
				NewModule.roblox_component = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v19 = ProtoModule.readBuffer(Buf, v1)
				NewModule.identifier = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v19 = ProtoModule.readBuffer(Buf, v1)
				NewModule.title = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v19 = ProtoModule.readBuffer(Buf, v1)
				NewModule.category = buffer.tostring(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v19 = ProtoModule.readBuffer(Buf, v1)
				NewModule.surfacing = SurfacingModule.Surfacing.decode(Buffer5)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v19 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v19 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode()
	local t = {}
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		t.robloxComponent = self.roblox_component
	end
	if self.identifier ~= nil and self.identifier ~= "" then
		t.identifier = self.identifier
	end
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.category ~= nil and self.category ~= "" then
		t.category = self.category
	end
	if self.surfacing ~= nil then
		t.surfacing = self.surfacing:jsonEncode()
	end
	return t
end

function Module:jsonDecode()
	-- upvalues: Module (copy), SurfacingModule (copy)
	local NewModule = Module.new()
	
	if self.roblox_component ~= nil then
		NewModule.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		NewModule.roblox_component = self.robloxComponent
	end
	if self.identifier ~= nil then
		NewModule.identifier = self.identifier
	end
	if self.title ~= nil then
		NewModule.title = self.title
	end
	if self.category ~= nil then
		NewModule.category = self.category
	end
	if self.surfacing ~= nil then
		NewModule.surfacing = SurfacingModule.Surfacing.jsonDecode(self.surfacing)
	end
	return NewModule
end

Module.descriptor = {
	name = "PageEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.PageEntry"
}
local config = { PageEntry = Module }
TypeRegistryModule.default:register(config.PageEntry)

return { PageEntry = config.PageEntry }