local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
		id = if p1 == nil or p1.id == nil then nil else p1.id,
		name = if p1 == nil or p1.name == nil then nil else p1.name,
		type = if p1 == nil or p1.type == nil then nil else p1.type,
		target_id = if p1 == nil or p1.target_id == nil then nil else p1.target_id,
		has_verified_badge = if p1 == nil or p1.has_verified_badge == nil then nil else p1.has_verified_badge
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.id ~= nil then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var9 = protoModule.writeString(var2, var3, self.id)
		buff = var2
		var1 = var3
	end
	if self.name ~= nil then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var11 = protoModule.writeString(var4, var5, self.name)
		buff = var4
		var1 = var5
	end
	if self.type ~= nil then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var6, var13 = protoModule.writeString(var6, var7, self.type)
		buff = var6
		var1 = var7
	end
	if self.target_id ~= nil then
		local var8, var9 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var8, var15 = protoModule.writeString(var8, var9, self.target_id)
		buff = var8
		var1 = var9
	end
	if self.has_verified_badge ~= nil then
		local var10, var11 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.varint)
		var10, var17 = protoModule.writeVarInt(var10, var11, if self.has_verified_badge then 1 else 0)
		buff = var10
		var1 = var11
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
			if var7 == 5 then
				local _ = nil
				local var8, var9 = protoModule.readVarInt(p1, var2)
				var2 = var9
				var1.has_verified_badge = var8 ~= 0
			else
				local _ = nil
				local var10, var11 = protoModule.readVarInt(p1, var2)
				local _ = var10
				var2 = var11
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.id = buffer.tostring(var12)
			elseif var7 == 2 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.name = buffer.tostring(var14)
			elseif var7 == 3 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.type = buffer.tostring(var16)
			elseif var7 == 4 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.target_id = buffer.tostring(var18)
			else
				local _ = nil
				local var20, var21 = protoModule.readVarInt(p1, var2)
				var2 = var21 + var20
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var22, var23 = protoModule.readFixed32(p1, var2)
			local _ = var22
			var2 = var23
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var24, var25 = protoModule.readFixed64(p1, var2)
			local _ = var24
			var2 = var25
		else
			error("Unsupported wire type: " .. var21)
		end
	end
	return var1
end

function t_1:jsonEncode()
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

function t_1:jsonDecode()
	-- upvalues: t_1 (ref)
	local var26 = t_1.new()
	
	if self.id ~= nil then
		var26.id = self.id
	end
	if self.name ~= nil then
		var26.name = self.name
	end
	if self.type ~= nil then
		var26.type = self.type
	end
	if self.target_id ~= nil then
		var26.target_id = self.target_id
	end
	if self.targetId ~= nil then
		var26.target_id = self.targetId
	end
	if self.has_verified_badge ~= nil then
		var26.has_verified_badge = self.has_verified_badge
	end
	if self.hasVerifiedBadge ~= nil then
		var26.has_verified_badge = self.hasVerifiedBadge
	end
	return var26
end

t_1.descriptor = {
	name = "CollectibleItemCreator",
	fullName = "roblox.apppageplatform.shared.v1beta1.CollectibleItemCreator"
}
t.CollectibleItemCreator = t_1
typeRegistryModule.default:register(t.CollectibleItemCreator)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2)
	-- upvalues: t_2 (ref)
	return setmetatable({
		id = if p2 == nil or p2.id == nil then "" else p2.id,
		name = if p2 == nil or p2.name == nil then nil else p2.name,
		detail_page_link = if p2 == nil or p2.detail_page_link == nil then nil else p2.detail_page_link
	}, t_2)
end

function t_2:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var26 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var27, var28 = protoModule.writeTag(buff, var26, 1, protoModule.wireTypes.lengthDelimited)
		var27, var49 = protoModule.writeString(var27, var28, self.id)
		buff = var27
		var26 = var28
	end
	if self.name ~= nil then
		local var29, var30 = protoModule.writeTag(buff, var26, 2, protoModule.wireTypes.lengthDelimited)
		var29, var51 = protoModule.writeString(var29, var30, self.name)
		buff = var29
		var26 = var30
	end
	if self.detail_page_link ~= nil then
		local var31, var32 = protoModule.writeTag(buff, var26, 3, protoModule.wireTypes.lengthDelimited)
		var31, var53 = protoModule.writeString(var31, var32, self.detail_page_link)
		buff = var31
		var26 = var32
	end
	local buff_1 = buffer.create(var26)
	buffer.copy(buff_1, 0, buff, 0, var26)
	
	return buff_1
end

function t_2.decode(p2)
	-- upvalues: t_2 (ref), protoModule (ref)
	local var26 = t_2.new()
	local var27 = 0
	while var27 < buffer.len(p2) do
		local _ = nil
		local var28 = nil
		local var29, var30, var31 = protoModule.readTag(p2, var27)
		local var32 = var29
		var28 = var30
		var27 = var31
		
		if var28 == protoModule.wireTypes.varint then
			local _ = nil
			local var33, var34 = protoModule.readVarInt(p2, var27)
			local _ = var33
			var27 = var34
			continue
		end
		if var28 == protoModule.wireTypes.lengthDelimited then
			if var32 == 1 then
				local _ = nil
				local var35, var36 = protoModule.readBuffer(p2, var27)
				var27 = var36
				var26.id = buffer.tostring(var35)
			elseif var32 == 2 then
				local _ = nil
				local var37, var38 = protoModule.readBuffer(p2, var27)
				var27 = var38
				var26.name = buffer.tostring(var37)
			elseif var32 == 3 then
				local _ = nil
				local var39, var40 = protoModule.readBuffer(p2, var27)
				var27 = var40
				var26.detail_page_link = buffer.tostring(var39)
			else
				local _ = nil
				local var41, var42 = protoModule.readVarInt(p2, var27)
				var27 = var42 + var41
			end
		elseif var28 == protoModule.wireTypes.i32 then
			local _ = nil
			local var43, var44 = protoModule.readFixed32(p2, var27)
			local _ = var43
			var27 = var44
		elseif var28 == protoModule.wireTypes.i64 then
			local _ = nil
			local var45, var46 = protoModule.readFixed64(p2, var27)
			local _ = var45
			var27 = var46
		else
			error("Unsupported wire type: " .. var57)
		end
	end
	return var26
end

function t_2:jsonEncode()
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

function t_2:jsonDecode()
	-- upvalues: t_2 (ref)
	local var47 = t_2.new()
	
	if self.id ~= nil then
		var47.id = self.id
	end
	if self.name ~= nil then
		var47.name = self.name
	end
	if self.detail_page_link ~= nil then
		var47.detail_page_link = self.detail_page_link
	end
	if self.detailPageLink ~= nil then
		var47.detail_page_link = self.detailPageLink
	end
	return var47
end

t_2.descriptor = {
	name = "CollectibleItemExperience",
	fullName = "roblox.apppageplatform.shared.v1beta1.CollectibleItemExperience"
}
t.CollectibleItemExperience = t_2
typeRegistryModule.default:register(t.CollectibleItemExperience)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p3)
	-- upvalues: t_3 (ref)
	return setmetatable({
		id = if p3 == nil or p3.id == nil then "" else p3.id,
		collectible_product_id = if p3 == nil or p3.collectible_product_id == nil then nil else p3.collectible_product_id,
		name = if p3 == nil or p3.name == nil then nil else p3.name,
		description = if p3 == nil or p3.description == nil then nil else p3.description,
		creator = if p3 == nil or p3.creator == nil then nil else p3.creator,
		price = if p3 == nil or p3.price == nil then nil else p3.price,
		lowest_price = if p3 == nil or p3.lowest_price == nil then nil else p3.lowest_price,
		units_available_for_consumption = if p3 == nil or p3.units_available_for_consumption == nil then nil else p3.units_available_for_consumption,
		offsale_deadline = if p3 == nil or p3.offsale_deadline == nil then nil else p3.offsale_deadline,
		asset_stock = if p3 == nil or p3.asset_stock == nil then nil else p3.asset_stock,
		has_resellers = if p3 == nil or p3.has_resellers == nil then nil else p3.has_resellers,
		universe_ids = if p3 == nil or p3.universe_ids == nil then {} else p3.universe_ids,
		sale_location_type = if p3 == nil or p3.sale_location_type == nil then nil else p3.sale_location_type,
		quantity_limit_per_user = if p3 == nil or p3.quantity_limit_per_user == nil then nil else p3.quantity_limit_per_user,
		resale_restriction = if p3 == nil or p3.resale_restriction == nil then nil else p3.resale_restriction,
		lowest_available_resale_product_id = if p3 == nil or p3.lowest_available_resale_product_id == nil then nil else p3.lowest_available_resale_product_id,
		lowest_available_resale_item_instance_id = if p3 == nil or p3.lowest_available_resale_item_instance_id == nil then nil else p3.lowest_available_resale_item_instance_id,
		experiences = if p3 == nil or p3.experiences == nil then {} else p3.experiences
	}, t_3)
end

function t_3:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var47 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var48, var49 = protoModule.writeTag(buff, var47, 1, protoModule.wireTypes.lengthDelimited)
		var48, var81 = protoModule.writeString(var48, var49, self.id)
		buff = var48
		var47 = var49
	end
	if self.collectible_product_id ~= nil then
		local var50, var51 = protoModule.writeTag(buff, var47, 2, protoModule.wireTypes.lengthDelimited)
		var50, var83 = protoModule.writeString(var50, var51, self.collectible_product_id)
		buff = var50
		var47 = var51
	end
	if self.name ~= nil then
		local var52, var53 = protoModule.writeTag(buff, var47, 3, protoModule.wireTypes.lengthDelimited)
		var52, var85 = protoModule.writeString(var52, var53, self.name)
		buff = var52
		var47 = var53
	end
	if self.description ~= nil then
		local var54, var55 = protoModule.writeTag(buff, var47, 4, protoModule.wireTypes.lengthDelimited)
		var54, var87 = protoModule.writeString(var54, var55, self.description)
		buff = var54
		var47 = var55
	end
	if self.creator ~= nil then
		local var56 = self.creator:encode()
		local var57, var58 = protoModule.writeTag(buff, var47, 5, protoModule.wireTypes.lengthDelimited)
		var57, var90 = protoModule.writeBuffer(var57, var58, var56, buffer.len(var56))
		buff = var57
		var47 = var58
	end
	if self.price ~= nil then
		local var59, var60 = protoModule.writeTag(buff, var47, 6, protoModule.wireTypes.varint)
		var59, var92 = protoModule.writeVarInt(var59, var60, self.price)
		buff = var59
		var47 = var60
	end
	if self.lowest_price ~= nil then
		local var61, var62 = protoModule.writeTag(buff, var47, 7, protoModule.wireTypes.varint)
		var61, var94 = protoModule.writeVarInt(var61, var62, self.lowest_price)
		buff = var61
		var47 = var62
	end
	if self.units_available_for_consumption ~= nil then
		local var63, var64 = protoModule.writeTag(buff, var47, 8, protoModule.wireTypes.varint)
		var63, var96 = protoModule.writeVarInt(var63, var64, self.units_available_for_consumption)
		buff = var63
		var47 = var64
	end
	if self.offsale_deadline ~= nil then
		local var65, var66 = protoModule.writeTag(buff, var47, 9, protoModule.wireTypes.lengthDelimited)
		var65, var98 = protoModule.writeString(var65, var66, self.offsale_deadline)
		buff = var65
		var47 = var66
	end
	if self.asset_stock ~= nil then
		local var67, var68 = protoModule.writeTag(buff, var47, 10, protoModule.wireTypes.varint)
		var67, var100 = protoModule.writeVarInt(var67, var68, self.asset_stock)
		buff = var67
		var47 = var68
	end
	if self.has_resellers ~= nil then
		local var69, var70 = protoModule.writeTag(buff, var47, 11, protoModule.wireTypes.varint)
		var69, var102 = protoModule.writeVarInt(var69, var70, if self.has_resellers then 1 else 0)
		buff = var69
		var47 = var70
	end
	if self.universe_ids ~= nil and #self.universe_ids > 0 then
		for i, v in self.universe_ids do
			local var71, var72 = protoModule.writeTag(buff, var47, 12, protoModule.wireTypes.lengthDelimited)
			var71, var104 = protoModule.writeString(var71, var72, v)
			buff = var71
			var47 = var72
		end
	end
	if self.sale_location_type ~= nil then
		local var73, var74 = protoModule.writeTag(buff, var47, 13, protoModule.wireTypes.lengthDelimited)
		var73, var106 = protoModule.writeString(var73, var74, self.sale_location_type)
		buff = var73
		var47 = var74
	end
	if self.quantity_limit_per_user ~= nil then
		local var75, var76 = protoModule.writeTag(buff, var47, 14, protoModule.wireTypes.varint)
		var75, var108 = protoModule.writeVarInt(var75, var76, self.quantity_limit_per_user)
		buff = var75
		var47 = var76
	end
	if self.resale_restriction ~= nil then
		local var77, var78 = protoModule.writeTag(buff, var47, 15, protoModule.wireTypes.varint)
		var77, var110 = protoModule.writeVarInt(var77, var78, self.resale_restriction)
		buff = var77
		var47 = var78
	end
	if self.lowest_available_resale_product_id ~= nil then
		local var79, var80 = protoModule.writeTag(buff, var47, 16, protoModule.wireTypes.lengthDelimited)
		var79, var112 = protoModule.writeString(var79, var80, self.lowest_available_resale_product_id)
		buff = var79
		var47 = var80
	end
	if self.lowest_available_resale_item_instance_id ~= nil then
		local var81, var82 = protoModule.writeTag(buff, var47, 17, protoModule.wireTypes.lengthDelimited)
		var81, var114 = protoModule.writeString(var81, var82, self.lowest_available_resale_item_instance_id)
		buff = var81
		var47 = var82
	end
	if self.experiences ~= nil and #self.experiences > 0 then
		for i, v in self.experiences do
			local var83 = v:encode()
			local var84, var85 = protoModule.writeTag(buff, var47, 18, protoModule.wireTypes.lengthDelimited)
			var84, var117 = protoModule.writeBuffer(var84, var85, var83, buffer.len(var83))
			buff = var84
			var47 = var85
		end
	end
	local buff_1 = buffer.create(var47)
	buffer.copy(buff_1, 0, buff, 0, var47)
	
	return buff_1
end

function t_3.decode(p3)
	-- upvalues: t_3 (ref), protoModule (ref), t (ref)
	local var86 = t_3.new()
	local var87 = 0
	while var87 < buffer.len(p3) do
		local _ = nil
		local var88 = nil
		local var89, var90, var91 = protoModule.readTag(p3, var87)
		local var92 = var89
		var88 = var90
		var87 = var91
		
		if var88 == protoModule.wireTypes.varint then
			if var92 == 6 then
				local _ = nil
				local var93, var94 = protoModule.readVarIntI64(p3, var87)
				var87 = var94
				var86.price = var93
			elseif var92 == 7 then
				local _ = nil
				local var95, var96 = protoModule.readVarIntI64(p3, var87)
				var87 = var96
				var86.lowest_price = var95
			elseif var92 == 8 then
				local _ = nil
				local var97, var98 = protoModule.readVarIntI64(p3, var87)
				var87 = var98
				var86.units_available_for_consumption = var97
			elseif var92 == 10 then
				local _ = nil
				local var99, var100 = protoModule.readVarIntI64(p3, var87)
				var87 = var100
				var86.asset_stock = var99
			elseif var92 == 11 then
				local _ = nil
				local var101, var102 = protoModule.readVarInt(p3, var87)
				var87 = var102
				var86.has_resellers = var101 ~= 0
			elseif var92 == 14 then
				local _ = nil
				local var103, var104 = protoModule.readVarIntI32(p3, var87)
				var87 = var104
				var86.quantity_limit_per_user = var103
			elseif var92 == 15 then
				local _ = nil
				local var105, var106 = protoModule.readVarIntI32(p3, var87)
				var87 = var106
				var86.resale_restriction = var105
			else
				local _ = nil
				local var107, var108 = protoModule.readVarInt(p3, var87)
				local _ = var107
				var87 = var108
			end
		end
		if var88 == protoModule.wireTypes.lengthDelimited then
			if var92 == 1 then
				local _ = nil
				local var109, var110 = protoModule.readBuffer(p3, var87)
				var87 = var110
				var86.id = buffer.tostring(var109)
			elseif var92 == 2 then
				local _ = nil
				local var111, var112 = protoModule.readBuffer(p3, var87)
				var87 = var112
				var86.collectible_product_id = buffer.tostring(var111)
			elseif var92 == 3 then
				local _ = nil
				local var113, var114 = protoModule.readBuffer(p3, var87)
				var87 = var114
				var86.name = buffer.tostring(var113)
			elseif var92 == 4 then
				local _ = nil
				local var115, var116 = protoModule.readBuffer(p3, var87)
				var87 = var116
				var86.description = buffer.tostring(var115)
			elseif var92 == 5 then
				local _ = nil
				local var117, var118 = protoModule.readBuffer(p3, var87)
				var87 = var118
				var86.creator = t.CollectibleItemCreator.decode(var117)
			elseif var92 == 9 then
				local _ = nil
				local var119, var120 = protoModule.readBuffer(p3, var87)
				var87 = var120
				var86.offsale_deadline = buffer.tostring(var119)
			elseif var92 == 12 then
				local _ = nil
				local var121, var122 = protoModule.readBuffer(p3, var87)
				var87 = var122
				table.insert(var86.universe_ids, buffer.tostring(var121))
			elseif var92 == 13 then
				local _ = nil
				local var123, var124 = protoModule.readBuffer(p3, var87)
				var87 = var124
				var86.sale_location_type = buffer.tostring(var123)
			elseif var92 == 16 then
				local _ = nil
				local var125, var126 = protoModule.readBuffer(p3, var87)
				var87 = var126
				var86.lowest_available_resale_product_id = buffer.tostring(var125)
			elseif var92 == 17 then
				local _ = nil
				local var127, var128 = protoModule.readBuffer(p3, var87)
				var87 = var128
				var86.lowest_available_resale_item_instance_id = buffer.tostring(var127)
			elseif var92 == 18 then
				local _ = nil
				local var129, var130 = protoModule.readBuffer(p3, var87)
				var87 = var130
				table.insert(var86.experiences, t.CollectibleItemExperience.decode(var129))
			else
				local _ = nil
				local var131, var132 = protoModule.readVarInt(p3, var87)
				var87 = var132 + var131
			end
		elseif var88 == protoModule.wireTypes.i32 then
			local _ = nil
			local var133, var134 = protoModule.readFixed32(p3, var87)
			local _ = var133
			var87 = var134
		elseif var88 == protoModule.wireTypes.i64 then
			local _ = nil
			local var135, var136 = protoModule.readFixed64(p3, var87)
			local _ = var135
			var87 = var136
		else
			error("Unsupported wire type: " .. var121)
		end
	end
	return var86
end

function t_3:jsonEncode()
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
		local t_1 = {}
		
		for i, v in self.universe_ids do
			table.insert(t_1, v)
		end
		t.universeIds = t_1
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
		local t_1 = {}
		
		for i, v in self.experiences do
			table.insert(t_1, v:jsonEncode())
		end
		t.experiences = t_1
	end
	return t
end

function t_3:jsonDecode()
	-- upvalues: t_3 (ref), t (ref)
	local var137 = t_3.new()
	
	if self.id ~= nil then
		var137.id = self.id
	end
	if self.collectible_product_id ~= nil then
		var137.collectible_product_id = self.collectible_product_id
	end
	if self.collectibleProductId ~= nil then
		var137.collectible_product_id = self.collectibleProductId
	end
	if self.name ~= nil then
		var137.name = self.name
	end
	if self.description ~= nil then
		var137.description = self.description
	end
	if self.creator ~= nil then
		var137.creator = t.CollectibleItemCreator.jsonDecode(self.creator)
	end
	if self.price ~= nil then
		var137.price = self.price
	end
	if self.lowest_price ~= nil then
		var137.lowest_price = self.lowest_price
	end
	if self.lowestPrice ~= nil then
		var137.lowest_price = self.lowestPrice
	end
	if self.units_available_for_consumption ~= nil then
		var137.units_available_for_consumption = self.units_available_for_consumption
	end
	if self.unitsAvailableForConsumption ~= nil then
		var137.units_available_for_consumption = self.unitsAvailableForConsumption
	end
	if self.offsale_deadline ~= nil then
		var137.offsale_deadline = self.offsale_deadline
	end
	if self.offsaleDeadline ~= nil then
		var137.offsale_deadline = self.offsaleDeadline
	end
	if self.asset_stock ~= nil then
		var137.asset_stock = self.asset_stock
	end
	if self.assetStock ~= nil then
		var137.asset_stock = self.assetStock
	end
	if self.has_resellers ~= nil then
		var137.has_resellers = self.has_resellers
	end
	if self.hasResellers ~= nil then
		var137.has_resellers = self.hasResellers
	end
	if self.universe_ids ~= nil then
		local t_1 = {}
		
		for i, v in self.universe_ids do
			table.insert(t_1, v)
		end
		var137.universe_ids = t_1
	end
	if self.universeIds ~= nil then
		local t_1 = {}
		
		for i, v in self.universeIds do
			table.insert(t_1, v)
		end
		var137.universe_ids = t_1
	end
	if self.sale_location_type ~= nil then
		var137.sale_location_type = self.sale_location_type
	end
	if self.saleLocationType ~= nil then
		var137.sale_location_type = self.saleLocationType
	end
	if self.quantity_limit_per_user ~= nil then
		var137.quantity_limit_per_user = self.quantity_limit_per_user
	end
	if self.quantityLimitPerUser ~= nil then
		var137.quantity_limit_per_user = self.quantityLimitPerUser
	end
	if self.resale_restriction ~= nil then
		var137.resale_restriction = self.resale_restriction
	end
	if self.resaleRestriction ~= nil then
		var137.resale_restriction = self.resaleRestriction
	end
	if self.lowest_available_resale_product_id ~= nil then
		var137.lowest_available_resale_product_id = self.lowest_available_resale_product_id
	end
	if self.lowestAvailableResaleProductId ~= nil then
		var137.lowest_available_resale_product_id = self.lowestAvailableResaleProductId
	end
	if self.lowest_available_resale_item_instance_id ~= nil then
		var137.lowest_available_resale_item_instance_id = self.lowest_available_resale_item_instance_id
	end
	if self.lowestAvailableResaleItemInstanceId ~= nil then
		var137.lowest_available_resale_item_instance_id = self.lowestAvailableResaleItemInstanceId
	end
	if self.experiences ~= nil then
		local t_1 = {}
		
		for i, v in self.experiences do
			table.insert(t_1, t.CollectibleItemExperience.jsonDecode(v))
		end
		var137.experiences = t_1
	end
	return var137
end

t_3.descriptor = {
	name = "CollectibleItemData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CollectibleItemData"
}
t.CollectibleItemData = t_3
typeRegistryModule.default:register(t.CollectibleItemData)

return {
	CollectibleItemCreator = t.CollectibleItemCreator,
	CollectibleItemExperience = t.CollectibleItemExperience,
	CollectibleItemData = t.CollectibleItemData
}