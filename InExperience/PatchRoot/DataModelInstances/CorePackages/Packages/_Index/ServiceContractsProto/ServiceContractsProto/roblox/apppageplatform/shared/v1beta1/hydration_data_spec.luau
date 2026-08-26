local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local hydrationContentTypeModule = require(script.Parent.hydration_content_type)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: hydrationContentTypeModule (ref), t_1 (ref)
	return setmetatable({
		content_type = if p1 == nil or p1.content_type == nil then assert(hydrationContentTypeModule.HydrationContentType.fromNumber(0), "Enum has no 0 default") else p1.content_type,
		id_binding = if p1 == nil or p1.id_binding == nil then nil else p1.id_binding,
		alias = if p1 == nil or p1.alias == nil then "" else p1.alias,
		client_fetch = if p1 == nil or p1.client_fetch == nil then false else p1.client_fetch,
		required_fields = if p1 == nil or p1.required_fields == nil then {} else p1.required_fields,
		required = if p1 == nil or p1.required == nil then false else p1.required,
		client_hints = if p1 == nil or p1.client_hints == nil then {} else p1.client_hints
	}, t_1)
end

function t_1:encode()
	-- upvalues: hydrationContentTypeModule (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.content_type ~= nil and (self.content_type ~= nil and self.content_type ~= 0 or self.content_type ~= hydrationContentTypeModule.HydrationContentType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var9 = protoModule.writeVarInt(var2, var3, hydrationContentTypeModule.HydrationContentType.toNumber(self.content_type))
		buff = var2
		var1 = var3
	end
	if self.id_binding ~= nil then
		local var4 = self.id_binding:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var12 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	if self.alias ~= nil and self.alias ~= "" then
		local var7, var8 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var7, var14 = protoModule.writeString(var7, var8, self.alias)
		buff = var7
		var1 = var8
	end
	if self.client_fetch then
		local var9, var10 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.varint)
		var9, var16 = protoModule.writeVarInt(var9, var10, if self.client_fetch then 1 else 0)
		buff = var9
		var1 = var10
	end
	if self.required_fields ~= nil and #self.required_fields > 0 then
		for i, v in self.required_fields do
			local var11, var12 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
			var11, var18 = protoModule.writeString(var11, var12, v)
			buff = var11
			var1 = var12
		end
	end
	if self.required then
		local var13, var14 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.varint)
		var13, var20 = protoModule.writeVarInt(var13, var14, if self.required then 1 else 0)
		buff = var13
		var1 = var14
	end
	if self.client_hints ~= nil and #self.client_hints > 0 then
		for i, v in self.client_hints do
			local var15, var16 = protoModule.writeTag(buff, var1, 7, protoModule.wireTypes.lengthDelimited)
			var15, var22 = protoModule.writeString(var15, var16, v)
			buff = var15
			var1 = var16
		end
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref), hydrationContentTypeModule (ref), t (ref)
	local var17 = t_1.new()
	local var18 = 0
	while var18 < buffer.len(p1) do
		local _ = nil
		local var19 = nil
		local var20, var21, var22 = protoModule.readTag(p1, var18)
		local var23 = var20
		var19 = var21
		var18 = var22
		
		if var19 == protoModule.wireTypes.varint then
			if var23 == 1 then
				local _ = nil
				local var24, var25 = protoModule.readVarIntI32(p1, var18)
				local var26 = var24
				var18 = var25
				var17.content_type = hydrationContentTypeModule.HydrationContentType.fromNumber(var26) or var26
			elseif var23 == 4 then
				local _ = nil
				local var27, var28 = protoModule.readVarInt(p1, var18)
				var18 = var28
				var17.client_fetch = var27 ~= 0
			elseif var23 == 6 then
				local _ = nil
				local var29, var30 = protoModule.readVarInt(p1, var18)
				var18 = var30
				var17.required = var29 ~= 0
			else
				local _ = nil
				local var31, var32 = protoModule.readVarInt(p1, var18)
				local _ = var31
				var18 = var32
			end
		end
		if var19 == protoModule.wireTypes.lengthDelimited then
			if var23 == 2 then
				local _ = nil
				local var33, var34 = protoModule.readBuffer(p1, var18)
				var18 = var34
				var17.id_binding = t.IdBinding.decode(var33)
			elseif var23 == 3 then
				local _ = nil
				local var35, var36 = protoModule.readBuffer(p1, var18)
				var18 = var36
				var17.alias = buffer.tostring(var35)
			elseif var23 == 5 then
				local _ = nil
				local var37, var38 = protoModule.readBuffer(p1, var18)
				var18 = var38
				table.insert(var17.required_fields, buffer.tostring(var37))
			elseif var23 == 7 then
				local _ = nil
				local var39, var40 = protoModule.readBuffer(p1, var18)
				var18 = var40
				table.insert(var17.client_hints, buffer.tostring(var39))
			else
				local _ = nil
				local var41, var42 = protoModule.readVarInt(p1, var18)
				var18 = var42 + var41
			end
		elseif var19 == protoModule.wireTypes.i32 then
			local _ = nil
			local var43, var44 = protoModule.readFixed32(p1, var18)
			local _ = var43
			var18 = var44
		elseif var19 == protoModule.wireTypes.i64 then
			local _ = nil
			local var45, var46 = protoModule.readFixed64(p1, var18)
			local _ = var45
			var18 = var46
		else
			error("Unsupported wire type: " .. var26)
		end
	end
	return var17
end

function t_1:jsonEncode()
	-- upvalues: hydrationContentTypeModule (ref)
	local t = {}
	
	if self.content_type ~= nil and (self.content_type ~= nil and self.content_type ~= 0 or self.content_type ~= hydrationContentTypeModule.HydrationContentType.fromNumber(0)) then
		t.contentType = if typeof(self.content_type) == "number" then self.content_type else hydrationContentTypeModule.HydrationContentType.toNumber(self.content_type)
	end
	if self.id_binding ~= nil then
		t.idBinding = self.id_binding:jsonEncode()
	end
	if self.alias ~= nil and self.alias ~= "" then
		t.alias = self.alias
	end
	if self.client_fetch then
		t.clientFetch = self.client_fetch
	end
	if self.required_fields ~= nil and #self.required_fields > 0 then
		local t_1 = {}
		
		for i, v in self.required_fields do
			table.insert(t_1, v)
		end
		t.requiredFields = t_1
	end
	if self.required then
		t.required = self.required
	end
	if self.client_hints ~= nil and #self.client_hints > 0 then
		local t_1 = {}
		
		for i, v in self.client_hints do
			table.insert(t_1, v)
		end
		t.clientHints = t_1
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref), hydrationContentTypeModule (ref), t (ref)
	local var47 = t_1.new()
	
	if self.content_type ~= nil then
		var47.content_type = if typeof(self.content_type) == "number" then hydrationContentTypeModule.HydrationContentType.fromNumber(self.content_type) or self.content_type else hydrationContentTypeModule.HydrationContentType.fromName(self.content_type) or self.content_type
	end
	if self.contentType ~= nil then
		var47.content_type = if typeof(self.contentType) == "number" then hydrationContentTypeModule.HydrationContentType.fromNumber(self.contentType) or self.contentType else hydrationContentTypeModule.HydrationContentType.fromName(self.contentType) or self.contentType
	end
	if self.id_binding ~= nil then
		var47.id_binding = t.IdBinding.jsonDecode(self.id_binding)
	end
	if self.idBinding ~= nil then
		var47.id_binding = t.IdBinding.jsonDecode(self.idBinding)
	end
	if self.alias ~= nil then
		var47.alias = self.alias
	end
	if self.client_fetch ~= nil then
		var47.client_fetch = self.client_fetch
	end
	if self.clientFetch ~= nil then
		var47.client_fetch = self.clientFetch
	end
	if self.required_fields ~= nil then
		local t_2 = {}
		
		for i, v in self.required_fields do
			table.insert(t_2, v)
		end
		var47.required_fields = t_2
	end
	if self.requiredFields ~= nil then
		local t_2 = {}
		
		for i, v in self.requiredFields do
			table.insert(t_2, v)
		end
		var47.required_fields = t_2
	end
	if self.required ~= nil then
		var47.required = self.required
	end
	if self.client_hints ~= nil then
		local t_2 = {}
		
		for i, v in self.client_hints do
			table.insert(t_2, v)
		end
		var47.client_hints = t_2
	end
	if self.clientHints ~= nil then
		local t_2 = {}
		
		for i, v in self.clientHints do
			table.insert(t_2, v)
		end
		var47.client_hints = t_2
	end
	return var47
end

t_1.descriptor = {
	name = "HydrationDataSpec",
	fullName = "roblox.apppageplatform.shared.v1beta1.HydrationDataSpec"
}
t.HydrationDataSpec = t_1
typeRegistryModule.default:register(t.HydrationDataSpec)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2)
	-- upvalues: t_2 (ref)
	return setmetatable({
		kind = if p2 == nil or p2.kind == nil then nil else p2.kind
	}, t_2)
end

function t_2:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var48 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var49, var50 = protoModule.writeTag(buff, var48, 1, protoModule.wireTypes.lengthDelimited)
			var49, var65 = protoModule.writeString(var49, var50, self.kind.value)
			buff = var49
			var48 = var50
		elseif self.kind.type == "input_path" then
			local var51, var52 = protoModule.writeTag(buff, var48, 2, protoModule.wireTypes.lengthDelimited)
			var51, var67 = protoModule.writeString(var51, var52, self.kind.value)
			buff = var51
			var48 = var52
		end
	end
	local buff_1 = buffer.create(var48)
	buffer.copy(buff_1, 0, buff, 0, var48)
	
	return buff_1
end

function t_2.decode(p2)
	-- upvalues: t_2 (ref), protoModule (ref)
	local var48 = t_2.new()
	local var49 = 0
	while var49 < buffer.len(p2) do
		local _ = nil
		local var50 = nil
		local var51, var52, var53 = protoModule.readTag(p2, var49)
		local var54 = var51
		var50 = var52
		var49 = var53
		
		if var50 == protoModule.wireTypes.varint then
			local _ = nil
			local var55, var56 = protoModule.readVarInt(p2, var49)
			local _ = var55
			var49 = var56
			continue
		end
		if var50 == protoModule.wireTypes.lengthDelimited then
			if var54 == 1 then
				local _ = nil
				local var57, var58 = protoModule.readBuffer(p2, var49)
				var49 = var58
				var48.kind = { type = "literal", value = buffer.tostring(var57) }
			elseif var54 == 2 then
				local _ = nil
				local var59, var60 = protoModule.readBuffer(p2, var49)
				var49 = var60
				var48.kind = { type = "input_path", value = buffer.tostring(var59) }
			else
				local _ = nil
				local var61, var62 = protoModule.readVarInt(p2, var49)
				var49 = var62 + var61
			end
		elseif var50 == protoModule.wireTypes.i32 then
			local _ = nil
			local var63, var64 = protoModule.readFixed32(p2, var49)
			local _ = var63
			var49 = var64
		elseif var50 == protoModule.wireTypes.i64 then
			local _ = nil
			local var65, var66 = protoModule.readFixed64(p2, var49)
			local _ = var65
			var49 = var66
		else
			error("Unsupported wire type: " .. var71)
		end
	end
	return var48
end

function t_2:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		elseif self.kind.type == "input_path" then
			t.inputPath = self.kind.value
		end
	end
	return t
end

function t_2:jsonDecode()
	-- upvalues: t_2 (ref)
	local var67 = t_2.new()
	
	if self.literal ~= nil then
		var67.kind = { type = "literal", value = self.literal }
	end
	if self.input_path ~= nil then
		var67.kind = { type = "input_path", value = self.input_path }
	end
	if self.inputPath ~= nil then
		var67.kind = { type = "input_path", value = self.inputPath }
	end
	return var67
end

t_2.descriptor = {
	name = "IdBinding",
	fullName = "roblox.apppageplatform.shared.v1beta1.IdBinding"
}
t.IdBinding = t_2
typeRegistryModule.default:register(t.IdBinding)

return {
	HydrationDataSpec = t.HydrationDataSpec,
	IdBinding = t.IdBinding
}