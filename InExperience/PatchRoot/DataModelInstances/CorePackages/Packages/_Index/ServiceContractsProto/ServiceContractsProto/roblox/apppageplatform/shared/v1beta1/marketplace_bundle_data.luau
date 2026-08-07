local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 52 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({
		id = if p0 == nil or p0.id == nil then "" else p0.id,
		name = if p0 == nil or p0.name == nil then "" else p0.name,
		creator_name = if p0 == nil or p0.creator_name == nil then "" else p0.creator_name,
		creator_has_verified_badge = if p0 == nil or p0.creator_has_verified_badge == nil then false else p0.creator_has_verified_badge,
		bundle_type = if p0 == nil or p0.bundle_type == nil then "" else p0.bundle_type,
		price = if p0 == nil or p0.price == nil then 0 else p0.price
	}, t_1)
end

function t_1:encode() --[[ line: 65 ]]
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
	if self.creator_name ~= nil and self.creator_name ~= "" then
		local var10, var11 = protoModule.writeTag(buff, var5, 3, protoModule.wireTypes.lengthDelimited)
		var10, var11 = protoModule.writeString(var10, var11, self.creator_name)
		buff = var10
		var5 = var11
	end
	if self.creator_has_verified_badge then
		local var12, var13 = protoModule.writeTag(buff, var5, 4, protoModule.wireTypes.varint)
		var12, var13 = protoModule.writeVarInt(var12, var13, if self.creator_has_verified_badge then 1 else 0)
		buff = var12
		var5 = var13
	end
	if self.bundle_type ~= nil and self.bundle_type ~= "" then
		local var14, var15 = protoModule.writeTag(buff, var5, 5, protoModule.wireTypes.lengthDelimited)
		var14, var15 = protoModule.writeString(var14, var15, self.bundle_type)
		buff = var14
		var5 = var15
	end
	if self.price ~= nil and self.price ~= 0 then
		local var16, var17 = protoModule.writeTag(buff, var5, 6, protoModule.wireTypes.varint)
		var16, var17 = protoModule.writeVarInt(var16, var17, self.price)
		buff = var16
		var5 = var17
	end
	local buff_1 = buffer.create(var5)
	buffer.copy(buff_1, 0, buff, 0, var5)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 104 ]]
	-- upvalues: t_1 (ref), protoModule (ref)
	local var19 = t_1.new()
	local var20 = 0
	while var20 < buffer.len(p1) do
		local _ = nil
		local var21 = nil
		local var22, var23, var24 = protoModule.readTag(p1, var20)
		local var25 = var22
		var21 = var23
		var20 = var24
		
		if var21 == protoModule.wireTypes.varint then
			if var25 == 4 then
				local _ = nil
				local var26, var27 = protoModule.readVarInt(p1, var20)
				var20 = var27
				var19.creator_has_verified_badge = var26 ~= 0
			elseif var25 == 6 then
				local _ = nil
				local var28, var29 = protoModule.readVarIntI64(p1, var20)
				var20 = var29
				var19.price = var28
			else
				local _ = nil
				local var30, var31 = protoModule.readVarInt(p1, var20)
				local _ = var30
				var20 = var31
			end
		end
		if var21 == protoModule.wireTypes.lengthDelimited then
			if var25 == 1 then
				local _ = nil
				local var32, var33 = protoModule.readBuffer(p1, var20)
				var20 = var33
				var19.id = buffer.tostring(var32)
			elseif var25 == 2 then
				local _ = nil
				local var34, var35 = protoModule.readBuffer(p1, var20)
				var20 = var35
				var19.name = buffer.tostring(var34)
			elseif var25 == 3 then
				local _ = nil
				local var36, var37 = protoModule.readBuffer(p1, var20)
				var20 = var37
				var19.creator_name = buffer.tostring(var36)
			elseif var25 == 5 then
				local _ = nil
				local var38, var39 = protoModule.readBuffer(p1, var20)
				var20 = var39
				var19.bundle_type = buffer.tostring(var38)
			else
				local _ = nil
				local var40, var41 = protoModule.readVarInt(p1, var20)
				var20 = var41 + var40
			end
		elseif var21 == protoModule.wireTypes.i32 then
			local _ = nil
			local var42, var43 = protoModule.readFixed32(p1, var20)
			local _ = var42
			var20 = var43
		elseif var21 == protoModule.wireTypes.i64 then
			local _ = nil
			local var44, var45 = protoModule.readFixed64(p1, var20)
			local _ = var44
			var20 = var45
		else
			error("Unsupported wire type: " .. var21)
		end
	end
	return var19
end

function t_1:jsonEncode() --[[ line: 172 ]]
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

function t_1:jsonDecode() --[[ line: 202 ]]
	-- upvalues: t_1 (ref)
	local var47 = t_1.new()
	
	if self.id ~= nil then
		var47.id = self.id
	end
	if self.name ~= nil then
		var47.name = self.name
	end
	if self.creator_name ~= nil then
		var47.creator_name = self.creator_name
	end
	if self.creatorName ~= nil then
		var47.creator_name = self.creatorName
	end
	if self.creator_has_verified_badge ~= nil then
		var47.creator_has_verified_badge = self.creator_has_verified_badge
	end
	if self.creatorHasVerifiedBadge ~= nil then
		var47.creator_has_verified_badge = self.creatorHasVerifiedBadge
	end
	if self.bundle_type ~= nil then
		var47.bundle_type = self.bundle_type
	end
	if self.bundleType ~= nil then
		var47.bundle_type = self.bundleType
	end
	if self.price ~= nil then
		var47.price = self.price
	end
	return var47
end

t_1.descriptor = {
	name = "MarketplaceBundleData",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceBundleData"
}
t.MarketplaceBundleData = t_1
typeRegistryModule.default:register(t.MarketplaceBundleData)

return { MarketplaceBundleData = t.MarketplaceBundleData }