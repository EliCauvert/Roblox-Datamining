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
		offer_id = if p1 == nil or p1.offer_id == nil then "" else p1.offer_id
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.offer_id ~= nil and self.offer_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var13 = protoModule.writeString(var2, var3, self.offer_id)
		buff = var2
		var1 = var3
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
				var1.offer_id = buffer.tostring(var10)
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var17)
		end
	end
	return var1
end

function t_1:jsonEncode()
	local t = {}
	
	if self.offer_id ~= nil and self.offer_id ~= "" then
		t.offerId = self.offer_id
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref)
	local var18 = t_1.new()
	
	if self.offer_id ~= nil then
		var18.offer_id = self.offer_id
	end
	if self.offerId ~= nil then
		var18.offer_id = self.offerId
	end
	return var18
end

t_1.descriptor = {
	name = "MarketplaceOfferModalPageRequest",
	fullName = "roblox.apppageplatform.marketplacecatalog.v1beta1.MarketplaceOfferModalPageRequest"
}
t.MarketplaceOfferModalPageRequest = t_1
typeRegistryModule.default:register(t.MarketplaceOfferModalPageRequest)
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
	local var18 = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for i, v in self.page_entries do
			local var19 = v:encode()
			local var20, var21 = protoModule.writeTag(buff, var18, 1, protoModule.wireTypes.lengthDelimited)
			var20, var38 = protoModule.writeBuffer(var20, var21, var19, buffer.len(var19))
			buff = var20
			var18 = var21
		end
	end
	if self.hydration_data ~= nil then
		local var22 = self.hydration_data:encode()
		local var23, var24 = protoModule.writeTag(buff, var18, 2, protoModule.wireTypes.lengthDelimited)
		var23, var41 = protoModule.writeBuffer(var23, var24, var22, buffer.len(var22))
		buff = var23
		var18 = var24
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, v in self.templates do
			local var25, var26 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var25, var43 = protoModule.writeString(var25, var26, i)
			local var27 = v:encode()
			var26, var45 = protoModule.writeTag(var25, var26, 2, protoModule.wireTypes.lengthDelimited)
			var26, var45 = protoModule.writeBuffer(var26, var45, var27, buffer.len(var27))
			local var28 = var26
			local var29 = var45
			local var30, var31 = protoModule.writeTag(buff, var18, 3, protoModule.wireTypes.lengthDelimited)
			var30, var49 = protoModule.writeBuffer(var30, var31, var28, var29)
			buff = var30
			var18 = var31
		end
	end
	if self.localized_literals ~= nil and next(self.localized_literals) ~= nil then
		for i, v in self.localized_literals do
			local var32, var33 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var32, var51 = protoModule.writeString(var32, var33, i)
			var32, var51 = protoModule.writeTag(var32, var33, 2, protoModule.wireTypes.lengthDelimited)
			var32, var51 = protoModule.writeString(var32, var33, v)
			local var34 = var32
			local var35 = var33
			local var36, var37 = protoModule.writeTag(buff, var18, 4, protoModule.wireTypes.lengthDelimited)
			var36, var55 = protoModule.writeBuffer(var36, var37, var34, var35)
			buff = var36
			var18 = var37
		end
	end
	local buff_1 = buffer.create(var18)
	buffer.copy(buff_1, 0, buff, 0, var18)
	
	return buff_1
end

function t_2.decode(p2)
	-- upvalues: t_2 (ref), protoModule (ref), pageEntryContentModule (ref), hydrationContentModule (ref), t (ref), templateEntryModule (ref)
	local var38 = t_2.new()
	local var39 = 0
	while var39 < buffer.len(p2) do
		local _ = nil
		local var40 = nil
		local var41, var42, var43 = protoModule.readTag(p2, var39)
		local var44 = var41
		var40 = var42
		var39 = var43
		
		if var40 == protoModule.wireTypes.varint then
			local _ = nil
			local var45, var46 = protoModule.readVarInt(p2, var39)
			local _ = var45
			var39 = var46
			continue
		end
		if var40 == protoModule.wireTypes.lengthDelimited then
			if var44 == 1 then
				local _ = nil
				local var47, var48 = protoModule.readBuffer(p2, var39)
				var39 = var48
				table.insert(var38.page_entries, pageEntryContentModule.UniversalPageEntry.decode(var47))
			elseif var44 == 2 then
				local _ = nil
				local var49, var50 = protoModule.readBuffer(p2, var39)
				var39 = var50
				var38.hydration_data = hydrationContentModule.HydrationContent.decode(var49)
			elseif var44 == 3 then
				local _ = nil
				local var51, var52 = protoModule.readBuffer(p2, var39)
				var39 = var52
				var51 = t.MarketplaceOfferModalPageResponse_TemplatesEntry.decode(var51)
				var38.templates[var51.key or ""] = var51.value or templateEntryModule.TemplateEntry.new()
			elseif var44 == 4 then
				local _ = nil
				local var53, var54 = protoModule.readBuffer(p2, var39)
				var39 = var54
				var53 = t.MarketplaceOfferModalPageResponse_LocalizedLiteralsEntry.decode(var53)
				var38.localized_literals[var53.key or ""] = var53.value or ""
			else
				local _ = nil
				local var55, var56 = protoModule.readVarInt(p2, var39)
				var39 = var56 + var55
			end
		elseif var40 == protoModule.wireTypes.i32 then
			local _ = nil
			local var57, var58 = protoModule.readFixed32(p2, var39)
			local _ = var57
			var39 = var58
		elseif var40 == protoModule.wireTypes.i64 then
			local _ = nil
			local var59, var60 = protoModule.readFixed64(p2, var39)
			local _ = var59
			var39 = var60
		else
			error("Unsupported wire type: " .. var59)
		end
	end
	return var38
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
	local var61 = t_2.new()
	
	if self.page_entries ~= nil then
		local t = {}
		
		for i, v in self.page_entries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var61.page_entries = t
	end
	if self.pageEntries ~= nil then
		local t = {}
		
		for i, v in self.pageEntries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var61.page_entries = t
	end
	if self.hydration_data ~= nil then
		var61.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		var61.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	if self.templates ~= nil then
		local t = {}
		
		for i, v in self.templates do
			t[i] = templateEntryModule.TemplateEntry.jsonDecode(v)
		end
		var61.templates = t
	end
	if self.localized_literals ~= nil then
		local t = {}
		
		for i, v in self.localized_literals do
			t[i] = v
		end
		var61.localized_literals = t
	end
	if self.localizedLiterals ~= nil then
		local t = {}
		
		for i, v in self.localizedLiterals do
			t[i] = v
		end
		var61.localized_literals = t
	end
	return var61
end

t_2.descriptor = {
	name = "MarketplaceOfferModalPageResponse",
	fullName = "roblox.apppageplatform.marketplacecatalog.v1beta1.MarketplaceOfferModalPageResponse"
}
t.MarketplaceOfferModalPageResponse = t_2
typeRegistryModule.default:register(t.MarketplaceOfferModalPageResponse)
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
	local var62 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var63, var64 = protoModule.writeTag(buff, var62, 1, protoModule.wireTypes.lengthDelimited)
		var63, var93 = protoModule.writeString(var63, var64, self.key)
		buff = var63
		var62 = var64
	end
	if self.value ~= nil then
		local var65 = self.value:encode()
		local var66, var67 = protoModule.writeTag(buff, var62, 2, protoModule.wireTypes.lengthDelimited)
		var66, var96 = protoModule.writeBuffer(var66, var67, var65, buffer.len(var65))
		buff = var66
		var62 = var67
	end
	local buff_1 = buffer.create(var62)
	buffer.copy(buff_1, 0, buff, 0, var62)
	
	return buff_1
end

function t_3.decode(p3)
	-- upvalues: t_3 (ref), protoModule (ref), templateEntryModule (ref)
	local var62 = t_3.new()
	local var63 = 0
	while var63 < buffer.len(p3) do
		local _ = nil
		local var64 = nil
		local var65, var66, var67 = protoModule.readTag(p3, var63)
		local var68 = var65
		var64 = var66
		var63 = var67
		
		if var64 == protoModule.wireTypes.varint then
			local _ = nil
			local var69, var70 = protoModule.readVarInt(p3, var63)
			local _ = var69
			var63 = var70
			continue
		end
		if var64 == protoModule.wireTypes.lengthDelimited then
			if var68 == 1 then
				local _ = nil
				local var71, var72 = protoModule.readBuffer(p3, var63)
				var63 = var72
				var62.key = buffer.tostring(var71)
			elseif var68 == 2 then
				local _ = nil
				local var73, var74 = protoModule.readBuffer(p3, var63)
				var63 = var74
				var62.value = templateEntryModule.TemplateEntry.decode(var73)
			else
				local _ = nil
				local var75, var76 = protoModule.readVarInt(p3, var63)
				var63 = var76 + var75
			end
		elseif var64 == protoModule.wireTypes.i32 then
			local _ = nil
			local var77, var78 = protoModule.readFixed32(p3, var63)
			local _ = var77
			var63 = var78
		elseif var64 == protoModule.wireTypes.i64 then
			local _ = nil
			local var79, var80 = protoModule.readFixed64(p3, var63)
			local _ = var79
			var63 = var80
		else
			error("Unsupported wire type: " .. var100)
		end
	end
	return var62
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
	local var81 = t_3.new()
	
	if self.key ~= nil then
		var81.key = self.key
	end
	if self.value ~= nil then
		var81.value = templateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return var81
end

t_3.descriptor = {
	name = "MarketplaceOfferModalPageResponse_TemplatesEntry",
	fullName = "roblox.apppageplatform.marketplacecatalog.v1beta1.TemplatesEntry"
}
t.MarketplaceOfferModalPageResponse_TemplatesEntry = t_3
typeRegistryModule.default:register(t.MarketplaceOfferModalPageResponse_TemplatesEntry)
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
	local var81 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var82, var83 = protoModule.writeTag(buff, var81, 1, protoModule.wireTypes.lengthDelimited)
		var82, var122 = protoModule.writeString(var82, var83, self.key)
		buff = var82
		var81 = var83
	end
	if self.value ~= nil and self.value ~= "" then
		local var84, var85 = protoModule.writeTag(buff, var81, 2, protoModule.wireTypes.lengthDelimited)
		var84, var124 = protoModule.writeString(var84, var85, self.value)
		buff = var84
		var81 = var85
	end
	local buff_1 = buffer.create(var81)
	buffer.copy(buff_1, 0, buff, 0, var81)
	
	return buff_1
end

function t_4.decode(p4)
	-- upvalues: t_4 (ref), protoModule (ref)
	local var81 = t_4.new()
	local var82 = 0
	while var82 < buffer.len(p4) do
		local _ = nil
		local var83 = nil
		local var84, var85, var86 = protoModule.readTag(p4, var82)
		local var87 = var84
		var83 = var85
		var82 = var86
		
		if var83 == protoModule.wireTypes.varint then
			local _ = nil
			local var88, var89 = protoModule.readVarInt(p4, var82)
			local _ = var88
			var82 = var89
			continue
		end
		if var83 == protoModule.wireTypes.lengthDelimited then
			if var87 == 1 then
				local _ = nil
				local var90, var91 = protoModule.readBuffer(p4, var82)
				var82 = var91
				var81.key = buffer.tostring(var90)
			elseif var87 == 2 then
				local _ = nil
				local var92, var93 = protoModule.readBuffer(p4, var82)
				var82 = var93
				var81.value = buffer.tostring(var92)
			else
				local _ = nil
				local var94, var95 = protoModule.readVarInt(p4, var82)
				var82 = var95 + var94
			end
		elseif var83 == protoModule.wireTypes.i32 then
			local _ = nil
			local var96, var97 = protoModule.readFixed32(p4, var82)
			local _ = var96
			var82 = var97
		elseif var83 == protoModule.wireTypes.i64 then
			local _ = nil
			local var98, var99 = protoModule.readFixed64(p4, var82)
			local _ = var98
			var82 = var99
		else
			error("Unsupported wire type: " .. var128)
		end
	end
	return var81
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
	local var100 = t_4.new()
	
	if self.key ~= nil then
		var100.key = self.key
	end
	if self.value ~= nil then
		var100.value = self.value
	end
	return var100
end

t_4.descriptor = {
	name = "MarketplaceOfferModalPageResponse_LocalizedLiteralsEntry",
	fullName = "roblox.apppageplatform.marketplacecatalog.v1beta1.LocalizedLiteralsEntry"
}
t.MarketplaceOfferModalPageResponse_LocalizedLiteralsEntry = t_4
typeRegistryModule.default:register(t.MarketplaceOfferModalPageResponse_LocalizedLiteralsEntry)

return {
	MarketplaceOfferModalPageRequest = t.MarketplaceOfferModalPageRequest,
	MarketplaceOfferModalPageResponse = t.MarketplaceOfferModalPageResponse
}