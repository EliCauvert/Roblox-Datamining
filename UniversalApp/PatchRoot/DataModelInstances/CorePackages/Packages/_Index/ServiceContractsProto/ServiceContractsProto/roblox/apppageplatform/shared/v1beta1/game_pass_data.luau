local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 81 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({
		type = if p0 == nil or p0.type == nil then "" else p0.type,
		amount_in_robux = if p0 == nil or p0.amount_in_robux == nil then 0 else p0.amount_in_robux,
		percent = if p0 == nil or p0.percent == nil then 0 else p0.percent
	}, t_1)
end

function t_1:encode() --[[ line: 89 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var6 = 0
	
	if self.type ~= nil and self.type ~= "" then
		local var7, var8 = protoModule.writeTag(buff, var6, 1, protoModule.wireTypes.lengthDelimited)
		var7, var8 = protoModule.writeString(var7, var8, self.type)
		buff = var7
		var6 = var8
	end
	if self.amount_in_robux ~= nil and self.amount_in_robux ~= 0 then
		local var9, var10 = protoModule.writeTag(buff, var6, 2, protoModule.wireTypes.varint)
		var9, var10 = protoModule.writeVarInt(var9, var10, self.amount_in_robux)
		buff = var9
		var6 = var10
	end
	if self.percent ~= nil and self.percent ~= 0 then
		local var11, var12 = protoModule.writeTag(buff, var6, 3, protoModule.wireTypes.varint)
		var11, var12 = protoModule.writeVarInt(var11, var12, self.percent)
		buff = var11
		var6 = var12
	end
	local buff_1 = buffer.create(var6)
	buffer.copy(buff_1, 0, buff, 0, var6)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 113 ]]
	-- upvalues: t_1 (ref), protoModule (ref)
	local var14 = t_1.new()
	local var15 = 0
	while var15 < buffer.len(p1) do
		local _ = nil
		local var16 = nil
		local var17, var18, var19 = protoModule.readTag(p1, var15)
		local var20 = var17
		var16 = var18
		var15 = var19
		
		if var16 == protoModule.wireTypes.varint then
			if var20 == 2 then
				local _ = nil
				local var21, var22 = protoModule.readVarIntI64(p1, var15)
				var15 = var22
				var14.amount_in_robux = var21
			elseif var20 == 3 then
				local _ = nil
				local var23, var24 = protoModule.readVarIntI64(p1, var15)
				var15 = var24
				var14.percent = var23
			else
				local _ = nil
				local var25, var26 = protoModule.readVarInt(p1, var15)
				local _ = var25
				var15 = var26
			end
		end
		if var16 == protoModule.wireTypes.lengthDelimited then
			if var20 == 1 then
				local _ = nil
				local var27, var28 = protoModule.readBuffer(p1, var15)
				var15 = var28
				var14.type = buffer.tostring(var27)
			else
				local _ = nil
				local var29, var30 = protoModule.readVarInt(p1, var15)
				var15 = var30 + var29
			end
		elseif var16 == protoModule.wireTypes.i32 then
			local _ = nil
			local var31, var32 = protoModule.readFixed32(p1, var15)
			local _ = var31
			var15 = var32
		elseif var16 == protoModule.wireTypes.i64 then
			local _ = nil
			local var33, var34 = protoModule.readFixed64(p1, var15)
			local _ = var33
			var15 = var34
		else
			error("Unsupported wire type: " .. var16)
		end
	end
	return var14
end

function t_1:jsonEncode() --[[ line: 166 ]]
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

function t_1:jsonDecode() --[[ line: 184 ]]
	-- upvalues: t_1 (ref)
	local var36 = t_1.new()
	
	if self.type ~= nil then
		var36.type = self.type
	end
	if self.amount_in_robux ~= nil then
		var36.amount_in_robux = self.amount_in_robux
	end
	if self.amountInRobux ~= nil then
		var36.amount_in_robux = self.amountInRobux
	end
	if self.percent ~= nil then
		var36.percent = self.percent
	end
	return var36
end

t_1.descriptor = {
	name = "PriceDiscountDetail",
	fullName = "roblox.apppageplatform.shared.v1beta1.PriceDiscountDetail"
}
t.PriceDiscountDetail = t_1
typeRegistryModule.default:register(t.PriceDiscountDetail)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2) --[[ line: 220 ]]
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
		user_base_price_in_robux = if p2 == nil or p2.user_base_price_in_robux == nil then 0 else p2.user_base_price_in_robux
	}, t_2)
end

function t_2:encode() --[[ line: 242 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var38 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var39, var40 = protoModule.writeTag(buff, var38, 1, protoModule.wireTypes.lengthDelimited)
		var39, var40 = protoModule.writeString(var39, var40, self.id)
		buff = var39
		var38 = var40
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var41, var42 = protoModule.writeTag(buff, var38, 2, protoModule.wireTypes.lengthDelimited)
		var41, var42 = protoModule.writeString(var41, var42, self.display_name)
		buff = var41
		var38 = var42
	end
	if self.price ~= nil and self.price ~= 0 then
		local var43, var44 = protoModule.writeTag(buff, var38, 3, protoModule.wireTypes.varint)
		var43, var44 = protoModule.writeVarInt(var43, var44, self.price)
		buff = var43
		var38 = var44
	end
	if self.product_id ~= nil and self.product_id ~= 0 then
		local var45, var46 = protoModule.writeTag(buff, var38, 4, protoModule.wireTypes.varint)
		var45, var46 = protoModule.writeVarInt(var45, var46, self.product_id)
		buff = var45
		var38 = var46
	end
	if self.is_owned then
		local var47, var48 = protoModule.writeTag(buff, var38, 5, protoModule.wireTypes.varint)
		var47, var48 = protoModule.writeVarInt(var47, var48, if self.is_owned then 1 else 0)
		buff = var47
		var38 = var48
	end
	if self.display_icon_image_asset_id ~= nil and self.display_icon_image_asset_id ~= 0 then
		local var49, var50 = protoModule.writeTag(buff, var38, 6, protoModule.wireTypes.varint)
		var49, var50 = protoModule.writeVarInt(var49, var50, self.display_icon_image_asset_id)
		buff = var49
		var38 = var50
	end
	if self.display_description ~= nil and self.display_description ~= "" then
		local var51, var52 = protoModule.writeTag(buff, var38, 7, protoModule.wireTypes.lengthDelimited)
		var51, var52 = protoModule.writeString(var51, var52, self.display_description)
		buff = var51
		var38 = var52
	end
	if self.price_discount_details ~= nil and #self.price_discount_details > 0 then
		for i, v in self.price_discount_details do
			local var53 = v:encode()
			local var54, var55 = protoModule.writeTag(buff, var38, 8, protoModule.wireTypes.lengthDelimited)
			var54, var55 = protoModule.writeBuffer(var54, var55, var53, buffer.len(var53))
			buff = var54
			var38 = var55
		end
	end
	if self.user_base_price_in_robux ~= nil and self.user_base_price_in_robux ~= 0 then
		local var56, var57 = protoModule.writeTag(buff, var38, 9, protoModule.wireTypes.varint)
		var56, var57 = protoModule.writeVarInt(var56, var57, self.user_base_price_in_robux)
		buff = var56
		var38 = var57
	end
	local buff_1 = buffer.create(var38)
	buffer.copy(buff_1, 0, buff, 0, var38)
	
	return buff_1
end

function t_2.decode(p3) --[[ line: 299 ]]
	-- upvalues: t_2 (ref), protoModule (ref), t (ref)
	local var59 = t_2.new()
	local var60 = 0
	while var60 < buffer.len(p3) do
		local _ = nil
		local var61 = nil
		local var62, var63, var64 = protoModule.readTag(p3, var60)
		local var65 = var62
		var61 = var63
		var60 = var64
		
		if var61 == protoModule.wireTypes.varint then
			if var65 == 3 then
				local _ = nil
				local var66, var67 = protoModule.readVarIntI64(p3, var60)
				var60 = var67
				var59.price = var66
			elseif var65 == 4 then
				local _ = nil
				local var68, var69 = protoModule.readVarIntI64(p3, var60)
				var60 = var69
				var59.product_id = var68
			elseif var65 == 5 then
				local _ = nil
				local var70, var71 = protoModule.readVarInt(p3, var60)
				var60 = var71
				var59.is_owned = var70 ~= 0
			elseif var65 == 6 then
				local _ = nil
				local var72, var73 = protoModule.readVarIntI64(p3, var60)
				var60 = var73
				var59.display_icon_image_asset_id = var72
			elseif var65 == 9 then
				local _ = nil
				local var74, var75 = protoModule.readVarIntI64(p3, var60)
				var60 = var75
				var59.user_base_price_in_robux = var74
			else
				local _ = nil
				local var76, var77 = protoModule.readVarInt(p3, var60)
				local _ = var76
				var60 = var77
			end
		end
		if var61 == protoModule.wireTypes.lengthDelimited then
			if var65 == 1 then
				local _ = nil
				local var78, var79 = protoModule.readBuffer(p3, var60)
				var60 = var79
				var59.id = buffer.tostring(var78)
			elseif var65 == 2 then
				local _ = nil
				local var80, var81 = protoModule.readBuffer(p3, var60)
				var60 = var81
				var59.display_name = buffer.tostring(var80)
			elseif var65 == 7 then
				local _ = nil
				local var82, var83 = protoModule.readBuffer(p3, var60)
				var60 = var83
				var59.display_description = buffer.tostring(var82)
			elseif var65 == 8 then
				local _ = nil
				local var84, var85 = protoModule.readBuffer(p3, var60)
				var60 = var85
				table.insert(var59.price_discount_details, t.PriceDiscountDetail.decode(var84))
			else
				local _ = nil
				local var86, var87 = protoModule.readVarInt(p3, var60)
				var60 = var87 + var86
			end
		elseif var61 == protoModule.wireTypes.i32 then
			local _ = nil
			local var88, var89 = protoModule.readFixed32(p3, var60)
			local _ = var88
			var60 = var89
		elseif var61 == protoModule.wireTypes.i64 then
			local _ = nil
			local var90, var91 = protoModule.readFixed64(p3, var60)
			local _ = var90
			var60 = var91
		else
			error("Unsupported wire type: " .. var61)
		end
	end
	return var59
end

function t_2:jsonEncode() --[[ line: 382 ]]
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
	return t
end

function t_2:jsonDecode() --[[ line: 428 ]]
	-- upvalues: t_2 (ref), t (ref)
	local var94 = t_2.new()
	
	if self.id ~= nil then
		var94.id = self.id
	end
	if self.display_name ~= nil then
		var94.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var94.display_name = self.displayName
	end
	if self.price ~= nil then
		var94.price = self.price
	end
	if self.product_id ~= nil then
		var94.product_id = self.product_id
	end
	if self.productId ~= nil then
		var94.product_id = self.productId
	end
	if self.is_owned ~= nil then
		var94.is_owned = self.is_owned
	end
	if self.isOwned ~= nil then
		var94.is_owned = self.isOwned
	end
	if self.display_icon_image_asset_id ~= nil then
		var94.display_icon_image_asset_id = self.display_icon_image_asset_id
	end
	if self.displayIconImageAssetId ~= nil then
		var94.display_icon_image_asset_id = self.displayIconImageAssetId
	end
	if self.display_description ~= nil then
		var94.display_description = self.display_description
	end
	if self.displayDescription ~= nil then
		var94.display_description = self.displayDescription
	end
	if self.price_discount_details ~= nil then
		local t_1 = {}
		
		for i, v in self.price_discount_details do
			table.insert(t_1, t.PriceDiscountDetail.jsonDecode(v))
		end
		var94.price_discount_details = t_1
	end
	if self.priceDiscountDetails ~= nil then
		local t_1 = {}
		
		for i, v in self.priceDiscountDetails do
			table.insert(t_1, t.PriceDiscountDetail.jsonDecode(v))
		end
		var94.price_discount_details = t_1
	end
	if self.user_base_price_in_robux ~= nil then
		var94.user_base_price_in_robux = self.user_base_price_in_robux
	end
	if self.userBasePriceInRobux ~= nil then
		var94.user_base_price_in_robux = self.userBasePriceInRobux
	end
	return var94
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