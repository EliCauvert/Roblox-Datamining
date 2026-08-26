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
		price_display = if p1 == nil or p1.price_display == nil then "" else p1.price_display,
		period_type = if p1 == nil or p1.period_type == nil then "" else p1.period_type,
		is_subscribed = if p1 == nil or p1.is_subscribed == nil then false else p1.is_subscribed,
		price_in_robux = if p1 == nil or p1.price_in_robux == nil then 0 else p1.price_in_robux,
		price_tier = if p1 == nil or p1.price_tier == nil then 0 else p1.price_tier
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
	if self.price_display ~= nil and self.price_display ~= "" then
		local var10, var11 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
		var10, var15 = protoModule.writeString(var10, var11, self.price_display)
		buff = var10
		var1 = var11
	end
	if self.period_type ~= nil and self.period_type ~= "" then
		local var12, var13 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.lengthDelimited)
		var12, var17 = protoModule.writeString(var12, var13, self.period_type)
		buff = var12
		var1 = var13
	end
	if self.is_subscribed then
		local var14, var15 = protoModule.writeTag(buff, var1, 7, protoModule.wireTypes.varint)
		var14, var19 = protoModule.writeVarInt(var14, var15, if self.is_subscribed then 1 else 0)
		buff = var14
		var1 = var15
	end
	if self.price_in_robux ~= nil and self.price_in_robux ~= 0 then
		local var16, var17 = protoModule.writeTag(buff, var1, 8, protoModule.wireTypes.varint)
		var16, var21 = protoModule.writeVarInt(var16, var17, self.price_in_robux)
		buff = var16
		var1 = var17
	end
	if self.price_tier ~= nil and self.price_tier ~= 0 then
		local var18, var19 = protoModule.writeTag(buff, var1, 9, protoModule.wireTypes.varint)
		var18, var23 = protoModule.writeVarInt(var18, var19, self.price_tier)
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
			elseif var7 == 7 then
				local _ = nil
				local var10, var11 = protoModule.readVarInt(p1, var2)
				var2 = var11
				var1.is_subscribed = var10 ~= 0
			elseif var7 == 8 then
				local _ = nil
				local var12, var13 = protoModule.readVarIntI64(p1, var2)
				var2 = var13
				var1.price_in_robux = var12
			elseif var7 == 9 then
				local _ = nil
				local var14, var15 = protoModule.readVarIntI64(p1, var2)
				var2 = var15
				var1.price_tier = var14
			else
				local _ = nil
				local var16, var17 = protoModule.readVarInt(p1, var2)
				local _ = var16
				var2 = var17
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.id = buffer.tostring(var18)
			elseif var7 == 2 then
				local _ = nil
				local var20, var21 = protoModule.readBuffer(p1, var2)
				var2 = var21
				var1.name = buffer.tostring(var20)
			elseif var7 == 3 then
				local _ = nil
				local var22, var23 = protoModule.readBuffer(p1, var2)
				var2 = var23
				var1.description = buffer.tostring(var22)
			elseif var7 == 5 then
				local _ = nil
				local var24, var25 = protoModule.readBuffer(p1, var2)
				var2 = var25
				var1.price_display = buffer.tostring(var24)
			elseif var7 == 6 then
				local _ = nil
				local var26, var27 = protoModule.readBuffer(p1, var2)
				var2 = var27
				var1.period_type = buffer.tostring(var26)
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
	if self.price_display ~= nil and self.price_display ~= "" then
		t.priceDisplay = self.price_display
	end
	if self.period_type ~= nil and self.period_type ~= "" then
		t.periodType = self.period_type
	end
	if self.is_subscribed then
		t.isSubscribed = self.is_subscribed
	end
	if self.price_in_robux ~= nil and self.price_in_robux ~= 0 then
		t.priceInRobux = self.price_in_robux
	end
	if self.price_tier ~= nil and self.price_tier ~= 0 then
		t.priceTier = self.price_tier
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
	if self.price_display ~= nil then
		var34.price_display = self.price_display
	end
	if self.priceDisplay ~= nil then
		var34.price_display = self.priceDisplay
	end
	if self.period_type ~= nil then
		var34.period_type = self.period_type
	end
	if self.periodType ~= nil then
		var34.period_type = self.periodType
	end
	if self.is_subscribed ~= nil then
		var34.is_subscribed = self.is_subscribed
	end
	if self.isSubscribed ~= nil then
		var34.is_subscribed = self.isSubscribed
	end
	if self.price_in_robux ~= nil then
		var34.price_in_robux = self.price_in_robux
	end
	if self.priceInRobux ~= nil then
		var34.price_in_robux = self.priceInRobux
	end
	if self.price_tier ~= nil then
		var34.price_tier = self.price_tier
	end
	if self.priceTier ~= nil then
		var34.price_tier = self.priceTier
	end
	return var34
end

t_1.descriptor = {
	name = "GameSubscriptionData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GameSubscriptionData"
}
t.GameSubscriptionData = t_1
typeRegistryModule.default:register(t.GameSubscriptionData)

return { GameSubscriptionData = t.GameSubscriptionData }