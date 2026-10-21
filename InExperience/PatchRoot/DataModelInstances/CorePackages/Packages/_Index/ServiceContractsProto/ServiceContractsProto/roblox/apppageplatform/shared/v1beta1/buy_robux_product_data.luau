local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local Module = {}
Module.__index = Module

function Module.new(p1)
	-- upvalues: Module (copy)
	return (setmetatable({
		product_id = if p1 == nil or p1.product_id == nil then "" else p1.product_id,
		provider_product_id = if p1 == nil or p1.provider_product_id == nil then "" else p1.provider_product_id,
		robux_amount = if p1 == nil or p1.robux_amount == nil then 0 else p1.robux_amount,
		non_promotional_platform_robux_amount = if p1 == nil or p1.non_promotional_platform_robux_amount == nil then nil else p1.non_promotional_platform_robux_amount,
		display_price = if p1 == nil or p1.display_price == nil then "" else p1.display_price,
		display_name = if p1 == nil or p1.display_name == nil then "" else p1.display_name,
		inline_badge = if p1 == nil or p1.inline_badge == nil then nil else p1.inline_badge,
		is_call_to_action = p1 ~= nil and p1.is_call_to_action ~= nil and p1.is_call_to_action,
		bonus_robux = if p1 == nil or p1.bonus_robux == nil then nil else p1.bonus_robux
	}, Module))
end

function Module:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.product_id ~= nil and self.product_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.product_id)
	end
	if self.provider_product_id ~= nil and self.provider_product_id ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.provider_product_id)
	end
	if self.robux_amount ~= nil and self.robux_amount ~= 0 then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult3, WriteTagResult2_2, self.robux_amount)
	end
	if self.non_promotional_platform_robux_amount ~= nil then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult4, WriteTagResult2_3, self.non_promotional_platform_robux_amount)
	end
	if self.display_price ~= nil and self.display_price ~= "" then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult5, WriteTagResult2_4, self.display_price)
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult7, WriteTagResult2_6, self.display_name)
	end
	if self.inline_badge ~= nil then
		local EncodeResult = self.inline_badge:encode()
		local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult8, WriteTagResult2_7, EncodeResult, buffer.len(EncodeResult))
	end
	if self.is_call_to_action then
		local WriteTagResult9, WriteTagResult2_8 = ProtoModule.writeTag(Buf, Count, 8, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult9, WriteTagResult2_8, if self.is_call_to_action then 1 else 0)
	end
	if self.bonus_robux ~= nil then
		local EncodeResult = self.bonus_robux:encode()
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 9, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult6, WriteTagResult2_5, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf)
	-- upvalues: Module (copy), ProtoModule (copy), t (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v32 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 3 then
				NewModule.robux_amount, v32 = ProtoModule.readVarIntI64(Buf, v1)
			elseif Tag == 4 then
				NewModule.non_promotional_platform_robux_amount, v32 = ProtoModule.readVarIntI64(Buf, v1)
			elseif Tag == 8 then
				local VarInt
				VarInt, v32 = ProtoModule.readVarInt(Buf, v1)
				NewModule.is_call_to_action = VarInt ~= 0
			else
				local _
				_, v32 = ProtoModule.readVarInt(Buf, v1)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v32 = ProtoModule.readBuffer(Buf, v1)
				NewModule.product_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v32 = ProtoModule.readBuffer(Buf, v1)
				NewModule.provider_product_id = buffer.tostring(Buffer2)
			elseif Tag == 5 then
				local Buffer3
				Buffer3, v32 = ProtoModule.readBuffer(Buf, v1)
				NewModule.display_price = buffer.tostring(Buffer3)
			elseif Tag == 6 then
				local Buffer4
				Buffer4, v32 = ProtoModule.readBuffer(Buf, v1)
				NewModule.display_name = buffer.tostring(Buffer4)
			elseif Tag == 7 then
				local Buffer5
				Buffer5, v32 = ProtoModule.readBuffer(Buf, v1)
				NewModule.inline_badge = t.BuyRobuxInlineBadgeData.decode(Buffer5)
			elseif Tag == 9 then
				local Buffer6
				Buffer6, v32 = ProtoModule.readBuffer(Buf, v1)
				NewModule.bonus_robux = t.BuyRobuxBonusRobuxData.decode(Buffer6)
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v32 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v32 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode()
	local t = {}
	
	if self.product_id ~= nil and self.product_id ~= "" then
		t.productId = self.product_id
	end
	if self.provider_product_id ~= nil and self.provider_product_id ~= "" then
		t.providerProductId = self.provider_product_id
	end
	if self.robux_amount ~= nil and self.robux_amount ~= 0 then
		t.robuxAmount = self.robux_amount
	end
	if self.non_promotional_platform_robux_amount ~= nil then
		t.nonPromotionalPlatformRobuxAmount = self.non_promotional_platform_robux_amount
	end
	if self.display_price ~= nil and self.display_price ~= "" then
		t.displayPrice = self.display_price
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		t.displayName = self.display_name
	end
	if self.inline_badge ~= nil then
		t.inlineBadge = self.inline_badge:jsonEncode()
	end
	if self.is_call_to_action then
		t.isCallToAction = self.is_call_to_action
	end
	if self.bonus_robux ~= nil then
		t.bonusRobux = self.bonus_robux:jsonEncode()
	end
	return t
end

function Module:jsonDecode()
	-- upvalues: Module (copy), t (copy)
	local NewModule = Module.new()
	
	if self.product_id ~= nil then
		NewModule.product_id = self.product_id
	end
	if self.productId ~= nil then
		NewModule.product_id = self.productId
	end
	if self.provider_product_id ~= nil then
		NewModule.provider_product_id = self.provider_product_id
	end
	if self.providerProductId ~= nil then
		NewModule.provider_product_id = self.providerProductId
	end
	if self.robux_amount ~= nil then
		NewModule.robux_amount = self.robux_amount
	end
	if self.robuxAmount ~= nil then
		NewModule.robux_amount = self.robuxAmount
	end
	if self.non_promotional_platform_robux_amount ~= nil then
		NewModule.non_promotional_platform_robux_amount = self.non_promotional_platform_robux_amount
	end
	if self.nonPromotionalPlatformRobuxAmount ~= nil then
		NewModule.non_promotional_platform_robux_amount = self.nonPromotionalPlatformRobuxAmount
	end
	if self.display_price ~= nil then
		NewModule.display_price = self.display_price
	end
	if self.displayPrice ~= nil then
		NewModule.display_price = self.displayPrice
	end
	if self.display_name ~= nil then
		NewModule.display_name = self.display_name
	end
	if self.displayName ~= nil then
		NewModule.display_name = self.displayName
	end
	if self.inline_badge ~= nil then
		NewModule.inline_badge = t.BuyRobuxInlineBadgeData.jsonDecode(self.inline_badge)
	end
	if self.inlineBadge ~= nil then
		NewModule.inline_badge = t.BuyRobuxInlineBadgeData.jsonDecode(self.inlineBadge)
	end
	if self.is_call_to_action ~= nil then
		NewModule.is_call_to_action = self.is_call_to_action
	end
	if self.isCallToAction ~= nil then
		NewModule.is_call_to_action = self.isCallToAction
	end
	if self.bonus_robux ~= nil then
		NewModule.bonus_robux = t.BuyRobuxBonusRobuxData.jsonDecode(self.bonus_robux)
	end
	if self.bonusRobux ~= nil then
		NewModule.bonus_robux = t.BuyRobuxBonusRobuxData.jsonDecode(self.bonusRobux)
	end
	return NewModule
end

Module.descriptor = {
	name = "BuyRobuxOneTimeProductData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BuyRobuxOneTimeProductData"
}
t.BuyRobuxOneTimeProductData = Module
TypeRegistryModule.default:register(t.BuyRobuxOneTimeProductData)
local Module1 = {}
Module1.__index = Module1

function Module1.new(p1)
	-- upvalues: Module1 (copy)
	return (setmetatable({
		name = if p1 == nil or p1.name == nil then "" else p1.name,
		variant = if p1 == nil or p1.variant == nil then "" else p1.variant
	}, Module1))
end

function Module1:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.name ~= nil and self.name ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.name)
	end
	if self.variant ~= nil and self.variant ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.variant)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module1.decode(Buf)
	-- upvalues: Module1 (copy), ProtoModule (copy)
	local NewModule = Module1.new()
	local v2 = 0
	while v2 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v56 = ProtoModule.readTag(Buf, v2)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v56 = ProtoModule.readVarInt(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v56 = ProtoModule.readBuffer(Buf, v2)
				NewModule.name = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v56 = ProtoModule.readBuffer(Buf, v2)
				NewModule.variant = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v2)
				v2 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v56 = ProtoModule.readFixed32(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v56 = ProtoModule.readFixed64(Buf, v2)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module1:jsonEncode()
	local t = {}
	
	if self.name ~= nil and self.name ~= "" then
		t.name = self.name
	end
	if self.variant ~= nil and self.variant ~= "" then
		t.variant = self.variant
	end
	return t
end

function Module1:jsonDecode()
	-- upvalues: Module1 (copy)
	local NewModule = Module1.new()
	
	if self.name ~= nil then
		NewModule.name = self.name
	end
	if self.variant ~= nil then
		NewModule.variant = self.variant
	end
	return NewModule
end

Module1.descriptor = {
	name = "BuyRobuxIconData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BuyRobuxIconData"
}
t.BuyRobuxIconData = Module1
TypeRegistryModule.default:register(t.BuyRobuxIconData)
local Module2 = {}
Module2.__index = Module2

function Module2.new(p1)
	-- upvalues: Module2 (copy)
	return (setmetatable({
		icon = if p1 == nil or p1.icon == nil then nil else p1.icon,
		text = if p1 == nil or p1.text == nil then "" else p1.text
	}, Module2))
end

function Module2:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.icon ~= nil then
		local EncodeResult = self.icon:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.text ~= nil and self.text ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.text)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module2.decode(Buf)
	-- upvalues: Module2 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module2.new()
	local v3 = 0
	while v3 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v76 = ProtoModule.readTag(Buf, v3)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v76 = ProtoModule.readVarInt(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v76 = ProtoModule.readBuffer(Buf, v3)
				NewModule.icon = t.BuyRobuxIconData.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v76 = ProtoModule.readBuffer(Buf, v3)
				NewModule.text = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v3)
				v3 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v76 = ProtoModule.readFixed32(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v76 = ProtoModule.readFixed64(Buf, v3)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module2:jsonEncode()
	local t = {}
	
	if self.icon ~= nil then
		t.icon = self.icon:jsonEncode()
	end
	if self.text ~= nil and self.text ~= "" then
		t.text = self.text
	end
	return t
end

function Module2:jsonDecode()
	-- upvalues: Module2 (copy), t (copy)
	local NewModule = Module2.new()
	
	if self.icon ~= nil then
		NewModule.icon = t.BuyRobuxIconData.jsonDecode(self.icon)
	end
	if self.text ~= nil then
		NewModule.text = self.text
	end
	return NewModule
end

Module2.descriptor = {
	name = "BuyRobuxInlineBadgeData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BuyRobuxInlineBadgeData"
}
t.BuyRobuxInlineBadgeData = Module2
TypeRegistryModule.default:register(t.BuyRobuxInlineBadgeData)
local Module3 = {}
Module3.__index = Module3

function Module3.new(p1)
	-- upvalues: Module3 (copy)
	return (setmetatable({
		amount = if p1 == nil or p1.amount == nil then 0 else p1.amount,
		icon = if p1 == nil or p1.icon == nil then nil else p1.icon,
		text = if p1 == nil or p1.text == nil then "" else p1.text
	}, Module3))
end

function Module3:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.amount ~= nil and self.amount ~= 0 then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, self.amount)
	end
	if self.icon ~= nil then
		local EncodeResult = self.icon:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.text ~= nil and self.text ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.text)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module3.decode(Buf)
	-- upvalues: Module3 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module3.new()
	local v4 = 0
	while v4 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v98 = ProtoModule.readTag(Buf, v4)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				NewModule.amount, v98 = ProtoModule.readVarIntI64(Buf, v4)
			else
				local _
				_, v98 = ProtoModule.readVarInt(Buf, v4)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v98 = ProtoModule.readBuffer(Buf, v4)
				NewModule.icon = t.BuyRobuxIconData.decode(Buffer1)
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v98 = ProtoModule.readBuffer(Buf, v4)
				NewModule.text = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v4)
				v4 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v98 = ProtoModule.readFixed32(Buf, v4)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v98 = ProtoModule.readFixed64(Buf, v4)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module3:jsonEncode()
	local t = {}
	
	if self.amount ~= nil and self.amount ~= 0 then
		t.amount = self.amount
	end
	if self.icon ~= nil then
		t.icon = self.icon:jsonEncode()
	end
	if self.text ~= nil and self.text ~= "" then
		t.text = self.text
	end
	return t
end

function Module3:jsonDecode()
	-- upvalues: Module3 (copy), t (copy)
	local NewModule = Module3.new()
	
	if self.amount ~= nil then
		NewModule.amount = self.amount
	end
	if self.icon ~= nil then
		NewModule.icon = t.BuyRobuxIconData.jsonDecode(self.icon)
	end
	if self.text ~= nil then
		NewModule.text = self.text
	end
	return NewModule
end

Module3.descriptor = {
	name = "BuyRobuxBonusRobuxData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BuyRobuxBonusRobuxData"
}
t.BuyRobuxBonusRobuxData = Module3
TypeRegistryModule.default:register(t.BuyRobuxBonusRobuxData)
local Module4 = {}
Module4.__index = Module4

function Module4.new(p1)
	-- upvalues: Module4 (copy)
	return (setmetatable({
		product_id = if p1 == nil or p1.product_id == nil then "" else p1.product_id,
		is_free_trial = p1 ~= nil and p1.is_free_trial ~= nil and p1.is_free_trial,
		display_price = if p1 == nil or p1.display_price == nil then "" else p1.display_price,
		benefits = if p1 == nil or p1.benefits == nil then {} else p1.benefits,
		robux_amount = if p1 == nil or p1.robux_amount == nil then 0 else p1.robux_amount,
		strikethrough_display_price = if p1 == nil or p1.strikethrough_display_price == nil then nil else p1.strikethrough_display_price,
		is_redirect = p1 ~= nil and p1.is_redirect ~= nil and p1.is_redirect,
		button_text = if p1 == nil or p1.button_text == nil then "" else p1.button_text,
		title = if p1 == nil or p1.title == nil then "" else p1.title
	}, Module4))
end

function Module4:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.product_id ~= nil and self.product_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.product_id)
	end
	if self.is_free_trial then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, if self.is_free_trial then 1 else 0)
	end
	if self.display_price ~= nil and self.display_price ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.display_price)
	end
	if self.benefits ~= nil and #self.benefits > 0 then
		for _, benefit in self.benefits do
			local EncodeResult = benefit:encode()
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.robux_amount ~= nil and self.robux_amount ~= 0 then
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult6, WriteTagResult2_5, self.robux_amount)
	end
	if self.strikethrough_display_price ~= nil then
		local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 8, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult7, WriteTagResult2_6, self.strikethrough_display_price)
	end
	if self.is_redirect then
		local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(Buf, Count, 9, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult8, WriteTagResult2_7, if self.is_redirect then 1 else 0)
	end
	if self.button_text ~= nil and self.button_text ~= "" then
		local WriteTagResult9, WriteTagResult2_8 = ProtoModule.writeTag(Buf, Count, 11, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult9, WriteTagResult2_8, self.button_text)
	end
	if self.title ~= nil and self.title ~= "" then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 12, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult5, WriteTagResult2_4, self.title)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module4.decode(Buf)
	-- upvalues: Module4 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module4.new()
	local v5 = 0
	while v5 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v132 = ProtoModule.readTag(Buf, v5)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 4 then
				local VarInt
				VarInt, v132 = ProtoModule.readVarInt(Buf, v5)
				NewModule.is_free_trial = VarInt ~= 0
			elseif Tag == 7 then
				NewModule.robux_amount, v132 = ProtoModule.readVarIntI64(Buf, v5)
			elseif Tag == 9 then
				local VarInt1
				VarInt1, v132 = ProtoModule.readVarInt(Buf, v5)
				NewModule.is_redirect = VarInt1 ~= 0
			else
				local _
				_, v132 = ProtoModule.readVarInt(Buf, v5)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v132 = ProtoModule.readBuffer(Buf, v5)
				NewModule.product_id = buffer.tostring(Buffer1)
			elseif Tag == 5 then
				local Buffer2
				Buffer2, v132 = ProtoModule.readBuffer(Buf, v5)
				NewModule.display_price = buffer.tostring(Buffer2)
			elseif Tag == 6 then
				local Buffer3
				Buffer3, v132 = ProtoModule.readBuffer(Buf, v5)
				table.insert(NewModule.benefits, t.BuyRobuxSubscriptionBenefitData.decode(Buffer3))
			elseif Tag == 8 then
				local Buffer4
				Buffer4, v132 = ProtoModule.readBuffer(Buf, v5)
				NewModule.strikethrough_display_price = buffer.tostring(Buffer4)
			elseif Tag == 11 then
				local Buffer5
				Buffer5, v132 = ProtoModule.readBuffer(Buf, v5)
				NewModule.button_text = buffer.tostring(Buffer5)
			elseif Tag == 12 then
				local Buffer6
				Buffer6, v132 = ProtoModule.readBuffer(Buf, v5)
				NewModule.title = buffer.tostring(Buffer6)
			else
				local VarInt2, VarInt2_1 = ProtoModule.readVarInt(Buf, v5)
				v5 = VarInt2_1 + VarInt2
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v132 = ProtoModule.readFixed32(Buf, v5)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v132 = ProtoModule.readFixed64(Buf, v5)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module4:jsonEncode()
	local t = {}
	
	if self.product_id ~= nil and self.product_id ~= "" then
		t.productId = self.product_id
	end
	if self.is_free_trial then
		t.isFreeTrial = self.is_free_trial
	end
	if self.display_price ~= nil and self.display_price ~= "" then
		t.displayPrice = self.display_price
	end
	if self.benefits ~= nil and #self.benefits > 0 then
		local Benefits = {}
		
		for _, benefit in self.benefits do
			table.insert(Benefits, benefit:jsonEncode())
		end
		t.benefits = Benefits
	end
	if self.robux_amount ~= nil and self.robux_amount ~= 0 then
		t.robuxAmount = self.robux_amount
	end
	if self.strikethrough_display_price ~= nil then
		t.strikethroughDisplayPrice = self.strikethrough_display_price
	end
	if self.is_redirect then
		t.isRedirect = self.is_redirect
	end
	if self.button_text ~= nil and self.button_text ~= "" then
		t.buttonText = self.button_text
	end
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	return t
end

function Module4:jsonDecode()
	-- upvalues: Module4 (copy), t (copy)
	local NewModule = Module4.new()
	
	if self.product_id ~= nil then
		NewModule.product_id = self.product_id
	end
	if self.productId ~= nil then
		NewModule.product_id = self.productId
	end
	if self.is_free_trial ~= nil then
		NewModule.is_free_trial = self.is_free_trial
	end
	if self.isFreeTrial ~= nil then
		NewModule.is_free_trial = self.isFreeTrial
	end
	if self.display_price ~= nil then
		NewModule.display_price = self.display_price
	end
	if self.displayPrice ~= nil then
		NewModule.display_price = self.displayPrice
	end
	if self.benefits ~= nil then
		local Benefits = {}
		
		for _, benefit in self.benefits do
			table.insert(Benefits, t.BuyRobuxSubscriptionBenefitData.jsonDecode(benefit))
		end
		NewModule.benefits = Benefits
	end
	if self.robux_amount ~= nil then
		NewModule.robux_amount = self.robux_amount
	end
	if self.robuxAmount ~= nil then
		NewModule.robux_amount = self.robuxAmount
	end
	if self.strikethrough_display_price ~= nil then
		NewModule.strikethrough_display_price = self.strikethrough_display_price
	end
	if self.strikethroughDisplayPrice ~= nil then
		NewModule.strikethrough_display_price = self.strikethroughDisplayPrice
	end
	if self.is_redirect ~= nil then
		NewModule.is_redirect = self.is_redirect
	end
	if self.isRedirect ~= nil then
		NewModule.is_redirect = self.isRedirect
	end
	if self.button_text ~= nil then
		NewModule.button_text = self.button_text
	end
	if self.buttonText ~= nil then
		NewModule.button_text = self.buttonText
	end
	if self.title ~= nil then
		NewModule.title = self.title
	end
	return NewModule
end

Module4.descriptor = {
	name = "BuyRobuxSubscriptionProductData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BuyRobuxSubscriptionProductData"
}
t.BuyRobuxSubscriptionProductData = Module4
TypeRegistryModule.default:register(t.BuyRobuxSubscriptionProductData)
local Module5 = {}
Module5.__index = Module5

function Module5.new(p1)
	-- upvalues: Module5 (copy)
	return (setmetatable({
		icon = if p1 == nil or p1.icon == nil then nil else p1.icon,
		text = if p1 == nil or p1.text == nil then "" else p1.text
	}, Module5))
end

function Module5:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.icon ~= nil then
		local EncodeResult = self.icon:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.text ~= nil and self.text ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.text)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module5.decode(Buf)
	-- upvalues: Module5 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module5.new()
	local v6 = 0
	while v6 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v160 = ProtoModule.readTag(Buf, v6)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v160 = ProtoModule.readVarInt(Buf, v6)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v160 = ProtoModule.readBuffer(Buf, v6)
				NewModule.icon = t.BuyRobuxIconData.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v160 = ProtoModule.readBuffer(Buf, v6)
				NewModule.text = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v6)
				v6 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v160 = ProtoModule.readFixed32(Buf, v6)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v160 = ProtoModule.readFixed64(Buf, v6)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module5:jsonEncode()
	local t = {}
	
	if self.icon ~= nil then
		t.icon = self.icon:jsonEncode()
	end
	if self.text ~= nil and self.text ~= "" then
		t.text = self.text
	end
	return t
end

function Module5:jsonDecode()
	-- upvalues: Module5 (copy), t (copy)
	local NewModule = Module5.new()
	
	if self.icon ~= nil then
		NewModule.icon = t.BuyRobuxIconData.jsonDecode(self.icon)
	end
	if self.text ~= nil then
		NewModule.text = self.text
	end
	return NewModule
end

Module5.descriptor = {
	name = "BuyRobuxSubscriptionBenefitData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BuyRobuxSubscriptionBenefitData"
}
t.BuyRobuxSubscriptionBenefitData = Module5
TypeRegistryModule.default:register(t.BuyRobuxSubscriptionBenefitData)

return {
	BuyRobuxOneTimeProductData = t.BuyRobuxOneTimeProductData,
	BuyRobuxIconData = t.BuyRobuxIconData,
	BuyRobuxInlineBadgeData = t.BuyRobuxInlineBadgeData,
	BuyRobuxBonusRobuxData = t.BuyRobuxBonusRobuxData,
	BuyRobuxSubscriptionProductData = t.BuyRobuxSubscriptionProductData,
	BuyRobuxSubscriptionBenefitData = t.BuyRobuxSubscriptionBenefitData
}