local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local Module = {}
Module.__index = Module

function Module.new(p1) --[[ Line: 58 ]]
	-- upvalues: Module (copy)
	return (setmetatable({
		id = if p1 == nil or p1.id == nil then "" else p1.id,
		name = if p1 == nil or p1.name == nil then "" else p1.name,
		description = if p1 == nil or p1.description == nil then "" else p1.description,
		image_asset_id = if p1 == nil or p1.image_asset_id == nil then 0 else p1.image_asset_id,
		price_display = if p1 == nil or p1.price_display == nil then "" else p1.price_display,
		period_type = if p1 == nil or p1.period_type == nil then "" else p1.period_type,
		is_subscribed = p1 ~= nil and p1.is_subscribed ~= nil and p1.is_subscribed,
		price_in_robux = if p1 == nil or p1.price_in_robux == nil then 0 else p1.price_in_robux,
		price_tier = if p1 == nil or p1.price_tier == nil then 0 else p1.price_tier
	}, Module))
end

function Module:encode() --[[ Line: 72 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.id ~= nil and self.id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.id)
	end
	if self.name ~= nil and self.name ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.name)
	end
	if self.description ~= nil and self.description ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.description)
	end
	if self.image_asset_id ~= nil and self.image_asset_id ~= 0 then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult4, WriteTagResult2_3, self.image_asset_id)
	end
	if self.price_display ~= nil and self.price_display ~= "" then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult5, WriteTagResult2_4, self.price_display)
	end
	if self.period_type ~= nil and self.period_type ~= "" then
		local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult7, WriteTagResult2_6, self.period_type)
	end
	if self.is_subscribed then
		local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult8, WriteTagResult2_7, if self.is_subscribed then 1 else 0)
	end
	if self.price_in_robux ~= nil and self.price_in_robux ~= 0 then
		local WriteTagResult9, WriteTagResult2_8 = ProtoModule.writeTag(Buf, Count, 8, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult9, WriteTagResult2_8, self.price_in_robux)
	end
	if self.price_tier ~= nil and self.price_tier ~= 0 then
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 9, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult6, WriteTagResult2_5, self.price_tier)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf) --[[ Line: 126 ]]
	-- upvalues: Module (copy), ProtoModule (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v25 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 4 then
				NewModule.image_asset_id, v25 = ProtoModule.readVarIntI64(Buf, v1)
			elseif Tag == 7 then
				local VarInt
				VarInt, v25 = ProtoModule.readVarInt(Buf, v1)
				NewModule.is_subscribed = VarInt ~= 0
			elseif Tag == 8 then
				NewModule.price_in_robux, v25 = ProtoModule.readVarIntI64(Buf, v1)
			elseif Tag == 9 then
				NewModule.price_tier, v25 = ProtoModule.readVarIntI64(Buf, v1)
			else
				local _
				_, v25 = ProtoModule.readVarInt(Buf, v1)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v25 = ProtoModule.readBuffer(Buf, v1)
				NewModule.id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v25 = ProtoModule.readBuffer(Buf, v1)
				NewModule.name = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v25 = ProtoModule.readBuffer(Buf, v1)
				NewModule.description = buffer.tostring(Buffer3)
			elseif Tag == 5 then
				local Buffer4
				Buffer4, v25 = ProtoModule.readBuffer(Buf, v1)
				NewModule.price_display = buffer.tostring(Buffer4)
			elseif Tag == 6 then
				local Buffer5
				Buffer5, v25 = ProtoModule.readBuffer(Buf, v1)
				NewModule.period_type = buffer.tostring(Buffer5)
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v25 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v25 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode() --[[ Line: 209 ]]
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

function Module:jsonDecode() --[[ Line: 251 ]]
	-- upvalues: Module (copy)
	local NewModule = Module.new()
	
	if self.id ~= nil then
		NewModule.id = self.id
	end
	if self.name ~= nil then
		NewModule.name = self.name
	end
	if self.description ~= nil then
		NewModule.description = self.description
	end
	if self.image_asset_id ~= nil then
		NewModule.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		NewModule.image_asset_id = self.imageAssetId
	end
	if self.price_display ~= nil then
		NewModule.price_display = self.price_display
	end
	if self.priceDisplay ~= nil then
		NewModule.price_display = self.priceDisplay
	end
	if self.period_type ~= nil then
		NewModule.period_type = self.period_type
	end
	if self.periodType ~= nil then
		NewModule.period_type = self.periodType
	end
	if self.is_subscribed ~= nil then
		NewModule.is_subscribed = self.is_subscribed
	end
	if self.isSubscribed ~= nil then
		NewModule.is_subscribed = self.isSubscribed
	end
	if self.price_in_robux ~= nil then
		NewModule.price_in_robux = self.price_in_robux
	end
	if self.priceInRobux ~= nil then
		NewModule.price_in_robux = self.priceInRobux
	end
	if self.price_tier ~= nil then
		NewModule.price_tier = self.price_tier
	end
	if self.priceTier ~= nil then
		NewModule.price_tier = self.priceTier
	end
	return NewModule
end

Module.descriptor = {
	name = "GameSubscriptionData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GameSubscriptionData"
}
local config = { GameSubscriptionData = Module }
TypeRegistryModule.default:register(config.GameSubscriptionData)

return { GameSubscriptionData = config.GameSubscriptionData }