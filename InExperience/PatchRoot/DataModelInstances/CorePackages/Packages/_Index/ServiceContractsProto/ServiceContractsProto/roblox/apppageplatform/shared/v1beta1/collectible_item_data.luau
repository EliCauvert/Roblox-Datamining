local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local Module = {}
Module.__index = Module

function Module.new(p1) --[[ Line: 138 ]]
	-- upvalues: Module (copy)
	return (setmetatable({
		id = if p1 == nil or p1.id == nil then nil else p1.id,
		name = if p1 == nil or p1.name == nil then nil else p1.name,
		type = if p1 == nil or p1.type == nil then nil else p1.type,
		target_id = if p1 == nil or p1.target_id == nil then nil else p1.target_id,
		has_verified_badge = if p1 == nil or p1.has_verified_badge == nil then nil else p1.has_verified_badge
	}, Module))
end

function Module:encode() --[[ Line: 148 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.id ~= nil then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.id)
	end
	if self.name ~= nil then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.name)
	end
	if self.type ~= nil then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.type)
	end
	if self.target_id ~= nil then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.target_id)
	end
	if self.has_verified_badge ~= nil then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult5, WriteTagResult2_4, if self.has_verified_badge then 1 else 0)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf) --[[ Line: 182 ]]
	-- upvalues: Module (copy), ProtoModule (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v19 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 5 then
				local VarInt
				VarInt, v19 = ProtoModule.readVarInt(Buf, v1)
				NewModule.has_verified_badge = VarInt ~= 0
			else
				local _
				_, v19 = ProtoModule.readVarInt(Buf, v1)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v19 = ProtoModule.readBuffer(Buf, v1)
				NewModule.id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v19 = ProtoModule.readBuffer(Buf, v1)
				NewModule.name = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v19 = ProtoModule.readBuffer(Buf, v1)
				NewModule.type = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v19 = ProtoModule.readBuffer(Buf, v1)
				NewModule.target_id = buffer.tostring(Buffer4)
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v19 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v19 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode() --[[ Line: 245 ]]
	local t = {}
	
	if self.id ~= nil then
		t.id = self.id
	end
	if self.name ~= nil then
		t.name = self.name
	end
	if self.type ~= nil then
		t.type = self.type
	end
	if self.target_id ~= nil then
		t.targetId = self.target_id
	end
	if self.has_verified_badge ~= nil then
		t.hasVerifiedBadge = self.has_verified_badge
	end
	return t
end

function Module:jsonDecode() --[[ Line: 271 ]]
	-- upvalues: Module (copy)
	local NewModule = Module.new()
	
	if self.id ~= nil then
		NewModule.id = self.id
	end
	if self.name ~= nil then
		NewModule.name = self.name
	end
	if self.type ~= nil then
		NewModule.type = self.type
	end
	if self.target_id ~= nil then
		NewModule.target_id = self.target_id
	end
	if self.targetId ~= nil then
		NewModule.target_id = self.targetId
	end
	if self.has_verified_badge ~= nil then
		NewModule.has_verified_badge = self.has_verified_badge
	end
	if self.hasVerifiedBadge ~= nil then
		NewModule.has_verified_badge = self.hasVerifiedBadge
	end
	return NewModule
end

Module.descriptor = {
	name = "CollectibleItemCreator",
	fullName = "roblox.apppageplatform.shared.v1beta1.CollectibleItemCreator"
}
local config = { CollectibleItemCreator = Module }
TypeRegistryModule.default:register(config.CollectibleItemCreator)
local Module1 = {}
Module1.__index = Module1

function Module1.new(p1) --[[ Line: 319 ]]
	-- upvalues: Module1 (copy)
	return (setmetatable({
		id = if p1 == nil or p1.id == nil then "" else p1.id,
		name = if p1 == nil or p1.name == nil then nil else p1.name,
		detail_page_link = if p1 == nil or p1.detail_page_link == nil then nil else p1.detail_page_link
	}, Module1))
end

function Module1:encode() --[[ Line: 329 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.id ~= nil and self.id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.id)
	end
	if self.name ~= nil then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.name)
	end
	if self.detail_page_link ~= nil then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.detail_page_link)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module1.decode(Buf) --[[ Line: 353 ]]
	-- upvalues: Module1 (copy), ProtoModule (copy)
	local NewModule = Module1.new()
	local v2 = 0
	while v2 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v43 = ProtoModule.readTag(Buf, v2)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v43 = ProtoModule.readVarInt(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v43 = ProtoModule.readBuffer(Buf, v2)
				NewModule.id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v43 = ProtoModule.readBuffer(Buf, v2)
				NewModule.name = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v43 = ProtoModule.readBuffer(Buf, v2)
				NewModule.detail_page_link = buffer.tostring(Buffer3)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v2)
				v2 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v43 = ProtoModule.readFixed32(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v43 = ProtoModule.readFixed64(Buf, v2)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module1:jsonEncode() --[[ Line: 406 ]]
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.name ~= nil then
		t.name = self.name
	end
	if self.detail_page_link ~= nil then
		t.detailPageLink = self.detail_page_link
	end
	return t
end

function Module1:jsonDecode() --[[ Line: 424 ]]
	-- upvalues: Module1 (copy)
	local NewModule = Module1.new()
	
	if self.id ~= nil then
		NewModule.id = self.id
	end
	if self.name ~= nil then
		NewModule.name = self.name
	end
	if self.detail_page_link ~= nil then
		NewModule.detail_page_link = self.detail_page_link
	end
	if self.detailPageLink ~= nil then
		NewModule.detail_page_link = self.detailPageLink
	end
	return NewModule
end

Module1.descriptor = {
	name = "CollectibleItemExperience",
	fullName = "roblox.apppageplatform.shared.v1beta1.CollectibleItemExperience"
}
config.CollectibleItemExperience = Module1
TypeRegistryModule.default:register(config.CollectibleItemExperience)
local Module2 = {}
Module2.__index = Module2

function Module2.new(p1) --[[ Line: 460 ]]
	-- upvalues: Module2 (copy)
	return (setmetatable({
		id = if p1 == nil or p1.id == nil then "" else p1.id,
		collectible_product_id = if p1 == nil or p1.collectible_product_id == nil then nil else p1.collectible_product_id,
		name = if p1 == nil or p1.name == nil then nil else p1.name,
		description = if p1 == nil or p1.description == nil then nil else p1.description,
		creator = if p1 == nil or p1.creator == nil then nil else p1.creator,
		price = if p1 == nil or p1.price == nil then nil else p1.price,
		lowest_price = if p1 == nil or p1.lowest_price == nil then nil else p1.lowest_price,
		units_available_for_consumption = if p1 == nil or p1.units_available_for_consumption == nil then nil else p1.units_available_for_consumption,
		offsale_deadline = if p1 == nil or p1.offsale_deadline == nil then nil else p1.offsale_deadline,
		asset_stock = if p1 == nil or p1.asset_stock == nil then nil else p1.asset_stock,
		has_resellers = if p1 == nil or p1.has_resellers == nil then nil else p1.has_resellers,
		universe_ids = if p1 == nil or p1.universe_ids == nil then {} else p1.universe_ids,
		sale_location_type = if p1 == nil or p1.sale_location_type == nil then nil else p1.sale_location_type,
		quantity_limit_per_user = if p1 == nil or p1.quantity_limit_per_user == nil then nil else p1.quantity_limit_per_user,
		resale_restriction = if p1 == nil or p1.resale_restriction == nil then nil else p1.resale_restriction,
		lowest_available_resale_product_id = if p1 == nil or p1.lowest_available_resale_product_id == nil then nil else p1.lowest_available_resale_product_id,
		lowest_available_resale_item_instance_id = if p1 == nil or p1.lowest_available_resale_item_instance_id == nil then nil else p1.lowest_available_resale_item_instance_id,
		experiences = if p1 == nil or p1.experiences == nil then {} else p1.experiences
	}, Module2))
end

function Module2:encode() --[[ Line: 495 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.id ~= nil and self.id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.id)
	end
	if self.collectible_product_id ~= nil then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.collectible_product_id)
	end
	if self.name ~= nil then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.name)
	end
	if self.description ~= nil then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.description)
	end
	if self.creator ~= nil then
		local EncodeResult = self.creator:encode()
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult5, WriteTagResult2_4, EncodeResult, buffer.len(EncodeResult))
	end
	if self.price ~= nil then
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult6, WriteTagResult2_5, self.price)
	end
	if self.lowest_price ~= nil then
		local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult7, WriteTagResult2_6, self.lowest_price)
	end
	if self.units_available_for_consumption ~= nil then
		local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(Buf, Count, 8, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult8, WriteTagResult2_7, self.units_available_for_consumption)
	end
	if self.offsale_deadline ~= nil then
		local WriteTagResult9, WriteTagResult2_8 = ProtoModule.writeTag(Buf, Count, 9, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult9, WriteTagResult2_8, self.offsale_deadline)
	end
	if self.asset_stock ~= nil then
		local WriteTagResult10, WriteTagResult2_9 = ProtoModule.writeTag(Buf, Count, 10, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult10, WriteTagResult2_9, self.asset_stock)
	end
	if self.has_resellers ~= nil then
		local WriteTagResult11, WriteTagResult2_10 = ProtoModule.writeTag(Buf, Count, 11, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult11, WriteTagResult2_10, if self.has_resellers then 1 else 0)
	end
	if self.universe_ids ~= nil and #self.universe_ids > 0 then
		for _, universeId in self.universe_ids do
			local WriteTagResult12, WriteTagResult2_11 = ProtoModule.writeTag(Buf, Count, 12, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult12, WriteTagResult2_11, universeId)
		end
	end
	if self.sale_location_type ~= nil then
		local WriteTagResult13, WriteTagResult2_12 = ProtoModule.writeTag(Buf, Count, 13, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult13, WriteTagResult2_12, self.sale_location_type)
	end
	if self.quantity_limit_per_user ~= nil then
		local WriteTagResult14, WriteTagResult2_13 = ProtoModule.writeTag(Buf, Count, 14, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult14, WriteTagResult2_13, self.quantity_limit_per_user)
	end
	if self.resale_restriction ~= nil then
		local WriteTagResult15, WriteTagResult2_14 = ProtoModule.writeTag(Buf, Count, 15, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult15, WriteTagResult2_14, self.resale_restriction)
	end
	if self.lowest_available_resale_product_id ~= nil then
		local WriteTagResult16, WriteTagResult2_15 = ProtoModule.writeTag(Buf, Count, 16, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult16, WriteTagResult2_15, self.lowest_available_resale_product_id)
	end
	if self.lowest_available_resale_item_instance_id ~= nil then
		local WriteTagResult17, WriteTagResult2_16 = ProtoModule.writeTag(Buf, Count, 17, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult17, WriteTagResult2_16, self.lowest_available_resale_item_instance_id)
	end
	if self.experiences ~= nil and #self.experiences > 0 then
		for _, experience in self.experiences do
			local EncodeResult = experience:encode()
			local WriteTagResult18, WriteTagResult2_17 = ProtoModule.writeTag(Buf, Count, 18, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult18, WriteTagResult2_17, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module2.decode(Buf) --[[ Line: 600 ]]
	-- upvalues: Module2 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module2.new()
	local v3 = 0
	while v3 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v97 = ProtoModule.readTag(Buf, v3)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 6 then
				NewModule.price, v97 = ProtoModule.readVarIntI64(Buf, v3)
			elseif Tag == 7 then
				NewModule.lowest_price, v97 = ProtoModule.readVarIntI64(Buf, v3)
			elseif Tag == 8 then
				NewModule.units_available_for_consumption, v97 = ProtoModule.readVarIntI64(Buf, v3)
			elseif Tag == 10 then
				NewModule.asset_stock, v97 = ProtoModule.readVarIntI64(Buf, v3)
			elseif Tag == 11 then
				local VarInt
				VarInt, v97 = ProtoModule.readVarInt(Buf, v3)
				NewModule.has_resellers = VarInt ~= 0
			elseif Tag == 14 then
				NewModule.quantity_limit_per_user, v97 = ProtoModule.readVarIntI32(Buf, v3)
			elseif Tag == 15 then
				NewModule.resale_restriction, v97 = ProtoModule.readVarIntI32(Buf, v3)
			else
				local _
				_, v97 = ProtoModule.readVarInt(Buf, v3)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v97 = ProtoModule.readBuffer(Buf, v3)
				NewModule.id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v97 = ProtoModule.readBuffer(Buf, v3)
				NewModule.collectible_product_id = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v97 = ProtoModule.readBuffer(Buf, v3)
				NewModule.name = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v97 = ProtoModule.readBuffer(Buf, v3)
				NewModule.description = buffer.tostring(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v97 = ProtoModule.readBuffer(Buf, v3)
				NewModule.creator = config.CollectibleItemCreator.decode(Buffer5)
			elseif Tag == 9 then
				local Buffer6
				Buffer6, v97 = ProtoModule.readBuffer(Buf, v3)
				NewModule.offsale_deadline = buffer.tostring(Buffer6)
			elseif Tag == 12 then
				local Buffer7
				Buffer7, v97 = ProtoModule.readBuffer(Buf, v3)
				table.insert(NewModule.universe_ids, buffer.tostring(Buffer7))
			elseif Tag == 13 then
				local Buffer8
				Buffer8, v97 = ProtoModule.readBuffer(Buf, v3)
				NewModule.sale_location_type = buffer.tostring(Buffer8)
			elseif Tag == 16 then
				local Buffer9
				Buffer9, v97 = ProtoModule.readBuffer(Buf, v3)
				NewModule.lowest_available_resale_product_id = buffer.tostring(Buffer9)
			elseif Tag == 17 then
				local Buffer10
				Buffer10, v97 = ProtoModule.readBuffer(Buf, v3)
				NewModule.lowest_available_resale_item_instance_id = buffer.tostring(Buffer10)
			elseif Tag == 18 then
				local Buffer11
				Buffer11, v97 = ProtoModule.readBuffer(Buf, v3)
				table.insert(NewModule.experiences, config.CollectibleItemExperience.decode(Buffer11))
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v3)
				v3 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v97 = ProtoModule.readFixed32(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v97 = ProtoModule.readFixed64(Buf, v3)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module2:jsonEncode() --[[ Line: 728 ]]
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.collectible_product_id ~= nil then
		t.collectibleProductId = self.collectible_product_id
	end
	if self.name ~= nil then
		t.name = self.name
	end
	if self.description ~= nil then
		t.description = self.description
	end
	if self.creator ~= nil then
		t.creator = self.creator:jsonEncode()
	end
	if self.price ~= nil then
		t.price = self.price
	end
	if self.lowest_price ~= nil then
		t.lowestPrice = self.lowest_price
	end
	if self.units_available_for_consumption ~= nil then
		t.unitsAvailableForConsumption = self.units_available_for_consumption
	end
	if self.offsale_deadline ~= nil then
		t.offsaleDeadline = self.offsale_deadline
	end
	if self.asset_stock ~= nil then
		t.assetStock = self.asset_stock
	end
	if self.has_resellers ~= nil then
		t.hasResellers = self.has_resellers
	end
	if self.universe_ids ~= nil and #self.universe_ids > 0 then
		local UniverseIds = {}
		
		for _, universeId in self.universe_ids do
			table.insert(UniverseIds, universeId)
		end
		t.universeIds = UniverseIds
	end
	if self.sale_location_type ~= nil then
		t.saleLocationType = self.sale_location_type
	end
	if self.quantity_limit_per_user ~= nil then
		t.quantityLimitPerUser = self.quantity_limit_per_user
	end
	if self.resale_restriction ~= nil then
		t.resaleRestriction = self.resale_restriction
	end
	if self.lowest_available_resale_product_id ~= nil then
		t.lowestAvailableResaleProductId = self.lowest_available_resale_product_id
	end
	if self.lowest_available_resale_item_instance_id ~= nil then
		t.lowestAvailableResaleItemInstanceId = self.lowest_available_resale_item_instance_id
	end
	if self.experiences ~= nil and #self.experiences > 0 then
		local Experiences = {}
		
		for _, experience in self.experiences do
			table.insert(Experiences, experience:jsonEncode())
		end
		t.experiences = Experiences
	end
	return t
end

function Module2:jsonDecode() --[[ Line: 814 ]]
	-- upvalues: Module2 (copy), config (copy)
	local NewModule = Module2.new()
	
	if self.id ~= nil then
		NewModule.id = self.id
	end
	if self.collectible_product_id ~= nil then
		NewModule.collectible_product_id = self.collectible_product_id
	end
	if self.collectibleProductId ~= nil then
		NewModule.collectible_product_id = self.collectibleProductId
	end
	if self.name ~= nil then
		NewModule.name = self.name
	end
	if self.description ~= nil then
		NewModule.description = self.description
	end
	if self.creator ~= nil then
		NewModule.creator = config.CollectibleItemCreator.jsonDecode(self.creator)
	end
	if self.price ~= nil then
		NewModule.price = self.price
	end
	if self.lowest_price ~= nil then
		NewModule.lowest_price = self.lowest_price
	end
	if self.lowestPrice ~= nil then
		NewModule.lowest_price = self.lowestPrice
	end
	if self.units_available_for_consumption ~= nil then
		NewModule.units_available_for_consumption = self.units_available_for_consumption
	end
	if self.unitsAvailableForConsumption ~= nil then
		NewModule.units_available_for_consumption = self.unitsAvailableForConsumption
	end
	if self.offsale_deadline ~= nil then
		NewModule.offsale_deadline = self.offsale_deadline
	end
	if self.offsaleDeadline ~= nil then
		NewModule.offsale_deadline = self.offsaleDeadline
	end
	if self.asset_stock ~= nil then
		NewModule.asset_stock = self.asset_stock
	end
	if self.assetStock ~= nil then
		NewModule.asset_stock = self.assetStock
	end
	if self.has_resellers ~= nil then
		NewModule.has_resellers = self.has_resellers
	end
	if self.hasResellers ~= nil then
		NewModule.has_resellers = self.hasResellers
	end
	if self.universe_ids ~= nil then
		local Universe_ids = {}
		
		for _, universeId in self.universe_ids do
			table.insert(Universe_ids, universeId)
		end
		NewModule.universe_ids = Universe_ids
	end
	if self.universeIds ~= nil then
		local Universe_ids = {}
		
		for _, universeId1 in self.universeIds do
			table.insert(Universe_ids, universeId1)
		end
		NewModule.universe_ids = Universe_ids
	end
	if self.sale_location_type ~= nil then
		NewModule.sale_location_type = self.sale_location_type
	end
	if self.saleLocationType ~= nil then
		NewModule.sale_location_type = self.saleLocationType
	end
	if self.quantity_limit_per_user ~= nil then
		NewModule.quantity_limit_per_user = self.quantity_limit_per_user
	end
	if self.quantityLimitPerUser ~= nil then
		NewModule.quantity_limit_per_user = self.quantityLimitPerUser
	end
	if self.resale_restriction ~= nil then
		NewModule.resale_restriction = self.resale_restriction
	end
	if self.resaleRestriction ~= nil then
		NewModule.resale_restriction = self.resaleRestriction
	end
	if self.lowest_available_resale_product_id ~= nil then
		NewModule.lowest_available_resale_product_id = self.lowest_available_resale_product_id
	end
	if self.lowestAvailableResaleProductId ~= nil then
		NewModule.lowest_available_resale_product_id = self.lowestAvailableResaleProductId
	end
	if self.lowest_available_resale_item_instance_id ~= nil then
		NewModule.lowest_available_resale_item_instance_id = self.lowest_available_resale_item_instance_id
	end
	if self.lowestAvailableResaleItemInstanceId ~= nil then
		NewModule.lowest_available_resale_item_instance_id = self.lowestAvailableResaleItemInstanceId
	end
	if self.experiences ~= nil then
		local Experiences = {}
		
		for _, experience in self.experiences do
			table.insert(Experiences, config.CollectibleItemExperience.jsonDecode(experience))
		end
		NewModule.experiences = Experiences
	end
	return NewModule
end

Module2.descriptor = {
	name = "CollectibleItemData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CollectibleItemData"
}
config.CollectibleItemData = Module2
TypeRegistryModule.default:register(config.CollectibleItemData)

return {
	CollectibleItemCreator = config.CollectibleItemCreator,
	CollectibleItemExperience = config.CollectibleItemExperience,
	CollectibleItemData = config.CollectibleItemData
}