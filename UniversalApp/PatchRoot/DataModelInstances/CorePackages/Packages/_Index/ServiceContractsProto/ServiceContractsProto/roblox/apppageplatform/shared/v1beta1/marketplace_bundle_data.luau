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
		creator_name = if p1 == nil or p1.creator_name == nil then "" else p1.creator_name,
		creator_has_verified_badge = if p1 == nil or p1.creator_has_verified_badge == nil then false else p1.creator_has_verified_badge,
		bundle_type = if p1 == nil or p1.bundle_type == nil then "" else p1.bundle_type,
		price = if p1 == nil or p1.price == nil then 0 else p1.price
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
	if self.creator_name ~= nil and self.creator_name ~= "" then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var6, var11 = protoModule.writeString(var6, var7, self.creator_name)
		buff = var6
		var1 = var7
	end
	if self.creator_has_verified_badge then
		local var8, var9 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.varint)
		var8, var13 = protoModule.writeVarInt(var8, var9, if self.creator_has_verified_badge then 1 else 0)
		buff = var8
		var1 = var9
	end
	if self.bundle_type ~= nil and self.bundle_type ~= "" then
		local var10, var11 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
		var10, var15 = protoModule.writeString(var10, var11, self.bundle_type)
		buff = var10
		var1 = var11
	end
	if self.price ~= nil and self.price ~= 0 then
		local var12, var13 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.varint)
		var12, var17 = protoModule.writeVarInt(var12, var13, self.price)
		buff = var12
		var1 = var13
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
			if var7 == 4 then
				local _ = nil
				local var8, var9 = protoModule.readVarInt(p1, var2)
				var2 = var9
				var1.creator_has_verified_badge = var8 ~= 0
			elseif var7 == 6 then
				local _ = nil
				local var10, var11 = protoModule.readVarIntI64(p1, var2)
				var2 = var11
				var1.price = var10
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
			elseif var7 == 3 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.creator_name = buffer.tostring(var18)
			elseif var7 == 5 then
				local _ = nil
				local var20, var21 = protoModule.readBuffer(p1, var2)
				var2 = var21
				var1.bundle_type = buffer.tostring(var20)
			else
				local _ = nil
				local var22, var23 = protoModule.readVarInt(p1, var2)
				var2 = var23 + var22
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var24, var25 = protoModule.readFixed32(p1, var2)
			local _ = var24
			var2 = var25
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var26, var27 = protoModule.readFixed64(p1, var2)
			local _ = var26
			var2 = var27
		else
			error("Unsupported wire type: " .. var21)
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
	if self.creator_name ~= nil and self.creator_name ~= "" then
		t.creatorName = self.creator_name
	end
	if self.creator_has_verified_badge then
		t.creatorHasVerifiedBadge = self.creator_has_verified_badge
	end
	if self.bundle_type ~= nil and self.bundle_type ~= "" then
		t.bundleType = self.bundle_type
	end
	if self.price ~= nil and self.price ~= 0 then
		t.price = self.price
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref)
	local var28 = t_1.new()
	
	if self.id ~= nil then
		var28.id = self.id
	end
	if self.name ~= nil then
		var28.name = self.name
	end
	if self.creator_name ~= nil then
		var28.creator_name = self.creator_name
	end
	if self.creatorName ~= nil then
		var28.creator_name = self.creatorName
	end
	if self.creator_has_verified_badge ~= nil then
		var28.creator_has_verified_badge = self.creator_has_verified_badge
	end
	if self.creatorHasVerifiedBadge ~= nil then
		var28.creator_has_verified_badge = self.creatorHasVerifiedBadge
	end
	if self.bundle_type ~= nil then
		var28.bundle_type = self.bundle_type
	end
	if self.bundleType ~= nil then
		var28.bundle_type = self.bundleType
	end
	if self.price ~= nil then
		var28.price = self.price
	end
	return var28
end

t_1.descriptor = {
	name = "MarketplaceBundleData",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceBundleData"
}
t.MarketplaceBundleData = t_1
typeRegistryModule.default:register(t.MarketplaceBundleData)

return { MarketplaceBundleData = t.MarketplaceBundleData }