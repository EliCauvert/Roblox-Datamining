local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local capabilityModule = require(script.Parent.capability)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0)
	-- upvalues: t (ref), t_1 (ref)
	return setmetatable({
		enabled_capabilities = if p0 == nil or p0.enabled_capabilities == nil then {} else p0.enabled_capabilities,
		proto_version = if p0 == nil or p0.proto_version == nil then "" else p0.proto_version,
		platform = if p0 == nil or p0.platform == nil then assert(t.Platform.fromNumber(0), "Enum has no 0 default") else p0.platform
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref), capabilityModule (ref), t (ref)
	local buff = buffer.create(0)
	local var6 = 0
	
	if self.enabled_capabilities ~= nil and #self.enabled_capabilities > 0 then
		for i, v in self.enabled_capabilities do
			local var7, var8 = protoModule.writeTag(buff, var6, 1, protoModule.wireTypes.varint)
			var7, var8 = protoModule.writeVarInt(var7, var8, capabilityModule.Capability.toNumber(v))
			buff = var7
			var6 = var8
		end
	end
	if self.proto_version ~= nil and self.proto_version ~= "" then
		local var9, var10 = protoModule.writeTag(buff, var6, 2, protoModule.wireTypes.lengthDelimited)
		var9, var10 = protoModule.writeString(var9, var10, self.proto_version)
		buff = var9
		var6 = var10
	end
	if self.platform ~= nil and (self.platform ~= nil and self.platform ~= 0 or self.platform ~= t.Platform.fromNumber(0)) then
		local var11, var12 = protoModule.writeTag(buff, var6, 3, protoModule.wireTypes.varint)
		var11, var12 = protoModule.writeVarInt(var11, var12, t.Platform.toNumber(self.platform))
		buff = var11
		var6 = var12
	end
	local buff_1 = buffer.create(var6)
	buffer.copy(buff_1, 0, buff, 0, var6)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref), capabilityModule (ref), t (ref)
	local var14 = t_1.new()
	local var15 = 0
	while var15 < buffer.len(p1) do
		local _ = nil
		local var16 = nil
		local var17, var18, var19 = protoModule.readTag(p1, var15)
		local var20 = var17
		var16 = var18
		var15 = var19
		
		if var16 == protoModule.wireTypes.varint then
			if var20 == 1 then
				local _ = nil
				local var21, var22 = protoModule.readVarIntI32(p1, var15)
				local var23 = var21
				var15 = var22
				table.insert(var14.enabled_capabilities, capabilityModule.Capability.fromNumber(var23) or var23)
			elseif var20 == 3 then
				local _ = nil
				local var24, var25 = protoModule.readVarIntI32(p1, var15)
				local var26 = var24
				var15 = var25
				var14.platform = t.Platform.fromNumber(var26) or var26
			else
				local _ = nil
				local var27, var28 = protoModule.readVarInt(p1, var15)
				local _ = var27
				var15 = var28
			end
		end
		if var16 == protoModule.wireTypes.lengthDelimited then
			if var20 == 2 then
				local _ = nil
				local var29, var30 = protoModule.readBuffer(p1, var15)
				var15 = var30
				var14.proto_version = buffer.tostring(var29)
			else
				local _ = nil
				local var31, var32 = protoModule.readVarInt(p1, var15)
				var15 = var32 + var31
			end
		elseif var16 == protoModule.wireTypes.i32 then
			local _ = nil
			local var33, var34 = protoModule.readFixed32(p1, var15)
			local _ = var33
			var15 = var34
		elseif var16 == protoModule.wireTypes.i64 then
			local _ = nil
			local var35, var36 = protoModule.readFixed64(p1, var15)
			local _ = var35
			var15 = var36
		else
			error("Unsupported wire type: " .. var16)
		end
	end
	return var14
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
	local var39 = t_1.new()
	
	if self.enabled_capabilities ~= nil then
		local t_2 = {}
		
		for i, v in self.enabled_capabilities do
			table.insert(t_2, if typeof(v) == "number" then capabilityModule.Capability.fromNumber(v) or v else capabilityModule.Capability.fromName(v) or v)
		end
		var39.enabled_capabilities = t_2
	end
	if self.enabledCapabilities ~= nil then
		local t_2 = {}
		
		for i, v in self.enabledCapabilities do
			table.insert(t_2, if typeof(v) == "number" then capabilityModule.Capability.fromNumber(v) or v else capabilityModule.Capability.fromName(v) or v)
		end
		var39.enabled_capabilities = t_2
	end
	if self.proto_version ~= nil then
		var39.proto_version = self.proto_version
	end
	if self.protoVersion ~= nil then
		var39.proto_version = self.protoVersion
	end
	if self.platform ~= nil then
		var39.platform = if typeof(self.platform) == "number" then t.Platform.fromNumber(self.platform) or self.platform else t.Platform.fromName(self.platform) or self.platform
	end
	return var39
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
	toNumber = function(p3)
		return if p3 == "PLATFORM_INVALID" then 0 elseif p3 == "PLATFORM_WEB" then 1 elseif p3 == "PLATFORM_APP" then 2 else p3
	end,
	fromName = function(p4)
		return if p4 == "PLATFORM_INVALID" then "PLATFORM_INVALID" elseif p4 == "PLATFORM_WEB" then "PLATFORM_WEB" elseif p4 == "PLATFORM_APP" then "PLATFORM_APP" else nil
	end
}

return {
	ClientCapabilities = t.ClientCapabilities,
	Platform = t.Platform
}