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

function t_1.new(p1)
	-- upvalues: hydrationStreamModeModule (ref), t_1 (ref)
	return setmetatable({
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
		hydration_stream_mode = if p1 == nil or p1.hydration_stream_mode == nil then assert(hydrationStreamModeModule.HydrationStreamMode.fromNumber(0), "Enum has no 0 default") else p1.hydration_stream_mode,
		collection_layout = if p1 == nil or p1.collection_layout == nil then nil else p1.collection_layout,
		cached_roblox_component_to_template_id = if p1 == nil or p1.cached_roblox_component_to_template_id == nil then {} else p1.cached_roblox_component_to_template_id,
		client_capabilities = if p1 == nil or p1.client_capabilities == nil then nil else p1.client_capabilities
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref), hydrationStreamModeModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.feed_page_token ~= nil and self.feed_page_token ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var23 = protoModule.writeString(var2, var3, self.feed_page_token)
		buff = var2
		var1 = var3
	end
	if self.device ~= nil and self.device ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var25 = protoModule.writeString(var4, var5, self.device)
		buff = var4
		var1 = var5
	end
	if self.country ~= nil and self.country ~= "" then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var6, var27 = protoModule.writeString(var6, var7, self.country)
		buff = var6
		var1 = var7
	end
	if self.age_group ~= nil and self.age_group ~= "" then
		local var8, var9 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var8, var29 = protoModule.writeString(var8, var9, self.age_group)
		buff = var8
		var1 = var9
	end
	if self.session_id ~= nil and self.session_id ~= "" then
		local var10, var11 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
		var10, var31 = protoModule.writeString(var10, var11, self.session_id)
		buff = var10
		var1 = var11
	end
	if self.entry_pagination_key ~= nil and self.entry_pagination_key ~= "" then
		local var12, var13 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.lengthDelimited)
		var12, var33 = protoModule.writeString(var12, var13, self.entry_pagination_key)
		buff = var12
		var1 = var13
	end
	if self.entry_page_token ~= nil and self.entry_page_token ~= "" then
		local var14, var15 = protoModule.writeTag(buff, var1, 7, protoModule.wireTypes.lengthDelimited)
		var14, var35 = protoModule.writeString(var14, var15, self.entry_page_token)
		buff = var14
		var1 = var15
	end
	if self.max_memory ~= nil and self.max_memory ~= "" then
		local var16, var17 = protoModule.writeTag(buff, var1, 8, protoModule.wireTypes.lengthDelimited)
		var16, var37 = protoModule.writeString(var16, var17, self.max_memory)
		buff = var16
		var1 = var17
	end
	if self.page_type ~= nil and self.page_type ~= "" then
		local var18, var19 = protoModule.writeTag(buff, var1, 9, protoModule.wireTypes.lengthDelimited)
		var18, var39 = protoModule.writeString(var18, var19, self.page_type)
		buff = var18
		var1 = var19
	end
	if self.include_placeholders ~= nil then
		local var20, var21 = protoModule.writeTag(buff, var1, 10, protoModule.wireTypes.varint)
		var20, var41 = protoModule.writeVarInt(var20, var21, if self.include_placeholders then 1 else 0)
		buff = var20
		var1 = var21
	end
	if self.hydration_stream_enabled ~= nil then
		local var22, var23 = protoModule.writeTag(buff, var1, 11, protoModule.wireTypes.varint)
		var22, var43 = protoModule.writeVarInt(var22, var23, if self.hydration_stream_enabled then 1 else 0)
		buff = var22
		var1 = var23
	end
	if self.hydration_stream_mode ~= nil and (self.hydration_stream_mode ~= nil and self.hydration_stream_mode ~= 0 or self.hydration_stream_mode ~= hydrationStreamModeModule.HydrationStreamMode.fromNumber(0)) then
		local var24, var25 = protoModule.writeTag(buff, var1, 12, protoModule.wireTypes.varint)
		var24, var45 = protoModule.writeVarInt(var24, var25, hydrationStreamModeModule.HydrationStreamMode.toNumber(self.hydration_stream_mode))
		buff = var24
		var1 = var25
	end
	if self.collection_layout ~= nil then
		local var26 = self.collection_layout:encode()
		local var27, var28 = protoModule.writeTag(buff, var1, 13, protoModule.wireTypes.lengthDelimited)
		var27, var48 = protoModule.writeBuffer(var27, var28, var26, buffer.len(var26))
		buff = var27
		var1 = var28
	end
	if self.cached_roblox_component_to_template_id ~= nil and next(self.cached_roblox_component_to_template_id) ~= nil then
		for i, v in self.cached_roblox_component_to_template_id do
			local var29, var30 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var29, var50 = protoModule.writeString(var29, var30, i)
			var29, var50 = protoModule.writeTag(var29, var30, 2, protoModule.wireTypes.lengthDelimited)
			var29, var50 = protoModule.writeString(var29, var30, v)
			local var31 = var29
			local var32 = var30
			local var33, var34 = protoModule.writeTag(buff, var1, 14, protoModule.wireTypes.lengthDelimited)
			var33, var54 = protoModule.writeBuffer(var33, var34, var31, var32)
			buff = var33
			var1 = var34
		end
	end
	if self.client_capabilities ~= nil then
		local var35 = self.client_capabilities:encode()
		local var36, var37 = protoModule.writeTag(buff, var1, 15, protoModule.wireTypes.lengthDelimited)
		var36, var57 = protoModule.writeBuffer(var36, var37, var35, buffer.len(var35))
		buff = var36
		var1 = var37
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref), hydrationStreamModeModule (ref), t (ref), clientCapabilitiesModule (ref)
	local var38 = t_1.new()
	local var39 = 0
	while var39 < buffer.len(p1) do
		local _ = nil
		local var40 = nil
		local var41, var42, var43 = protoModule.readTag(p1, var39)
		local var44 = var41
		var40 = var42
		var39 = var43
		
		if var40 == protoModule.wireTypes.varint then
			if var44 == 10 then
				local _ = nil
				local var45, var46 = protoModule.readVarInt(p1, var39)
				var39 = var46
				var38.include_placeholders = var45 ~= 0
			elseif var44 == 11 then
				local _ = nil
				local var47, var48 = protoModule.readVarInt(p1, var39)
				var39 = var48
				var38.hydration_stream_enabled = var47 ~= 0
			elseif var44 == 12 then
				local _ = nil
				local var49, var50 = protoModule.readVarIntI32(p1, var39)
				local var51 = var49
				var39 = var50
				var38.hydration_stream_mode = hydrationStreamModeModule.HydrationStreamMode.fromNumber(var51) or var51
			else
				local _ = nil
				local var52, var53 = protoModule.readVarInt(p1, var39)
				local _ = var52
				var39 = var53
			end
		end
		if var40 == protoModule.wireTypes.lengthDelimited then
			if var44 == 1 then
				local _ = nil
				local var54, var55 = protoModule.readBuffer(p1, var39)
				var39 = var55
				var38.feed_page_token = buffer.tostring(var54)
			elseif var44 == 2 then
				local _ = nil
				local var56, var57 = protoModule.readBuffer(p1, var39)
				var39 = var57
				var38.device = buffer.tostring(var56)
			elseif var44 == 3 then
				local _ = nil
				local var58, var59 = protoModule.readBuffer(p1, var39)
				var39 = var59
				var38.country = buffer.tostring(var58)
			elseif var44 == 4 then
				local _ = nil
				local var60, var61 = protoModule.readBuffer(p1, var39)
				var39 = var61
				var38.age_group = buffer.tostring(var60)
			elseif var44 == 5 then
				local _ = nil
				local var62, var63 = protoModule.readBuffer(p1, var39)
				var39 = var63
				var38.session_id = buffer.tostring(var62)
			elseif var44 == 6 then
				local _ = nil
				local var64, var65 = protoModule.readBuffer(p1, var39)
				var39 = var65
				var38.entry_pagination_key = buffer.tostring(var64)
			elseif var44 == 7 then
				local _ = nil
				local var66, var67 = protoModule.readBuffer(p1, var39)
				var39 = var67
				var38.entry_page_token = buffer.tostring(var66)
			elseif var44 == 8 then
				local _ = nil
				local var68, var69 = protoModule.readBuffer(p1, var39)
				var39 = var69
				var38.max_memory = buffer.tostring(var68)
			elseif var44 == 9 then
				local _ = nil
				local var70, var71 = protoModule.readBuffer(p1, var39)
				var39 = var71
				var38.page_type = buffer.tostring(var70)
			elseif var44 == 13 then
				local _ = nil
				local var72, var73 = protoModule.readBuffer(p1, var39)
				var39 = var73
				var38.collection_layout = t.CollectionLayoutInfo.decode(var72)
			elseif var44 == 14 then
				local _ = nil
				local var74, var75 = protoModule.readBuffer(p1, var39)
				var39 = var75
				var74 = t.GetChartsPageRequest_CachedRobloxComponentToTemplateIdEntry.decode(var74)
				var38.cached_roblox_component_to_template_id[var74.key or ""] = var74.value or ""
			elseif var44 == 15 then
				local _ = nil
				local var76, var77 = protoModule.readBuffer(p1, var39)
				var39 = var77
				var38.client_capabilities = clientCapabilitiesModule.ClientCapabilities.decode(var76)
			else
				local _ = nil
				local var78, var79 = protoModule.readVarInt(p1, var39)
				var39 = var79 + var78
			end
		elseif var40 == protoModule.wireTypes.i32 then
			local _ = nil
			local var80, var81 = protoModule.readFixed32(p1, var39)
			local _ = var80
			var39 = var81
		elseif var40 == protoModule.wireTypes.i64 then
			local _ = nil
			local var82, var83 = protoModule.readFixed64(p1, var39)
			local _ = var82
			var39 = var83
		else
			error("Unsupported wire type: " .. var61)
		end
	end
	return var38
end

function t_1:jsonEncode()
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

function t_1:jsonDecode()
	-- upvalues: t_1 (ref), hydrationStreamModeModule (ref), t (ref), clientCapabilitiesModule (ref)
	local var84 = t_1.new()
	
	if self.feed_page_token ~= nil then
		var84.feed_page_token = self.feed_page_token
	end
	if self.feedPageToken ~= nil then
		var84.feed_page_token = self.feedPageToken
	end
	if self.device ~= nil then
		var84.device = self.device
	end
	if self.country ~= nil then
		var84.country = self.country
	end
	if self.age_group ~= nil then
		var84.age_group = self.age_group
	end
	if self.ageGroup ~= nil then
		var84.age_group = self.ageGroup
	end
	if self.session_id ~= nil then
		var84.session_id = self.session_id
	end
	if self.sessionId ~= nil then
		var84.session_id = self.sessionId
	end
	if self.entry_pagination_key ~= nil then
		var84.entry_pagination_key = self.entry_pagination_key
	end
	if self.entryPaginationKey ~= nil then
		var84.entry_pagination_key = self.entryPaginationKey
	end
	if self.entry_page_token ~= nil then
		var84.entry_page_token = self.entry_page_token
	end
	if self.entryPageToken ~= nil then
		var84.entry_page_token = self.entryPageToken
	end
	if self.max_memory ~= nil then
		var84.max_memory = self.max_memory
	end
	if self.maxMemory ~= nil then
		var84.max_memory = self.maxMemory
	end
	if self.page_type ~= nil then
		var84.page_type = self.page_type
	end
	if self.pageType ~= nil then
		var84.page_type = self.pageType
	end
	if self.include_placeholders ~= nil then
		var84.include_placeholders = self.include_placeholders
	end
	if self.includePlaceholders ~= nil then
		var84.include_placeholders = self.includePlaceholders
	end
	if self.hydration_stream_enabled ~= nil then
		var84.hydration_stream_enabled = self.hydration_stream_enabled
	end
	if self.hydrationStreamEnabled ~= nil then
		var84.hydration_stream_enabled = self.hydrationStreamEnabled
	end
	if self.hydration_stream_mode ~= nil then
		var84.hydration_stream_mode = if typeof(self.hydration_stream_mode) == "number" then hydrationStreamModeModule.HydrationStreamMode.fromNumber(self.hydration_stream_mode) or self.hydration_stream_mode else hydrationStreamModeModule.HydrationStreamMode.fromName(self.hydration_stream_mode) or self.hydration_stream_mode
	end
	if self.hydrationStreamMode ~= nil then
		var84.hydration_stream_mode = if typeof(self.hydrationStreamMode) == "number" then hydrationStreamModeModule.HydrationStreamMode.fromNumber(self.hydrationStreamMode) or self.hydrationStreamMode else hydrationStreamModeModule.HydrationStreamMode.fromName(self.hydrationStreamMode) or self.hydrationStreamMode
	end
	if self.collection_layout ~= nil then
		var84.collection_layout = t.CollectionLayoutInfo.jsonDecode(self.collection_layout)
	end
	if self.collectionLayout ~= nil then
		var84.collection_layout = t.CollectionLayoutInfo.jsonDecode(self.collectionLayout)
	end
	if self.cached_roblox_component_to_template_id ~= nil then
		local t_2 = {}
		
		for i, v in self.cached_roblox_component_to_template_id do
			t_2[i] = v
		end
		var84.cached_roblox_component_to_template_id = t_2
	end
	if self.cachedRobloxComponentToTemplateId ~= nil then
		local t_2 = {}
		
		for i, v in self.cachedRobloxComponentToTemplateId do
			t_2[i] = v
		end
		var84.cached_roblox_component_to_template_id = t_2
	end
	if self.client_capabilities ~= nil then
		var84.client_capabilities = clientCapabilitiesModule.ClientCapabilities.jsonDecode(self.client_capabilities)
	end
	if self.clientCapabilities ~= nil then
		var84.client_capabilities = clientCapabilitiesModule.ClientCapabilities.jsonDecode(self.clientCapabilities)
	end
	return var84
end

t_1.descriptor = {
	name = "GetChartsPageRequest",
	fullName = "roblox.apppageplatform.charts.v1beta1.GetChartsPageRequest"
}
t.GetChartsPageRequest = t_1
typeRegistryModule.default:register(t.GetChartsPageRequest)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2)
	-- upvalues: t_2 (ref)
	return setmetatable({
		key = if p2 == nil or p2.key == nil then "" else p2.key,
		value = if p2 == nil or p2.value == nil then "" else p2.value
	}, t_2)
end

function t_2:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var85 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var86, var87 = protoModule.writeTag(buff, var85, 1, protoModule.wireTypes.lengthDelimited)
		var86, var113 = protoModule.writeString(var86, var87, self.key)
		buff = var86
		var85 = var87
	end
	if self.value ~= nil and self.value ~= "" then
		local var88, var89 = protoModule.writeTag(buff, var85, 2, protoModule.wireTypes.lengthDelimited)
		var88, var115 = protoModule.writeString(var88, var89, self.value)
		buff = var88
		var85 = var89
	end
	local buff_1 = buffer.create(var85)
	buffer.copy(buff_1, 0, buff, 0, var85)
	
	return buff_1
end

function t_2.decode(p2)
	-- upvalues: t_2 (ref), protoModule (ref)
	local var85 = t_2.new()
	local var86 = 0
	while var86 < buffer.len(p2) do
		local _ = nil
		local var87 = nil
		local var88, var89, var90 = protoModule.readTag(p2, var86)
		local var91 = var88
		var87 = var89
		var86 = var90
		
		if var87 == protoModule.wireTypes.varint then
			local _ = nil
			local var92, var93 = protoModule.readVarInt(p2, var86)
			local _ = var92
			var86 = var93
			continue
		end
		if var87 == protoModule.wireTypes.lengthDelimited then
			if var91 == 1 then
				local _ = nil
				local var94, var95 = protoModule.readBuffer(p2, var86)
				var86 = var95
				var85.key = buffer.tostring(var94)
			elseif var91 == 2 then
				local _ = nil
				local var96, var97 = protoModule.readBuffer(p2, var86)
				var86 = var97
				var85.value = buffer.tostring(var96)
			else
				local _ = nil
				local var98, var99 = protoModule.readVarInt(p2, var86)
				var86 = var99 + var98
			end
		elseif var87 == protoModule.wireTypes.i32 then
			local _ = nil
			local var100, var101 = protoModule.readFixed32(p2, var86)
			local _ = var100
			var86 = var101
		elseif var87 == protoModule.wireTypes.i64 then
			local _ = nil
			local var102, var103 = protoModule.readFixed64(p2, var86)
			local _ = var102
			var86 = var103
		else
			error("Unsupported wire type: " .. var119)
		end
	end
	return var85
end

function t_2:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function t_2:jsonDecode()
	-- upvalues: t_2 (ref)
	local var104 = t_2.new()
	
	if self.key ~= nil then
		var104.key = self.key
	end
	if self.value ~= nil then
		var104.value = self.value
	end
	return var104
end

t_2.descriptor = {
	name = "GetChartsPageRequest_CachedRobloxComponentToTemplateIdEntry",
	fullName = "roblox.apppageplatform.charts.v1beta1.CachedRobloxComponentToTemplateIdEntry"
}
t.GetChartsPageRequest_CachedRobloxComponentToTemplateIdEntry = t_2
typeRegistryModule.default:register(t.GetChartsPageRequest_CachedRobloxComponentToTemplateIdEntry)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p3)
	-- upvalues: t_3 (ref)
	return setmetatable({
		items_per_row = if p3 == nil or p3.items_per_row == nil then {} else p3.items_per_row,
		rows_above_fold = if p3 == nil or p3.rows_above_fold == nil then 0 else p3.rows_above_fold
	}, t_3)
end

function t_3:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var104 = 0
	
	if self.items_per_row ~= nil and next(self.items_per_row) ~= nil then
		for i, v in self.items_per_row do
			local var105, var106 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var105, var141 = protoModule.writeString(var105, var106, i)
			var105, var141 = protoModule.writeTag(var105, var106, 2, protoModule.wireTypes.varint)
			var105, var141 = protoModule.writeVarInt(var105, var106, v)
			local var107 = var105
			local var108 = var106
			local var109, var110 = protoModule.writeTag(buff, var104, 1, protoModule.wireTypes.lengthDelimited)
			var109, var145 = protoModule.writeBuffer(var109, var110, var107, var108)
			buff = var109
			var104 = var110
		end
	end
	if self.rows_above_fold ~= nil and self.rows_above_fold ~= 0 then
		local var111, var112 = protoModule.writeTag(buff, var104, 2, protoModule.wireTypes.varint)
		var111, var147 = protoModule.writeVarInt(var111, var112, self.rows_above_fold)
		buff = var111
		var104 = var112
	end
	local buff_1 = buffer.create(var104)
	buffer.copy(buff_1, 0, buff, 0, var104)
	
	return buff_1
end

function t_3.decode(p3)
	-- upvalues: t_3 (ref), protoModule (ref), t (ref)
	local var113 = t_3.new()
	local var114 = 0
	while var114 < buffer.len(p3) do
		local _ = nil
		local var115 = nil
		local var116, var117, var118 = protoModule.readTag(p3, var114)
		local var119 = var116
		var115 = var117
		var114 = var118
		
		if var115 == protoModule.wireTypes.varint then
			if var119 == 2 then
				local _ = nil
				local var120, var121 = protoModule.readVarIntI32(p3, var114)
				var114 = var121
				var113.rows_above_fold = var120
			else
				local _ = nil
				local var122, var123 = protoModule.readVarInt(p3, var114)
				local _ = var122
				var114 = var123
			end
		end
		if var115 == protoModule.wireTypes.lengthDelimited then
			if var119 == 1 then
				local _ = nil
				local var124, var125 = protoModule.readBuffer(p3, var114)
				var114 = var125
				var124 = t.CollectionLayoutInfo_ItemsPerRowEntry.decode(var124)
				var113.items_per_row[var124.key or ""] = var124.value or 0
			else
				local _ = nil
				local var126, var127 = protoModule.readVarInt(p3, var114)
				var114 = var127 + var126
			end
		elseif var115 == protoModule.wireTypes.i32 then
			local _ = nil
			local var128, var129 = protoModule.readFixed32(p3, var114)
			local _ = var128
			var114 = var129
		elseif var115 == protoModule.wireTypes.i64 then
			local _ = nil
			local var130, var131 = protoModule.readFixed64(p3, var114)
			local _ = var130
			var114 = var131
		else
			error("Unsupported wire type: " .. var151)
		end
	end
	return var113
end

function t_3:jsonEncode()
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

function t_3:jsonDecode()
	-- upvalues: t_3 (ref)
	local var132 = t_3.new()
	
	if self.items_per_row ~= nil then
		local t = {}
		
		for i, v in self.items_per_row do
			t[i] = v
		end
		var132.items_per_row = t
	end
	if self.itemsPerRow ~= nil then
		local t = {}
		
		for i, v in self.itemsPerRow do
			t[i] = v
		end
		var132.items_per_row = t
	end
	if self.rows_above_fold ~= nil then
		var132.rows_above_fold = self.rows_above_fold
	end
	if self.rowsAboveFold ~= nil then
		var132.rows_above_fold = self.rowsAboveFold
	end
	return var132
end

t_3.descriptor = {
	name = "CollectionLayoutInfo",
	fullName = "roblox.apppageplatform.charts.v1beta1.CollectionLayoutInfo"
}
t.CollectionLayoutInfo = t_3
typeRegistryModule.default:register(t.CollectionLayoutInfo)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p4)
	-- upvalues: t_4 (ref)
	return setmetatable({
		key = if p4 == nil or p4.key == nil then "" else p4.key,
		value = if p4 == nil or p4.value == nil then 0 else p4.value
	}, t_4)
end

function t_4:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var133 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var134, var135 = protoModule.writeTag(buff, var133, 1, protoModule.wireTypes.lengthDelimited)
		var134, var176 = protoModule.writeString(var134, var135, self.key)
		buff = var134
		var133 = var135
	end
	if self.value ~= nil and self.value ~= 0 then
		local var136, var137 = protoModule.writeTag(buff, var133, 2, protoModule.wireTypes.varint)
		var136, var178 = protoModule.writeVarInt(var136, var137, self.value)
		buff = var136
		var133 = var137
	end
	local buff_1 = buffer.create(var133)
	buffer.copy(buff_1, 0, buff, 0, var133)
	
	return buff_1
end

function t_4.decode(p4)
	-- upvalues: t_4 (ref), protoModule (ref)
	local var133 = t_4.new()
	local var134 = 0
	while var134 < buffer.len(p4) do
		local _ = nil
		local var135 = nil
		local var136, var137, var138 = protoModule.readTag(p4, var134)
		local var139 = var136
		var135 = var137
		var134 = var138
		
		if var135 == protoModule.wireTypes.varint then
			if var139 == 2 then
				local _ = nil
				local var140, var141 = protoModule.readVarIntI32(p4, var134)
				var134 = var141
				var133.value = var140
			else
				local _ = nil
				local var142, var143 = protoModule.readVarInt(p4, var134)
				local _ = var142
				var134 = var143
			end
		end
		if var135 == protoModule.wireTypes.lengthDelimited then
			if var139 == 1 then
				local _ = nil
				local var144, var145 = protoModule.readBuffer(p4, var134)
				var134 = var145
				var133.key = buffer.tostring(var144)
			else
				local _ = nil
				local var146, var147 = protoModule.readVarInt(p4, var134)
				var134 = var147 + var146
			end
		elseif var135 == protoModule.wireTypes.i32 then
			local _ = nil
			local var148, var149 = protoModule.readFixed32(p4, var134)
			local _ = var148
			var134 = var149
		elseif var135 == protoModule.wireTypes.i64 then
			local _ = nil
			local var150, var151 = protoModule.readFixed64(p4, var134)
			local _ = var150
			var134 = var151
		else
			error("Unsupported wire type: " .. var182)
		end
	end
	return var133
end

function t_4:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= 0 then
		t.value = self.value
	end
	return t
end

function t_4:jsonDecode()
	-- upvalues: t_4 (ref)
	local var152 = t_4.new()
	
	if self.key ~= nil then
		var152.key = self.key
	end
	if self.value ~= nil then
		var152.value = self.value
	end
	return var152
end

t_4.descriptor = {
	name = "CollectionLayoutInfo_ItemsPerRowEntry",
	fullName = "roblox.apppageplatform.charts.v1beta1.ItemsPerRowEntry"
}
t.CollectionLayoutInfo_ItemsPerRowEntry = t_4
typeRegistryModule.default:register(t.CollectionLayoutInfo_ItemsPerRowEntry)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p5)
	-- upvalues: t_5 (ref)
	return setmetatable({
		page_entries = if p5 == nil or p5.page_entries == nil then {} else p5.page_entries,
		hydration_data = if p5 == nil or p5.hydration_data == nil then nil else p5.hydration_data,
		templates = if p5 == nil or p5.templates == nil then {} else p5.templates,
		localized_literals = if p5 == nil or p5.localized_literals == nil then {} else p5.localized_literals
	}, t_5)
end

function t_5:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var152 = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for i, v in self.page_entries do
			local var153 = v:encode()
			local var154, var155 = protoModule.writeTag(buff, var152, 1, protoModule.wireTypes.lengthDelimited)
			var154, var205 = protoModule.writeBuffer(var154, var155, var153, buffer.len(var153))
			buff = var154
			var152 = var155
		end
	end
	if self.hydration_data ~= nil then
		local var156 = self.hydration_data:encode()
		local var157, var158 = protoModule.writeTag(buff, var152, 2, protoModule.wireTypes.lengthDelimited)
		var157, var208 = protoModule.writeBuffer(var157, var158, var156, buffer.len(var156))
		buff = var157
		var152 = var158
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, v in self.templates do
			local var159, var160 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var159, var210 = protoModule.writeString(var159, var160, i)
			local var161 = v:encode()
			var160, var212 = protoModule.writeTag(var159, var160, 2, protoModule.wireTypes.lengthDelimited)
			var160, var212 = protoModule.writeBuffer(var160, var212, var161, buffer.len(var161))
			local var162 = var160
			local var163 = var212
			local var164, var165 = protoModule.writeTag(buff, var152, 3, protoModule.wireTypes.lengthDelimited)
			var164, var216 = protoModule.writeBuffer(var164, var165, var162, var163)
			buff = var164
			var152 = var165
		end
	end
	if self.localized_literals ~= nil and next(self.localized_literals) ~= nil then
		for i, v in self.localized_literals do
			local var166, var167 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var166, var218 = protoModule.writeString(var166, var167, i)
			var166, var218 = protoModule.writeTag(var166, var167, 2, protoModule.wireTypes.lengthDelimited)
			var166, var218 = protoModule.writeString(var166, var167, v)
			local var168 = var166
			local var169 = var167
			local var170, var171 = protoModule.writeTag(buff, var152, 4, protoModule.wireTypes.lengthDelimited)
			var170, var222 = protoModule.writeBuffer(var170, var171, var168, var169)
			buff = var170
			var152 = var171
		end
	end
	local buff_1 = buffer.create(var152)
	buffer.copy(buff_1, 0, buff, 0, var152)
	
	return buff_1
end

function t_5.decode(p5)
	-- upvalues: t_5 (ref), protoModule (ref), pageEntryContentModule (ref), hydrationContentModule (ref), t (ref), templateEntryModule (ref)
	local var172 = t_5.new()
	local var173 = 0
	while var173 < buffer.len(p5) do
		local _ = nil
		local var174 = nil
		local var175, var176, var177 = protoModule.readTag(p5, var173)
		local var178 = var175
		var174 = var176
		var173 = var177
		
		if var174 == protoModule.wireTypes.varint then
			local _ = nil
			local var179, var180 = protoModule.readVarInt(p5, var173)
			local _ = var179
			var173 = var180
			continue
		end
		if var174 == protoModule.wireTypes.lengthDelimited then
			if var178 == 1 then
				local _ = nil
				local var181, var182 = protoModule.readBuffer(p5, var173)
				var173 = var182
				table.insert(var172.page_entries, pageEntryContentModule.UniversalPageEntry.decode(var181))
			elseif var178 == 2 then
				local _ = nil
				local var183, var184 = protoModule.readBuffer(p5, var173)
				var173 = var184
				var172.hydration_data = hydrationContentModule.HydrationContent.decode(var183)
			elseif var178 == 3 then
				local _ = nil
				local var185, var186 = protoModule.readBuffer(p5, var173)
				var173 = var186
				var185 = t.GetChartsPageResponse_TemplatesEntry.decode(var185)
				var172.templates[var185.key or ""] = var185.value or templateEntryModule.TemplateEntry.new()
			elseif var178 == 4 then
				local _ = nil
				local var187, var188 = protoModule.readBuffer(p5, var173)
				var173 = var188
				var187 = t.GetChartsPageResponse_LocalizedLiteralsEntry.decode(var187)
				var172.localized_literals[var187.key or ""] = var187.value or ""
			else
				local _ = nil
				local var189, var190 = protoModule.readVarInt(p5, var173)
				var173 = var190 + var189
			end
		elseif var174 == protoModule.wireTypes.i32 then
			local _ = nil
			local var191, var192 = protoModule.readFixed32(p5, var173)
			local _ = var191
			var173 = var192
		elseif var174 == protoModule.wireTypes.i64 then
			local _ = nil
			local var193, var194 = protoModule.readFixed64(p5, var173)
			local _ = var193
			var173 = var194
		else
			error("Unsupported wire type: " .. var226)
		end
	end
	return var172
end

function t_5:jsonEncode()
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

function t_5:jsonDecode()
	-- upvalues: t_5 (ref), pageEntryContentModule (ref), hydrationContentModule (ref), templateEntryModule (ref)
	local var195 = t_5.new()
	
	if self.page_entries ~= nil then
		local t = {}
		
		for i, v in self.page_entries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var195.page_entries = t
	end
	if self.pageEntries ~= nil then
		local t = {}
		
		for i, v in self.pageEntries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var195.page_entries = t
	end
	if self.hydration_data ~= nil then
		var195.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		var195.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	if self.templates ~= nil then
		local t = {}
		
		for i, v in self.templates do
			t[i] = templateEntryModule.TemplateEntry.jsonDecode(v)
		end
		var195.templates = t
	end
	if self.localized_literals ~= nil then
		local t = {}
		
		for i, v in self.localized_literals do
			t[i] = v
		end
		var195.localized_literals = t
	end
	if self.localizedLiterals ~= nil then
		local t = {}
		
		for i, v in self.localizedLiterals do
			t[i] = v
		end
		var195.localized_literals = t
	end
	return var195
end

t_5.descriptor = {
	name = "GetChartsPageResponse",
	fullName = "roblox.apppageplatform.charts.v1beta1.GetChartsPageResponse"
}
t.GetChartsPageResponse = t_5
typeRegistryModule.default:register(t.GetChartsPageResponse)
local t_6 = {}
t_6.__index = t_6

function t_6.new(p6)
	-- upvalues: t_6 (ref)
	return setmetatable({
		key = if p6 == nil or p6.key == nil then "" else p6.key,
		value = if p6 == nil or p6.value == nil then nil else p6.value
	}, t_6)
end

function t_6:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var196 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var197, var198 = protoModule.writeTag(buff, var196, 1, protoModule.wireTypes.lengthDelimited)
		var197, var260 = protoModule.writeString(var197, var198, self.key)
		buff = var197
		var196 = var198
	end
	if self.value ~= nil then
		local var199 = self.value:encode()
		local var200, var201 = protoModule.writeTag(buff, var196, 2, protoModule.wireTypes.lengthDelimited)
		var200, var263 = protoModule.writeBuffer(var200, var201, var199, buffer.len(var199))
		buff = var200
		var196 = var201
	end
	local buff_1 = buffer.create(var196)
	buffer.copy(buff_1, 0, buff, 0, var196)
	
	return buff_1
end

function t_6.decode(p6)
	-- upvalues: t_6 (ref), protoModule (ref), templateEntryModule (ref)
	local var196 = t_6.new()
	local var197 = 0
	while var197 < buffer.len(p6) do
		local _ = nil
		local var198 = nil
		local var199, var200, var201 = protoModule.readTag(p6, var197)
		local var202 = var199
		var198 = var200
		var197 = var201
		
		if var198 == protoModule.wireTypes.varint then
			local _ = nil
			local var203, var204 = protoModule.readVarInt(p6, var197)
			local _ = var203
			var197 = var204
			continue
		end
		if var198 == protoModule.wireTypes.lengthDelimited then
			if var202 == 1 then
				local _ = nil
				local var205, var206 = protoModule.readBuffer(p6, var197)
				var197 = var206
				var196.key = buffer.tostring(var205)
			elseif var202 == 2 then
				local _ = nil
				local var207, var208 = protoModule.readBuffer(p6, var197)
				var197 = var208
				var196.value = templateEntryModule.TemplateEntry.decode(var207)
			else
				local _ = nil
				local var209, var210 = protoModule.readVarInt(p6, var197)
				var197 = var210 + var209
			end
		elseif var198 == protoModule.wireTypes.i32 then
			local _ = nil
			local var211, var212 = protoModule.readFixed32(p6, var197)
			local _ = var211
			var197 = var212
		elseif var198 == protoModule.wireTypes.i64 then
			local _ = nil
			local var213, var214 = protoModule.readFixed64(p6, var197)
			local _ = var213
			var197 = var214
		else
			error("Unsupported wire type: " .. var267)
		end
	end
	return var196
end

function t_6:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_6:jsonDecode()
	-- upvalues: t_6 (ref), templateEntryModule (ref)
	local var215 = t_6.new()
	
	if self.key ~= nil then
		var215.key = self.key
	end
	if self.value ~= nil then
		var215.value = templateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return var215
end

t_6.descriptor = {
	name = "GetChartsPageResponse_TemplatesEntry",
	fullName = "roblox.apppageplatform.charts.v1beta1.TemplatesEntry"
}
t.GetChartsPageResponse_TemplatesEntry = t_6
typeRegistryModule.default:register(t.GetChartsPageResponse_TemplatesEntry)
local t_7 = {}
t_7.__index = t_7

function t_7.new(p7)
	-- upvalues: t_7 (ref)
	return setmetatable({
		key = if p7 == nil or p7.key == nil then "" else p7.key,
		value = if p7 == nil or p7.value == nil then "" else p7.value
	}, t_7)
end

function t_7:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var215 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var216, var217 = protoModule.writeTag(buff, var215, 1, protoModule.wireTypes.lengthDelimited)
		var216, var289 = protoModule.writeString(var216, var217, self.key)
		buff = var216
		var215 = var217
	end
	if self.value ~= nil and self.value ~= "" then
		local var218, var219 = protoModule.writeTag(buff, var215, 2, protoModule.wireTypes.lengthDelimited)
		var218, var291 = protoModule.writeString(var218, var219, self.value)
		buff = var218
		var215 = var219
	end
	local buff_1 = buffer.create(var215)
	buffer.copy(buff_1, 0, buff, 0, var215)
	
	return buff_1
end

function t_7.decode(p7)
	-- upvalues: t_7 (ref), protoModule (ref)
	local var215 = t_7.new()
	local var216 = 0
	while var216 < buffer.len(p7) do
		local _ = nil
		local var217 = nil
		local var218, var219, var220 = protoModule.readTag(p7, var216)
		local var221 = var218
		var217 = var219
		var216 = var220
		
		if var217 == protoModule.wireTypes.varint then
			local _ = nil
			local var222, var223 = protoModule.readVarInt(p7, var216)
			local _ = var222
			var216 = var223
			continue
		end
		if var217 == protoModule.wireTypes.lengthDelimited then
			if var221 == 1 then
				local _ = nil
				local var224, var225 = protoModule.readBuffer(p7, var216)
				var216 = var225
				var215.key = buffer.tostring(var224)
			elseif var221 == 2 then
				local _ = nil
				local var226, var227 = protoModule.readBuffer(p7, var216)
				var216 = var227
				var215.value = buffer.tostring(var226)
			else
				local _ = nil
				local var228, var229 = protoModule.readVarInt(p7, var216)
				var216 = var229 + var228
			end
		elseif var217 == protoModule.wireTypes.i32 then
			local _ = nil
			local var230, var231 = protoModule.readFixed32(p7, var216)
			local _ = var230
			var216 = var231
		elseif var217 == protoModule.wireTypes.i64 then
			local _ = nil
			local var232, var233 = protoModule.readFixed64(p7, var216)
			local _ = var232
			var216 = var233
		else
			error("Unsupported wire type: " .. var295)
		end
	end
	return var215
end

function t_7:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function t_7:jsonDecode()
	-- upvalues: t_7 (ref)
	local var234 = t_7.new()
	
	if self.key ~= nil then
		var234.key = self.key
	end
	if self.value ~= nil then
		var234.value = self.value
	end
	return var234
end

t_7.descriptor = {
	name = "GetChartsPageResponse_LocalizedLiteralsEntry",
	fullName = "roblox.apppageplatform.charts.v1beta1.LocalizedLiteralsEntry"
}
t.GetChartsPageResponse_LocalizedLiteralsEntry = t_7
typeRegistryModule.default:register(t.GetChartsPageResponse_LocalizedLiteralsEntry)
local t_8 = {}
t_8.__index = t_8

function t_8.new(p8)
	-- upvalues: t_8 (ref)
	return setmetatable({
		sort_id = if p8 == nil or p8.sort_id == nil then "" else p8.sort_id,
		content_page_token = if p8 == nil or p8.content_page_token == nil then "" else p8.content_page_token,
		device = if p8 == nil or p8.device == nil then "" else p8.device,
		country = if p8 == nil or p8.country == nil then "" else p8.country,
		session_id = if p8 == nil or p8.session_id == nil then "" else p8.session_id,
		age_group = if p8 == nil or p8.age_group == nil then "" else p8.age_group,
		max_memory = if p8 == nil or p8.max_memory == nil then "" else p8.max_memory,
		selected_genre = if p8 == nil or p8.selected_genre == nil then "" else p8.selected_genre,
		cached_roblox_component_to_template_id = if p8 == nil or p8.cached_roblox_component_to_template_id == nil then {} else p8.cached_roblox_component_to_template_id,
		client_capabilities = if p8 == nil or p8.client_capabilities == nil then nil else p8.client_capabilities
	}, t_8)
end

function t_8:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var234 = 0
	
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var235, var236 = protoModule.writeTag(buff, var234, 1, protoModule.wireTypes.lengthDelimited)
		var235, var317 = protoModule.writeString(var235, var236, self.sort_id)
		buff = var235
		var234 = var236
	end
	if self.content_page_token ~= nil and self.content_page_token ~= "" then
		local var237, var238 = protoModule.writeTag(buff, var234, 2, protoModule.wireTypes.lengthDelimited)
		var237, var319 = protoModule.writeString(var237, var238, self.content_page_token)
		buff = var237
		var234 = var238
	end
	if self.device ~= nil and self.device ~= "" then
		local var239, var240 = protoModule.writeTag(buff, var234, 3, protoModule.wireTypes.lengthDelimited)
		var239, var321 = protoModule.writeString(var239, var240, self.device)
		buff = var239
		var234 = var240
	end
	if self.country ~= nil and self.country ~= "" then
		local var241, var242 = protoModule.writeTag(buff, var234, 4, protoModule.wireTypes.lengthDelimited)
		var241, var323 = protoModule.writeString(var241, var242, self.country)
		buff = var241
		var234 = var242
	end
	if self.session_id ~= nil and self.session_id ~= "" then
		local var243, var244 = protoModule.writeTag(buff, var234, 5, protoModule.wireTypes.lengthDelimited)
		var243, var325 = protoModule.writeString(var243, var244, self.session_id)
		buff = var243
		var234 = var244
	end
	if self.age_group ~= nil and self.age_group ~= "" then
		local var245, var246 = protoModule.writeTag(buff, var234, 6, protoModule.wireTypes.lengthDelimited)
		var245, var327 = protoModule.writeString(var245, var246, self.age_group)
		buff = var245
		var234 = var246
	end
	if self.max_memory ~= nil and self.max_memory ~= "" then
		local var247, var248 = protoModule.writeTag(buff, var234, 7, protoModule.wireTypes.lengthDelimited)
		var247, var329 = protoModule.writeString(var247, var248, self.max_memory)
		buff = var247
		var234 = var248
	end
	if self.selected_genre ~= nil and self.selected_genre ~= "" then
		local var249, var250 = protoModule.writeTag(buff, var234, 8, protoModule.wireTypes.lengthDelimited)
		var249, var331 = protoModule.writeString(var249, var250, self.selected_genre)
		buff = var249
		var234 = var250
	end
	if self.cached_roblox_component_to_template_id ~= nil and next(self.cached_roblox_component_to_template_id) ~= nil then
		for i, v in self.cached_roblox_component_to_template_id do
			local var251, var252 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var251, var333 = protoModule.writeString(var251, var252, i)
			var251, var333 = protoModule.writeTag(var251, var252, 2, protoModule.wireTypes.lengthDelimited)
			var251, var333 = protoModule.writeString(var251, var252, v)
			local var253 = var251
			local var254 = var252
			local var255, var256 = protoModule.writeTag(buff, var234, 9, protoModule.wireTypes.lengthDelimited)
			var255, var337 = protoModule.writeBuffer(var255, var256, var253, var254)
			buff = var255
			var234 = var256
		end
	end
	if self.client_capabilities ~= nil then
		local var257 = self.client_capabilities:encode()
		local var258, var259 = protoModule.writeTag(buff, var234, 10, protoModule.wireTypes.lengthDelimited)
		var258, var340 = protoModule.writeBuffer(var258, var259, var257, buffer.len(var257))
		buff = var258
		var234 = var259
	end
	local buff_1 = buffer.create(var234)
	buffer.copy(buff_1, 0, buff, 0, var234)
	
	return buff_1
end

function t_8.decode(p8)
	-- upvalues: t_8 (ref), protoModule (ref), t (ref), clientCapabilitiesModule (ref)
	local var260 = t_8.new()
	local var261 = 0
	while var261 < buffer.len(p8) do
		local _ = nil
		local var262 = nil
		local var263, var264, var265 = protoModule.readTag(p8, var261)
		local var266 = var263
		var262 = var264
		var261 = var265
		
		if var262 == protoModule.wireTypes.varint then
			local _ = nil
			local var267, var268 = protoModule.readVarInt(p8, var261)
			local _ = var267
			var261 = var268
			continue
		end
		if var262 == protoModule.wireTypes.lengthDelimited then
			if var266 == 1 then
				local _ = nil
				local var269, var270 = protoModule.readBuffer(p8, var261)
				var261 = var270
				var260.sort_id = buffer.tostring(var269)
			elseif var266 == 2 then
				local _ = nil
				local var271, var272 = protoModule.readBuffer(p8, var261)
				var261 = var272
				var260.content_page_token = buffer.tostring(var271)
			elseif var266 == 3 then
				local _ = nil
				local var273, var274 = protoModule.readBuffer(p8, var261)
				var261 = var274
				var260.device = buffer.tostring(var273)
			elseif var266 == 4 then
				local _ = nil
				local var275, var276 = protoModule.readBuffer(p8, var261)
				var261 = var276
				var260.country = buffer.tostring(var275)
			elseif var266 == 5 then
				local _ = nil
				local var277, var278 = protoModule.readBuffer(p8, var261)
				var261 = var278
				var260.session_id = buffer.tostring(var277)
			elseif var266 == 6 then
				local _ = nil
				local var279, var280 = protoModule.readBuffer(p8, var261)
				var261 = var280
				var260.age_group = buffer.tostring(var279)
			elseif var266 == 7 then
				local _ = nil
				local var281, var282 = protoModule.readBuffer(p8, var261)
				var261 = var282
				var260.max_memory = buffer.tostring(var281)
			elseif var266 == 8 then
				local _ = nil
				local var283, var284 = protoModule.readBuffer(p8, var261)
				var261 = var284
				var260.selected_genre = buffer.tostring(var283)
			elseif var266 == 9 then
				local _ = nil
				local var285, var286 = protoModule.readBuffer(p8, var261)
				var261 = var286
				var285 = t.GetChartsSortDetailRequest_CachedRobloxComponentToTemplateIdEntry.decode(var285)
				var260.cached_roblox_component_to_template_id[var285.key or ""] = var285.value or ""
			elseif var266 == 10 then
				local _ = nil
				local var287, var288 = protoModule.readBuffer(p8, var261)
				var261 = var288
				var260.client_capabilities = clientCapabilitiesModule.ClientCapabilities.decode(var287)
			else
				local _ = nil
				local var289, var290 = protoModule.readVarInt(p8, var261)
				var261 = var290 + var289
			end
		elseif var262 == protoModule.wireTypes.i32 then
			local _ = nil
			local var291, var292 = protoModule.readFixed32(p8, var261)
			local _ = var291
			var261 = var292
		elseif var262 == protoModule.wireTypes.i64 then
			local _ = nil
			local var293, var294 = protoModule.readFixed64(p8, var261)
			local _ = var293
			var261 = var294
		else
			error("Unsupported wire type: " .. var344)
		end
	end
	return var260
end

function t_8:jsonEncode()
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

function t_8:jsonDecode()
	-- upvalues: t_8 (ref), clientCapabilitiesModule (ref)
	local var295 = t_8.new()
	
	if self.sort_id ~= nil then
		var295.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var295.sort_id = self.sortId
	end
	if self.content_page_token ~= nil then
		var295.content_page_token = self.content_page_token
	end
	if self.contentPageToken ~= nil then
		var295.content_page_token = self.contentPageToken
	end
	if self.device ~= nil then
		var295.device = self.device
	end
	if self.country ~= nil then
		var295.country = self.country
	end
	if self.session_id ~= nil then
		var295.session_id = self.session_id
	end
	if self.sessionId ~= nil then
		var295.session_id = self.sessionId
	end
	if self.age_group ~= nil then
		var295.age_group = self.age_group
	end
	if self.ageGroup ~= nil then
		var295.age_group = self.ageGroup
	end
	if self.max_memory ~= nil then
		var295.max_memory = self.max_memory
	end
	if self.maxMemory ~= nil then
		var295.max_memory = self.maxMemory
	end
	if self.selected_genre ~= nil then
		var295.selected_genre = self.selected_genre
	end
	if self.selectedGenre ~= nil then
		var295.selected_genre = self.selectedGenre
	end
	if self.cached_roblox_component_to_template_id ~= nil then
		local t = {}
		
		for i, v in self.cached_roblox_component_to_template_id do
			t[i] = v
		end
		var295.cached_roblox_component_to_template_id = t
	end
	if self.cachedRobloxComponentToTemplateId ~= nil then
		local t = {}
		
		for i, v in self.cachedRobloxComponentToTemplateId do
			t[i] = v
		end
		var295.cached_roblox_component_to_template_id = t
	end
	if self.client_capabilities ~= nil then
		var295.client_capabilities = clientCapabilitiesModule.ClientCapabilities.jsonDecode(self.client_capabilities)
	end
	if self.clientCapabilities ~= nil then
		var295.client_capabilities = clientCapabilitiesModule.ClientCapabilities.jsonDecode(self.clientCapabilities)
	end
	return var295
end

t_8.descriptor = {
	name = "GetChartsSortDetailRequest",
	fullName = "roblox.apppageplatform.charts.v1beta1.GetChartsSortDetailRequest"
}
t.GetChartsSortDetailRequest = t_8
typeRegistryModule.default:register(t.GetChartsSortDetailRequest)
local t_9 = {}
t_9.__index = t_9

function t_9.new(p9)
	-- upvalues: t_9 (ref)
	return setmetatable({
		key = if p9 == nil or p9.key == nil then "" else p9.key,
		value = if p9 == nil or p9.value == nil then "" else p9.value
	}, t_9)
end

function t_9:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var296 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var297, var298 = protoModule.writeTag(buff, var296, 1, protoModule.wireTypes.lengthDelimited)
		var297, var385 = protoModule.writeString(var297, var298, self.key)
		buff = var297
		var296 = var298
	end
	if self.value ~= nil and self.value ~= "" then
		local var299, var300 = protoModule.writeTag(buff, var296, 2, protoModule.wireTypes.lengthDelimited)
		var299, var387 = protoModule.writeString(var299, var300, self.value)
		buff = var299
		var296 = var300
	end
	local buff_1 = buffer.create(var296)
	buffer.copy(buff_1, 0, buff, 0, var296)
	
	return buff_1
end

function t_9.decode(p9)
	-- upvalues: t_9 (ref), protoModule (ref)
	local var296 = t_9.new()
	local var297 = 0
	while var297 < buffer.len(p9) do
		local _ = nil
		local var298 = nil
		local var299, var300, var301 = protoModule.readTag(p9, var297)
		local var302 = var299
		var298 = var300
		var297 = var301
		
		if var298 == protoModule.wireTypes.varint then
			local _ = nil
			local var303, var304 = protoModule.readVarInt(p9, var297)
			local _ = var303
			var297 = var304
			continue
		end
		if var298 == protoModule.wireTypes.lengthDelimited then
			if var302 == 1 then
				local _ = nil
				local var305, var306 = protoModule.readBuffer(p9, var297)
				var297 = var306
				var296.key = buffer.tostring(var305)
			elseif var302 == 2 then
				local _ = nil
				local var307, var308 = protoModule.readBuffer(p9, var297)
				var297 = var308
				var296.value = buffer.tostring(var307)
			else
				local _ = nil
				local var309, var310 = protoModule.readVarInt(p9, var297)
				var297 = var310 + var309
			end
		elseif var298 == protoModule.wireTypes.i32 then
			local _ = nil
			local var311, var312 = protoModule.readFixed32(p9, var297)
			local _ = var311
			var297 = var312
		elseif var298 == protoModule.wireTypes.i64 then
			local _ = nil
			local var313, var314 = protoModule.readFixed64(p9, var297)
			local _ = var313
			var297 = var314
		else
			error("Unsupported wire type: " .. var391)
		end
	end
	return var296
end

function t_9:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function t_9:jsonDecode()
	-- upvalues: t_9 (ref)
	local var315 = t_9.new()
	
	if self.key ~= nil then
		var315.key = self.key
	end
	if self.value ~= nil then
		var315.value = self.value
	end
	return var315
end

t_9.descriptor = {
	name = "GetChartsSortDetailRequest_CachedRobloxComponentToTemplateIdEntry",
	fullName = "roblox.apppageplatform.charts.v1beta1.CachedRobloxComponentToTemplateIdEntry"
}
t.GetChartsSortDetailRequest_CachedRobloxComponentToTemplateIdEntry = t_9
typeRegistryModule.default:register(t.GetChartsSortDetailRequest_CachedRobloxComponentToTemplateIdEntry)
local t_10 = {}
t_10.__index = t_10

function t_10.new(p10)
	-- upvalues: t_10 (ref)
	return setmetatable({
		page_entries = if p10 == nil or p10.page_entries == nil then {} else p10.page_entries,
		hydration_data = if p10 == nil or p10.hydration_data == nil then nil else p10.hydration_data,
		templates = if p10 == nil or p10.templates == nil then {} else p10.templates,
		next_content_page_token = if p10 == nil or p10.next_content_page_token == nil then "" else p10.next_content_page_token,
		localized_literals = if p10 == nil or p10.localized_literals == nil then {} else p10.localized_literals
	}, t_10)
end

function t_10:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var315 = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for i, v in self.page_entries do
			local var316 = v:encode()
			local var317, var318 = protoModule.writeTag(buff, var315, 1, protoModule.wireTypes.lengthDelimited)
			var317, var414 = protoModule.writeBuffer(var317, var318, var316, buffer.len(var316))
			buff = var317
			var315 = var318
		end
	end
	if self.hydration_data ~= nil then
		local var319 = self.hydration_data:encode()
		local var320, var321 = protoModule.writeTag(buff, var315, 2, protoModule.wireTypes.lengthDelimited)
		var320, var417 = protoModule.writeBuffer(var320, var321, var319, buffer.len(var319))
		buff = var320
		var315 = var321
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, v in self.templates do
			local var322, var323 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var322, var419 = protoModule.writeString(var322, var323, i)
			local var324 = v:encode()
			var323, var421 = protoModule.writeTag(var322, var323, 2, protoModule.wireTypes.lengthDelimited)
			var323, var421 = protoModule.writeBuffer(var323, var421, var324, buffer.len(var324))
			local var325 = var323
			local var326 = var421
			local var327, var328 = protoModule.writeTag(buff, var315, 3, protoModule.wireTypes.lengthDelimited)
			var327, var425 = protoModule.writeBuffer(var327, var328, var325, var326)
			buff = var327
			var315 = var328
		end
	end
	if self.next_content_page_token ~= nil and self.next_content_page_token ~= "" then
		local var329, var330 = protoModule.writeTag(buff, var315, 4, protoModule.wireTypes.lengthDelimited)
		var329, var427 = protoModule.writeString(var329, var330, self.next_content_page_token)
		buff = var329
		var315 = var330
	end
	if self.localized_literals ~= nil and next(self.localized_literals) ~= nil then
		for i, v in self.localized_literals do
			local var331, var332 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var331, var429 = protoModule.writeString(var331, var332, i)
			var331, var429 = protoModule.writeTag(var331, var332, 2, protoModule.wireTypes.lengthDelimited)
			var331, var429 = protoModule.writeString(var331, var332, v)
			local var333 = var331
			local var334 = var332
			local var335, var336 = protoModule.writeTag(buff, var315, 5, protoModule.wireTypes.lengthDelimited)
			var335, var433 = protoModule.writeBuffer(var335, var336, var333, var334)
			buff = var335
			var315 = var336
		end
	end
	local buff_1 = buffer.create(var315)
	buffer.copy(buff_1, 0, buff, 0, var315)
	
	return buff_1
end

function t_10.decode(p10)
	-- upvalues: t_10 (ref), protoModule (ref), pageEntryContentModule (ref), hydrationContentModule (ref), t (ref), templateEntryModule (ref)
	local var337 = t_10.new()
	local var338 = 0
	while var338 < buffer.len(p10) do
		local _ = nil
		local var339 = nil
		local var340, var341, var342 = protoModule.readTag(p10, var338)
		local var343 = var340
		var339 = var341
		var338 = var342
		
		if var339 == protoModule.wireTypes.varint then
			local _ = nil
			local var344, var345 = protoModule.readVarInt(p10, var338)
			local _ = var344
			var338 = var345
			continue
		end
		if var339 == protoModule.wireTypes.lengthDelimited then
			if var343 == 1 then
				local _ = nil
				local var346, var347 = protoModule.readBuffer(p10, var338)
				var338 = var347
				table.insert(var337.page_entries, pageEntryContentModule.UniversalPageEntry.decode(var346))
			elseif var343 == 2 then
				local _ = nil
				local var348, var349 = protoModule.readBuffer(p10, var338)
				var338 = var349
				var337.hydration_data = hydrationContentModule.HydrationContent.decode(var348)
			elseif var343 == 3 then
				local _ = nil
				local var350, var351 = protoModule.readBuffer(p10, var338)
				var338 = var351
				var350 = t.GetChartsSortDetailResponse_TemplatesEntry.decode(var350)
				var337.templates[var350.key or ""] = var350.value or templateEntryModule.TemplateEntry.new()
			elseif var343 == 4 then
				local _ = nil
				local var352, var353 = protoModule.readBuffer(p10, var338)
				var338 = var353
				var337.next_content_page_token = buffer.tostring(var352)
			elseif var343 == 5 then
				local _ = nil
				local var354, var355 = protoModule.readBuffer(p10, var338)
				var338 = var355
				var354 = t.GetChartsSortDetailResponse_LocalizedLiteralsEntry.decode(var354)
				var337.localized_literals[var354.key or ""] = var354.value or ""
			else
				local _ = nil
				local var356, var357 = protoModule.readVarInt(p10, var338)
				var338 = var357 + var356
			end
		elseif var339 == protoModule.wireTypes.i32 then
			local _ = nil
			local var358, var359 = protoModule.readFixed32(p10, var338)
			local _ = var358
			var338 = var359
		elseif var339 == protoModule.wireTypes.i64 then
			local _ = nil
			local var360, var361 = protoModule.readFixed64(p10, var338)
			local _ = var360
			var338 = var361
		else
			error("Unsupported wire type: " .. var437)
		end
	end
	return var337
end

function t_10:jsonEncode()
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

function t_10:jsonDecode()
	-- upvalues: t_10 (ref), pageEntryContentModule (ref), hydrationContentModule (ref), templateEntryModule (ref)
	local var362 = t_10.new()
	
	if self.page_entries ~= nil then
		local t = {}
		
		for i, v in self.page_entries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var362.page_entries = t
	end
	if self.pageEntries ~= nil then
		local t = {}
		
		for i, v in self.pageEntries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var362.page_entries = t
	end
	if self.hydration_data ~= nil then
		var362.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		var362.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	if self.templates ~= nil then
		local t = {}
		
		for i, v in self.templates do
			t[i] = templateEntryModule.TemplateEntry.jsonDecode(v)
		end
		var362.templates = t
	end
	if self.next_content_page_token ~= nil then
		var362.next_content_page_token = self.next_content_page_token
	end
	if self.nextContentPageToken ~= nil then
		var362.next_content_page_token = self.nextContentPageToken
	end
	if self.localized_literals ~= nil then
		local t = {}
		
		for i, v in self.localized_literals do
			t[i] = v
		end
		var362.localized_literals = t
	end
	if self.localizedLiterals ~= nil then
		local t = {}
		
		for i, v in self.localizedLiterals do
			t[i] = v
		end
		var362.localized_literals = t
	end
	return var362
end

t_10.descriptor = {
	name = "GetChartsSortDetailResponse",
	fullName = "roblox.apppageplatform.charts.v1beta1.GetChartsSortDetailResponse"
}
t.GetChartsSortDetailResponse = t_10
typeRegistryModule.default:register(t.GetChartsSortDetailResponse)
local t_11 = {}
t_11.__index = t_11

function t_11.new(p11)
	-- upvalues: t_11 (ref)
	return setmetatable({
		key = if p11 == nil or p11.key == nil then "" else p11.key,
		value = if p11 == nil or p11.value == nil then nil else p11.value
	}, t_11)
end

function t_11:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var363 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var364, var365 = protoModule.writeTag(buff, var363, 1, protoModule.wireTypes.lengthDelimited)
		var364, var473 = protoModule.writeString(var364, var365, self.key)
		buff = var364
		var363 = var365
	end
	if self.value ~= nil then
		local var366 = self.value:encode()
		local var367, var368 = protoModule.writeTag(buff, var363, 2, protoModule.wireTypes.lengthDelimited)
		var367, var476 = protoModule.writeBuffer(var367, var368, var366, buffer.len(var366))
		buff = var367
		var363 = var368
	end
	local buff_1 = buffer.create(var363)
	buffer.copy(buff_1, 0, buff, 0, var363)
	
	return buff_1
end

function t_11.decode(p11)
	-- upvalues: t_11 (ref), protoModule (ref), templateEntryModule (ref)
	local var363 = t_11.new()
	local var364 = 0
	while var364 < buffer.len(p11) do
		local _ = nil
		local var365 = nil
		local var366, var367, var368 = protoModule.readTag(p11, var364)
		local var369 = var366
		var365 = var367
		var364 = var368
		
		if var365 == protoModule.wireTypes.varint then
			local _ = nil
			local var370, var371 = protoModule.readVarInt(p11, var364)
			local _ = var370
			var364 = var371
			continue
		end
		if var365 == protoModule.wireTypes.lengthDelimited then
			if var369 == 1 then
				local _ = nil
				local var372, var373 = protoModule.readBuffer(p11, var364)
				var364 = var373
				var363.key = buffer.tostring(var372)
			elseif var369 == 2 then
				local _ = nil
				local var374, var375 = protoModule.readBuffer(p11, var364)
				var364 = var375
				var363.value = templateEntryModule.TemplateEntry.decode(var374)
			else
				local _ = nil
				local var376, var377 = protoModule.readVarInt(p11, var364)
				var364 = var377 + var376
			end
		elseif var365 == protoModule.wireTypes.i32 then
			local _ = nil
			local var378, var379 = protoModule.readFixed32(p11, var364)
			local _ = var378
			var364 = var379
		elseif var365 == protoModule.wireTypes.i64 then
			local _ = nil
			local var380, var381 = protoModule.readFixed64(p11, var364)
			local _ = var380
			var364 = var381
		else
			error("Unsupported wire type: " .. var480)
		end
	end
	return var363
end

function t_11:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_11:jsonDecode()
	-- upvalues: t_11 (ref), templateEntryModule (ref)
	local var382 = t_11.new()
	
	if self.key ~= nil then
		var382.key = self.key
	end
	if self.value ~= nil then
		var382.value = templateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return var382
end

t_11.descriptor = {
	name = "GetChartsSortDetailResponse_TemplatesEntry",
	fullName = "roblox.apppageplatform.charts.v1beta1.TemplatesEntry"
}
t.GetChartsSortDetailResponse_TemplatesEntry = t_11
typeRegistryModule.default:register(t.GetChartsSortDetailResponse_TemplatesEntry)
local t_12 = {}
t_12.__index = t_12

function t_12.new(p12)
	-- upvalues: t_12 (ref)
	return setmetatable({
		key = if p12 == nil or p12.key == nil then "" else p12.key,
		value = if p12 == nil or p12.value == nil then "" else p12.value
	}, t_12)
end

function t_12:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var382 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var383, var384 = protoModule.writeTag(buff, var382, 1, protoModule.wireTypes.lengthDelimited)
		var383, var502 = protoModule.writeString(var383, var384, self.key)
		buff = var383
		var382 = var384
	end
	if self.value ~= nil and self.value ~= "" then
		local var385, var386 = protoModule.writeTag(buff, var382, 2, protoModule.wireTypes.lengthDelimited)
		var385, var504 = protoModule.writeString(var385, var386, self.value)
		buff = var385
		var382 = var386
	end
	local buff_1 = buffer.create(var382)
	buffer.copy(buff_1, 0, buff, 0, var382)
	
	return buff_1
end

function t_12.decode(p12)
	-- upvalues: t_12 (ref), protoModule (ref)
	local var382 = t_12.new()
	local var383 = 0
	while var383 < buffer.len(p12) do
		local _ = nil
		local var384 = nil
		local var385, var386, var387 = protoModule.readTag(p12, var383)
		local var388 = var385
		var384 = var386
		var383 = var387
		
		if var384 == protoModule.wireTypes.varint then
			local _ = nil
			local var389, var390 = protoModule.readVarInt(p12, var383)
			local _ = var389
			var383 = var390
			continue
		end
		if var384 == protoModule.wireTypes.lengthDelimited then
			if var388 == 1 then
				local _ = nil
				local var391, var392 = protoModule.readBuffer(p12, var383)
				var383 = var392
				var382.key = buffer.tostring(var391)
			elseif var388 == 2 then
				local _ = nil
				local var393, var394 = protoModule.readBuffer(p12, var383)
				var383 = var394
				var382.value = buffer.tostring(var393)
			else
				local _ = nil
				local var395, var396 = protoModule.readVarInt(p12, var383)
				var383 = var396 + var395
			end
		elseif var384 == protoModule.wireTypes.i32 then
			local _ = nil
			local var397, var398 = protoModule.readFixed32(p12, var383)
			local _ = var397
			var383 = var398
		elseif var384 == protoModule.wireTypes.i64 then
			local _ = nil
			local var399, var400 = protoModule.readFixed64(p12, var383)
			local _ = var399
			var383 = var400
		else
			error("Unsupported wire type: " .. var508)
		end
	end
	return var382
end

function t_12:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function t_12:jsonDecode()
	-- upvalues: t_12 (ref)
	local var401 = t_12.new()
	
	if self.key ~= nil then
		var401.key = self.key
	end
	if self.value ~= nil then
		var401.value = self.value
	end
	return var401
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