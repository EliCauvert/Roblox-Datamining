local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local uiComponentSchemaModule = require(script.Parent.ui_component_schema)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0)
	-- upvalues: t_1 (ref)
	return setmetatable({
		template = if p0 == nil or p0.template == nil then nil else p0.template,
		roblox_component = if p0 == nil or p0.roblox_component == nil then "" else p0.roblox_component
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var6 = 0
	
	if self.template ~= nil then
		local var7 = self.template:encode()
		local var8, var9 = protoModule.writeTag(buff, var6, 1, protoModule.wireTypes.lengthDelimited)
		var8, var9 = protoModule.writeBuffer(var8, var9, var7, buffer.len(var7))
		buff = var8
		var6 = var9
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var10, var11 = protoModule.writeTag(buff, var6, 2, protoModule.wireTypes.lengthDelimited)
		var10, var11 = protoModule.writeString(var10, var11, self.roblox_component)
		buff = var10
		var6 = var11
	end
	local buff_1 = buffer.create(var6)
	buffer.copy(buff_1, 0, buff, 0, var6)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref), uiComponentSchemaModule (ref)
	local var13 = t_1.new()
	local var14 = 0
	while var14 < buffer.len(p1) do
		local _ = nil
		local var15 = nil
		local var16, var17, var18 = protoModule.readTag(p1, var14)
		local var19 = var16
		var15 = var17
		var14 = var18
		
		if var15 == protoModule.wireTypes.varint then
			local _ = nil
			local var20, var21 = protoModule.readVarInt(p1, var14)
			local _ = var20
			var14 = var21
			continue
		end
		if var15 == protoModule.wireTypes.lengthDelimited then
			if var19 == 1 then
				local _ = nil
				local var22, var23 = protoModule.readBuffer(p1, var14)
				var14 = var23
				var13.template = uiComponentSchemaModule.UiComponentSchema.decode(var22)
			elseif var19 == 2 then
				local _ = nil
				local var24, var25 = protoModule.readBuffer(p1, var14)
				var14 = var25
				var13.roblox_component = buffer.tostring(var24)
			else
				local _ = nil
				local var26, var27 = protoModule.readVarInt(p1, var14)
				var14 = var27 + var26
			end
		elseif var15 == protoModule.wireTypes.i32 then
			local _ = nil
			local var28, var29 = protoModule.readFixed32(p1, var14)
			local _ = var28
			var14 = var29
		elseif var15 == protoModule.wireTypes.i64 then
			local _ = nil
			local var30, var31 = protoModule.readFixed64(p1, var14)
			local _ = var30
			var14 = var31
		else
			error("Unsupported wire type: " .. var15)
		end
	end
	return var13
end

function t_1:jsonEncode()
	local t = {}
	
	if self.template ~= nil then
		t.template = self.template:jsonEncode()
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		t.robloxComponent = self.roblox_component
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref), uiComponentSchemaModule (ref)
	local var33 = t_1.new()
	
	if self.template ~= nil then
		var33.template = uiComponentSchemaModule.UiComponentSchema.jsonDecode(self.template)
	end
	if self.roblox_component ~= nil then
		var33.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var33.roblox_component = self.robloxComponent
	end
	return var33
end

t_1.descriptor = {
	name = "TemplateEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.TemplateEntry"
}
t.TemplateEntry = t_1
typeRegistryModule.default:register(t.TemplateEntry)

return { TemplateEntry = t.TemplateEntry }