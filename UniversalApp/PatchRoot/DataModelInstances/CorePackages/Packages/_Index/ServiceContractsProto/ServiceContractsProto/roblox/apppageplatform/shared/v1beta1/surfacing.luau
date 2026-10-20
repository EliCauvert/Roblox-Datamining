local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local Module = {}
Module.__index = Module

function Module.new(p1)
	-- upvalues: Module (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module))
end

function Module:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "peek_view" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "full_page" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf)
	-- upvalues: Module (copy), ProtoModule (copy), t (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v15 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v15 = ProtoModule.readVarInt(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v15 = ProtoModule.readBuffer(Buf, v1)
				NewModule.kind = { type = "peek_view", value = t.PeekView.decode(Buffer1) }
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v15 = ProtoModule.readBuffer(Buf, v1)
				NewModule.kind = { type = "full_page", value = t.FullPage.decode(Buffer2) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v15 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v15 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "peek_view" then
			t.peekView = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "full_page" then
			t.fullPage = self.kind.value:jsonEncode()
		end
	end
	return t
end

function Module:jsonDecode()
	-- upvalues: Module (copy), t (copy)
	local NewModule = Module.new()
	
	if self.peek_view ~= nil then
		NewModule.kind = {
			type = "peek_view",
			value = t.PeekView.jsonDecode(self.peek_view)
		}
	end
	if self.peekView ~= nil then
		NewModule.kind = {
			type = "peek_view",
			value = t.PeekView.jsonDecode(self.peekView)
		}
	end
	if self.full_page ~= nil then
		NewModule.kind = {
			type = "full_page",
			value = t.FullPage.jsonDecode(self.full_page)
		}
	end
	if self.fullPage ~= nil then
		NewModule.kind = {
			type = "full_page",
			value = t.FullPage.jsonDecode(self.fullPage)
		}
	end
	return NewModule
end

Module.descriptor = {
	name = "Surfacing",
	fullName = "roblox.apppageplatform.shared.v1beta1.Surfacing"
}
t.Surfacing = Module
TypeRegistryModule.default:register(t.Surfacing)
local Module1 = {}
Module1.__index = Module1

function Module1.new(p1)
	-- upvalues: Module1 (copy)
	return (setmetatable({
		height_offset = if p1 == nil or p1.height_offset == nil then nil else p1.height_offset
	}, Module1))
end

function Module1:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.height_offset ~= nil then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, self.height_offset)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module1.decode(Buf)
	-- upvalues: Module1 (copy), ProtoModule (copy)
	local NewModule = Module1.new()
	local v2 = 0
	while v2 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v32 = ProtoModule.readTag(Buf, v2)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				NewModule.height_offset, v32 = ProtoModule.readVarIntI32(Buf, v2)
			else
				local _
				_, v32 = ProtoModule.readVarInt(Buf, v2)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v2)
			v2 = VarInt2 + VarInt
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v32 = ProtoModule.readFixed32(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v32 = ProtoModule.readFixed64(Buf, v2)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module1:jsonEncode()
	local t = {}
	
	if self.height_offset ~= nil then
		t.heightOffset = self.height_offset
	end
	return t
end

function Module1:jsonDecode()
	-- upvalues: Module1 (copy)
	local NewModule = Module1.new()
	
	if self.height_offset ~= nil then
		NewModule.height_offset = self.height_offset
	end
	if self.heightOffset ~= nil then
		NewModule.height_offset = self.heightOffset
	end
	return NewModule
end

Module1.descriptor = {
	name = "PeekView",
	fullName = "roblox.apppageplatform.shared.v1beta1.PeekView"
}
t.PeekView = Module1
TypeRegistryModule.default:register(t.PeekView)
local Module2 = {}
Module2.__index = Module2

function Module2.new(p1)
	-- upvalues: Module2 (copy)
	return (setmetatable({
		content_top_padding = if p1 == nil or p1.content_top_padding == nil then nil else p1.content_top_padding
	}, Module2))
end

function Module2:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.content_top_padding ~= nil then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, self.content_top_padding)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module2.decode(Buf)
	-- upvalues: Module2 (copy), ProtoModule (copy)
	local NewModule = Module2.new()
	local v3 = 0
	while v3 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v47 = ProtoModule.readTag(Buf, v3)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				NewModule.content_top_padding, v47 = ProtoModule.readVarIntI32(Buf, v3)
			else
				local _
				_, v47 = ProtoModule.readVarInt(Buf, v3)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v3)
			v3 = VarInt2 + VarInt
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v47 = ProtoModule.readFixed32(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v47 = ProtoModule.readFixed64(Buf, v3)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module2:jsonEncode()
	local t = {}
	
	if self.content_top_padding ~= nil then
		t.contentTopPadding = self.content_top_padding
	end
	return t
end

function Module2:jsonDecode()
	-- upvalues: Module2 (copy)
	local NewModule = Module2.new()
	
	if self.content_top_padding ~= nil then
		NewModule.content_top_padding = self.content_top_padding
	end
	if self.contentTopPadding ~= nil then
		NewModule.content_top_padding = self.contentTopPadding
	end
	return NewModule
end

Module2.descriptor = {
	name = "FullPage",
	fullName = "roblox.apppageplatform.shared.v1beta1.FullPage"
}
t.FullPage = Module2
TypeRegistryModule.default:register(t.FullPage)

return {
	Surfacing = t.Surfacing,
	PeekView = t.PeekView,
	FullPage = t.FullPage
}