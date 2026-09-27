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
		client_capabilities = if p1 == nil or p1.client_capabilities == nil then nil else p1.client_capabilities,
		audience = if p1 == nil or p1.audience == nil then "" else p1.audience
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
	if self.audience ~= nil and self.audience ~= "" then
		local var38, var39 = protoModule.writeTag(buff, var1, 16, protoModule.wireTypes.lengthDelimited)
		var38, var59 = protoModule.writeString(var38, var39, self.audience)
		buff = var38
		var1 = var39
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref), hydrationStreamModeModule (ref), t (ref), clientCapabilitiesModule (ref)
	local var40 = t_1.new()
	local var41 = 0
	while var41 < buffer.len(p1) do
		local _ = nil
		local var42 = nil
		local var43, var44, var45 = protoModule.readTag(p1, var41)
		local var46 = var43
		var42 = var44
		var41 = var45
		
		if var42 == protoModule.wireTypes.varint then
			if var46 == 10 then
				local _ = nil
				local var47, var48 = protoModule.readVarInt(p1, var41)
				var41 = var48
				var40.include_placeholders = var47 ~= 0
			elseif var46 == 11 then
				local _ = nil
				local var49, var50 = protoModule.readVarInt(p1, var41)
				var41 = var50
				var40.hydration_stream_enabled = var49 ~= 0
			elseif var46 == 12 then
				local _ = nil
				local var51, var52 = protoModule.readVarIntI32(p1, var41)
				local var53 = var51
				var41 = var52
				var40.hydration_stream_mode = hydrationStreamModeModule.HydrationStreamMode.fromNumber(var53) or var53
			else
				local _ = nil
				local var54, var55 = protoModule.readVarInt(p1, var41)
				local _ = var54
				var41 = var55
			end
		end
		if var42 == protoModule.wireTypes.lengthDelimited then
			if var46 == 1 then
				local _ = nil
				local var56, var57 = protoModule.readBuffer(p1, var41)
				var41 = var57
				var40.feed_page_token = buffer.tostring(var56)
			elseif var46 == 2 then
				local _ = nil
				local var58, var59 = protoModule.readBuffer(p1, var41)
				var41 = var59
				var40.device = buffer.tostring(var58)
			elseif var46 == 3 then
				local _ = nil
				local var60, var61 = protoModule.readBuffer(p1, var41)
				var41 = var61
				var40.country = buffer.tostring(var60)
			elseif var46 == 4 then
				local _ = nil
				local var62, var63 = protoModule.readBuffer(p1, var41)
				var41 = var63
				var40.age_group = buffer.tostring(var62)
			elseif var46 == 5 then
				local _ = nil
				local var64, var65 = protoModule.readBuffer(p1, var41)
				var41 = var65
				var40.session_id = buffer.tostring(var64)
			elseif var46 == 6 then
				local _ = nil
				local var66, var67 = protoModule.readBuffer(p1, var41)
				var41 = var67
				var40.entry_pagination_key = buffer.tostring(var66)
			elseif var46 == 7 then
				local _ = nil
				local var68, var69 = protoModule.readBuffer(p1, var41)
				var41 = var69
				var40.entry_page_token = buffer.tostring(var68)
			elseif var46 == 8 then
				local _ = nil
				local var70, var71 = protoModule.readBuffer(p1, var41)
				var41 = var71
				var40.max_memory = buffer.tostring(var70)
			elseif var46 == 9 then
				local _ = nil
				local var72, var73 = protoModule.readBuffer(p1, var41)
				var41 = var73
				var40.page_type = buffer.tostring(var72)
			elseif var46 == 13 then
				local _ = nil
				local var74, var75 = protoModule.readBuffer(p1, var41)
				var41 = var75
				var40.collection_layout = t.CollectionLayoutInfo.decode(var74)
			elseif var46 == 14 then
				local _ = nil
				local var76, var77 = protoModule.readBuffer(p1, var41)
				var41 = var77
				var76 = t.GetChartsPageRequest_CachedRobloxComponentToTemplateIdEntry.decode(var76)
				var40.cached_roblox_component_to_template_id[var76.key or ""] = var76.value or ""
			elseif var46 == 15 then
				local _ = nil
				local var78, var79 = protoModule.readBuffer(p1, var41)
				var41 = var79
				var40.client_capabilities = clientCapabilitiesModule.ClientCapabilities.decode(var78)
			elseif var46 == 16 then
				local _ = nil
				local var80, var81 = protoModule.readBuffer(p1, var41)
				var41 = var81
				var40.audience = buffer.tostring(var80)
			else
				local _ = nil
				local var82, var83 = protoModule.readVarInt(p1, var41)
				var41 = var83 + var82
			end
		elseif var42 == protoModule.wireTypes.i32 then
			local _ = nil
			local var84, var85 = protoModule.readFixed32(p1, var41)
			local _ = var84
			var41 = var85
		elseif var42 == protoModule.wireTypes.i64 then
			local _ = nil
			local var86, var87 = protoModule.readFixed64(p1, var41)
			local _ = var86
			var41 = var87
		else
			error("Unsupported wire type: " .. var63)
		end
	end
	return var40
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
	if self.audience ~= nil and self.audience ~= "" then
		t.audience = self.audience
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref), hydrationStreamModeModule (ref), t (ref), clientCapabilitiesModule (ref)
	local var88 = t_1.new()
	
	if self.feed_page_token ~= nil then
		var88.feed_page_token = self.feed_page_token
	end
	if self.feedPageToken ~= nil then
		var88.feed_page_token = self.feedPageToken
	end
	if self.device ~= nil then
		var88.device = self.device
	end
	if self.country ~= nil then
		var88.country = self.country
	end
	if self.age_group ~= nil then
		var88.age_group = self.age_group
	end
	if self.ageGroup ~= nil then
		var88.age_group = self.ageGroup
	end
	if self.session_id ~= nil then
		var88.session_id = self.session_id
	end
	if self.sessionId ~= nil then
		var88.session_id = self.sessionId
	end
	if self.entry_pagination_key ~= nil then
		var88.entry_pagination_key = self.entry_pagination_key
	end
	if self.entryPaginationKey ~= nil then
		var88.entry_pagination_key = self.entryPaginationKey
	end
	if self.entry_page_token ~= nil then
		var88.entry_page_token = self.entry_page_token
	end
	if self.entryPageToken ~= nil then
		var88.entry_page_token = self.entryPageToken
	end
	if self.max_memory ~= nil then
		var88.max_memory = self.max_memory
	end
	if self.maxMemory ~= nil then
		var88.max_memory = self.maxMemory
	end
	if self.page_type ~= nil then
		var88.page_type = self.page_type
	end
	if self.pageType ~= nil then
		var88.page_type = self.pageType
	end
	if self.include_placeholders ~= nil then
		var88.include_placeholders = self.include_placeholders
	end
	if self.includePlaceholders ~= nil then
		var88.include_placeholders = self.includePlaceholders
	end
	if self.hydration_stream_enabled ~= nil then
		var88.hydration_stream_enabled = self.hydration_stream_enabled
	end
	if self.hydrationStreamEnabled ~= nil then
		var88.hydration_stream_enabled = self.hydrationStreamEnabled
	end
	if self.hydration_stream_mode ~= nil then
		var88.hydration_stream_mode = if typeof(self.hydration_stream_mode) == "number" then hydrationStreamModeModule.HydrationStreamMode.fromNumber(self.hydration_stream_mode) or self.hydration_stream_mode else hydrationStreamModeModule.HydrationStreamMode.fromName(self.hydration_stream_mode) or self.hydration_stream_mode
	end
	if self.hydrationStreamMode ~= nil then
		var88.hydration_stream_mode = if typeof(self.hydrationStreamMode) == "number" then hydrationStreamModeModule.HydrationStreamMode.fromNumber(self.hydrationStreamMode) or self.hydrationStreamMode else hydrationStreamModeModule.HydrationStreamMode.fromName(self.hydrationStreamMode) or self.hydrationStreamMode
	end
	if self.collection_layout ~= nil then
		var88.collection_layout = t.CollectionLayoutInfo.jsonDecode(self.collection_layout)
	end
	if self.collectionLayout ~= nil then
		var88.collection_layout = t.CollectionLayoutInfo.jsonDecode(self.collectionLayout)
	end
	if self.cached_roblox_component_to_template_id ~= nil then
		local t_2 = {}
		
		for i, v in self.cached_roblox_component_to_template_id do
			t_2[i] = v
		end
		var88.cached_roblox_component_to_template_id = t_2
	end
	if self.cachedRobloxComponentToTemplateId ~= nil then
		local t_2 = {}
		
		for i, v in self.cachedRobloxComponentToTemplateId do
			t_2[i] = v
		end
		var88.cached_roblox_component_to_template_id = t_2
	end
	if self.client_capabilities ~= nil then
		var88.client_capabilities = clientCapabilitiesModule.ClientCapabilities.jsonDecode(self.client_capabilities)
	end
	if self.clientCapabilities ~= nil then
		var88.client_capabilities = clientCapabilitiesModule.ClientCapabilities.jsonDecode(self.clientCapabilities)
	end
	if self.audience ~= nil then
		var88.audience = self.audience
	end
	return var88
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
	local var89 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var90, var91 = protoModule.writeTag(buff, var89, 1, protoModule.wireTypes.lengthDelimited)
		var90, var117 = protoModule.writeString(var90, var91, self.key)
		buff = var90
		var89 = var91
	end
	if self.value ~= nil and self.value ~= "" then
		local var92, var93 = protoModule.writeTag(buff, var89, 2, protoModule.wireTypes.lengthDelimited)
		var92, var119 = protoModule.writeString(var92, var93, self.value)
		buff = var92
		var89 = var93
	end
	local buff_1 = buffer.create(var89)
	buffer.copy(buff_1, 0, buff, 0, var89)
	
	return buff_1
end

function t_2.decode(p2)
	-- upvalues: t_2 (ref), protoModule (ref)
	local var89 = t_2.new()
	local var90 = 0
	while var90 < buffer.len(p2) do
		local _ = nil
		local var91 = nil
		local var92, var93, var94 = protoModule.readTag(p2, var90)
		local var95 = var92
		var91 = var93
		var90 = var94
		
		if var91 == protoModule.wireTypes.varint then
			local _ = nil
			local var96, var97 = protoModule.readVarInt(p2, var90)
			local _ = var96
			var90 = var97
			continue
		end
		if var91 == protoModule.wireTypes.lengthDelimited then
			if var95 == 1 then
				local _ = nil
				local var98, var99 = protoModule.readBuffer(p2, var90)
				var90 = var99
				var89.key = buffer.tostring(var98)
			elseif var95 == 2 then
				local _ = nil
				local var100, var101 = protoModule.readBuffer(p2, var90)
				var90 = var101
				var89.value = buffer.tostring(var100)
			else
				local _ = nil
				local var102, var103 = protoModule.readVarInt(p2, var90)
				var90 = var103 + var102
			end
		elseif var91 == protoModule.wireTypes.i32 then
			local _ = nil
			local var104, var105 = protoModule.readFixed32(p2, var90)
			local _ = var104
			var90 = var105
		elseif var91 == protoModule.wireTypes.i64 then
			local _ = nil
			local var106, var107 = protoModule.readFixed64(p2, var90)
			local _ = var106
			var90 = var107
		else
			error("Unsupported wire type: " .. var123)
		end
	end
	return var89
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
	local var108 = t_2.new()
	
	if self.key ~= nil then
		var108.key = self.key
	end
	if self.value ~= nil then
		var108.value = self.value
	end
	return var108
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
	local var108 = 0
	
	if self.items_per_row ~= nil and next(self.items_per_row) ~= nil then
		for i, v in self.items_per_row do
			local var109, var110 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var109, var145 = protoModule.writeString(var109, var110, i)
			var109, var145 = protoModule.writeTag(var109, var110, 2, protoModule.wireTypes.varint)
			var109, var145 = protoModule.writeVarInt(var109, var110, v)
			local var111 = var109
			local var112 = var110
			local var113, var114 = protoModule.writeTag(buff, var108, 1, protoModule.wireTypes.lengthDelimited)
			var113, var149 = protoModule.writeBuffer(var113, var114, var111, var112)
			buff = var113
			var108 = var114
		end
	end
	if self.rows_above_fold ~= nil and self.rows_above_fold ~= 0 then
		local var115, var116 = protoModule.writeTag(buff, var108, 2, protoModule.wireTypes.varint)
		var115, var151 = protoModule.writeVarInt(var115, var116, self.rows_above_fold)
		buff = var115
		var108 = var116
	end
	local buff_1 = buffer.create(var108)
	buffer.copy(buff_1, 0, buff, 0, var108)
	
	return buff_1
end

function t_3.decode(p3)
	-- upvalues: t_3 (ref), protoModule (ref), t (ref)
	local var117 = t_3.new()
	local var118 = 0
	while var118 < buffer.len(p3) do
		local _ = nil
		local var119 = nil
		local var120, var121, var122 = protoModule.readTag(p3, var118)
		local var123 = var120
		var119 = var121
		var118 = var122
		
		if var119 == protoModule.wireTypes.varint then
			if var123 == 2 then
				local _ = nil
				local var124, var125 = protoModule.readVarIntI32(p3, var118)
				var118 = var125
				var117.rows_above_fold = var124
			else
				local _ = nil
				local var126, var127 = protoModule.readVarInt(p3, var118)
				local _ = var126
				var118 = var127
			end
		end
		if var119 == protoModule.wireTypes.lengthDelimited then
			if var123 == 1 then
				local _ = nil
				local var128, var129 = protoModule.readBuffer(p3, var118)
				var118 = var129
				var128 = t.CollectionLayoutInfo_ItemsPerRowEntry.decode(var128)
				var117.items_per_row[var128.key or ""] = var128.value or 0
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
			error("Unsupported wire type: " .. var155)
		end
	end
	return var117
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
	local var136 = t_3.new()
	
	if self.items_per_row ~= nil then
		local t = {}
		
		for i, v in self.items_per_row do
			t[i] = v
		end
		var136.items_per_row = t
	end
	if self.itemsPerRow ~= nil then
		local t = {}
		
		for i, v in self.itemsPerRow do
			t[i] = v
		end
		var136.items_per_row = t
	end
	if self.rows_above_fold ~= nil then
		var136.rows_above_fold = self.rows_above_fold
	end
	if self.rowsAboveFold ~= nil then
		var136.rows_above_fold = self.rowsAboveFold
	end
	return var136
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
	local var137 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var138, var139 = protoModule.writeTag(buff, var137, 1, protoModule.wireTypes.lengthDelimited)
		var138, var180 = protoModule.writeString(var138, var139, self.key)
		buff = var138
		var137 = var139
	end
	if self.value ~= nil and self.value ~= 0 then
		local var140, var141 = protoModule.writeTag(buff, var137, 2, protoModule.wireTypes.varint)
		var140, var182 = protoModule.writeVarInt(var140, var141, self.value)
		buff = var140
		var137 = var141
	end
	local buff_1 = buffer.create(var137)
	buffer.copy(buff_1, 0, buff, 0, var137)
	
	return buff_1
end

function t_4.decode(p4)
	-- upvalues: t_4 (ref), protoModule (ref)
	local var137 = t_4.new()
	local var138 = 0
	while var138 < buffer.len(p4) do
		local _ = nil
		local var139 = nil
		local var140, var141, var142 = protoModule.readTag(p4, var138)
		local var143 = var140
		var139 = var141
		var138 = var142
		
		if var139 == protoModule.wireTypes.varint then
			if var143 == 2 then
				local _ = nil
				local var144, var145 = protoModule.readVarIntI32(p4, var138)
				var138 = var145
				var137.value = var144
			else
				local _ = nil
				local var146, var147 = protoModule.readVarInt(p4, var138)
				local _ = var146
				var138 = var147
			end
		end
		if var139 == protoModule.wireTypes.lengthDelimited then
			if var143 == 1 then
				local _ = nil
				local var148, var149 = protoModule.readBuffer(p4, var138)
				var138 = var149
				var137.key = buffer.tostring(var148)
			else
				local _ = nil
				local var150, var151 = protoModule.readVarInt(p4, var138)
				var138 = var151 + var150
			end
		elseif var139 == protoModule.wireTypes.i32 then
			local _ = nil
			local var152, var153 = protoModule.readFixed32(p4, var138)
			local _ = var152
			var138 = var153
		elseif var139 == protoModule.wireTypes.i64 then
			local _ = nil
			local var154, var155 = protoModule.readFixed64(p4, var138)
			local _ = var154
			var138 = var155
		else
			error("Unsupported wire type: " .. var186)
		end
	end
	return var137
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
	local var156 = t_4.new()
	
	if self.key ~= nil then
		var156.key = self.key
	end
	if self.value ~= nil then
		var156.value = self.value
	end
	return var156
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
	local var156 = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for i, v in self.page_entries do
			local var157 = v:encode()
			local var158, var159 = protoModule.writeTag(buff, var156, 1, protoModule.wireTypes.lengthDelimited)
			var158, var209 = protoModule.writeBuffer(var158, var159, var157, buffer.len(var157))
			buff = var158
			var156 = var159
		end
	end
	if self.hydration_data ~= nil then
		local var160 = self.hydration_data:encode()
		local var161, var162 = protoModule.writeTag(buff, var156, 2, protoModule.wireTypes.lengthDelimited)
		var161, var212 = protoModule.writeBuffer(var161, var162, var160, buffer.len(var160))
		buff = var161
		var156 = var162
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, v in self.templates do
			local var163, var164 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var163, var214 = protoModule.writeString(var163, var164, i)
			local var165 = v:encode()
			var164, var216 = protoModule.writeTag(var163, var164, 2, protoModule.wireTypes.lengthDelimited)
			var164, var216 = protoModule.writeBuffer(var164, var216, var165, buffer.len(var165))
			local var166 = var164
			local var167 = var216
			local var168, var169 = protoModule.writeTag(buff, var156, 3, protoModule.wireTypes.lengthDelimited)
			var168, var220 = protoModule.writeBuffer(var168, var169, var166, var167)
			buff = var168
			var156 = var169
		end
	end
	if self.localized_literals ~= nil and next(self.localized_literals) ~= nil then
		for i, v in self.localized_literals do
			local var170, var171 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var170, var222 = protoModule.writeString(var170, var171, i)
			var170, var222 = protoModule.writeTag(var170, var171, 2, protoModule.wireTypes.lengthDelimited)
			var170, var222 = protoModule.writeString(var170, var171, v)
			local var172 = var170
			local var173 = var171
			local var174, var175 = protoModule.writeTag(buff, var156, 4, protoModule.wireTypes.lengthDelimited)
			var174, var226 = protoModule.writeBuffer(var174, var175, var172, var173)
			buff = var174
			var156 = var175
		end
	end
	local buff_1 = buffer.create(var156)
	buffer.copy(buff_1, 0, buff, 0, var156)
	
	return buff_1
end

function t_5.decode(p5)
	-- upvalues: t_5 (ref), protoModule (ref), pageEntryContentModule (ref), hydrationContentModule (ref), t (ref), templateEntryModule (ref)
	local var176 = t_5.new()
	local var177 = 0
	while var177 < buffer.len(p5) do
		local _ = nil
		local var178 = nil
		local var179, var180, var181 = protoModule.readTag(p5, var177)
		local var182 = var179
		var178 = var180
		var177 = var181
		
		if var178 == protoModule.wireTypes.varint then
			local _ = nil
			local var183, var184 = protoModule.readVarInt(p5, var177)
			local _ = var183
			var177 = var184
			continue
		end
		if var178 == protoModule.wireTypes.lengthDelimited then
			if var182 == 1 then
				local _ = nil
				local var185, var186 = protoModule.readBuffer(p5, var177)
				var177 = var186
				table.insert(var176.page_entries, pageEntryContentModule.UniversalPageEntry.decode(var185))
			elseif var182 == 2 then
				local _ = nil
				local var187, var188 = protoModule.readBuffer(p5, var177)
				var177 = var188
				var176.hydration_data = hydrationContentModule.HydrationContent.decode(var187)
			elseif var182 == 3 then
				local _ = nil
				local var189, var190 = protoModule.readBuffer(p5, var177)
				var177 = var190
				var189 = t.GetChartsPageResponse_TemplatesEntry.decode(var189)
				var176.templates[var189.key or ""] = var189.value or templateEntryModule.TemplateEntry.new()
			elseif var182 == 4 then
				local _ = nil
				local var191, var192 = protoModule.readBuffer(p5, var177)
				var177 = var192
				var191 = t.GetChartsPageResponse_LocalizedLiteralsEntry.decode(var191)
				var176.localized_literals[var191.key or ""] = var191.value or ""
			else
				local _ = nil
				local var193, var194 = protoModule.readVarInt(p5, var177)
				var177 = var194 + var193
			end
		elseif var178 == protoModule.wireTypes.i32 then
			local _ = nil
			local var195, var196 = protoModule.readFixed32(p5, var177)
			local _ = var195
			var177 = var196
		elseif var178 == protoModule.wireTypes.i64 then
			local _ = nil
			local var197, var198 = protoModule.readFixed64(p5, var177)
			local _ = var197
			var177 = var198
		else
			error("Unsupported wire type: " .. var230)
		end
	end
	return var176
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
	local var199 = t_5.new()
	
	if self.page_entries ~= nil then
		local t = {}
		
		for i, v in self.page_entries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var199.page_entries = t
	end
	if self.pageEntries ~= nil then
		local t = {}
		
		for i, v in self.pageEntries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var199.page_entries = t
	end
	if self.hydration_data ~= nil then
		var199.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		var199.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	if self.templates ~= nil then
		local t = {}
		
		for i, v in self.templates do
			t[i] = templateEntryModule.TemplateEntry.jsonDecode(v)
		end
		var199.templates = t
	end
	if self.localized_literals ~= nil then
		local t = {}
		
		for i, v in self.localized_literals do
			t[i] = v
		end
		var199.localized_literals = t
	end
	if self.localizedLiterals ~= nil then
		local t = {}
		
		for i, v in self.localizedLiterals do
			t[i] = v
		end
		var199.localized_literals = t
	end
	return var199
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
	local var200 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var201, var202 = protoModule.writeTag(buff, var200, 1, protoModule.wireTypes.lengthDelimited)
		var201, var264 = protoModule.writeString(var201, var202, self.key)
		buff = var201
		var200 = var202
	end
	if self.value ~= nil then
		local var203 = self.value:encode()
		local var204, var205 = protoModule.writeTag(buff, var200, 2, protoModule.wireTypes.lengthDelimited)
		var204, var267 = protoModule.writeBuffer(var204, var205, var203, buffer.len(var203))
		buff = var204
		var200 = var205
	end
	local buff_1 = buffer.create(var200)
	buffer.copy(buff_1, 0, buff, 0, var200)
	
	return buff_1
end

function t_6.decode(p6)
	-- upvalues: t_6 (ref), protoModule (ref), templateEntryModule (ref)
	local var200 = t_6.new()
	local var201 = 0
	while var201 < buffer.len(p6) do
		local _ = nil
		local var202 = nil
		local var203, var204, var205 = protoModule.readTag(p6, var201)
		local var206 = var203
		var202 = var204
		var201 = var205
		
		if var202 == protoModule.wireTypes.varint then
			local _ = nil
			local var207, var208 = protoModule.readVarInt(p6, var201)
			local _ = var207
			var201 = var208
			continue
		end
		if var202 == protoModule.wireTypes.lengthDelimited then
			if var206 == 1 then
				local _ = nil
				local var209, var210 = protoModule.readBuffer(p6, var201)
				var201 = var210
				var200.key = buffer.tostring(var209)
			elseif var206 == 2 then
				local _ = nil
				local var211, var212 = protoModule.readBuffer(p6, var201)
				var201 = var212
				var200.value = templateEntryModule.TemplateEntry.decode(var211)
			else
				local _ = nil
				local var213, var214 = protoModule.readVarInt(p6, var201)
				var201 = var214 + var213
			end
		elseif var202 == protoModule.wireTypes.i32 then
			local _ = nil
			local var215, var216 = protoModule.readFixed32(p6, var201)
			local _ = var215
			var201 = var216
		elseif var202 == protoModule.wireTypes.i64 then
			local _ = nil
			local var217, var218 = protoModule.readFixed64(p6, var201)
			local _ = var217
			var201 = var218
		else
			error("Unsupported wire type: " .. var271)
		end
	end
	return var200
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
	local var219 = t_6.new()
	
	if self.key ~= nil then
		var219.key = self.key
	end
	if self.value ~= nil then
		var219.value = templateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return var219
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
	local var219 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var220, var221 = protoModule.writeTag(buff, var219, 1, protoModule.wireTypes.lengthDelimited)
		var220, var293 = protoModule.writeString(var220, var221, self.key)
		buff = var220
		var219 = var221
	end
	if self.value ~= nil and self.value ~= "" then
		local var222, var223 = protoModule.writeTag(buff, var219, 2, protoModule.wireTypes.lengthDelimited)
		var222, var295 = protoModule.writeString(var222, var223, self.value)
		buff = var222
		var219 = var223
	end
	local buff_1 = buffer.create(var219)
	buffer.copy(buff_1, 0, buff, 0, var219)
	
	return buff_1
end

function t_7.decode(p7)
	-- upvalues: t_7 (ref), protoModule (ref)
	local var219 = t_7.new()
	local var220 = 0
	while var220 < buffer.len(p7) do
		local _ = nil
		local var221 = nil
		local var222, var223, var224 = protoModule.readTag(p7, var220)
		local var225 = var222
		var221 = var223
		var220 = var224
		
		if var221 == protoModule.wireTypes.varint then
			local _ = nil
			local var226, var227 = protoModule.readVarInt(p7, var220)
			local _ = var226
			var220 = var227
			continue
		end
		if var221 == protoModule.wireTypes.lengthDelimited then
			if var225 == 1 then
				local _ = nil
				local var228, var229 = protoModule.readBuffer(p7, var220)
				var220 = var229
				var219.key = buffer.tostring(var228)
			elseif var225 == 2 then
				local _ = nil
				local var230, var231 = protoModule.readBuffer(p7, var220)
				var220 = var231
				var219.value = buffer.tostring(var230)
			else
				local _ = nil
				local var232, var233 = protoModule.readVarInt(p7, var220)
				var220 = var233 + var232
			end
		elseif var221 == protoModule.wireTypes.i32 then
			local _ = nil
			local var234, var235 = protoModule.readFixed32(p7, var220)
			local _ = var234
			var220 = var235
		elseif var221 == protoModule.wireTypes.i64 then
			local _ = nil
			local var236, var237 = protoModule.readFixed64(p7, var220)
			local _ = var236
			var220 = var237
		else
			error("Unsupported wire type: " .. var299)
		end
	end
	return var219
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
	local var238 = t_7.new()
	
	if self.key ~= nil then
		var238.key = self.key
	end
	if self.value ~= nil then
		var238.value = self.value
	end
	return var238
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
		client_capabilities = if p8 == nil or p8.client_capabilities == nil then nil else p8.client_capabilities,
		audience = if p8 == nil or p8.audience == nil then "" else p8.audience
	}, t_8)
end

function t_8:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var238 = 0
	
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var239, var240 = protoModule.writeTag(buff, var238, 1, protoModule.wireTypes.lengthDelimited)
		var239, var321 = protoModule.writeString(var239, var240, self.sort_id)
		buff = var239
		var238 = var240
	end
	if self.content_page_token ~= nil and self.content_page_token ~= "" then
		local var241, var242 = protoModule.writeTag(buff, var238, 2, protoModule.wireTypes.lengthDelimited)
		var241, var323 = protoModule.writeString(var241, var242, self.content_page_token)
		buff = var241
		var238 = var242
	end
	if self.device ~= nil and self.device ~= "" then
		local var243, var244 = protoModule.writeTag(buff, var238, 3, protoModule.wireTypes.lengthDelimited)
		var243, var325 = protoModule.writeString(var243, var244, self.device)
		buff = var243
		var238 = var244
	end
	if self.country ~= nil and self.country ~= "" then
		local var245, var246 = protoModule.writeTag(buff, var238, 4, protoModule.wireTypes.lengthDelimited)
		var245, var327 = protoModule.writeString(var245, var246, self.country)
		buff = var245
		var238 = var246
	end
	if self.session_id ~= nil and self.session_id ~= "" then
		local var247, var248 = protoModule.writeTag(buff, var238, 5, protoModule.wireTypes.lengthDelimited)
		var247, var329 = protoModule.writeString(var247, var248, self.session_id)
		buff = var247
		var238 = var248
	end
	if self.age_group ~= nil and self.age_group ~= "" then
		local var249, var250 = protoModule.writeTag(buff, var238, 6, protoModule.wireTypes.lengthDelimited)
		var249, var331 = protoModule.writeString(var249, var250, self.age_group)
		buff = var249
		var238 = var250
	end
	if self.max_memory ~= nil and self.max_memory ~= "" then
		local var251, var252 = protoModule.writeTag(buff, var238, 7, protoModule.wireTypes.lengthDelimited)
		var251, var333 = protoModule.writeString(var251, var252, self.max_memory)
		buff = var251
		var238 = var252
	end
	if self.selected_genre ~= nil and self.selected_genre ~= "" then
		local var253, var254 = protoModule.writeTag(buff, var238, 8, protoModule.wireTypes.lengthDelimited)
		var253, var335 = protoModule.writeString(var253, var254, self.selected_genre)
		buff = var253
		var238 = var254
	end
	if self.cached_roblox_component_to_template_id ~= nil and next(self.cached_roblox_component_to_template_id) ~= nil then
		for i, v in self.cached_roblox_component_to_template_id do
			local var255, var256 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var255, var337 = protoModule.writeString(var255, var256, i)
			var255, var337 = protoModule.writeTag(var255, var256, 2, protoModule.wireTypes.lengthDelimited)
			var255, var337 = protoModule.writeString(var255, var256, v)
			local var257 = var255
			local var258 = var256
			local var259, var260 = protoModule.writeTag(buff, var238, 9, protoModule.wireTypes.lengthDelimited)
			var259, var341 = protoModule.writeBuffer(var259, var260, var257, var258)
			buff = var259
			var238 = var260
		end
	end
	if self.client_capabilities ~= nil then
		local var261 = self.client_capabilities:encode()
		local var262, var263 = protoModule.writeTag(buff, var238, 10, protoModule.wireTypes.lengthDelimited)
		var262, var344 = protoModule.writeBuffer(var262, var263, var261, buffer.len(var261))
		buff = var262
		var238 = var263
	end
	if self.audience ~= nil and self.audience ~= "" then
		local var264, var265 = protoModule.writeTag(buff, var238, 11, protoModule.wireTypes.lengthDelimited)
		var264, var346 = protoModule.writeString(var264, var265, self.audience)
		buff = var264
		var238 = var265
	end
	local buff_1 = buffer.create(var238)
	buffer.copy(buff_1, 0, buff, 0, var238)
	
	return buff_1
end

function t_8.decode(p8)
	-- upvalues: t_8 (ref), protoModule (ref), t (ref), clientCapabilitiesModule (ref)
	local var266 = t_8.new()
	local var267 = 0
	while var267 < buffer.len(p8) do
		local _ = nil
		local var268 = nil
		local var269, var270, var271 = protoModule.readTag(p8, var267)
		local var272 = var269
		var268 = var270
		var267 = var271
		
		if var268 == protoModule.wireTypes.varint then
			local _ = nil
			local var273, var274 = protoModule.readVarInt(p8, var267)
			local _ = var273
			var267 = var274
			continue
		end
		if var268 == protoModule.wireTypes.lengthDelimited then
			if var272 == 1 then
				local _ = nil
				local var275, var276 = protoModule.readBuffer(p8, var267)
				var267 = var276
				var266.sort_id = buffer.tostring(var275)
			elseif var272 == 2 then
				local _ = nil
				local var277, var278 = protoModule.readBuffer(p8, var267)
				var267 = var278
				var266.content_page_token = buffer.tostring(var277)
			elseif var272 == 3 then
				local _ = nil
				local var279, var280 = protoModule.readBuffer(p8, var267)
				var267 = var280
				var266.device = buffer.tostring(var279)
			elseif var272 == 4 then
				local _ = nil
				local var281, var282 = protoModule.readBuffer(p8, var267)
				var267 = var282
				var266.country = buffer.tostring(var281)
			elseif var272 == 5 then
				local _ = nil
				local var283, var284 = protoModule.readBuffer(p8, var267)
				var267 = var284
				var266.session_id = buffer.tostring(var283)
			elseif var272 == 6 then
				local _ = nil
				local var285, var286 = protoModule.readBuffer(p8, var267)
				var267 = var286
				var266.age_group = buffer.tostring(var285)
			elseif var272 == 7 then
				local _ = nil
				local var287, var288 = protoModule.readBuffer(p8, var267)
				var267 = var288
				var266.max_memory = buffer.tostring(var287)
			elseif var272 == 8 then
				local _ = nil
				local var289, var290 = protoModule.readBuffer(p8, var267)
				var267 = var290
				var266.selected_genre = buffer.tostring(var289)
			elseif var272 == 9 then
				local _ = nil
				local var291, var292 = protoModule.readBuffer(p8, var267)
				var267 = var292
				var291 = t.GetChartsSortDetailRequest_CachedRobloxComponentToTemplateIdEntry.decode(var291)
				var266.cached_roblox_component_to_template_id[var291.key or ""] = var291.value or ""
			elseif var272 == 10 then
				local _ = nil
				local var293, var294 = protoModule.readBuffer(p8, var267)
				var267 = var294
				var266.client_capabilities = clientCapabilitiesModule.ClientCapabilities.decode(var293)
			elseif var272 == 11 then
				local _ = nil
				local var295, var296 = protoModule.readBuffer(p8, var267)
				var267 = var296
				var266.audience = buffer.tostring(var295)
			else
				local _ = nil
				local var297, var298 = protoModule.readVarInt(p8, var267)
				var267 = var298 + var297
			end
		elseif var268 == protoModule.wireTypes.i32 then
			local _ = nil
			local var299, var300 = protoModule.readFixed32(p8, var267)
			local _ = var299
			var267 = var300
		elseif var268 == protoModule.wireTypes.i64 then
			local _ = nil
			local var301, var302 = protoModule.readFixed64(p8, var267)
			local _ = var301
			var267 = var302
		else
			error("Unsupported wire type: " .. var350)
		end
	end
	return var266
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
	if self.audience ~= nil and self.audience ~= "" then
		t.audience = self.audience
	end
	return t
end

function t_8:jsonDecode()
	-- upvalues: t_8 (ref), clientCapabilitiesModule (ref)
	local var303 = t_8.new()
	
	if self.sort_id ~= nil then
		var303.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var303.sort_id = self.sortId
	end
	if self.content_page_token ~= nil then
		var303.content_page_token = self.content_page_token
	end
	if self.contentPageToken ~= nil then
		var303.content_page_token = self.contentPageToken
	end
	if self.device ~= nil then
		var303.device = self.device
	end
	if self.country ~= nil then
		var303.country = self.country
	end
	if self.session_id ~= nil then
		var303.session_id = self.session_id
	end
	if self.sessionId ~= nil then
		var303.session_id = self.sessionId
	end
	if self.age_group ~= nil then
		var303.age_group = self.age_group
	end
	if self.ageGroup ~= nil then
		var303.age_group = self.ageGroup
	end
	if self.max_memory ~= nil then
		var303.max_memory = self.max_memory
	end
	if self.maxMemory ~= nil then
		var303.max_memory = self.maxMemory
	end
	if self.selected_genre ~= nil then
		var303.selected_genre = self.selected_genre
	end
	if self.selectedGenre ~= nil then
		var303.selected_genre = self.selectedGenre
	end
	if self.cached_roblox_component_to_template_id ~= nil then
		local t = {}
		
		for i, v in self.cached_roblox_component_to_template_id do
			t[i] = v
		end
		var303.cached_roblox_component_to_template_id = t
	end
	if self.cachedRobloxComponentToTemplateId ~= nil then
		local t = {}
		
		for i, v in self.cachedRobloxComponentToTemplateId do
			t[i] = v
		end
		var303.cached_roblox_component_to_template_id = t
	end
	if self.client_capabilities ~= nil then
		var303.client_capabilities = clientCapabilitiesModule.ClientCapabilities.jsonDecode(self.client_capabilities)
	end
	if self.clientCapabilities ~= nil then
		var303.client_capabilities = clientCapabilitiesModule.ClientCapabilities.jsonDecode(self.clientCapabilities)
	end
	if self.audience ~= nil then
		var303.audience = self.audience
	end
	return var303
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
	local var304 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var305, var306 = protoModule.writeTag(buff, var304, 1, protoModule.wireTypes.lengthDelimited)
		var305, var393 = protoModule.writeString(var305, var306, self.key)
		buff = var305
		var304 = var306
	end
	if self.value ~= nil and self.value ~= "" then
		local var307, var308 = protoModule.writeTag(buff, var304, 2, protoModule.wireTypes.lengthDelimited)
		var307, var395 = protoModule.writeString(var307, var308, self.value)
		buff = var307
		var304 = var308
	end
	local buff_1 = buffer.create(var304)
	buffer.copy(buff_1, 0, buff, 0, var304)
	
	return buff_1
end

function t_9.decode(p9)
	-- upvalues: t_9 (ref), protoModule (ref)
	local var304 = t_9.new()
	local var305 = 0
	while var305 < buffer.len(p9) do
		local _ = nil
		local var306 = nil
		local var307, var308, var309 = protoModule.readTag(p9, var305)
		local var310 = var307
		var306 = var308
		var305 = var309
		
		if var306 == protoModule.wireTypes.varint then
			local _ = nil
			local var311, var312 = protoModule.readVarInt(p9, var305)
			local _ = var311
			var305 = var312
			continue
		end
		if var306 == protoModule.wireTypes.lengthDelimited then
			if var310 == 1 then
				local _ = nil
				local var313, var314 = protoModule.readBuffer(p9, var305)
				var305 = var314
				var304.key = buffer.tostring(var313)
			elseif var310 == 2 then
				local _ = nil
				local var315, var316 = protoModule.readBuffer(p9, var305)
				var305 = var316
				var304.value = buffer.tostring(var315)
			else
				local _ = nil
				local var317, var318 = protoModule.readVarInt(p9, var305)
				var305 = var318 + var317
			end
		elseif var306 == protoModule.wireTypes.i32 then
			local _ = nil
			local var319, var320 = protoModule.readFixed32(p9, var305)
			local _ = var319
			var305 = var320
		elseif var306 == protoModule.wireTypes.i64 then
			local _ = nil
			local var321, var322 = protoModule.readFixed64(p9, var305)
			local _ = var321
			var305 = var322
		else
			error("Unsupported wire type: " .. var399)
		end
	end
	return var304
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
	local var323 = t_9.new()
	
	if self.key ~= nil then
		var323.key = self.key
	end
	if self.value ~= nil then
		var323.value = self.value
	end
	return var323
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
	local var323 = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for i, v in self.page_entries do
			local var324 = v:encode()
			local var325, var326 = protoModule.writeTag(buff, var323, 1, protoModule.wireTypes.lengthDelimited)
			var325, var422 = protoModule.writeBuffer(var325, var326, var324, buffer.len(var324))
			buff = var325
			var323 = var326
		end
	end
	if self.hydration_data ~= nil then
		local var327 = self.hydration_data:encode()
		local var328, var329 = protoModule.writeTag(buff, var323, 2, protoModule.wireTypes.lengthDelimited)
		var328, var425 = protoModule.writeBuffer(var328, var329, var327, buffer.len(var327))
		buff = var328
		var323 = var329
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, v in self.templates do
			local var330, var331 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var330, var427 = protoModule.writeString(var330, var331, i)
			local var332 = v:encode()
			var331, var429 = protoModule.writeTag(var330, var331, 2, protoModule.wireTypes.lengthDelimited)
			var331, var429 = protoModule.writeBuffer(var331, var429, var332, buffer.len(var332))
			local var333 = var331
			local var334 = var429
			local var335, var336 = protoModule.writeTag(buff, var323, 3, protoModule.wireTypes.lengthDelimited)
			var335, var433 = protoModule.writeBuffer(var335, var336, var333, var334)
			buff = var335
			var323 = var336
		end
	end
	if self.next_content_page_token ~= nil and self.next_content_page_token ~= "" then
		local var337, var338 = protoModule.writeTag(buff, var323, 4, protoModule.wireTypes.lengthDelimited)
		var337, var435 = protoModule.writeString(var337, var338, self.next_content_page_token)
		buff = var337
		var323 = var338
	end
	if self.localized_literals ~= nil and next(self.localized_literals) ~= nil then
		for i, v in self.localized_literals do
			local var339, var340 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var339, var437 = protoModule.writeString(var339, var340, i)
			var339, var437 = protoModule.writeTag(var339, var340, 2, protoModule.wireTypes.lengthDelimited)
			var339, var437 = protoModule.writeString(var339, var340, v)
			local var341 = var339
			local var342 = var340
			local var343, var344 = protoModule.writeTag(buff, var323, 5, protoModule.wireTypes.lengthDelimited)
			var343, var441 = protoModule.writeBuffer(var343, var344, var341, var342)
			buff = var343
			var323 = var344
		end
	end
	local buff_1 = buffer.create(var323)
	buffer.copy(buff_1, 0, buff, 0, var323)
	
	return buff_1
end

function t_10.decode(p10)
	-- upvalues: t_10 (ref), protoModule (ref), pageEntryContentModule (ref), hydrationContentModule (ref), t (ref), templateEntryModule (ref)
	local var345 = t_10.new()
	local var346 = 0
	while var346 < buffer.len(p10) do
		local _ = nil
		local var347 = nil
		local var348, var349, var350 = protoModule.readTag(p10, var346)
		local var351 = var348
		var347 = var349
		var346 = var350
		
		if var347 == protoModule.wireTypes.varint then
			local _ = nil
			local var352, var353 = protoModule.readVarInt(p10, var346)
			local _ = var352
			var346 = var353
			continue
		end
		if var347 == protoModule.wireTypes.lengthDelimited then
			if var351 == 1 then
				local _ = nil
				local var354, var355 = protoModule.readBuffer(p10, var346)
				var346 = var355
				table.insert(var345.page_entries, pageEntryContentModule.UniversalPageEntry.decode(var354))
			elseif var351 == 2 then
				local _ = nil
				local var356, var357 = protoModule.readBuffer(p10, var346)
				var346 = var357
				var345.hydration_data = hydrationContentModule.HydrationContent.decode(var356)
			elseif var351 == 3 then
				local _ = nil
				local var358, var359 = protoModule.readBuffer(p10, var346)
				var346 = var359
				var358 = t.GetChartsSortDetailResponse_TemplatesEntry.decode(var358)
				var345.templates[var358.key or ""] = var358.value or templateEntryModule.TemplateEntry.new()
			elseif var351 == 4 then
				local _ = nil
				local var360, var361 = protoModule.readBuffer(p10, var346)
				var346 = var361
				var345.next_content_page_token = buffer.tostring(var360)
			elseif var351 == 5 then
				local _ = nil
				local var362, var363 = protoModule.readBuffer(p10, var346)
				var346 = var363
				var362 = t.GetChartsSortDetailResponse_LocalizedLiteralsEntry.decode(var362)
				var345.localized_literals[var362.key or ""] = var362.value or ""
			else
				local _ = nil
				local var364, var365 = protoModule.readVarInt(p10, var346)
				var346 = var365 + var364
			end
		elseif var347 == protoModule.wireTypes.i32 then
			local _ = nil
			local var366, var367 = protoModule.readFixed32(p10, var346)
			local _ = var366
			var346 = var367
		elseif var347 == protoModule.wireTypes.i64 then
			local _ = nil
			local var368, var369 = protoModule.readFixed64(p10, var346)
			local _ = var368
			var346 = var369
		else
			error("Unsupported wire type: " .. var445)
		end
	end
	return var345
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
	local var370 = t_10.new()
	
	if self.page_entries ~= nil then
		local t = {}
		
		for i, v in self.page_entries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var370.page_entries = t
	end
	if self.pageEntries ~= nil then
		local t = {}
		
		for i, v in self.pageEntries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var370.page_entries = t
	end
	if self.hydration_data ~= nil then
		var370.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		var370.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	if self.templates ~= nil then
		local t = {}
		
		for i, v in self.templates do
			t[i] = templateEntryModule.TemplateEntry.jsonDecode(v)
		end
		var370.templates = t
	end
	if self.next_content_page_token ~= nil then
		var370.next_content_page_token = self.next_content_page_token
	end
	if self.nextContentPageToken ~= nil then
		var370.next_content_page_token = self.nextContentPageToken
	end
	if self.localized_literals ~= nil then
		local t = {}
		
		for i, v in self.localized_literals do
			t[i] = v
		end
		var370.localized_literals = t
	end
	if self.localizedLiterals ~= nil then
		local t = {}
		
		for i, v in self.localizedLiterals do
			t[i] = v
		end
		var370.localized_literals = t
	end
	return var370
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
	local var371 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var372, var373 = protoModule.writeTag(buff, var371, 1, protoModule.wireTypes.lengthDelimited)
		var372, var481 = protoModule.writeString(var372, var373, self.key)
		buff = var372
		var371 = var373
	end
	if self.value ~= nil then
		local var374 = self.value:encode()
		local var375, var376 = protoModule.writeTag(buff, var371, 2, protoModule.wireTypes.lengthDelimited)
		var375, var484 = protoModule.writeBuffer(var375, var376, var374, buffer.len(var374))
		buff = var375
		var371 = var376
	end
	local buff_1 = buffer.create(var371)
	buffer.copy(buff_1, 0, buff, 0, var371)
	
	return buff_1
end

function t_11.decode(p11)
	-- upvalues: t_11 (ref), protoModule (ref), templateEntryModule (ref)
	local var371 = t_11.new()
	local var372 = 0
	while var372 < buffer.len(p11) do
		local _ = nil
		local var373 = nil
		local var374, var375, var376 = protoModule.readTag(p11, var372)
		local var377 = var374
		var373 = var375
		var372 = var376
		
		if var373 == protoModule.wireTypes.varint then
			local _ = nil
			local var378, var379 = protoModule.readVarInt(p11, var372)
			local _ = var378
			var372 = var379
			continue
		end
		if var373 == protoModule.wireTypes.lengthDelimited then
			if var377 == 1 then
				local _ = nil
				local var380, var381 = protoModule.readBuffer(p11, var372)
				var372 = var381
				var371.key = buffer.tostring(var380)
			elseif var377 == 2 then
				local _ = nil
				local var382, var383 = protoModule.readBuffer(p11, var372)
				var372 = var383
				var371.value = templateEntryModule.TemplateEntry.decode(var382)
			else
				local _ = nil
				local var384, var385 = protoModule.readVarInt(p11, var372)
				var372 = var385 + var384
			end
		elseif var373 == protoModule.wireTypes.i32 then
			local _ = nil
			local var386, var387 = protoModule.readFixed32(p11, var372)
			local _ = var386
			var372 = var387
		elseif var373 == protoModule.wireTypes.i64 then
			local _ = nil
			local var388, var389 = protoModule.readFixed64(p11, var372)
			local _ = var388
			var372 = var389
		else
			error("Unsupported wire type: " .. var488)
		end
	end
	return var371
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
	local var390 = t_11.new()
	
	if self.key ~= nil then
		var390.key = self.key
	end
	if self.value ~= nil then
		var390.value = templateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return var390
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
	local var390 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var391, var392 = protoModule.writeTag(buff, var390, 1, protoModule.wireTypes.lengthDelimited)
		var391, var510 = protoModule.writeString(var391, var392, self.key)
		buff = var391
		var390 = var392
	end
	if self.value ~= nil and self.value ~= "" then
		local var393, var394 = protoModule.writeTag(buff, var390, 2, protoModule.wireTypes.lengthDelimited)
		var393, var512 = protoModule.writeString(var393, var394, self.value)
		buff = var393
		var390 = var394
	end
	local buff_1 = buffer.create(var390)
	buffer.copy(buff_1, 0, buff, 0, var390)
	
	return buff_1
end

function t_12.decode(p12)
	-- upvalues: t_12 (ref), protoModule (ref)
	local var390 = t_12.new()
	local var391 = 0
	while var391 < buffer.len(p12) do
		local _ = nil
		local var392 = nil
		local var393, var394, var395 = protoModule.readTag(p12, var391)
		local var396 = var393
		var392 = var394
		var391 = var395
		
		if var392 == protoModule.wireTypes.varint then
			local _ = nil
			local var397, var398 = protoModule.readVarInt(p12, var391)
			local _ = var397
			var391 = var398
			continue
		end
		if var392 == protoModule.wireTypes.lengthDelimited then
			if var396 == 1 then
				local _ = nil
				local var399, var400 = protoModule.readBuffer(p12, var391)
				var391 = var400
				var390.key = buffer.tostring(var399)
			elseif var396 == 2 then
				local _ = nil
				local var401, var402 = protoModule.readBuffer(p12, var391)
				var391 = var402
				var390.value = buffer.tostring(var401)
			else
				local _ = nil
				local var403, var404 = protoModule.readVarInt(p12, var391)
				var391 = var404 + var403
			end
		elseif var392 == protoModule.wireTypes.i32 then
			local _ = nil
			local var405, var406 = protoModule.readFixed32(p12, var391)
			local _ = var405
			var391 = var406
		elseif var392 == protoModule.wireTypes.i64 then
			local _ = nil
			local var407, var408 = protoModule.readFixed64(p12, var391)
			local _ = var407
			var391 = var408
		else
			error("Unsupported wire type: " .. var516)
		end
	end
	return var390
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
	local var409 = t_12.new()
	
	if self.key ~= nil then
		var409.key = self.key
	end
	if self.value ~= nil then
		var409.value = self.value
	end
	return var409
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