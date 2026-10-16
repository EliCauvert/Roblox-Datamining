local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local Module = {}
Module.__index = Module

function Module.new(p1) --[[ Line: 45 ]]
	-- upvalues: Module (copy)
	return (setmetatable({
		id = if p1 == nil or p1.id == nil then "" else p1.id,
		creator_name = if p1 == nil or p1.creator_name == nil then nil else p1.creator_name,
		creator_has_verified_badge = if p1 == nil or p1.creator_has_verified_badge == nil then nil else p1.creator_has_verified_badge,
		price = if p1 == nil or p1.price == nil then nil else p1.price
	}, Module))
end

function Module:encode() --[[ Line: 56 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.id ~= nil and self.id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.id)
	end
	if self.creator_name ~= nil then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.creator_name)
	end
	if self.creator_has_verified_badge ~= nil then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult3, WriteTagResult2_2, if self.creator_has_verified_badge then 1 else 0)
	end
	if self.price ~= nil then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult4, WriteTagResult2_3, self.price)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf) --[[ Line: 85 ]]
	-- upvalues: Module (copy), ProtoModule (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v15 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 3 then
				local VarInt
				VarInt, v15 = ProtoModule.readVarInt(Buf, v1)
				NewModule.creator_has_verified_badge = VarInt ~= 0
			elseif Tag == 4 then
				NewModule.price, v15 = ProtoModule.readVarIntI64(Buf, v1)
			else
				local _
				_, v15 = ProtoModule.readVarInt(Buf, v1)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v15 = ProtoModule.readBuffer(Buf, v1)
				NewModule.id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v15 = ProtoModule.readBuffer(Buf, v1)
				NewModule.creator_name = buffer.tostring(Buffer2)
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v15 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v15 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode() --[[ Line: 143 ]]
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.creator_name ~= nil then
		t.creatorName = self.creator_name
	end
	if self.creator_has_verified_badge ~= nil then
		t.creatorHasVerifiedBadge = self.creator_has_verified_badge
	end
	if self.price ~= nil then
		t.price = self.price
	end
	return t
end

function Module:jsonDecode() --[[ Line: 165 ]]
	-- upvalues: Module (copy)
	local NewModule = Module.new()
	
	if self.id ~= nil then
		NewModule.id = self.id
	end
	if self.creator_name ~= nil then
		NewModule.creator_name = self.creator_name
	end
	if self.creatorName ~= nil then
		NewModule.creator_name = self.creatorName
	end
	if self.creator_has_verified_badge ~= nil then
		NewModule.creator_has_verified_badge = self.creator_has_verified_badge
	end
	if self.creatorHasVerifiedBadge ~= nil then
		NewModule.creator_has_verified_badge = self.creatorHasVerifiedBadge
	end
	if self.price ~= nil then
		NewModule.price = self.price
	end
	return NewModule
end

Module.descriptor = {
	name = "MarketplaceLookData",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceLookData"
}
local config = { MarketplaceLookData = Module }
TypeRegistryModule.default:register(config.MarketplaceLookData)

return { MarketplaceLookData = config.MarketplaceLookData }