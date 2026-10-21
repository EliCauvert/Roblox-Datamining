local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local Module = {}
Module.__index = Module

function Module.new(p1)
	-- upvalues: Module (copy)
	return (setmetatable({
		transfer_request_id = if p1 == nil or p1.transfer_request_id == nil then "" else p1.transfer_request_id,
		net_transfer_robux_amount = if p1 == nil or p1.net_transfer_robux_amount == nil then 0 else p1.net_transfer_robux_amount,
		created_timestamp_ms = if p1 == nil or p1.created_timestamp_ms == nil then 0 else p1.created_timestamp_ms,
		sender = if p1 == nil or p1.sender == nil then nil else p1.sender
	}, Module))
end

function Module:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.transfer_request_id ~= nil and self.transfer_request_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.transfer_request_id)
	end
	if self.net_transfer_robux_amount ~= nil and self.net_transfer_robux_amount ~= 0 then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, self.net_transfer_robux_amount)
	end
	if self.created_timestamp_ms ~= nil and self.created_timestamp_ms ~= 0 then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult3, WriteTagResult2_2, self.created_timestamp_ms)
	end
	if self.sender ~= nil then
		local EncodeResult = self.sender:encode()
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
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
		Tag, Tag2, v17 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				NewModule.net_transfer_robux_amount, v17 = ProtoModule.readVarIntI64(Buf, v1)
			elseif Tag == 3 then
				NewModule.created_timestamp_ms, v17 = ProtoModule.readVarIntI64(Buf, v1)
			else
				local _
				_, v17 = ProtoModule.readVarInt(Buf, v1)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v17 = ProtoModule.readBuffer(Buf, v1)
				NewModule.transfer_request_id = buffer.tostring(Buffer1)
			elseif Tag == 4 then
				local Buffer2
				Buffer2, v17 = ProtoModule.readBuffer(Buf, v1)
				NewModule.sender = t.BuyRobuxTransferSenderData.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v17 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v17 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode()
	local t = {}
	
	if self.transfer_request_id ~= nil and self.transfer_request_id ~= "" then
		t.transferRequestId = self.transfer_request_id
	end
	if self.net_transfer_robux_amount ~= nil and self.net_transfer_robux_amount ~= 0 then
		t.netTransferRobuxAmount = self.net_transfer_robux_amount
	end
	if self.created_timestamp_ms ~= nil and self.created_timestamp_ms ~= 0 then
		t.createdTimestampMs = self.created_timestamp_ms
	end
	if self.sender ~= nil then
		t.sender = self.sender:jsonEncode()
	end
	return t
end

function Module:jsonDecode()
	-- upvalues: Module (copy), t (copy)
	local NewModule = Module.new()
	
	if self.transfer_request_id ~= nil then
		NewModule.transfer_request_id = self.transfer_request_id
	end
	if self.transferRequestId ~= nil then
		NewModule.transfer_request_id = self.transferRequestId
	end
	if self.net_transfer_robux_amount ~= nil then
		NewModule.net_transfer_robux_amount = self.net_transfer_robux_amount
	end
	if self.netTransferRobuxAmount ~= nil then
		NewModule.net_transfer_robux_amount = self.netTransferRobuxAmount
	end
	if self.created_timestamp_ms ~= nil then
		NewModule.created_timestamp_ms = self.created_timestamp_ms
	end
	if self.createdTimestampMs ~= nil then
		NewModule.created_timestamp_ms = self.createdTimestampMs
	end
	if self.sender ~= nil then
		NewModule.sender = t.BuyRobuxTransferSenderData.jsonDecode(self.sender)
	end
	return NewModule
end

Module.descriptor = {
	name = "BuyRobuxPendingTransferData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BuyRobuxPendingTransferData"
}
t.BuyRobuxPendingTransferData = Module
TypeRegistryModule.default:register(t.BuyRobuxPendingTransferData)
local Module1 = {}
Module1.__index = Module1

function Module1.new(p1)
	-- upvalues: Module1 (copy)
	return (setmetatable({
		user_id = if p1 == nil or p1.user_id == nil then "" else p1.user_id,
		display_name = if p1 == nil or p1.display_name == nil then "" else p1.display_name,
		thumbnail_url = if p1 == nil or p1.thumbnail_url == nil then "" else p1.thumbnail_url
	}, Module1))
end

function Module1:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.user_id)
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.display_name)
	end
	if self.thumbnail_url ~= nil and self.thumbnail_url ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.thumbnail_url)
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
		Tag, Tag2, v38 = ProtoModule.readTag(Buf, v2)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v38 = ProtoModule.readVarInt(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v38 = ProtoModule.readBuffer(Buf, v2)
				NewModule.user_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v38 = ProtoModule.readBuffer(Buf, v2)
				NewModule.display_name = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v38 = ProtoModule.readBuffer(Buf, v2)
				NewModule.thumbnail_url = buffer.tostring(Buffer3)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v2)
				v2 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v38 = ProtoModule.readFixed32(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v38 = ProtoModule.readFixed64(Buf, v2)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module1:jsonEncode()
	local t = {}
	
	if self.user_id ~= nil and self.user_id ~= "" then
		t.userId = self.user_id
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		t.displayName = self.display_name
	end
	if self.thumbnail_url ~= nil and self.thumbnail_url ~= "" then
		t.thumbnailUrl = self.thumbnail_url
	end
	return t
end

function Module1:jsonDecode()
	-- upvalues: Module1 (copy)
	local NewModule = Module1.new()
	
	if self.user_id ~= nil then
		NewModule.user_id = self.user_id
	end
	if self.userId ~= nil then
		NewModule.user_id = self.userId
	end
	if self.display_name ~= nil then
		NewModule.display_name = self.display_name
	end
	if self.displayName ~= nil then
		NewModule.display_name = self.displayName
	end
	if self.thumbnail_url ~= nil then
		NewModule.thumbnail_url = self.thumbnail_url
	end
	if self.thumbnailUrl ~= nil then
		NewModule.thumbnail_url = self.thumbnailUrl
	end
	return NewModule
end

Module1.descriptor = {
	name = "BuyRobuxTransferSenderData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BuyRobuxTransferSenderData"
}
t.BuyRobuxTransferSenderData = Module1
TypeRegistryModule.default:register(t.BuyRobuxTransferSenderData)

return {
	BuyRobuxPendingTransferData = t.BuyRobuxPendingTransferData,
	BuyRobuxTransferSenderData = t.BuyRobuxTransferSenderData
}