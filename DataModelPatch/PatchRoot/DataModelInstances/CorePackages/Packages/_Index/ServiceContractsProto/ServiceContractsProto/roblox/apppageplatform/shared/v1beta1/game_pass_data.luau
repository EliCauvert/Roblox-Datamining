local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local Module = {}
Module.__index = Module

function Module.new(p1)
	-- upvalues: Module (copy)
	return (setmetatable({
		type = if p1 == nil or p1.type == nil then "" else p1.type,
		amount_in_robux = if p1 == nil or p1.amount_in_robux == nil then 0 else p1.amount_in_robux,
		percent = if p1 == nil or p1.percent == nil then 0 else p1.percent
	}, Module))
end

function Module:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.type ~= nil and self.type ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.type)
	end
	if self.amount_in_robux ~= nil and self.amount_in_robux ~= 0 then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, self.amount_in_robux)
	end
	if self.percent ~= nil and self.percent ~= 0 then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult3, WriteTagResult2_2, self.percent)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf)
	-- upvalues: Module (copy), ProtoModule (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v14 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				NewModule.amount_in_robux, v14 = ProtoModule.readVarIntI64(Buf, v1)
			elseif Tag == 3 then
				NewModule.percent, v14 = ProtoModule.readVarIntI64(Buf, v1)
			else
				local _
				_, v14 = ProtoModule.readVarInt(Buf, v1)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v14 = ProtoModule.readBuffer(Buf, v1)
				NewModule.type = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v14 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v14 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode()
	local t = {}
	
	if self.type ~= nil and self.type ~= "" then
		t.type = self.type
	end
	if self.amount_in_robux ~= nil and self.amount_in_robux ~= 0 then
		t.amountInRobux = self.amount_in_robux
	end
	if self.percent ~= nil and self.percent ~= 0 then
		t.percent = self.percent
	end
	return t
end

function Module:jsonDecode()
	-- upvalues: Module (copy)
	local NewModule = Module.new()
	
	if self.type ~= nil then
		NewModule.type = self.type
	end
	if self.amount_in_robux ~= nil then
		NewModule.amount_in_robux = self.amount_in_robux
	end
	if self.amountInRobux ~= nil then
		NewModule.amount_in_robux = self.amountInRobux
	end
	if self.percent ~= nil then
		NewModule.percent = self.percent
	end
	return NewModule
end

Module.descriptor = {
	name = "PriceDiscountDetail",
	fullName = "roblox.apppageplatform.shared.v1beta1.PriceDiscountDetail"
}
local config = { PriceDiscountDetail = Module }
TypeRegistryModule.default:register(config.PriceDiscountDetail)
local Module1 = {}
Module1.__index = Module1

function Module1.new(p1)
	-- upvalues: Module1 (copy)
	return (setmetatable({
		id = if p1 == nil or p1.id == nil then "" else p1.id,
		display_name = if p1 == nil or p1.display_name == nil then "" else p1.display_name,
		price = if p1 == nil or p1.price == nil then 0 else p1.price,
		product_id = if p1 == nil or p1.product_id == nil then 0 else p1.product_id,
		is_owned = p1 ~= nil and p1.is_owned ~= nil and p1.is_owned,
		display_icon_image_asset_id = if p1 == nil or p1.display_icon_image_asset_id == nil then 0 else p1.display_icon_image_asset_id,
		display_description = if p1 == nil or p1.display_description == nil then "" else p1.display_description,
		price_discount_details = if p1 == nil or p1.price_discount_details == nil then {} else p1.price_discount_details,
		user_base_price_in_robux = if p1 == nil or p1.user_base_price_in_robux == nil then 0 else p1.user_base_price_in_robux
	}, Module1))
end

function Module1:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.id ~= nil and self.id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.id)
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.display_name)
	end
	if self.price ~= nil and self.price ~= 0 then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult3, WriteTagResult2_2, self.price)
	end
	if self.product_id ~= nil and self.product_id ~= 0 then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult4, WriteTagResult2_3, self.product_id)
	end
	if self.is_owned then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult5, WriteTagResult2_4, if self.is_owned then 1 else 0)
	end
	if self.display_icon_image_asset_id ~= nil and self.display_icon_image_asset_id ~= 0 then
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult6, WriteTagResult2_5, self.display_icon_image_asset_id)
	end
	if self.display_description ~= nil and self.display_description ~= "" then
		local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult7, WriteTagResult2_6, self.display_description)
	end
	if self.price_discount_details ~= nil and #self.price_discount_details > 0 then
		for _, priceDiscountDetail in self.price_discount_details do
			local EncodeResult = priceDiscountDetail:encode()
			local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(Buf, Count, 8, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult8, WriteTagResult2_7, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.user_base_price_in_robux ~= nil and self.user_base_price_in_robux ~= 0 then
		local WriteTagResult9, WriteTagResult2_8 = ProtoModule.writeTag(Buf, Count, 9, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult9, WriteTagResult2_8, self.user_base_price_in_robux)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module1.decode(Buf)
	-- upvalues: Module1 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module1.new()
	local v2 = 0
	while v2 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v47 = ProtoModule.readTag(Buf, v2)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 3 then
				NewModule.price, v47 = ProtoModule.readVarIntI64(Buf, v2)
			elseif Tag == 4 then
				NewModule.product_id, v47 = ProtoModule.readVarIntI64(Buf, v2)
			elseif Tag == 5 then
				local VarInt
				VarInt, v47 = ProtoModule.readVarInt(Buf, v2)
				NewModule.is_owned = VarInt ~= 0
			elseif Tag == 6 then
				NewModule.display_icon_image_asset_id, v47 = ProtoModule.readVarIntI64(Buf, v2)
			elseif Tag == 9 then
				NewModule.user_base_price_in_robux, v47 = ProtoModule.readVarIntI64(Buf, v2)
			else
				local _
				_, v47 = ProtoModule.readVarInt(Buf, v2)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v47 = ProtoModule.readBuffer(Buf, v2)
				NewModule.id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v47 = ProtoModule.readBuffer(Buf, v2)
				NewModule.display_name = buffer.tostring(Buffer2)
			elseif Tag == 7 then
				local Buffer3
				Buffer3, v47 = ProtoModule.readBuffer(Buf, v2)
				NewModule.display_description = buffer.tostring(Buffer3)
			elseif Tag == 8 then
				local Buffer4
				Buffer4, v47 = ProtoModule.readBuffer(Buf, v2)
				table.insert(NewModule.price_discount_details, config.PriceDiscountDetail.decode(Buffer4))
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v2)
				v2 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v47 = ProtoModule.readFixed32(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v47 = ProtoModule.readFixed64(Buf, v2)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module1:jsonEncode()
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		t.displayName = self.display_name
	end
	if self.price ~= nil and self.price ~= 0 then
		t.price = self.price
	end
	if self.product_id ~= nil and self.product_id ~= 0 then
		t.productId = self.product_id
	end
	if self.is_owned then
		t.isOwned = self.is_owned
	end
	if self.display_icon_image_asset_id ~= nil and self.display_icon_image_asset_id ~= 0 then
		t.displayIconImageAssetId = self.display_icon_image_asset_id
	end
	if self.display_description ~= nil and self.display_description ~= "" then
		t.displayDescription = self.display_description
	end
	if self.price_discount_details ~= nil and #self.price_discount_details > 0 then
		local PriceDiscountDetails = {}
		
		for _, priceDiscountDetail in self.price_discount_details do
			table.insert(PriceDiscountDetails, priceDiscountDetail:jsonEncode())
		end
		t.priceDiscountDetails = PriceDiscountDetails
	end
	if self.user_base_price_in_robux ~= nil and self.user_base_price_in_robux ~= 0 then
		t.userBasePriceInRobux = self.user_base_price_in_robux
	end
	return t
end

function Module1:jsonDecode()
	-- upvalues: Module1 (copy), config (copy)
	local NewModule = Module1.new()
	
	if self.id ~= nil then
		NewModule.id = self.id
	end
	if self.display_name ~= nil then
		NewModule.display_name = self.display_name
	end
	if self.displayName ~= nil then
		NewModule.display_name = self.displayName
	end
	if self.price ~= nil then
		NewModule.price = self.price
	end
	if self.product_id ~= nil then
		NewModule.product_id = self.product_id
	end
	if self.productId ~= nil then
		NewModule.product_id = self.productId
	end
	if self.is_owned ~= nil then
		NewModule.is_owned = self.is_owned
	end
	if self.isOwned ~= nil then
		NewModule.is_owned = self.isOwned
	end
	if self.display_icon_image_asset_id ~= nil then
		NewModule.display_icon_image_asset_id = self.display_icon_image_asset_id
	end
	if self.displayIconImageAssetId ~= nil then
		NewModule.display_icon_image_asset_id = self.displayIconImageAssetId
	end
	if self.display_description ~= nil then
		NewModule.display_description = self.display_description
	end
	if self.displayDescription ~= nil then
		NewModule.display_description = self.displayDescription
	end
	if self.price_discount_details ~= nil then
		local Price_discount_details = {}
		
		for _, priceDiscountDetail in self.price_discount_details do
			table.insert(Price_discount_details, config.PriceDiscountDetail.jsonDecode(priceDiscountDetail))
		end
		NewModule.price_discount_details = Price_discount_details
	end
	if self.priceDiscountDetails ~= nil then
		local Price_discount_details = {}
		
		for _, priceDiscountDetail1 in self.priceDiscountDetails do
			table.insert(Price_discount_details, config.PriceDiscountDetail.jsonDecode(priceDiscountDetail1))
		end
		NewModule.price_discount_details = Price_discount_details
	end
	if self.user_base_price_in_robux ~= nil then
		NewModule.user_base_price_in_robux = self.user_base_price_in_robux
	end
	if self.userBasePriceInRobux ~= nil then
		NewModule.user_base_price_in_robux = self.userBasePriceInRobux
	end
	return NewModule
end

Module1.descriptor = {
	name = "GamePassData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GamePassData"
}
config.GamePassData = Module1
TypeRegistryModule.default:register(config.GamePassData)

return {
	PriceDiscountDetail = config.PriceDiscountDetail,
	GamePassData = config.GamePassData
}