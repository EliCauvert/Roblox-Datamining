local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local ClientCapabilitiesModule = require(script.Parent.Parent.Parent.shared.v1beta1.client_capabilities)
local DisplayLocationModule = require(script.Parent.Parent.Parent.shared.v1beta1.display_location)
local TemplateEntryModule = require(script.Parent.Parent.Parent.shared.v1beta1.template_entry)
local Module = {}
Module.__index = Module

function Module.new(p1) --[[ Line: 208 ]]
	-- upvalues: DisplayLocationModule (copy), Module (copy)
	return (setmetatable({
		display_location = if p1 == nil or p1.display_location == nil then assert(DisplayLocationModule.DisplayLocation.fromNumber(0), "Enum has no 0 default") else p1.display_location,
		roblox_component_to_template_id = if p1 == nil or p1.roblox_component_to_template_id == nil then {} else p1.roblox_component_to_template_id
	}, Module))
end

function Module:encode() --[[ Line: 224 ]]
	-- upvalues: DisplayLocationModule (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.display_location ~= nil and (self.display_location ~= nil and self.display_location ~= 0 or self.display_location ~= DisplayLocationModule.DisplayLocation.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, DisplayLocationModule.DisplayLocation.toNumber(self.display_location))
	end
	if self.roblox_component_to_template_id ~= nil and next(self.roblox_component_to_template_id) ~= nil then
		for i, value in self.roblox_component_to_template_id do
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult, WriteStringResult2 = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, i)
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(WriteStringResult, WriteStringResult2, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult1, WriteStringResult2_1 = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, value)
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, WriteStringResult1, WriteStringResult2_1)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf) --[[ Line: 264 ]]
	-- upvalues: Module (copy), ProtoModule (copy), DisplayLocationModule (copy), t (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v27 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v27 = ProtoModule.readVarIntI32(Buf, v1)
				NewModule.display_location = DisplayLocationModule.DisplayLocation.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v27 = ProtoModule.readVarInt(Buf, v1)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v27 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.DisplayLocationTemplateMapping_RobloxComponentToTemplateIdEntry.decode(Buffer1)
				NewModule.roblox_component_to_template_id[DecodeResult.key or ""] = DecodeResult.value or ""
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v27 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v27 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode() --[[ Line: 323 ]]
	-- upvalues: DisplayLocationModule (copy)
	local t = {}
	
	if self.display_location ~= nil and (self.display_location ~= nil and self.display_location ~= 0 or self.display_location ~= DisplayLocationModule.DisplayLocation.fromNumber(0)) then
		t.displayLocation = if typeof(self.display_location) == "number" then self.display_location else DisplayLocationModule.DisplayLocation.toNumber(self.display_location)
	end
	if self.roblox_component_to_template_id ~= nil and next(self.roblox_component_to_template_id) ~= nil then
		local RobloxComponentToTemplateId = {}
		
		for i, value in self.roblox_component_to_template_id do
			RobloxComponentToTemplateId[i] = value
		end
		t.robloxComponentToTemplateId = RobloxComponentToTemplateId
	end
	return t
end

function Module:jsonDecode() --[[ Line: 352 ]]
	-- upvalues: Module (copy), DisplayLocationModule (copy)
	local NewModule = Module.new()
	
	if self.display_location ~= nil then
		NewModule.display_location = (if typeof(self.display_location) == "number" then DisplayLocationModule.DisplayLocation.fromNumber(self.display_location) else DisplayLocationModule.DisplayLocation.fromName(self.display_location)) or self.display_location
	end
	if self.displayLocation ~= nil then
		NewModule.display_location = (if typeof(self.displayLocation) == "number" then DisplayLocationModule.DisplayLocation.fromNumber(self.displayLocation) else DisplayLocationModule.DisplayLocation.fromName(self.displayLocation)) or self.displayLocation
	end
	if self.roblox_component_to_template_id ~= nil then
		local Roblox_component_to_template_id = {}
		
		for i, value in self.roblox_component_to_template_id do
			Roblox_component_to_template_id[i] = value
		end
		NewModule.roblox_component_to_template_id = Roblox_component_to_template_id
	end
	if self.robloxComponentToTemplateId ~= nil then
		local Roblox_component_to_template_id = {}
		
		for i1, value1 in self.robloxComponentToTemplateId do
			Roblox_component_to_template_id[i1] = value1
		end
		NewModule.roblox_component_to_template_id = Roblox_component_to_template_id
	end
	return NewModule
end

Module.descriptor = {
	name = "DisplayLocationTemplateMapping",
	fullName = "roblox.apppageplatform.templates.v1beta1.DisplayLocationTemplateMapping"
}
t.DisplayLocationTemplateMapping = Module
TypeRegistryModule.default:register(t.DisplayLocationTemplateMapping)
local Module1 = {}
Module1.__index = Module1

function Module1.new(p1) --[[ Line: 411 ]]
	-- upvalues: Module1 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then "" else p1.value
	}, Module1))
end

function Module1:encode() --[[ Line: 423 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.key ~= nil and self.key ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.key)
	end
	if self.value ~= nil and self.value ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.value)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module1.decode(Buf) --[[ Line: 444 ]]
	-- upvalues: Module1 (copy), ProtoModule (copy)
	local NewModule = Module1.new()
	local v2 = 0
	while v2 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v50 = ProtoModule.readTag(Buf, v2)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v50 = ProtoModule.readVarInt(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v50 = ProtoModule.readBuffer(Buf, v2)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v50 = ProtoModule.readBuffer(Buf, v2)
				NewModule.value = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v2)
				v2 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v50 = ProtoModule.readFixed32(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v50 = ProtoModule.readFixed64(Buf, v2)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module1:jsonEncode() --[[ Line: 494 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function Module1:jsonDecode() --[[ Line: 510 ]]
	-- upvalues: Module1 (copy)
	local NewModule = Module1.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = self.value
	end
	return NewModule
end

Module1.descriptor = {
	name = "DisplayLocationTemplateMapping_RobloxComponentToTemplateIdEntry",
	fullName = "roblox.apppageplatform.templates.v1beta1.RobloxComponentToTemplateIdEntry"
}
t.DisplayLocationTemplateMapping_RobloxComponentToTemplateIdEntry = Module1
TypeRegistryModule.default:register(t.DisplayLocationTemplateMapping_RobloxComponentToTemplateIdEntry)
local Module2 = {}
Module2.__index = Module2

function Module2.new(p1) --[[ Line: 541 ]]
	-- upvalues: Module2 (copy)
	return (setmetatable({
		display_locations = if p1 == nil or p1.display_locations == nil then {} else p1.display_locations,
		client_capabilities = if p1 == nil or p1.client_capabilities == nil then nil else p1.client_capabilities,
		cached_component_mappings = if p1 == nil or p1.cached_component_mappings == nil then {} else p1.cached_component_mappings,
		locale = if p1 == nil or p1.locale == nil then "" else p1.locale
	}, Module2))
end

function Module2:encode() --[[ Line: 554 ]]
	-- upvalues: ProtoModule (copy), DisplayLocationModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.display_locations ~= nil and #self.display_locations > 0 then
		for _, displayLocation in self.display_locations do
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
			Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, DisplayLocationModule.DisplayLocation.toNumber(displayLocation))
		end
	end
	if self.client_capabilities ~= nil then
		local EncodeResult = self.client_capabilities:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.cached_component_mappings ~= nil and #self.cached_component_mappings > 0 then
		for _, cachedComponentMapping in self.cached_component_mappings do
			local EncodeResult = cachedComponentMapping:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.locale ~= nil and self.locale ~= "" then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.locale)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module2.decode(Buf) --[[ Line: 593 ]]
	-- upvalues: Module2 (copy), ProtoModule (copy), DisplayLocationModule (copy), ClientCapabilitiesModule (copy), t (copy)
	local NewModule = Module2.new()
	local v3 = 0
	while v3 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v75 = ProtoModule.readTag(Buf, v3)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v75 = ProtoModule.readVarIntI32(Buf, v3)
				table.insert(NewModule.display_locations, DisplayLocationModule.DisplayLocation.fromNumber(VarIntI32) or VarIntI32)
			else
				local _
				_, v75 = ProtoModule.readVarInt(Buf, v3)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v75 = ProtoModule.readBuffer(Buf, v3)
				NewModule.client_capabilities = ClientCapabilitiesModule.ClientCapabilities.decode(Buffer1)
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v75 = ProtoModule.readBuffer(Buf, v3)
				table.insert(NewModule.cached_component_mappings, t.DisplayLocationTemplateMapping.decode(Buffer2))
			elseif Tag == 4 then
				local Buffer3
				Buffer3, v75 = ProtoModule.readBuffer(Buf, v3)
				NewModule.locale = buffer.tostring(Buffer3)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v3)
				v3 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v75 = ProtoModule.readFixed32(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v75 = ProtoModule.readFixed64(Buf, v3)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module2:jsonEncode() --[[ Line: 659 ]]
	-- upvalues: DisplayLocationModule (copy)
	local t = {}
	
	if self.display_locations ~= nil and #self.display_locations > 0 then
		local DisplayLocations = {}
		
		for _, displayLocation in self.display_locations do
			table.insert(DisplayLocations, if typeof(displayLocation) == "number" then displayLocation else DisplayLocationModule.DisplayLocation.toNumber(displayLocation))
		end
		t.displayLocations = DisplayLocations
	end
	if self.client_capabilities ~= nil then
		t.clientCapabilities = self.client_capabilities:jsonEncode()
	end
	if self.cached_component_mappings ~= nil and #self.cached_component_mappings > 0 then
		local CachedComponentMappings = {}
		
		for _, cachedComponentMapping in self.cached_component_mappings do
			table.insert(CachedComponentMappings, cachedComponentMapping:jsonEncode())
		end
		t.cachedComponentMappings = CachedComponentMappings
	end
	if self.locale ~= nil and self.locale ~= "" then
		t.locale = self.locale
	end
	return t
end

function Module2:jsonDecode() --[[ Line: 696 ]]
	-- upvalues: Module2 (copy), DisplayLocationModule (copy), ClientCapabilitiesModule (copy), t (copy)
	local NewModule = Module2.new()
	
	if self.display_locations ~= nil then
		local Display_locations = {}
		
		for _, displayLocation in self.display_locations do
			table.insert(Display_locations, (if typeof(displayLocation) == "number" then DisplayLocationModule.DisplayLocation.fromNumber(displayLocation) else DisplayLocationModule.DisplayLocation.fromName(displayLocation)) or displayLocation)
		end
		NewModule.display_locations = Display_locations
	end
	if self.displayLocations ~= nil then
		local Display_locations = {}
		
		for _, displayLocation1 in self.displayLocations do
			table.insert(Display_locations, (if typeof(displayLocation1) == "number" then DisplayLocationModule.DisplayLocation.fromNumber(displayLocation1) else DisplayLocationModule.DisplayLocation.fromName(displayLocation1)) or displayLocation1)
		end
		NewModule.display_locations = Display_locations
	end
	if self.client_capabilities ~= nil then
		NewModule.client_capabilities = ClientCapabilitiesModule.ClientCapabilities.jsonDecode(self.client_capabilities)
	end
	if self.clientCapabilities ~= nil then
		NewModule.client_capabilities = ClientCapabilitiesModule.ClientCapabilities.jsonDecode(self.clientCapabilities)
	end
	if self.cached_component_mappings ~= nil then
		local Cached_component_mappings = {}
		
		for _, cachedComponentMapping in self.cached_component_mappings do
			table.insert(Cached_component_mappings, t.DisplayLocationTemplateMapping.jsonDecode(cachedComponentMapping))
		end
		NewModule.cached_component_mappings = Cached_component_mappings
	end
	if self.cachedComponentMappings ~= nil then
		local Cached_component_mappings = {}
		
		for _, cachedComponentMapping1 in self.cachedComponentMappings do
			table.insert(Cached_component_mappings, t.DisplayLocationTemplateMapping.jsonDecode(cachedComponentMapping1))
		end
		NewModule.cached_component_mappings = Cached_component_mappings
	end
	if self.locale ~= nil then
		NewModule.locale = self.locale
	end
	return NewModule
end

Module2.descriptor = {
	name = "GetTemplatesRequest",
	fullName = "roblox.apppageplatform.templates.v1beta1.GetTemplatesRequest"
}
t.GetTemplatesRequest = Module2
TypeRegistryModule.default:register(t.GetTemplatesRequest)
local Module3 = {}
Module3.__index = Module3

function Module3.new(p1) --[[ Line: 790 ]]
	-- upvalues: Module3 (copy)
	return (setmetatable({
		templates = if p1 == nil or p1.templates == nil then {} else p1.templates,
		component_mappings = if p1 == nil or p1.component_mappings == nil then {} else p1.component_mappings,
		valid_cached_component_mappings = if p1 == nil or p1.valid_cached_component_mappings == nil then {} else p1.valid_cached_component_mappings,
		localized_literals = if p1 == nil or p1.localized_literals == nil then {} else p1.localized_literals
	}, Module3))
end

function Module3:encode() --[[ Line: 801 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, template in self.templates do
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult, WriteStringResult2 = ProtoModule.writeString(WriteTagResult, WriteTagResult2, i)
			local EncodeResult = template:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(WriteStringResult, WriteStringResult2, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult, WriteBufferResult2 = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, WriteBufferResult, WriteBufferResult2)
		end
	end
	if self.component_mappings ~= nil and #self.component_mappings > 0 then
		for _, componentMapping in self.component_mappings do
			local EncodeResult = componentMapping:encode()
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.valid_cached_component_mappings ~= nil and #self.valid_cached_component_mappings > 0 then
		for _, validCachedComponentMapping in self.valid_cached_component_mappings do
			local EncodeResult = validCachedComponentMapping:encode()
			local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult5, WriteTagResult2_4, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.localized_literals ~= nil and next(self.localized_literals) ~= nil then
		for i1, localizedLiteral in self.localized_literals do
			local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult1, WriteStringResult2_1 = ProtoModule.writeString(WriteTagResult6, WriteTagResult2_5, i1)
			local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(WriteStringResult1, WriteStringResult2_1, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult3, WriteStringResult2_2 = ProtoModule.writeString(WriteTagResult7, WriteTagResult2_6, localizedLiteral)
			local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult8, WriteTagResult2_7, WriteStringResult3, WriteStringResult2_2)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module3.decode(Buf) --[[ Line: 853 ]]
	-- upvalues: Module3 (copy), ProtoModule (copy), t (copy), TemplateEntryModule (copy)
	local NewModule = Module3.new()
	local v4 = 0
	while v4 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v125 = ProtoModule.readTag(Buf, v4)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v125 = ProtoModule.readVarInt(Buf, v4)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v125 = ProtoModule.readBuffer(Buf, v4)
				local DecodeResult = t.GetTemplatesResponse_TemplatesEntry.decode(Buffer1)
				local NewResult = TemplateEntryModule.TemplateEntry.new()
				NewModule.templates[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v125 = ProtoModule.readBuffer(Buf, v4)
				table.insert(NewModule.component_mappings, t.DisplayLocationTemplateMapping.decode(Buffer2))
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v125 = ProtoModule.readBuffer(Buf, v4)
				table.insert(NewModule.valid_cached_component_mappings, t.DisplayLocationTemplateMapping.decode(Buffer3))
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v125 = ProtoModule.readBuffer(Buf, v4)
				local DecodeResult = t.GetTemplatesResponse_LocalizedLiteralsEntry.decode(Buffer4)
				NewModule.localized_literals[DecodeResult.key or ""] = DecodeResult.value or ""
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v4)
				v4 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v125 = ProtoModule.readFixed32(Buf, v4)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v125 = ProtoModule.readFixed64(Buf, v4)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module3:jsonEncode() --[[ Line: 928 ]]
	local t = {}
	
	if self.templates ~= nil and next(self.templates) ~= nil then
		local Templates = {}
		
		for i, template in self.templates do
			Templates[i] = template:jsonEncode()
		end
		t.templates = Templates
	end
	if self.component_mappings ~= nil and #self.component_mappings > 0 then
		local ComponentMappings = {}
		
		for _, componentMapping in self.component_mappings do
			table.insert(ComponentMappings, componentMapping:jsonEncode())
		end
		t.componentMappings = ComponentMappings
	end
	if self.valid_cached_component_mappings ~= nil and #self.valid_cached_component_mappings > 0 then
		local ValidCachedComponentMappings = {}
		
		for _, validCachedComponentMapping in self.valid_cached_component_mappings do
			table.insert(ValidCachedComponentMappings, validCachedComponentMapping:jsonEncode())
		end
		t.validCachedComponentMappings = ValidCachedComponentMappings
	end
	if self.localized_literals ~= nil and next(self.localized_literals) ~= nil then
		local LocalizedLiterals = {}
		
		for i1, localizedLiteral in self.localized_literals do
			LocalizedLiterals[i1] = localizedLiteral
		end
		t.localizedLiterals = LocalizedLiterals
	end
	return t
end

function Module3:jsonDecode() --[[ Line: 966 ]]
	-- upvalues: Module3 (copy), TemplateEntryModule (copy), t (copy)
	local NewModule = Module3.new()
	
	if self.templates ~= nil then
		local Templates = {}
		
		for i, template in self.templates do
			Templates[i] = TemplateEntryModule.TemplateEntry.jsonDecode(template)
		end
		NewModule.templates = Templates
	end
	if self.component_mappings ~= nil then
		local Component_mappings = {}
		
		for _, componentMapping in self.component_mappings do
			table.insert(Component_mappings, t.DisplayLocationTemplateMapping.jsonDecode(componentMapping))
		end
		NewModule.component_mappings = Component_mappings
	end
	if self.componentMappings ~= nil then
		local Component_mappings = {}
		
		for _, componentMapping1 in self.componentMappings do
			table.insert(Component_mappings, t.DisplayLocationTemplateMapping.jsonDecode(componentMapping1))
		end
		NewModule.component_mappings = Component_mappings
	end
	if self.valid_cached_component_mappings ~= nil then
		local Valid_cached_component_mappings = {}
		
		for _, validCachedComponentMapping in self.valid_cached_component_mappings do
			table.insert(Valid_cached_component_mappings, t.DisplayLocationTemplateMapping.jsonDecode(validCachedComponentMapping))
		end
		NewModule.valid_cached_component_mappings = Valid_cached_component_mappings
	end
	if self.validCachedComponentMappings ~= nil then
		local Valid_cached_component_mappings = {}
		
		for _, validCachedComponentMapping1 in self.validCachedComponentMappings do
			table.insert(Valid_cached_component_mappings, t.DisplayLocationTemplateMapping.jsonDecode(validCachedComponentMapping1))
		end
		NewModule.valid_cached_component_mappings = Valid_cached_component_mappings
	end
	if self.localized_literals ~= nil then
		local Localized_literals = {}
		
		for i1, localizedLiteral in self.localized_literals do
			Localized_literals[i1] = localizedLiteral
		end
		NewModule.localized_literals = Localized_literals
	end
	if self.localizedLiterals ~= nil then
		local Localized_literals = {}
		
		for i2, localizedLiteral1 in self.localizedLiterals do
			Localized_literals[i2] = localizedLiteral1
		end
		NewModule.localized_literals = Localized_literals
	end
	return NewModule
end

Module3.descriptor = {
	name = "GetTemplatesResponse",
	fullName = "roblox.apppageplatform.templates.v1beta1.GetTemplatesResponse"
}
t.GetTemplatesResponse = Module3
TypeRegistryModule.default:register(t.GetTemplatesResponse)
local Module4 = {}
Module4.__index = Module4

function Module4.new(p1) --[[ Line: 1049 ]]
	-- upvalues: Module4 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module4))
end

function Module4:encode() --[[ Line: 1058 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.key ~= nil and self.key ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.key)
	end
	if self.value ~= nil then
		local EncodeResult = self.value:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module4.decode(Buf) --[[ Line: 1078 ]]
	-- upvalues: Module4 (copy), ProtoModule (copy), TemplateEntryModule (copy)
	local NewModule = Module4.new()
	local v5 = 0
	while v5 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v161 = ProtoModule.readTag(Buf, v5)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v161 = ProtoModule.readVarInt(Buf, v5)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v161 = ProtoModule.readBuffer(Buf, v5)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v161 = ProtoModule.readBuffer(Buf, v5)
				NewModule.value = TemplateEntryModule.TemplateEntry.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v5)
				v5 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v161 = ProtoModule.readFixed32(Buf, v5)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v161 = ProtoModule.readFixed64(Buf, v5)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module4:jsonEncode() --[[ Line: 1126 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module4:jsonDecode() --[[ Line: 1140 ]]
	-- upvalues: Module4 (copy), TemplateEntryModule (copy)
	local NewModule = Module4.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = TemplateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return NewModule
end

Module4.descriptor = {
	name = "GetTemplatesResponse_TemplatesEntry",
	fullName = "roblox.apppageplatform.templates.v1beta1.TemplatesEntry"
}
t.GetTemplatesResponse_TemplatesEntry = Module4
TypeRegistryModule.default:register(t.GetTemplatesResponse_TemplatesEntry)
local Module5 = {}
Module5.__index = Module5

function Module5.new(p1) --[[ Line: 1170 ]]
	-- upvalues: Module5 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then "" else p1.value
	}, Module5))
end

function Module5:encode() --[[ Line: 1179 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.key ~= nil and self.key ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.key)
	end
	if self.value ~= nil and self.value ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.value)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module5.decode(Buf) --[[ Line: 1200 ]]
	-- upvalues: Module5 (copy), ProtoModule (copy)
	local NewModule = Module5.new()
	local v6 = 0
	while v6 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v180 = ProtoModule.readTag(Buf, v6)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v180 = ProtoModule.readVarInt(Buf, v6)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v180 = ProtoModule.readBuffer(Buf, v6)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v180 = ProtoModule.readBuffer(Buf, v6)
				NewModule.value = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v6)
				v6 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v180 = ProtoModule.readFixed32(Buf, v6)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v180 = ProtoModule.readFixed64(Buf, v6)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module5:jsonEncode() --[[ Line: 1250 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function Module5:jsonDecode() --[[ Line: 1266 ]]
	-- upvalues: Module5 (copy)
	local NewModule = Module5.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = self.value
	end
	return NewModule
end

Module5.descriptor = {
	name = "GetTemplatesResponse_LocalizedLiteralsEntry",
	fullName = "roblox.apppageplatform.templates.v1beta1.LocalizedLiteralsEntry"
}
t.GetTemplatesResponse_LocalizedLiteralsEntry = Module5
TypeRegistryModule.default:register(t.GetTemplatesResponse_LocalizedLiteralsEntry)

return {
	DisplayLocationTemplateMapping = t.DisplayLocationTemplateMapping,
	GetTemplatesRequest = t.GetTemplatesRequest,
	GetTemplatesResponse = t.GetTemplatesResponse
}