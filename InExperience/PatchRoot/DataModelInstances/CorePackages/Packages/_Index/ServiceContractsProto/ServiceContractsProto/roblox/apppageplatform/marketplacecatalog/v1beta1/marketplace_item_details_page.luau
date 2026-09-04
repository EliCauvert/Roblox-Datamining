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
		item_id = if p1 == nil or p1.item_id == nil then "" else p1.item_id,
		item_type = if p1 == nil or p1.item_type == nil then "" else p1.item_type,
		screen_size = if p1 == nil or p1.screen_size == nil then "" else p1.screen_size
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var13 = protoModule.writeString(var2, var3, self.item_id)
		buff = var2
		var1 = var3
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var15 = protoModule.writeString(var4, var5, self.item_type)
		buff = var4
		var1 = var5
	end
	if self.screen_size ~= nil and self.screen_size ~= "" then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var6, var17 = protoModule.writeString(var6, var7, self.screen_size)
		buff = var6
		var1 = var7
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref)
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
				var1.item_id = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.item_type = buffer.tostring(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.screen_size = buffer.tostring(var14)
			else
				local _ = nil
				local var16, var17 = protoModule.readVarInt(p1, var2)
				var2 = var17 + var16
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var18, var19 = protoModule.readFixed32(p1, var2)
			local _ = var18
			var2 = var19
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var20, var21 = protoModule.readFixed64(p1, var2)
			local _ = var20
			var2 = var21
		else
			error("Unsupported wire type: " .. var21)
		end
	end
	return var1
end

function t_1:jsonEncode()
	local t = {}
	
	if self.item_id ~= nil and self.item_id ~= "" then
		t.itemId = self.item_id
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		t.itemType = self.item_type
	end
	if self.screen_size ~= nil and self.screen_size ~= "" then
		t.screenSize = self.screen_size
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref)
	local var22 = t_1.new()
	
	if self.item_id ~= nil then
		var22.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var22.item_id = self.itemId
	end
	if self.item_type ~= nil then
		var22.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var22.item_type = self.itemType
	end
	if self.screen_size ~= nil then
		var22.screen_size = self.screen_size
	end
	if self.screenSize ~= nil then
		var22.screen_size = self.screenSize
	end
	return var22
end

t_1.descriptor = {
	name = "MarketplaceItemDetailsPageRequest",
	fullName = "roblox.apppageplatform.marketplacecatalog.v1beta1.MarketplaceItemDetailsPageRequest"
}
t.MarketplaceItemDetailsPageRequest = t_1
typeRegistryModule.default:register(t.MarketplaceItemDetailsPageRequest)
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
	local var22 = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for i, v in self.page_entries do
			local var23 = v:encode()
			local var24, var25 = protoModule.writeTag(buff, var22, 1, protoModule.wireTypes.lengthDelimited)
			var24, var46 = protoModule.writeBuffer(var24, var25, var23, buffer.len(var23))
			buff = var24
			var22 = var25
		end
	end
	if self.hydration_data ~= nil then
		local var26 = self.hydration_data:encode()
		local var27, var28 = protoModule.writeTag(buff, var22, 2, protoModule.wireTypes.lengthDelimited)
		var27, var49 = protoModule.writeBuffer(var27, var28, var26, buffer.len(var26))
		buff = var27
		var22 = var28
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, v in self.templates do
			local var29, var30 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var29, var51 = protoModule.writeString(var29, var30, i)
			local var31 = v:encode()
			var30, var53 = protoModule.writeTag(var29, var30, 2, protoModule.wireTypes.lengthDelimited)
			var30, var53 = protoModule.writeBuffer(var30, var53, var31, buffer.len(var31))
			local var32 = var30
			local var33 = var53
			local var34, var35 = protoModule.writeTag(buff, var22, 3, protoModule.wireTypes.lengthDelimited)
			var34, var57 = protoModule.writeBuffer(var34, var35, var32, var33)
			buff = var34
			var22 = var35
		end
	end
	if self.localized_literals ~= nil and next(self.localized_literals) ~= nil then
		for i, v in self.localized_literals do
			local var36, var37 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var36, var59 = protoModule.writeString(var36, var37, i)
			var36, var59 = protoModule.writeTag(var36, var37, 2, protoModule.wireTypes.lengthDelimited)
			var36, var59 = protoModule.writeString(var36, var37, v)
			local var38 = var36
			local var39 = var37
			local var40, var41 = protoModule.writeTag(buff, var22, 4, protoModule.wireTypes.lengthDelimited)
			var40, var63 = protoModule.writeBuffer(var40, var41, var38, var39)
			buff = var40
			var22 = var41
		end
	end
	local buff_1 = buffer.create(var22)
	buffer.copy(buff_1, 0, buff, 0, var22)
	
	return buff_1
end

function t_2.decode(p2)
	-- upvalues: t_2 (ref), protoModule (ref), pageEntryContentModule (ref), hydrationContentModule (ref), t (ref), templateEntryModule (ref)
	local var42 = t_2.new()
	local var43 = 0
	while var43 < buffer.len(p2) do
		local _ = nil
		local var44 = nil
		local var45, var46, var47 = protoModule.readTag(p2, var43)
		local var48 = var45
		var44 = var46
		var43 = var47
		
		if var44 == protoModule.wireTypes.varint then
			local _ = nil
			local var49, var50 = protoModule.readVarInt(p2, var43)
			local _ = var49
			var43 = var50
			continue
		end
		if var44 == protoModule.wireTypes.lengthDelimited then
			if var48 == 1 then
				local _ = nil
				local var51, var52 = protoModule.readBuffer(p2, var43)
				var43 = var52
				table.insert(var42.page_entries, pageEntryContentModule.UniversalPageEntry.decode(var51))
			elseif var48 == 2 then
				local _ = nil
				local var53, var54 = protoModule.readBuffer(p2, var43)
				var43 = var54
				var42.hydration_data = hydrationContentModule.HydrationContent.decode(var53)
			elseif var48 == 3 then
				local _ = nil
				local var55, var56 = protoModule.readBuffer(p2, var43)
				var43 = var56
				var55 = t.MarketplaceItemDetailsPageResponse_TemplatesEntry.decode(var55)
				var42.templates[var55.key or ""] = var55.value or templateEntryModule.TemplateEntry.new()
			elseif var48 == 4 then
				local _ = nil
				local var57, var58 = protoModule.readBuffer(p2, var43)
				var43 = var58
				var57 = t.MarketplaceItemDetailsPageResponse_LocalizedLiteralsEntry.decode(var57)
				var42.localized_literals[var57.key or ""] = var57.value or ""
			else
				local _ = nil
				local var59, var60 = protoModule.readVarInt(p2, var43)
				var43 = var60 + var59
			end
		elseif var44 == protoModule.wireTypes.i32 then
			local _ = nil
			local var61, var62 = protoModule.readFixed32(p2, var43)
			local _ = var61
			var43 = var62
		elseif var44 == protoModule.wireTypes.i64 then
			local _ = nil
			local var63, var64 = protoModule.readFixed64(p2, var43)
			local _ = var63
			var43 = var64
		else
			error("Unsupported wire type: " .. var67)
		end
	end
	return var42
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
	local var65 = t_2.new()
	
	if self.page_entries ~= nil then
		local t = {}
		
		for i, v in self.page_entries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var65.page_entries = t
	end
	if self.pageEntries ~= nil then
		local t = {}
		
		for i, v in self.pageEntries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var65.page_entries = t
	end
	if self.hydration_data ~= nil then
		var65.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		var65.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	if self.templates ~= nil then
		local t = {}
		
		for i, v in self.templates do
			t[i] = templateEntryModule.TemplateEntry.jsonDecode(v)
		end
		var65.templates = t
	end
	if self.localized_literals ~= nil then
		local t = {}
		
		for i, v in self.localized_literals do
			t[i] = v
		end
		var65.localized_literals = t
	end
	if self.localizedLiterals ~= nil then
		local t = {}
		
		for i, v in self.localizedLiterals do
			t[i] = v
		end
		var65.localized_literals = t
	end
	return var65
end

t_2.descriptor = {
	name = "MarketplaceItemDetailsPageResponse",
	fullName = "roblox.apppageplatform.marketplacecatalog.v1beta1.MarketplaceItemDetailsPageResponse"
}
t.MarketplaceItemDetailsPageResponse = t_2
typeRegistryModule.default:register(t.MarketplaceItemDetailsPageResponse)
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
	local var66 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var67, var68 = protoModule.writeTag(buff, var66, 1, protoModule.wireTypes.lengthDelimited)
		var67, var101 = protoModule.writeString(var67, var68, self.key)
		buff = var67
		var66 = var68
	end
	if self.value ~= nil then
		local var69 = self.value:encode()
		local var70, var71 = protoModule.writeTag(buff, var66, 2, protoModule.wireTypes.lengthDelimited)
		var70, var104 = protoModule.writeBuffer(var70, var71, var69, buffer.len(var69))
		buff = var70
		var66 = var71
	end
	local buff_1 = buffer.create(var66)
	buffer.copy(buff_1, 0, buff, 0, var66)
	
	return buff_1
end

function t_3.decode(p3)
	-- upvalues: t_3 (ref), protoModule (ref), templateEntryModule (ref)
	local var66 = t_3.new()
	local var67 = 0
	while var67 < buffer.len(p3) do
		local _ = nil
		local var68 = nil
		local var69, var70, var71 = protoModule.readTag(p3, var67)
		local var72 = var69
		var68 = var70
		var67 = var71
		
		if var68 == protoModule.wireTypes.varint then
			local _ = nil
			local var73, var74 = protoModule.readVarInt(p3, var67)
			local _ = var73
			var67 = var74
			continue
		end
		if var68 == protoModule.wireTypes.lengthDelimited then
			if var72 == 1 then
				local _ = nil
				local var75, var76 = protoModule.readBuffer(p3, var67)
				var67 = var76
				var66.key = buffer.tostring(var75)
			elseif var72 == 2 then
				local _ = nil
				local var77, var78 = protoModule.readBuffer(p3, var67)
				var67 = var78
				var66.value = templateEntryModule.TemplateEntry.decode(var77)
			else
				local _ = nil
				local var79, var80 = protoModule.readVarInt(p3, var67)
				var67 = var80 + var79
			end
		elseif var68 == protoModule.wireTypes.i32 then
			local _ = nil
			local var81, var82 = protoModule.readFixed32(p3, var67)
			local _ = var81
			var67 = var82
		elseif var68 == protoModule.wireTypes.i64 then
			local _ = nil
			local var83, var84 = protoModule.readFixed64(p3, var67)
			local _ = var83
			var67 = var84
		else
			error("Unsupported wire type: " .. var108)
		end
	end
	return var66
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
	local var85 = t_3.new()
	
	if self.key ~= nil then
		var85.key = self.key
	end
	if self.value ~= nil then
		var85.value = templateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return var85
end

t_3.descriptor = {
	name = "MarketplaceItemDetailsPageResponse_TemplatesEntry",
	fullName = "roblox.apppageplatform.marketplacecatalog.v1beta1.TemplatesEntry"
}
t.MarketplaceItemDetailsPageResponse_TemplatesEntry = t_3
typeRegistryModule.default:register(t.MarketplaceItemDetailsPageResponse_TemplatesEntry)
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
	local var85 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var86, var87 = protoModule.writeTag(buff, var85, 1, protoModule.wireTypes.lengthDelimited)
		var86, var130 = protoModule.writeString(var86, var87, self.key)
		buff = var86
		var85 = var87
	end
	if self.value ~= nil and self.value ~= "" then
		local var88, var89 = protoModule.writeTag(buff, var85, 2, protoModule.wireTypes.lengthDelimited)
		var88, var132 = protoModule.writeString(var88, var89, self.value)
		buff = var88
		var85 = var89
	end
	local buff_1 = buffer.create(var85)
	buffer.copy(buff_1, 0, buff, 0, var85)
	
	return buff_1
end

function t_4.decode(p4)
	-- upvalues: t_4 (ref), protoModule (ref)
	local var85 = t_4.new()
	local var86 = 0
	while var86 < buffer.len(p4) do
		local _ = nil
		local var87 = nil
		local var88, var89, var90 = protoModule.readTag(p4, var86)
		local var91 = var88
		var87 = var89
		var86 = var90
		
		if var87 == protoModule.wireTypes.varint then
			local _ = nil
			local var92, var93 = protoModule.readVarInt(p4, var86)
			local _ = var92
			var86 = var93
			continue
		end
		if var87 == protoModule.wireTypes.lengthDelimited then
			if var91 == 1 then
				local _ = nil
				local var94, var95 = protoModule.readBuffer(p4, var86)
				var86 = var95
				var85.key = buffer.tostring(var94)
			elseif var91 == 2 then
				local _ = nil
				local var96, var97 = protoModule.readBuffer(p4, var86)
				var86 = var97
				var85.value = buffer.tostring(var96)
			else
				local _ = nil
				local var98, var99 = protoModule.readVarInt(p4, var86)
				var86 = var99 + var98
			end
		elseif var87 == protoModule.wireTypes.i32 then
			local _ = nil
			local var100, var101 = protoModule.readFixed32(p4, var86)
			local _ = var100
			var86 = var101
		elseif var87 == protoModule.wireTypes.i64 then
			local _ = nil
			local var102, var103 = protoModule.readFixed64(p4, var86)
			local _ = var102
			var86 = var103
		else
			error("Unsupported wire type: " .. var136)
		end
	end
	return var85
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
	local var104 = t_4.new()
	
	if self.key ~= nil then
		var104.key = self.key
	end
	if self.value ~= nil then
		var104.value = self.value
	end
	return var104
end

t_4.descriptor = {
	name = "MarketplaceItemDetailsPageResponse_LocalizedLiteralsEntry",
	fullName = "roblox.apppageplatform.marketplacecatalog.v1beta1.LocalizedLiteralsEntry"
}
t.MarketplaceItemDetailsPageResponse_LocalizedLiteralsEntry = t_4
typeRegistryModule.default:register(t.MarketplaceItemDetailsPageResponse_LocalizedLiteralsEntry)

return {
	MarketplaceItemDetailsPageRequest = t.MarketplaceItemDetailsPageRequest,
	MarketplaceItemDetailsPageResponse = t.MarketplaceItemDetailsPageResponse
}