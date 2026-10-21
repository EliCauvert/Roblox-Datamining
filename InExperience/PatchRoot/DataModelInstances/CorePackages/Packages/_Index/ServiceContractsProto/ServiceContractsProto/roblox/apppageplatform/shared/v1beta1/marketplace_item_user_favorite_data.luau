local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local Module = {}
Module.__index = Module

function Module.new(p1)
	-- upvalues: Module (copy)
	return (setmetatable({
		is_favorited = p1 ~= nil and p1.is_favorited ~= nil and p1.is_favorited
	}, Module))
end

function Module:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.is_favorited then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, if self.is_favorited then 1 else 0)
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
		Tag, Tag2, v9 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarInt
				VarInt, v9 = ProtoModule.readVarInt(Buf, v1)
				NewModule.is_favorited = VarInt ~= 0
			else
				local _
				_, v9 = ProtoModule.readVarInt(Buf, v1)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v1)
			v1 = VarInt2 + VarInt1
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v9 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v9 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode()
	local t = {}
	
	if self.is_favorited then
		t.isFavorited = self.is_favorited
	end
	return t
end

function Module:jsonDecode()
	-- upvalues: Module (copy)
	local NewModule = Module.new()
	
	if self.is_favorited ~= nil then
		NewModule.is_favorited = self.is_favorited
	end
	if self.isFavorited ~= nil then
		NewModule.is_favorited = self.isFavorited
	end
	return NewModule
end

Module.descriptor = {
	name = "MarketplaceItemUserFavoriteData",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceItemUserFavoriteData"
}
local config = { MarketplaceItemUserFavoriteData = Module }
TypeRegistryModule.default:register(config.MarketplaceItemUserFavoriteData)

return {
	MarketplaceItemUserFavoriteData = config.MarketplaceItemUserFavoriteData
}