local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local hydrationContentTypeModule = require(script.Parent.hydration_content_type)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 73 ]]
	-- upvalues: hydrationContentTypeModule (ref), t_1 (ref)
	return setmetatable({
		content_type = if p0 == nil or p0.content_type == nil then assert(hydrationContentTypeModule.HydrationContentType.fromNumber(0), "Enum has no 0 default") else p0.content_type,
		id_binding = if p0 == nil or p0.id_binding == nil then nil else p0.id_binding,
		alias = if p0 == nil or p0.alias == nil then "" else p0.alias,
		client_fetch = if p0 == nil or p0.client_fetch == nil then false else p0.client_fetch,
		required_fields = if p0 == nil or p0.required_fields == nil then {} else p0.required_fields,
		required = if p0 == nil or p0.required == nil then false else p0.required
	}, t_1)
end

function t_1:encode() --[[ line: 89 ]]
	-- upvalues: hydrationContentTypeModule (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var7 = 0
	
	if self.content_type ~= nil and (self.content_type ~= nil and self.content_type ~= 0 or self.content_type ~= hydrationContentTypeModule.HydrationContentType.fromNumber(0)) then
		local var8, var9 = protoModule.writeTag(buff, var7, 1, protoModule.wireTypes.varint)
		var8, var9 = protoModule.writeVarInt(var8, var9, hydrationContentTypeModule.HydrationContentType.toNumber(self.content_type))
		buff = var8
		var7 = var9
	end
	if self.id_binding ~= nil then
		local var10 = self.id_binding:encode()
		local var11, var12 = protoModule.writeTag(buff, var7, 2, protoModule.wireTypes.lengthDelimited)
		var11, var12 = protoModule.writeBuffer(var11, var12, var10, buffer.len(var10))
		buff = var11
		var7 = var12
	end
	if self.alias ~= nil and self.alias ~= "" then
		local var13, var14 = protoModule.writeTag(buff, var7, 3, protoModule.wireTypes.lengthDelimited)
		var13, var14 = protoModule.writeString(var13, var14, self.alias)
		buff = var13
		var7 = var14
	end
	if self.client_fetch then
		local var15, var16 = protoModule.writeTag(buff, var7, 4, protoModule.wireTypes.varint)
		var15, var16 = protoModule.writeVarInt(var15, var16, if self.client_fetch then 1 else 0)
		buff = var15
		var7 = var16
	end
	if self.required_fields ~= nil and #self.required_fields > 0 then
		for i, v in self.required_fields do
			local var17, var18 = protoModule.writeTag(buff, var7, 5, protoModule.wireTypes.lengthDelimited)
			var17, var18 = protoModule.writeString(var17, var18, v)
			buff = var17
			var7 = var18
		end
	end
	if self.required then
		local var19, var20 = protoModule.writeTag(buff, var7, 6, protoModule.wireTypes.varint)
		var19, var20 = protoModule.writeVarInt(var19, var20, if self.required then 1 else 0)
		buff = var19
		var7 = var20
	end
	local buff_1 = buffer.create(var7)
	buffer.copy(buff_1, 0, buff, 0, var7)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 144 ]]
	-- upvalues: t_1 (ref), protoModule (ref), hydrationContentTypeModule (ref), t (ref)
	local var22 = t_1.new()
	local var23 = 0
	while var23 < buffer.len(p1) do
		local _ = nil
		local var24 = nil
		local var25, var26, var27 = protoModule.readTag(p1, var23)
		local var28 = var25
		var24 = var26
		var23 = var27
		
		if var24 == protoModule.wireTypes.varint then
			if var28 == 1 then
				local _ = nil
				local var29, var30 = protoModule.readVarIntI32(p1, var23)
				local var31 = var29
				var23 = var30
				var22.content_type = hydrationContentTypeModule.HydrationContentType.fromNumber(var31) or var31
			elseif var28 == 4 then
				local _ = nil
				local var32, var33 = protoModule.readVarInt(p1, var23)
				var23 = var33
				var22.client_fetch = var32 ~= 0
			elseif var28 == 6 then
				local _ = nil
				local var34, var35 = protoModule.readVarInt(p1, var23)
				var23 = var35
				var22.required = var34 ~= 0
			else
				local _ = nil
				local var36, var37 = protoModule.readVarInt(p1, var23)
				local _ = var36
				var23 = var37
			end
		end
		if var24 == protoModule.wireTypes.lengthDelimited then
			if var28 == 2 then
				local _ = nil
				local var38, var39 = protoModule.readBuffer(p1, var23)
				var23 = var39
				var22.id_binding = t.IdBinding.decode(var38)
			elseif var28 == 3 then
				local _ = nil
				local var40, var41 = protoModule.readBuffer(p1, var23)
				var23 = var41
				var22.alias = buffer.tostring(var40)
			elseif var28 == 5 then
				local _ = nil
				local var42, var43 = protoModule.readBuffer(p1, var23)
				var23 = var43
				table.insert(var22.required_fields, buffer.tostring(var42))
			else
				local _ = nil
				local var44, var45 = protoModule.readVarInt(p1, var23)
				var23 = var45 + var44
			end
		elseif var24 == protoModule.wireTypes.i32 then
			local _ = nil
			local var46, var47 = protoModule.readFixed32(p1, var23)
			local _ = var46
			var23 = var47
		elseif var24 == protoModule.wireTypes.i64 then
			local _ = nil
			local var48, var49 = protoModule.readFixed64(p1, var23)
			local _ = var48
			var23 = var49
		else
			error("Unsupported wire type: " .. var24)
		end
	end
	return var22
end

function t_1:jsonEncode() --[[ line: 216 ]]
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
	return t
end

function t_1:jsonDecode() --[[ line: 261 ]]
	-- upvalues: t_1 (ref), hydrationContentTypeModule (ref), t (ref)
	local var52 = t_1.new()
	
	if self.content_type ~= nil then
		var52.content_type = if typeof(self.content_type) == "number" then hydrationContentTypeModule.HydrationContentType.fromNumber(self.content_type) or self.content_type else hydrationContentTypeModule.HydrationContentType.fromName(self.content_type) or self.content_type
	end
	if self.contentType ~= nil then
		var52.content_type = if typeof(self.contentType) == "number" then hydrationContentTypeModule.HydrationContentType.fromNumber(self.contentType) or self.contentType else hydrationContentTypeModule.HydrationContentType.fromName(self.contentType) or self.contentType
	end
	if self.id_binding ~= nil then
		var52.id_binding = t.IdBinding.jsonDecode(self.id_binding)
	end
	if self.idBinding ~= nil then
		var52.id_binding = t.IdBinding.jsonDecode(self.idBinding)
	end
	if self.alias ~= nil then
		var52.alias = self.alias
	end
	if self.client_fetch ~= nil then
		var52.client_fetch = self.client_fetch
	end
	if self.clientFetch ~= nil then
		var52.client_fetch = self.clientFetch
	end
	if self.required_fields ~= nil then
		local t_2 = {}
		
		for i, v in self.required_fields do
			table.insert(t_2, v)
		end
		var52.required_fields = t_2
	end
	if self.requiredFields ~= nil then
		local t_2 = {}
		
		for i, v in self.requiredFields do
			table.insert(t_2, v)
		end
		var52.required_fields = t_2
	end
	if self.required ~= nil then
		var52.required = self.required
	end
	return var52
end

t_1.descriptor = {
	name = "HydrationDataSpec",
	fullName = "roblox.apppageplatform.shared.v1beta1.HydrationDataSpec"
}
t.HydrationDataSpec = t_1
typeRegistryModule.default:register(t.HydrationDataSpec)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2) --[[ line: 343 ]]
	-- upvalues: t_2 (ref)
	return setmetatable({
		kind = if p2 == nil or p2.kind == nil then nil else p2.kind
	}, t_2)
end

function t_2:encode() --[[ line: 349 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var56 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var57, var58 = protoModule.writeTag(buff, var56, 1, protoModule.wireTypes.lengthDelimited)
			var57, var58 = protoModule.writeString(var57, var58, self.kind.value)
			buff = var57
			var56 = var58
		elseif self.kind.type == "input_path" then
			local var59, var60 = protoModule.writeTag(buff, var56, 2, protoModule.wireTypes.lengthDelimited)
			var59, var60 = protoModule.writeString(var59, var60, self.kind.value)
			buff = var59
			var56 = var60
		end
	end
	local buff_1 = buffer.create(var56)
	buffer.copy(buff_1, 0, buff, 0, var56)
	
	return buff_1
end

function t_2.decode(p3) --[[ line: 368 ]]
	-- upvalues: t_2 (ref), protoModule (ref)
	local var62 = t_2.new()
	local var63 = 0
	while var63 < buffer.len(p3) do
		local _ = nil
		local var64 = nil
		local var65, var66, var67 = protoModule.readTag(p3, var63)
		local var68 = var65
		var64 = var66
		var63 = var67
		
		if var64 == protoModule.wireTypes.varint then
			local _ = nil
			local var69, var70 = protoModule.readVarInt(p3, var63)
			local _ = var69
			var63 = var70
			continue
		end
		if var64 == protoModule.wireTypes.lengthDelimited then
			if var68 == 1 then
				local _ = nil
				local var71, var72 = protoModule.readBuffer(p3, var63)
				var63 = var72
				var62.kind = { type = "literal", value = buffer.tostring(var71) }
			elseif var68 == 2 then
				local _ = nil
				local var73, var74 = protoModule.readBuffer(p3, var63)
				var63 = var74
				var62.kind = { type = "input_path", value = buffer.tostring(var73) }
			else
				local _ = nil
				local var75, var76 = protoModule.readVarInt(p3, var63)
				var63 = var76 + var75
			end
		elseif var64 == protoModule.wireTypes.i32 then
			local _ = nil
			local var77, var78 = protoModule.readFixed32(p3, var63)
			local _ = var77
			var63 = var78
		elseif var64 == protoModule.wireTypes.i64 then
			local _ = nil
			local var79, var80 = protoModule.readFixed64(p3, var63)
			local _ = var79
			var63 = var80
		else
			error("Unsupported wire type: " .. var64)
		end
	end
	return var62
end

function t_2:jsonEncode() --[[ line: 416 ]]
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

function t_2:jsonDecode() --[[ line: 430 ]]
	-- upvalues: t_2 (ref)
	local var82 = t_2.new()
	
	if self.literal ~= nil then
		var82.kind = { type = "literal", value = self.literal }
	end
	if self.input_path ~= nil then
		var82.kind = { type = "input_path", value = self.input_path }
	end
	if self.inputPath ~= nil then
		var82.kind = { type = "input_path", value = self.inputPath }
	end
	return var82
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