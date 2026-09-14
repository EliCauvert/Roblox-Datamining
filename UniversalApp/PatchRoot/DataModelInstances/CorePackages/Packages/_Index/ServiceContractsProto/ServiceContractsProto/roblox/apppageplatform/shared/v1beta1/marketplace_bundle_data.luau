local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local _ = require(script.Parent.custom_options)
local marketplaceCatalogItemCommonModule = require(script.Parent.marketplace_catalog_item_common)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
		id = if p1 == nil or p1.id == nil then "" else p1.id,
		name = if p1 == nil or p1.name == nil then "" else p1.name,
		creator_name = if p1 == nil or p1.creator_name == nil then "" else p1.creator_name,
		creator_has_verified_badge = if p1 == nil or p1.creator_has_verified_badge == nil then false else p1.creator_has_verified_badge,
		bundle_type = if p1 == nil or p1.bundle_type == nil then "" else p1.bundle_type,
		price = if p1 == nil or p1.price == nil then 0 else p1.price,
		description = if p1 == nil or p1.description == nil then nil else p1.description,
		creator_id = if p1 == nil or p1.creator_id == nil then nil else p1.creator_id,
		creator_type = if p1 == nil or p1.creator_type == nil then nil else p1.creator_type,
		creating_universe_id = if p1 == nil or p1.creating_universe_id == nil then nil else p1.creating_universe_id,
		taxonomy = if p1 == nil or p1.taxonomy == nil then {} else p1.taxonomy,
		render_properties = if p1 == nil or p1.render_properties == nil then {} else p1.render_properties,
		item_restrictions = if p1 == nil or p1.item_restrictions == nil then {} else p1.item_restrictions,
		is_high_definition = if p1 == nil or p1.is_high_definition == nil then nil else p1.is_high_definition,
		is_pbr = if p1 == nil or p1.is_pbr == nil then nil else p1.is_pbr,
		has_resellers = if p1 == nil or p1.has_resellers == nil then nil else p1.has_resellers,
		lowest_price = if p1 == nil or p1.lowest_price == nil then nil else p1.lowest_price,
		lowest_resale_price = if p1 == nil or p1.lowest_resale_price == nil then nil else p1.lowest_resale_price,
		total_quantity = if p1 == nil or p1.total_quantity == nil then nil else p1.total_quantity,
		units_available_for_consumption = if p1 == nil or p1.units_available_for_consumption == nil then nil else p1.units_available_for_consumption,
		favorite_count = if p1 == nil or p1.favorite_count == nil then nil else p1.favorite_count,
		timed_options = if p1 == nil or p1.timed_options == nil then {} else p1.timed_options,
		collectible_item_id = if p1 == nil or p1.collectible_item_id == nil then nil else p1.collectible_item_id,
		is_off_sale = if p1 == nil or p1.is_off_sale == nil then nil else p1.is_off_sale,
		sale_location_type = if p1 == nil or p1.sale_location_type == nil then nil else p1.sale_location_type,
		item_status = if p1 == nil or p1.item_status == nil then {} else p1.item_status,
		price_status = if p1 == nil or p1.price_status == nil then nil else p1.price_status,
		product_id = if p1 == nil or p1.product_id == nil then nil else p1.product_id,
		owned = if p1 == nil or p1.owned == nil then nil else p1.owned,
		is_purchasable = if p1 == nil or p1.is_purchasable == nil then nil else p1.is_purchasable,
		variant_attributes = if p1 == nil or p1.variant_attributes == nil then {} else p1.variant_attributes,
		genres = if p1 == nil or p1.genres == nil then {} else p1.genres,
		bundled_items = if p1 == nil or p1.bundled_items == nil then {} else p1.bundled_items,
		is_recolorable = if p1 == nil or p1.is_recolorable == nil then nil else p1.is_recolorable
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var8 = protoModule.writeString(var2, var3, self.id)
		buff = var2
		var1 = var3
	end
	if self.name ~= nil and self.name ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var10 = protoModule.writeString(var4, var5, self.name)
		buff = var4
		var1 = var5
	end
	if self.creator_name ~= nil and self.creator_name ~= "" then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var6, var12 = protoModule.writeString(var6, var7, self.creator_name)
		buff = var6
		var1 = var7
	end
	if self.creator_has_verified_badge then
		local var8, var9 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.varint)
		var8, var14 = protoModule.writeVarInt(var8, var9, if self.creator_has_verified_badge then 1 else 0)
		buff = var8
		var1 = var9
	end
	if self.bundle_type ~= nil and self.bundle_type ~= "" then
		local var10, var11 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
		var10, var16 = protoModule.writeString(var10, var11, self.bundle_type)
		buff = var10
		var1 = var11
	end
	if self.price ~= nil and self.price ~= 0 then
		local var12, var13 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.varint)
		var12, var18 = protoModule.writeVarInt(var12, var13, self.price)
		buff = var12
		var1 = var13
	end
	if self.description ~= nil then
		local var14, var15 = protoModule.writeTag(buff, var1, 7, protoModule.wireTypes.lengthDelimited)
		var14, var20 = protoModule.writeString(var14, var15, self.description)
		buff = var14
		var1 = var15
	end
	if self.creator_id ~= nil then
		local var16, var17 = protoModule.writeTag(buff, var1, 8, protoModule.wireTypes.lengthDelimited)
		var16, var22 = protoModule.writeString(var16, var17, self.creator_id)
		buff = var16
		var1 = var17
	end
	if self.creator_type ~= nil then
		local var18, var19 = protoModule.writeTag(buff, var1, 9, protoModule.wireTypes.lengthDelimited)
		var18, var24 = protoModule.writeString(var18, var19, self.creator_type)
		buff = var18
		var1 = var19
	end
	if self.creating_universe_id ~= nil then
		local var20, var21 = protoModule.writeTag(buff, var1, 10, protoModule.wireTypes.lengthDelimited)
		var20, var26 = protoModule.writeString(var20, var21, self.creating_universe_id)
		buff = var20
		var1 = var21
	end
	if self.taxonomy ~= nil and #self.taxonomy > 0 then
		for i, v in self.taxonomy do
			local var22 = v:encode()
			local var23, var24 = protoModule.writeTag(buff, var1, 11, protoModule.wireTypes.lengthDelimited)
			var23, var29 = protoModule.writeBuffer(var23, var24, var22, buffer.len(var22))
			buff = var23
			var1 = var24
		end
	end
	if self.render_properties ~= nil and #self.render_properties > 0 then
		for i, v in self.render_properties do
			local var25, var26 = protoModule.writeTag(buff, var1, 12, protoModule.wireTypes.lengthDelimited)
			var25, var31 = protoModule.writeString(var25, var26, v)
			buff = var25
			var1 = var26
		end
	end
	if self.item_restrictions ~= nil and #self.item_restrictions > 0 then
		for i, v in self.item_restrictions do
			local var27, var28 = protoModule.writeTag(buff, var1, 13, protoModule.wireTypes.lengthDelimited)
			var27, var33 = protoModule.writeString(var27, var28, v)
			buff = var27
			var1 = var28
		end
	end
	if self.is_high_definition ~= nil then
		local var29, var30 = protoModule.writeTag(buff, var1, 14, protoModule.wireTypes.varint)
		var29, var35 = protoModule.writeVarInt(var29, var30, if self.is_high_definition then 1 else 0)
		buff = var29
		var1 = var30
	end
	if self.is_pbr ~= nil then
		local var31, var32 = protoModule.writeTag(buff, var1, 15, protoModule.wireTypes.varint)
		var31, var37 = protoModule.writeVarInt(var31, var32, if self.is_pbr then 1 else 0)
		buff = var31
		var1 = var32
	end
	if self.has_resellers ~= nil then
		local var33, var34 = protoModule.writeTag(buff, var1, 16, protoModule.wireTypes.varint)
		var33, var39 = protoModule.writeVarInt(var33, var34, if self.has_resellers then 1 else 0)
		buff = var33
		var1 = var34
	end
	if self.lowest_price ~= nil then
		local var35, var36 = protoModule.writeTag(buff, var1, 17, protoModule.wireTypes.varint)
		var35, var41 = protoModule.writeVarInt(var35, var36, self.lowest_price)
		buff = var35
		var1 = var36
	end
	if self.lowest_resale_price ~= nil then
		local var37, var38 = protoModule.writeTag(buff, var1, 18, protoModule.wireTypes.varint)
		var37, var43 = protoModule.writeVarInt(var37, var38, self.lowest_resale_price)
		buff = var37
		var1 = var38
	end
	if self.total_quantity ~= nil then
		local var39, var40 = protoModule.writeTag(buff, var1, 19, protoModule.wireTypes.varint)
		var39, var45 = protoModule.writeVarInt(var39, var40, self.total_quantity)
		buff = var39
		var1 = var40
	end
	if self.units_available_for_consumption ~= nil then
		local var41, var42 = protoModule.writeTag(buff, var1, 20, protoModule.wireTypes.varint)
		var41, var47 = protoModule.writeVarInt(var41, var42, self.units_available_for_consumption)
		buff = var41
		var1 = var42
	end
	if self.favorite_count ~= nil then
		local var43, var44 = protoModule.writeTag(buff, var1, 21, protoModule.wireTypes.varint)
		var43, var49 = protoModule.writeVarInt(var43, var44, self.favorite_count)
		buff = var43
		var1 = var44
	end
	if self.timed_options ~= nil and #self.timed_options > 0 then
		for i, v in self.timed_options do
			local var45 = v:encode()
			local var46, var47 = protoModule.writeTag(buff, var1, 22, protoModule.wireTypes.lengthDelimited)
			var46, var52 = protoModule.writeBuffer(var46, var47, var45, buffer.len(var45))
			buff = var46
			var1 = var47
		end
	end
	if self.collectible_item_id ~= nil then
		local var48, var49 = protoModule.writeTag(buff, var1, 23, protoModule.wireTypes.lengthDelimited)
		var48, var54 = protoModule.writeString(var48, var49, self.collectible_item_id)
		buff = var48
		var1 = var49
	end
	if self.is_off_sale ~= nil then
		local var50, var51 = protoModule.writeTag(buff, var1, 24, protoModule.wireTypes.varint)
		var50, var56 = protoModule.writeVarInt(var50, var51, if self.is_off_sale then 1 else 0)
		buff = var50
		var1 = var51
	end
	if self.sale_location_type ~= nil then
		local var52, var53 = protoModule.writeTag(buff, var1, 25, protoModule.wireTypes.lengthDelimited)
		var52, var58 = protoModule.writeString(var52, var53, self.sale_location_type)
		buff = var52
		var1 = var53
	end
	if self.item_status ~= nil and #self.item_status > 0 then
		for i, v in self.item_status do
			local var54, var55 = protoModule.writeTag(buff, var1, 26, protoModule.wireTypes.lengthDelimited)
			var54, var60 = protoModule.writeString(var54, var55, v)
			buff = var54
			var1 = var55
		end
	end
	if self.price_status ~= nil then
		local var56, var57 = protoModule.writeTag(buff, var1, 27, protoModule.wireTypes.lengthDelimited)
		var56, var62 = protoModule.writeString(var56, var57, self.price_status)
		buff = var56
		var1 = var57
	end
	if self.product_id ~= nil then
		local var58, var59 = protoModule.writeTag(buff, var1, 28, protoModule.wireTypes.lengthDelimited)
		var58, var64 = protoModule.writeString(var58, var59, self.product_id)
		buff = var58
		var1 = var59
	end
	if self.owned ~= nil then
		local var60, var61 = protoModule.writeTag(buff, var1, 29, protoModule.wireTypes.varint)
		var60, var66 = protoModule.writeVarInt(var60, var61, if self.owned then 1 else 0)
		buff = var60
		var1 = var61
	end
	if self.is_purchasable ~= nil then
		local var62, var63 = protoModule.writeTag(buff, var1, 30, protoModule.wireTypes.varint)
		var62, var68 = protoModule.writeVarInt(var62, var63, if self.is_purchasable then 1 else 0)
		buff = var62
		var1 = var63
	end
	if self.variant_attributes ~= nil and #self.variant_attributes > 0 then
		for i, v in self.variant_attributes do
			local var64 = v:encode()
			local var65, var66 = protoModule.writeTag(buff, var1, 31, protoModule.wireTypes.lengthDelimited)
			var65, var71 = protoModule.writeBuffer(var65, var66, var64, buffer.len(var64))
			buff = var65
			var1 = var66
		end
	end
	if self.genres ~= nil and #self.genres > 0 then
		for i, v in self.genres do
			local var67, var68 = protoModule.writeTag(buff, var1, 32, protoModule.wireTypes.lengthDelimited)
			var67, var73 = protoModule.writeString(var67, var68, v)
			buff = var67
			var1 = var68
		end
	end
	if self.bundled_items ~= nil and #self.bundled_items > 0 then
		for i, v in self.bundled_items do
			local var69 = v:encode()
			local var70, var71 = protoModule.writeTag(buff, var1, 33, protoModule.wireTypes.lengthDelimited)
			var70, var76 = protoModule.writeBuffer(var70, var71, var69, buffer.len(var69))
			buff = var70
			var1 = var71
		end
	end
	if self.is_recolorable ~= nil then
		local var72, var73 = protoModule.writeTag(buff, var1, 34, protoModule.wireTypes.varint)
		var72, var78 = protoModule.writeVarInt(var72, var73, if self.is_recolorable then 1 else 0)
		buff = var72
		var1 = var73
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref), marketplaceCatalogItemCommonModule (ref)
	local var74 = t_1.new()
	local var75 = 0
	while var75 < buffer.len(p1) do
		local _ = nil
		local var76 = nil
		local var77, var78, var79 = protoModule.readTag(p1, var75)
		local var80 = var77
		var76 = var78
		var75 = var79
		
		if var76 == protoModule.wireTypes.varint then
			if var80 == 4 then
				local _ = nil
				local var81, var82 = protoModule.readVarInt(p1, var75)
				var75 = var82
				var74.creator_has_verified_badge = var81 ~= 0
			elseif var80 == 6 then
				local _ = nil
				local var83, var84 = protoModule.readVarIntI64(p1, var75)
				var75 = var84
				var74.price = var83
			elseif var80 == 14 then
				local _ = nil
				local var85, var86 = protoModule.readVarInt(p1, var75)
				var75 = var86
				var74.is_high_definition = var85 ~= 0
			elseif var80 == 15 then
				local _ = nil
				local var87, var88 = protoModule.readVarInt(p1, var75)
				var75 = var88
				var74.is_pbr = var87 ~= 0
			elseif var80 == 16 then
				local _ = nil
				local var89, var90 = protoModule.readVarInt(p1, var75)
				var75 = var90
				var74.has_resellers = var89 ~= 0
			elseif var80 == 17 then
				local _ = nil
				local var91, var92 = protoModule.readVarIntI64(p1, var75)
				var75 = var92
				var74.lowest_price = var91
			elseif var80 == 18 then
				local _ = nil
				local var93, var94 = protoModule.readVarIntI64(p1, var75)
				var75 = var94
				var74.lowest_resale_price = var93
			elseif var80 == 19 then
				local _ = nil
				local var95, var96 = protoModule.readVarIntI64(p1, var75)
				var75 = var96
				var74.total_quantity = var95
			elseif var80 == 20 then
				local _ = nil
				local var97, var98 = protoModule.readVarIntI64(p1, var75)
				var75 = var98
				var74.units_available_for_consumption = var97
			elseif var80 == 21 then
				local _ = nil
				local var99, var100 = protoModule.readVarIntI32(p1, var75)
				var75 = var100
				var74.favorite_count = var99
			elseif var80 == 24 then
				local _ = nil
				local var101, var102 = protoModule.readVarInt(p1, var75)
				var75 = var102
				var74.is_off_sale = var101 ~= 0
			elseif var80 == 29 then
				local _ = nil
				local var103, var104 = protoModule.readVarInt(p1, var75)
				var75 = var104
				var74.owned = var103 ~= 0
			elseif var80 == 30 then
				local _ = nil
				local var105, var106 = protoModule.readVarInt(p1, var75)
				var75 = var106
				var74.is_purchasable = var105 ~= 0
			elseif var80 == 34 then
				local _ = nil
				local var107, var108 = protoModule.readVarInt(p1, var75)
				var75 = var108
				var74.is_recolorable = var107 ~= 0
			else
				local _ = nil
				local var109, var110 = protoModule.readVarInt(p1, var75)
				local _ = var109
				var75 = var110
			end
		end
		if var76 == protoModule.wireTypes.lengthDelimited then
			if var80 == 1 then
				local _ = nil
				local var111, var112 = protoModule.readBuffer(p1, var75)
				var75 = var112
				var74.id = buffer.tostring(var111)
			elseif var80 == 2 then
				local _ = nil
				local var113, var114 = protoModule.readBuffer(p1, var75)
				var75 = var114
				var74.name = buffer.tostring(var113)
			elseif var80 == 3 then
				local _ = nil
				local var115, var116 = protoModule.readBuffer(p1, var75)
				var75 = var116
				var74.creator_name = buffer.tostring(var115)
			elseif var80 == 5 then
				local _ = nil
				local var117, var118 = protoModule.readBuffer(p1, var75)
				var75 = var118
				var74.bundle_type = buffer.tostring(var117)
			elseif var80 == 7 then
				local _ = nil
				local var119, var120 = protoModule.readBuffer(p1, var75)
				var75 = var120
				var74.description = buffer.tostring(var119)
			elseif var80 == 8 then
				local _ = nil
				local var121, var122 = protoModule.readBuffer(p1, var75)
				var75 = var122
				var74.creator_id = buffer.tostring(var121)
			elseif var80 == 9 then
				local _ = nil
				local var123, var124 = protoModule.readBuffer(p1, var75)
				var75 = var124
				var74.creator_type = buffer.tostring(var123)
			elseif var80 == 10 then
				local _ = nil
				local var125, var126 = protoModule.readBuffer(p1, var75)
				var75 = var126
				var74.creating_universe_id = buffer.tostring(var125)
			elseif var80 == 11 then
				local _ = nil
				local var127, var128 = protoModule.readBuffer(p1, var75)
				var75 = var128
				table.insert(var74.taxonomy, marketplaceCatalogItemCommonModule.MarketplaceCatalogTaxonomyNode.decode(var127))
			elseif var80 == 12 then
				local _ = nil
				local var129, var130 = protoModule.readBuffer(p1, var75)
				var75 = var130
				table.insert(var74.render_properties, buffer.tostring(var129))
			elseif var80 == 13 then
				local _ = nil
				local var131, var132 = protoModule.readBuffer(p1, var75)
				var75 = var132
				table.insert(var74.item_restrictions, buffer.tostring(var131))
			elseif var80 == 22 then
				local _ = nil
				local var133, var134 = protoModule.readBuffer(p1, var75)
				var75 = var134
				table.insert(var74.timed_options, marketplaceCatalogItemCommonModule.MarketplaceCatalogTimedOption.decode(var133))
			elseif var80 == 23 then
				local _ = nil
				local var135, var136 = protoModule.readBuffer(p1, var75)
				var75 = var136
				var74.collectible_item_id = buffer.tostring(var135)
			elseif var80 == 25 then
				local _ = nil
				local var137, var138 = protoModule.readBuffer(p1, var75)
				var75 = var138
				var74.sale_location_type = buffer.tostring(var137)
			elseif var80 == 26 then
				local _ = nil
				local var139, var140 = protoModule.readBuffer(p1, var75)
				var75 = var140
				table.insert(var74.item_status, buffer.tostring(var139))
			elseif var80 == 27 then
				local _ = nil
				local var141, var142 = protoModule.readBuffer(p1, var75)
				var75 = var142
				var74.price_status = buffer.tostring(var141)
			elseif var80 == 28 then
				local _ = nil
				local var143, var144 = protoModule.readBuffer(p1, var75)
				var75 = var144
				var74.product_id = buffer.tostring(var143)
			elseif var80 == 31 then
				local _ = nil
				local var145, var146 = protoModule.readBuffer(p1, var75)
				var75 = var146
				table.insert(var74.variant_attributes, marketplaceCatalogItemCommonModule.MarketplaceCatalogVariantAttribute.decode(var145))
			elseif var80 == 32 then
				local _ = nil
				local var147, var148 = protoModule.readBuffer(p1, var75)
				var75 = var148
				table.insert(var74.genres, buffer.tostring(var147))
			elseif var80 == 33 then
				local _ = nil
				local var149, var150 = protoModule.readBuffer(p1, var75)
				var75 = var150
				table.insert(var74.bundled_items, marketplaceCatalogItemCommonModule.MarketplaceCatalogBundledItem.decode(var149))
			else
				local _ = nil
				local var151, var152 = protoModule.readVarInt(p1, var75)
				var75 = var152 + var151
			end
		elseif var76 == protoModule.wireTypes.i32 then
			local _ = nil
			local var153, var154 = protoModule.readFixed32(p1, var75)
			local _ = var153
			var75 = var154
		elseif var76 == protoModule.wireTypes.i64 then
			local _ = nil
			local var155, var156 = protoModule.readFixed64(p1, var75)
			local _ = var155
			var75 = var156
		else
			error("Unsupported wire type: " .. var82)
		end
	end
	return var74
end

function t_1:jsonEncode()
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.name ~= nil and self.name ~= "" then
		t.name = self.name
	end
	if self.creator_name ~= nil and self.creator_name ~= "" then
		t.creatorName = self.creator_name
	end
	if self.creator_has_verified_badge then
		t.creatorHasVerifiedBadge = self.creator_has_verified_badge
	end
	if self.bundle_type ~= nil and self.bundle_type ~= "" then
		t.bundleType = self.bundle_type
	end
	if self.price ~= nil and self.price ~= 0 then
		t.price = self.price
	end
	if self.description ~= nil then
		t.description = self.description
	end
	if self.creator_id ~= nil then
		t.creatorId = self.creator_id
	end
	if self.creator_type ~= nil then
		t.creatorType = self.creator_type
	end
	if self.creating_universe_id ~= nil then
		t.creatingUniverseId = self.creating_universe_id
	end
	if self.taxonomy ~= nil and #self.taxonomy > 0 then
		local t_1 = {}
		
		for i, v in self.taxonomy do
			table.insert(t_1, v:jsonEncode())
		end
		t.taxonomy = t_1
	end
	if self.render_properties ~= nil and #self.render_properties > 0 then
		local t_1 = {}
		
		for i, v in self.render_properties do
			table.insert(t_1, v)
		end
		t.renderProperties = t_1
	end
	if self.item_restrictions ~= nil and #self.item_restrictions > 0 then
		local t_1 = {}
		
		for i, v in self.item_restrictions do
			table.insert(t_1, v)
		end
		t.itemRestrictions = t_1
	end
	if self.is_high_definition ~= nil then
		t.isHighDefinition = self.is_high_definition
	end
	if self.is_pbr ~= nil then
		t.isPbr = self.is_pbr
	end
	if self.has_resellers ~= nil then
		t.hasResellers = self.has_resellers
	end
	if self.lowest_price ~= nil then
		t.lowestPrice = self.lowest_price
	end
	if self.lowest_resale_price ~= nil then
		t.lowestResalePrice = self.lowest_resale_price
	end
	if self.total_quantity ~= nil then
		t.totalQuantity = self.total_quantity
	end
	if self.units_available_for_consumption ~= nil then
		t.unitsAvailableForConsumption = self.units_available_for_consumption
	end
	if self.favorite_count ~= nil then
		t.favoriteCount = self.favorite_count
	end
	if self.timed_options ~= nil and #self.timed_options > 0 then
		local t_1 = {}
		
		for i, v in self.timed_options do
			table.insert(t_1, v:jsonEncode())
		end
		t.timedOptions = t_1
	end
	if self.collectible_item_id ~= nil then
		t.collectibleItemId = self.collectible_item_id
	end
	if self.is_off_sale ~= nil then
		t.isOffSale = self.is_off_sale
	end
	if self.sale_location_type ~= nil then
		t.saleLocationType = self.sale_location_type
	end
	if self.item_status ~= nil and #self.item_status > 0 then
		local t_1 = {}
		
		for i, v in self.item_status do
			table.insert(t_1, v)
		end
		t.itemStatus = t_1
	end
	if self.price_status ~= nil then
		t.priceStatus = self.price_status
	end
	if self.product_id ~= nil then
		t.productId = self.product_id
	end
	if self.owned ~= nil then
		t.owned = self.owned
	end
	if self.is_purchasable ~= nil then
		t.isPurchasable = self.is_purchasable
	end
	if self.variant_attributes ~= nil and #self.variant_attributes > 0 then
		local t_1 = {}
		
		for i, v in self.variant_attributes do
			table.insert(t_1, v:jsonEncode())
		end
		t.variantAttributes = t_1
	end
	if self.genres ~= nil and #self.genres > 0 then
		local t_1 = {}
		
		for i, v in self.genres do
			table.insert(t_1, v)
		end
		t.genres = t_1
	end
	if self.bundled_items ~= nil and #self.bundled_items > 0 then
		local t_1 = {}
		
		for i, v in self.bundled_items do
			table.insert(t_1, v:jsonEncode())
		end
		t.bundledItems = t_1
	end
	if self.is_recolorable ~= nil then
		t.isRecolorable = self.is_recolorable
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref), marketplaceCatalogItemCommonModule (ref)
	local var157 = t_1.new()
	
	if self.id ~= nil then
		var157.id = self.id
	end
	if self.name ~= nil then
		var157.name = self.name
	end
	if self.creator_name ~= nil then
		var157.creator_name = self.creator_name
	end
	if self.creatorName ~= nil then
		var157.creator_name = self.creatorName
	end
	if self.creator_has_verified_badge ~= nil then
		var157.creator_has_verified_badge = self.creator_has_verified_badge
	end
	if self.creatorHasVerifiedBadge ~= nil then
		var157.creator_has_verified_badge = self.creatorHasVerifiedBadge
	end
	if self.bundle_type ~= nil then
		var157.bundle_type = self.bundle_type
	end
	if self.bundleType ~= nil then
		var157.bundle_type = self.bundleType
	end
	if self.price ~= nil then
		var157.price = self.price
	end
	if self.description ~= nil then
		var157.description = self.description
	end
	if self.creator_id ~= nil then
		var157.creator_id = self.creator_id
	end
	if self.creatorId ~= nil then
		var157.creator_id = self.creatorId
	end
	if self.creator_type ~= nil then
		var157.creator_type = self.creator_type
	end
	if self.creatorType ~= nil then
		var157.creator_type = self.creatorType
	end
	if self.creating_universe_id ~= nil then
		var157.creating_universe_id = self.creating_universe_id
	end
	if self.creatingUniverseId ~= nil then
		var157.creating_universe_id = self.creatingUniverseId
	end
	if self.taxonomy ~= nil then
		local t = {}
		
		for i, v in self.taxonomy do
			table.insert(t, marketplaceCatalogItemCommonModule.MarketplaceCatalogTaxonomyNode.jsonDecode(v))
		end
		var157.taxonomy = t
	end
	if self.render_properties ~= nil then
		local t = {}
		
		for i, v in self.render_properties do
			table.insert(t, v)
		end
		var157.render_properties = t
	end
	if self.renderProperties ~= nil then
		local t = {}
		
		for i, v in self.renderProperties do
			table.insert(t, v)
		end
		var157.render_properties = t
	end
	if self.item_restrictions ~= nil then
		local t = {}
		
		for i, v in self.item_restrictions do
			table.insert(t, v)
		end
		var157.item_restrictions = t
	end
	if self.itemRestrictions ~= nil then
		local t = {}
		
		for i, v in self.itemRestrictions do
			table.insert(t, v)
		end
		var157.item_restrictions = t
	end
	if self.is_high_definition ~= nil then
		var157.is_high_definition = self.is_high_definition
	end
	if self.isHighDefinition ~= nil then
		var157.is_high_definition = self.isHighDefinition
	end
	if self.is_pbr ~= nil then
		var157.is_pbr = self.is_pbr
	end
	if self.isPbr ~= nil then
		var157.is_pbr = self.isPbr
	end
	if self.has_resellers ~= nil then
		var157.has_resellers = self.has_resellers
	end
	if self.hasResellers ~= nil then
		var157.has_resellers = self.hasResellers
	end
	if self.lowest_price ~= nil then
		var157.lowest_price = self.lowest_price
	end
	if self.lowestPrice ~= nil then
		var157.lowest_price = self.lowestPrice
	end
	if self.lowest_resale_price ~= nil then
		var157.lowest_resale_price = self.lowest_resale_price
	end
	if self.lowestResalePrice ~= nil then
		var157.lowest_resale_price = self.lowestResalePrice
	end
	if self.total_quantity ~= nil then
		var157.total_quantity = self.total_quantity
	end
	if self.totalQuantity ~= nil then
		var157.total_quantity = self.totalQuantity
	end
	if self.units_available_for_consumption ~= nil then
		var157.units_available_for_consumption = self.units_available_for_consumption
	end
	if self.unitsAvailableForConsumption ~= nil then
		var157.units_available_for_consumption = self.unitsAvailableForConsumption
	end
	if self.favorite_count ~= nil then
		var157.favorite_count = self.favorite_count
	end
	if self.favoriteCount ~= nil then
		var157.favorite_count = self.favoriteCount
	end
	if self.timed_options ~= nil then
		local t = {}
		
		for i, v in self.timed_options do
			table.insert(t, marketplaceCatalogItemCommonModule.MarketplaceCatalogTimedOption.jsonDecode(v))
		end
		var157.timed_options = t
	end
	if self.timedOptions ~= nil then
		local t = {}
		
		for i, v in self.timedOptions do
			table.insert(t, marketplaceCatalogItemCommonModule.MarketplaceCatalogTimedOption.jsonDecode(v))
		end
		var157.timed_options = t
	end
	if self.collectible_item_id ~= nil then
		var157.collectible_item_id = self.collectible_item_id
	end
	if self.collectibleItemId ~= nil then
		var157.collectible_item_id = self.collectibleItemId
	end
	if self.is_off_sale ~= nil then
		var157.is_off_sale = self.is_off_sale
	end
	if self.isOffSale ~= nil then
		var157.is_off_sale = self.isOffSale
	end
	if self.sale_location_type ~= nil then
		var157.sale_location_type = self.sale_location_type
	end
	if self.saleLocationType ~= nil then
		var157.sale_location_type = self.saleLocationType
	end
	if self.item_status ~= nil then
		local t = {}
		
		for i, v in self.item_status do
			table.insert(t, v)
		end
		var157.item_status = t
	end
	if self.itemStatus ~= nil then
		local t = {}
		
		for i, v in self.itemStatus do
			table.insert(t, v)
		end
		var157.item_status = t
	end
	if self.price_status ~= nil then
		var157.price_status = self.price_status
	end
	if self.priceStatus ~= nil then
		var157.price_status = self.priceStatus
	end
	if self.product_id ~= nil then
		var157.product_id = self.product_id
	end
	if self.productId ~= nil then
		var157.product_id = self.productId
	end
	if self.owned ~= nil then
		var157.owned = self.owned
	end
	if self.is_purchasable ~= nil then
		var157.is_purchasable = self.is_purchasable
	end
	if self.isPurchasable ~= nil then
		var157.is_purchasable = self.isPurchasable
	end
	if self.variant_attributes ~= nil then
		local t = {}
		
		for i, v in self.variant_attributes do
			table.insert(t, marketplaceCatalogItemCommonModule.MarketplaceCatalogVariantAttribute.jsonDecode(v))
		end
		var157.variant_attributes = t
	end
	if self.variantAttributes ~= nil then
		local t = {}
		
		for i, v in self.variantAttributes do
			table.insert(t, marketplaceCatalogItemCommonModule.MarketplaceCatalogVariantAttribute.jsonDecode(v))
		end
		var157.variant_attributes = t
	end
	if self.genres ~= nil then
		local t = {}
		
		for i, v in self.genres do
			table.insert(t, v)
		end
		var157.genres = t
	end
	if self.bundled_items ~= nil then
		local t = {}
		
		for i, v in self.bundled_items do
			table.insert(t, marketplaceCatalogItemCommonModule.MarketplaceCatalogBundledItem.jsonDecode(v))
		end
		var157.bundled_items = t
	end
	if self.bundledItems ~= nil then
		local t = {}
		
		for i, v in self.bundledItems do
			table.insert(t, marketplaceCatalogItemCommonModule.MarketplaceCatalogBundledItem.jsonDecode(v))
		end
		var157.bundled_items = t
	end
	if self.is_recolorable ~= nil then
		var157.is_recolorable = self.is_recolorable
	end
	if self.isRecolorable ~= nil then
		var157.is_recolorable = self.isRecolorable
	end
	return var157
end

t_1.descriptor = {
	name = "MarketplaceBundleData",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceBundleData"
}
t.MarketplaceBundleData = t_1
typeRegistryModule.default:register(t.MarketplaceBundleData)

return { MarketplaceBundleData = t.MarketplaceBundleData }