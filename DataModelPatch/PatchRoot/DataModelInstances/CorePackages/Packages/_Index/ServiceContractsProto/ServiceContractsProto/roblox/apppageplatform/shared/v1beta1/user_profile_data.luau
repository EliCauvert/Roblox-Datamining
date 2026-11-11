local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local Module = {}
Module.__index = Module

function Module.new(p1)
	-- upvalues: Module (copy)
	return (setmetatable({
		user_id = if p1 == nil or p1.user_id == nil then nil else p1.user_id,
		username = if p1 == nil or p1.username == nil then nil else p1.username,
		display_name = if p1 == nil or p1.display_name == nil then nil else p1.display_name,
		is_verified = if p1 == nil or p1.is_verified == nil then nil else p1.is_verified,
		previous_usernames = if p1 == nil or p1.previous_usernames == nil then {} else p1.previous_usernames
	}, Module))
end

function Module:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.user_id ~= nil then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, self.user_id)
	end
	if self.username ~= nil then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.username)
	end
	if self.display_name ~= nil then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.display_name)
	end
	if self.is_verified ~= nil then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult4, WriteTagResult2_3, if self.is_verified then 1 else 0)
	end
	if self.previous_usernames ~= nil and #self.previous_usernames > 0 then
		for _, previousUsername in self.previous_usernames do
			local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult5, WriteTagResult2_4, previousUsername)
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
		Tag, Tag2, v17 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				NewModule.user_id, v17 = ProtoModule.readVarIntI64(Buf, v1)
			elseif Tag == 4 then
				local VarInt
				VarInt, v17 = ProtoModule.readVarInt(Buf, v1)
				NewModule.is_verified = VarInt ~= 0
			else
				local _
				_, v17 = ProtoModule.readVarInt(Buf, v1)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v17 = ProtoModule.readBuffer(Buf, v1)
				NewModule.username = buffer.tostring(Buffer1)
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v17 = ProtoModule.readBuffer(Buf, v1)
				NewModule.display_name = buffer.tostring(Buffer2)
			elseif Tag == 5 then
				local Buffer3
				Buffer3, v17 = ProtoModule.readBuffer(Buf, v1)
				table.insert(NewModule.previous_usernames, buffer.tostring(Buffer3))
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt1
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
	
	if self.user_id ~= nil then
		t.userId = self.user_id
	end
	if self.username ~= nil then
		t.username = self.username
	end
	if self.display_name ~= nil then
		t.displayName = self.display_name
	end
	if self.is_verified ~= nil then
		t.isVerified = self.is_verified
	end
	if self.previous_usernames ~= nil and #self.previous_usernames > 0 then
		local PreviousUsernames = {}
		
		for _, previousUsername in self.previous_usernames do
			table.insert(PreviousUsernames, previousUsername)
		end
		t.previousUsernames = PreviousUsernames
	end
	return t
end

function Module:jsonDecode()
	-- upvalues: Module (copy)
	local NewModule = Module.new()
	
	if self.user_id ~= nil then
		NewModule.user_id = self.user_id
	end
	if self.userId ~= nil then
		NewModule.user_id = self.userId
	end
	if self.username ~= nil then
		NewModule.username = self.username
	end
	if self.display_name ~= nil then
		NewModule.display_name = self.display_name
	end
	if self.displayName ~= nil then
		NewModule.display_name = self.displayName
	end
	if self.is_verified ~= nil then
		NewModule.is_verified = self.is_verified
	end
	if self.isVerified ~= nil then
		NewModule.is_verified = self.isVerified
	end
	if self.previous_usernames ~= nil then
		local Previous_usernames = {}
		
		for _, previousUsername in self.previous_usernames do
			table.insert(Previous_usernames, previousUsername)
		end
		NewModule.previous_usernames = Previous_usernames
	end
	if self.previousUsernames ~= nil then
		local Previous_usernames = {}
		
		for _, previousUsername1 in self.previousUsernames do
			table.insert(Previous_usernames, previousUsername1)
		end
		NewModule.previous_usernames = Previous_usernames
	end
	return NewModule
end

Module.descriptor = {
	name = "UserProfileData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserProfileData"
}
local config = { UserProfileData = Module }
TypeRegistryModule.default:register(config.UserProfileData)

return { UserProfileData = config.UserProfileData }