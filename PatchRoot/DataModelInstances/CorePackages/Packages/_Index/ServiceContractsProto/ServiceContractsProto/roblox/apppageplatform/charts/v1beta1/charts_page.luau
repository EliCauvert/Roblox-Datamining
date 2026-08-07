-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:14 2026 Pacific Standard Time.

local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local hydrationContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.hydration_content)
local hydrationStreamModeModule = require(script.Parent.Parent.Parent.shared.v1beta1.hydration_stream_mode)
local templateEntryModule = require(script.Parent.Parent.Parent.shared.v1beta1.template_entry)
local pageEntryContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.page_entry_content)
local clientCapabilitiesModule = require(script.Parent.Parent.Parent.shared.v1beta1.client_capabilities)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 442 ]]
	-- upvalues: hydrationStreamModeModule (ref), t_1 (ref)
	return setmetatable({
		feed_page_token = if p0 == nil or p0.feed_page_token == nil then "" else p0.feed_page_token,
		device = if p0 == nil or p0.device == nil then "" else p0.device,
		country = if p0 == nil or p0.country == nil then "" else p0.country,
		age_group = if p0 == nil or p0.age_group == nil then "" else p0.age_group,
		session_id = if p0 == nil or p0.session_id == nil then "" else p0.session_id,
		entry_pagination_key = if p0 == nil or p0.entry_pagination_key == nil then "" else p0.entry_pagination_key,
		entry_page_token = if p0 == nil or p0.entry_page_token == nil then "" else p0.entry_page_token,
		max_memory = if p0 == nil or p0.max_memory == nil then "" else p0.max_memory,
		page_type = if p0 == nil or p0.page_type == nil then "" else p0.page_type,
		include_placeholders = if p0 == nil or p0.include_placeholders == nil then nil else p0.include_placeholders,
		hydration_stream_enabled = if p0 == nil or p0.hydration_stream_enabled == nil then nil else p0.hydration_stream_enabled,
		hydration_stream_mode = if p0 == nil or p0.hydration_stream_mode == nil then assert(hydrationStreamModeModule.HydrationStreamMode.fromNumber(0), "Enum has no 0 default") else p0.hydration_stream_mode,
		collection_layout = if p0 == nil or p0.collection_layout == nil then nil else p0.collection_layout,
		cached_roblox_component_to_template_id = if p0 == nil or p0.cached_roblox_component_to_template_id == nil then {} else p0.cached_roblox_component_to_template_id,
		client_capabilities = if p0 == nil or p0.client_capabilities == nil then nil else p0.client_capabilities
	}, t_1)
end

function t_1:encode() --[[ line: 478 ]]
	-- upvalues: protoModule (ref), hydrationStreamModeModule (ref)
	local buff = buffer.create(0)
	local var21 = 0
	
	if self.feed_page_token ~= nil and self.feed_page_token ~= "" then
		local var22, var23 = protoModule.writeTag(buff, var21, 1, protoModule.wireTypes.lengthDelimited)
		var22, var23 = protoModule.writeString(var22, var23, self.feed_page_token)
		buff = var22
		var21 = var23
	end
	if self.device ~= nil and self.device ~= "" then
		local var24, var25 = protoModule.writeTag(buff, var21, 2, protoModule.wireTypes.lengthDelimited)
		var24, var25 = protoModule.writeString(var24, var25, self.device)
		buff = var24
		var21 = var25
	end
	if self.country ~= nil and self.country ~= "" then
		local var26, var27 = protoModule.writeTag(buff, var21, 3, protoModule.wireTypes.lengthDelimited)
		var26, var27 = protoModule.writeString(var26, var27, self.country)
		buff = var26
		var21 = var27
	end
	if self.age_group ~= nil and self.age_group ~= "" then
		local var28, var29 = protoModule.writeTag(buff, var21, 4, protoModule.wireTypes.lengthDelimited)
		var28, var29 = protoModule.writeString(var28, var29, self.age_group)
		buff = var28
		var21 = var29
	end
	if self.session_id ~= nil and self.session_id ~= "" then
		local var30, var31 = protoModule.writeTag(buff, var21, 5, protoModule.wireTypes.lengthDelimited)
		var30, var31 = protoModule.writeString(var30, var31, self.session_id)
		buff = var30
		var21 = var31
	end
	if self.entry_pagination_key ~= nil and self.entry_pagination_key ~= "" then
		local var32, var33 = protoModule.writeTag(buff, var21, 6, protoModule.wireTypes.lengthDelimited)
		var32, var33 = protoModule.writeString(var32, var33, self.entry_pagination_key)
		buff = var32
		var21 = var33
	end
	if self.entry_page_token ~= nil and self.entry_page_token ~= "" then
		local var34, var35 = protoModule.writeTag(buff, var21, 7, protoModule.wireTypes.lengthDelimited)
		var34, var35 = protoModule.writeString(var34, var35, self.entry_page_token)
		buff = var34
		var21 = var35
	end
	if self.max_memory ~= nil and self.max_memory ~= "" then
		local var36, var37 = protoModule.writeTag(buff, var21, 8, protoModule.wireTypes.lengthDelimited)
		var36, var37 = protoModule.writeString(var36, var37, self.max_memory)
		buff = var36
		var21 = var37
	end
	if self.page_type ~= nil and self.page_type ~= "" then
		local var38, var39 = protoModule.writeTag(buff, var21, 9, protoModule.wireTypes.lengthDelimited)
		var38, var39 = protoModule.writeString(var38, var39, self.page_type)
		buff = var38
		var21 = var39
	end
	if self.include_placeholders ~= nil then
		local var40, var41 = protoModule.writeTag(buff, var21, 10, protoModule.wireTypes.varint)
		var40, var41 = protoModule.writeVarInt(var40, var41, if self.include_placeholders then 1 else 0)
		buff = var40
		var21 = var41
	end
	if self.hydration_stream_enabled ~= nil then
		local var42, var43 = protoModule.writeTag(buff, var21, 11, protoModule.wireTypes.varint)
		var42, var43 = protoModule.writeVarInt(var42, var43, if self.hydration_stream_enabled then 1 else 0)
		buff = var42
		var21 = var43
	end
	if self.hydration_stream_mode ~= nil and (self.hydration_stream_mode ~= nil and self.hydration_stream_mode ~= 0 or self.hydration_stream_mode ~= hydrationStreamModeModule.HydrationStreamMode.fromNumber(0)) then
		local var44, var45 = protoModule.writeTag(buff, var21, 12, protoModule.wireTypes.varint)
		var44, var45 = protoModule.writeVarInt(var44, var45, hydrationStreamModeModule.HydrationStreamMode.toNumber(self.hydration_stream_mode))
		buff = var44
		var21 = var45
	end
	if self.collection_layout ~= nil then
		local var46 = self.collection_layout:encode()
		local var47, var48 = protoModule.writeTag(buff, var21, 13, protoModule.wireTypes.lengthDelimited)
		var47, var48 = protoModule.writeBuffer(var47, var48, var46, buffer.len(var46))
		buff = var47
		var21 = var48
	end
	if self.cached_roblox_component_to_template_id ~= nil and next(self.cached_roblox_component_to_template_id) ~= nil then
		for i, v in self.cached_roblox_component_to_template_id do
			local var49, var50 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var49, var50 = protoModule.writeString(var49, var50, i)
			var49, var50 = protoModule.writeTag(var49, var50, 2, protoModule.wireTypes.lengthDelimited)
			var49, var50 = protoModule.writeString(var49, var50, v)
			local var51 = var49
			local var52 = var50
			local var53, var54 = protoModule.writeTag(buff, var21, 14, protoModule.wireTypes.lengthDelimited)
			var53, var54 = protoModule.writeBuffer(var53, var54, var51, var52)
			buff = var53
			var21 = var54
		end
	end
	if self.client_capabilities ~= nil then
		local var55 = self.client_capabilities:encode()
		local var56, var57 = protoModule.writeTag(buff, var21, 15, protoModule.wireTypes.lengthDelimited)
		var56, var57 = protoModule.writeBuffer(var56, var57, var55, buffer.len(var55))
		buff = var56
		var21 = var57
	end
	local buff_1 = buffer.create(var21)
	buffer.copy(buff_1, 0, buff, 0, var21)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 588 ]]
	-- upvalues: t_1 (ref), protoModule (ref), hydrationStreamModeModule (ref), t (ref), clientCapabilitiesModule (ref)
	local var59 = t_1.new()
	local var60 = 0
	while var60 < buffer.len(p1) do
		local _ = nil
		local var61 = nil
		local var62, var63, var64 = protoModule.readTag(p1, var60)
		local var65 = var62
		var61 = var63
		var60 = var64
		
		if var61 == protoModule.wireTypes.varint then
			if var65 == 10 then
				local _ = nil
				local var66, var67 = protoModule.readVarInt(p1, var60)
				var60 = var67
				var59.include_placeholders = var66 ~= 0
			elseif var65 == 11 then
				local _ = nil
				local var68, var69 = protoModule.readVarInt(p1, var60)
				var60 = var69
				var59.hydration_stream_enabled = var68 ~= 0
			elseif var65 == 12 then
				local _ = nil
				local var70, var71 = protoModule.readVarIntI32(p1, var60)
				local var72 = var70
				var60 = var71
				var59.hydration_stream_mode = hydrationStreamModeModule.HydrationStreamMode.fromNumber(var72) or var72
			else
				local _ = nil
				local var73, var74 = protoModule.readVarInt(p1, var60)
				local _ = var73
				var60 = var74
			end
		end
		if var61 == protoModule.wireTypes.lengthDelimited then
			if var65 == 1 then
				local _ = nil
				local var75, var76 = protoModule.readBuffer(p1, var60)
				var60 = var76
				var59.feed_page_token = buffer.tostring(var75)
			elseif var65 == 2 then
				local _ = nil
				local var77, var78 = protoModule.readBuffer(p1, var60)
				var60 = var78
				var59.device = buffer.tostring(var77)
			elseif var65 == 3 then
				local _ = nil
				local var79, var80 = protoModule.readBuffer(p1, var60)
				var60 = var80
				var59.country = buffer.tostring(var79)
			elseif var65 == 4 then
				local _ = nil
				local var81, var82 = protoModule.readBuffer(p1, var60)
				var60 = var82
				var59.age_group = buffer.tostring(var81)
			elseif var65 == 5 then
				local _ = nil
				local var83, var84 = protoModule.readBuffer(p1, var60)
				var60 = var84
				var59.session_id = buffer.tostring(var83)
			elseif var65 == 6 then
				local _ = nil
				local var85, var86 = protoModule.readBuffer(p1, var60)
				var60 = var86
				var59.entry_pagination_key = buffer.tostring(var85)
			elseif var65 == 7 then
				local _ = nil
				local var87, var88 = protoModule.readBuffer(p1, var60)
				var60 = var88
				var59.entry_page_token = buffer.tostring(var87)
			elseif var65 == 8 then
				local _ = nil
				local var89, var90 = protoModule.readBuffer(p1, var60)
				var60 = var90
				var59.max_memory = buffer.tostring(var89)
			elseif var65 == 9 then
				local _ = nil
				local var91, var92 = protoModule.readBuffer(p1, var60)
				var60 = var92
				var59.page_type = buffer.tostring(var91)
			elseif var65 == 13 then
				local _ = nil
				local var93, var94 = protoModule.readBuffer(p1, var60)
				var60 = var94
				var59.collection_layout = t.CollectionLayoutInfo.decode(var93)
			elseif var65 == 14 then
				local _ = nil
				local var95, var96 = protoModule.readBuffer(p1, var60)
				var60 = var96
				var95 = t.GetChartsPageRequest_CachedRobloxComponentToTemplateIdEntry.decode(var95)
				var59.cached_roblox_component_to_template_id[var95.key or ""] = var95.value or ""
			elseif var65 == 15 then
				local _ = nil
				local var97, var98 = protoModule.readBuffer(p1, var60)
				var60 = var98
				var59.client_capabilities = clientCapabilitiesModule.ClientCapabilities.decode(var97)
			else
				local _ = nil
				local var99, var100 = protoModule.readVarInt(p1, var60)
				var60 = var100 + var99
			end
		elseif var61 == protoModule.wireTypes.i32 then
			local _ = nil
			local var101, var102 = protoModule.readFixed32(p1, var60)
			local _ = var101
			var60 = var102
		elseif var61 == protoModule.wireTypes.i64 then
			local _ = nil
			local var103, var104 = protoModule.readFixed64(p1, var60)
			local _ = var103
			var60 = var104
		else
			error("Unsupported wire type: " .. var61)
		end
	end
	return var59
end

function t_1:jsonEncode() --[[ line: 714 ]]
	-- upvalues: hydrationStreamModeModule (ref)
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
	if self.hydration_stream_mode ~= nil and (self.hydration_stream_mode ~= nil and self.hydration_stream_mode ~= 0 or self.hydration_stream_mode ~= hydrationStreamModeModule.HydrationStreamMode.fromNumber(0)) then
		t.hydrationStreamMode = if typeof(self.hydration_stream_mode) == "number" then self.hydration_stream_mode else hydrationStreamModeModule.HydrationStreamMode.toNumber(self.hydration_stream_mode)
	end
	if self.collection_layout ~= nil then
		t.collectionLayout = self.collection_layout:jsonEncode()
	end
	if self.cached_roblox_component_to_template_id ~= nil and next(self.cached_roblox_component_to_template_id) ~= nil then
		local t_1 = {}
		
		for i, v in self.cached_roblox_component_to_template_id do
			t_1[i] = v
		end
		t.cachedRobloxComponentToTemplateId = t_1
	end
	if self.client_capabilities ~= nil then
		t.clientCapabilities = self.client_capabilities:jsonEncode()
	end
	return t
end

function t_1:jsonDecode() --[[ line: 798 ]]
	-- upvalues: t_1 (ref), hydrationStreamModeModule (ref), t (ref), clientCapabilitiesModule (ref)
	local var107 = t_1.new()
	
	if self.feed_page_token ~= nil then
		var107.feed_page_token = self.feed_page_token
	end
	if self.feedPageToken ~= nil then
		var107.feed_page_token = self.feedPageToken
	end
	if self.device ~= nil then
		var107.device = self.device
	end
	if self.country ~= nil then
		var107.country = self.country
	end
	if self.age_group ~= nil then
		var107.age_group = self.age_group
	end
	if self.ageGroup ~= nil then
		var107.age_group = self.ageGroup
	end
	if self.session_id ~= nil then
		var107.session_id = self.session_id
	end
	if self.sessionId ~= nil then
		var107.session_id = self.sessionId
	end
	if self.entry_pagination_key ~= nil then
		var107.entry_pagination_key = self.entry_pagination_key
	end
	if self.entryPaginationKey ~= nil then
		var107.entry_pagination_key = self.entryPaginationKey
	end
	if self.entry_page_token ~= nil then
		var107.entry_page_token = self.entry_page_token
	end
	if self.entryPageToken ~= nil then
		var107.entry_page_token = self.entryPageToken
	end
	if self.max_memory ~= nil then
		var107.max_memory = self.max_memory
	end
	if self.maxMemory ~= nil then
		var107.max_memory = self.maxMemory
	end
	if self.page_type ~= nil then
		var107.page_type = self.page_type
	end
	if self.pageType ~= nil then
		var107.page_type = self.pageType
	end
	if self.include_placeholders ~= nil then
		var107.include_placeholders = self.include_placeholders
	end
	if self.includePlaceholders ~= nil then
		var107.include_placeholders = self.includePlaceholders
	end
	if self.hydration_stream_enabled ~= nil then
		var107.hydration_stream_enabled = self.hydration_stream_enabled
	end
	if self.hydrationStreamEnabled ~= nil then
		var107.hydration_stream_enabled = self.hydrationStreamEnabled
	end
	if self.hydration_stream_mode ~= nil then
		var107.hydration_stream_mode = if typeof(self.hydration_stream_mode) == "number" then hydrationStreamModeModule.HydrationStreamMode.fromNumber(self.hydration_stream_mode) or self.hydration_stream_mode else hydrationStreamModeModule.HydrationStreamMode.fromName(self.hydration_stream_mode) or self.hydration_stream_mode
	end
	if self.hydrationStreamMode ~= nil then
		var107.hydration_stream_mode = if typeof(self.hydrationStreamMode) == "number" then hydrationStreamModeModule.HydrationStreamMode.fromNumber(self.hydrationStreamMode) or self.hydrationStreamMode else hydrationStreamModeModule.HydrationStreamMode.fromName(self.hydrationStreamMode) or self.hydrationStreamMode
	end
	if self.collection_layout ~= nil then
		var107.collection_layout = t.CollectionLayoutInfo.jsonDecode(self.collection_layout)
	end
	if self.collectionLayout ~= nil then
		var107.collection_layout = t.CollectionLayoutInfo.jsonDecode(self.collectionLayout)
	end
	if self.cached_roblox_component_to_template_id ~= nil then
		local t_2 = {}
		
		for i, v in self.cached_roblox_component_to_template_id do
			t_2[i] = v
		end
		var107.cached_roblox_component_to_template_id = t_2
	end
	if self.cachedRobloxComponentToTemplateId ~= nil then
		local t_2 = {}
		
		for i, v in self.cachedRobloxComponentToTemplateId do
			t_2[i] = v
		end
		var107.cached_roblox_component_to_template_id = t_2
	end
	if self.client_capabilities ~= nil then
		var107.client_capabilities = clientCapabilitiesModule.ClientCapabilities.jsonDecode(self.client_capabilities)
	end
	if self.clientCapabilities ~= nil then
		var107.client_capabilities = clientCapabilitiesModule.ClientCapabilities.jsonDecode(self.clientCapabilities)
	end
	return var107
end

t_1.descriptor = {
	name = "GetChartsPageRequest",
	fullName = "roblox.apppageplatform.charts.v1beta1.GetChartsPageRequest"
}
t.GetChartsPageRequest = t_1
typeRegistryModule.default:register(t.GetChartsPageRequest)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2) --[[ line: 959 ]]
	-- upvalues: t_2 (ref)
	return setmetatable({
		key = if p2 == nil or p2.key == nil then "" else p2.key,
		value = if p2 == nil or p2.value == nil then "" else p2.value
	}, t_2)
end

function t_2:encode() --[[ line: 971 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var111 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var112, var113 = protoModule.writeTag(buff, var111, 1, protoModule.wireTypes.lengthDelimited)
		var112, var113 = protoModule.writeString(var112, var113, self.key)
		buff = var112
		var111 = var113
	end
	if self.value ~= nil and self.value ~= "" then
		local var114, var115 = protoModule.writeTag(buff, var111, 2, protoModule.wireTypes.lengthDelimited)
		var114, var115 = protoModule.writeString(var114, var115, self.value)
		buff = var114
		var111 = var115
	end
	local buff_1 = buffer.create(var111)
	buffer.copy(buff_1, 0, buff, 0, var111)
	
	return buff_1
end

function t_2.decode(p3) --[[ line: 992 ]]
	-- upvalues: t_2 (ref), protoModule (ref)
	local var117 = t_2.new()
	local var118 = 0
	while var118 < buffer.len(p3) do
		local _ = nil
		local var119 = nil
		local var120, var121, var122 = protoModule.readTag(p3, var118)
		local var123 = var120
		var119 = var121
		var118 = var122
		
		if var119 == protoModule.wireTypes.varint then
			local _ = nil
			local var124, var125 = protoModule.readVarInt(p3, var118)
			local _ = var124
			var118 = var125
			continue
		end
		if var119 == protoModule.wireTypes.lengthDelimited then
			if var123 == 1 then
				local _ = nil
				local var126, var127 = protoModule.readBuffer(p3, var118)
				var118 = var127
				var117.key = buffer.tostring(var126)
			elseif var123 == 2 then
				local _ = nil
				local var128, var129 = protoModule.readBuffer(p3, var118)
				var118 = var129
				var117.value = buffer.tostring(var128)
			else
				local _ = nil
				local var130, var131 = protoModule.readVarInt(p3, var118)
				var118 = var131 + var130
			end
		elseif var119 == protoModule.wireTypes.i32 then
			local _ = nil
			local var132, var133 = protoModule.readFixed32(p3, var118)
			local _ = var132
			var118 = var133
		elseif var119 == protoModule.wireTypes.i64 then
			local _ = nil
			local var134, var135 = protoModule.readFixed64(p3, var118)
			local _ = var134
			var118 = var135
		else
			error("Unsupported wire type: " .. var119)
		end
	end
	return var117
end

function t_2:jsonEncode() --[[ line: 1042 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function t_2:jsonDecode() --[[ line: 1058 ]]
	-- upvalues: t_2 (ref)
	local var137 = t_2.new()
	
	if self.key ~= nil then
		var137.key = self.key
	end
	if self.value ~= nil then
		var137.value = self.value
	end
	return var137
end

t_2.descriptor = {
	name = "GetChartsPageRequest_CachedRobloxComponentToTemplateIdEntry",
	fullName = "roblox.apppageplatform.charts.v1beta1.CachedRobloxComponentToTemplateIdEntry"
}
t.GetChartsPageRequest_CachedRobloxComponentToTemplateIdEntry = t_2
typeRegistryModule.default:register(t.GetChartsPageRequest_CachedRobloxComponentToTemplateIdEntry)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p4) --[[ line: 1089 ]]
	-- upvalues: t_3 (ref)
	return setmetatable({
		items_per_row = if p4 == nil or p4.items_per_row == nil then {} else p4.items_per_row,
		rows_above_fold = if p4 == nil or p4.rows_above_fold == nil then 0 else p4.rows_above_fold
	}, t_3)
end

function t_3:encode() --[[ line: 1096 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var139 = 0
	
	if self.items_per_row ~= nil and next(self.items_per_row) ~= nil then
		for i, v in self.items_per_row do
			local var140, var141 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var140, var141 = protoModule.writeString(var140, var141, i)
			var140, var141 = protoModule.writeTag(var140, var141, 2, protoModule.wireTypes.varint)
			var140, var141 = protoModule.writeVarInt(var140, var141, v)
			local var142 = var140
			local var143 = var141
			local var144, var145 = protoModule.writeTag(buff, var139, 1, protoModule.wireTypes.lengthDelimited)
			var144, var145 = protoModule.writeBuffer(var144, var145, var142, var143)
			buff = var144
			var139 = var145
		end
	end
	if self.rows_above_fold ~= nil and self.rows_above_fold ~= 0 then
		local var146, var147 = protoModule.writeTag(buff, var139, 2, protoModule.wireTypes.varint)
		var146, var147 = protoModule.writeVarInt(var146, var147, self.rows_above_fold)
		buff = var146
		var139 = var147
	end
	local buff_1 = buffer.create(var139)
	buffer.copy(buff_1, 0, buff, 0, var139)
	
	return buff_1
end

function t_3.decode(p5) --[[ line: 1123 ]]
	-- upvalues: t_3 (ref), protoModule (ref), t (ref)
	local var149 = t_3.new()
	local var150 = 0
	while var150 < buffer.len(p5) do
		local _ = nil
		local var151 = nil
		local var152, var153, var154 = protoModule.readTag(p5, var150)
		local var155 = var152
		var151 = var153
		var150 = var154
		
		if var151 == protoModule.wireTypes.varint then
			if var155 == 2 then
				local _ = nil
				local var156, var157 = protoModule.readVarIntI32(p5, var150)
				var150 = var157
				var149.rows_above_fold = var156
			else
				local _ = nil
				local var158, var159 = protoModule.readVarInt(p5, var150)
				local _ = var158
				var150 = var159
			end
		end
		if var151 == protoModule.wireTypes.lengthDelimited then
			if var155 == 1 then
				local _ = nil
				local var160, var161 = protoModule.readBuffer(p5, var150)
				var150 = var161
				var160 = t.CollectionLayoutInfo_ItemsPerRowEntry.decode(var160)
				var149.items_per_row[var160.key or ""] = var160.value or 0
			else
				local _ = nil
				local var162, var163 = protoModule.readVarInt(p5, var150)
				var150 = var163 + var162
			end
		elseif var151 == protoModule.wireTypes.i32 then
			local _ = nil
			local var164, var165 = protoModule.readFixed32(p5, var150)
			local _ = var164
			var150 = var165
		elseif var151 == protoModule.wireTypes.i64 then
			local _ = nil
			local var166, var167 = protoModule.readFixed64(p5, var150)
			local _ = var166
			var150 = var167
		else
			error("Unsupported wire type: " .. var151)
		end
	end
	return var149
end

function t_3:jsonEncode() --[[ line: 1178 ]]
	local t = {}
	
	if self.items_per_row ~= nil and next(self.items_per_row) ~= nil then
		local t_1 = {}
		
		for i, v in self.items_per_row do
			t_1[i] = v
		end
		t.itemsPerRow = t_1
	end
	if self.rows_above_fold ~= nil and self.rows_above_fold ~= 0 then
		t.rowsAboveFold = self.rows_above_fold
	end
	return t
end

function t_3:jsonDecode() --[[ line: 1196 ]]
	-- upvalues: t_3 (ref)
	local var170 = t_3.new()
	
	if self.items_per_row ~= nil then
		local t = {}
		
		for i, v in self.items_per_row do
			t[i] = v
		end
		var170.items_per_row = t
	end
	if self.itemsPerRow ~= nil then
		local t = {}
		
		for i, v in self.itemsPerRow do
			t[i] = v
		end
		var170.items_per_row = t
	end
	if self.rows_above_fold ~= nil then
		var170.rows_above_fold = self.rows_above_fold
	end
	if self.rowsAboveFold ~= nil then
		var170.rows_above_fold = self.rowsAboveFold
	end
	return var170
end

t_3.descriptor = {
	name = "CollectionLayoutInfo",
	fullName = "roblox.apppageplatform.charts.v1beta1.CollectionLayoutInfo"
}
t.CollectionLayoutInfo = t_3
typeRegistryModule.default:register(t.CollectionLayoutInfo)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p6) --[[ line: 1242 ]]
	-- upvalues: t_4 (ref)
	return setmetatable({
		key = if p6 == nil or p6.key == nil then "" else p6.key,
		value = if p6 == nil or p6.value == nil then 0 else p6.value
	}, t_4)
end

function t_4:encode() --[[ line: 1251 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var174 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var175, var176 = protoModule.writeTag(buff, var174, 1, protoModule.wireTypes.lengthDelimited)
		var175, var176 = protoModule.writeString(var175, var176, self.key)
		buff = var175
		var174 = var176
	end
	if self.value ~= nil and self.value ~= 0 then
		local var177, var178 = protoModule.writeTag(buff, var174, 2, protoModule.wireTypes.varint)
		var177, var178 = protoModule.writeVarInt(var177, var178, self.value)
		buff = var177
		var174 = var178
	end
	local buff_1 = buffer.create(var174)
	buffer.copy(buff_1, 0, buff, 0, var174)
	
	return buff_1
end

function t_4.decode(p7) --[[ line: 1270 ]]
	-- upvalues: t_4 (ref), protoModule (ref)
	local var180 = t_4.new()
	local var181 = 0
	while var181 < buffer.len(p7) do
		local _ = nil
		local var182 = nil
		local var183, var184, var185 = protoModule.readTag(p7, var181)
		local var186 = var183
		var182 = var184
		var181 = var185
		
		if var182 == protoModule.wireTypes.varint then
			if var186 == 2 then
				local _ = nil
				local var187, var188 = protoModule.readVarIntI32(p7, var181)
				var181 = var188
				var180.value = var187
			else
				local _ = nil
				local var189, var190 = protoModule.readVarInt(p7, var181)
				local _ = var189
				var181 = var190
			end
		end
		if var182 == protoModule.wireTypes.lengthDelimited then
			if var186 == 1 then
				local _ = nil
				local var191, var192 = protoModule.readBuffer(p7, var181)
				var181 = var192
				var180.key = buffer.tostring(var191)
			else
				local _ = nil
				local var193, var194 = protoModule.readVarInt(p7, var181)
				var181 = var194 + var193
			end
		elseif var182 == protoModule.wireTypes.i32 then
			local _ = nil
			local var195, var196 = protoModule.readFixed32(p7, var181)
			local _ = var195
			var181 = var196
		elseif var182 == protoModule.wireTypes.i64 then
			local _ = nil
			local var197, var198 = protoModule.readFixed64(p7, var181)
			local _ = var197
			var181 = var198
		else
			error("Unsupported wire type: " .. var182)
		end
	end
	return var180
end

function t_4:jsonEncode() --[[ line: 1318 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= 0 then
		t.value = self.value
	end
	return t
end

function t_4:jsonDecode() --[[ line: 1332 ]]
	-- upvalues: t_4 (ref)
	local var200 = t_4.new()
	
	if self.key ~= nil then
		var200.key = self.key
	end
	if self.value ~= nil then
		var200.value = self.value
	end
	return var200
end

t_4.descriptor = {
	name = "CollectionLayoutInfo_ItemsPerRowEntry",
	fullName = "roblox.apppageplatform.charts.v1beta1.ItemsPerRowEntry"
}
t.CollectionLayoutInfo_ItemsPerRowEntry = t_4
typeRegistryModule.default:register(t.CollectionLayoutInfo_ItemsPerRowEntry)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p8) --[[ line: 1362 ]]
	-- upvalues: t_5 (ref)
	return setmetatable({
		page_entries = if p8 == nil or p8.page_entries == nil then {} else p8.page_entries,
		hydration_data = if p8 == nil or p8.hydration_data == nil then nil else p8.hydration_data,
		templates = if p8 == nil or p8.templates == nil then {} else p8.templates,
		localized_literals = if p8 == nil or p8.localized_literals == nil then {} else p8.localized_literals
	}, t_5)
end

function t_5:encode() --[[ line: 1371 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var202 = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for i, v in self.page_entries do
			local var203 = v:encode()
			local var204, var205 = protoModule.writeTag(buff, var202, 1, protoModule.wireTypes.lengthDelimited)
			var204, var205 = protoModule.writeBuffer(var204, var205, var203, buffer.len(var203))
			buff = var204
			var202 = var205
		end
	end
	if self.hydration_data ~= nil then
		local var206 = self.hydration_data:encode()
		local var207, var208 = protoModule.writeTag(buff, var202, 2, protoModule.wireTypes.lengthDelimited)
		var207, var208 = protoModule.writeBuffer(var207, var208, var206, buffer.len(var206))
		buff = var207
		var202 = var208
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, v in self.templates do
			local var209, var210 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var209, var210 = protoModule.writeString(var209, var210, i)
			local var211 = v:encode()
			var210, var212 = protoModule.writeTag(var209, var210, 2, protoModule.wireTypes.lengthDelimited)
			var210, var212 = protoModule.writeBuffer(var210, var212, var211, buffer.len(var211))
			local var213 = var210
			local var214 = var212
			local var215, var216 = protoModule.writeTag(buff, var202, 3, protoModule.wireTypes.lengthDelimited)
			var215, var216 = protoModule.writeBuffer(var215, var216, var213, var214)
			buff = var215
			var202 = var216
		end
	end
	if self.localized_literals ~= nil and next(self.localized_literals) ~= nil then
		for i, v in self.localized_literals do
			local var217, var218 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var217, var218 = protoModule.writeString(var217, var218, i)
			var217, var218 = protoModule.writeTag(var217, var218, 2, protoModule.wireTypes.lengthDelimited)
			var217, var218 = protoModule.writeString(var217, var218, v)
			local var219 = var217
			local var220 = var218
			local var221, var222 = protoModule.writeTag(buff, var202, 4, protoModule.wireTypes.lengthDelimited)
			var221, var222 = protoModule.writeBuffer(var221, var222, var219, var220)
			buff = var221
			var202 = var222
		end
	end
	local buff_1 = buffer.create(var202)
	buffer.copy(buff_1, 0, buff, 0, var202)
	
	return buff_1
end

function t_5.decode(p9) --[[ line: 1421 ]]
	-- upvalues: t_5 (ref), protoModule (ref), pageEntryContentModule (ref), hydrationContentModule (ref), t (ref), templateEntryModule (ref)
	local var224 = t_5.new()
	local var225 = 0
	while var225 < buffer.len(p9) do
		local _ = nil
		local var226 = nil
		local var227, var228, var229 = protoModule.readTag(p9, var225)
		local var230 = var227
		var226 = var228
		var225 = var229
		
		if var226 == protoModule.wireTypes.varint then
			local _ = nil
			local var231, var232 = protoModule.readVarInt(p9, var225)
			local _ = var231
			var225 = var232
			continue
		end
		if var226 == protoModule.wireTypes.lengthDelimited then
			if var230 == 1 then
				local _ = nil
				local var233, var234 = protoModule.readBuffer(p9, var225)
				var225 = var234
				table.insert(var224.page_entries, pageEntryContentModule.UniversalPageEntry.decode(var233))
			elseif var230 == 2 then
				local _ = nil
				local var235, var236 = protoModule.readBuffer(p9, var225)
				var225 = var236
				var224.hydration_data = hydrationContentModule.HydrationContent.decode(var235)
			elseif var230 == 3 then
				local _ = nil
				local var237, var238 = protoModule.readBuffer(p9, var225)
				var225 = var238
				var237 = t.GetChartsPageResponse_TemplatesEntry.decode(var237)
				var224.templates[var237.key or ""] = var237.value or templateEntryModule.TemplateEntry.new()
			elseif var230 == 4 then
				local _ = nil
				local var239, var240 = protoModule.readBuffer(p9, var225)
				var225 = var240
				var239 = t.GetChartsPageResponse_LocalizedLiteralsEntry.decode(var239)
				var224.localized_literals[var239.key or ""] = var239.value or ""
			else
				local _ = nil
				local var241, var242 = protoModule.readVarInt(p9, var225)
				var225 = var242 + var241
			end
		elseif var226 == protoModule.wireTypes.i32 then
			local _ = nil
			local var243, var244 = protoModule.readFixed32(p9, var225)
			local _ = var243
			var225 = var244
		elseif var226 == protoModule.wireTypes.i64 then
			local _ = nil
			local var245, var246 = protoModule.readFixed64(p9, var225)
			local _ = var245
			var225 = var246
		else
			error("Unsupported wire type: " .. var226)
		end
	end
	return var224
end

function t_5:jsonEncode() --[[ line: 1497 ]]
	local t = {}
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		local t_1 = {}
		
		for i, v in self.page_entries do
			table.insert(t_1, v:jsonEncode())
		end
		t.pageEntries = t_1
	end
	if self.hydration_data ~= nil then
		t.hydrationData = self.hydration_data:jsonEncode()
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		local t_1 = {}
		
		for i, v in self.templates do
			t_1[i] = v:jsonEncode()
		end
		t.templates = t_1
	end
	if self.localized_literals ~= nil and next(self.localized_literals) ~= nil then
		local t_1 = {}
		
		for i, v in self.localized_literals do
			t_1[i] = v
		end
		t.localizedLiterals = t_1
	end
	return t
end

function t_5:jsonDecode() --[[ line: 1531 ]]
	-- upvalues: t_5 (ref), pageEntryContentModule (ref), hydrationContentModule (ref), templateEntryModule (ref)
	local var251 = t_5.new()
	
	if self.page_entries ~= nil then
		local t = {}
		
		for i, v in self.page_entries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var251.page_entries = t
	end
	if self.pageEntries ~= nil then
		local t = {}
		
		for i, v in self.pageEntries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var251.page_entries = t
	end
	if self.hydration_data ~= nil then
		var251.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		var251.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	if self.templates ~= nil then
		local t = {}
		
		for i, v in self.templates do
			t[i] = templateEntryModule.TemplateEntry.jsonDecode(v)
		end
		var251.templates = t
	end
	if self.localized_literals ~= nil then
		local t = {}
		
		for i, v in self.localized_literals do
			t[i] = v
		end
		var251.localized_literals = t
	end
	if self.localizedLiterals ~= nil then
		local t = {}
		
		for i, v in self.localizedLiterals do
			t[i] = v
		end
		var251.localized_literals = t
	end
	return var251
end

t_5.descriptor = {
	name = "GetChartsPageResponse",
	fullName = "roblox.apppageplatform.charts.v1beta1.GetChartsPageResponse"
}
t.GetChartsPageResponse = t_5
typeRegistryModule.default:register(t.GetChartsPageResponse)
local t_6 = {}
t_6.__index = t_6

function t_6.new(p10) --[[ line: 1614 ]]
	-- upvalues: t_6 (ref)
	return setmetatable({
		key = if p10 == nil or p10.key == nil then "" else p10.key,
		value = if p10 == nil or p10.value == nil then nil else p10.value
	}, t_6)
end

function t_6:encode() --[[ line: 1623 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var258 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var259, var260 = protoModule.writeTag(buff, var258, 1, protoModule.wireTypes.lengthDelimited)
		var259, var260 = protoModule.writeString(var259, var260, self.key)
		buff = var259
		var258 = var260
	end
	if self.value ~= nil then
		local var261 = self.value:encode()
		local var262, var263 = protoModule.writeTag(buff, var258, 2, protoModule.wireTypes.lengthDelimited)
		var262, var263 = protoModule.writeBuffer(var262, var263, var261, buffer.len(var261))
		buff = var262
		var258 = var263
	end
	local buff_1 = buffer.create(var258)
	buffer.copy(buff_1, 0, buff, 0, var258)
	
	return buff_1
end

function t_6.decode(p11) --[[ line: 1643 ]]
	-- upvalues: t_6 (ref), protoModule (ref), templateEntryModule (ref)
	local var265 = t_6.new()
	local var266 = 0
	while var266 < buffer.len(p11) do
		local _ = nil
		local var267 = nil
		local var268, var269, var270 = protoModule.readTag(p11, var266)
		local var271 = var268
		var267 = var269
		var266 = var270
		
		if var267 == protoModule.wireTypes.varint then
			local _ = nil
			local var272, var273 = protoModule.readVarInt(p11, var266)
			local _ = var272
			var266 = var273
			continue
		end
		if var267 == protoModule.wireTypes.lengthDelimited then
			if var271 == 1 then
				local _ = nil
				local var274, var275 = protoModule.readBuffer(p11, var266)
				var266 = var275
				var265.key = buffer.tostring(var274)
			elseif var271 == 2 then
				local _ = nil
				local var276, var277 = protoModule.readBuffer(p11, var266)
				var266 = var277
				var265.value = templateEntryModule.TemplateEntry.decode(var276)
			else
				local _ = nil
				local var278, var279 = protoModule.readVarInt(p11, var266)
				var266 = var279 + var278
			end
		elseif var267 == protoModule.wireTypes.i32 then
			local _ = nil
			local var280, var281 = protoModule.readFixed32(p11, var266)
			local _ = var280
			var266 = var281
		elseif var267 == protoModule.wireTypes.i64 then
			local _ = nil
			local var282, var283 = protoModule.readFixed64(p11, var266)
			local _ = var282
			var266 = var283
		else
			error("Unsupported wire type: " .. var267)
		end
	end
	return var265
end

function t_6:jsonEncode() --[[ line: 1691 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_6:jsonDecode() --[[ line: 1705 ]]
	-- upvalues: t_6 (ref), templateEntryModule (ref)
	local var285 = t_6.new()
	
	if self.key ~= nil then
		var285.key = self.key
	end
	if self.value ~= nil then
		var285.value = templateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return var285
end

t_6.descriptor = {
	name = "GetChartsPageResponse_TemplatesEntry",
	fullName = "roblox.apppageplatform.charts.v1beta1.TemplatesEntry"
}
t.GetChartsPageResponse_TemplatesEntry = t_6
typeRegistryModule.default:register(t.GetChartsPageResponse_TemplatesEntry)
local t_7 = {}
t_7.__index = t_7

function t_7.new(p12) --[[ line: 1735 ]]
	-- upvalues: t_7 (ref)
	return setmetatable({
		key = if p12 == nil or p12.key == nil then "" else p12.key,
		value = if p12 == nil or p12.value == nil then "" else p12.value
	}, t_7)
end

function t_7:encode() --[[ line: 1744 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var287 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var288, var289 = protoModule.writeTag(buff, var287, 1, protoModule.wireTypes.lengthDelimited)
		var288, var289 = protoModule.writeString(var288, var289, self.key)
		buff = var288
		var287 = var289
	end
	if self.value ~= nil and self.value ~= "" then
		local var290, var291 = protoModule.writeTag(buff, var287, 2, protoModule.wireTypes.lengthDelimited)
		var290, var291 = protoModule.writeString(var290, var291, self.value)
		buff = var290
		var287 = var291
	end
	local buff_1 = buffer.create(var287)
	buffer.copy(buff_1, 0, buff, 0, var287)
	
	return buff_1
end

function t_7.decode(p13) --[[ line: 1765 ]]
	-- upvalues: t_7 (ref), protoModule (ref)
	local var293 = t_7.new()
	local var294 = 0
	while var294 < buffer.len(p13) do
		local _ = nil
		local var295 = nil
		local var296, var297, var298 = protoModule.readTag(p13, var294)
		local var299 = var296
		var295 = var297
		var294 = var298
		
		if var295 == protoModule.wireTypes.varint then
			local _ = nil
			local var300, var301 = protoModule.readVarInt(p13, var294)
			local _ = var300
			var294 = var301
			continue
		end
		if var295 == protoModule.wireTypes.lengthDelimited then
			if var299 == 1 then
				local _ = nil
				local var302, var303 = protoModule.readBuffer(p13, var294)
				var294 = var303
				var293.key = buffer.tostring(var302)
			elseif var299 == 2 then
				local _ = nil
				local var304, var305 = protoModule.readBuffer(p13, var294)
				var294 = var305
				var293.value = buffer.tostring(var304)
			else
				local _ = nil
				local var306, var307 = protoModule.readVarInt(p13, var294)
				var294 = var307 + var306
			end
		elseif var295 == protoModule.wireTypes.i32 then
			local _ = nil
			local var308, var309 = protoModule.readFixed32(p13, var294)
			local _ = var308
			var294 = var309
		elseif var295 == protoModule.wireTypes.i64 then
			local _ = nil
			local var310, var311 = protoModule.readFixed64(p13, var294)
			local _ = var310
			var294 = var311
		else
			error("Unsupported wire type: " .. var295)
		end
	end
	return var293
end

function t_7:jsonEncode() --[[ line: 1815 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function t_7:jsonDecode() --[[ line: 1831 ]]
	-- upvalues: t_7 (ref)
	local var313 = t_7.new()
	
	if self.key ~= nil then
		var313.key = self.key
	end
	if self.value ~= nil then
		var313.value = self.value
	end
	return var313
end

t_7.descriptor = {
	name = "GetChartsPageResponse_LocalizedLiteralsEntry",
	fullName = "roblox.apppageplatform.charts.v1beta1.LocalizedLiteralsEntry"
}
t.GetChartsPageResponse_LocalizedLiteralsEntry = t_7
typeRegistryModule.default:register(t.GetChartsPageResponse_LocalizedLiteralsEntry)
local t_8 = {}
t_8.__index = t_8

function t_8.new(p14) --[[ line: 1861 ]]
	-- upvalues: t_8 (ref)
	return setmetatable({
		sort_id = if p14 == nil or p14.sort_id == nil then "" else p14.sort_id,
		content_page_token = if p14 == nil or p14.content_page_token == nil then "" else p14.content_page_token,
		device = if p14 == nil or p14.device == nil then "" else p14.device,
		country = if p14 == nil or p14.country == nil then "" else p14.country,
		session_id = if p14 == nil or p14.session_id == nil then "" else p14.session_id,
		age_group = if p14 == nil or p14.age_group == nil then "" else p14.age_group,
		max_memory = if p14 == nil or p14.max_memory == nil then "" else p14.max_memory,
		selected_genre = if p14 == nil or p14.selected_genre == nil then "" else p14.selected_genre,
		cached_roblox_component_to_template_id = if p14 == nil or p14.cached_roblox_component_to_template_id == nil then {} else p14.cached_roblox_component_to_template_id,
		client_capabilities = if p14 == nil or p14.client_capabilities == nil then nil else p14.client_capabilities
	}, t_8)
end

function t_8:encode() --[[ line: 1883 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var315 = 0
	
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var316, var317 = protoModule.writeTag(buff, var315, 1, protoModule.wireTypes.lengthDelimited)
		var316, var317 = protoModule.writeString(var316, var317, self.sort_id)
		buff = var316
		var315 = var317
	end
	if self.content_page_token ~= nil and self.content_page_token ~= "" then
		local var318, var319 = protoModule.writeTag(buff, var315, 2, protoModule.wireTypes.lengthDelimited)
		var318, var319 = protoModule.writeString(var318, var319, self.content_page_token)
		buff = var318
		var315 = var319
	end
	if self.device ~= nil and self.device ~= "" then
		local var320, var321 = protoModule.writeTag(buff, var315, 3, protoModule.wireTypes.lengthDelimited)
		var320, var321 = protoModule.writeString(var320, var321, self.device)
		buff = var320
		var315 = var321
	end
	if self.country ~= nil and self.country ~= "" then
		local var322, var323 = protoModule.writeTag(buff, var315, 4, protoModule.wireTypes.lengthDelimited)
		var322, var323 = protoModule.writeString(var322, var323, self.country)
		buff = var322
		var315 = var323
	end
	if self.session_id ~= nil and self.session_id ~= "" then
		local var324, var325 = protoModule.writeTag(buff, var315, 5, protoModule.wireTypes.lengthDelimited)
		var324, var325 = protoModule.writeString(var324, var325, self.session_id)
		buff = var324
		var315 = var325
	end
	if self.age_group ~= nil and self.age_group ~= "" then
		local var326, var327 = protoModule.writeTag(buff, var315, 6, protoModule.wireTypes.lengthDelimited)
		var326, var327 = protoModule.writeString(var326, var327, self.age_group)
		buff = var326
		var315 = var327
	end
	if self.max_memory ~= nil and self.max_memory ~= "" then
		local var328, var329 = protoModule.writeTag(buff, var315, 7, protoModule.wireTypes.lengthDelimited)
		var328, var329 = protoModule.writeString(var328, var329, self.max_memory)
		buff = var328
		var315 = var329
	end
	if self.selected_genre ~= nil and self.selected_genre ~= "" then
		local var330, var331 = protoModule.writeTag(buff, var315, 8, protoModule.wireTypes.lengthDelimited)
		var330, var331 = protoModule.writeString(var330, var331, self.selected_genre)
		buff = var330
		var315 = var331
	end
	if self.cached_roblox_component_to_template_id ~= nil and next(self.cached_roblox_component_to_template_id) ~= nil then
		for i, v in self.cached_roblox_component_to_template_id do
			local var332, var333 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var332, var333 = protoModule.writeString(var332, var333, i)
			var332, var333 = protoModule.writeTag(var332, var333, 2, protoModule.wireTypes.lengthDelimited)
			var332, var333 = protoModule.writeString(var332, var333, v)
			local var334 = var332
			local var335 = var333
			local var336, var337 = protoModule.writeTag(buff, var315, 9, protoModule.wireTypes.lengthDelimited)
			var336, var337 = protoModule.writeBuffer(var336, var337, var334, var335)
			buff = var336
			var315 = var337
		end
	end
	if self.client_capabilities ~= nil then
		local var338 = self.client_capabilities:encode()
		local var339, var340 = protoModule.writeTag(buff, var315, 10, protoModule.wireTypes.lengthDelimited)
		var339, var340 = protoModule.writeBuffer(var339, var340, var338, buffer.len(var338))
		buff = var339
		var315 = var340
	end
	local buff_1 = buffer.create(var315)
	buffer.copy(buff_1, 0, buff, 0, var315)
	
	return buff_1
end

function t_8.decode(p15) --[[ line: 1954 ]]
	-- upvalues: t_8 (ref), protoModule (ref), t (ref), clientCapabilitiesModule (ref)
	local var342 = t_8.new()
	local var343 = 0
	while var343 < buffer.len(p15) do
		local _ = nil
		local var344 = nil
		local var345, var346, var347 = protoModule.readTag(p15, var343)
		local var348 = var345
		var344 = var346
		var343 = var347
		
		if var344 == protoModule.wireTypes.varint then
			local _ = nil
			local var349, var350 = protoModule.readVarInt(p15, var343)
			local _ = var349
			var343 = var350
			continue
		end
		if var344 == protoModule.wireTypes.lengthDelimited then
			if var348 == 1 then
				local _ = nil
				local var351, var352 = protoModule.readBuffer(p15, var343)
				var343 = var352
				var342.sort_id = buffer.tostring(var351)
			elseif var348 == 2 then
				local _ = nil
				local var353, var354 = protoModule.readBuffer(p15, var343)
				var343 = var354
				var342.content_page_token = buffer.tostring(var353)
			elseif var348 == 3 then
				local _ = nil
				local var355, var356 = protoModule.readBuffer(p15, var343)
				var343 = var356
				var342.device = buffer.tostring(var355)
			elseif var348 == 4 then
				local _ = nil
				local var357, var358 = protoModule.readBuffer(p15, var343)
				var343 = var358
				var342.country = buffer.tostring(var357)
			elseif var348 == 5 then
				local _ = nil
				local var359, var360 = protoModule.readBuffer(p15, var343)
				var343 = var360
				var342.session_id = buffer.tostring(var359)
			elseif var348 == 6 then
				local _ = nil
				local var361, var362 = protoModule.readBuffer(p15, var343)
				var343 = var362
				var342.age_group = buffer.tostring(var361)
			elseif var348 == 7 then
				local _ = nil
				local var363, var364 = protoModule.readBuffer(p15, var343)
				var343 = var364
				var342.max_memory = buffer.tostring(var363)
			elseif var348 == 8 then
				local _ = nil
				local var365, var366 = protoModule.readBuffer(p15, var343)
				var343 = var366
				var342.selected_genre = buffer.tostring(var365)
			elseif var348 == 9 then
				local _ = nil
				local var367, var368 = protoModule.readBuffer(p15, var343)
				var343 = var368
				var367 = t.GetChartsSortDetailRequest_CachedRobloxComponentToTemplateIdEntry.decode(var367)
				var342.cached_roblox_component_to_template_id[var367.key or ""] = var367.value or ""
			elseif var348 == 10 then
				local _ = nil
				local var369, var370 = protoModule.readBuffer(p15, var343)
				var343 = var370
				var342.client_capabilities = clientCapabilitiesModule.ClientCapabilities.decode(var369)
			else
				local _ = nil
				local var371, var372 = protoModule.readVarInt(p15, var343)
				var343 = var372 + var371
			end
		elseif var344 == protoModule.wireTypes.i32 then
			local _ = nil
			local var373, var374 = protoModule.readFixed32(p15, var343)
			local _ = var373
			var343 = var374
		elseif var344 == protoModule.wireTypes.i64 then
			local _ = nil
			local var375, var376 = protoModule.readFixed64(p15, var343)
			local _ = var375
			var343 = var376
		else
			error("Unsupported wire type: " .. var344)
		end
	end
	return var342
end

function t_8:jsonEncode() --[[ line: 2052 ]]
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
		local t_1 = {}
		
		for i, v in self.cached_roblox_component_to_template_id do
			t_1[i] = v
		end
		t.cachedRobloxComponentToTemplateId = t_1
	end
	if self.client_capabilities ~= nil then
		t.clientCapabilities = self.client_capabilities:jsonEncode()
	end
	return t
end

function t_8:jsonDecode() --[[ line: 2105 ]]
	-- upvalues: t_8 (ref), clientCapabilitiesModule (ref)
	local var379 = t_8.new()
	
	if self.sort_id ~= nil then
		var379.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var379.sort_id = self.sortId
	end
	if self.content_page_token ~= nil then
		var379.content_page_token = self.content_page_token
	end
	if self.contentPageToken ~= nil then
		var379.content_page_token = self.contentPageToken
	end
	if self.device ~= nil then
		var379.device = self.device
	end
	if self.country ~= nil then
		var379.country = self.country
	end
	if self.session_id ~= nil then
		var379.session_id = self.session_id
	end
	if self.sessionId ~= nil then
		var379.session_id = self.sessionId
	end
	if self.age_group ~= nil then
		var379.age_group = self.age_group
	end
	if self.ageGroup ~= nil then
		var379.age_group = self.ageGroup
	end
	if self.max_memory ~= nil then
		var379.max_memory = self.max_memory
	end
	if self.maxMemory ~= nil then
		var379.max_memory = self.maxMemory
	end
	if self.selected_genre ~= nil then
		var379.selected_genre = self.selected_genre
	end
	if self.selectedGenre ~= nil then
		var379.selected_genre = self.selectedGenre
	end
	if self.cached_roblox_component_to_template_id ~= nil then
		local t = {}
		
		for i, v in self.cached_roblox_component_to_template_id do
			t[i] = v
		end
		var379.cached_roblox_component_to_template_id = t
	end
	if self.cachedRobloxComponentToTemplateId ~= nil then
		local t = {}
		
		for i, v in self.cachedRobloxComponentToTemplateId do
			t[i] = v
		end
		var379.cached_roblox_component_to_template_id = t
	end
	if self.client_capabilities ~= nil then
		var379.client_capabilities = clientCapabilitiesModule.ClientCapabilities.jsonDecode(self.client_capabilities)
	end
	if self.clientCapabilities ~= nil then
		var379.client_capabilities = clientCapabilitiesModule.ClientCapabilities.jsonDecode(self.clientCapabilities)
	end
	return var379
end

t_8.descriptor = {
	name = "GetChartsSortDetailRequest",
	fullName = "roblox.apppageplatform.charts.v1beta1.GetChartsSortDetailRequest"
}
t.GetChartsSortDetailRequest = t_8
typeRegistryModule.default:register(t.GetChartsSortDetailRequest)
local t_9 = {}
t_9.__index = t_9

function t_9.new(p16) --[[ line: 2214 ]]
	-- upvalues: t_9 (ref)
	return setmetatable({
		key = if p16 == nil or p16.key == nil then "" else p16.key,
		value = if p16 == nil or p16.value == nil then "" else p16.value
	}, t_9)
end

function t_9:encode() --[[ line: 2226 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var383 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var384, var385 = protoModule.writeTag(buff, var383, 1, protoModule.wireTypes.lengthDelimited)
		var384, var385 = protoModule.writeString(var384, var385, self.key)
		buff = var384
		var383 = var385
	end
	if self.value ~= nil and self.value ~= "" then
		local var386, var387 = protoModule.writeTag(buff, var383, 2, protoModule.wireTypes.lengthDelimited)
		var386, var387 = protoModule.writeString(var386, var387, self.value)
		buff = var386
		var383 = var387
	end
	local buff_1 = buffer.create(var383)
	buffer.copy(buff_1, 0, buff, 0, var383)
	
	return buff_1
end

function t_9.decode(p17) --[[ line: 2247 ]]
	-- upvalues: t_9 (ref), protoModule (ref)
	local var389 = t_9.new()
	local var390 = 0
	while var390 < buffer.len(p17) do
		local _ = nil
		local var391 = nil
		local var392, var393, var394 = protoModule.readTag(p17, var390)
		local var395 = var392
		var391 = var393
		var390 = var394
		
		if var391 == protoModule.wireTypes.varint then
			local _ = nil
			local var396, var397 = protoModule.readVarInt(p17, var390)
			local _ = var396
			var390 = var397
			continue
		end
		if var391 == protoModule.wireTypes.lengthDelimited then
			if var395 == 1 then
				local _ = nil
				local var398, var399 = protoModule.readBuffer(p17, var390)
				var390 = var399
				var389.key = buffer.tostring(var398)
			elseif var395 == 2 then
				local _ = nil
				local var400, var401 = protoModule.readBuffer(p17, var390)
				var390 = var401
				var389.value = buffer.tostring(var400)
			else
				local _ = nil
				local var402, var403 = protoModule.readVarInt(p17, var390)
				var390 = var403 + var402
			end
		elseif var391 == protoModule.wireTypes.i32 then
			local _ = nil
			local var404, var405 = protoModule.readFixed32(p17, var390)
			local _ = var404
			var390 = var405
		elseif var391 == protoModule.wireTypes.i64 then
			local _ = nil
			local var406, var407 = protoModule.readFixed64(p17, var390)
			local _ = var406
			var390 = var407
		else
			error("Unsupported wire type: " .. var391)
		end
	end
	return var389
end

function t_9:jsonEncode() --[[ line: 2297 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function t_9:jsonDecode() --[[ line: 2313 ]]
	-- upvalues: t_9 (ref)
	local var409 = t_9.new()
	
	if self.key ~= nil then
		var409.key = self.key
	end
	if self.value ~= nil then
		var409.value = self.value
	end
	return var409
end

t_9.descriptor = {
	name = "GetChartsSortDetailRequest_CachedRobloxComponentToTemplateIdEntry",
	fullName = "roblox.apppageplatform.charts.v1beta1.CachedRobloxComponentToTemplateIdEntry"
}
t.GetChartsSortDetailRequest_CachedRobloxComponentToTemplateIdEntry = t_9
typeRegistryModule.default:register(t.GetChartsSortDetailRequest_CachedRobloxComponentToTemplateIdEntry)
local t_10 = {}
t_10.__index = t_10

function t_10.new(p18) --[[ line: 2344 ]]
	-- upvalues: t_10 (ref)
	return setmetatable({
		page_entries = if p18 == nil or p18.page_entries == nil then {} else p18.page_entries,
		hydration_data = if p18 == nil or p18.hydration_data == nil then nil else p18.hydration_data,
		templates = if p18 == nil or p18.templates == nil then {} else p18.templates,
		next_content_page_token = if p18 == nil or p18.next_content_page_token == nil then "" else p18.next_content_page_token,
		localized_literals = if p18 == nil or p18.localized_literals == nil then {} else p18.localized_literals
	}, t_10)
end

function t_10:encode() --[[ line: 2358 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var411 = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for i, v in self.page_entries do
			local var412 = v:encode()
			local var413, var414 = protoModule.writeTag(buff, var411, 1, protoModule.wireTypes.lengthDelimited)
			var413, var414 = protoModule.writeBuffer(var413, var414, var412, buffer.len(var412))
			buff = var413
			var411 = var414
		end
	end
	if self.hydration_data ~= nil then
		local var415 = self.hydration_data:encode()
		local var416, var417 = protoModule.writeTag(buff, var411, 2, protoModule.wireTypes.lengthDelimited)
		var416, var417 = protoModule.writeBuffer(var416, var417, var415, buffer.len(var415))
		buff = var416
		var411 = var417
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, v in self.templates do
			local var418, var419 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var418, var419 = protoModule.writeString(var418, var419, i)
			local var420 = v:encode()
			var419, var421 = protoModule.writeTag(var418, var419, 2, protoModule.wireTypes.lengthDelimited)
			var419, var421 = protoModule.writeBuffer(var419, var421, var420, buffer.len(var420))
			local var422 = var419
			local var423 = var421
			local var424, var425 = protoModule.writeTag(buff, var411, 3, protoModule.wireTypes.lengthDelimited)
			var424, var425 = protoModule.writeBuffer(var424, var425, var422, var423)
			buff = var424
			var411 = var425
		end
	end
	if self.next_content_page_token ~= nil and self.next_content_page_token ~= "" then
		local var426, var427 = protoModule.writeTag(buff, var411, 4, protoModule.wireTypes.lengthDelimited)
		var426, var427 = protoModule.writeString(var426, var427, self.next_content_page_token)
		buff = var426
		var411 = var427
	end
	if self.localized_literals ~= nil and next(self.localized_literals) ~= nil then
		for i, v in self.localized_literals do
			local var428, var429 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var428, var429 = protoModule.writeString(var428, var429, i)
			var428, var429 = protoModule.writeTag(var428, var429, 2, protoModule.wireTypes.lengthDelimited)
			var428, var429 = protoModule.writeString(var428, var429, v)
			local var430 = var428
			local var431 = var429
			local var432, var433 = protoModule.writeTag(buff, var411, 5, protoModule.wireTypes.lengthDelimited)
			var432, var433 = protoModule.writeBuffer(var432, var433, var430, var431)
			buff = var432
			var411 = var433
		end
	end
	local buff_1 = buffer.create(var411)
	buffer.copy(buff_1, 0, buff, 0, var411)
	
	return buff_1
end

function t_10.decode(p19) --[[ line: 2413 ]]
	-- upvalues: t_10 (ref), protoModule (ref), pageEntryContentModule (ref), hydrationContentModule (ref), t (ref), templateEntryModule (ref)
	local var435 = t_10.new()
	local var436 = 0
	while var436 < buffer.len(p19) do
		local _ = nil
		local var437 = nil
		local var438, var439, var440 = protoModule.readTag(p19, var436)
		local var441 = var438
		var437 = var439
		var436 = var440
		
		if var437 == protoModule.wireTypes.varint then
			local _ = nil
			local var442, var443 = protoModule.readVarInt(p19, var436)
			local _ = var442
			var436 = var443
			continue
		end
		if var437 == protoModule.wireTypes.lengthDelimited then
			if var441 == 1 then
				local _ = nil
				local var444, var445 = protoModule.readBuffer(p19, var436)
				var436 = var445
				table.insert(var435.page_entries, pageEntryContentModule.UniversalPageEntry.decode(var444))
			elseif var441 == 2 then
				local _ = nil
				local var446, var447 = protoModule.readBuffer(p19, var436)
				var436 = var447
				var435.hydration_data = hydrationContentModule.HydrationContent.decode(var446)
			elseif var441 == 3 then
				local _ = nil
				local var448, var449 = protoModule.readBuffer(p19, var436)
				var436 = var449
				var448 = t.GetChartsSortDetailResponse_TemplatesEntry.decode(var448)
				var435.templates[var448.key or ""] = var448.value or templateEntryModule.TemplateEntry.new()
			elseif var441 == 4 then
				local _ = nil
				local var450, var451 = protoModule.readBuffer(p19, var436)
				var436 = var451
				var435.next_content_page_token = buffer.tostring(var450)
			elseif var441 == 5 then
				local _ = nil
				local var452, var453 = protoModule.readBuffer(p19, var436)
				var436 = var453
				var452 = t.GetChartsSortDetailResponse_LocalizedLiteralsEntry.decode(var452)
				var435.localized_literals[var452.key or ""] = var452.value or ""
			else
				local _ = nil
				local var454, var455 = protoModule.readVarInt(p19, var436)
				var436 = var455 + var454
			end
		elseif var437 == protoModule.wireTypes.i32 then
			local _ = nil
			local var456, var457 = protoModule.readFixed32(p19, var436)
			local _ = var456
			var436 = var457
		elseif var437 == protoModule.wireTypes.i64 then
			local _ = nil
			local var458, var459 = protoModule.readFixed64(p19, var436)
			local _ = var458
			var436 = var459
		else
			error("Unsupported wire type: " .. var437)
		end
	end
	return var435
end

function t_10:jsonEncode() --[[ line: 2494 ]]
	local t = {}
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		local t_1 = {}
		
		for i, v in self.page_entries do
			table.insert(t_1, v:jsonEncode())
		end
		t.pageEntries = t_1
	end
	if self.hydration_data ~= nil then
		t.hydrationData = self.hydration_data:jsonEncode()
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		local t_1 = {}
		
		for i, v in self.templates do
			t_1[i] = v:jsonEncode()
		end
		t.templates = t_1
	end
	if self.next_content_page_token ~= nil and self.next_content_page_token ~= "" then
		t.nextContentPageToken = self.next_content_page_token
	end
	if self.localized_literals ~= nil and next(self.localized_literals) ~= nil then
		local t_1 = {}
		
		for i, v in self.localized_literals do
			t_1[i] = v
		end
		t.localizedLiterals = t_1
	end
	return t
end

function t_10:jsonDecode() --[[ line: 2532 ]]
	-- upvalues: t_10 (ref), pageEntryContentModule (ref), hydrationContentModule (ref), templateEntryModule (ref)
	local var464 = t_10.new()
	
	if self.page_entries ~= nil then
		local t = {}
		
		for i, v in self.page_entries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var464.page_entries = t
	end
	if self.pageEntries ~= nil then
		local t = {}
		
		for i, v in self.pageEntries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var464.page_entries = t
	end
	if self.hydration_data ~= nil then
		var464.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		var464.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	if self.templates ~= nil then
		local t = {}
		
		for i, v in self.templates do
			t[i] = templateEntryModule.TemplateEntry.jsonDecode(v)
		end
		var464.templates = t
	end
	if self.next_content_page_token ~= nil then
		var464.next_content_page_token = self.next_content_page_token
	end
	if self.nextContentPageToken ~= nil then
		var464.next_content_page_token = self.nextContentPageToken
	end
	if self.localized_literals ~= nil then
		local t = {}
		
		for i, v in self.localized_literals do
			t[i] = v
		end
		var464.localized_literals = t
	end
	if self.localizedLiterals ~= nil then
		local t = {}
		
		for i, v in self.localizedLiterals do
			t[i] = v
		end
		var464.localized_literals = t
	end
	return var464
end

t_10.descriptor = {
	name = "GetChartsSortDetailResponse",
	fullName = "roblox.apppageplatform.charts.v1beta1.GetChartsSortDetailResponse"
}
t.GetChartsSortDetailResponse = t_10
typeRegistryModule.default:register(t.GetChartsSortDetailResponse)
local t_11 = {}
t_11.__index = t_11

function t_11.new(p20) --[[ line: 2623 ]]
	-- upvalues: t_11 (ref)
	return setmetatable({
		key = if p20 == nil or p20.key == nil then "" else p20.key,
		value = if p20 == nil or p20.value == nil then nil else p20.value
	}, t_11)
end

function t_11:encode() --[[ line: 2632 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var471 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var472, var473 = protoModule.writeTag(buff, var471, 1, protoModule.wireTypes.lengthDelimited)
		var472, var473 = protoModule.writeString(var472, var473, self.key)
		buff = var472
		var471 = var473
	end
	if self.value ~= nil then
		local var474 = self.value:encode()
		local var475, var476 = protoModule.writeTag(buff, var471, 2, protoModule.wireTypes.lengthDelimited)
		var475, var476 = protoModule.writeBuffer(var475, var476, var474, buffer.len(var474))
		buff = var475
		var471 = var476
	end
	local buff_1 = buffer.create(var471)
	buffer.copy(buff_1, 0, buff, 0, var471)
	
	return buff_1
end

function t_11.decode(p21) --[[ line: 2654 ]]
	-- upvalues: t_11 (ref), protoModule (ref), templateEntryModule (ref)
	local var478 = t_11.new()
	local var479 = 0
	while var479 < buffer.len(p21) do
		local _ = nil
		local var480 = nil
		local var481, var482, var483 = protoModule.readTag(p21, var479)
		local var484 = var481
		var480 = var482
		var479 = var483
		
		if var480 == protoModule.wireTypes.varint then
			local _ = nil
			local var485, var486 = protoModule.readVarInt(p21, var479)
			local _ = var485
			var479 = var486
			continue
		end
		if var480 == protoModule.wireTypes.lengthDelimited then
			if var484 == 1 then
				local _ = nil
				local var487, var488 = protoModule.readBuffer(p21, var479)
				var479 = var488
				var478.key = buffer.tostring(var487)
			elseif var484 == 2 then
				local _ = nil
				local var489, var490 = protoModule.readBuffer(p21, var479)
				var479 = var490
				var478.value = templateEntryModule.TemplateEntry.decode(var489)
			else
				local _ = nil
				local var491, var492 = protoModule.readVarInt(p21, var479)
				var479 = var492 + var491
			end
		elseif var480 == protoModule.wireTypes.i32 then
			local _ = nil
			local var493, var494 = protoModule.readFixed32(p21, var479)
			local _ = var493
			var479 = var494
		elseif var480 == protoModule.wireTypes.i64 then
			local _ = nil
			local var495, var496 = protoModule.readFixed64(p21, var479)
			local _ = var495
			var479 = var496
		else
			error("Unsupported wire type: " .. var480)
		end
	end
	return var478
end

function t_11:jsonEncode() --[[ line: 2704 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_11:jsonDecode() --[[ line: 2720 ]]
	-- upvalues: t_11 (ref), templateEntryModule (ref)
	local var498 = t_11.new()
	
	if self.key ~= nil then
		var498.key = self.key
	end
	if self.value ~= nil then
		var498.value = templateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return var498
end

t_11.descriptor = {
	name = "GetChartsSortDetailResponse_TemplatesEntry",
	fullName = "roblox.apppageplatform.charts.v1beta1.TemplatesEntry"
}
t.GetChartsSortDetailResponse_TemplatesEntry = t_11
typeRegistryModule.default:register(t.GetChartsSortDetailResponse_TemplatesEntry)
local t_12 = {}
t_12.__index = t_12

function t_12.new(p22) --[[ line: 2751 ]]
	-- upvalues: t_12 (ref)
	return setmetatable({
		key = if p22 == nil or p22.key == nil then "" else p22.key,
		value = if p22 == nil or p22.value == nil then "" else p22.value
	}, t_12)
end

function t_12:encode() --[[ line: 2763 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var500 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var501, var502 = protoModule.writeTag(buff, var500, 1, protoModule.wireTypes.lengthDelimited)
		var501, var502 = protoModule.writeString(var501, var502, self.key)
		buff = var501
		var500 = var502
	end
	if self.value ~= nil and self.value ~= "" then
		local var503, var504 = protoModule.writeTag(buff, var500, 2, protoModule.wireTypes.lengthDelimited)
		var503, var504 = protoModule.writeString(var503, var504, self.value)
		buff = var503
		var500 = var504
	end
	local buff_1 = buffer.create(var500)
	buffer.copy(buff_1, 0, buff, 0, var500)
	
	return buff_1
end

function t_12.decode(p23) --[[ line: 2784 ]]
	-- upvalues: t_12 (ref), protoModule (ref)
	local var506 = t_12.new()
	local var507 = 0
	while var507 < buffer.len(p23) do
		local _ = nil
		local var508 = nil
		local var509, var510, var511 = protoModule.readTag(p23, var507)
		local var512 = var509
		var508 = var510
		var507 = var511
		
		if var508 == protoModule.wireTypes.varint then
			local _ = nil
			local var513, var514 = protoModule.readVarInt(p23, var507)
			local _ = var513
			var507 = var514
			continue
		end
		if var508 == protoModule.wireTypes.lengthDelimited then
			if var512 == 1 then
				local _ = nil
				local var515, var516 = protoModule.readBuffer(p23, var507)
				var507 = var516
				var506.key = buffer.tostring(var515)
			elseif var512 == 2 then
				local _ = nil
				local var517, var518 = protoModule.readBuffer(p23, var507)
				var507 = var518
				var506.value = buffer.tostring(var517)
			else
				local _ = nil
				local var519, var520 = protoModule.readVarInt(p23, var507)
				var507 = var520 + var519
			end
		elseif var508 == protoModule.wireTypes.i32 then
			local _ = nil
			local var521, var522 = protoModule.readFixed32(p23, var507)
			local _ = var521
			var507 = var522
		elseif var508 == protoModule.wireTypes.i64 then
			local _ = nil
			local var523, var524 = protoModule.readFixed64(p23, var507)
			local _ = var523
			var507 = var524
		else
			error("Unsupported wire type: " .. var508)
		end
	end
	return var506
end

function t_12:jsonEncode() --[[ line: 2834 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function t_12:jsonDecode() --[[ line: 2850 ]]
	-- upvalues: t_12 (ref)
	local var526 = t_12.new()
	
	if self.key ~= nil then
		var526.key = self.key
	end
	if self.value ~= nil then
		var526.value = self.value
	end
	return var526
end

t_12.descriptor = {
	name = "GetChartsSortDetailResponse_LocalizedLiteralsEntry",
	fullName = "roblox.apppageplatform.charts.v1beta1.LocalizedLiteralsEntry"
}
t.GetChartsSortDetailResponse_LocalizedLiteralsEntry = t_12
typeRegistryModule.default:register(t.GetChartsSortDetailResponse_LocalizedLiteralsEntry)

return {
	GetChartsPageRequest = t.GetChartsPageRequest,
	CollectionLayoutInfo = t.CollectionLayoutInfo,
	GetChartsPageResponse = t.GetChartsPageResponse,
	GetChartsSortDetailRequest = t.GetChartsSortDetailRequest,
	GetChartsSortDetailResponse = t.GetChartsSortDetailResponse
}