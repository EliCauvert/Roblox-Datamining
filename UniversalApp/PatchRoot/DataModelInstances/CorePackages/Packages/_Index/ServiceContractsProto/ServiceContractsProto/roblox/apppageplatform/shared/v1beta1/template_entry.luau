local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local UiComponentSchemaModule = require(script.Parent.ui_component_schema)
local Module = {}
Module.__index = Module

function Module.new(p1)
	-- upvalues: Module (copy)
	return (setmetatable({
		template = if p1 == nil or p1.template == nil then nil else p1.template,
		roblox_component = if p1 == nil or p1.roblox_component == nil then "" else p1.roblox_component
	}, Module))
end

function Module:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.template ~= nil then
		local EncodeResult = self.template:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.roblox_component)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf)
	-- upvalues: Module (copy), ProtoModule (copy), UiComponentSchemaModule (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v13 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v13 = ProtoModule.readVarInt(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v13 = ProtoModule.readBuffer(Buf, v1)
				NewModule.template = UiComponentSchemaModule.UiComponentSchema.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v13 = ProtoModule.readBuffer(Buf, v1)
				NewModule.roblox_component = buffer.tostring(Buffer2)
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

function Module:jsonEncode()
	local t = {}
	
	if self.template ~= nil then
		t.template = self.template:jsonEncode()
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		t.robloxComponent = self.roblox_component
	end
	return t
end

function Module:jsonDecode()
	-- upvalues: Module (copy), UiComponentSchemaModule (copy)
	local NewModule = Module.new()
	
	if self.template ~= nil then
		NewModule.template = UiComponentSchemaModule.UiComponentSchema.jsonDecode(self.template)
	end
	if self.roblox_component ~= nil then
		NewModule.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		NewModule.roblox_component = self.robloxComponent
	end
	return NewModule
end

Module.descriptor = {
	name = "TemplateEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.TemplateEntry"
}
local config = { TemplateEntry = Module }
TypeRegistryModule.default:register(config.TemplateEntry)

return { TemplateEntry = config.TemplateEntry }