local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
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
		global_session_id = if p1 == nil or p1.global_session_id == nil then "" else p1.global_session_id
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.search_query ~= nil and self.search_query ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var13 = protoModule.writeString(var2, var3, self.search_query)
		buff = var2
		var1 = var3
	end
	if self.session_id ~= nil and self.session_id ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var15 = protoModule.writeString(var4, var5, self.session_id)
		buff = var4
		var1 = var5
	end
	if self.vertical_type ~= nil and (self.vertical_type ~= nil and self.vertical_type ~= 0 or self.vertical_type ~= t.SearchResultsPageVerticalType.fromNumber(0)) then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.varint)
		var6, var17 = protoModule.writeVarInt(var6, var7, t.SearchResultsPageVerticalType.toNumber(self.vertical_type))
		buff = var6
		var1 = var7
	end
	if self.global_session_id ~= nil and self.global_session_id ~= "" then
		local var8, var9 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var8, var19 = protoModule.writeString(var8, var9, self.global_session_id)
		buff = var8
		var1 = var9
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref), t (ref)
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
			else
				local _ = nil
				local var19, var20 = protoModule.readVarInt(p1, var2)
				var2 = var20 + var19
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var21, var22 = protoModule.readFixed32(p1, var2)
			local _ = var21
			var2 = var22
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var23, var24 = protoModule.readFixed64(p1, var2)
			local _ = var23
			var2 = var24
		else
			error("Unsupported wire type: " .. var23)
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
	return t_1
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref), t (ref)
	local var25 = t_1.new()
	
	if self.search_query ~= nil then
		var25.search_query = self.search_query
	end
	if self.searchQuery ~= nil then
		var25.search_query = self.searchQuery
	end
	if self.session_id ~= nil then
		var25.session_id = self.session_id
	end
	if self.sessionId ~= nil then
		var25.session_id = self.sessionId
	end
	if self.vertical_type ~= nil then
		var25.vertical_type = if typeof(self.vertical_type) == "number" then t.SearchResultsPageVerticalType.fromNumber(self.vertical_type) or self.vertical_type else t.SearchResultsPageVerticalType.fromName(self.vertical_type) or self.vertical_type
	end
	if self.verticalType ~= nil then
		var25.vertical_type = if typeof(self.verticalType) == "number" then t.SearchResultsPageVerticalType.fromNumber(self.verticalType) or self.verticalType else t.SearchResultsPageVerticalType.fromName(self.verticalType) or self.verticalType
	end
	if self.global_session_id ~= nil then
		var25.global_session_id = self.global_session_id
	end
	if self.globalSessionId ~= nil then
		var25.global_session_id = self.globalSessionId
	end
	return var25
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
	local var25 = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for i, v in self.page_entries do
			local var26 = v:encode()
			local var27, var28 = protoModule.writeTag(buff, var25, 1, protoModule.wireTypes.lengthDelimited)
			var27, var51 = protoModule.writeBuffer(var27, var28, var26, buffer.len(var26))
			buff = var27
			var25 = var28
		end
	end
	if self.hydration_data ~= nil then
		local var29 = self.hydration_data:encode()
		local var30, var31 = protoModule.writeTag(buff, var25, 2, protoModule.wireTypes.lengthDelimited)
		var30, var54 = protoModule.writeBuffer(var30, var31, var29, buffer.len(var29))
		buff = var30
		var25 = var31
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, v in self.templates do
			local var32, var33 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var32, var56 = protoModule.writeString(var32, var33, i)
			local var34 = v:encode()
			var33, var58 = protoModule.writeTag(var32, var33, 2, protoModule.wireTypes.lengthDelimited)
			var33, var58 = protoModule.writeBuffer(var33, var58, var34, buffer.len(var34))
			local var35 = var33
			local var36 = var58
			local var37, var38 = protoModule.writeTag(buff, var25, 3, protoModule.wireTypes.lengthDelimited)
			var37, var62 = protoModule.writeBuffer(var37, var38, var35, var36)
			buff = var37
			var25 = var38
		end
	end
	if self.localized_literals ~= nil and next(self.localized_literals) ~= nil then
		for i, v in self.localized_literals do
			local var39, var40 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var39, var64 = protoModule.writeString(var39, var40, i)
			var39, var64 = protoModule.writeTag(var39, var40, 2, protoModule.wireTypes.lengthDelimited)
			var39, var64 = protoModule.writeString(var39, var40, v)
			local var41 = var39
			local var42 = var40
			local var43, var44 = protoModule.writeTag(buff, var25, 4, protoModule.wireTypes.lengthDelimited)
			var43, var68 = protoModule.writeBuffer(var43, var44, var41, var42)
			buff = var43
			var25 = var44
		end
	end
	local buff_1 = buffer.create(var25)
	buffer.copy(buff_1, 0, buff, 0, var25)
	
	return buff_1
end

function t_2.decode(p2)
	-- upvalues: t_2 (ref), protoModule (ref), pageEntryContentModule (ref), hydrationContentModule (ref), t (ref), templateEntryModule (ref)
	local var45 = t_2.new()
	local var46 = 0
	while var46 < buffer.len(p2) do
		local _ = nil
		local var47 = nil
		local var48, var49, var50 = protoModule.readTag(p2, var46)
		local var51 = var48
		var47 = var49
		var46 = var50
		
		if var47 == protoModule.wireTypes.varint then
			local _ = nil
			local var52, var53 = protoModule.readVarInt(p2, var46)
			local _ = var52
			var46 = var53
			continue
		end
		if var47 == protoModule.wireTypes.lengthDelimited then
			if var51 == 1 then
				local _ = nil
				local var54, var55 = protoModule.readBuffer(p2, var46)
				var46 = var55
				table.insert(var45.page_entries, pageEntryContentModule.UniversalPageEntry.decode(var54))
			elseif var51 == 2 then
				local _ = nil
				local var56, var57 = protoModule.readBuffer(p2, var46)
				var46 = var57
				var45.hydration_data = hydrationContentModule.HydrationContent.decode(var56)
			elseif var51 == 3 then
				local _ = nil
				local var58, var59 = protoModule.readBuffer(p2, var46)
				var46 = var59
				var58 = t.GetSearchResultsPageResponse_TemplatesEntry.decode(var58)
				var45.templates[var58.key or ""] = var58.value or templateEntryModule.TemplateEntry.new()
			elseif var51 == 4 then
				local _ = nil
				local var60, var61 = protoModule.readBuffer(p2, var46)
				var46 = var61
				var60 = t.GetSearchResultsPageResponse_LocalizedLiteralsEntry.decode(var60)
				var45.localized_literals[var60.key or ""] = var60.value or ""
			else
				local _ = nil
				local var62, var63 = protoModule.readVarInt(p2, var46)
				var46 = var63 + var62
			end
		elseif var47 == protoModule.wireTypes.i32 then
			local _ = nil
			local var64, var65 = protoModule.readFixed32(p2, var46)
			local _ = var64
			var46 = var65
		elseif var47 == protoModule.wireTypes.i64 then
			local _ = nil
			local var66, var67 = protoModule.readFixed64(p2, var46)
			local _ = var66
			var46 = var67
		else
			error("Unsupported wire type: " .. var72)
		end
	end
	return var45
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
	local var68 = t_2.new()
	
	if self.page_entries ~= nil then
		local t = {}
		
		for i, v in self.page_entries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var68.page_entries = t
	end
	if self.pageEntries ~= nil then
		local t = {}
		
		for i, v in self.pageEntries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var68.page_entries = t
	end
	if self.hydration_data ~= nil then
		var68.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		var68.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	if self.templates ~= nil then
		local t = {}
		
		for i, v in self.templates do
			t[i] = templateEntryModule.TemplateEntry.jsonDecode(v)
		end
		var68.templates = t
	end
	if self.localized_literals ~= nil then
		local t = {}
		
		for i, v in self.localized_literals do
			t[i] = v
		end
		var68.localized_literals = t
	end
	if self.localizedLiterals ~= nil then
		local t = {}
		
		for i, v in self.localizedLiterals do
			t[i] = v
		end
		var68.localized_literals = t
	end
	return var68
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
	local var69 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var70, var71 = protoModule.writeTag(buff, var69, 1, protoModule.wireTypes.lengthDelimited)
		var70, var106 = protoModule.writeString(var70, var71, self.key)
		buff = var70
		var69 = var71
	end
	if self.value ~= nil then
		local var72 = self.value:encode()
		local var73, var74 = protoModule.writeTag(buff, var69, 2, protoModule.wireTypes.lengthDelimited)
		var73, var109 = protoModule.writeBuffer(var73, var74, var72, buffer.len(var72))
		buff = var73
		var69 = var74
	end
	local buff_1 = buffer.create(var69)
	buffer.copy(buff_1, 0, buff, 0, var69)
	
	return buff_1
end

function t_3.decode(p3)
	-- upvalues: t_3 (ref), protoModule (ref), templateEntryModule (ref)
	local var69 = t_3.new()
	local var70 = 0
	while var70 < buffer.len(p3) do
		local _ = nil
		local var71 = nil
		local var72, var73, var74 = protoModule.readTag(p3, var70)
		local var75 = var72
		var71 = var73
		var70 = var74
		
		if var71 == protoModule.wireTypes.varint then
			local _ = nil
			local var76, var77 = protoModule.readVarInt(p3, var70)
			local _ = var76
			var70 = var77
			continue
		end
		if var71 == protoModule.wireTypes.lengthDelimited then
			if var75 == 1 then
				local _ = nil
				local var78, var79 = protoModule.readBuffer(p3, var70)
				var70 = var79
				var69.key = buffer.tostring(var78)
			elseif var75 == 2 then
				local _ = nil
				local var80, var81 = protoModule.readBuffer(p3, var70)
				var70 = var81
				var69.value = templateEntryModule.TemplateEntry.decode(var80)
			else
				local _ = nil
				local var82, var83 = protoModule.readVarInt(p3, var70)
				var70 = var83 + var82
			end
		elseif var71 == protoModule.wireTypes.i32 then
			local _ = nil
			local var84, var85 = protoModule.readFixed32(p3, var70)
			local _ = var84
			var70 = var85
		elseif var71 == protoModule.wireTypes.i64 then
			local _ = nil
			local var86, var87 = protoModule.readFixed64(p3, var70)
			local _ = var86
			var70 = var87
		else
			error("Unsupported wire type: " .. var113)
		end
	end
	return var69
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
	local var88 = t_3.new()
	
	if self.key ~= nil then
		var88.key = self.key
	end
	if self.value ~= nil then
		var88.value = templateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return var88
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
	local var88 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var89, var90 = protoModule.writeTag(buff, var88, 1, protoModule.wireTypes.lengthDelimited)
		var89, var135 = protoModule.writeString(var89, var90, self.key)
		buff = var89
		var88 = var90
	end
	if self.value ~= nil and self.value ~= "" then
		local var91, var92 = protoModule.writeTag(buff, var88, 2, protoModule.wireTypes.lengthDelimited)
		var91, var137 = protoModule.writeString(var91, var92, self.value)
		buff = var91
		var88 = var92
	end
	local buff_1 = buffer.create(var88)
	buffer.copy(buff_1, 0, buff, 0, var88)
	
	return buff_1
end

function t_4.decode(p4)
	-- upvalues: t_4 (ref), protoModule (ref)
	local var88 = t_4.new()
	local var89 = 0
	while var89 < buffer.len(p4) do
		local _ = nil
		local var90 = nil
		local var91, var92, var93 = protoModule.readTag(p4, var89)
		local var94 = var91
		var90 = var92
		var89 = var93
		
		if var90 == protoModule.wireTypes.varint then
			local _ = nil
			local var95, var96 = protoModule.readVarInt(p4, var89)
			local _ = var95
			var89 = var96
			continue
		end
		if var90 == protoModule.wireTypes.lengthDelimited then
			if var94 == 1 then
				local _ = nil
				local var97, var98 = protoModule.readBuffer(p4, var89)
				var89 = var98
				var88.key = buffer.tostring(var97)
			elseif var94 == 2 then
				local _ = nil
				local var99, var100 = protoModule.readBuffer(p4, var89)
				var89 = var100
				var88.value = buffer.tostring(var99)
			else
				local _ = nil
				local var101, var102 = protoModule.readVarInt(p4, var89)
				var89 = var102 + var101
			end
		elseif var90 == protoModule.wireTypes.i32 then
			local _ = nil
			local var103, var104 = protoModule.readFixed32(p4, var89)
			local _ = var103
			var89 = var104
		elseif var90 == protoModule.wireTypes.i64 then
			local _ = nil
			local var105, var106 = protoModule.readFixed64(p4, var89)
			local _ = var105
			var89 = var106
		else
			error("Unsupported wire type: " .. var141)
		end
	end
	return var88
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
	local var107 = t_4.new()
	
	if self.key ~= nil then
		var107.key = self.key
	end
	if self.value ~= nil then
		var107.value = self.value
	end
	return var107
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