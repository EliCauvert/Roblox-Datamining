local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local capabilityModule = require(script.Parent.capability)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t (ref), t_1 (ref)
	return setmetatable({
		enabled_capabilities = if p1 == nil or p1.enabled_capabilities == nil then {} else p1.enabled_capabilities,
		proto_version = if p1 == nil or p1.proto_version == nil then "" else p1.proto_version,
		platform = if p1 == nil or p1.platform == nil then assert(t.Platform.fromNumber(0), "Enum has no 0 default") else p1.platform
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref), capabilityModule (ref), t (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.enabled_capabilities ~= nil and #self.enabled_capabilities > 0 then
		for i, v in self.enabled_capabilities do
			local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
			var2, var8 = protoModule.writeVarInt(var2, var3, capabilityModule.Capability.toNumber(v))
			buff = var2
			var1 = var3
		end
	end
	if self.proto_version ~= nil and self.proto_version ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var10 = protoModule.writeString(var4, var5, self.proto_version)
		buff = var4
		var1 = var5
	end
	if self.platform ~= nil and (self.platform ~= nil and self.platform ~= 0 or self.platform ~= t.Platform.fromNumber(0)) then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.varint)
		var6, var12 = protoModule.writeVarInt(var6, var7, t.Platform.toNumber(self.platform))
		buff = var6
		var1 = var7
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref), capabilityModule (ref), t (ref)
	local var8 = t_1.new()
	local var9 = 0
	while var9 < buffer.len(p1) do
		local _ = nil
		local var10 = nil
		local var11, var12, var13 = protoModule.readTag(p1, var9)
		local var14 = var11
		var10 = var12
		var9 = var13
		
		if var10 == protoModule.wireTypes.varint then
			if var14 == 1 then
				local _ = nil
				local var15, var16 = protoModule.readVarIntI32(p1, var9)
				local var17 = var15
				var9 = var16
				table.insert(var8.enabled_capabilities, capabilityModule.Capability.fromNumber(var17) or var17)
			elseif var14 == 3 then
				local _ = nil
				local var18, var19 = protoModule.readVarIntI32(p1, var9)
				local var20 = var18
				var9 = var19
				var8.platform = t.Platform.fromNumber(var20) or var20
			else
				local _ = nil
				local var21, var22 = protoModule.readVarInt(p1, var9)
				local _ = var21
				var9 = var22
			end
		end
		if var10 == protoModule.wireTypes.lengthDelimited then
			if var14 == 2 then
				local _ = nil
				local var23, var24 = protoModule.readBuffer(p1, var9)
				var9 = var24
				var8.proto_version = buffer.tostring(var23)
			else
				local _ = nil
				local var25, var26 = protoModule.readVarInt(p1, var9)
				var9 = var26 + var25
			end
		elseif var10 == protoModule.wireTypes.i32 then
			local _ = nil
			local var27, var28 = protoModule.readFixed32(p1, var9)
			local _ = var27
			var9 = var28
		elseif var10 == protoModule.wireTypes.i64 then
			local _ = nil
			local var29, var30 = protoModule.readFixed64(p1, var9)
			local _ = var29
			var9 = var30
		else
			error("Unsupported wire type: " .. var16)
		end
	end
	return var8
end

function t_1:jsonEncode()
	-- upvalues: capabilityModule (ref), t (ref)
	local t_1 = {}
	
	if self.enabled_capabilities ~= nil and #self.enabled_capabilities > 0 then
		local t_2 = {}
		
		for i, v in self.enabled_capabilities do
			table.insert(t_2, if typeof(v) == "number" then v else capabilityModule.Capability.toNumber(v))
		end
		t_1.enabledCapabilities = t_2
	end
	if self.proto_version ~= nil and self.proto_version ~= "" then
		t_1.protoVersion = self.proto_version
	end
	if self.platform ~= nil and (self.platform ~= nil and self.platform ~= 0 or self.platform ~= t.Platform.fromNumber(0)) then
		t_1.platform = if typeof(self.platform) == "number" then self.platform else t.Platform.toNumber(self.platform)
	end
	return t_1
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref), capabilityModule (ref), t (ref)
	local var31 = t_1.new()
	
	if self.enabled_capabilities ~= nil then
		local t_2 = {}
		
		for i, v in self.enabled_capabilities do
			table.insert(t_2, if typeof(v) == "number" then capabilityModule.Capability.fromNumber(v) or v else capabilityModule.Capability.fromName(v) or v)
		end
		var31.enabled_capabilities = t_2
	end
	if self.enabledCapabilities ~= nil then
		local t_2 = {}
		
		for i, v in self.enabledCapabilities do
			table.insert(t_2, if typeof(v) == "number" then capabilityModule.Capability.fromNumber(v) or v else capabilityModule.Capability.fromName(v) or v)
		end
		var31.enabled_capabilities = t_2
	end
	if self.proto_version ~= nil then
		var31.proto_version = self.proto_version
	end
	if self.protoVersion ~= nil then
		var31.proto_version = self.protoVersion
	end
	if self.platform ~= nil then
		var31.platform = if typeof(self.platform) == "number" then t.Platform.fromNumber(self.platform) or self.platform else t.Platform.fromName(self.platform) or self.platform
	end
	return var31
end

t_1.descriptor = {
	name = "ClientCapabilities",
	fullName = "roblox.apppageplatform.shared.v1beta1.ClientCapabilities"
}
t.ClientCapabilities = t_1
typeRegistryModule.default:register(t.ClientCapabilities)
t.Platform = {
	fromNumber = function(p2)
		return if p2 == 0 then "PLATFORM_INVALID" elseif p2 == 1 then "PLATFORM_WEB" elseif p2 == 2 then "PLATFORM_APP" else nil
	end,
	toNumber = function(p2)
		return if p2 == "PLATFORM_INVALID" then 0 elseif p2 == "PLATFORM_WEB" then 1 elseif p2 == "PLATFORM_APP" then 2 else p2
	end,
	fromName = function(p2)
		return if p2 == "PLATFORM_INVALID" then "PLATFORM_INVALID" elseif p2 == "PLATFORM_WEB" then "PLATFORM_WEB" elseif p2 == "PLATFORM_APP" then "PLATFORM_APP" else nil
	end
}

return {
	ClientCapabilities = t.ClientCapabilities,
	Platform = t.Platform
}