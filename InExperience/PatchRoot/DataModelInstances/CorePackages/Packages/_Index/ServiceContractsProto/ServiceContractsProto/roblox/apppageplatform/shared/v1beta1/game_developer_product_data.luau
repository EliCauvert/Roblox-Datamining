local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
		id = if p1 == nil or p1.id == nil then "" else p1.id,
		name = if p1 == nil or p1.name == nil then "" else p1.name,
		description = if p1 == nil or p1.description == nil then "" else p1.description,
		image_asset_id = if p1 == nil or p1.image_asset_id == nil then 0 else p1.image_asset_id,
		price_in_robux = if p1 == nil or p1.price_in_robux == nil then 0 else p1.price_in_robux,
		pending_receipt_count = if p1 == nil or p1.pending_receipt_count == nil then 0 else p1.pending_receipt_count,
		status_tooltip = if p1 == nil or p1.status_tooltip == nil then "" else p1.status_tooltip,
		base_price_in_robux = if p1 == nil or p1.base_price_in_robux == nil then 0 else p1.base_price_in_robux,
		is_discounted = if p1 == nil or p1.is_discounted == nil then false else p1.is_discounted
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var7 = protoModule.writeString(var2, var3, self.id)
		buff = var2
		var1 = var3
	end
	if self.name ~= nil and self.name ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var9 = protoModule.writeString(var4, var5, self.name)
		buff = var4
		var1 = var5
	end
	if self.description ~= nil and self.description ~= "" then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var6, var11 = protoModule.writeString(var6, var7, self.description)
		buff = var6
		var1 = var7
	end
	if self.image_asset_id ~= nil and self.image_asset_id ~= 0 then
		local var8, var9 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.varint)
		var8, var13 = protoModule.writeVarInt(var8, var9, self.image_asset_id)
		buff = var8
		var1 = var9
	end
	if self.price_in_robux ~= nil and self.price_in_robux ~= 0 then
		local var10, var11 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.varint)
		var10, var15 = protoModule.writeVarInt(var10, var11, self.price_in_robux)
		buff = var10
		var1 = var11
	end
	if self.pending_receipt_count ~= nil and self.pending_receipt_count ~= 0 then
		local var12, var13 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.varint)
		var12, var17 = protoModule.writeVarInt(var12, var13, self.pending_receipt_count)
		buff = var12
		var1 = var13
	end
	if self.status_tooltip ~= nil and self.status_tooltip ~= "" then
		local var14, var15 = protoModule.writeTag(buff, var1, 7, protoModule.wireTypes.lengthDelimited)
		var14, var19 = protoModule.writeString(var14, var15, self.status_tooltip)
		buff = var14
		var1 = var15
	end
	if self.base_price_in_robux ~= nil and self.base_price_in_robux ~= 0 then
		local var16, var17 = protoModule.writeTag(buff, var1, 8, protoModule.wireTypes.varint)
		var16, var21 = protoModule.writeVarInt(var16, var17, self.base_price_in_robux)
		buff = var16
		var1 = var17
	end
	if self.is_discounted then
		local var18, var19 = protoModule.writeTag(buff, var1, 9, protoModule.wireTypes.varint)
		var18, var23 = protoModule.writeVarInt(var18, var19, if self.is_discounted then 1 else 0)
		buff = var18
		var1 = var19
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
			if var7 == 4 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI64(p1, var2)
				var2 = var9
				var1.image_asset_id = var8
			elseif var7 == 5 then
				local _ = nil
				local var10, var11 = protoModule.readVarIntI64(p1, var2)
				var2 = var11
				var1.price_in_robux = var10
			elseif var7 == 6 then
				local _ = nil
				local var12, var13 = protoModule.readVarIntI32(p1, var2)
				var2 = var13
				var1.pending_receipt_count = var12
			elseif var7 == 8 then
				local _ = nil
				local var14, var15 = protoModule.readVarIntI64(p1, var2)
				var2 = var15
				var1.base_price_in_robux = var14
			elseif var7 == 9 then
				local _ = nil
				local var16, var17 = protoModule.readVarInt(p1, var2)
				var2 = var17
				var1.is_discounted = var16 ~= 0
			else
				local _ = nil
				local var18, var19 = protoModule.readVarInt(p1, var2)
				local _ = var18
				var2 = var19
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var20, var21 = protoModule.readBuffer(p1, var2)
				var2 = var21
				var1.id = buffer.tostring(var20)
			elseif var7 == 2 then
				local _ = nil
				local var22, var23 = protoModule.readBuffer(p1, var2)
				var2 = var23
				var1.name = buffer.tostring(var22)
			elseif var7 == 3 then
				local _ = nil
				local var24, var25 = protoModule.readBuffer(p1, var2)
				var2 = var25
				var1.description = buffer.tostring(var24)
			elseif var7 == 7 then
				local _ = nil
				local var26, var27 = protoModule.readBuffer(p1, var2)
				var2 = var27
				var1.status_tooltip = buffer.tostring(var26)
			else
				local _ = nil
				local var28, var29 = protoModule.readVarInt(p1, var2)
				var2 = var29 + var28
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var30, var31 = protoModule.readFixed32(p1, var2)
			local _ = var30
			var2 = var31
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var32, var33 = protoModule.readFixed64(p1, var2)
			local _ = var32
			var2 = var33
		else
			error("Unsupported wire type: " .. var27)
		end
	end
	return var1
end

function t_1:jsonEncode()
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

function t_1:jsonDecode()
	-- upvalues: t_1 (ref)
	local var34 = t_1.new()
	
	if self.id ~= nil then
		var34.id = self.id
	end
	if self.name ~= nil then
		var34.name = self.name
	end
	if self.description ~= nil then
		var34.description = self.description
	end
	if self.image_asset_id ~= nil then
		var34.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var34.image_asset_id = self.imageAssetId
	end
	if self.price_in_robux ~= nil then
		var34.price_in_robux = self.price_in_robux
	end
	if self.priceInRobux ~= nil then
		var34.price_in_robux = self.priceInRobux
	end
	if self.pending_receipt_count ~= nil then
		var34.pending_receipt_count = self.pending_receipt_count
	end
	if self.pendingReceiptCount ~= nil then
		var34.pending_receipt_count = self.pendingReceiptCount
	end
	if self.status_tooltip ~= nil then
		var34.status_tooltip = self.status_tooltip
	end
	if self.statusTooltip ~= nil then
		var34.status_tooltip = self.statusTooltip
	end
	if self.base_price_in_robux ~= nil then
		var34.base_price_in_robux = self.base_price_in_robux
	end
	if self.basePriceInRobux ~= nil then
		var34.base_price_in_robux = self.basePriceInRobux
	end
	if self.is_discounted ~= nil then
		var34.is_discounted = self.is_discounted
	end
	if self.isDiscounted ~= nil then
		var34.is_discounted = self.isDiscounted
	end
	return var34
end

t_1.descriptor = {
	name = "GameDeveloperProductData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GameDeveloperProductData"
}
t.GameDeveloperProductData = t_1
typeRegistryModule.default:register(t.GameDeveloperProductData)

return { GameDeveloperProductData = t.GameDeveloperProductData }