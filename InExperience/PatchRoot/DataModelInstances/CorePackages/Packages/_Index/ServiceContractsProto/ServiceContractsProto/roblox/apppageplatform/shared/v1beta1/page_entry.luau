local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local surfacingModule = require(script.Parent.surfacing)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 49 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({
		roblox_component = if p0 == nil or p0.roblox_component == nil then "" else p0.roblox_component,
		identifier = if p0 == nil or p0.identifier == nil then "" else p0.identifier,
		title = if p0 == nil or p0.title == nil then "" else p0.title,
		category = if p0 == nil or p0.category == nil then "" else p0.category,
		surfacing = if p0 == nil or p0.surfacing == nil then nil else p0.surfacing
	}, t_1)
end

function t_1:encode() --[[ line: 59 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var6 = 0
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var7, var8 = protoModule.writeTag(buff, var6, 1, protoModule.wireTypes.lengthDelimited)
		var7, var8 = protoModule.writeString(var7, var8, self.roblox_component)
		buff = var7
		var6 = var8
	end
	if self.identifier ~= nil and self.identifier ~= "" then
		local var9, var10 = protoModule.writeTag(buff, var6, 2, protoModule.wireTypes.lengthDelimited)
		var9, var10 = protoModule.writeString(var9, var10, self.identifier)
		buff = var9
		var6 = var10
	end
	if self.title ~= nil and self.title ~= "" then
		local var11, var12 = protoModule.writeTag(buff, var6, 3, protoModule.wireTypes.lengthDelimited)
		var11, var12 = protoModule.writeString(var11, var12, self.title)
		buff = var11
		var6 = var12
	end
	if self.category ~= nil and self.category ~= "" then
		local var13, var14 = protoModule.writeTag(buff, var6, 4, protoModule.wireTypes.lengthDelimited)
		var13, var14 = protoModule.writeString(var13, var14, self.category)
		buff = var13
		var6 = var14
	end
	if self.surfacing ~= nil then
		local var15 = self.surfacing:encode()
		local var16, var17 = protoModule.writeTag(buff, var6, 5, protoModule.wireTypes.lengthDelimited)
		var16, var17 = protoModule.writeBuffer(var16, var17, var15, buffer.len(var15))
		buff = var16
		var6 = var17
	end
	local buff_1 = buffer.create(var6)
	buffer.copy(buff_1, 0, buff, 0, var6)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 94 ]]
	-- upvalues: t_1 (ref), protoModule (ref), surfacingModule (ref)
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
			local _ = nil
			local var26, var27 = protoModule.readVarInt(p1, var20)
			local _ = var26
			var20 = var27
			continue
		end
		if var21 == protoModule.wireTypes.lengthDelimited then
			if var25 == 1 then
				local _ = nil
				local var28, var29 = protoModule.readBuffer(p1, var20)
				var20 = var29
				var19.roblox_component = buffer.tostring(var28)
			elseif var25 == 2 then
				local _ = nil
				local var30, var31 = protoModule.readBuffer(p1, var20)
				var20 = var31
				var19.identifier = buffer.tostring(var30)
			elseif var25 == 3 then
				local _ = nil
				local var32, var33 = protoModule.readBuffer(p1, var20)
				var20 = var33
				var19.title = buffer.tostring(var32)
			elseif var25 == 4 then
				local _ = nil
				local var34, var35 = protoModule.readBuffer(p1, var20)
				var20 = var35
				var19.category = buffer.tostring(var34)
			elseif var25 == 5 then
				local _ = nil
				local var36, var37 = protoModule.readBuffer(p1, var20)
				var20 = var37
				var19.surfacing = surfacingModule.Surfacing.decode(var36)
			else
				local _ = nil
				local var38, var39 = protoModule.readVarInt(p1, var20)
				var20 = var39 + var38
			end
		elseif var21 == protoModule.wireTypes.i32 then
			local _ = nil
			local var40, var41 = protoModule.readFixed32(p1, var20)
			local _ = var40
			var20 = var41
		elseif var21 == protoModule.wireTypes.i64 then
			local _ = nil
			local var42, var43 = protoModule.readFixed64(p1, var20)
			local _ = var42
			var20 = var43
		else
			error("Unsupported wire type: " .. var21)
		end
	end
	return var19
end

function t_1:jsonEncode() --[[ line: 157 ]]
	local t = {}
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		t.robloxComponent = self.roblox_component
	end
	if self.identifier ~= nil and self.identifier ~= "" then
		t.identifier = self.identifier
	end
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.category ~= nil and self.category ~= "" then
		t.category = self.category
	end
	if self.surfacing ~= nil then
		t.surfacing = self.surfacing:jsonEncode()
	end
	return t
end

function t_1:jsonDecode() --[[ line: 183 ]]
	-- upvalues: t_1 (ref), surfacingModule (ref)
	local var45 = t_1.new()
	
	if self.roblox_component ~= nil then
		var45.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var45.roblox_component = self.robloxComponent
	end
	if self.identifier ~= nil then
		var45.identifier = self.identifier
	end
	if self.title ~= nil then
		var45.title = self.title
	end
	if self.category ~= nil then
		var45.category = self.category
	end
	if self.surfacing ~= nil then
		var45.surfacing = surfacingModule.Surfacing.jsonDecode(self.surfacing)
	end
	return var45
end

t_1.descriptor = {
	name = "PageEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.PageEntry"
}
t.PageEntry = t_1
typeRegistryModule.default:register(t.PageEntry)

return { PageEntry = t.PageEntry }