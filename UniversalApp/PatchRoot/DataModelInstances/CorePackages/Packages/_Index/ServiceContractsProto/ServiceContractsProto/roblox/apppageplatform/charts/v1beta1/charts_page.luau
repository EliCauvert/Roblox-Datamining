local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local HydrationContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.hydration_content)
local HydrationStreamModeModule = require(script.Parent.Parent.Parent.shared.v1beta1.hydration_stream_mode)
local TemplateEntryModule = require(script.Parent.Parent.Parent.shared.v1beta1.template_entry)
local PageEntryContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.page_entry_content)
local ClientCapabilitiesModule = require(script.Parent.Parent.Parent.shared.v1beta1.client_capabilities)
local Module = {}
Module.__index = Module

function Module.new(p1) --[[ Line: 446 ]]
	-- upvalues: HydrationStreamModeModule (copy), Module (copy)
	return (setmetatable({
		feed_page_token = if p1 == nil or p1.feed_page_token == nil then "" else p1.feed_page_token,
		device = if p1 == nil or p1.device == nil then "" else p1.device,
		country = if p1 == nil or p1.country == nil then "" else p1.country,
		age_group = if p1 == nil or p1.age_group == nil then "" else p1.age_group,
		session_id = if p1 == nil or p1.session_id == nil then "" else p1.session_id,
		entry_pagination_key = if p1 == nil or p1.entry_pagination_key == nil then "" else p1.entry_pagination_key,
		entry_page_token = if p1 == nil or p1.entry_page_token == nil then "" else p1.entry_page_token,
		max_memory = if p1 == nil or p1.max_memory == nil then "" else p1.max_memory,
		page_type = if p1 == nil or p1.page_type == nil then "" else p1.page_type,
		include_placeholders = if p1 == nil or p1.include_placeholders == nil then nil else p1.include_placeholders,
		hydration_stream_enabled = if p1 == nil or p1.hydration_stream_enabled == nil then nil else p1.hydration_stream_enabled,
		hydration_stream_mode = if p1 == nil or p1.hydration_stream_mode == nil then assert(HydrationStreamModeModule.HydrationStreamMode.fromNumber(0), "Enum has no 0 default") else p1.hydration_stream_mode,
		collection_layout = if p1 == nil or p1.collection_layout == nil then nil else p1.collection_layout,
		cached_roblox_component_to_template_id = if p1 == nil or p1.cached_roblox_component_to_template_id == nil then {} else p1.cached_roblox_component_to_template_id,
		client_capabilities = if p1 == nil or p1.client_capabilities == nil then nil else p1.client_capabilities,
		audience = if p1 == nil or p1.audience == nil then "" else p1.audience
	}, Module))
end

function Module:encode() --[[ Line: 483 ]]
	-- upvalues: ProtoModule (copy), HydrationStreamModeModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.feed_page_token ~= nil and self.feed_page_token ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.feed_page_token)
	end
	if self.device ~= nil and self.device ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.device)
	end
	if self.country ~= nil and self.country ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.country)
	end
	if self.age_group ~= nil and self.age_group ~= "" then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.age_group)
	end
	if self.session_id ~= nil and self.session_id ~= "" then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult5, WriteTagResult2_4, self.session_id)
	end
	if self.entry_pagination_key ~= nil and self.entry_pagination_key ~= "" then
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult6, WriteTagResult2_5, self.entry_pagination_key)
	end
	if self.entry_page_token ~= nil and self.entry_page_token ~= "" then
		local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult7, WriteTagResult2_6, self.entry_page_token)
	end
	if self.max_memory ~= nil and self.max_memory ~= "" then
		local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(Buf, Count, 8, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult8, WriteTagResult2_7, self.max_memory)
	end
	if self.page_type ~= nil and self.page_type ~= "" then
		local WriteTagResult9, WriteTagResult2_8 = ProtoModule.writeTag(Buf, Count, 9, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult9, WriteTagResult2_8, self.page_type)
	end
	if self.include_placeholders ~= nil then
		local WriteTagResult10, WriteTagResult2_9 = ProtoModule.writeTag(Buf, Count, 10, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult10, WriteTagResult2_9, if self.include_placeholders then 1 else 0)
	end
	if self.hydration_stream_enabled ~= nil then
		local WriteTagResult11, WriteTagResult2_10 = ProtoModule.writeTag(Buf, Count, 11, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult11, WriteTagResult2_10, if self.hydration_stream_enabled then 1 else 0)
	end
	if self.hydration_stream_mode ~= nil and (self.hydration_stream_mode ~= nil and self.hydration_stream_mode ~= 0 or self.hydration_stream_mode ~= HydrationStreamModeModule.HydrationStreamMode.fromNumber(0)) then
		local WriteTagResult12, WriteTagResult2_11 = ProtoModule.writeTag(Buf, Count, 12, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult12, WriteTagResult2_11, HydrationStreamModeModule.HydrationStreamMode.toNumber(self.hydration_stream_mode))
	end
	if self.collection_layout ~= nil then
		local EncodeResult = self.collection_layout:encode()
		local WriteTagResult16, WriteTagResult2_15 = ProtoModule.writeTag(Buf, Count, 13, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult16, WriteTagResult2_15, EncodeResult, buffer.len(EncodeResult))
	end
	if self.cached_roblox_component_to_template_id ~= nil and next(self.cached_roblox_component_to_template_id) ~= nil then
		for i, value in self.cached_roblox_component_to_template_id do
			local WriteTagResult13, WriteTagResult2_12 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult, WriteStringResult2 = ProtoModule.writeString(WriteTagResult13, WriteTagResult2_12, i)
			local WriteTagResult14, WriteTagResult2_13 = ProtoModule.writeTag(WriteStringResult, WriteStringResult2, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult1, WriteStringResult2_1 = ProtoModule.writeString(WriteTagResult14, WriteTagResult2_13, value)
			local WriteTagResult15, WriteTagResult2_14 = ProtoModule.writeTag(Buf, Count, 14, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult15, WriteTagResult2_14, WriteStringResult1, WriteStringResult2_1)
		end
	end
	if self.client_capabilities ~= nil then
		local EncodeResult = self.client_capabilities:encode()
		local WriteTagResult17, WriteTagResult2_16 = ProtoModule.writeTag(Buf, Count, 15, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult17, WriteTagResult2_16, EncodeResult, buffer.len(EncodeResult))
	end
	if self.audience ~= nil and self.audience ~= "" then
		local WriteTagResult18, WriteTagResult2_17 = ProtoModule.writeTag(Buf, Count, 16, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult18, WriteTagResult2_17, self.audience)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf) --[[ Line: 598 ]]
	-- upvalues: Module (copy), ProtoModule (copy), HydrationStreamModeModule (copy), t (copy), ClientCapabilitiesModule (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v65 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 10 then
				local VarInt
				VarInt, v65 = ProtoModule.readVarInt(Buf, v1)
				NewModule.include_placeholders = VarInt ~= 0
			elseif Tag == 11 then
				local VarInt1
				VarInt1, v65 = ProtoModule.readVarInt(Buf, v1)
				NewModule.hydration_stream_enabled = VarInt1 ~= 0
			elseif Tag == 12 then
				local VarIntI32
				VarIntI32, v65 = ProtoModule.readVarIntI32(Buf, v1)
				NewModule.hydration_stream_mode = HydrationStreamModeModule.HydrationStreamMode.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v65 = ProtoModule.readVarInt(Buf, v1)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v65 = ProtoModule.readBuffer(Buf, v1)
				NewModule.feed_page_token = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v65 = ProtoModule.readBuffer(Buf, v1)
				NewModule.device = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v65 = ProtoModule.readBuffer(Buf, v1)
				NewModule.country = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v65 = ProtoModule.readBuffer(Buf, v1)
				NewModule.age_group = buffer.tostring(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v65 = ProtoModule.readBuffer(Buf, v1)
				NewModule.session_id = buffer.tostring(Buffer5)
			elseif Tag == 6 then
				local Buffer6
				Buffer6, v65 = ProtoModule.readBuffer(Buf, v1)
				NewModule.entry_pagination_key = buffer.tostring(Buffer6)
			elseif Tag == 7 then
				local Buffer7
				Buffer7, v65 = ProtoModule.readBuffer(Buf, v1)
				NewModule.entry_page_token = buffer.tostring(Buffer7)
			elseif Tag == 8 then
				local Buffer9
				Buffer9, v65 = ProtoModule.readBuffer(Buf, v1)
				NewModule.max_memory = buffer.tostring(Buffer9)
			elseif Tag == 9 then
				local Buffer10
				Buffer10, v65 = ProtoModule.readBuffer(Buf, v1)
				NewModule.page_type = buffer.tostring(Buffer10)
			elseif Tag == 13 then
				local Buffer11
				Buffer11, v65 = ProtoModule.readBuffer(Buf, v1)
				NewModule.collection_layout = t.CollectionLayoutInfo.decode(Buffer11)
			elseif Tag == 14 then
				local Buffer12
				Buffer12, v65 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.GetChartsPageRequest_CachedRobloxComponentToTemplateIdEntry.decode(Buffer12)
				NewModule.cached_roblox_component_to_template_id[DecodeResult.key or ""] = DecodeResult.value or ""
			elseif Tag == 15 then
				local Buffer13
				Buffer13, v65 = ProtoModule.readBuffer(Buf, v1)
				NewModule.client_capabilities = ClientCapabilitiesModule.ClientCapabilities.decode(Buffer13)
			elseif Tag == 16 then
				local Buffer8
				Buffer8, v65 = ProtoModule.readBuffer(Buf, v1)
				NewModule.audience = buffer.tostring(Buffer8)
			else
				local VarInt2, VarInt2_1 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2_1 + VarInt2
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v65 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v65 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode() --[[ Line: 729 ]]
	-- upvalues: HydrationStreamModeModule (copy)
	local t = {}
	
	if self.feed_page_token ~= nil and self.feed_page_token ~= "" then
		t.feedPageToken = self.feed_page_token
	end
	if self.device ~= nil and self.device ~= "" then
		t.device = self.device
	end
	if self.country ~= nil and self.country ~= "" then
		t.country = self.country
	end
	if self.age_group ~= nil and self.age_group ~= "" then
		t.ageGroup = self.age_group
	end
	if self.session_id ~= nil and self.session_id ~= "" then
		t.sessionId = self.session_id
	end
	if self.entry_pagination_key ~= nil and self.entry_pagination_key ~= "" then
		t.entryPaginationKey = self.entry_pagination_key
	end
	if self.entry_page_token ~= nil and self.entry_page_token ~= "" then
		t.entryPageToken = self.entry_page_token
	end
	if self.max_memory ~= nil and self.max_memory ~= "" then
		t.maxMemory = self.max_memory
	end
	if self.page_type ~= nil and self.page_type ~= "" then
		t.pageType = self.page_type
	end
	if self.include_placeholders ~= nil then
		t.includePlaceholders = self.include_placeholders
	end
	if self.hydration_stream_enabled ~= nil then
		t.hydrationStreamEnabled = self.hydration_stream_enabled
	end
	if self.hydration_stream_mode ~= nil and (self.hydration_stream_mode ~= nil and self.hydration_stream_mode ~= 0 or self.hydration_stream_mode ~= HydrationStreamModeModule.HydrationStreamMode.fromNumber(0)) then
		t.hydrationStreamMode = if typeof(self.hydration_stream_mode) == "number" then self.hydration_stream_mode else HydrationStreamModeModule.HydrationStreamMode.toNumber(self.hydration_stream_mode)
	end
	if self.collection_layout ~= nil then
		t.collectionLayout = self.collection_layout:jsonEncode()
	end
	if self.cached_roblox_component_to_template_id ~= nil and next(self.cached_roblox_component_to_template_id) ~= nil then
		local CachedRobloxComponentToTemplateId = {}
		
		for i, value in self.cached_roblox_component_to_template_id do
			CachedRobloxComponentToTemplateId[i] = value
		end
		t.cachedRobloxComponentToTemplateId = CachedRobloxComponentToTemplateId
	end
	if self.client_capabilities ~= nil then
		t.clientCapabilities = self.client_capabilities:jsonEncode()
	end
	if self.audience ~= nil and self.audience ~= "" then
		t.audience = self.audience
	end
	return t
end

function Module:jsonDecode() --[[ Line: 817 ]]
	-- upvalues: Module (copy), HydrationStreamModeModule (copy), t (copy), ClientCapabilitiesModule (copy)
	local NewModule = Module.new()
	
	if self.feed_page_token ~= nil then
		NewModule.feed_page_token = self.feed_page_token
	end
	if self.feedPageToken ~= nil then
		NewModule.feed_page_token = self.feedPageToken
	end
	if self.device ~= nil then
		NewModule.device = self.device
	end
	if self.country ~= nil then
		NewModule.country = self.country
	end
	if self.age_group ~= nil then
		NewModule.age_group = self.age_group
	end
	if self.ageGroup ~= nil then
		NewModule.age_group = self.ageGroup
	end
	if self.session_id ~= nil then
		NewModule.session_id = self.session_id
	end
	if self.sessionId ~= nil then
		NewModule.session_id = self.sessionId
	end
	if self.entry_pagination_key ~= nil then
		NewModule.entry_pagination_key = self.entry_pagination_key
	end
	if self.entryPaginationKey ~= nil then
		NewModule.entry_pagination_key = self.entryPaginationKey
	end
	if self.entry_page_token ~= nil then
		NewModule.entry_page_token = self.entry_page_token
	end
	if self.entryPageToken ~= nil then
		NewModule.entry_page_token = self.entryPageToken
	end
	if self.max_memory ~= nil then
		NewModule.max_memory = self.max_memory
	end
	if self.maxMemory ~= nil then
		NewModule.max_memory = self.maxMemory
	end
	if self.page_type ~= nil then
		NewModule.page_type = self.page_type
	end
	if self.pageType ~= nil then
		NewModule.page_type = self.pageType
	end
	if self.include_placeholders ~= nil then
		NewModule.include_placeholders = self.include_placeholders
	end
	if self.includePlaceholders ~= nil then
		NewModule.include_placeholders = self.includePlaceholders
	end
	if self.hydration_stream_enabled ~= nil then
		NewModule.hydration_stream_enabled = self.hydration_stream_enabled
	end
	if self.hydrationStreamEnabled ~= nil then
		NewModule.hydration_stream_enabled = self.hydrationStreamEnabled
	end
	if self.hydration_stream_mode ~= nil then
		NewModule.hydration_stream_mode = (if typeof(self.hydration_stream_mode) == "number" then HydrationStreamModeModule.HydrationStreamMode.fromNumber(self.hydration_stream_mode) else HydrationStreamModeModule.HydrationStreamMode.fromName(self.hydration_stream_mode)) or self.hydration_stream_mode
	end
	if self.hydrationStreamMode ~= nil then
		NewModule.hydration_stream_mode = (if typeof(self.hydrationStreamMode) == "number" then HydrationStreamModeModule.HydrationStreamMode.fromNumber(self.hydrationStreamMode) else HydrationStreamModeModule.HydrationStreamMode.fromName(self.hydrationStreamMode)) or self.hydrationStreamMode
	end
	if self.collection_layout ~= nil then
		NewModule.collection_layout = t.CollectionLayoutInfo.jsonDecode(self.collection_layout)
	end
	if self.collectionLayout ~= nil then
		NewModule.collection_layout = t.CollectionLayoutInfo.jsonDecode(self.collectionLayout)
	end
	if self.cached_roblox_component_to_template_id ~= nil then
		local Cached_roblox_component_to_template_id = {}
		
		for i, value in self.cached_roblox_component_to_template_id do
			Cached_roblox_component_to_template_id[i] = value
		end
		NewModule.cached_roblox_component_to_template_id = Cached_roblox_component_to_template_id
	end
	if self.cachedRobloxComponentToTemplateId ~= nil then
		local Cached_roblox_component_to_template_id = {}
		
		for i1, value1 in self.cachedRobloxComponentToTemplateId do
			Cached_roblox_component_to_template_id[i1] = value1
		end
		NewModule.cached_roblox_component_to_template_id = Cached_roblox_component_to_template_id
	end
	if self.client_capabilities ~= nil then
		NewModule.client_capabilities = ClientCapabilitiesModule.ClientCapabilities.jsonDecode(self.client_capabilities)
	end
	if self.clientCapabilities ~= nil then
		NewModule.client_capabilities = ClientCapabilitiesModule.ClientCapabilities.jsonDecode(self.clientCapabilities)
	end
	if self.audience ~= nil then
		NewModule.audience = self.audience
	end
	return NewModule
end

Module.descriptor = {
	name = "GetChartsPageRequest",
	fullName = "roblox.apppageplatform.charts.v1beta1.GetChartsPageRequest"
}
t.GetChartsPageRequest = Module
TypeRegistryModule.default:register(t.GetChartsPageRequest)
local Module1 = {}
Module1.__index = Module1

function Module1.new(p1) --[[ Line: 982 ]]
	-- upvalues: Module1 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then "" else p1.value
	}, Module1))
end

function Module1:encode() --[[ Line: 994 ]]
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

function Module1.decode(Buf) --[[ Line: 1015 ]]
	-- upvalues: Module1 (copy), ProtoModule (copy)
	local NewModule = Module1.new()
	local v2 = 0
	while v2 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v102 = ProtoModule.readTag(Buf, v2)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v102 = ProtoModule.readVarInt(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v102 = ProtoModule.readBuffer(Buf, v2)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v102 = ProtoModule.readBuffer(Buf, v2)
				NewModule.value = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v2)
				v2 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v102 = ProtoModule.readFixed32(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v102 = ProtoModule.readFixed64(Buf, v2)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module1:jsonEncode() --[[ Line: 1065 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function Module1:jsonDecode() --[[ Line: 1081 ]]
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
	name = "GetChartsPageRequest_CachedRobloxComponentToTemplateIdEntry",
	fullName = "roblox.apppageplatform.charts.v1beta1.CachedRobloxComponentToTemplateIdEntry"
}
t.GetChartsPageRequest_CachedRobloxComponentToTemplateIdEntry = Module1
TypeRegistryModule.default:register(t.GetChartsPageRequest_CachedRobloxComponentToTemplateIdEntry)
local Module2 = {}
Module2.__index = Module2

function Module2.new(p1) --[[ Line: 1112 ]]
	-- upvalues: Module2 (copy)
	return (setmetatable({
		items_per_row = if p1 == nil or p1.items_per_row == nil then {} else p1.items_per_row,
		rows_above_fold = if p1 == nil or p1.rows_above_fold == nil then 0 else p1.rows_above_fold
	}, Module2))
end

function Module2:encode() --[[ Line: 1119 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.items_per_row ~= nil and next(self.items_per_row) ~= nil then
		for i, value in self.items_per_row do
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult, WriteStringResult2 = ProtoModule.writeString(WriteTagResult, WriteTagResult2, i)
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(WriteStringResult, WriteStringResult2, 2, ProtoModule.wireTypes.varint)
			local WriteVarIntResult, WriteVarIntResult2 = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, value)
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, WriteVarIntResult, WriteVarIntResult2)
		end
	end
	if self.rows_above_fold ~= nil and self.rows_above_fold ~= 0 then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult4, WriteTagResult2_3, self.rows_above_fold)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module2.decode(Buf) --[[ Line: 1146 ]]
	-- upvalues: Module2 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module2.new()
	local v3 = 0
	while v3 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v129 = ProtoModule.readTag(Buf, v3)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				NewModule.rows_above_fold, v129 = ProtoModule.readVarIntI32(Buf, v3)
			else
				local _
				_, v129 = ProtoModule.readVarInt(Buf, v3)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v129 = ProtoModule.readBuffer(Buf, v3)
				local DecodeResult = t.CollectionLayoutInfo_ItemsPerRowEntry.decode(Buffer1)
				NewModule.items_per_row[DecodeResult.key or ""] = DecodeResult.value or 0
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v3)
				v3 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v129 = ProtoModule.readFixed32(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v129 = ProtoModule.readFixed64(Buf, v3)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module2:jsonEncode() --[[ Line: 1201 ]]
	local t = {}
	
	if self.items_per_row ~= nil and next(self.items_per_row) ~= nil then
		local ItemsPerRow = {}
		
		for i, value in self.items_per_row do
			ItemsPerRow[i] = value
		end
		t.itemsPerRow = ItemsPerRow
	end
	if self.rows_above_fold ~= nil and self.rows_above_fold ~= 0 then
		t.rowsAboveFold = self.rows_above_fold
	end
	return t
end

function Module2:jsonDecode() --[[ Line: 1219 ]]
	-- upvalues: Module2 (copy)
	local NewModule = Module2.new()
	
	if self.items_per_row ~= nil then
		local Items_per_row = {}
		
		for i, value in self.items_per_row do
			Items_per_row[i] = value
		end
		NewModule.items_per_row = Items_per_row
	end
	if self.itemsPerRow ~= nil then
		local Items_per_row = {}
		
		for i1, value1 in self.itemsPerRow do
			Items_per_row[i1] = value1
		end
		NewModule.items_per_row = Items_per_row
	end
	if self.rows_above_fold ~= nil then
		NewModule.rows_above_fold = self.rows_above_fold
	end
	if self.rowsAboveFold ~= nil then
		NewModule.rows_above_fold = self.rowsAboveFold
	end
	return NewModule
end

Module2.descriptor = {
	name = "CollectionLayoutInfo",
	fullName = "roblox.apppageplatform.charts.v1beta1.CollectionLayoutInfo"
}
t.CollectionLayoutInfo = Module2
TypeRegistryModule.default:register(t.CollectionLayoutInfo)
local Module3 = {}
Module3.__index = Module3

function Module3.new(p1) --[[ Line: 1265 ]]
	-- upvalues: Module3 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then 0 else p1.value
	}, Module3))
end

function Module3:encode() --[[ Line: 1274 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.key ~= nil and self.key ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.key)
	end
	if self.value ~= nil and self.value ~= 0 then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, self.value)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module3.decode(Buf) --[[ Line: 1293 ]]
	-- upvalues: Module3 (copy), ProtoModule (copy)
	local NewModule = Module3.new()
	local v4 = 0
	while v4 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v151 = ProtoModule.readTag(Buf, v4)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				NewModule.value, v151 = ProtoModule.readVarIntI32(Buf, v4)
			else
				local _
				_, v151 = ProtoModule.readVarInt(Buf, v4)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v151 = ProtoModule.readBuffer(Buf, v4)
				NewModule.key = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v4)
				v4 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v151 = ProtoModule.readFixed32(Buf, v4)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v151 = ProtoModule.readFixed64(Buf, v4)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module3:jsonEncode() --[[ Line: 1341 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= 0 then
		t.value = self.value
	end
	return t
end

function Module3:jsonDecode() --[[ Line: 1355 ]]
	-- upvalues: Module3 (copy)
	local NewModule = Module3.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = self.value
	end
	return NewModule
end

Module3.descriptor = {
	name = "CollectionLayoutInfo_ItemsPerRowEntry",
	fullName = "roblox.apppageplatform.charts.v1beta1.ItemsPerRowEntry"
}
t.CollectionLayoutInfo_ItemsPerRowEntry = Module3
TypeRegistryModule.default:register(t.CollectionLayoutInfo_ItemsPerRowEntry)
local Module4 = {}
Module4.__index = Module4

function Module4.new(p1) --[[ Line: 1385 ]]
	-- upvalues: Module4 (copy)
	return (setmetatable({
		page_entries = if p1 == nil or p1.page_entries == nil then {} else p1.page_entries,
		hydration_data = if p1 == nil or p1.hydration_data == nil then nil else p1.hydration_data,
		templates = if p1 == nil or p1.templates == nil then {} else p1.templates,
		localized_literals = if p1 == nil or p1.localized_literals == nil then {} else p1.localized_literals
	}, Module4))
end

function Module4:encode() --[[ Line: 1394 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for _, pageEntry in self.page_entries do
			local EncodeResult = pageEntry:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.hydration_data ~= nil then
		local EncodeResult = self.hydration_data:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, template in self.templates do
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult, WriteStringResult2 = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, i)
			local EncodeResult = template:encode()
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(WriteStringResult, WriteStringResult2, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult, WriteBufferResult2 = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult5, WriteTagResult2_4, WriteBufferResult, WriteBufferResult2)
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

function Module4.decode(Buf) --[[ Line: 1444 ]]
	-- upvalues: Module4 (copy), ProtoModule (copy), PageEntryContentModule (copy), HydrationContentModule (copy), t (copy), TemplateEntryModule (copy)
	local NewModule = Module4.new()
	local v5 = 0
	while v5 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v192 = ProtoModule.readTag(Buf, v5)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v192 = ProtoModule.readVarInt(Buf, v5)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v192 = ProtoModule.readBuffer(Buf, v5)
				table.insert(NewModule.page_entries, PageEntryContentModule.UniversalPageEntry.decode(Buffer1))
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v192 = ProtoModule.readBuffer(Buf, v5)
				NewModule.hydration_data = HydrationContentModule.HydrationContent.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v192 = ProtoModule.readBuffer(Buf, v5)
				local DecodeResult = t.GetChartsPageResponse_TemplatesEntry.decode(Buffer3)
				local NewResult = TemplateEntryModule.TemplateEntry.new()
				NewModule.templates[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v192 = ProtoModule.readBuffer(Buf, v5)
				local DecodeResult = t.GetChartsPageResponse_LocalizedLiteralsEntry.decode(Buffer4)
				NewModule.localized_literals[DecodeResult.key or ""] = DecodeResult.value or ""
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v5)
				v5 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v192 = ProtoModule.readFixed32(Buf, v5)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v192 = ProtoModule.readFixed64(Buf, v5)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module4:jsonEncode() --[[ Line: 1520 ]]
	local t = {}
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		local PageEntries = {}
		
		for _, pageEntry in self.page_entries do
			table.insert(PageEntries, pageEntry:jsonEncode())
		end
		t.pageEntries = PageEntries
	end
	if self.hydration_data ~= nil then
		t.hydrationData = self.hydration_data:jsonEncode()
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		local Templates = {}
		
		for i, template in self.templates do
			Templates[i] = template:jsonEncode()
		end
		t.templates = Templates
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

function Module4:jsonDecode() --[[ Line: 1554 ]]
	-- upvalues: Module4 (copy), PageEntryContentModule (copy), HydrationContentModule (copy), TemplateEntryModule (copy)
	local NewModule = Module4.new()
	
	if self.page_entries ~= nil then
		local Page_entries = {}
		
		for _, pageEntry in self.page_entries do
			table.insert(Page_entries, PageEntryContentModule.UniversalPageEntry.jsonDecode(pageEntry))
		end
		NewModule.page_entries = Page_entries
	end
	if self.pageEntries ~= nil then
		local Page_entries = {}
		
		for _, pageEntry1 in self.pageEntries do
			table.insert(Page_entries, PageEntryContentModule.UniversalPageEntry.jsonDecode(pageEntry1))
		end
		NewModule.page_entries = Page_entries
	end
	if self.hydration_data ~= nil then
		NewModule.hydration_data = HydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		NewModule.hydration_data = HydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	if self.templates ~= nil then
		local Templates = {}
		
		for i, template in self.templates do
			Templates[i] = TemplateEntryModule.TemplateEntry.jsonDecode(template)
		end
		NewModule.templates = Templates
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

Module4.descriptor = {
	name = "GetChartsPageResponse",
	fullName = "roblox.apppageplatform.charts.v1beta1.GetChartsPageResponse"
}
t.GetChartsPageResponse = Module4
TypeRegistryModule.default:register(t.GetChartsPageResponse)
local Module5 = {}
Module5.__index = Module5

function Module5.new(p1) --[[ Line: 1637 ]]
	-- upvalues: Module5 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module5))
end

function Module5:encode() --[[ Line: 1646 ]]
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

function Module5.decode(Buf) --[[ Line: 1666 ]]
	-- upvalues: Module5 (copy), ProtoModule (copy), TemplateEntryModule (copy)
	local NewModule = Module5.new()
	local v6 = 0
	while v6 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v225 = ProtoModule.readTag(Buf, v6)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v225 = ProtoModule.readVarInt(Buf, v6)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v225 = ProtoModule.readBuffer(Buf, v6)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v225 = ProtoModule.readBuffer(Buf, v6)
				NewModule.value = TemplateEntryModule.TemplateEntry.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v6)
				v6 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v225 = ProtoModule.readFixed32(Buf, v6)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v225 = ProtoModule.readFixed64(Buf, v6)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module5:jsonEncode() --[[ Line: 1714 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module5:jsonDecode() --[[ Line: 1728 ]]
	-- upvalues: Module5 (copy), TemplateEntryModule (copy)
	local NewModule = Module5.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = TemplateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return NewModule
end

Module5.descriptor = {
	name = "GetChartsPageResponse_TemplatesEntry",
	fullName = "roblox.apppageplatform.charts.v1beta1.TemplatesEntry"
}
t.GetChartsPageResponse_TemplatesEntry = Module5
TypeRegistryModule.default:register(t.GetChartsPageResponse_TemplatesEntry)
local Module6 = {}
Module6.__index = Module6

function Module6.new(p1) --[[ Line: 1758 ]]
	-- upvalues: Module6 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then "" else p1.value
	}, Module6))
end

function Module6:encode() --[[ Line: 1767 ]]
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

function Module6.decode(Buf) --[[ Line: 1788 ]]
	-- upvalues: Module6 (copy), ProtoModule (copy)
	local NewModule = Module6.new()
	local v7 = 0
	while v7 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v244 = ProtoModule.readTag(Buf, v7)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v244 = ProtoModule.readVarInt(Buf, v7)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v244 = ProtoModule.readBuffer(Buf, v7)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v244 = ProtoModule.readBuffer(Buf, v7)
				NewModule.value = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v7)
				v7 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v244 = ProtoModule.readFixed32(Buf, v7)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v244 = ProtoModule.readFixed64(Buf, v7)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module6:jsonEncode() --[[ Line: 1838 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function Module6:jsonDecode() --[[ Line: 1854 ]]
	-- upvalues: Module6 (copy)
	local NewModule = Module6.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = self.value
	end
	return NewModule
end

Module6.descriptor = {
	name = "GetChartsPageResponse_LocalizedLiteralsEntry",
	fullName = "roblox.apppageplatform.charts.v1beta1.LocalizedLiteralsEntry"
}
t.GetChartsPageResponse_LocalizedLiteralsEntry = Module6
TypeRegistryModule.default:register(t.GetChartsPageResponse_LocalizedLiteralsEntry)
local Module7 = {}
Module7.__index = Module7

function Module7.new(p1) --[[ Line: 1884 ]]
	-- upvalues: Module7 (copy)
	return (setmetatable({
		sort_id = if p1 == nil or p1.sort_id == nil then "" else p1.sort_id,
		content_page_token = if p1 == nil or p1.content_page_token == nil then "" else p1.content_page_token,
		device = if p1 == nil or p1.device == nil then "" else p1.device,
		country = if p1 == nil or p1.country == nil then "" else p1.country,
		session_id = if p1 == nil or p1.session_id == nil then "" else p1.session_id,
		age_group = if p1 == nil or p1.age_group == nil then "" else p1.age_group,
		max_memory = if p1 == nil or p1.max_memory == nil then "" else p1.max_memory,
		selected_genre = if p1 == nil or p1.selected_genre == nil then "" else p1.selected_genre,
		cached_roblox_component_to_template_id = if p1 == nil or p1.cached_roblox_component_to_template_id == nil then {} else p1.cached_roblox_component_to_template_id,
		client_capabilities = if p1 == nil or p1.client_capabilities == nil then nil else p1.client_capabilities,
		audience = if p1 == nil or p1.audience == nil then "" else p1.audience
	}, Module7))
end

function Module7:encode() --[[ Line: 1907 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.sort_id)
	end
	if self.content_page_token ~= nil and self.content_page_token ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.content_page_token)
	end
	if self.device ~= nil and self.device ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.device)
	end
	if self.country ~= nil and self.country ~= "" then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.country)
	end
	if self.session_id ~= nil and self.session_id ~= "" then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult5, WriteTagResult2_4, self.session_id)
	end
	if self.age_group ~= nil and self.age_group ~= "" then
		local WriteTagResult9, WriteTagResult2_8 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult9, WriteTagResult2_8, self.age_group)
	end
	if self.max_memory ~= nil and self.max_memory ~= "" then
		local WriteTagResult10, WriteTagResult2_9 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult10, WriteTagResult2_9, self.max_memory)
	end
	if self.selected_genre ~= nil and self.selected_genre ~= "" then
		local WriteTagResult12, WriteTagResult2_11 = ProtoModule.writeTag(Buf, Count, 8, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult12, WriteTagResult2_11, self.selected_genre)
	end
	if self.cached_roblox_component_to_template_id ~= nil and next(self.cached_roblox_component_to_template_id) ~= nil then
		for i, value in self.cached_roblox_component_to_template_id do
			local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult, WriteStringResult2 = ProtoModule.writeString(WriteTagResult6, WriteTagResult2_5, i)
			local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(WriteStringResult, WriteStringResult2, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult1, WriteStringResult2_1 = ProtoModule.writeString(WriteTagResult7, WriteTagResult2_6, value)
			local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(Buf, Count, 9, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult8, WriteTagResult2_7, WriteStringResult1, WriteStringResult2_1)
		end
	end
	if self.client_capabilities ~= nil then
		local EncodeResult = self.client_capabilities:encode()
		local WriteTagResult11, WriteTagResult2_10 = ProtoModule.writeTag(Buf, Count, 10, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult11, WriteTagResult2_10, EncodeResult, buffer.len(EncodeResult))
	end
	if self.audience ~= nil and self.audience ~= "" then
		local WriteTagResult13, WriteTagResult2_12 = ProtoModule.writeTag(Buf, Count, 11, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult13, WriteTagResult2_12, self.audience)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module7.decode(Buf) --[[ Line: 1983 ]]
	-- upvalues: Module7 (copy), ProtoModule (copy), t (copy), ClientCapabilitiesModule (copy)
	local NewModule = Module7.new()
	local v8 = 0
	while v8 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v290 = ProtoModule.readTag(Buf, v8)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v290 = ProtoModule.readVarInt(Buf, v8)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v290 = ProtoModule.readBuffer(Buf, v8)
				NewModule.sort_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v290 = ProtoModule.readBuffer(Buf, v8)
				NewModule.content_page_token = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v290 = ProtoModule.readBuffer(Buf, v8)
				NewModule.device = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v290 = ProtoModule.readBuffer(Buf, v8)
				NewModule.country = buffer.tostring(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v290 = ProtoModule.readBuffer(Buf, v8)
				NewModule.session_id = buffer.tostring(Buffer5)
			elseif Tag == 6 then
				local Buffer6
				Buffer6, v290 = ProtoModule.readBuffer(Buf, v8)
				NewModule.age_group = buffer.tostring(Buffer6)
			elseif Tag == 7 then
				local Buffer7
				Buffer7, v290 = ProtoModule.readBuffer(Buf, v8)
				NewModule.max_memory = buffer.tostring(Buffer7)
			elseif Tag == 8 then
				local Buffer8
				Buffer8, v290 = ProtoModule.readBuffer(Buf, v8)
				NewModule.selected_genre = buffer.tostring(Buffer8)
			elseif Tag == 9 then
				local Buffer9
				Buffer9, v290 = ProtoModule.readBuffer(Buf, v8)
				local DecodeResult = t.GetChartsSortDetailRequest_CachedRobloxComponentToTemplateIdEntry.decode(Buffer9)
				NewModule.cached_roblox_component_to_template_id[DecodeResult.key or ""] = DecodeResult.value or ""
			elseif Tag == 10 then
				local Buffer10
				Buffer10, v290 = ProtoModule.readBuffer(Buf, v8)
				NewModule.client_capabilities = ClientCapabilitiesModule.ClientCapabilities.decode(Buffer10)
			elseif Tag == 11 then
				local Buffer11
				Buffer11, v290 = ProtoModule.readBuffer(Buf, v8)
				NewModule.audience = buffer.tostring(Buffer11)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v8)
				v8 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v290 = ProtoModule.readFixed32(Buf, v8)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v290 = ProtoModule.readFixed64(Buf, v8)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module7:jsonEncode() --[[ Line: 2086 ]]
	local t = {}
	
	if self.sort_id ~= nil and self.sort_id ~= "" then
		t.sortId = self.sort_id
	end
	if self.content_page_token ~= nil and self.content_page_token ~= "" then
		t.contentPageToken = self.content_page_token
	end
	if self.device ~= nil and self.device ~= "" then
		t.device = self.device
	end
	if self.country ~= nil and self.country ~= "" then
		t.country = self.country
	end
	if self.session_id ~= nil and self.session_id ~= "" then
		t.sessionId = self.session_id
	end
	if self.age_group ~= nil and self.age_group ~= "" then
		t.ageGroup = self.age_group
	end
	if self.max_memory ~= nil and self.max_memory ~= "" then
		t.maxMemory = self.max_memory
	end
	if self.selected_genre ~= nil and self.selected_genre ~= "" then
		t.selectedGenre = self.selected_genre
	end
	if self.cached_roblox_component_to_template_id ~= nil and next(self.cached_roblox_component_to_template_id) ~= nil then
		local CachedRobloxComponentToTemplateId = {}
		
		for i, value in self.cached_roblox_component_to_template_id do
			CachedRobloxComponentToTemplateId[i] = value
		end
		t.cachedRobloxComponentToTemplateId = CachedRobloxComponentToTemplateId
	end
	if self.client_capabilities ~= nil then
		t.clientCapabilities = self.client_capabilities:jsonEncode()
	end
	if self.audience ~= nil and self.audience ~= "" then
		t.audience = self.audience
	end
	return t
end

function Module7:jsonDecode() --[[ Line: 2143 ]]
	-- upvalues: Module7 (copy), ClientCapabilitiesModule (copy)
	local NewModule = Module7.new()
	
	if self.sort_id ~= nil then
		NewModule.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		NewModule.sort_id = self.sortId
	end
	if self.content_page_token ~= nil then
		NewModule.content_page_token = self.content_page_token
	end
	if self.contentPageToken ~= nil then
		NewModule.content_page_token = self.contentPageToken
	end
	if self.device ~= nil then
		NewModule.device = self.device
	end
	if self.country ~= nil then
		NewModule.country = self.country
	end
	if self.session_id ~= nil then
		NewModule.session_id = self.session_id
	end
	if self.sessionId ~= nil then
		NewModule.session_id = self.sessionId
	end
	if self.age_group ~= nil then
		NewModule.age_group = self.age_group
	end
	if self.ageGroup ~= nil then
		NewModule.age_group = self.ageGroup
	end
	if self.max_memory ~= nil then
		NewModule.max_memory = self.max_memory
	end
	if self.maxMemory ~= nil then
		NewModule.max_memory = self.maxMemory
	end
	if self.selected_genre ~= nil then
		NewModule.selected_genre = self.selected_genre
	end
	if self.selectedGenre ~= nil then
		NewModule.selected_genre = self.selectedGenre
	end
	if self.cached_roblox_component_to_template_id ~= nil then
		local Cached_roblox_component_to_template_id = {}
		
		for i, value in self.cached_roblox_component_to_template_id do
			Cached_roblox_component_to_template_id[i] = value
		end
		NewModule.cached_roblox_component_to_template_id = Cached_roblox_component_to_template_id
	end
	if self.cachedRobloxComponentToTemplateId ~= nil then
		local Cached_roblox_component_to_template_id = {}
		
		for i1, value1 in self.cachedRobloxComponentToTemplateId do
			Cached_roblox_component_to_template_id[i1] = value1
		end
		NewModule.cached_roblox_component_to_template_id = Cached_roblox_component_to_template_id
	end
	if self.client_capabilities ~= nil then
		NewModule.client_capabilities = ClientCapabilitiesModule.ClientCapabilities.jsonDecode(self.client_capabilities)
	end
	if self.clientCapabilities ~= nil then
		NewModule.client_capabilities = ClientCapabilitiesModule.ClientCapabilities.jsonDecode(self.clientCapabilities)
	end
	if self.audience ~= nil then
		NewModule.audience = self.audience
	end
	return NewModule
end

Module7.descriptor = {
	name = "GetChartsSortDetailRequest",
	fullName = "roblox.apppageplatform.charts.v1beta1.GetChartsSortDetailRequest"
}
t.GetChartsSortDetailRequest = Module7
TypeRegistryModule.default:register(t.GetChartsSortDetailRequest)
local Module8 = {}
Module8.__index = Module8

function Module8.new(p1) --[[ Line: 2256 ]]
	-- upvalues: Module8 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then "" else p1.value
	}, Module8))
end

function Module8:encode() --[[ Line: 2268 ]]
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

function Module8.decode(Buf) --[[ Line: 2289 ]]
	-- upvalues: Module8 (copy), ProtoModule (copy)
	local NewModule = Module8.new()
	local v9 = 0
	while v9 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v322 = ProtoModule.readTag(Buf, v9)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v322 = ProtoModule.readVarInt(Buf, v9)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v322 = ProtoModule.readBuffer(Buf, v9)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v322 = ProtoModule.readBuffer(Buf, v9)
				NewModule.value = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v9)
				v9 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v322 = ProtoModule.readFixed32(Buf, v9)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v322 = ProtoModule.readFixed64(Buf, v9)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module8:jsonEncode() --[[ Line: 2339 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function Module8:jsonDecode() --[[ Line: 2355 ]]
	-- upvalues: Module8 (copy)
	local NewModule = Module8.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = self.value
	end
	return NewModule
end

Module8.descriptor = {
	name = "GetChartsSortDetailRequest_CachedRobloxComponentToTemplateIdEntry",
	fullName = "roblox.apppageplatform.charts.v1beta1.CachedRobloxComponentToTemplateIdEntry"
}
t.GetChartsSortDetailRequest_CachedRobloxComponentToTemplateIdEntry = Module8
TypeRegistryModule.default:register(t.GetChartsSortDetailRequest_CachedRobloxComponentToTemplateIdEntry)
local Module9 = {}
Module9.__index = Module9

function Module9.new(p1) --[[ Line: 2386 ]]
	-- upvalues: Module9 (copy)
	return (setmetatable({
		page_entries = if p1 == nil or p1.page_entries == nil then {} else p1.page_entries,
		hydration_data = if p1 == nil or p1.hydration_data == nil then nil else p1.hydration_data,
		templates = if p1 == nil or p1.templates == nil then {} else p1.templates,
		next_content_page_token = if p1 == nil or p1.next_content_page_token == nil then "" else p1.next_content_page_token,
		localized_literals = if p1 == nil or p1.localized_literals == nil then {} else p1.localized_literals
	}, Module9))
end

function Module9:encode() --[[ Line: 2400 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for _, pageEntry in self.page_entries do
			local EncodeResult = pageEntry:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.hydration_data ~= nil then
		local EncodeResult = self.hydration_data:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, template in self.templates do
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult, WriteStringResult2 = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, i)
			local EncodeResult = template:encode()
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(WriteStringResult, WriteStringResult2, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult, WriteBufferResult2 = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult5, WriteTagResult2_4, WriteBufferResult, WriteBufferResult2)
		end
	end
	if self.next_content_page_token ~= nil and self.next_content_page_token ~= "" then
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult6, WriteTagResult2_5, self.next_content_page_token)
	end
	if self.localized_literals ~= nil and next(self.localized_literals) ~= nil then
		for i1, localizedLiteral in self.localized_literals do
			local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult1, WriteStringResult2_1 = ProtoModule.writeString(WriteTagResult7, WriteTagResult2_6, i1)
			local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(WriteStringResult1, WriteStringResult2_1, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult3, WriteStringResult2_2 = ProtoModule.writeString(WriteTagResult8, WriteTagResult2_7, localizedLiteral)
			local WriteTagResult9, WriteTagResult2_8 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult9, WriteTagResult2_8, WriteStringResult3, WriteStringResult2_2)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module9.decode(Buf) --[[ Line: 2455 ]]
	-- upvalues: Module9 (copy), ProtoModule (copy), PageEntryContentModule (copy), HydrationContentModule (copy), t (copy), TemplateEntryModule (copy)
	local NewModule = Module9.new()
	local v10 = 0
	while v10 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v366 = ProtoModule.readTag(Buf, v10)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v366 = ProtoModule.readVarInt(Buf, v10)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v366 = ProtoModule.readBuffer(Buf, v10)
				table.insert(NewModule.page_entries, PageEntryContentModule.UniversalPageEntry.decode(Buffer1))
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v366 = ProtoModule.readBuffer(Buf, v10)
				NewModule.hydration_data = HydrationContentModule.HydrationContent.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v366 = ProtoModule.readBuffer(Buf, v10)
				local DecodeResult = t.GetChartsSortDetailResponse_TemplatesEntry.decode(Buffer3)
				local NewResult = TemplateEntryModule.TemplateEntry.new()
				NewModule.templates[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v366 = ProtoModule.readBuffer(Buf, v10)
				NewModule.next_content_page_token = buffer.tostring(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v366 = ProtoModule.readBuffer(Buf, v10)
				local DecodeResult = t.GetChartsSortDetailResponse_LocalizedLiteralsEntry.decode(Buffer5)
				NewModule.localized_literals[DecodeResult.key or ""] = DecodeResult.value or ""
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v10)
				v10 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v366 = ProtoModule.readFixed32(Buf, v10)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v366 = ProtoModule.readFixed64(Buf, v10)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module9:jsonEncode() --[[ Line: 2536 ]]
	local t = {}
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		local PageEntries = {}
		
		for _, pageEntry in self.page_entries do
			table.insert(PageEntries, pageEntry:jsonEncode())
		end
		t.pageEntries = PageEntries
	end
	if self.hydration_data ~= nil then
		t.hydrationData = self.hydration_data:jsonEncode()
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		local Templates = {}
		
		for i, template in self.templates do
			Templates[i] = template:jsonEncode()
		end
		t.templates = Templates
	end
	if self.next_content_page_token ~= nil and self.next_content_page_token ~= "" then
		t.nextContentPageToken = self.next_content_page_token
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

function Module9:jsonDecode() --[[ Line: 2574 ]]
	-- upvalues: Module9 (copy), PageEntryContentModule (copy), HydrationContentModule (copy), TemplateEntryModule (copy)
	local NewModule = Module9.new()
	
	if self.page_entries ~= nil then
		local Page_entries = {}
		
		for _, pageEntry in self.page_entries do
			table.insert(Page_entries, PageEntryContentModule.UniversalPageEntry.jsonDecode(pageEntry))
		end
		NewModule.page_entries = Page_entries
	end
	if self.pageEntries ~= nil then
		local Page_entries = {}
		
		for _, pageEntry1 in self.pageEntries do
			table.insert(Page_entries, PageEntryContentModule.UniversalPageEntry.jsonDecode(pageEntry1))
		end
		NewModule.page_entries = Page_entries
	end
	if self.hydration_data ~= nil then
		NewModule.hydration_data = HydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		NewModule.hydration_data = HydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	if self.templates ~= nil then
		local Templates = {}
		
		for i, template in self.templates do
			Templates[i] = TemplateEntryModule.TemplateEntry.jsonDecode(template)
		end
		NewModule.templates = Templates
	end
	if self.next_content_page_token ~= nil then
		NewModule.next_content_page_token = self.next_content_page_token
	end
	if self.nextContentPageToken ~= nil then
		NewModule.next_content_page_token = self.nextContentPageToken
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

Module9.descriptor = {
	name = "GetChartsSortDetailResponse",
	fullName = "roblox.apppageplatform.charts.v1beta1.GetChartsSortDetailResponse"
}
t.GetChartsSortDetailResponse = Module9
TypeRegistryModule.default:register(t.GetChartsSortDetailResponse)
local Module10 = {}
Module10.__index = Module10

function Module10.new(p1) --[[ Line: 2665 ]]
	-- upvalues: Module10 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module10))
end

function Module10:encode() --[[ Line: 2674 ]]
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

function Module10.decode(Buf) --[[ Line: 2696 ]]
	-- upvalues: Module10 (copy), ProtoModule (copy), TemplateEntryModule (copy)
	local NewModule = Module10.new()
	local v11 = 0
	while v11 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v400 = ProtoModule.readTag(Buf, v11)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v400 = ProtoModule.readVarInt(Buf, v11)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v400 = ProtoModule.readBuffer(Buf, v11)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v400 = ProtoModule.readBuffer(Buf, v11)
				NewModule.value = TemplateEntryModule.TemplateEntry.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v11)
				v11 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v400 = ProtoModule.readFixed32(Buf, v11)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v400 = ProtoModule.readFixed64(Buf, v11)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module10:jsonEncode() --[[ Line: 2746 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module10:jsonDecode() --[[ Line: 2762 ]]
	-- upvalues: Module10 (copy), TemplateEntryModule (copy)
	local NewModule = Module10.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = TemplateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return NewModule
end

Module10.descriptor = {
	name = "GetChartsSortDetailResponse_TemplatesEntry",
	fullName = "roblox.apppageplatform.charts.v1beta1.TemplatesEntry"
}
t.GetChartsSortDetailResponse_TemplatesEntry = Module10
TypeRegistryModule.default:register(t.GetChartsSortDetailResponse_TemplatesEntry)
local Module11 = {}
Module11.__index = Module11

function Module11.new(p1) --[[ Line: 2793 ]]
	-- upvalues: Module11 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then "" else p1.value
	}, Module11))
end

function Module11:encode() --[[ Line: 2805 ]]
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

function Module11.decode(Buf) --[[ Line: 2826 ]]
	-- upvalues: Module11 (copy), ProtoModule (copy)
	local NewModule = Module11.new()
	local v12 = 0
	while v12 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v419 = ProtoModule.readTag(Buf, v12)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v419 = ProtoModule.readVarInt(Buf, v12)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v419 = ProtoModule.readBuffer(Buf, v12)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v419 = ProtoModule.readBuffer(Buf, v12)
				NewModule.value = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v12)
				v12 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v419 = ProtoModule.readFixed32(Buf, v12)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v419 = ProtoModule.readFixed64(Buf, v12)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module11:jsonEncode() --[[ Line: 2876 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function Module11:jsonDecode() --[[ Line: 2892 ]]
	-- upvalues: Module11 (copy)
	local NewModule = Module11.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = self.value
	end
	return NewModule
end

Module11.descriptor = {
	name = "GetChartsSortDetailResponse_LocalizedLiteralsEntry",
	fullName = "roblox.apppageplatform.charts.v1beta1.LocalizedLiteralsEntry"
}
t.GetChartsSortDetailResponse_LocalizedLiteralsEntry = Module11
TypeRegistryModule.default:register(t.GetChartsSortDetailResponse_LocalizedLiteralsEntry)

return {
	GetChartsPageRequest = t.GetChartsPageRequest,
	CollectionLayoutInfo = t.CollectionLayoutInfo,
	GetChartsPageResponse = t.GetChartsPageResponse,
	GetChartsSortDetailRequest = t.GetChartsSortDetailRequest,
	GetChartsSortDetailResponse = t.GetChartsSortDetailResponse
}