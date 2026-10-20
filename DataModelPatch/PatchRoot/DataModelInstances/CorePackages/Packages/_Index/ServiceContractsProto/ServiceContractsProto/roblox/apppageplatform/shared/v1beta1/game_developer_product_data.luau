local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local Module = {}
Module.__index = Module

function Module.new(p1)
	-- upvalues: Module (copy)
	return (setmetatable({
		id = if p1 == nil or p1.id == nil then "" else p1.id,
		name = if p1 == nil or p1.name == nil then "" else p1.name,
		description = if p1 == nil or p1.description == nil then "" else p1.description,
		image_asset_id = if p1 == nil or p1.image_asset_id == nil then 0 else p1.image_asset_id,
		price_in_robux = if p1 == nil or p1.price_in_robux == nil then 0 else p1.price_in_robux,
		pending_receipt_count = if p1 == nil or p1.pending_receipt_count == nil then 0 else p1.pending_receipt_count,
		status_tooltip = if p1 == nil or p1.status_tooltip == nil then "" else p1.status_tooltip
	}, Module))
end

function Module:encode()
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
	if self.price_in_robux ~= nil and self.price_in_robux ~= 0 then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult5, WriteTagResult2_4, self.price_in_robux)
	end
	if self.pending_receipt_count ~= nil and self.pending_receipt_count ~= 0 then
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult6, WriteTagResult2_5, self.pending_receipt_count)
	end
	if self.status_tooltip ~= nil and self.status_tooltip ~= "" then
		local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult7, WriteTagResult2_6, self.status_tooltip)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf)
	-- upvalues: Module (copy), ProtoModule (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v21 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 4 then
				NewModule.image_asset_id, v21 = ProtoModule.readVarIntI64(Buf, v1)
			elseif Tag == 5 then
				NewModule.price_in_robux, v21 = ProtoModule.readVarIntI64(Buf, v1)
			elseif Tag == 6 then
				NewModule.pending_receipt_count, v21 = ProtoModule.readVarIntI32(Buf, v1)
			else
				local _
				_, v21 = ProtoModule.readVarInt(Buf, v1)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v21 = ProtoModule.readBuffer(Buf, v1)
				NewModule.id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v21 = ProtoModule.readBuffer(Buf, v1)
				NewModule.name = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v21 = ProtoModule.readBuffer(Buf, v1)
				NewModule.description = buffer.tostring(Buffer3)
			elseif Tag == 7 then
				local Buffer4
				Buffer4, v21 = ProtoModule.readBuffer(Buf, v1)
				NewModule.status_tooltip = buffer.tostring(Buffer4)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v21 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v21 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode()
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

function Module:jsonDecode()
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
	if self.price_in_robux ~= nil then
		NewModule.price_in_robux = self.price_in_robux
	end
	if self.priceInRobux ~= nil then
		NewModule.price_in_robux = self.priceInRobux
	end
	if self.pending_receipt_count ~= nil then
		NewModule.pending_receipt_count = self.pending_receipt_count
	end
	if self.pendingReceiptCount ~= nil then
		NewModule.pending_receipt_count = self.pendingReceiptCount
	end
	if self.status_tooltip ~= nil then
		NewModule.status_tooltip = self.status_tooltip
	end
	if self.statusTooltip ~= nil then
		NewModule.status_tooltip = self.statusTooltip
	end
	return NewModule
end

Module.descriptor = {
	name = "GameDeveloperProductData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GameDeveloperProductData"
}
local config = { GameDeveloperProductData = Module }
TypeRegistryModule.default:register(config.GameDeveloperProductData)

return {
	GameDeveloperProductData = config.GameDeveloperProductData
}