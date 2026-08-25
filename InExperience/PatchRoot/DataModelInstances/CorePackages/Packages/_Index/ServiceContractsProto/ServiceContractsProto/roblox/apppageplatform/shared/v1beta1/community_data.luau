local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0)
	-- upvalues: t_1 (ref)
	return setmetatable({
		id = if p0 == nil or p0.id == nil then "" else p0.id,
		name = if p0 == nil or p0.name == nil then "" else p0.name,
		member_count = if p0 == nil or p0.member_count == nil then 0 else p0.member_count,
		description = if p0 == nil or p0.description == nil then "" else p0.description,
		is_verified = if p0 == nil or p0.is_verified == nil then false else p0.is_verified
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var6, var7 = protoModule.writeTag(buff, var5, 1, protoModule.wireTypes.lengthDelimited)
		var6, var7 = protoModule.writeString(var6, var7, self.id)
		buff = var6
		var5 = var7
	end
	if self.name ~= nil and self.name ~= "" then
		local var8, var9 = protoModule.writeTag(buff, var5, 2, protoModule.wireTypes.lengthDelimited)
		var8, var9 = protoModule.writeString(var8, var9, self.name)
		buff = var8
		var5 = var9
	end
	if self.member_count ~= nil and self.member_count ~= 0 then
		local var10, var11 = protoModule.writeTag(buff, var5, 3, protoModule.wireTypes.varint)
		var10, var11 = protoModule.writeVarInt(var10, var11, self.member_count)
		buff = var10
		var5 = var11
	end
	if self.description ~= nil and self.description ~= "" then
		local var12, var13 = protoModule.writeTag(buff, var5, 4, protoModule.wireTypes.lengthDelimited)
		var12, var13 = protoModule.writeString(var12, var13, self.description)
		buff = var12
		var5 = var13
	end
	if self.is_verified then
		local var14, var15 = protoModule.writeTag(buff, var5, 5, protoModule.wireTypes.varint)
		var14, var15 = protoModule.writeVarInt(var14, var15, if self.is_verified then 1 else 0)
		buff = var14
		var5 = var15
	end
	local buff_1 = buffer.create(var5)
	buffer.copy(buff_1, 0, buff, 0, var5)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref)
	local var17 = t_1.new()
	local var18 = 0
	while var18 < buffer.len(p1) do
		local _ = nil
		local var19 = nil
		local var20, var21, var22 = protoModule.readTag(p1, var18)
		local var23 = var20
		var19 = var21
		var18 = var22
		
		if var19 == protoModule.wireTypes.varint then
			if var23 == 3 then
				local _ = nil
				local var24, var25 = protoModule.readVarIntI64(p1, var18)
				var18 = var25
				var17.member_count = var24
			elseif var23 == 5 then
				local _ = nil
				local var26, var27 = protoModule.readVarInt(p1, var18)
				var18 = var27
				var17.is_verified = var26 ~= 0
			else
				local _ = nil
				local var28, var29 = protoModule.readVarInt(p1, var18)
				local _ = var28
				var18 = var29
			end
		end
		if var19 == protoModule.wireTypes.lengthDelimited then
			if var23 == 1 then
				local _ = nil
				local var30, var31 = protoModule.readBuffer(p1, var18)
				var18 = var31
				var17.id = buffer.tostring(var30)
			elseif var23 == 2 then
				local _ = nil
				local var32, var33 = protoModule.readBuffer(p1, var18)
				var18 = var33
				var17.name = buffer.tostring(var32)
			elseif var23 == 4 then
				local _ = nil
				local var34, var35 = protoModule.readBuffer(p1, var18)
				var18 = var35
				var17.description = buffer.tostring(var34)
			else
				local _ = nil
				local var36, var37 = protoModule.readVarInt(p1, var18)
				var18 = var37 + var36
			end
		elseif var19 == protoModule.wireTypes.i32 then
			local _ = nil
			local var38, var39 = protoModule.readFixed32(p1, var18)
			local _ = var38
			var18 = var39
		elseif var19 == protoModule.wireTypes.i64 then
			local _ = nil
			local var40, var41 = protoModule.readFixed64(p1, var18)
			local _ = var40
			var18 = var41
		else
			error("Unsupported wire type: " .. var19)
		end
	end
	return var17
end

function t_1:jsonEncode()
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.name ~= nil and self.name ~= "" then
		t.name = self.name
	end
	if self.member_count ~= nil and self.member_count ~= 0 then
		t.memberCount = self.member_count
	end
	if self.description ~= nil and self.description ~= "" then
		t.description = self.description
	end
	if self.is_verified then
		t.isVerified = self.is_verified
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref)
	local var43 = t_1.new()
	
	if self.id ~= nil then
		var43.id = self.id
	end
	if self.name ~= nil then
		var43.name = self.name
	end
	if self.member_count ~= nil then
		var43.member_count = self.member_count
	end
	if self.memberCount ~= nil then
		var43.member_count = self.memberCount
	end
	if self.description ~= nil then
		var43.description = self.description
	end
	if self.is_verified ~= nil then
		var43.is_verified = self.is_verified
	end
	if self.isVerified ~= nil then
		var43.is_verified = self.isVerified
	end
	return var43
end

t_1.descriptor = {
	name = "CommunityData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CommunityData"
}
t.CommunityData = t_1
typeRegistryModule.default:register(t.CommunityData)

return { CommunityData = t.CommunityData }