local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local Module = {}
Module.__index = Module

function Module.new(p1)
	-- upvalues: Module (copy)
	return (setmetatable({
		bonus_id = if p1 == nil or p1.bonus_id == nil then "" else p1.bonus_id,
		product_identifier = if p1 == nil or p1.product_identifier == nil then "" else p1.product_identifier,
		details = if p1 == nil or p1.details == nil then nil else p1.details
	}, Module))
end

function Module:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.bonus_id ~= nil and self.bonus_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.bonus_id)
	end
	if self.product_identifier ~= nil and self.product_identifier ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.product_identifier)
	end
	if self.details ~= nil then
		if self.details.type == "game_pass" then
			local EncodeResult = self.details.value:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		elseif self.details.type == "collectible_item" then
			local EncodeResult = self.details.value:encode()
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
		end
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
		Tag, Tag2, v19 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v19 = ProtoModule.readVarInt(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v19 = ProtoModule.readBuffer(Buf, v1)
				NewModule.bonus_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v19 = ProtoModule.readBuffer(Buf, v1)
				NewModule.product_identifier = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v19 = ProtoModule.readBuffer(Buf, v1)
				NewModule.details = {
					type = "game_pass",
					value = t.BuyRobuxGamePassBonusData.decode(Buffer3)
				}
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v19 = ProtoModule.readBuffer(Buf, v1)
				NewModule.details = {
					type = "collectible_item",
					value = t.BuyRobuxCollectibleItemBonusData.decode(Buffer4)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v19 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v19 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode()
	local t = {}
	
	if self.bonus_id ~= nil and self.bonus_id ~= "" then
		t.bonusId = self.bonus_id
	end
	if self.product_identifier ~= nil and self.product_identifier ~= "" then
		t.productIdentifier = self.product_identifier
	end
	if self.details ~= nil then
		if self.details.type == "game_pass" then
			t.gamePass = self.details.value:jsonEncode()
			
			return t
		end
		if self.details.type == "collectible_item" then
			t.collectibleItem = self.details.value:jsonEncode()
		end
	end
	return t
end

function Module:jsonDecode()
	-- upvalues: Module (copy), t (copy)
	local NewModule = Module.new()
	
	if self.bonus_id ~= nil then
		NewModule.bonus_id = self.bonus_id
	end
	if self.bonusId ~= nil then
		NewModule.bonus_id = self.bonusId
	end
	if self.product_identifier ~= nil then
		NewModule.product_identifier = self.product_identifier
	end
	if self.productIdentifier ~= nil then
		NewModule.product_identifier = self.productIdentifier
	end
	if self.game_pass ~= nil then
		NewModule.details = {
			type = "game_pass",
			value = t.BuyRobuxGamePassBonusData.jsonDecode(self.game_pass)
		}
	end
	if self.gamePass ~= nil then
		NewModule.details = {
			type = "game_pass",
			value = t.BuyRobuxGamePassBonusData.jsonDecode(self.gamePass)
		}
	end
	if self.collectible_item ~= nil then
		NewModule.details = {
			type = "collectible_item",
			value = t.BuyRobuxCollectibleItemBonusData.jsonDecode(self.collectible_item)
		}
	end
	if self.collectibleItem ~= nil then
		NewModule.details = {
			type = "collectible_item",
			value = t.BuyRobuxCollectibleItemBonusData.jsonDecode(self.collectibleItem)
		}
	end
	return NewModule
end

Module.descriptor = {
	name = "BuyRobuxBonusItemData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BuyRobuxBonusItemData"
}
t.BuyRobuxBonusItemData = Module
TypeRegistryModule.default:register(t.BuyRobuxBonusItemData)
local Module1 = {}
Module1.__index = Module1

function Module1.new(p1)
	-- upvalues: Module1 (copy)
	return (setmetatable({
		root_place_id = if p1 == nil or p1.root_place_id == nil then "" else p1.root_place_id,
		game_pass_display_name = if p1 == nil or p1.game_pass_display_name == nil then "" else p1.game_pass_display_name,
		experience_display_name = if p1 == nil or p1.experience_display_name == nil then "" else p1.experience_display_name
	}, Module1))
end

function Module1:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.root_place_id ~= nil and self.root_place_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.root_place_id)
	end
	if self.game_pass_display_name ~= nil and self.game_pass_display_name ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.game_pass_display_name)
	end
	if self.experience_display_name ~= nil and self.experience_display_name ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.experience_display_name)
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
		Tag, Tag2, v42 = ProtoModule.readTag(Buf, v2)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v42 = ProtoModule.readVarInt(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v42 = ProtoModule.readBuffer(Buf, v2)
				NewModule.root_place_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v42 = ProtoModule.readBuffer(Buf, v2)
				NewModule.game_pass_display_name = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v42 = ProtoModule.readBuffer(Buf, v2)
				NewModule.experience_display_name = buffer.tostring(Buffer3)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v2)
				v2 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v42 = ProtoModule.readFixed32(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v42 = ProtoModule.readFixed64(Buf, v2)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module1:jsonEncode()
	local t = {}
	
	if self.root_place_id ~= nil and self.root_place_id ~= "" then
		t.rootPlaceId = self.root_place_id
	end
	if self.game_pass_display_name ~= nil and self.game_pass_display_name ~= "" then
		t.gamePassDisplayName = self.game_pass_display_name
	end
	if self.experience_display_name ~= nil and self.experience_display_name ~= "" then
		t.experienceDisplayName = self.experience_display_name
	end
	return t
end

function Module1:jsonDecode()
	-- upvalues: Module1 (copy)
	local NewModule = Module1.new()
	
	if self.root_place_id ~= nil then
		NewModule.root_place_id = self.root_place_id
	end
	if self.rootPlaceId ~= nil then
		NewModule.root_place_id = self.rootPlaceId
	end
	if self.game_pass_display_name ~= nil then
		NewModule.game_pass_display_name = self.game_pass_display_name
	end
	if self.gamePassDisplayName ~= nil then
		NewModule.game_pass_display_name = self.gamePassDisplayName
	end
	if self.experience_display_name ~= nil then
		NewModule.experience_display_name = self.experience_display_name
	end
	if self.experienceDisplayName ~= nil then
		NewModule.experience_display_name = self.experienceDisplayName
	end
	return NewModule
end

Module1.descriptor = {
	name = "BuyRobuxGamePassBonusData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BuyRobuxGamePassBonusData"
}
t.BuyRobuxGamePassBonusData = Module1
TypeRegistryModule.default:register(t.BuyRobuxGamePassBonusData)
local Module2 = {}
Module2.__index = Module2

function Module2.new(p1)
	-- upvalues: Module2 (copy)
	return (setmetatable({
		display_name = if p1 == nil or p1.display_name == nil then "" else p1.display_name,
		image_2d_url = if p1 == nil or p1.image_2d_url == nil then "" else p1.image_2d_url,
		background_image_2d_url = if p1 == nil or p1.background_image_2d_url == nil then nil else p1.background_image_2d_url,
		creator_display_name = if p1 == nil or p1.creator_display_name == nil then nil else p1.creator_display_name,
		creator_is_verified = p1 ~= nil and p1.creator_is_verified ~= nil and p1.creator_is_verified
	}, Module2))
end

function Module2:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.display_name ~= nil and self.display_name ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.display_name)
	end
	if self.image_2d_url ~= nil and self.image_2d_url ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.image_2d_url)
	end
	if self.background_image_2d_url ~= nil then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.background_image_2d_url)
	end
	if self.creator_display_name ~= nil then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.creator_display_name)
	end
	if self.creator_is_verified then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult5, WriteTagResult2_4, if self.creator_is_verified then 1 else 0)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module2.decode(Buf)
	-- upvalues: Module2 (copy), ProtoModule (copy)
	local NewModule = Module2.new()
	local v3 = 0
	while v3 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v68 = ProtoModule.readTag(Buf, v3)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 5 then
				local VarInt
				VarInt, v68 = ProtoModule.readVarInt(Buf, v3)
				NewModule.creator_is_verified = VarInt ~= 0
			else
				local _
				_, v68 = ProtoModule.readVarInt(Buf, v3)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v68 = ProtoModule.readBuffer(Buf, v3)
				NewModule.display_name = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v68 = ProtoModule.readBuffer(Buf, v3)
				NewModule.image_2d_url = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v68 = ProtoModule.readBuffer(Buf, v3)
				NewModule.background_image_2d_url = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v68 = ProtoModule.readBuffer(Buf, v3)
				NewModule.creator_display_name = buffer.tostring(Buffer4)
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v3)
				v3 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v68 = ProtoModule.readFixed32(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v68 = ProtoModule.readFixed64(Buf, v3)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module2:jsonEncode()
	local t = {}
	
	if self.display_name ~= nil and self.display_name ~= "" then
		t.displayName = self.display_name
	end
	if self.image_2d_url ~= nil and self.image_2d_url ~= "" then
		t.image2dUrl = self.image_2d_url
	end
	if self.background_image_2d_url ~= nil then
		t.backgroundImage2dUrl = self.background_image_2d_url
	end
	if self.creator_display_name ~= nil then
		t.creatorDisplayName = self.creator_display_name
	end
	if self.creator_is_verified then
		t.creatorIsVerified = self.creator_is_verified
	end
	return t
end

function Module2:jsonDecode()
	-- upvalues: Module2 (copy)
	local NewModule = Module2.new()
	
	if self.display_name ~= nil then
		NewModule.display_name = self.display_name
	end
	if self.displayName ~= nil then
		NewModule.display_name = self.displayName
	end
	if self.image_2d_url ~= nil then
		NewModule.image_2d_url = self.image_2d_url
	end
	if self.image2dUrl ~= nil then
		NewModule.image_2d_url = self.image2dUrl
	end
	if self.background_image_2d_url ~= nil then
		NewModule.background_image_2d_url = self.background_image_2d_url
	end
	if self.backgroundImage2dUrl ~= nil then
		NewModule.background_image_2d_url = self.backgroundImage2dUrl
	end
	if self.creator_display_name ~= nil then
		NewModule.creator_display_name = self.creator_display_name
	end
	if self.creatorDisplayName ~= nil then
		NewModule.creator_display_name = self.creatorDisplayName
	end
	if self.creator_is_verified ~= nil then
		NewModule.creator_is_verified = self.creator_is_verified
	end
	if self.creatorIsVerified ~= nil then
		NewModule.creator_is_verified = self.creatorIsVerified
	end
	return NewModule
end

Module2.descriptor = {
	name = "BuyRobuxCollectibleItemBonusData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BuyRobuxCollectibleItemBonusData"
}
t.BuyRobuxCollectibleItemBonusData = Module2
TypeRegistryModule.default:register(t.BuyRobuxCollectibleItemBonusData)

return {
	BuyRobuxBonusItemData = t.BuyRobuxBonusItemData,
	BuyRobuxGamePassBonusData = t.BuyRobuxGamePassBonusData,
	BuyRobuxCollectibleItemBonusData = t.BuyRobuxCollectibleItemBonusData
}