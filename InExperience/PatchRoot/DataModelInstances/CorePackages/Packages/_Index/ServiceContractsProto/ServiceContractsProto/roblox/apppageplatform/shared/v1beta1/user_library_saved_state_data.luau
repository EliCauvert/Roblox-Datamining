local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local Module = {}
Module.__index = Module

function Module.new(p1)
	-- upvalues: Module (copy)
	return (setmetatable({
		is_saved = p1 ~= nil and p1.is_saved ~= nil and p1.is_saved,
		collection_ids = if p1 == nil or p1.collection_ids == nil then {} else p1.collection_ids
	}, Module))
end

function Module:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.is_saved then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, if self.is_saved then 1 else 0)
	end
	if self.collection_ids ~= nil and #self.collection_ids > 0 then
		for _, collectionId in self.collection_ids do
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, collectionId)
		end
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
		Tag, Tag2, v11 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarInt
				VarInt, v11 = ProtoModule.readVarInt(Buf, v1)
				NewModule.is_saved = VarInt ~= 0
			else
				local _
				_, v11 = ProtoModule.readVarInt(Buf, v1)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v11 = ProtoModule.readBuffer(Buf, v1)
				table.insert(NewModule.collection_ids, buffer.tostring(Buffer1))
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v11 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v11 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode()
	local t = {}
	
	if self.is_saved then
		t.isSaved = self.is_saved
	end
	if self.collection_ids ~= nil and #self.collection_ids > 0 then
		local CollectionIds = {}
		
		for _, collectionId in self.collection_ids do
			table.insert(CollectionIds, collectionId)
		end
		t.collectionIds = CollectionIds
	end
	return t
end

function Module:jsonDecode()
	-- upvalues: Module (copy)
	local NewModule = Module.new()
	
	if self.is_saved ~= nil then
		NewModule.is_saved = self.is_saved
	end
	if self.isSaved ~= nil then
		NewModule.is_saved = self.isSaved
	end
	if self.collection_ids ~= nil then
		local Collection_ids = {}
		
		for _, collectionId in self.collection_ids do
			table.insert(Collection_ids, collectionId)
		end
		NewModule.collection_ids = Collection_ids
	end
	if self.collectionIds ~= nil then
		local Collection_ids = {}
		
		for _, collectionId1 in self.collectionIds do
			table.insert(Collection_ids, collectionId1)
		end
		NewModule.collection_ids = Collection_ids
	end
	return NewModule
end

Module.descriptor = {
	name = "UserLibrarySavedStateData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserLibrarySavedStateData"
}
local config = { UserLibrarySavedStateData = Module }
TypeRegistryModule.default:register(config.UserLibrarySavedStateData)

return {
	UserLibrarySavedStateData = config.UserLibrarySavedStateData
}