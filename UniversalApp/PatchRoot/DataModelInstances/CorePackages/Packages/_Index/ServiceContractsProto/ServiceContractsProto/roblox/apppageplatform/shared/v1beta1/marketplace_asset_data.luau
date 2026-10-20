local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local _ = require(script.Parent.custom_options)
local MarketplaceCatalogItemCommonModule = require(script.Parent.marketplace_catalog_item_common)
local Module = {}
Module.__index = Module

function Module.new(p1)
	-- upvalues: Module (copy)
	return (setmetatable({
		id = if p1 == nil or p1.id == nil then "" else p1.id,
		name = if p1 == nil or p1.name == nil then "" else p1.name,
		creator_name = if p1 == nil or p1.creator_name == nil then "" else p1.creator_name,
		creator_has_verified_badge = p1 ~= nil and p1.creator_has_verified_badge ~= nil and p1.creator_has_verified_badge,
		asset_type = if p1 == nil or p1.asset_type == nil then "" else p1.asset_type,
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
		genres = if p1 == nil or p1.genres == nil then {} else p1.genres
	}, Module))
end

function Module:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.id ~= nil and self.id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.id)
	end
	if self.name ~= nil and self.name ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.name)
	end
	if self.creator_name ~= nil and self.creator_name ~= "" then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult5, WriteTagResult2_4, self.creator_name)
	end
	if self.creator_has_verified_badge then
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult6, WriteTagResult2_5, if self.creator_has_verified_badge then 1 else 0)
	end
	if self.asset_type ~= nil and self.asset_type ~= "" then
		local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult7, WriteTagResult2_6, self.asset_type)
	end
	if self.price ~= nil and self.price ~= 0 then
		local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult8, WriteTagResult2_7, self.price)
	end
	if self.description ~= nil then
		local WriteTagResult9, WriteTagResult2_8 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult9, WriteTagResult2_8, self.description)
	end
	if self.creator_id ~= nil then
		local WriteTagResult10, WriteTagResult2_9 = ProtoModule.writeTag(Buf, Count, 8, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult10, WriteTagResult2_9, self.creator_id)
	end
	if self.creator_type ~= nil then
		local WriteTagResult11, WriteTagResult2_10 = ProtoModule.writeTag(Buf, Count, 9, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult11, WriteTagResult2_10, self.creator_type)
	end
	if self.creating_universe_id ~= nil then
		local WriteTagResult12, WriteTagResult2_11 = ProtoModule.writeTag(Buf, Count, 10, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult12, WriteTagResult2_11, self.creating_universe_id)
	end
	if self.taxonomy ~= nil and #self.taxonomy > 0 then
		for _, value in self.taxonomy do
			local EncodeResult = value:encode()
			local WriteTagResult13, WriteTagResult2_12 = ProtoModule.writeTag(Buf, Count, 11, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult13, WriteTagResult2_12, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.render_properties ~= nil and #self.render_properties > 0 then
		for _, renderProperty in self.render_properties do
			local WriteTagResult15, WriteTagResult2_14 = ProtoModule.writeTag(Buf, Count, 12, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult15, WriteTagResult2_14, renderProperty)
		end
	end
	if self.item_restrictions ~= nil and #self.item_restrictions > 0 then
		for _, itemRestriction in self.item_restrictions do
			local WriteTagResult19, WriteTagResult2_18 = ProtoModule.writeTag(Buf, Count, 13, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult19, WriteTagResult2_18, itemRestriction)
		end
	end
	if self.is_high_definition ~= nil then
		local WriteTagResult22, WriteTagResult2_21 = ProtoModule.writeTag(Buf, Count, 14, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult22, WriteTagResult2_21, if self.is_high_definition then 1 else 0)
	end
	if self.is_pbr ~= nil then
		local WriteTagResult23, WriteTagResult2_22 = ProtoModule.writeTag(Buf, Count, 15, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult23, WriteTagResult2_22, if self.is_pbr then 1 else 0)
	end
	if self.has_resellers ~= nil then
		local WriteTagResult24, WriteTagResult2_23 = ProtoModule.writeTag(Buf, Count, 16, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult24, WriteTagResult2_23, if self.has_resellers then 1 else 0)
	end
	if self.lowest_price ~= nil then
		local WriteTagResult17, WriteTagResult2_16 = ProtoModule.writeTag(Buf, Count, 17, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult17, WriteTagResult2_16, self.lowest_price)
	end
	if self.lowest_resale_price ~= nil then
		local WriteTagResult20, WriteTagResult2_19 = ProtoModule.writeTag(Buf, Count, 18, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult20, WriteTagResult2_19, self.lowest_resale_price)
	end
	if self.total_quantity ~= nil then
		local WriteTagResult25, WriteTagResult2_24 = ProtoModule.writeTag(Buf, Count, 19, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult25, WriteTagResult2_24, self.total_quantity)
	end
	if self.units_available_for_consumption ~= nil then
		local WriteTagResult18, WriteTagResult2_17 = ProtoModule.writeTag(Buf, Count, 20, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult18, WriteTagResult2_17, self.units_available_for_consumption)
	end
	if self.favorite_count ~= nil then
		local WriteTagResult26, WriteTagResult2_25 = ProtoModule.writeTag(Buf, Count, 21, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult26, WriteTagResult2_25, self.favorite_count)
	end
	if self.timed_options ~= nil and #self.timed_options > 0 then
		for _, timedOption in self.timed_options do
			local EncodeResult = timedOption:encode()
			local WriteTagResult14, WriteTagResult2_13 = ProtoModule.writeTag(Buf, Count, 22, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult14, WriteTagResult2_13, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.collectible_item_id ~= nil then
		local WriteTagResult21, WriteTagResult2_20 = ProtoModule.writeTag(Buf, Count, 23, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult21, WriteTagResult2_20, self.collectible_item_id)
	end
	if self.is_off_sale ~= nil then
		local WriteTagResult16, WriteTagResult2_15 = ProtoModule.writeTag(Buf, Count, 24, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult16, WriteTagResult2_15, if self.is_off_sale then 1 else 0)
	end
	if self.sale_location_type ~= nil then
		local WriteTagResult27, WriteTagResult2_26 = ProtoModule.writeTag(Buf, Count, 25, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult27, WriteTagResult2_26, self.sale_location_type)
	end
	if self.item_status ~= nil and #self.item_status > 0 then
		for _, value1 in self.item_status do
			local WriteTagResult28, WriteTagResult2_27 = ProtoModule.writeTag(Buf, Count, 26, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult28, WriteTagResult2_27, value1)
		end
	end
	if self.price_status ~= nil then
		local WriteTagResult29, WriteTagResult2_28 = ProtoModule.writeTag(Buf, Count, 27, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult29, WriteTagResult2_28, self.price_status)
	end
	if self.product_id ~= nil then
		local WriteTagResult30, WriteTagResult2_29 = ProtoModule.writeTag(Buf, Count, 28, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult30, WriteTagResult2_29, self.product_id)
	end
	if self.owned ~= nil then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 29, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, if self.owned then 1 else 0)
	end
	if self.is_purchasable ~= nil then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 30, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult4, WriteTagResult2_3, if self.is_purchasable then 1 else 0)
	end
	if self.variant_attributes ~= nil and #self.variant_attributes > 0 then
		for _, variantAttribute in self.variant_attributes do
			local EncodeResult = variantAttribute:encode()
			local WriteTagResult32, WriteTagResult2_31 = ProtoModule.writeTag(Buf, Count, 31, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult32, WriteTagResult2_31, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.genres ~= nil and #self.genres > 0 then
		for _, genre in self.genres do
			local WriteTagResult31, WriteTagResult2_30 = ProtoModule.writeTag(Buf, Count, 32, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult31, WriteTagResult2_30, genre)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf)
	-- upvalues: Module (copy), ProtoModule (copy), MarketplaceCatalogItemCommonModule (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v76 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 4 then
				local VarInt
				VarInt, v76 = ProtoModule.readVarInt(Buf, v1)
				NewModule.creator_has_verified_badge = VarInt ~= 0
			elseif Tag == 6 then
				NewModule.price, v76 = ProtoModule.readVarIntI64(Buf, v1)
			elseif Tag == 14 then
				local VarInt1
				VarInt1, v76 = ProtoModule.readVarInt(Buf, v1)
				NewModule.is_high_definition = VarInt1 ~= 0
			elseif Tag == 15 then
				local VarInt2
				VarInt2, v76 = ProtoModule.readVarInt(Buf, v1)
				NewModule.is_pbr = VarInt2 ~= 0
			elseif Tag == 16 then
				local VarInt3
				VarInt3, v76 = ProtoModule.readVarInt(Buf, v1)
				NewModule.has_resellers = VarInt3 ~= 0
			elseif Tag == 17 then
				NewModule.lowest_price, v76 = ProtoModule.readVarIntI64(Buf, v1)
			elseif Tag == 18 then
				NewModule.lowest_resale_price, v76 = ProtoModule.readVarIntI64(Buf, v1)
			elseif Tag == 19 then
				NewModule.total_quantity, v76 = ProtoModule.readVarIntI64(Buf, v1)
			elseif Tag == 20 then
				NewModule.units_available_for_consumption, v76 = ProtoModule.readVarIntI64(Buf, v1)
			elseif Tag == 21 then
				NewModule.favorite_count, v76 = ProtoModule.readVarIntI32(Buf, v1)
			elseif Tag == 24 then
				local VarInt4
				VarInt4, v76 = ProtoModule.readVarInt(Buf, v1)
				NewModule.is_off_sale = VarInt4 ~= 0
			elseif Tag == 29 then
				local VarInt5
				VarInt5, v76 = ProtoModule.readVarInt(Buf, v1)
				NewModule.owned = VarInt5 ~= 0
			elseif Tag == 30 then
				local VarInt6
				VarInt6, v76 = ProtoModule.readVarInt(Buf, v1)
				NewModule.is_purchasable = VarInt6 ~= 0
			else
				local _
				_, v76 = ProtoModule.readVarInt(Buf, v1)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v76 = ProtoModule.readBuffer(Buf, v1)
				NewModule.id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v76 = ProtoModule.readBuffer(Buf, v1)
				NewModule.name = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v76 = ProtoModule.readBuffer(Buf, v1)
				NewModule.creator_name = buffer.tostring(Buffer3)
			elseif Tag == 5 then
				local Buffer4
				Buffer4, v76 = ProtoModule.readBuffer(Buf, v1)
				NewModule.asset_type = buffer.tostring(Buffer4)
			elseif Tag == 7 then
				local Buffer5
				Buffer5, v76 = ProtoModule.readBuffer(Buf, v1)
				NewModule.description = buffer.tostring(Buffer5)
			elseif Tag == 8 then
				local Buffer6
				Buffer6, v76 = ProtoModule.readBuffer(Buf, v1)
				NewModule.creator_id = buffer.tostring(Buffer6)
			elseif Tag == 9 then
				local Buffer7
				Buffer7, v76 = ProtoModule.readBuffer(Buf, v1)
				NewModule.creator_type = buffer.tostring(Buffer7)
			elseif Tag == 10 then
				local Buffer8
				Buffer8, v76 = ProtoModule.readBuffer(Buf, v1)
				NewModule.creating_universe_id = buffer.tostring(Buffer8)
			elseif Tag == 11 then
				local Buffer9
				Buffer9, v76 = ProtoModule.readBuffer(Buf, v1)
				table.insert(NewModule.taxonomy, MarketplaceCatalogItemCommonModule.MarketplaceCatalogTaxonomyNode.decode(Buffer9))
			elseif Tag == 12 then
				local Buffer11
				Buffer11, v76 = ProtoModule.readBuffer(Buf, v1)
				table.insert(NewModule.render_properties, buffer.tostring(Buffer11))
			elseif Tag == 13 then
				local Buffer12
				Buffer12, v76 = ProtoModule.readBuffer(Buf, v1)
				table.insert(NewModule.item_restrictions, buffer.tostring(Buffer12))
			elseif Tag == 22 then
				local Buffer13
				Buffer13, v76 = ProtoModule.readBuffer(Buf, v1)
				table.insert(NewModule.timed_options, MarketplaceCatalogItemCommonModule.MarketplaceCatalogTimedOption.decode(Buffer13))
			elseif Tag == 23 then
				local Buffer14
				Buffer14, v76 = ProtoModule.readBuffer(Buf, v1)
				NewModule.collectible_item_id = buffer.tostring(Buffer14)
			elseif Tag == 25 then
				local Buffer15
				Buffer15, v76 = ProtoModule.readBuffer(Buf, v1)
				NewModule.sale_location_type = buffer.tostring(Buffer15)
			elseif Tag == 26 then
				local Buffer16
				Buffer16, v76 = ProtoModule.readBuffer(Buf, v1)
				table.insert(NewModule.item_status, buffer.tostring(Buffer16))
			elseif Tag == 27 then
				local Buffer17
				Buffer17, v76 = ProtoModule.readBuffer(Buf, v1)
				NewModule.price_status = buffer.tostring(Buffer17)
			elseif Tag == 28 then
				local Buffer18
				Buffer18, v76 = ProtoModule.readBuffer(Buf, v1)
				NewModule.product_id = buffer.tostring(Buffer18)
			elseif Tag == 31 then
				local Buffer19
				Buffer19, v76 = ProtoModule.readBuffer(Buf, v1)
				table.insert(NewModule.variant_attributes, MarketplaceCatalogItemCommonModule.MarketplaceCatalogVariantAttribute.decode(Buffer19))
			elseif Tag == 32 then
				local Buffer10
				Buffer10, v76 = ProtoModule.readBuffer(Buf, v1)
				table.insert(NewModule.genres, buffer.tostring(Buffer10))
			else
				local VarInt7, VarInt2_1 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2_1 + VarInt7
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v76 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v76 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode()
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
	if self.asset_type ~= nil and self.asset_type ~= "" then
		t.assetType = self.asset_type
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
		local Taxonomy = {}
		
		for _, value in self.taxonomy do
			table.insert(Taxonomy, value:jsonEncode())
		end
		t.taxonomy = Taxonomy
	end
	if self.render_properties ~= nil and #self.render_properties > 0 then
		local RenderProperties = {}
		
		for _, renderProperty in self.render_properties do
			table.insert(RenderProperties, renderProperty)
		end
		t.renderProperties = RenderProperties
	end
	if self.item_restrictions ~= nil and #self.item_restrictions > 0 then
		local ItemRestrictions = {}
		
		for _, itemRestriction in self.item_restrictions do
			table.insert(ItemRestrictions, itemRestriction)
		end
		t.itemRestrictions = ItemRestrictions
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
		local TimedOptions = {}
		
		for _, timedOption in self.timed_options do
			table.insert(TimedOptions, timedOption:jsonEncode())
		end
		t.timedOptions = TimedOptions
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
		local ItemStatus = {}
		
		for _, value1 in self.item_status do
			table.insert(ItemStatus, value1)
		end
		t.itemStatus = ItemStatus
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
		local VariantAttributes = {}
		
		for _, variantAttribute in self.variant_attributes do
			table.insert(VariantAttributes, variantAttribute:jsonEncode())
		end
		t.variantAttributes = VariantAttributes
	end
	if self.genres ~= nil and #self.genres > 0 then
		local Genres = {}
		
		for _, genre in self.genres do
			table.insert(Genres, genre)
		end
		t.genres = Genres
	end
	return t
end

function Module:jsonDecode()
	-- upvalues: Module (copy), MarketplaceCatalogItemCommonModule (copy)
	local NewModule = Module.new()
	
	if self.id ~= nil then
		NewModule.id = self.id
	end
	if self.name ~= nil then
		NewModule.name = self.name
	end
	if self.creator_name ~= nil then
		NewModule.creator_name = self.creator_name
	end
	if self.creatorName ~= nil then
		NewModule.creator_name = self.creatorName
	end
	if self.creator_has_verified_badge ~= nil then
		NewModule.creator_has_verified_badge = self.creator_has_verified_badge
	end
	if self.creatorHasVerifiedBadge ~= nil then
		NewModule.creator_has_verified_badge = self.creatorHasVerifiedBadge
	end
	if self.asset_type ~= nil then
		NewModule.asset_type = self.asset_type
	end
	if self.assetType ~= nil then
		NewModule.asset_type = self.assetType
	end
	if self.price ~= nil then
		NewModule.price = self.price
	end
	if self.description ~= nil then
		NewModule.description = self.description
	end
	if self.creator_id ~= nil then
		NewModule.creator_id = self.creator_id
	end
	if self.creatorId ~= nil then
		NewModule.creator_id = self.creatorId
	end
	if self.creator_type ~= nil then
		NewModule.creator_type = self.creator_type
	end
	if self.creatorType ~= nil then
		NewModule.creator_type = self.creatorType
	end
	if self.creating_universe_id ~= nil then
		NewModule.creating_universe_id = self.creating_universe_id
	end
	if self.creatingUniverseId ~= nil then
		NewModule.creating_universe_id = self.creatingUniverseId
	end
	if self.taxonomy ~= nil then
		local Taxonomy = {}
		
		for _, value in self.taxonomy do
			table.insert(Taxonomy, MarketplaceCatalogItemCommonModule.MarketplaceCatalogTaxonomyNode.jsonDecode(value))
		end
		NewModule.taxonomy = Taxonomy
	end
	if self.render_properties ~= nil then
		local Render_properties = {}
		
		for _, renderProperty in self.render_properties do
			table.insert(Render_properties, renderProperty)
		end
		NewModule.render_properties = Render_properties
	end
	if self.renderProperties ~= nil then
		local Render_properties = {}
		
		for _, renderProperty1 in self.renderProperties do
			table.insert(Render_properties, renderProperty1)
		end
		NewModule.render_properties = Render_properties
	end
	if self.item_restrictions ~= nil then
		local Item_restrictions = {}
		
		for _, itemRestriction in self.item_restrictions do
			table.insert(Item_restrictions, itemRestriction)
		end
		NewModule.item_restrictions = Item_restrictions
	end
	if self.itemRestrictions ~= nil then
		local Item_restrictions = {}
		
		for _, itemRestriction1 in self.itemRestrictions do
			table.insert(Item_restrictions, itemRestriction1)
		end
		NewModule.item_restrictions = Item_restrictions
	end
	if self.is_high_definition ~= nil then
		NewModule.is_high_definition = self.is_high_definition
	end
	if self.isHighDefinition ~= nil then
		NewModule.is_high_definition = self.isHighDefinition
	end
	if self.is_pbr ~= nil then
		NewModule.is_pbr = self.is_pbr
	end
	if self.isPbr ~= nil then
		NewModule.is_pbr = self.isPbr
	end
	if self.has_resellers ~= nil then
		NewModule.has_resellers = self.has_resellers
	end
	if self.hasResellers ~= nil then
		NewModule.has_resellers = self.hasResellers
	end
	if self.lowest_price ~= nil then
		NewModule.lowest_price = self.lowest_price
	end
	if self.lowestPrice ~= nil then
		NewModule.lowest_price = self.lowestPrice
	end
	if self.lowest_resale_price ~= nil then
		NewModule.lowest_resale_price = self.lowest_resale_price
	end
	if self.lowestResalePrice ~= nil then
		NewModule.lowest_resale_price = self.lowestResalePrice
	end
	if self.total_quantity ~= nil then
		NewModule.total_quantity = self.total_quantity
	end
	if self.totalQuantity ~= nil then
		NewModule.total_quantity = self.totalQuantity
	end
	if self.units_available_for_consumption ~= nil then
		NewModule.units_available_for_consumption = self.units_available_for_consumption
	end
	if self.unitsAvailableForConsumption ~= nil then
		NewModule.units_available_for_consumption = self.unitsAvailableForConsumption
	end
	if self.favorite_count ~= nil then
		NewModule.favorite_count = self.favorite_count
	end
	if self.favoriteCount ~= nil then
		NewModule.favorite_count = self.favoriteCount
	end
	if self.timed_options ~= nil then
		local Timed_options = {}
		
		for _, timedOption in self.timed_options do
			table.insert(Timed_options, MarketplaceCatalogItemCommonModule.MarketplaceCatalogTimedOption.jsonDecode(timedOption))
		end
		NewModule.timed_options = Timed_options
	end
	if self.timedOptions ~= nil then
		local Timed_options = {}
		
		for _, timedOption1 in self.timedOptions do
			table.insert(Timed_options, MarketplaceCatalogItemCommonModule.MarketplaceCatalogTimedOption.jsonDecode(timedOption1))
		end
		NewModule.timed_options = Timed_options
	end
	if self.collectible_item_id ~= nil then
		NewModule.collectible_item_id = self.collectible_item_id
	end
	if self.collectibleItemId ~= nil then
		NewModule.collectible_item_id = self.collectibleItemId
	end
	if self.is_off_sale ~= nil then
		NewModule.is_off_sale = self.is_off_sale
	end
	if self.isOffSale ~= nil then
		NewModule.is_off_sale = self.isOffSale
	end
	if self.sale_location_type ~= nil then
		NewModule.sale_location_type = self.sale_location_type
	end
	if self.saleLocationType ~= nil then
		NewModule.sale_location_type = self.saleLocationType
	end
	if self.item_status ~= nil then
		local Item_status = {}
		
		for _, value1 in self.item_status do
			table.insert(Item_status, value1)
		end
		NewModule.item_status = Item_status
	end
	if self.itemStatus ~= nil then
		local Item_status = {}
		
		for _, value2 in self.itemStatus do
			table.insert(Item_status, value2)
		end
		NewModule.item_status = Item_status
	end
	if self.price_status ~= nil then
		NewModule.price_status = self.price_status
	end
	if self.priceStatus ~= nil then
		NewModule.price_status = self.priceStatus
	end
	if self.product_id ~= nil then
		NewModule.product_id = self.product_id
	end
	if self.productId ~= nil then
		NewModule.product_id = self.productId
	end
	if self.owned ~= nil then
		NewModule.owned = self.owned
	end
	if self.is_purchasable ~= nil then
		NewModule.is_purchasable = self.is_purchasable
	end
	if self.isPurchasable ~= nil then
		NewModule.is_purchasable = self.isPurchasable
	end
	if self.variant_attributes ~= nil then
		local Variant_attributes = {}
		
		for _, variantAttribute in self.variant_attributes do
			table.insert(Variant_attributes, MarketplaceCatalogItemCommonModule.MarketplaceCatalogVariantAttribute.jsonDecode(variantAttribute))
		end
		NewModule.variant_attributes = Variant_attributes
	end
	if self.variantAttributes ~= nil then
		local Variant_attributes1 = {}
		
		for _, variantAttribute1 in self.variantAttributes do
			table.insert(Variant_attributes1, MarketplaceCatalogItemCommonModule.MarketplaceCatalogVariantAttribute.jsonDecode(variantAttribute1))
		end
		NewModule.variant_attributes = Variant_attributes1
	end
	if self.genres ~= nil then
		local Genres = {}
		
		for _, genre in self.genres do
			table.insert(Genres, genre)
		end
		NewModule.genres = Genres
	end
	return NewModule
end

Module.descriptor = {
	name = "MarketplaceAssetData",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceAssetData"
}
local config = { MarketplaceAssetData = Module }
TypeRegistryModule.default:register(config.MarketplaceAssetData)

return { MarketplaceAssetData = config.MarketplaceAssetData }