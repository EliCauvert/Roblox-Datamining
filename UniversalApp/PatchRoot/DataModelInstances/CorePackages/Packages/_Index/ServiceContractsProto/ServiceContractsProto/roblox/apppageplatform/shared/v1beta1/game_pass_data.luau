local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
		type = if p1 == nil or p1.type == nil then "" else p1.type,
		amount_in_robux = if p1 == nil or p1.amount_in_robux == nil then 0 else p1.amount_in_robux,
		percent = if p1 == nil or p1.percent == nil then 0 else p1.percent
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.type ~= nil and self.type ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var8 = protoModule.writeString(var2, var3, self.type)
		buff = var2
		var1 = var3
	end
	if self.amount_in_robux ~= nil and self.amount_in_robux ~= 0 then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.varint)
		var4, var10 = protoModule.writeVarInt(var4, var5, self.amount_in_robux)
		buff = var4
		var1 = var5
	end
	if self.percent ~= nil and self.percent ~= 0 then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.varint)
		var6, var12 = protoModule.writeVarInt(var6, var7, self.percent)
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
			if var7 == 2 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI64(p1, var2)
				var2 = var9
				var1.amount_in_robux = var8
			elseif var7 == 3 then
				local _ = nil
				local var10, var11 = protoModule.readVarIntI64(p1, var2)
				var2 = var11
				var1.percent = var10
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				local _ = var12
				var2 = var13
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.type = buffer.tostring(var14)
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
			error("Unsupported wire type: " .. var16)
		end
	end
	return var1
end

function t_1:jsonEncode()
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

function t_1:jsonDecode()
	-- upvalues: t_1 (ref)
	local var22 = t_1.new()
	
	if self.type ~= nil then
		var22.type = self.type
	end
	if self.amount_in_robux ~= nil then
		var22.amount_in_robux = self.amount_in_robux
	end
	if self.amountInRobux ~= nil then
		var22.amount_in_robux = self.amountInRobux
	end
	if self.percent ~= nil then
		var22.percent = self.percent
	end
	return var22
end

t_1.descriptor = {
	name = "PriceDiscountDetail",
	fullName = "roblox.apppageplatform.shared.v1beta1.PriceDiscountDetail"
}
t.PriceDiscountDetail = t_1
typeRegistryModule.default:register(t.PriceDiscountDetail)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2)
	-- upvalues: t_2 (ref)
	return setmetatable({
		id = if p2 == nil or p2.id == nil then "" else p2.id,
		display_name = if p2 == nil or p2.display_name == nil then "" else p2.display_name,
		price = if p2 == nil or p2.price == nil then 0 else p2.price,
		product_id = if p2 == nil or p2.product_id == nil then 0 else p2.product_id,
		is_owned = if p2 == nil or p2.is_owned == nil then false else p2.is_owned,
		display_icon_image_asset_id = if p2 == nil or p2.display_icon_image_asset_id == nil then 0 else p2.display_icon_image_asset_id,
		display_description = if p2 == nil or p2.display_description == nil then "" else p2.display_description,
		price_discount_details = if p2 == nil or p2.price_discount_details == nil then {} else p2.price_discount_details,
		user_base_price_in_robux = if p2 == nil or p2.user_base_price_in_robux == nil then 0 else p2.user_base_price_in_robux,
		is_discounted = if p2 == nil or p2.is_discounted == nil then false else p2.is_discounted
	}, t_2)
end

function t_2:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var22 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var23, var24 = protoModule.writeTag(buff, var22, 1, protoModule.wireTypes.lengthDelimited)
		var23, var40 = protoModule.writeString(var23, var24, self.id)
		buff = var23
		var22 = var24
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var25, var26 = protoModule.writeTag(buff, var22, 2, protoModule.wireTypes.lengthDelimited)
		var25, var42 = protoModule.writeString(var25, var26, self.display_name)
		buff = var25
		var22 = var26
	end
	if self.price ~= nil and self.price ~= 0 then
		local var27, var28 = protoModule.writeTag(buff, var22, 3, protoModule.wireTypes.varint)
		var27, var44 = protoModule.writeVarInt(var27, var28, self.price)
		buff = var27
		var22 = var28
	end
	if self.product_id ~= nil and self.product_id ~= 0 then
		local var29, var30 = protoModule.writeTag(buff, var22, 4, protoModule.wireTypes.varint)
		var29, var46 = protoModule.writeVarInt(var29, var30, self.product_id)
		buff = var29
		var22 = var30
	end
	if self.is_owned then
		local var31, var32 = protoModule.writeTag(buff, var22, 5, protoModule.wireTypes.varint)
		var31, var48 = protoModule.writeVarInt(var31, var32, if self.is_owned then 1 else 0)
		buff = var31
		var22 = var32
	end
	if self.display_icon_image_asset_id ~= nil and self.display_icon_image_asset_id ~= 0 then
		local var33, var34 = protoModule.writeTag(buff, var22, 6, protoModule.wireTypes.varint)
		var33, var50 = protoModule.writeVarInt(var33, var34, self.display_icon_image_asset_id)
		buff = var33
		var22 = var34
	end
	if self.display_description ~= nil and self.display_description ~= "" then
		local var35, var36 = protoModule.writeTag(buff, var22, 7, protoModule.wireTypes.lengthDelimited)
		var35, var52 = protoModule.writeString(var35, var36, self.display_description)
		buff = var35
		var22 = var36
	end
	if self.price_discount_details ~= nil and #self.price_discount_details > 0 then
		for i, v in self.price_discount_details do
			local var37 = v:encode()
			local var38, var39 = protoModule.writeTag(buff, var22, 8, protoModule.wireTypes.lengthDelimited)
			var38, var55 = protoModule.writeBuffer(var38, var39, var37, buffer.len(var37))
			buff = var38
			var22 = var39
		end
	end
	if self.user_base_price_in_robux ~= nil and self.user_base_price_in_robux ~= 0 then
		local var40, var41 = protoModule.writeTag(buff, var22, 9, protoModule.wireTypes.varint)
		var40, var57 = protoModule.writeVarInt(var40, var41, self.user_base_price_in_robux)
		buff = var40
		var22 = var41
	end
	if self.is_discounted then
		local var42, var43 = protoModule.writeTag(buff, var22, 10, protoModule.wireTypes.varint)
		var42, var59 = protoModule.writeVarInt(var42, var43, if self.is_discounted then 1 else 0)
		buff = var42
		var22 = var43
	end
	local buff_1 = buffer.create(var22)
	buffer.copy(buff_1, 0, buff, 0, var22)
	
	return buff_1
end

function t_2.decode(p2)
	-- upvalues: t_2 (ref), protoModule (ref), t (ref)
	local var44 = t_2.new()
	local var45 = 0
	while var45 < buffer.len(p2) do
		local _ = nil
		local var46 = nil
		local var47, var48, var49 = protoModule.readTag(p2, var45)
		local var50 = var47
		var46 = var48
		var45 = var49
		
		if var46 == protoModule.wireTypes.varint then
			if var50 == 3 then
				local _ = nil
				local var51, var52 = protoModule.readVarIntI64(p2, var45)
				var45 = var52
				var44.price = var51
			elseif var50 == 4 then
				local _ = nil
				local var53, var54 = protoModule.readVarIntI64(p2, var45)
				var45 = var54
				var44.product_id = var53
			elseif var50 == 5 then
				local _ = nil
				local var55, var56 = protoModule.readVarInt(p2, var45)
				var45 = var56
				var44.is_owned = var55 ~= 0
			elseif var50 == 6 then
				local _ = nil
				local var57, var58 = protoModule.readVarIntI64(p2, var45)
				var45 = var58
				var44.display_icon_image_asset_id = var57
			elseif var50 == 9 then
				local _ = nil
				local var59, var60 = protoModule.readVarIntI64(p2, var45)
				var45 = var60
				var44.user_base_price_in_robux = var59
			elseif var50 == 10 then
				local _ = nil
				local var61, var62 = protoModule.readVarInt(p2, var45)
				var45 = var62
				var44.is_discounted = var61 ~= 0
			else
				local _ = nil
				local var63, var64 = protoModule.readVarInt(p2, var45)
				local _ = var63
				var45 = var64
			end
		end
		if var46 == protoModule.wireTypes.lengthDelimited then
			if var50 == 1 then
				local _ = nil
				local var65, var66 = protoModule.readBuffer(p2, var45)
				var45 = var66
				var44.id = buffer.tostring(var65)
			elseif var50 == 2 then
				local _ = nil
				local var67, var68 = protoModule.readBuffer(p2, var45)
				var45 = var68
				var44.display_name = buffer.tostring(var67)
			elseif var50 == 7 then
				local _ = nil
				local var69, var70 = protoModule.readBuffer(p2, var45)
				var45 = var70
				var44.display_description = buffer.tostring(var69)
			elseif var50 == 8 then
				local _ = nil
				local var71, var72 = protoModule.readBuffer(p2, var45)
				var45 = var72
				table.insert(var44.price_discount_details, t.PriceDiscountDetail.decode(var71))
			else
				local _ = nil
				local var73, var74 = protoModule.readVarInt(p2, var45)
				var45 = var74 + var73
			end
		elseif var46 == protoModule.wireTypes.i32 then
			local _ = nil
			local var75, var76 = protoModule.readFixed32(p2, var45)
			local _ = var75
			var45 = var76
		elseif var46 == protoModule.wireTypes.i64 then
			local _ = nil
			local var77, var78 = protoModule.readFixed64(p2, var45)
			local _ = var77
			var45 = var78
		else
			error("Unsupported wire type: " .. var63)
		end
	end
	return var44
end

function t_2:jsonEncode()
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
		local t_1 = {}
		
		for i, v in self.price_discount_details do
			table.insert(t_1, v:jsonEncode())
		end
		t.priceDiscountDetails = t_1
	end
	if self.user_base_price_in_robux ~= nil and self.user_base_price_in_robux ~= 0 then
		t.userBasePriceInRobux = self.user_base_price_in_robux
	end
	if self.is_discounted then
		t.isDiscounted = self.is_discounted
	end
	return t
end

function t_2:jsonDecode()
	-- upvalues: t_2 (ref), t (ref)
	local var79 = t_2.new()
	
	if self.id ~= nil then
		var79.id = self.id
	end
	if self.display_name ~= nil then
		var79.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var79.display_name = self.displayName
	end
	if self.price ~= nil then
		var79.price = self.price
	end
	if self.product_id ~= nil then
		var79.product_id = self.product_id
	end
	if self.productId ~= nil then
		var79.product_id = self.productId
	end
	if self.is_owned ~= nil then
		var79.is_owned = self.is_owned
	end
	if self.isOwned ~= nil then
		var79.is_owned = self.isOwned
	end
	if self.display_icon_image_asset_id ~= nil then
		var79.display_icon_image_asset_id = self.display_icon_image_asset_id
	end
	if self.displayIconImageAssetId ~= nil then
		var79.display_icon_image_asset_id = self.displayIconImageAssetId
	end
	if self.display_description ~= nil then
		var79.display_description = self.display_description
	end
	if self.displayDescription ~= nil then
		var79.display_description = self.displayDescription
	end
	if self.price_discount_details ~= nil then
		local t_1 = {}
		
		for i, v in self.price_discount_details do
			table.insert(t_1, t.PriceDiscountDetail.jsonDecode(v))
		end
		var79.price_discount_details = t_1
	end
	if self.priceDiscountDetails ~= nil then
		local t_1 = {}
		
		for i, v in self.priceDiscountDetails do
			table.insert(t_1, t.PriceDiscountDetail.jsonDecode(v))
		end
		var79.price_discount_details = t_1
	end
	if self.user_base_price_in_robux ~= nil then
		var79.user_base_price_in_robux = self.user_base_price_in_robux
	end
	if self.userBasePriceInRobux ~= nil then
		var79.user_base_price_in_robux = self.userBasePriceInRobux
	end
	if self.is_discounted ~= nil then
		var79.is_discounted = self.is_discounted
	end
	if self.isDiscounted ~= nil then
		var79.is_discounted = self.isDiscounted
	end
	return var79
end

t_2.descriptor = {
	name = "GamePassData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GamePassData"
}
t.GamePassData = t_2
typeRegistryModule.default:register(t.GamePassData)

return {
	PriceDiscountDetail = t.PriceDiscountDetail,
	GamePassData = t.GamePassData
}