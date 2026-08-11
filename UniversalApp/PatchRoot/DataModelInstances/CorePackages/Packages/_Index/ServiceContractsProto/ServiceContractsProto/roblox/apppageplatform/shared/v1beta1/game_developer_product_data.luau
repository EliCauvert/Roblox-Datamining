local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 54 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({
		id = if p0 == nil or p0.id == nil then "" else p0.id,
		name = if p0 == nil or p0.name == nil then "" else p0.name,
		description = if p0 == nil or p0.description == nil then "" else p0.description,
		image_asset_id = if p0 == nil or p0.image_asset_id == nil then 0 else p0.image_asset_id,
		price_in_robux = if p0 == nil or p0.price_in_robux == nil then 0 else p0.price_in_robux,
		pending_receipt_count = if p0 == nil or p0.pending_receipt_count == nil then 0 else p0.pending_receipt_count,
		status_tooltip = if p0 == nil or p0.status_tooltip == nil then "" else p0.status_tooltip
	}, t_1)
end

function t_1:encode() --[[ line: 68 ]]
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
	local buff_1 = buffer.create(var5)
	buffer.copy(buff_1, 0, buff, 0, var5)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 112 ]]
	-- upvalues: t_1 (ref), protoModule (ref)
	local var21 = t_1.new()
	local var22 = 0
	while var22 < buffer.len(p1) do
		local _ = nil
		local var23 = nil
		local var24, var25, var26 = protoModule.readTag(p1, var22)
		local var27 = var24
		var23 = var25
		var22 = var26
		
		if var23 == protoModule.wireTypes.varint then
			if var27 == 4 then
				local _ = nil
				local var28, var29 = protoModule.readVarIntI64(p1, var22)
				var22 = var29
				var21.image_asset_id = var28
			elseif var27 == 5 then
				local _ = nil
				local var30, var31 = protoModule.readVarIntI64(p1, var22)
				var22 = var31
				var21.price_in_robux = var30
			elseif var27 == 6 then
				local _ = nil
				local var32, var33 = protoModule.readVarIntI32(p1, var22)
				var22 = var33
				var21.pending_receipt_count = var32
			else
				local _ = nil
				local var34, var35 = protoModule.readVarInt(p1, var22)
				local _ = var34
				var22 = var35
			end
		end
		if var23 == protoModule.wireTypes.lengthDelimited then
			if var27 == 1 then
				local _ = nil
				local var36, var37 = protoModule.readBuffer(p1, var22)
				var22 = var37
				var21.id = buffer.tostring(var36)
			elseif var27 == 2 then
				local _ = nil
				local var38, var39 = protoModule.readBuffer(p1, var22)
				var22 = var39
				var21.name = buffer.tostring(var38)
			elseif var27 == 3 then
				local _ = nil
				local var40, var41 = protoModule.readBuffer(p1, var22)
				var22 = var41
				var21.description = buffer.tostring(var40)
			elseif var27 == 7 then
				local _ = nil
				local var42, var43 = protoModule.readBuffer(p1, var22)
				var22 = var43
				var21.status_tooltip = buffer.tostring(var42)
			else
				local _ = nil
				local var44, var45 = protoModule.readVarInt(p1, var22)
				var22 = var45 + var44
			end
		elseif var23 == protoModule.wireTypes.i32 then
			local _ = nil
			local var46, var47 = protoModule.readFixed32(p1, var22)
			local _ = var46
			var22 = var47
		elseif var23 == protoModule.wireTypes.i64 then
			local _ = nil
			local var48, var49 = protoModule.readFixed64(p1, var22)
			local _ = var48
			var22 = var49
		else
			error("Unsupported wire type: " .. var23)
		end
	end
	return var21
end

function t_1:jsonEncode() --[[ line: 185 ]]
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
	return t
end

function t_1:jsonDecode() --[[ line: 219 ]]
	-- upvalues: t_1 (ref)
	local var51 = t_1.new()
	
	if self.id ~= nil then
		var51.id = self.id
	end
	if self.name ~= nil then
		var51.name = self.name
	end
	if self.description ~= nil then
		var51.description = self.description
	end
	if self.image_asset_id ~= nil then
		var51.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var51.image_asset_id = self.imageAssetId
	end
	if self.price_in_robux ~= nil then
		var51.price_in_robux = self.price_in_robux
	end
	if self.priceInRobux ~= nil then
		var51.price_in_robux = self.priceInRobux
	end
	if self.pending_receipt_count ~= nil then
		var51.pending_receipt_count = self.pending_receipt_count
	end
	if self.pendingReceiptCount ~= nil then
		var51.pending_receipt_count = self.pendingReceiptCount
	end
	if self.status_tooltip ~= nil then
		var51.status_tooltip = self.status_tooltip
	end
	if self.statusTooltip ~= nil then
		var51.status_tooltip = self.statusTooltip
	end
	return var51
end

t_1.descriptor = {
	name = "GameDeveloperProductData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GameDeveloperProductData"
}
t.GameDeveloperProductData = t_1
typeRegistryModule.default:register(t.GameDeveloperProductData)

return { GameDeveloperProductData = t.GameDeveloperProductData }