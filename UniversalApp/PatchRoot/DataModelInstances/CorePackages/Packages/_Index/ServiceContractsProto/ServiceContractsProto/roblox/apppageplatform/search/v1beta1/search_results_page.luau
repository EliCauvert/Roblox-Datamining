local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local clientCapabilitiesModule = require(script.Parent.Parent.Parent.shared.v1beta1.client_capabilities)
local hydrationContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.hydration_content)
local templateEntryModule = require(script.Parent.Parent.Parent.shared.v1beta1.template_entry)
local pageEntryContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.page_entry_content)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t (ref), t_1 (ref)
	return setmetatable({
		search_query = if p1 == nil or p1.search_query == nil then "" else p1.search_query,
		session_id = if p1 == nil or p1.session_id == nil then "" else p1.session_id,
		vertical_type = if p1 == nil or p1.vertical_type == nil then assert(t.SearchResultsPageVerticalType.fromNumber(0), "Enum has no 0 default") else p1.vertical_type,
		global_session_id = if p1 == nil or p1.global_session_id == nil then "" else p1.global_session_id,
		client_capabilities = if p1 == nil or p1.client_capabilities == nil then nil else p1.client_capabilities
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.search_query ~= nil and self.search_query ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var14 = protoModule.writeString(var2, var3, self.search_query)
		buff = var2
		var1 = var3
	end
	if self.session_id ~= nil and self.session_id ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var16 = protoModule.writeString(var4, var5, self.session_id)
		buff = var4
		var1 = var5
	end
	if self.vertical_type ~= nil and (self.vertical_type ~= nil and self.vertical_type ~= 0 or self.vertical_type ~= t.SearchResultsPageVerticalType.fromNumber(0)) then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.varint)
		var6, var18 = protoModule.writeVarInt(var6, var7, t.SearchResultsPageVerticalType.toNumber(self.vertical_type))
		buff = var6
		var1 = var7
	end
	if self.global_session_id ~= nil and self.global_session_id ~= "" then
		local var8, var9 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var8, var20 = protoModule.writeString(var8, var9, self.global_session_id)
		buff = var8
		var1 = var9
	end
	if self.client_capabilities ~= nil then
		local var10 = self.client_capabilities:encode()
		local var11, var12 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
		var11, var23 = protoModule.writeBuffer(var11, var12, var10, buffer.len(var10))
		buff = var11
		var1 = var12
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref), t (ref), clientCapabilitiesModule (ref)
	local var1 = t_1.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 3 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.vertical_type = t.SearchResultsPageVerticalType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.search_query = buffer.tostring(var13)
			elseif var7 == 2 then
				local _ = nil
				local var15, var16 = protoModule.readBuffer(p1, var2)
				var2 = var16
				var1.session_id = buffer.tostring(var15)
			elseif var7 == 4 then
				local _ = nil
				local var17, var18 = protoModule.readBuffer(p1, var2)
				var2 = var18
				var1.global_session_id = buffer.tostring(var17)
			elseif var7 == 5 then
				local _ = nil
				local var19, var20 = protoModule.readBuffer(p1, var2)
				var2 = var20
				var1.client_capabilities = clientCapabilitiesModule.ClientCapabilities.decode(var19)
			else
				local _ = nil
				local var21, var22 = protoModule.readVarInt(p1, var2)
				var2 = var22 + var21
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var23, var24 = protoModule.readFixed32(p1, var2)
			local _ = var23
			var2 = var24
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var25, var26 = protoModule.readFixed64(p1, var2)
			local _ = var25
			var2 = var26
		else
			error("Unsupported wire type: " .. var27)
		end
	end
	return var1
end

function t_1:jsonEncode()
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.search_query ~= nil and self.search_query ~= "" then
		t_1.searchQuery = self.search_query
	end
	if self.session_id ~= nil and self.session_id ~= "" then
		t_1.sessionId = self.session_id
	end
	if self.vertical_type ~= nil and (self.vertical_type ~= nil and self.vertical_type ~= 0 or self.vertical_type ~= t.SearchResultsPageVerticalType.fromNumber(0)) then
		t_1.verticalType = if typeof(self.vertical_type) == "number" then self.vertical_type else t.SearchResultsPageVerticalType.toNumber(self.vertical_type)
	end
	if self.global_session_id ~= nil and self.global_session_id ~= "" then
		t_1.globalSessionId = self.global_session_id
	end
	if self.client_capabilities ~= nil then
		t_1.clientCapabilities = self.client_capabilities:jsonEncode()
	end
	return t_1
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref), t (ref), clientCapabilitiesModule (ref)
	local var27 = t_1.new()
	
	if self.search_query ~= nil then
		var27.search_query = self.search_query
	end
	if self.searchQuery ~= nil then
		var27.search_query = self.searchQuery
	end
	if self.session_id ~= nil then
		var27.session_id = self.session_id
	end
	if self.sessionId ~= nil then
		var27.session_id = self.sessionId
	end
	if self.vertical_type ~= nil then
		var27.vertical_type = if typeof(self.vertical_type) == "number" then t.SearchResultsPageVerticalType.fromNumber(self.vertical_type) or self.vertical_type else t.SearchResultsPageVerticalType.fromName(self.vertical_type) or self.vertical_type
	end
	if self.verticalType ~= nil then
		var27.vertical_type = if typeof(self.verticalType) == "number" then t.SearchResultsPageVerticalType.fromNumber(self.verticalType) or self.verticalType else t.SearchResultsPageVerticalType.fromName(self.verticalType) or self.verticalType
	end
	if self.global_session_id ~= nil then
		var27.global_session_id = self.global_session_id
	end
	if self.globalSessionId ~= nil then
		var27.global_session_id = self.globalSessionId
	end
	if self.client_capabilities ~= nil then
		var27.client_capabilities = clientCapabilitiesModule.ClientCapabilities.jsonDecode(self.client_capabilities)
	end
	if self.clientCapabilities ~= nil then
		var27.client_capabilities = clientCapabilitiesModule.ClientCapabilities.jsonDecode(self.clientCapabilities)
	end
	return var27
end

t_1.descriptor = {
	name = "GetSearchResultsPageRequest",
	fullName = "roblox.apppageplatform.search.v1beta1.GetSearchResultsPageRequest"
}
t.GetSearchResultsPageRequest = t_1
typeRegistryModule.default:register(t.GetSearchResultsPageRequest)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2)
	-- upvalues: t_2 (ref)
	return setmetatable({
		page_entries = if p2 == nil or p2.page_entries == nil then {} else p2.page_entries,
		hydration_data = if p2 == nil or p2.hydration_data == nil then nil else p2.hydration_data,
		templates = if p2 == nil or p2.templates == nil then {} else p2.templates,
		localized_literals = if p2 == nil or p2.localized_literals == nil then {} else p2.localized_literals
	}, t_2)
end

function t_2:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var27 = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for i, v in self.page_entries do
			local var28 = v:encode()
			local var29, var30 = protoModule.writeTag(buff, var27, 1, protoModule.wireTypes.lengthDelimited)
			var29, var57 = protoModule.writeBuffer(var29, var30, var28, buffer.len(var28))
			buff = var29
			var27 = var30
		end
	end
	if self.hydration_data ~= nil then
		local var31 = self.hydration_data:encode()
		local var32, var33 = protoModule.writeTag(buff, var27, 2, protoModule.wireTypes.lengthDelimited)
		var32, var60 = protoModule.writeBuffer(var32, var33, var31, buffer.len(var31))
		buff = var32
		var27 = var33
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, v in self.templates do
			local var34, var35 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var34, var62 = protoModule.writeString(var34, var35, i)
			local var36 = v:encode()
			var35, var64 = protoModule.writeTag(var34, var35, 2, protoModule.wireTypes.lengthDelimited)
			var35, var64 = protoModule.writeBuffer(var35, var64, var36, buffer.len(var36))
			local var37 = var35
			local var38 = var64
			local var39, var40 = protoModule.writeTag(buff, var27, 3, protoModule.wireTypes.lengthDelimited)
			var39, var68 = protoModule.writeBuffer(var39, var40, var37, var38)
			buff = var39
			var27 = var40
		end
	end
	if self.localized_literals ~= nil and next(self.localized_literals) ~= nil then
		for i, v in self.localized_literals do
			local var41, var42 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var41, var70 = protoModule.writeString(var41, var42, i)
			var41, var70 = protoModule.writeTag(var41, var42, 2, protoModule.wireTypes.lengthDelimited)
			var41, var70 = protoModule.writeString(var41, var42, v)
			local var43 = var41
			local var44 = var42
			local var45, var46 = protoModule.writeTag(buff, var27, 4, protoModule.wireTypes.lengthDelimited)
			var45, var74 = protoModule.writeBuffer(var45, var46, var43, var44)
			buff = var45
			var27 = var46
		end
	end
	local buff_1 = buffer.create(var27)
	buffer.copy(buff_1, 0, buff, 0, var27)
	
	return buff_1
end

function t_2.decode(p2)
	-- upvalues: t_2 (ref), protoModule (ref), pageEntryContentModule (ref), hydrationContentModule (ref), t (ref), templateEntryModule (ref)
	local var47 = t_2.new()
	local var48 = 0
	while var48 < buffer.len(p2) do
		local _ = nil
		local var49 = nil
		local var50, var51, var52 = protoModule.readTag(p2, var48)
		local var53 = var50
		var49 = var51
		var48 = var52
		
		if var49 == protoModule.wireTypes.varint then
			local _ = nil
			local var54, var55 = protoModule.readVarInt(p2, var48)
			local _ = var54
			var48 = var55
			continue
		end
		if var49 == protoModule.wireTypes.lengthDelimited then
			if var53 == 1 then
				local _ = nil
				local var56, var57 = protoModule.readBuffer(p2, var48)
				var48 = var57
				table.insert(var47.page_entries, pageEntryContentModule.UniversalPageEntry.decode(var56))
			elseif var53 == 2 then
				local _ = nil
				local var58, var59 = protoModule.readBuffer(p2, var48)
				var48 = var59
				var47.hydration_data = hydrationContentModule.HydrationContent.decode(var58)
			elseif var53 == 3 then
				local _ = nil
				local var60, var61 = protoModule.readBuffer(p2, var48)
				var48 = var61
				var60 = t.GetSearchResultsPageResponse_TemplatesEntry.decode(var60)
				var47.templates[var60.key or ""] = var60.value or templateEntryModule.TemplateEntry.new()
			elseif var53 == 4 then
				local _ = nil
				local var62, var63 = protoModule.readBuffer(p2, var48)
				var48 = var63
				var62 = t.GetSearchResultsPageResponse_LocalizedLiteralsEntry.decode(var62)
				var47.localized_literals[var62.key or ""] = var62.value or ""
			else
				local _ = nil
				local var64, var65 = protoModule.readVarInt(p2, var48)
				var48 = var65 + var64
			end
		elseif var49 == protoModule.wireTypes.i32 then
			local _ = nil
			local var66, var67 = protoModule.readFixed32(p2, var48)
			local _ = var66
			var48 = var67
		elseif var49 == protoModule.wireTypes.i64 then
			local _ = nil
			local var68, var69 = protoModule.readFixed64(p2, var48)
			local _ = var68
			var48 = var69
		else
			error("Unsupported wire type: " .. var78)
		end
	end
	return var47
end

function t_2:jsonEncode()
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

function t_2:jsonDecode()
	-- upvalues: t_2 (ref), pageEntryContentModule (ref), hydrationContentModule (ref), templateEntryModule (ref)
	local var70 = t_2.new()
	
	if self.page_entries ~= nil then
		local t = {}
		
		for i, v in self.page_entries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var70.page_entries = t
	end
	if self.pageEntries ~= nil then
		local t = {}
		
		for i, v in self.pageEntries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var70.page_entries = t
	end
	if self.hydration_data ~= nil then
		var70.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		var70.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	if self.templates ~= nil then
		local t = {}
		
		for i, v in self.templates do
			t[i] = templateEntryModule.TemplateEntry.jsonDecode(v)
		end
		var70.templates = t
	end
	if self.localized_literals ~= nil then
		local t = {}
		
		for i, v in self.localized_literals do
			t[i] = v
		end
		var70.localized_literals = t
	end
	if self.localizedLiterals ~= nil then
		local t = {}
		
		for i, v in self.localizedLiterals do
			t[i] = v
		end
		var70.localized_literals = t
	end
	return var70
end

t_2.descriptor = {
	name = "GetSearchResultsPageResponse",
	fullName = "roblox.apppageplatform.search.v1beta1.GetSearchResultsPageResponse"
}
t.GetSearchResultsPageResponse = t_2
typeRegistryModule.default:register(t.GetSearchResultsPageResponse)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p3)
	-- upvalues: t_3 (ref)
	return setmetatable({
		key = if p3 == nil or p3.key == nil then "" else p3.key,
		value = if p3 == nil or p3.value == nil then nil else p3.value
	}, t_3)
end

function t_3:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var71 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var72, var73 = protoModule.writeTag(buff, var71, 1, protoModule.wireTypes.lengthDelimited)
		var72, var112 = protoModule.writeString(var72, var73, self.key)
		buff = var72
		var71 = var73
	end
	if self.value ~= nil then
		local var74 = self.value:encode()
		local var75, var76 = protoModule.writeTag(buff, var71, 2, protoModule.wireTypes.lengthDelimited)
		var75, var115 = protoModule.writeBuffer(var75, var76, var74, buffer.len(var74))
		buff = var75
		var71 = var76
	end
	local buff_1 = buffer.create(var71)
	buffer.copy(buff_1, 0, buff, 0, var71)
	
	return buff_1
end

function t_3.decode(p3)
	-- upvalues: t_3 (ref), protoModule (ref), templateEntryModule (ref)
	local var71 = t_3.new()
	local var72 = 0
	while var72 < buffer.len(p3) do
		local _ = nil
		local var73 = nil
		local var74, var75, var76 = protoModule.readTag(p3, var72)
		local var77 = var74
		var73 = var75
		var72 = var76
		
		if var73 == protoModule.wireTypes.varint then
			local _ = nil
			local var78, var79 = protoModule.readVarInt(p3, var72)
			local _ = var78
			var72 = var79
			continue
		end
		if var73 == protoModule.wireTypes.lengthDelimited then
			if var77 == 1 then
				local _ = nil
				local var80, var81 = protoModule.readBuffer(p3, var72)
				var72 = var81
				var71.key = buffer.tostring(var80)
			elseif var77 == 2 then
				local _ = nil
				local var82, var83 = protoModule.readBuffer(p3, var72)
				var72 = var83
				var71.value = templateEntryModule.TemplateEntry.decode(var82)
			else
				local _ = nil
				local var84, var85 = protoModule.readVarInt(p3, var72)
				var72 = var85 + var84
			end
		elseif var73 == protoModule.wireTypes.i32 then
			local _ = nil
			local var86, var87 = protoModule.readFixed32(p3, var72)
			local _ = var86
			var72 = var87
		elseif var73 == protoModule.wireTypes.i64 then
			local _ = nil
			local var88, var89 = protoModule.readFixed64(p3, var72)
			local _ = var88
			var72 = var89
		else
			error("Unsupported wire type: " .. var119)
		end
	end
	return var71
end

function t_3:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_3:jsonDecode()
	-- upvalues: t_3 (ref), templateEntryModule (ref)
	local var90 = t_3.new()
	
	if self.key ~= nil then
		var90.key = self.key
	end
	if self.value ~= nil then
		var90.value = templateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return var90
end

t_3.descriptor = {
	name = "GetSearchResultsPageResponse_TemplatesEntry",
	fullName = "roblox.apppageplatform.search.v1beta1.TemplatesEntry"
}
t.GetSearchResultsPageResponse_TemplatesEntry = t_3
typeRegistryModule.default:register(t.GetSearchResultsPageResponse_TemplatesEntry)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p4)
	-- upvalues: t_4 (ref)
	return setmetatable({
		key = if p4 == nil or p4.key == nil then "" else p4.key,
		value = if p4 == nil or p4.value == nil then "" else p4.value
	}, t_4)
end

function t_4:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var90 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var91, var92 = protoModule.writeTag(buff, var90, 1, protoModule.wireTypes.lengthDelimited)
		var91, var141 = protoModule.writeString(var91, var92, self.key)
		buff = var91
		var90 = var92
	end
	if self.value ~= nil and self.value ~= "" then
		local var93, var94 = protoModule.writeTag(buff, var90, 2, protoModule.wireTypes.lengthDelimited)
		var93, var143 = protoModule.writeString(var93, var94, self.value)
		buff = var93
		var90 = var94
	end
	local buff_1 = buffer.create(var90)
	buffer.copy(buff_1, 0, buff, 0, var90)
	
	return buff_1
end

function t_4.decode(p4)
	-- upvalues: t_4 (ref), protoModule (ref)
	local var90 = t_4.new()
	local var91 = 0
	while var91 < buffer.len(p4) do
		local _ = nil
		local var92 = nil
		local var93, var94, var95 = protoModule.readTag(p4, var91)
		local var96 = var93
		var92 = var94
		var91 = var95
		
		if var92 == protoModule.wireTypes.varint then
			local _ = nil
			local var97, var98 = protoModule.readVarInt(p4, var91)
			local _ = var97
			var91 = var98
			continue
		end
		if var92 == protoModule.wireTypes.lengthDelimited then
			if var96 == 1 then
				local _ = nil
				local var99, var100 = protoModule.readBuffer(p4, var91)
				var91 = var100
				var90.key = buffer.tostring(var99)
			elseif var96 == 2 then
				local _ = nil
				local var101, var102 = protoModule.readBuffer(p4, var91)
				var91 = var102
				var90.value = buffer.tostring(var101)
			else
				local _ = nil
				local var103, var104 = protoModule.readVarInt(p4, var91)
				var91 = var104 + var103
			end
		elseif var92 == protoModule.wireTypes.i32 then
			local _ = nil
			local var105, var106 = protoModule.readFixed32(p4, var91)
			local _ = var105
			var91 = var106
		elseif var92 == protoModule.wireTypes.i64 then
			local _ = nil
			local var107, var108 = protoModule.readFixed64(p4, var91)
			local _ = var107
			var91 = var108
		else
			error("Unsupported wire type: " .. var147)
		end
	end
	return var90
end

function t_4:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function t_4:jsonDecode()
	-- upvalues: t_4 (ref)
	local var109 = t_4.new()
	
	if self.key ~= nil then
		var109.key = self.key
	end
	if self.value ~= nil then
		var109.value = self.value
	end
	return var109
end

t_4.descriptor = {
	name = "GetSearchResultsPageResponse_LocalizedLiteralsEntry",
	fullName = "roblox.apppageplatform.search.v1beta1.LocalizedLiteralsEntry"
}
t.GetSearchResultsPageResponse_LocalizedLiteralsEntry = t_4
typeRegistryModule.default:register(t.GetSearchResultsPageResponse_LocalizedLiteralsEntry)
t.SearchResultsPageVerticalType = {
	fromNumber = function(p5)
		return if p5 == 0 then "SEARCH_RESULTS_PAGE_VERTICAL_TYPE_INVALID" elseif p5 == 1 then "SEARCH_RESULTS_PAGE_VERTICAL_TYPE_BLENDED" elseif p5 == 2 then "SEARCH_RESULTS_PAGE_VERTICAL_TYPE_GAME" elseif p5 == 3 then "SEARCH_RESULTS_PAGE_VERTICAL_TYPE_USER" else nil
	end,
	toNumber = function(p5)
		return if p5 == "SEARCH_RESULTS_PAGE_VERTICAL_TYPE_INVALID" then 0 elseif p5 == "SEARCH_RESULTS_PAGE_VERTICAL_TYPE_BLENDED" then 1 elseif p5 == "SEARCH_RESULTS_PAGE_VERTICAL_TYPE_GAME" then 2 elseif p5 == "SEARCH_RESULTS_PAGE_VERTICAL_TYPE_USER" then 3 else p5
	end,
	fromName = function(p5)
		return if p5 == "SEARCH_RESULTS_PAGE_VERTICAL_TYPE_INVALID" then "SEARCH_RESULTS_PAGE_VERTICAL_TYPE_INVALID" elseif p5 == "SEARCH_RESULTS_PAGE_VERTICAL_TYPE_BLENDED" then "SEARCH_RESULTS_PAGE_VERTICAL_TYPE_BLENDED" elseif p5 == "SEARCH_RESULTS_PAGE_VERTICAL_TYPE_GAME" then "SEARCH_RESULTS_PAGE_VERTICAL_TYPE_GAME" elseif p5 == "SEARCH_RESULTS_PAGE_VERTICAL_TYPE_USER" then "SEARCH_RESULTS_PAGE_VERTICAL_TYPE_USER" else nil
	end
}

return {
	GetSearchResultsPageRequest = t.GetSearchResultsPageRequest,
	GetSearchResultsPageResponse = t.GetSearchResultsPageResponse,
	SearchResultsPageVerticalType = t.SearchResultsPageVerticalType
}