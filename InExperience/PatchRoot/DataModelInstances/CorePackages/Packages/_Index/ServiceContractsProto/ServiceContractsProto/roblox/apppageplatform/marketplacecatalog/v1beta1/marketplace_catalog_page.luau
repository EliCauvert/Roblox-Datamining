local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local hydrationContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.hydration_content)
local templateEntryModule = require(script.Parent.Parent.Parent.shared.v1beta1.template_entry)
local pageEntryContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.page_entry_content)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
		request_id = if p1 == nil or p1.request_id == nil then "" else p1.request_id,
		context = if p1 == nil or p1.context == nil then "" else p1.context,
		screen_size = if p1 == nil or p1.screen_size == nil then "" else p1.screen_size,
		pagination = if p1 == nil or p1.pagination == nil then nil else p1.pagination
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.request_id ~= nil and self.request_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var15 = protoModule.writeString(var2, var3, self.request_id)
		buff = var2
		var1 = var3
	end
	if self.context ~= nil and self.context ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var17 = protoModule.writeString(var4, var5, self.context)
		buff = var4
		var1 = var5
	end
	if self.screen_size ~= nil and self.screen_size ~= "" then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var6, var19 = protoModule.writeString(var6, var7, self.screen_size)
		buff = var6
		var1 = var7
	end
	if self.pagination ~= nil then
		local var8 = self.pagination:encode()
		local var9, var10 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var9, var22 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
		buff = var9
		var1 = var10
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
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.request_id = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.context = buffer.tostring(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.screen_size = buffer.tostring(var14)
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.pagination = t.RequestPagination.decode(var16)
			else
				local _ = nil
				local var18, var19 = protoModule.readVarInt(p1, var2)
				var2 = var19 + var18
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var20, var21 = protoModule.readFixed32(p1, var2)
			local _ = var20
			var2 = var21
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var22, var23 = protoModule.readFixed64(p1, var2)
			local _ = var22
			var2 = var23
		else
			error("Unsupported wire type: " .. var26)
		end
	end
	return var1
end

function t_1:jsonEncode()
	local t = {}
	
	if self.request_id ~= nil and self.request_id ~= "" then
		t.requestId = self.request_id
	end
	if self.context ~= nil and self.context ~= "" then
		t.context = self.context
	end
	if self.screen_size ~= nil and self.screen_size ~= "" then
		t.screenSize = self.screen_size
	end
	if self.pagination ~= nil then
		t.pagination = self.pagination:jsonEncode()
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref), t (ref)
	local var24 = t_1.new()
	
	if self.request_id ~= nil then
		var24.request_id = self.request_id
	end
	if self.requestId ~= nil then
		var24.request_id = self.requestId
	end
	if self.context ~= nil then
		var24.context = self.context
	end
	if self.screen_size ~= nil then
		var24.screen_size = self.screen_size
	end
	if self.screenSize ~= nil then
		var24.screen_size = self.screenSize
	end
	if self.pagination ~= nil then
		var24.pagination = t.RequestPagination.jsonDecode(self.pagination)
	end
	return var24
end

t_1.descriptor = {
	name = "MarketplaceCatalogPageRequest",
	fullName = "roblox.apppageplatform.marketplacecatalog.v1beta1.MarketplaceCatalogPageRequest"
}
t.MarketplaceCatalogPageRequest = t_1
typeRegistryModule.default:register(t.MarketplaceCatalogPageRequest)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2)
	-- upvalues: t_2 (ref)
	return setmetatable({
		cursor = if p2 == nil or p2.cursor == nil then nil else p2.cursor,
		page_size = if p2 == nil or p2.page_size == nil then nil else p2.page_size,
		direction = if p2 == nil or p2.direction == nil then nil else p2.direction
	}, t_2)
end

function t_2:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var24 = 0
	
	if self.cursor ~= nil then
		local var25, var26 = protoModule.writeTag(buff, var24, 1, protoModule.wireTypes.lengthDelimited)
		var25, var52 = protoModule.writeString(var25, var26, self.cursor)
		buff = var25
		var24 = var26
	end
	if self.page_size ~= nil then
		local var27, var28 = protoModule.writeTag(buff, var24, 2, protoModule.wireTypes.varint)
		var27, var54 = protoModule.writeVarInt(var27, var28, self.page_size)
		buff = var27
		var24 = var28
	end
	if self.direction ~= nil then
		local var29, var30 = protoModule.writeTag(buff, var24, 3, protoModule.wireTypes.varint)
		var29, var56 = protoModule.writeVarInt(var29, var30, t.PaginationDirection.toNumber(self.direction))
		buff = var29
		var24 = var30
	end
	local buff_1 = buffer.create(var24)
	buffer.copy(buff_1, 0, buff, 0, var24)
	
	return buff_1
end

function t_2.decode(p2)
	-- upvalues: t_2 (ref), protoModule (ref), t (ref)
	local var24 = t_2.new()
	local var25 = 0
	while var25 < buffer.len(p2) do
		local _ = nil
		local var26 = nil
		local var27, var28, var29 = protoModule.readTag(p2, var25)
		local var30 = var27
		var26 = var28
		var25 = var29
		
		if var26 == protoModule.wireTypes.varint then
			if var30 == 2 then
				local _ = nil
				local var31, var32 = protoModule.readVarIntI32(p2, var25)
				var25 = var32
				var24.page_size = var31
			elseif var30 == 3 then
				local _ = nil
				local var33, var34 = protoModule.readVarIntI32(p2, var25)
				local var35 = var33
				var25 = var34
				var24.direction = t.PaginationDirection.fromNumber(var35) or var35
			else
				local _ = nil
				local var36, var37 = protoModule.readVarInt(p2, var25)
				local _ = var36
				var25 = var37
			end
		end
		if var26 == protoModule.wireTypes.lengthDelimited then
			if var30 == 1 then
				local _ = nil
				local var38, var39 = protoModule.readBuffer(p2, var25)
				var25 = var39
				var24.cursor = buffer.tostring(var38)
			else
				local _ = nil
				local var40, var41 = protoModule.readVarInt(p2, var25)
				var25 = var41 + var40
			end
		elseif var26 == protoModule.wireTypes.i32 then
			local _ = nil
			local var42, var43 = protoModule.readFixed32(p2, var25)
			local _ = var42
			var25 = var43
		elseif var26 == protoModule.wireTypes.i64 then
			local _ = nil
			local var44, var45 = protoModule.readFixed64(p2, var25)
			local _ = var44
			var25 = var45
		else
			error("Unsupported wire type: " .. var60)
		end
	end
	return var24
end

function t_2:jsonEncode()
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.cursor ~= nil then
		t_1.cursor = self.cursor
	end
	if self.page_size ~= nil then
		t_1.pageSize = self.page_size
	end
	if self.direction ~= nil then
		t_1.direction = if typeof(self.direction) == "number" then self.direction else t.PaginationDirection.toNumber(self.direction)
	end
	return t_1
end

function t_2:jsonDecode()
	-- upvalues: t_2 (ref), t (ref)
	local var46 = t_2.new()
	
	if self.cursor ~= nil then
		var46.cursor = self.cursor
	end
	if self.page_size ~= nil then
		var46.page_size = self.page_size
	end
	if self.pageSize ~= nil then
		var46.page_size = self.pageSize
	end
	if self.direction ~= nil then
		var46.direction = if typeof(self.direction) == "number" then t.PaginationDirection.fromNumber(self.direction) or self.direction else t.PaginationDirection.fromName(self.direction) or self.direction
	end
	return var46
end

t_2.descriptor = {
	name = "RequestPagination",
	fullName = "roblox.apppageplatform.marketplacecatalog.v1beta1.RequestPagination"
}
t.RequestPagination = t_2
typeRegistryModule.default:register(t.RequestPagination)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p3)
	-- upvalues: t_3 (ref)
	return setmetatable({
		page_entries = if p3 == nil or p3.page_entries == nil then {} else p3.page_entries,
		hydration_data = if p3 == nil or p3.hydration_data == nil then nil else p3.hydration_data,
		templates = if p3 == nil or p3.templates == nil then {} else p3.templates,
		localized_literals = if p3 == nil or p3.localized_literals == nil then {} else p3.localized_literals,
		pagination = if p3 == nil or p3.pagination == nil then nil else p3.pagination
	}, t_3)
end

function t_3:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var46 = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for i, v in self.page_entries do
			local var47 = v:encode()
			local var48, var49 = protoModule.writeTag(buff, var46, 1, protoModule.wireTypes.lengthDelimited)
			var48, var86 = protoModule.writeBuffer(var48, var49, var47, buffer.len(var47))
			buff = var48
			var46 = var49
		end
	end
	if self.hydration_data ~= nil then
		local var50 = self.hydration_data:encode()
		local var51, var52 = protoModule.writeTag(buff, var46, 2, protoModule.wireTypes.lengthDelimited)
		var51, var89 = protoModule.writeBuffer(var51, var52, var50, buffer.len(var50))
		buff = var51
		var46 = var52
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, v in self.templates do
			local var53, var54 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var53, var91 = protoModule.writeString(var53, var54, i)
			local var55 = v:encode()
			var54, var93 = protoModule.writeTag(var53, var54, 2, protoModule.wireTypes.lengthDelimited)
			var54, var93 = protoModule.writeBuffer(var54, var93, var55, buffer.len(var55))
			local var56 = var54
			local var57 = var93
			local var58, var59 = protoModule.writeTag(buff, var46, 3, protoModule.wireTypes.lengthDelimited)
			var58, var97 = protoModule.writeBuffer(var58, var59, var56, var57)
			buff = var58
			var46 = var59
		end
	end
	if self.localized_literals ~= nil and next(self.localized_literals) ~= nil then
		for i, v in self.localized_literals do
			local var60, var61 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var60, var99 = protoModule.writeString(var60, var61, i)
			var60, var99 = protoModule.writeTag(var60, var61, 2, protoModule.wireTypes.lengthDelimited)
			var60, var99 = protoModule.writeString(var60, var61, v)
			local var62 = var60
			local var63 = var61
			local var64, var65 = protoModule.writeTag(buff, var46, 4, protoModule.wireTypes.lengthDelimited)
			var64, var103 = protoModule.writeBuffer(var64, var65, var62, var63)
			buff = var64
			var46 = var65
		end
	end
	if self.pagination ~= nil then
		local var66 = self.pagination:encode()
		local var67, var68 = protoModule.writeTag(buff, var46, 5, protoModule.wireTypes.lengthDelimited)
		var67, var106 = protoModule.writeBuffer(var67, var68, var66, buffer.len(var66))
		buff = var67
		var46 = var68
	end
	local buff_1 = buffer.create(var46)
	buffer.copy(buff_1, 0, buff, 0, var46)
	
	return buff_1
end

function t_3.decode(p3)
	-- upvalues: t_3 (ref), protoModule (ref), pageEntryContentModule (ref), hydrationContentModule (ref), t (ref), templateEntryModule (ref)
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
				table.insert(var69.page_entries, pageEntryContentModule.UniversalPageEntry.decode(var78))
			elseif var75 == 2 then
				local _ = nil
				local var80, var81 = protoModule.readBuffer(p3, var70)
				var70 = var81
				var69.hydration_data = hydrationContentModule.HydrationContent.decode(var80)
			elseif var75 == 3 then
				local _ = nil
				local var82, var83 = protoModule.readBuffer(p3, var70)
				var70 = var83
				var82 = t.MarketplaceCatalogPageResponse_TemplatesEntry.decode(var82)
				var69.templates[var82.key or ""] = var82.value or templateEntryModule.TemplateEntry.new()
			elseif var75 == 4 then
				local _ = nil
				local var84, var85 = protoModule.readBuffer(p3, var70)
				var70 = var85
				var84 = t.MarketplaceCatalogPageResponse_LocalizedLiteralsEntry.decode(var84)
				var69.localized_literals[var84.key or ""] = var84.value or ""
			elseif var75 == 5 then
				local _ = nil
				local var86, var87 = protoModule.readBuffer(p3, var70)
				var70 = var87
				var69.pagination = t.Pagination.decode(var86)
			else
				local _ = nil
				local var88, var89 = protoModule.readVarInt(p3, var70)
				var70 = var89 + var88
			end
		elseif var71 == protoModule.wireTypes.i32 then
			local _ = nil
			local var90, var91 = protoModule.readFixed32(p3, var70)
			local _ = var90
			var70 = var91
		elseif var71 == protoModule.wireTypes.i64 then
			local _ = nil
			local var92, var93 = protoModule.readFixed64(p3, var70)
			local _ = var92
			var70 = var93
		else
			error("Unsupported wire type: " .. var110)
		end
	end
	return var69
end

function t_3:jsonEncode()
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
	if self.pagination ~= nil then
		t.pagination = self.pagination:jsonEncode()
	end
	return t
end

function t_3:jsonDecode()
	-- upvalues: t_3 (ref), pageEntryContentModule (ref), hydrationContentModule (ref), templateEntryModule (ref), t (ref)
	local var94 = t_3.new()
	
	if self.page_entries ~= nil then
		local t_1 = {}
		
		for i, v in self.page_entries do
			table.insert(t_1, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var94.page_entries = t_1
	end
	if self.pageEntries ~= nil then
		local t_1 = {}
		
		for i, v in self.pageEntries do
			table.insert(t_1, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var94.page_entries = t_1
	end
	if self.hydration_data ~= nil then
		var94.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		var94.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	if self.templates ~= nil then
		local t_1 = {}
		
		for i, v in self.templates do
			t_1[i] = templateEntryModule.TemplateEntry.jsonDecode(v)
		end
		var94.templates = t_1
	end
	if self.localized_literals ~= nil then
		local t_1 = {}
		
		for i, v in self.localized_literals do
			t_1[i] = v
		end
		var94.localized_literals = t_1
	end
	if self.localizedLiterals ~= nil then
		local t_1 = {}
		
		for i, v in self.localizedLiterals do
			t_1[i] = v
		end
		var94.localized_literals = t_1
	end
	if self.pagination ~= nil then
		var94.pagination = t.Pagination.jsonDecode(self.pagination)
	end
	return var94
end

t_3.descriptor = {
	name = "MarketplaceCatalogPageResponse",
	fullName = "roblox.apppageplatform.marketplacecatalog.v1beta1.MarketplaceCatalogPageResponse"
}
t.MarketplaceCatalogPageResponse = t_3
typeRegistryModule.default:register(t.MarketplaceCatalogPageResponse)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p4)
	-- upvalues: t_4 (ref)
	return setmetatable({
		key = if p4 == nil or p4.key == nil then "" else p4.key,
		value = if p4 == nil or p4.value == nil then nil else p4.value
	}, t_4)
end

function t_4:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var95 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var96, var97 = protoModule.writeTag(buff, var95, 1, protoModule.wireTypes.lengthDelimited)
		var96, var146 = protoModule.writeString(var96, var97, self.key)
		buff = var96
		var95 = var97
	end
	if self.value ~= nil then
		local var98 = self.value:encode()
		local var99, var100 = protoModule.writeTag(buff, var95, 2, protoModule.wireTypes.lengthDelimited)
		var99, var149 = protoModule.writeBuffer(var99, var100, var98, buffer.len(var98))
		buff = var99
		var95 = var100
	end
	local buff_1 = buffer.create(var95)
	buffer.copy(buff_1, 0, buff, 0, var95)
	
	return buff_1
end

function t_4.decode(p4)
	-- upvalues: t_4 (ref), protoModule (ref), templateEntryModule (ref)
	local var95 = t_4.new()
	local var96 = 0
	while var96 < buffer.len(p4) do
		local _ = nil
		local var97 = nil
		local var98, var99, var100 = protoModule.readTag(p4, var96)
		local var101 = var98
		var97 = var99
		var96 = var100
		
		if var97 == protoModule.wireTypes.varint then
			local _ = nil
			local var102, var103 = protoModule.readVarInt(p4, var96)
			local _ = var102
			var96 = var103
			continue
		end
		if var97 == protoModule.wireTypes.lengthDelimited then
			if var101 == 1 then
				local _ = nil
				local var104, var105 = protoModule.readBuffer(p4, var96)
				var96 = var105
				var95.key = buffer.tostring(var104)
			elseif var101 == 2 then
				local _ = nil
				local var106, var107 = protoModule.readBuffer(p4, var96)
				var96 = var107
				var95.value = templateEntryModule.TemplateEntry.decode(var106)
			else
				local _ = nil
				local var108, var109 = protoModule.readVarInt(p4, var96)
				var96 = var109 + var108
			end
		elseif var97 == protoModule.wireTypes.i32 then
			local _ = nil
			local var110, var111 = protoModule.readFixed32(p4, var96)
			local _ = var110
			var96 = var111
		elseif var97 == protoModule.wireTypes.i64 then
			local _ = nil
			local var112, var113 = protoModule.readFixed64(p4, var96)
			local _ = var112
			var96 = var113
		else
			error("Unsupported wire type: " .. var153)
		end
	end
	return var95
end

function t_4:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_4:jsonDecode()
	-- upvalues: t_4 (ref), templateEntryModule (ref)
	local var114 = t_4.new()
	
	if self.key ~= nil then
		var114.key = self.key
	end
	if self.value ~= nil then
		var114.value = templateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return var114
end

t_4.descriptor = {
	name = "MarketplaceCatalogPageResponse_TemplatesEntry",
	fullName = "roblox.apppageplatform.marketplacecatalog.v1beta1.TemplatesEntry"
}
t.MarketplaceCatalogPageResponse_TemplatesEntry = t_4
typeRegistryModule.default:register(t.MarketplaceCatalogPageResponse_TemplatesEntry)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p5)
	-- upvalues: t_5 (ref)
	return setmetatable({
		key = if p5 == nil or p5.key == nil then "" else p5.key,
		value = if p5 == nil or p5.value == nil then "" else p5.value
	}, t_5)
end

function t_5:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var114 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var115, var116 = protoModule.writeTag(buff, var114, 1, protoModule.wireTypes.lengthDelimited)
		var115, var175 = protoModule.writeString(var115, var116, self.key)
		buff = var115
		var114 = var116
	end
	if self.value ~= nil and self.value ~= "" then
		local var117, var118 = protoModule.writeTag(buff, var114, 2, protoModule.wireTypes.lengthDelimited)
		var117, var177 = protoModule.writeString(var117, var118, self.value)
		buff = var117
		var114 = var118
	end
	local buff_1 = buffer.create(var114)
	buffer.copy(buff_1, 0, buff, 0, var114)
	
	return buff_1
end

function t_5.decode(p5)
	-- upvalues: t_5 (ref), protoModule (ref)
	local var114 = t_5.new()
	local var115 = 0
	while var115 < buffer.len(p5) do
		local _ = nil
		local var116 = nil
		local var117, var118, var119 = protoModule.readTag(p5, var115)
		local var120 = var117
		var116 = var118
		var115 = var119
		
		if var116 == protoModule.wireTypes.varint then
			local _ = nil
			local var121, var122 = protoModule.readVarInt(p5, var115)
			local _ = var121
			var115 = var122
			continue
		end
		if var116 == protoModule.wireTypes.lengthDelimited then
			if var120 == 1 then
				local _ = nil
				local var123, var124 = protoModule.readBuffer(p5, var115)
				var115 = var124
				var114.key = buffer.tostring(var123)
			elseif var120 == 2 then
				local _ = nil
				local var125, var126 = protoModule.readBuffer(p5, var115)
				var115 = var126
				var114.value = buffer.tostring(var125)
			else
				local _ = nil
				local var127, var128 = protoModule.readVarInt(p5, var115)
				var115 = var128 + var127
			end
		elseif var116 == protoModule.wireTypes.i32 then
			local _ = nil
			local var129, var130 = protoModule.readFixed32(p5, var115)
			local _ = var129
			var115 = var130
		elseif var116 == protoModule.wireTypes.i64 then
			local _ = nil
			local var131, var132 = protoModule.readFixed64(p5, var115)
			local _ = var131
			var115 = var132
		else
			error("Unsupported wire type: " .. var181)
		end
	end
	return var114
end

function t_5:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function t_5:jsonDecode()
	-- upvalues: t_5 (ref)
	local var133 = t_5.new()
	
	if self.key ~= nil then
		var133.key = self.key
	end
	if self.value ~= nil then
		var133.value = self.value
	end
	return var133
end

t_5.descriptor = {
	name = "MarketplaceCatalogPageResponse_LocalizedLiteralsEntry",
	fullName = "roblox.apppageplatform.marketplacecatalog.v1beta1.LocalizedLiteralsEntry"
}
t.MarketplaceCatalogPageResponse_LocalizedLiteralsEntry = t_5
typeRegistryModule.default:register(t.MarketplaceCatalogPageResponse_LocalizedLiteralsEntry)
local t_6 = {}
t_6.__index = t_6

function t_6.new(p6)
	-- upvalues: t_6 (ref)
	return setmetatable({
		next_cursor = if p6 == nil or p6.next_cursor == nil then nil else p6.next_cursor
	}, t_6)
end

function t_6:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var133 = 0
	
	if self.next_cursor ~= nil then
		local var134, var135 = protoModule.writeTag(buff, var133, 1, protoModule.wireTypes.lengthDelimited)
		var134, var203 = protoModule.writeString(var134, var135, self.next_cursor)
		buff = var134
		var133 = var135
	end
	local buff_1 = buffer.create(var133)
	buffer.copy(buff_1, 0, buff, 0, var133)
	
	return buff_1
end

function t_6.decode(p6)
	-- upvalues: t_6 (ref), protoModule (ref)
	local var133 = t_6.new()
	local var134 = 0
	while var134 < buffer.len(p6) do
		local _ = nil
		local var135 = nil
		local var136, var137, var138 = protoModule.readTag(p6, var134)
		local var139 = var136
		var135 = var137
		var134 = var138
		
		if var135 == protoModule.wireTypes.varint then
			local _ = nil
			local var140, var141 = protoModule.readVarInt(p6, var134)
			local _ = var140
			var134 = var141
			continue
		end
		if var135 == protoModule.wireTypes.lengthDelimited then
			if var139 == 1 then
				local _ = nil
				local var142, var143 = protoModule.readBuffer(p6, var134)
				var134 = var143
				var133.next_cursor = buffer.tostring(var142)
			else
				local _ = nil
				local var144, var145 = protoModule.readVarInt(p6, var134)
				var134 = var145 + var144
			end
		elseif var135 == protoModule.wireTypes.i32 then
			local _ = nil
			local var146, var147 = protoModule.readFixed32(p6, var134)
			local _ = var146
			var134 = var147
		elseif var135 == protoModule.wireTypes.i64 then
			local _ = nil
			local var148, var149 = protoModule.readFixed64(p6, var134)
			local _ = var148
			var134 = var149
		else
			error("Unsupported wire type: " .. var207)
		end
	end
	return var133
end

function t_6:jsonEncode()
	local t = {}
	
	if self.next_cursor ~= nil then
		t.nextCursor = self.next_cursor
	end
	return t
end

function t_6:jsonDecode()
	-- upvalues: t_6 (ref)
	local var150 = t_6.new()
	
	if self.next_cursor ~= nil then
		var150.next_cursor = self.next_cursor
	end
	if self.nextCursor ~= nil then
		var150.next_cursor = self.nextCursor
	end
	return var150
end

t_6.descriptor = {
	name = "Pagination",
	fullName = "roblox.apppageplatform.marketplacecatalog.v1beta1.Pagination"
}
t.Pagination = t_6
typeRegistryModule.default:register(t.Pagination)
t.PaginationDirection = {
	fromNumber = function(p7)
		return if p7 == 0 then "PAGINATION_DIRECTION_INVALID" elseif p7 == 1 then "PAGINATION_DIRECTION_FORWARD" elseif p7 == 2 then "PAGINATION_DIRECTION_BACKWARD" else nil
	end,
	toNumber = function(p7)
		return if p7 == "PAGINATION_DIRECTION_INVALID" then 0 elseif p7 == "PAGINATION_DIRECTION_FORWARD" then 1 elseif p7 == "PAGINATION_DIRECTION_BACKWARD" then 2 else p7
	end,
	fromName = function(p7)
		return if p7 == "PAGINATION_DIRECTION_INVALID" then "PAGINATION_DIRECTION_INVALID" elseif p7 == "PAGINATION_DIRECTION_FORWARD" then "PAGINATION_DIRECTION_FORWARD" elseif p7 == "PAGINATION_DIRECTION_BACKWARD" then "PAGINATION_DIRECTION_BACKWARD" else nil
	end
}

return {
	MarketplaceCatalogPageRequest = t.MarketplaceCatalogPageRequest,
	RequestPagination = t.RequestPagination,
	MarketplaceCatalogPageResponse = t.MarketplaceCatalogPageResponse,
	Pagination = t.Pagination,
	PaginationDirection = t.PaginationDirection
}