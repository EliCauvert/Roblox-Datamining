local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
		id = if p1 == nil or p1.id == nil then "" else p1.id,
		name = if p1 == nil or p1.name == nil then "" else p1.name,
		member_count = if p1 == nil or p1.member_count == nil then 0 else p1.member_count,
		description = if p1 == nil or p1.description == nil then "" else p1.description,
		is_verified = if p1 == nil or p1.is_verified == nil then false else p1.is_verified
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var7 = protoModule.writeString(var2, var3, self.id)
		buff = var2
		var1 = var3
	end
	if self.name ~= nil and self.name ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var9 = protoModule.writeString(var4, var5, self.name)
		buff = var4
		var1 = var5
	end
	if self.member_count ~= nil and self.member_count ~= 0 then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.varint)
		var6, var11 = protoModule.writeVarInt(var6, var7, self.member_count)
		buff = var6
		var1 = var7
	end
	if self.description ~= nil and self.description ~= "" then
		local var8, var9 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var8, var13 = protoModule.writeString(var8, var9, self.description)
		buff = var8
		var1 = var9
	end
	if self.is_verified then
		local var10, var11 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.varint)
		var10, var15 = protoModule.writeVarInt(var10, var11, if self.is_verified then 1 else 0)
		buff = var10
		var1 = var11
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref)
	local var1 = t_1.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 3 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI64(p1, var2)
				var2 = var9
				var1.member_count = var8
			elseif var7 == 5 then
				local _ = nil
				local var10, var11 = protoModule.readVarInt(p1, var2)
				var2 = var11
				var1.is_verified = var10 ~= 0
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				local _ = var12
				var2 = var13
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.id = buffer.tostring(var14)
			elseif var7 == 2 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.name = buffer.tostring(var16)
			elseif var7 == 4 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.description = buffer.tostring(var18)
			else
				local _ = nil
				local var20, var21 = protoModule.readVarInt(p1, var2)
				var2 = var21 + var20
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var22, var23 = protoModule.readFixed32(p1, var2)
			local _ = var22
			var2 = var23
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var24, var25 = protoModule.readFixed64(p1, var2)
			local _ = var24
			var2 = var25
		else
			error("Unsupported wire type: " .. var19)
		end
	end
	return var1
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
	local var26 = t_1.new()
	
	if self.id ~= nil then
		var26.id = self.id
	end
	if self.name ~= nil then
		var26.name = self.name
	end
	if self.member_count ~= nil then
		var26.member_count = self.member_count
	end
	if self.memberCount ~= nil then
		var26.member_count = self.memberCount
	end
	if self.description ~= nil then
		var26.description = self.description
	end
	if self.is_verified ~= nil then
		var26.is_verified = self.is_verified
	end
	if self.isVerified ~= nil then
		var26.is_verified = self.isVerified
	end
	return var26
end

t_1.descriptor = {
	name = "CommunityData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CommunityData"
}
t.CommunityData = t_1
typeRegistryModule.default:register(t.CommunityData)

return { CommunityData = t.CommunityData }