local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 39 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({ id = if p0 == nil or p0.id == nil then "" else p0.id }, t_1)
end

function t_1:encode() --[[ line: 45 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var6, var7 = protoModule.writeTag(buff, var5, 1, protoModule.wireTypes.lengthDelimited)
		var6, var7 = protoModule.writeString(var6, var7, self.id)
		buff = var6
		var5 = var7
	end
	local buff_1 = buffer.create(var5)
	buffer.copy(buff_1, 0, buff, 0, var5)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 59 ]]
	-- upvalues: t_1 (ref), protoModule (ref)
	local var9 = t_1.new()
	local var10 = 0
	while var10 < buffer.len(p1) do
		local _ = nil
		local var11 = nil
		local var12, var13, var14 = protoModule.readTag(p1, var10)
		local var15 = var12
		var11 = var13
		var10 = var14
		
		if var11 == protoModule.wireTypes.varint then
			local _ = nil
			local var16, var17 = protoModule.readVarInt(p1, var10)
			local _ = var16
			var10 = var17
			continue
		end
		if var11 == protoModule.wireTypes.lengthDelimited then
			if var15 == 1 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var10)
				var10 = var19
				var9.id = buffer.tostring(var18)
			else
				local _ = nil
				local var20, var21 = protoModule.readVarInt(p1, var10)
				var10 = var21 + var20
			end
		elseif var11 == protoModule.wireTypes.i32 then
			local _ = nil
			local var22, var23 = protoModule.readFixed32(p1, var10)
			local _ = var22
			var10 = var23
		elseif var11 == protoModule.wireTypes.i64 then
			local _ = nil
			local var24, var25 = protoModule.readFixed64(p1, var10)
			local _ = var24
			var10 = var25
		else
			error("Unsupported wire type: " .. var11)
		end
	end
	return var9
end

function t_1:jsonEncode() --[[ line: 102 ]]
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	return t
end

function t_1:jsonDecode() --[[ line: 112 ]]
	-- upvalues: t_1 (ref)
	local var27 = t_1.new()
	
	if self.id ~= nil then
		var27.id = self.id
	end
	return var27
end

t_1.descriptor = {
	name = "MarketplaceLookData",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceLookData"
}
t.MarketplaceLookData = t_1
typeRegistryModule.default:register(t.MarketplaceLookData)

return { MarketplaceLookData = t.MarketplaceLookData }