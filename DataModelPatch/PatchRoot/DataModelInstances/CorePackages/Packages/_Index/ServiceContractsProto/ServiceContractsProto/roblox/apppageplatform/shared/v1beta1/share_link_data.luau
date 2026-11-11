local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local PropTypesModule = require(script.Parent.prop_types)
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
	
	if self.kind ~= nil and self.kind.type == "literal" then
		local EncodeResult = self.kind.value:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
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
		Tag, Tag2, v19 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v19 = ProtoModule.readVarInt(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v19 = ProtoModule.readBuffer(Buf, v1)
				NewModule.kind = {
					type = "literal",
					value = t.GenericShareLinkData_GenericShareLinkLiteralData.decode(Buffer1)
				}
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
	
	if self.kind ~= nil and self.kind.type == "literal" then
		t.literal = self.kind.value:jsonEncode()
	end
	return t
end

function Module:jsonDecode()
	-- upvalues: Module (copy), t (copy)
	local NewModule = Module.new()
	
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = t.GenericShareLinkData_GenericShareLinkLiteralData.jsonDecode(self.literal)
		}
	end
	return NewModule
end

Module.descriptor = {
	name = "GenericShareLinkData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GenericShareLinkData"
}
t.GenericShareLinkData = Module
TypeRegistryModule.default:register(t.GenericShareLinkData)
local Module1 = {}
Module1.__index = Module1

function Module1.new(p1)
	-- upvalues: Module1 (copy)
	return (setmetatable({
		url = if p1 == nil or p1.url == nil then nil else p1.url,
		share_url_context = if p1 == nil or p1.share_url_context == nil then nil else p1.share_url_context
	}, Module1))
end

function Module1:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.url ~= nil then
		local EncodeResult = self.url:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.share_url_context ~= nil then
		local EncodeResult = self.share_url_context:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module1.decode(Buf)
	-- upvalues: Module1 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module1.new()
	local v2 = 0
	while v2 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v39 = ProtoModule.readTag(Buf, v2)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v39 = ProtoModule.readVarInt(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v39 = ProtoModule.readBuffer(Buf, v2)
				NewModule.url = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v39 = ProtoModule.readBuffer(Buf, v2)
				NewModule.share_url_context = PropTypesModule.StringProp.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v2)
				v2 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v39 = ProtoModule.readFixed32(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v39 = ProtoModule.readFixed64(Buf, v2)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module1:jsonEncode()
	local t = {}
	
	if self.url ~= nil then
		t.url = self.url:jsonEncode()
	end
	if self.share_url_context ~= nil then
		t.shareUrlContext = self.share_url_context:jsonEncode()
	end
	return t
end

function Module1:jsonDecode()
	-- upvalues: Module1 (copy), PropTypesModule (copy)
	local NewModule = Module1.new()
	
	if self.url ~= nil then
		NewModule.url = PropTypesModule.StringProp.jsonDecode(self.url)
	end
	if self.share_url_context ~= nil then
		NewModule.share_url_context = PropTypesModule.StringProp.jsonDecode(self.share_url_context)
	end
	if self.shareUrlContext ~= nil then
		NewModule.share_url_context = PropTypesModule.StringProp.jsonDecode(self.shareUrlContext)
	end
	return NewModule
end

Module1.descriptor = {
	name = "GenericShareLinkData_GenericShareLinkLiteralData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GenericShareLinkLiteralData"
}
t.GenericShareLinkData_GenericShareLinkLiteralData = Module1
TypeRegistryModule.default:register(t.GenericShareLinkData_GenericShareLinkLiteralData)
local Module2 = {}
Module2.__index = Module2

function Module2.new(p1)
	-- upvalues: Module2 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module2))
end

function Module2:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil and self.kind.type == "literal" then
		local EncodeResult = self.kind.value:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module2.decode(Buf)
	-- upvalues: Module2 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module2.new()
	local v3 = 0
	while v3 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v57 = ProtoModule.readTag(Buf, v3)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v57 = ProtoModule.readVarInt(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v57 = ProtoModule.readBuffer(Buf, v3)
				NewModule.kind = {
					type = "literal",
					value = t.ShareLinkFetchData_ShareLinkFetchLiteralData.decode(Buffer1)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v3)
				v3 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v57 = ProtoModule.readFixed32(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v57 = ProtoModule.readFixed64(Buf, v3)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module2:jsonEncode()
	local t = {}
	
	if self.kind ~= nil and self.kind.type == "literal" then
		t.literal = self.kind.value:jsonEncode()
	end
	return t
end

function Module2:jsonDecode()
	-- upvalues: Module2 (copy), t (copy)
	local NewModule = Module2.new()
	
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = t.ShareLinkFetchData_ShareLinkFetchLiteralData.jsonDecode(self.literal)
		}
	end
	return NewModule
end

Module2.descriptor = {
	name = "ShareLinkFetchData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ShareLinkFetchData"
}
t.ShareLinkFetchData = Module2
TypeRegistryModule.default:register(t.ShareLinkFetchData)
local Module3 = {}
Module3.__index = Module3

function Module3.new(p1)
	-- upvalues: Module3 (copy)
	return (setmetatable({
		share_url_context = if p1 == nil or p1.share_url_context == nil then nil else p1.share_url_context,
		link_type = if p1 == nil or p1.link_type == nil then nil else p1.link_type,
		link_data = if p1 == nil or p1.link_data == nil then nil else p1.link_data
	}, Module3))
end

function Module3:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.share_url_context ~= nil then
		local EncodeResult = self.share_url_context:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.link_type ~= nil then
		local EncodeResult = self.link_type:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.link_data ~= nil then
		local EncodeResult = self.link_data:encode()
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module3.decode(Buf)
	-- upvalues: Module3 (copy), ProtoModule (copy), PropTypesModule (copy), t (copy)
	local NewModule = Module3.new()
	local v4 = 0
	while v4 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v80 = ProtoModule.readTag(Buf, v4)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v80 = ProtoModule.readVarInt(Buf, v4)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v80 = ProtoModule.readBuffer(Buf, v4)
				NewModule.share_url_context = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v80 = ProtoModule.readBuffer(Buf, v4)
				NewModule.link_type = PropTypesModule.StringProp.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v80 = ProtoModule.readBuffer(Buf, v4)
				NewModule.link_data = t.ShareLinkPayload.decode(Buffer3)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v4)
				v4 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v80 = ProtoModule.readFixed32(Buf, v4)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v80 = ProtoModule.readFixed64(Buf, v4)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module3:jsonEncode()
	local t = {}
	
	if self.share_url_context ~= nil then
		t.shareUrlContext = self.share_url_context:jsonEncode()
	end
	if self.link_type ~= nil then
		t.linkType = self.link_type:jsonEncode()
	end
	if self.link_data ~= nil then
		t.linkData = self.link_data:jsonEncode()
	end
	return t
end

function Module3:jsonDecode()
	-- upvalues: Module3 (copy), PropTypesModule (copy), t (copy)
	local NewModule = Module3.new()
	
	if self.share_url_context ~= nil then
		NewModule.share_url_context = PropTypesModule.StringProp.jsonDecode(self.share_url_context)
	end
	if self.shareUrlContext ~= nil then
		NewModule.share_url_context = PropTypesModule.StringProp.jsonDecode(self.shareUrlContext)
	end
	if self.link_type ~= nil then
		NewModule.link_type = PropTypesModule.StringProp.jsonDecode(self.link_type)
	end
	if self.linkType ~= nil then
		NewModule.link_type = PropTypesModule.StringProp.jsonDecode(self.linkType)
	end
	if self.link_data ~= nil then
		NewModule.link_data = t.ShareLinkPayload.jsonDecode(self.link_data)
	end
	if self.linkData ~= nil then
		NewModule.link_data = t.ShareLinkPayload.jsonDecode(self.linkData)
	end
	return NewModule
end

Module3.descriptor = {
	name = "ShareLinkFetchData_ShareLinkFetchLiteralData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ShareLinkFetchLiteralData"
}
t.ShareLinkFetchData_ShareLinkFetchLiteralData = Module3
TypeRegistryModule.default:register(t.ShareLinkFetchData_ShareLinkFetchLiteralData)
local Module4 = {}
Module4.__index = Module4

function Module4.new(p1)
	-- upvalues: Module4 (copy)
	return (setmetatable({
		oneof_prop = if p1 == nil or p1.oneof_prop == nil then nil else p1.oneof_prop
	}, Module4))
end

function Module4:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.oneof_prop ~= nil then
		if self.oneof_prop.type == "experience_share_link_payload" then
			local EncodeResult = self.oneof_prop.value:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		elseif self.oneof_prop.type == "event_share_link_payload" then
			local EncodeResult = self.oneof_prop.value:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module4.decode(Buf)
	-- upvalues: Module4 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module4.new()
	local v5 = 0
	while v5 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v102 = ProtoModule.readTag(Buf, v5)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v102 = ProtoModule.readVarInt(Buf, v5)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v102 = ProtoModule.readBuffer(Buf, v5)
				NewModule.oneof_prop = {
					type = "experience_share_link_payload",
					value = t.ExperienceShareLinkPayload.decode(Buffer1)
				}
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v102 = ProtoModule.readBuffer(Buf, v5)
				NewModule.oneof_prop = {
					type = "event_share_link_payload",
					value = t.EventShareLinkPayload.decode(Buffer2)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v5)
				v5 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v102 = ProtoModule.readFixed32(Buf, v5)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v102 = ProtoModule.readFixed64(Buf, v5)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module4:jsonEncode()
	local t = {}
	
	if self.oneof_prop ~= nil then
		if self.oneof_prop.type == "experience_share_link_payload" then
			t.experienceShareLinkPayload = self.oneof_prop.value:jsonEncode()
			
			return t
		end
		if self.oneof_prop.type == "event_share_link_payload" then
			t.eventShareLinkPayload = self.oneof_prop.value:jsonEncode()
		end
	end
	return t
end

function Module4:jsonDecode()
	-- upvalues: Module4 (copy), t (copy)
	local NewModule = Module4.new()
	
	if self.experience_share_link_payload ~= nil then
		NewModule.oneof_prop = {
			type = "experience_share_link_payload",
			value = t.ExperienceShareLinkPayload.jsonDecode(self.experience_share_link_payload)
		}
	end
	if self.experienceShareLinkPayload ~= nil then
		NewModule.oneof_prop = {
			type = "experience_share_link_payload",
			value = t.ExperienceShareLinkPayload.jsonDecode(self.experienceShareLinkPayload)
		}
	end
	if self.event_share_link_payload ~= nil then
		NewModule.oneof_prop = {
			type = "event_share_link_payload",
			value = t.EventShareLinkPayload.jsonDecode(self.event_share_link_payload)
		}
	end
	if self.eventShareLinkPayload ~= nil then
		NewModule.oneof_prop = {
			type = "event_share_link_payload",
			value = t.EventShareLinkPayload.jsonDecode(self.eventShareLinkPayload)
		}
	end
	return NewModule
end

Module4.descriptor = {
	name = "ShareLinkPayload",
	fullName = "roblox.apppageplatform.shared.v1beta1.ShareLinkPayload"
}
t.ShareLinkPayload = Module4
TypeRegistryModule.default:register(t.ShareLinkPayload)
local Module5 = {}
Module5.__index = Module5

function Module5.new(p1)
	-- upvalues: Module5 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module5))
end

function Module5:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil and self.kind.type == "literal" then
		local EncodeResult = self.kind.value:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module5.decode(Buf)
	-- upvalues: Module5 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module5.new()
	local v6 = 0
	while v6 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v120 = ProtoModule.readTag(Buf, v6)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v120 = ProtoModule.readVarInt(Buf, v6)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v120 = ProtoModule.readBuffer(Buf, v6)
				NewModule.kind = {
					type = "literal",
					value = t.ExperienceShareLinkPayload_ExperienceShareLinkLiteralPayload.decode(Buffer1)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v6)
				v6 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v120 = ProtoModule.readFixed32(Buf, v6)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v120 = ProtoModule.readFixed64(Buf, v6)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module5:jsonEncode()
	local t = {}
	
	if self.kind ~= nil and self.kind.type == "literal" then
		t.literal = self.kind.value:jsonEncode()
	end
	return t
end

function Module5:jsonDecode()
	-- upvalues: Module5 (copy), t (copy)
	local NewModule = Module5.new()
	
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = t.ExperienceShareLinkPayload_ExperienceShareLinkLiteralPayload.jsonDecode(self.literal)
		}
	end
	return NewModule
end

Module5.descriptor = {
	name = "ExperienceShareLinkPayload",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceShareLinkPayload"
}
t.ExperienceShareLinkPayload = Module5
TypeRegistryModule.default:register(t.ExperienceShareLinkPayload)
local Module6 = {}
Module6.__index = Module6

function Module6.new(p1)
	-- upvalues: Module6 (copy)
	return (setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then nil else p1.universe_id
	}, Module6))
end

function Module6:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.universe_id ~= nil then
		local EncodeResult = self.universe_id:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module6.decode(Buf)
	-- upvalues: Module6 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module6.new()
	local v7 = 0
	while v7 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v137 = ProtoModule.readTag(Buf, v7)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v137 = ProtoModule.readVarInt(Buf, v7)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v137 = ProtoModule.readBuffer(Buf, v7)
				NewModule.universe_id = PropTypesModule.StringProp.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v7)
				v7 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v137 = ProtoModule.readFixed32(Buf, v7)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v137 = ProtoModule.readFixed64(Buf, v7)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module6:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	return t
end

function Module6:jsonDecode()
	-- upvalues: Module6 (copy), PropTypesModule (copy)
	local NewModule = Module6.new()
	
	if self.universe_id ~= nil then
		NewModule.universe_id = PropTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		NewModule.universe_id = PropTypesModule.StringProp.jsonDecode(self.universeId)
	end
	return NewModule
end

Module6.descriptor = {
	name = "ExperienceShareLinkPayload_ExperienceShareLinkLiteralPayload",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceShareLinkLiteralPayload"
}
t.ExperienceShareLinkPayload_ExperienceShareLinkLiteralPayload = Module6
TypeRegistryModule.default:register(t.ExperienceShareLinkPayload_ExperienceShareLinkLiteralPayload)
local Module7 = {}
Module7.__index = Module7

function Module7.new(p1)
	-- upvalues: Module7 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module7))
end

function Module7:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil and self.kind.type == "literal" then
		local EncodeResult = self.kind.value:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module7.decode(Buf)
	-- upvalues: Module7 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module7.new()
	local v8 = 0
	while v8 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v154 = ProtoModule.readTag(Buf, v8)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v154 = ProtoModule.readVarInt(Buf, v8)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v154 = ProtoModule.readBuffer(Buf, v8)
				NewModule.kind = {
					type = "literal",
					value = t.EventShareLinkPayload_EventShareLinkLiteralPayload.decode(Buffer1)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v8)
				v8 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v154 = ProtoModule.readFixed32(Buf, v8)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v154 = ProtoModule.readFixed64(Buf, v8)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module7:jsonEncode()
	local t = {}
	
	if self.kind ~= nil and self.kind.type == "literal" then
		t.literal = self.kind.value:jsonEncode()
	end
	return t
end

function Module7:jsonDecode()
	-- upvalues: Module7 (copy), t (copy)
	local NewModule = Module7.new()
	
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = t.EventShareLinkPayload_EventShareLinkLiteralPayload.jsonDecode(self.literal)
		}
	end
	return NewModule
end

Module7.descriptor = {
	name = "EventShareLinkPayload",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventShareLinkPayload"
}
t.EventShareLinkPayload = Module7
TypeRegistryModule.default:register(t.EventShareLinkPayload)
local Module8 = {}
Module8.__index = Module8

function Module8.new(p1)
	-- upvalues: Module8 (copy)
	return (setmetatable({
		event_id = if p1 == nil or p1.event_id == nil then nil else p1.event_id
	}, Module8))
end

function Module8:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.event_id ~= nil then
		local EncodeResult = self.event_id:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module8.decode(Buf)
	-- upvalues: Module8 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module8.new()
	local v9 = 0
	while v9 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v171 = ProtoModule.readTag(Buf, v9)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v171 = ProtoModule.readVarInt(Buf, v9)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v171 = ProtoModule.readBuffer(Buf, v9)
				NewModule.event_id = PropTypesModule.StringProp.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v9)
				v9 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v171 = ProtoModule.readFixed32(Buf, v9)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v171 = ProtoModule.readFixed64(Buf, v9)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module8:jsonEncode()
	local t = {}
	
	if self.event_id ~= nil then
		t.eventId = self.event_id:jsonEncode()
	end
	return t
end

function Module8:jsonDecode()
	-- upvalues: Module8 (copy), PropTypesModule (copy)
	local NewModule = Module8.new()
	
	if self.event_id ~= nil then
		NewModule.event_id = PropTypesModule.StringProp.jsonDecode(self.event_id)
	end
	if self.eventId ~= nil then
		NewModule.event_id = PropTypesModule.StringProp.jsonDecode(self.eventId)
	end
	return NewModule
end

Module8.descriptor = {
	name = "EventShareLinkPayload_EventShareLinkLiteralPayload",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventShareLinkLiteralPayload"
}
t.EventShareLinkPayload_EventShareLinkLiteralPayload = Module8
TypeRegistryModule.default:register(t.EventShareLinkPayload_EventShareLinkLiteralPayload)

return {
	GenericShareLinkData = t.GenericShareLinkData,
	GenericShareLinkData_GenericShareLinkLiteralData = t.GenericShareLinkData_GenericShareLinkLiteralData,
	ShareLinkFetchData = t.ShareLinkFetchData,
	ShareLinkFetchData_ShareLinkFetchLiteralData = t.ShareLinkFetchData_ShareLinkFetchLiteralData,
	ShareLinkPayload = t.ShareLinkPayload,
	ExperienceShareLinkPayload = t.ExperienceShareLinkPayload,
	ExperienceShareLinkPayload_ExperienceShareLinkLiteralPayload = t.ExperienceShareLinkPayload_ExperienceShareLinkLiteralPayload,
	EventShareLinkPayload = t.EventShareLinkPayload,
	EventShareLinkPayload_EventShareLinkLiteralPayload = t.EventShareLinkPayload_EventShareLinkLiteralPayload
}