local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local structModule = require(script.Parent.Parent.Parent.Parent.Parent.google.protobuf.struct)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
		saved = if p1 == nil or p1.saved == nil then nil else p1.saved,
		catalogs = if p1 == nil or p1.catalogs == nil then nil else p1.catalogs,
		capabilities = if p1 == nil or p1.capabilities == nil then nil else p1.capabilities
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.saved ~= nil then
		local var2 = self.saved:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var9 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.catalogs ~= nil then
		local var5 = self.catalogs:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var12 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	if self.capabilities ~= nil then
		local var8 = self.capabilities:encode()
		local var9, var10 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var9, var15 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
		buff = var9
		var1 = var10
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref), structModule (ref)
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
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.saved = structModule.Struct.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.catalogs = structModule.Struct.decode(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.capabilities = structModule.Struct.decode(var14)
			else
				local _ = nil
				local var16, var17 = protoModule.readVarInt(p1, var2)
				var2 = var17 + var16
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var18, var19 = protoModule.readFixed32(p1, var2)
			local _ = var18
			var2 = var19
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var20, var21 = protoModule.readFixed64(p1, var2)
			local _ = var20
			var2 = var21
		else
			error("Unsupported wire type: " .. var19)
		end
	end
	return var1
end

function t_1:jsonEncode()
	local t = {}
	
	if self.saved ~= nil then
		t.saved = self.saved:jsonEncode()
	end
	if self.catalogs ~= nil then
		t.catalogs = self.catalogs:jsonEncode()
	end
	if self.capabilities ~= nil then
		t.capabilities = self.capabilities:jsonEncode()
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref), structModule (ref)
	local var22 = t_1.new()
	
	if self.saved ~= nil then
		var22.saved = structModule.Struct.jsonDecode(self.saved)
	end
	if self.catalogs ~= nil then
		var22.catalogs = structModule.Struct.jsonDecode(self.catalogs)
	end
	if self.capabilities ~= nil then
		var22.capabilities = structModule.Struct.jsonDecode(self.capabilities)
	end
	return var22
end

t_1.descriptor = {
	name = "ConfigDrivenFormInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConfigDrivenFormInputData"
}
t.ConfigDrivenFormInputData = t_1
typeRegistryModule.default:register(t.ConfigDrivenFormInputData)

return { ConfigDrivenFormInputData = t.ConfigDrivenFormInputData }