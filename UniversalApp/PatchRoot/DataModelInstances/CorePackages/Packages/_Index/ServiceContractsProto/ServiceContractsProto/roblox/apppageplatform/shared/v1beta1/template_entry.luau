local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local uiComponentSchemaModule = require(script.Parent.ui_component_schema)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
		template = if p1 == nil or p1.template == nil then nil else p1.template,
		roblox_component = if p1 == nil or p1.roblox_component == nil then "" else p1.roblox_component
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.template ~= nil then
		local var2 = self.template:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var9 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var11 = protoModule.writeString(var5, var6, self.roblox_component)
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref), uiComponentSchemaModule (ref)
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
				var1.template = uiComponentSchemaModule.UiComponentSchema.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.roblox_component = buffer.tostring(var12)
			else
				local _ = nil
				local var14, var15 = protoModule.readVarInt(p1, var2)
				var2 = var15 + var14
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var16, var17 = protoModule.readFixed32(p1, var2)
			local _ = var16
			var2 = var17
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var18, var19 = protoModule.readFixed64(p1, var2)
			local _ = var18
			var2 = var19
		else
			error("Unsupported wire type: " .. var15)
		end
	end
	return var1
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
	local var20 = t_1.new()
	
	if self.template ~= nil then
		var20.template = uiComponentSchemaModule.UiComponentSchema.jsonDecode(self.template)
	end
	if self.roblox_component ~= nil then
		var20.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var20.roblox_component = self.robloxComponent
	end
	return var20
end

t_1.descriptor = {
	name = "TemplateEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.TemplateEntry"
}
t.TemplateEntry = t_1
typeRegistryModule.default:register(t.TemplateEntry)

return { TemplateEntry = t.TemplateEntry }