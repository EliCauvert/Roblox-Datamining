local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local Module = {}
Module.__index = Module

function Module.new(p1) --[[ Line: 141 ]]
	-- upvalues: Module (copy)
	return (setmetatable({
		taxonomy_id = if p1 == nil or p1.taxonomy_id == nil then nil else p1.taxonomy_id,
		taxonomy_name = if p1 == nil or p1.taxonomy_name == nil then "" else p1.taxonomy_name
	}, Module))
end

function Module:encode() --[[ Line: 150 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.taxonomy_id ~= nil then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.taxonomy_id)
	end
	if self.taxonomy_name ~= nil and self.taxonomy_name ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.taxonomy_name)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf) --[[ Line: 169 ]]
	-- upvalues: Module (copy), ProtoModule (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v14 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v14 = ProtoModule.readVarInt(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v14 = ProtoModule.readBuffer(Buf, v1)
				NewModule.taxonomy_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v14 = ProtoModule.readBuffer(Buf, v1)
				NewModule.taxonomy_name = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v14 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v14 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode() --[[ Line: 217 ]]
	local t = {}
	
	if self.taxonomy_id ~= nil then
		t.taxonomyId = self.taxonomy_id
	end
	if self.taxonomy_name ~= nil and self.taxonomy_name ~= "" then
		t.taxonomyName = self.taxonomy_name
	end
	return t
end

function Module:jsonDecode() --[[ Line: 231 ]]
	-- upvalues: Module (copy)
	local NewModule = Module.new()
	
	if self.taxonomy_id ~= nil then
		NewModule.taxonomy_id = self.taxonomy_id
	end
	if self.taxonomyId ~= nil then
		NewModule.taxonomy_id = self.taxonomyId
	end
	if self.taxonomy_name ~= nil then
		NewModule.taxonomy_name = self.taxonomy_name
	end
	if self.taxonomyName ~= nil then
		NewModule.taxonomy_name = self.taxonomyName
	end
	return NewModule
end

Module.descriptor = {
	name = "MarketplaceCatalogTaxonomyNode",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceCatalogTaxonomyNode"
}
local config = { MarketplaceCatalogTaxonomyNode = Module }
TypeRegistryModule.default:register(config.MarketplaceCatalogTaxonomyNode)
local Module1 = {}
Module1.__index = Module1

function Module1.new(p1) --[[ Line: 267 ]]
	-- upvalues: Module1 (copy)
	return (setmetatable({
		days = if p1 == nil or p1.days == nil then 0 else p1.days,
		price = if p1 == nil or p1.price == nil then 0 else p1.price,
		selected = if p1 == nil or p1.selected == nil then nil else p1.selected
	}, Module1))
end

function Module1:encode() --[[ Line: 277 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.days ~= nil and self.days ~= 0 then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, self.days)
	end
	if self.price ~= nil and self.price ~= 0 then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, self.price)
	end
	if self.selected ~= nil then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult3, WriteTagResult2_2, if self.selected then 1 else 0)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module1.decode(Buf) --[[ Line: 301 ]]
	-- upvalues: Module1 (copy), ProtoModule (copy)
	local NewModule = Module1.new()
	local v2 = 0
	while v2 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v35 = ProtoModule.readTag(Buf, v2)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				NewModule.days, v35 = ProtoModule.readVarIntI32(Buf, v2)
			elseif Tag == 2 then
				NewModule.price, v35 = ProtoModule.readVarIntI64(Buf, v2)
			elseif Tag == 3 then
				local VarInt
				VarInt, v35 = ProtoModule.readVarInt(Buf, v2)
				NewModule.selected = VarInt ~= 0
			else
				local _
				_, v35 = ProtoModule.readVarInt(Buf, v2)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v2)
			v2 = VarInt2 + VarInt1
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v35 = ProtoModule.readFixed32(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v35 = ProtoModule.readFixed64(Buf, v2)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module1:jsonEncode() --[[ Line: 354 ]]
	local t = {}
	
	if self.days ~= nil and self.days ~= 0 then
		t.days = self.days
	end
	if self.price ~= nil and self.price ~= 0 then
		t.price = self.price
	end
	if self.selected ~= nil then
		t.selected = self.selected
	end
	return t
end

function Module1:jsonDecode() --[[ Line: 372 ]]
	-- upvalues: Module1 (copy)
	local NewModule = Module1.new()
	
	if self.days ~= nil then
		NewModule.days = self.days
	end
	if self.price ~= nil then
		NewModule.price = self.price
	end
	if self.selected ~= nil then
		NewModule.selected = self.selected
	end
	return NewModule
end

Module1.descriptor = {
	name = "MarketplaceCatalogTimedOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceCatalogTimedOption"
}
config.MarketplaceCatalogTimedOption = Module1
TypeRegistryModule.default:register(config.MarketplaceCatalogTimedOption)
local Module2 = {}
Module2.__index = Module2

function Module2.new(p1) --[[ Line: 404 ]]
	-- upvalues: Module2 (copy)
	return (setmetatable({
		name = if p1 == nil or p1.name == nil then "" else p1.name,
		value = if p1 == nil or p1.value == nil then "" else p1.value
	}, Module2))
end

function Module2:encode() --[[ Line: 413 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.name ~= nil and self.name ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.name)
	end
	if self.value ~= nil and self.value ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.value)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module2.decode(Buf) --[[ Line: 432 ]]
	-- upvalues: Module2 (copy), ProtoModule (copy)
	local NewModule = Module2.new()
	local v3 = 0
	while v3 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v53 = ProtoModule.readTag(Buf, v3)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v53 = ProtoModule.readVarInt(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v53 = ProtoModule.readBuffer(Buf, v3)
				NewModule.name = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v53 = ProtoModule.readBuffer(Buf, v3)
				NewModule.value = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v3)
				v3 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v53 = ProtoModule.readFixed32(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v53 = ProtoModule.readFixed64(Buf, v3)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module2:jsonEncode() --[[ Line: 480 ]]
	local t = {}
	
	if self.name ~= nil and self.name ~= "" then
		t.name = self.name
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function Module2:jsonDecode() --[[ Line: 494 ]]
	-- upvalues: Module2 (copy)
	local NewModule = Module2.new()
	
	if self.name ~= nil then
		NewModule.name = self.name
	end
	if self.value ~= nil then
		NewModule.value = self.value
	end
	return NewModule
end

Module2.descriptor = {
	name = "MarketplaceCatalogVariantAttribute",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceCatalogVariantAttribute"
}
config.MarketplaceCatalogVariantAttribute = Module2
TypeRegistryModule.default:register(config.MarketplaceCatalogVariantAttribute)
local Module3 = {}
Module3.__index = Module3

function Module3.new(p1) --[[ Line: 524 ]]
	-- upvalues: Module3 (copy)
	return (setmetatable({
		id = if p1 == nil or p1.id == nil then "" else p1.id,
		asset_type = if p1 == nil or p1.asset_type == nil then nil else p1.asset_type,
		type = if p1 == nil or p1.type == nil then "" else p1.type
	}, Module3))
end

function Module3:encode() --[[ Line: 534 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.id ~= nil and self.id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.id)
	end
	if self.asset_type ~= nil then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.asset_type)
	end
	if self.type ~= nil and self.type ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.type)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module3.decode(Buf) --[[ Line: 558 ]]
	-- upvalues: Module3 (copy), ProtoModule (copy)
	local NewModule = Module3.new()
	local v4 = 0
	while v4 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v74 = ProtoModule.readTag(Buf, v4)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v74 = ProtoModule.readVarInt(Buf, v4)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v74 = ProtoModule.readBuffer(Buf, v4)
				NewModule.id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v74 = ProtoModule.readBuffer(Buf, v4)
				NewModule.asset_type = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v74 = ProtoModule.readBuffer(Buf, v4)
				NewModule.type = buffer.tostring(Buffer3)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v4)
				v4 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v74 = ProtoModule.readFixed32(Buf, v4)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v74 = ProtoModule.readFixed64(Buf, v4)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module3:jsonEncode() --[[ Line: 611 ]]
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.asset_type ~= nil then
		t.assetType = self.asset_type
	end
	if self.type ~= nil and self.type ~= "" then
		t.type = self.type
	end
	return t
end

function Module3:jsonDecode() --[[ Line: 629 ]]
	-- upvalues: Module3 (copy)
	local NewModule = Module3.new()
	
	if self.id ~= nil then
		NewModule.id = self.id
	end
	if self.asset_type ~= nil then
		NewModule.asset_type = self.asset_type
	end
	if self.assetType ~= nil then
		NewModule.asset_type = self.assetType
	end
	if self.type ~= nil then
		NewModule.type = self.type
	end
	return NewModule
end

Module3.descriptor = {
	name = "MarketplaceCatalogBundledItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceCatalogBundledItem"
}
config.MarketplaceCatalogBundledItem = Module3
TypeRegistryModule.default:register(config.MarketplaceCatalogBundledItem)

return {
	MarketplaceCatalogTaxonomyNode = config.MarketplaceCatalogTaxonomyNode,
	MarketplaceCatalogTimedOption = config.MarketplaceCatalogTimedOption,
	MarketplaceCatalogVariantAttribute = config.MarketplaceCatalogVariantAttribute,
	MarketplaceCatalogBundledItem = config.MarketplaceCatalogBundledItem
}