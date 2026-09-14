local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
		taxonomy_id = if p1 == nil or p1.taxonomy_id == nil then nil else p1.taxonomy_id,
		taxonomy_name = if p1 == nil or p1.taxonomy_name == nil then "" else p1.taxonomy_name
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.taxonomy_id ~= nil then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var10 = protoModule.writeString(var2, var3, self.taxonomy_id)
		buff = var2
		var1 = var3
	end
	if self.taxonomy_name ~= nil and self.taxonomy_name ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var12 = protoModule.writeString(var4, var5, self.taxonomy_name)
		buff = var4
		var1 = var5
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
				var1.taxonomy_id = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.taxonomy_name = buffer.tostring(var12)
			else
				local _ = nil
				local var14, var15 = protoModule.readVarInt(p1, var2)
				var2 = var15 + var14
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var16, var17 = protoModule.readFixed32(p1, var2)
			local _ = var16
			var2 = var17
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var18, var19 = protoModule.readFixed64(p1, var2)
			local _ = var18
			var2 = var19
		else
			error("Unsupported wire type: " .. var16)
		end
	end
	return var1
end

function t_1:jsonEncode()
	local t = {}
	
	if self.taxonomy_id ~= nil then
		t.taxonomyId = self.taxonomy_id
	end
	if self.taxonomy_name ~= nil and self.taxonomy_name ~= "" then
		t.taxonomyName = self.taxonomy_name
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref)
	local var20 = t_1.new()
	
	if self.taxonomy_id ~= nil then
		var20.taxonomy_id = self.taxonomy_id
	end
	if self.taxonomyId ~= nil then
		var20.taxonomy_id = self.taxonomyId
	end
	if self.taxonomy_name ~= nil then
		var20.taxonomy_name = self.taxonomy_name
	end
	if self.taxonomyName ~= nil then
		var20.taxonomy_name = self.taxonomyName
	end
	return var20
end

t_1.descriptor = {
	name = "MarketplaceCatalogTaxonomyNode",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceCatalogTaxonomyNode"
}
t.MarketplaceCatalogTaxonomyNode = t_1
typeRegistryModule.default:register(t.MarketplaceCatalogTaxonomyNode)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2)
	-- upvalues: t_2 (ref)
	return setmetatable({
		days = if p2 == nil or p2.days == nil then 0 else p2.days,
		price = if p2 == nil or p2.price == nil then 0 else p2.price,
		selected = if p2 == nil or p2.selected == nil then nil else p2.selected
	}, t_2)
end

function t_2:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var20 = 0
	
	if self.days ~= nil and self.days ~= 0 then
		local var21, var22 = protoModule.writeTag(buff, var20, 1, protoModule.wireTypes.varint)
		var21, var38 = protoModule.writeVarInt(var21, var22, self.days)
		buff = var21
		var20 = var22
	end
	if self.price ~= nil and self.price ~= 0 then
		local var23, var24 = protoModule.writeTag(buff, var20, 2, protoModule.wireTypes.varint)
		var23, var40 = protoModule.writeVarInt(var23, var24, self.price)
		buff = var23
		var20 = var24
	end
	if self.selected ~= nil then
		local var25, var26 = protoModule.writeTag(buff, var20, 3, protoModule.wireTypes.varint)
		var25, var42 = protoModule.writeVarInt(var25, var26, if self.selected then 1 else 0)
		buff = var25
		var20 = var26
	end
	local buff_1 = buffer.create(var20)
	buffer.copy(buff_1, 0, buff, 0, var20)
	
	return buff_1
end

function t_2.decode(p2)
	-- upvalues: t_2 (ref), protoModule (ref)
	local var20 = t_2.new()
	local var21 = 0
	while var21 < buffer.len(p2) do
		local _ = nil
		local _ = nil
		local var22, var23, var24 = protoModule.readTag(p2, var21)
		local var25 = var22
		local var26 = var23
		var21 = var24
		
		if var26 == protoModule.wireTypes.varint then
			if var25 == 1 then
				local _ = nil
				local var27, var28 = protoModule.readVarIntI32(p2, var21)
				var21 = var28
				var20.days = var27
			elseif var25 == 2 then
				local _ = nil
				local var29, var30 = protoModule.readVarIntI64(p2, var21)
				var21 = var30
				var20.price = var29
			elseif var25 == 3 then
				local _ = nil
				local var31, var32 = protoModule.readVarInt(p2, var21)
				var21 = var32
				var20.selected = var31 ~= 0
			else
				local _ = nil
				local var33, var34 = protoModule.readVarInt(p2, var21)
				local _ = var33
				var21 = var34
			end
		elseif var26 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var35, var36 = protoModule.readVarInt(p2, var21)
			var21 = var36 + var35
		elseif var26 == protoModule.wireTypes.i32 then
			local _ = nil
			local var37, var38 = protoModule.readFixed32(p2, var21)
			local _ = var37
			var21 = var38
		elseif var26 == protoModule.wireTypes.i64 then
			local _ = nil
			local var39, var40 = protoModule.readFixed64(p2, var21)
			local _ = var39
			var21 = var40
		else
			error("Unsupported wire type: " .. var50)
		end
	end
	return var20
end

function t_2:jsonEncode()
	local t = {}
	
	if self.days ~= nil and self.days ~= 0 then
		t.days = self.days
	end
	if self.price ~= nil and self.price ~= 0 then
		t.price = self.price
	end
	if self.selected ~= nil then
		t.selected = self.selected
	end
	return t
end

function t_2:jsonDecode()
	-- upvalues: t_2 (ref)
	local var41 = t_2.new()
	
	if self.days ~= nil then
		var41.days = self.days
	end
	if self.price ~= nil then
		var41.price = self.price
	end
	if self.selected ~= nil then
		var41.selected = self.selected
	end
	return var41
end

t_2.descriptor = {
	name = "MarketplaceCatalogTimedOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceCatalogTimedOption"
}
t.MarketplaceCatalogTimedOption = t_2
typeRegistryModule.default:register(t.MarketplaceCatalogTimedOption)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p3)
	-- upvalues: t_3 (ref)
	return setmetatable({
		name = if p3 == nil or p3.name == nil then "" else p3.name,
		value = if p3 == nil or p3.value == nil then "" else p3.value
	}, t_3)
end

function t_3:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var41 = 0
	
	if self.name ~= nil and self.name ~= "" then
		local var42, var43 = protoModule.writeTag(buff, var41, 1, protoModule.wireTypes.lengthDelimited)
		var42, var70 = protoModule.writeString(var42, var43, self.name)
		buff = var42
		var41 = var43
	end
	if self.value ~= nil and self.value ~= "" then
		local var44, var45 = protoModule.writeTag(buff, var41, 2, protoModule.wireTypes.lengthDelimited)
		var44, var72 = protoModule.writeString(var44, var45, self.value)
		buff = var44
		var41 = var45
	end
	local buff_1 = buffer.create(var41)
	buffer.copy(buff_1, 0, buff, 0, var41)
	
	return buff_1
end

function t_3.decode(p3)
	-- upvalues: t_3 (ref), protoModule (ref)
	local var41 = t_3.new()
	local var42 = 0
	while var42 < buffer.len(p3) do
		local _ = nil
		local var43 = nil
		local var44, var45, var46 = protoModule.readTag(p3, var42)
		local var47 = var44
		var43 = var45
		var42 = var46
		
		if var43 == protoModule.wireTypes.varint then
			local _ = nil
			local var48, var49 = protoModule.readVarInt(p3, var42)
			local _ = var48
			var42 = var49
			continue
		end
		if var43 == protoModule.wireTypes.lengthDelimited then
			if var47 == 1 then
				local _ = nil
				local var50, var51 = protoModule.readBuffer(p3, var42)
				var42 = var51
				var41.name = buffer.tostring(var50)
			elseif var47 == 2 then
				local _ = nil
				local var52, var53 = protoModule.readBuffer(p3, var42)
				var42 = var53
				var41.value = buffer.tostring(var52)
			else
				local _ = nil
				local var54, var55 = protoModule.readVarInt(p3, var42)
				var42 = var55 + var54
			end
		elseif var43 == protoModule.wireTypes.i32 then
			local _ = nil
			local var56, var57 = protoModule.readFixed32(p3, var42)
			local _ = var56
			var42 = var57
		elseif var43 == protoModule.wireTypes.i64 then
			local _ = nil
			local var58, var59 = protoModule.readFixed64(p3, var42)
			local _ = var58
			var42 = var59
		else
			error("Unsupported wire type: " .. var76)
		end
	end
	return var41
end

function t_3:jsonEncode()
	local t = {}
	
	if self.name ~= nil and self.name ~= "" then
		t.name = self.name
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function t_3:jsonDecode()
	-- upvalues: t_3 (ref)
	local var60 = t_3.new()
	
	if self.name ~= nil then
		var60.name = self.name
	end
	if self.value ~= nil then
		var60.value = self.value
	end
	return var60
end

t_3.descriptor = {
	name = "MarketplaceCatalogVariantAttribute",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceCatalogVariantAttribute"
}
t.MarketplaceCatalogVariantAttribute = t_3
typeRegistryModule.default:register(t.MarketplaceCatalogVariantAttribute)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p4)
	-- upvalues: t_4 (ref)
	return setmetatable({
		id = if p4 == nil or p4.id == nil then "" else p4.id,
		asset_type = if p4 == nil or p4.asset_type == nil then nil else p4.asset_type,
		type = if p4 == nil or p4.type == nil then "" else p4.type
	}, t_4)
end

function t_4:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var60 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var61, var62 = protoModule.writeTag(buff, var60, 1, protoModule.wireTypes.lengthDelimited)
		var61, var98 = protoModule.writeString(var61, var62, self.id)
		buff = var61
		var60 = var62
	end
	if self.asset_type ~= nil then
		local var63, var64 = protoModule.writeTag(buff, var60, 2, protoModule.wireTypes.lengthDelimited)
		var63, var100 = protoModule.writeString(var63, var64, self.asset_type)
		buff = var63
		var60 = var64
	end
	if self.type ~= nil and self.type ~= "" then
		local var65, var66 = protoModule.writeTag(buff, var60, 3, protoModule.wireTypes.lengthDelimited)
		var65, var102 = protoModule.writeString(var65, var66, self.type)
		buff = var65
		var60 = var66
	end
	local buff_1 = buffer.create(var60)
	buffer.copy(buff_1, 0, buff, 0, var60)
	
	return buff_1
end

function t_4.decode(p4)
	-- upvalues: t_4 (ref), protoModule (ref)
	local var60 = t_4.new()
	local var61 = 0
	while var61 < buffer.len(p4) do
		local _ = nil
		local var62 = nil
		local var63, var64, var65 = protoModule.readTag(p4, var61)
		local var66 = var63
		var62 = var64
		var61 = var65
		
		if var62 == protoModule.wireTypes.varint then
			local _ = nil
			local var67, var68 = protoModule.readVarInt(p4, var61)
			local _ = var67
			var61 = var68
			continue
		end
		if var62 == protoModule.wireTypes.lengthDelimited then
			if var66 == 1 then
				local _ = nil
				local var69, var70 = protoModule.readBuffer(p4, var61)
				var61 = var70
				var60.id = buffer.tostring(var69)
			elseif var66 == 2 then
				local _ = nil
				local var71, var72 = protoModule.readBuffer(p4, var61)
				var61 = var72
				var60.asset_type = buffer.tostring(var71)
			elseif var66 == 3 then
				local _ = nil
				local var73, var74 = protoModule.readBuffer(p4, var61)
				var61 = var74
				var60.type = buffer.tostring(var73)
			else
				local _ = nil
				local var75, var76 = protoModule.readVarInt(p4, var61)
				var61 = var76 + var75
			end
		elseif var62 == protoModule.wireTypes.i32 then
			local _ = nil
			local var77, var78 = protoModule.readFixed32(p4, var61)
			local _ = var77
			var61 = var78
		elseif var62 == protoModule.wireTypes.i64 then
			local _ = nil
			local var79, var80 = protoModule.readFixed64(p4, var61)
			local _ = var79
			var61 = var80
		else
			error("Unsupported wire type: " .. var106)
		end
	end
	return var60
end

function t_4:jsonEncode()
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.asset_type ~= nil then
		t.assetType = self.asset_type
	end
	if self.type ~= nil and self.type ~= "" then
		t.type = self.type
	end
	return t
end

function t_4:jsonDecode()
	-- upvalues: t_4 (ref)
	local var81 = t_4.new()
	
	if self.id ~= nil then
		var81.id = self.id
	end
	if self.asset_type ~= nil then
		var81.asset_type = self.asset_type
	end
	if self.assetType ~= nil then
		var81.asset_type = self.assetType
	end
	if self.type ~= nil then
		var81.type = self.type
	end
	return var81
end

t_4.descriptor = {
	name = "MarketplaceCatalogBundledItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceCatalogBundledItem"
}
t.MarketplaceCatalogBundledItem = t_4
typeRegistryModule.default:register(t.MarketplaceCatalogBundledItem)

return {
	MarketplaceCatalogTaxonomyNode = t.MarketplaceCatalogTaxonomyNode,
	MarketplaceCatalogTimedOption = t.MarketplaceCatalogTimedOption,
	MarketplaceCatalogVariantAttribute = t.MarketplaceCatalogVariantAttribute,
	MarketplaceCatalogBundledItem = t.MarketplaceCatalogBundledItem
}