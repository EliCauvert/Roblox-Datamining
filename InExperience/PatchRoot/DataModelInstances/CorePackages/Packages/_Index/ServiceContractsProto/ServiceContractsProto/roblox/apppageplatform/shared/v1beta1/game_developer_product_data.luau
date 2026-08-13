local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 58 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({
		id = if p0 == nil or p0.id == nil then "" else p0.id,
		name = if p0 == nil or p0.name == nil then "" else p0.name,
		description = if p0 == nil or p0.description == nil then "" else p0.description,
		image_asset_id = if p0 == nil or p0.image_asset_id == nil then 0 else p0.image_asset_id,
		price_in_robux = if p0 == nil or p0.price_in_robux == nil then 0 else p0.price_in_robux,
		pending_receipt_count = if p0 == nil or p0.pending_receipt_count == nil then 0 else p0.pending_receipt_count,
		status_tooltip = if p0 == nil or p0.status_tooltip == nil then "" else p0.status_tooltip,
		base_price_in_robux = if p0 == nil or p0.base_price_in_robux == nil then 0 else p0.base_price_in_robux,
		is_discounted = if p0 == nil or p0.is_discounted == nil then false else p0.is_discounted
	}, t_1)
end

function t_1:encode() --[[ line: 76 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var6, var7 = protoModule.writeTag(buff, var5, 1, protoModule.wireTypes.lengthDelimited)
		var6, var7 = protoModule.writeString(var6, var7, self.id)
		buff = var6
		var5 = var7
	end
	if self.name ~= nil and self.name ~= "" then
		local var8, var9 = protoModule.writeTag(buff, var5, 2, protoModule.wireTypes.lengthDelimited)
		var8, var9 = protoModule.writeString(var8, var9, self.name)
		buff = var8
		var5 = var9
	end
	if self.description ~= nil and self.description ~= "" then
		local var10, var11 = protoModule.writeTag(buff, var5, 3, protoModule.wireTypes.lengthDelimited)
		var10, var11 = protoModule.writeString(var10, var11, self.description)
		buff = var10
		var5 = var11
	end
	if self.image_asset_id ~= nil and self.image_asset_id ~= 0 then
		local var12, var13 = protoModule.writeTag(buff, var5, 4, protoModule.wireTypes.varint)
		var12, var13 = protoModule.writeVarInt(var12, var13, self.image_asset_id)
		buff = var12
		var5 = var13
	end
	if self.price_in_robux ~= nil and self.price_in_robux ~= 0 then
		local var14, var15 = protoModule.writeTag(buff, var5, 5, protoModule.wireTypes.varint)
		var14, var15 = protoModule.writeVarInt(var14, var15, self.price_in_robux)
		buff = var14
		var5 = var15
	end
	if self.pending_receipt_count ~= nil and self.pending_receipt_count ~= 0 then
		local var16, var17 = protoModule.writeTag(buff, var5, 6, protoModule.wireTypes.varint)
		var16, var17 = protoModule.writeVarInt(var16, var17, self.pending_receipt_count)
		buff = var16
		var5 = var17
	end
	if self.status_tooltip ~= nil and self.status_tooltip ~= "" then
		local var18, var19 = protoModule.writeTag(buff, var5, 7, protoModule.wireTypes.lengthDelimited)
		var18, var19 = protoModule.writeString(var18, var19, self.status_tooltip)
		buff = var18
		var5 = var19
	end
	if self.base_price_in_robux ~= nil and self.base_price_in_robux ~= 0 then
		local var20, var21 = protoModule.writeTag(buff, var5, 8, protoModule.wireTypes.varint)
		var20, var21 = protoModule.writeVarInt(var20, var21, self.base_price_in_robux)
		buff = var20
		var5 = var21
	end
	if self.is_discounted then
		local var22, var23 = protoModule.writeTag(buff, var5, 9, protoModule.wireTypes.varint)
		var22, var23 = protoModule.writeVarInt(var22, var23, if self.is_discounted then 1 else 0)
		buff = var22
		var5 = var23
	end
	local buff_1 = buffer.create(var5)
	buffer.copy(buff_1, 0, buff, 0, var5)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 130 ]]
	-- upvalues: t_1 (ref), protoModule (ref)
	local var25 = t_1.new()
	local var26 = 0
	while var26 < buffer.len(p1) do
		local _ = nil
		local var27 = nil
		local var28, var29, var30 = protoModule.readTag(p1, var26)
		local var31 = var28
		var27 = var29
		var26 = var30
		
		if var27 == protoModule.wireTypes.varint then
			if var31 == 4 then
				local _ = nil
				local var32, var33 = protoModule.readVarIntI64(p1, var26)
				var26 = var33
				var25.image_asset_id = var32
			elseif var31 == 5 then
				local _ = nil
				local var34, var35 = protoModule.readVarIntI64(p1, var26)
				var26 = var35
				var25.price_in_robux = var34
			elseif var31 == 6 then
				local _ = nil
				local var36, var37 = protoModule.readVarIntI32(p1, var26)
				var26 = var37
				var25.pending_receipt_count = var36
			elseif var31 == 8 then
				local _ = nil
				local var38, var39 = protoModule.readVarIntI64(p1, var26)
				var26 = var39
				var25.base_price_in_robux = var38
			elseif var31 == 9 then
				local _ = nil
				local var40, var41 = protoModule.readVarInt(p1, var26)
				var26 = var41
				var25.is_discounted = var40 ~= 0
			else
				local _ = nil
				local var42, var43 = protoModule.readVarInt(p1, var26)
				local _ = var42
				var26 = var43
			end
		end
		if var27 == protoModule.wireTypes.lengthDelimited then
			if var31 == 1 then
				local _ = nil
				local var44, var45 = protoModule.readBuffer(p1, var26)
				var26 = var45
				var25.id = buffer.tostring(var44)
			elseif var31 == 2 then
				local _ = nil
				local var46, var47 = protoModule.readBuffer(p1, var26)
				var26 = var47
				var25.name = buffer.tostring(var46)
			elseif var31 == 3 then
				local _ = nil
				local var48, var49 = protoModule.readBuffer(p1, var26)
				var26 = var49
				var25.description = buffer.tostring(var48)
			elseif var31 == 7 then
				local _ = nil
				local var50, var51 = protoModule.readBuffer(p1, var26)
				var26 = var51
				var25.status_tooltip = buffer.tostring(var50)
			else
				local _ = nil
				local var52, var53 = protoModule.readVarInt(p1, var26)
				var26 = var53 + var52
			end
		elseif var27 == protoModule.wireTypes.i32 then
			local _ = nil
			local var54, var55 = protoModule.readFixed32(p1, var26)
			local _ = var54
			var26 = var55
		elseif var27 == protoModule.wireTypes.i64 then
			local _ = nil
			local var56, var57 = protoModule.readFixed64(p1, var26)
			local _ = var56
			var26 = var57
		else
			error("Unsupported wire type: " .. var27)
		end
	end
	return var25
end

function t_1:jsonEncode() --[[ line: 213 ]]
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.name ~= nil and self.name ~= "" then
		t.name = self.name
	end
	if self.description ~= nil and self.description ~= "" then
		t.description = self.description
	end
	if self.image_asset_id ~= nil and self.image_asset_id ~= 0 then
		t.imageAssetId = self.image_asset_id
	end
	if self.price_in_robux ~= nil and self.price_in_robux ~= 0 then
		t.priceInRobux = self.price_in_robux
	end
	if self.pending_receipt_count ~= nil and self.pending_receipt_count ~= 0 then
		t.pendingReceiptCount = self.pending_receipt_count
	end
	if self.status_tooltip ~= nil and self.status_tooltip ~= "" then
		t.statusTooltip = self.status_tooltip
	end
	if self.base_price_in_robux ~= nil and self.base_price_in_robux ~= 0 then
		t.basePriceInRobux = self.base_price_in_robux
	end
	if self.is_discounted then
		t.isDiscounted = self.is_discounted
	end
	return t
end

function t_1:jsonDecode() --[[ line: 255 ]]
	-- upvalues: t_1 (ref)
	local var59 = t_1.new()
	
	if self.id ~= nil then
		var59.id = self.id
	end
	if self.name ~= nil then
		var59.name = self.name
	end
	if self.description ~= nil then
		var59.description = self.description
	end
	if self.image_asset_id ~= nil then
		var59.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var59.image_asset_id = self.imageAssetId
	end
	if self.price_in_robux ~= nil then
		var59.price_in_robux = self.price_in_robux
	end
	if self.priceInRobux ~= nil then
		var59.price_in_robux = self.priceInRobux
	end
	if self.pending_receipt_count ~= nil then
		var59.pending_receipt_count = self.pending_receipt_count
	end
	if self.pendingReceiptCount ~= nil then
		var59.pending_receipt_count = self.pendingReceiptCount
	end
	if self.status_tooltip ~= nil then
		var59.status_tooltip = self.status_tooltip
	end
	if self.statusTooltip ~= nil then
		var59.status_tooltip = self.statusTooltip
	end
	if self.base_price_in_robux ~= nil then
		var59.base_price_in_robux = self.base_price_in_robux
	end
	if self.basePriceInRobux ~= nil then
		var59.base_price_in_robux = self.basePriceInRobux
	end
	if self.is_discounted ~= nil then
		var59.is_discounted = self.is_discounted
	end
	if self.isDiscounted ~= nil then
		var59.is_discounted = self.isDiscounted
	end
	return var59
end

t_1.descriptor = {
	name = "GameDeveloperProductData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GameDeveloperProductData"
}
t.GameDeveloperProductData = t_1
typeRegistryModule.default:register(t.GameDeveloperProductData)

return { GameDeveloperProductData = t.GameDeveloperProductData }