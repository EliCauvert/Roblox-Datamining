local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local clientCapabilitiesModule = require(script.Parent.Parent.Parent.shared.v1beta1.client_capabilities)
local hydrationContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.hydration_content)
local pageEntryContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.page_entry_content)
local templateEntryModule = require(script.Parent.Parent.Parent.shared.v1beta1.template_entry)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
		parameters = if p1 == nil or p1.parameters == nil then {} else p1.parameters,
		translations = if p1 == nil or p1.translations == nil then {} else p1.translations
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.parameters ~= nil and next(self.parameters) ~= nil then
		for i, v in self.parameters do
			local var2, var3 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2, var19 = protoModule.writeString(var2, var3, i)
			var2, var19 = protoModule.writeTag(var2, var3, 2, protoModule.wireTypes.lengthDelimited)
			var2, var19 = protoModule.writeString(var2, var3, v)
			local var4 = var2
			local var5 = var3
			local var6, var7 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
			var6, var23 = protoModule.writeBuffer(var6, var7, var4, var5)
			buff = var6
			var1 = var7
		end
	end
	if self.translations ~= nil and next(self.translations) ~= nil then
		for i, v in self.translations do
			local var8, var9 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var8, var25 = protoModule.writeString(var8, var9, i)
			var8, var25 = protoModule.writeTag(var8, var9, 2, protoModule.wireTypes.lengthDelimited)
			var8, var25 = protoModule.writeString(var8, var9, v)
			local var10 = var8
			local var11 = var9
			local var12, var13 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
			var12, var29 = protoModule.writeBuffer(var12, var13, var10, var11)
			buff = var12
			var1 = var13
		end
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref), t (ref)
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
			local _ = nil
			local var21, var22 = protoModule.readVarInt(p1, var15)
			local _ = var21
			var15 = var22
			continue
		end
		if var16 == protoModule.wireTypes.lengthDelimited then
			if var20 == 1 then
				local _ = nil
				local var23, var24 = protoModule.readBuffer(p1, var15)
				var15 = var24
				var23 = t.CustomPrompt_ParametersEntry.decode(var23)
				var14.parameters[var23.key or ""] = var23.value or ""
			elseif var20 == 2 then
				local _ = nil
				local var25, var26 = protoModule.readBuffer(p1, var15)
				var15 = var26
				var25 = t.CustomPrompt_TranslationsEntry.decode(var25)
				var14.translations[var25.key or ""] = var25.value or ""
			else
				local _ = nil
				local var27, var28 = protoModule.readVarInt(p1, var15)
				var15 = var28 + var27
			end
		elseif var16 == protoModule.wireTypes.i32 then
			local _ = nil
			local var29, var30 = protoModule.readFixed32(p1, var15)
			local _ = var29
			var15 = var30
		elseif var16 == protoModule.wireTypes.i64 then
			local _ = nil
			local var31, var32 = protoModule.readFixed64(p1, var15)
			local _ = var31
			var15 = var32
		else
			error("Unsupported wire type: " .. var33)
		end
	end
	return var14
end

function t_1:jsonEncode()
	local t = {}
	
	if self.parameters ~= nil and next(self.parameters) ~= nil then
		local t_1 = {}
		
		for i, v in self.parameters do
			t_1[i] = v
		end
		t.parameters = t_1
	end
	if self.translations ~= nil and next(self.translations) ~= nil then
		local t_1 = {}
		
		for i, v in self.translations do
			t_1[i] = v
		end
		t.translations = t_1
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref)
	local var33 = t_1.new()
	
	if self.parameters ~= nil then
		local t = {}
		
		for i, v in self.parameters do
			t[i] = v
		end
		var33.parameters = t
	end
	if self.translations ~= nil then
		local t = {}
		
		for i, v in self.translations do
			t[i] = v
		end
		var33.translations = t
	end
	return var33
end

t_1.descriptor = {
	name = "CustomPrompt",
	fullName = "roblox.apppageplatform.prompts.v1beta1.CustomPrompt"
}
t.CustomPrompt = t_1
typeRegistryModule.default:register(t.CustomPrompt)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2)
	-- upvalues: t_2 (ref)
	return setmetatable({
		key = if p2 == nil or p2.key == nil then "" else p2.key,
		value = if p2 == nil or p2.value == nil then "" else p2.value
	}, t_2)
end

function t_2:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var34 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var35, var36 = protoModule.writeTag(buff, var34, 1, protoModule.wireTypes.lengthDelimited)
		var35, var59 = protoModule.writeString(var35, var36, self.key)
		buff = var35
		var34 = var36
	end
	if self.value ~= nil and self.value ~= "" then
		local var37, var38 = protoModule.writeTag(buff, var34, 2, protoModule.wireTypes.lengthDelimited)
		var37, var61 = protoModule.writeString(var37, var38, self.value)
		buff = var37
		var34 = var38
	end
	local buff_1 = buffer.create(var34)
	buffer.copy(buff_1, 0, buff, 0, var34)
	
	return buff_1
end

function t_2.decode(p2)
	-- upvalues: t_2 (ref), protoModule (ref)
	local var34 = t_2.new()
	local var35 = 0
	while var35 < buffer.len(p2) do
		local _ = nil
		local var36 = nil
		local var37, var38, var39 = protoModule.readTag(p2, var35)
		local var40 = var37
		var36 = var38
		var35 = var39
		
		if var36 == protoModule.wireTypes.varint then
			local _ = nil
			local var41, var42 = protoModule.readVarInt(p2, var35)
			local _ = var41
			var35 = var42
			continue
		end
		if var36 == protoModule.wireTypes.lengthDelimited then
			if var40 == 1 then
				local _ = nil
				local var43, var44 = protoModule.readBuffer(p2, var35)
				var35 = var44
				var34.key = buffer.tostring(var43)
			elseif var40 == 2 then
				local _ = nil
				local var45, var46 = protoModule.readBuffer(p2, var35)
				var35 = var46
				var34.value = buffer.tostring(var45)
			else
				local _ = nil
				local var47, var48 = protoModule.readVarInt(p2, var35)
				var35 = var48 + var47
			end
		elseif var36 == protoModule.wireTypes.i32 then
			local _ = nil
			local var49, var50 = protoModule.readFixed32(p2, var35)
			local _ = var49
			var35 = var50
		elseif var36 == protoModule.wireTypes.i64 then
			local _ = nil
			local var51, var52 = protoModule.readFixed64(p2, var35)
			local _ = var51
			var35 = var52
		else
			error("Unsupported wire type: " .. var65)
		end
	end
	return var34
end

function t_2:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function t_2:jsonDecode()
	-- upvalues: t_2 (ref)
	local var53 = t_2.new()
	
	if self.key ~= nil then
		var53.key = self.key
	end
	if self.value ~= nil then
		var53.value = self.value
	end
	return var53
end

t_2.descriptor = {
	name = "CustomPrompt_ParametersEntry",
	fullName = "roblox.apppageplatform.prompts.v1beta1.ParametersEntry"
}
t.CustomPrompt_ParametersEntry = t_2
typeRegistryModule.default:register(t.CustomPrompt_ParametersEntry)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p3)
	-- upvalues: t_3 (ref)
	return setmetatable({
		key = if p3 == nil or p3.key == nil then "" else p3.key,
		value = if p3 == nil or p3.value == nil then "" else p3.value
	}, t_3)
end

function t_3:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var53 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var54, var55 = protoModule.writeTag(buff, var53, 1, protoModule.wireTypes.lengthDelimited)
		var54, var87 = protoModule.writeString(var54, var55, self.key)
		buff = var54
		var53 = var55
	end
	if self.value ~= nil and self.value ~= "" then
		local var56, var57 = protoModule.writeTag(buff, var53, 2, protoModule.wireTypes.lengthDelimited)
		var56, var89 = protoModule.writeString(var56, var57, self.value)
		buff = var56
		var53 = var57
	end
	local buff_1 = buffer.create(var53)
	buffer.copy(buff_1, 0, buff, 0, var53)
	
	return buff_1
end

function t_3.decode(p3)
	-- upvalues: t_3 (ref), protoModule (ref)
	local var53 = t_3.new()
	local var54 = 0
	while var54 < buffer.len(p3) do
		local _ = nil
		local var55 = nil
		local var56, var57, var58 = protoModule.readTag(p3, var54)
		local var59 = var56
		var55 = var57
		var54 = var58
		
		if var55 == protoModule.wireTypes.varint then
			local _ = nil
			local var60, var61 = protoModule.readVarInt(p3, var54)
			local _ = var60
			var54 = var61
			continue
		end
		if var55 == protoModule.wireTypes.lengthDelimited then
			if var59 == 1 then
				local _ = nil
				local var62, var63 = protoModule.readBuffer(p3, var54)
				var54 = var63
				var53.key = buffer.tostring(var62)
			elseif var59 == 2 then
				local _ = nil
				local var64, var65 = protoModule.readBuffer(p3, var54)
				var54 = var65
				var53.value = buffer.tostring(var64)
			else
				local _ = nil
				local var66, var67 = protoModule.readVarInt(p3, var54)
				var54 = var67 + var66
			end
		elseif var55 == protoModule.wireTypes.i32 then
			local _ = nil
			local var68, var69 = protoModule.readFixed32(p3, var54)
			local _ = var68
			var54 = var69
		elseif var55 == protoModule.wireTypes.i64 then
			local _ = nil
			local var70, var71 = protoModule.readFixed64(p3, var54)
			local _ = var70
			var54 = var71
		else
			error("Unsupported wire type: " .. var93)
		end
	end
	return var53
end

function t_3:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function t_3:jsonDecode()
	-- upvalues: t_3 (ref)
	local var72 = t_3.new()
	
	if self.key ~= nil then
		var72.key = self.key
	end
	if self.value ~= nil then
		var72.value = self.value
	end
	return var72
end

t_3.descriptor = {
	name = "CustomPrompt_TranslationsEntry",
	fullName = "roblox.apppageplatform.prompts.v1beta1.TranslationsEntry"
}
t.CustomPrompt_TranslationsEntry = t_3
typeRegistryModule.default:register(t.CustomPrompt_TranslationsEntry)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p4)
	-- upvalues: t_4 (ref)
	return setmetatable({
		entry_points = if p4 == nil or p4.entry_points == nil then {} else p4.entry_points,
		deeplink_detected = if p4 == nil or p4.deeplink_detected == nil then false else p4.deeplink_detected,
		prompt_styles = if p4 == nil or p4.prompt_styles == nil then {} else p4.prompt_styles,
		client_attributes = if p4 == nil or p4.client_attributes == nil then {} else p4.client_attributes,
		client_capabilities = if p4 == nil or p4.client_capabilities == nil then nil else p4.client_capabilities
	}, t_4)
end

function t_4:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var72 = 0
	
	if self.entry_points ~= nil and #self.entry_points > 0 then
		for i, v in self.entry_points do
			local var73, var74 = protoModule.writeTag(buff, var72, 1, protoModule.wireTypes.lengthDelimited)
			var73, var115 = protoModule.writeString(var73, var74, v)
			buff = var73
			var72 = var74
		end
	end
	if self.deeplink_detected then
		local var75, var76 = protoModule.writeTag(buff, var72, 2, protoModule.wireTypes.varint)
		var75, var117 = protoModule.writeVarInt(var75, var76, if self.deeplink_detected then 1 else 0)
		buff = var75
		var72 = var76
	end
	if self.prompt_styles ~= nil and #self.prompt_styles > 0 then
		for i, v in self.prompt_styles do
			local var77, var78 = protoModule.writeTag(buff, var72, 3, protoModule.wireTypes.lengthDelimited)
			var77, var119 = protoModule.writeString(var77, var78, v)
			buff = var77
			var72 = var78
		end
	end
	if self.client_attributes ~= nil and next(self.client_attributes) ~= nil then
		for i, v in self.client_attributes do
			local var79, var80 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var79, var121 = protoModule.writeString(var79, var80, i)
			var79, var121 = protoModule.writeTag(var79, var80, 2, protoModule.wireTypes.lengthDelimited)
			var79, var121 = protoModule.writeString(var79, var80, v)
			local var81 = var79
			local var82 = var80
			local var83, var84 = protoModule.writeTag(buff, var72, 4, protoModule.wireTypes.lengthDelimited)
			var83, var125 = protoModule.writeBuffer(var83, var84, var81, var82)
			buff = var83
			var72 = var84
		end
	end
	if self.client_capabilities ~= nil then
		local var85 = self.client_capabilities:encode()
		local var86, var87 = protoModule.writeTag(buff, var72, 5, protoModule.wireTypes.lengthDelimited)
		var86, var128 = protoModule.writeBuffer(var86, var87, var85, buffer.len(var85))
		buff = var86
		var72 = var87
	end
	local buff_1 = buffer.create(var72)
	buffer.copy(buff_1, 0, buff, 0, var72)
	
	return buff_1
end

function t_4.decode(p4)
	-- upvalues: t_4 (ref), protoModule (ref), t (ref), clientCapabilitiesModule (ref)
	local var88 = t_4.new()
	local var89 = 0
	while var89 < buffer.len(p4) do
		local _ = nil
		local var90 = nil
		local var91, var92, var93 = protoModule.readTag(p4, var89)
		local var94 = var91
		var90 = var92
		var89 = var93
		
		if var90 == protoModule.wireTypes.varint then
			if var94 == 2 then
				local _ = nil
				local var95, var96 = protoModule.readVarInt(p4, var89)
				var89 = var96
				var88.deeplink_detected = var95 ~= 0
			else
				local _ = nil
				local var97, var98 = protoModule.readVarInt(p4, var89)
				local _ = var97
				var89 = var98
			end
		end
		if var90 == protoModule.wireTypes.lengthDelimited then
			if var94 == 1 then
				local _ = nil
				local var99, var100 = protoModule.readBuffer(p4, var89)
				var89 = var100
				table.insert(var88.entry_points, buffer.tostring(var99))
			elseif var94 == 3 then
				local _ = nil
				local var101, var102 = protoModule.readBuffer(p4, var89)
				var89 = var102
				table.insert(var88.prompt_styles, buffer.tostring(var101))
			elseif var94 == 4 then
				local _ = nil
				local var103, var104 = protoModule.readBuffer(p4, var89)
				var89 = var104
				var103 = t.GetEligiblePromptsRequest_ClientAttributesEntry.decode(var103)
				var88.client_attributes[var103.key or ""] = var103.value or ""
			elseif var94 == 5 then
				local _ = nil
				local var105, var106 = protoModule.readBuffer(p4, var89)
				var89 = var106
				var88.client_capabilities = clientCapabilitiesModule.ClientCapabilities.decode(var105)
			else
				local _ = nil
				local var107, var108 = protoModule.readVarInt(p4, var89)
				var89 = var108 + var107
			end
		elseif var90 == protoModule.wireTypes.i32 then
			local _ = nil
			local var109, var110 = protoModule.readFixed32(p4, var89)
			local _ = var109
			var89 = var110
		elseif var90 == protoModule.wireTypes.i64 then
			local _ = nil
			local var111, var112 = protoModule.readFixed64(p4, var89)
			local _ = var111
			var89 = var112
		else
			error("Unsupported wire type: " .. var132)
		end
	end
	return var88
end

function t_4:jsonEncode()
	local t = {}
	
	if self.entry_points ~= nil and #self.entry_points > 0 then
		local t_1 = {}
		
		for i, v in self.entry_points do
			table.insert(t_1, v)
		end
		t.entryPoints = t_1
	end
	if self.deeplink_detected then
		t.deeplinkDetected = self.deeplink_detected
	end
	if self.prompt_styles ~= nil and #self.prompt_styles > 0 then
		local t_1 = {}
		
		for i, v in self.prompt_styles do
			table.insert(t_1, v)
		end
		t.promptStyles = t_1
	end
	if self.client_attributes ~= nil and next(self.client_attributes) ~= nil then
		local t_1 = {}
		
		for i, v in self.client_attributes do
			t_1[i] = v
		end
		t.clientAttributes = t_1
	end
	if self.client_capabilities ~= nil then
		t.clientCapabilities = self.client_capabilities:jsonEncode()
	end
	return t
end

function t_4:jsonDecode()
	-- upvalues: t_4 (ref), clientCapabilitiesModule (ref)
	local var113 = t_4.new()
	
	if self.entry_points ~= nil then
		local t = {}
		
		for i, v in self.entry_points do
			table.insert(t, v)
		end
		var113.entry_points = t
	end
	if self.entryPoints ~= nil then
		local t = {}
		
		for i, v in self.entryPoints do
			table.insert(t, v)
		end
		var113.entry_points = t
	end
	if self.deeplink_detected ~= nil then
		var113.deeplink_detected = self.deeplink_detected
	end
	if self.deeplinkDetected ~= nil then
		var113.deeplink_detected = self.deeplinkDetected
	end
	if self.prompt_styles ~= nil then
		local t = {}
		
		for i, v in self.prompt_styles do
			table.insert(t, v)
		end
		var113.prompt_styles = t
	end
	if self.promptStyles ~= nil then
		local t = {}
		
		for i, v in self.promptStyles do
			table.insert(t, v)
		end
		var113.prompt_styles = t
	end
	if self.client_attributes ~= nil then
		local t = {}
		
		for i, v in self.client_attributes do
			t[i] = v
		end
		var113.client_attributes = t
	end
	if self.clientAttributes ~= nil then
		local t = {}
		
		for i, v in self.clientAttributes do
			t[i] = v
		end
		var113.client_attributes = t
	end
	if self.client_capabilities ~= nil then
		var113.client_capabilities = clientCapabilitiesModule.ClientCapabilities.jsonDecode(self.client_capabilities)
	end
	if self.clientCapabilities ~= nil then
		var113.client_capabilities = clientCapabilitiesModule.ClientCapabilities.jsonDecode(self.clientCapabilities)
	end
	return var113
end

t_4.descriptor = {
	name = "GetEligiblePromptsRequest",
	fullName = "roblox.apppageplatform.prompts.v1beta1.GetEligiblePromptsRequest"
}
t.GetEligiblePromptsRequest = t_4
typeRegistryModule.default:register(t.GetEligiblePromptsRequest)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p5)
	-- upvalues: t_5 (ref)
	return setmetatable({
		key = if p5 == nil or p5.key == nil then "" else p5.key,
		value = if p5 == nil or p5.value == nil then "" else p5.value
	}, t_5)
end

function t_5:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var114 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var115, var116 = protoModule.writeTag(buff, var114, 1, protoModule.wireTypes.lengthDelimited)
		var115, var169 = protoModule.writeString(var115, var116, self.key)
		buff = var115
		var114 = var116
	end
	if self.value ~= nil and self.value ~= "" then
		local var117, var118 = protoModule.writeTag(buff, var114, 2, protoModule.wireTypes.lengthDelimited)
		var117, var171 = protoModule.writeString(var117, var118, self.value)
		buff = var117
		var114 = var118
	end
	local buff_1 = buffer.create(var114)
	buffer.copy(buff_1, 0, buff, 0, var114)
	
	return buff_1
end

function t_5.decode(p5)
	-- upvalues: t_5 (ref), protoModule (ref)
	local var114 = t_5.new()
	local var115 = 0
	while var115 < buffer.len(p5) do
		local _ = nil
		local var116 = nil
		local var117, var118, var119 = protoModule.readTag(p5, var115)
		local var120 = var117
		var116 = var118
		var115 = var119
		
		if var116 == protoModule.wireTypes.varint then
			local _ = nil
			local var121, var122 = protoModule.readVarInt(p5, var115)
			local _ = var121
			var115 = var122
			continue
		end
		if var116 == protoModule.wireTypes.lengthDelimited then
			if var120 == 1 then
				local _ = nil
				local var123, var124 = protoModule.readBuffer(p5, var115)
				var115 = var124
				var114.key = buffer.tostring(var123)
			elseif var120 == 2 then
				local _ = nil
				local var125, var126 = protoModule.readBuffer(p5, var115)
				var115 = var126
				var114.value = buffer.tostring(var125)
			else
				local _ = nil
				local var127, var128 = protoModule.readVarInt(p5, var115)
				var115 = var128 + var127
			end
		elseif var116 == protoModule.wireTypes.i32 then
			local _ = nil
			local var129, var130 = protoModule.readFixed32(p5, var115)
			local _ = var129
			var115 = var130
		elseif var116 == protoModule.wireTypes.i64 then
			local _ = nil
			local var131, var132 = protoModule.readFixed64(p5, var115)
			local _ = var131
			var115 = var132
		else
			error("Unsupported wire type: " .. var175)
		end
	end
	return var114
end

function t_5:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function t_5:jsonDecode()
	-- upvalues: t_5 (ref)
	local var133 = t_5.new()
	
	if self.key ~= nil then
		var133.key = self.key
	end
	if self.value ~= nil then
		var133.value = self.value
	end
	return var133
end

t_5.descriptor = {
	name = "GetEligiblePromptsRequest_ClientAttributesEntry",
	fullName = "roblox.apppageplatform.prompts.v1beta1.ClientAttributesEntry"
}
t.GetEligiblePromptsRequest_ClientAttributesEntry = t_5
typeRegistryModule.default:register(t.GetEligiblePromptsRequest_ClientAttributesEntry)
local t_6 = {}
t_6.__index = t_6

function t_6.new(p6)
	-- upvalues: t_6 (ref)
	return setmetatable({
		page_entries = if p6 == nil or p6.page_entries == nil then {} else p6.page_entries,
		hydration_data = if p6 == nil or p6.hydration_data == nil then nil else p6.hydration_data,
		templates = if p6 == nil or p6.templates == nil then {} else p6.templates,
		custom_prompts = if p6 == nil or p6.custom_prompts == nil then {} else p6.custom_prompts,
		localized_literals = if p6 == nil or p6.localized_literals == nil then {} else p6.localized_literals
	}, t_6)
end

function t_6:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var133 = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for i, v in self.page_entries do
			local var134 = v:encode()
			local var135, var136 = protoModule.writeTag(buff, var133, 1, protoModule.wireTypes.lengthDelimited)
			var135, var198 = protoModule.writeBuffer(var135, var136, var134, buffer.len(var134))
			buff = var135
			var133 = var136
		end
	end
	if self.hydration_data ~= nil then
		local var137 = self.hydration_data:encode()
		local var138, var139 = protoModule.writeTag(buff, var133, 2, protoModule.wireTypes.lengthDelimited)
		var138, var201 = protoModule.writeBuffer(var138, var139, var137, buffer.len(var137))
		buff = var138
		var133 = var139
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, v in self.templates do
			local var140, var141 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var140, var203 = protoModule.writeString(var140, var141, i)
			local var142 = v:encode()
			var141, var205 = protoModule.writeTag(var140, var141, 2, protoModule.wireTypes.lengthDelimited)
			var141, var205 = protoModule.writeBuffer(var141, var205, var142, buffer.len(var142))
			local var143 = var141
			local var144 = var205
			local var145, var146 = protoModule.writeTag(buff, var133, 3, protoModule.wireTypes.lengthDelimited)
			var145, var209 = protoModule.writeBuffer(var145, var146, var143, var144)
			buff = var145
			var133 = var146
		end
	end
	if self.custom_prompts ~= nil and next(self.custom_prompts) ~= nil then
		for i, v in self.custom_prompts do
			local var147, var148 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var147, var211 = protoModule.writeString(var147, var148, i)
			local var149 = v:encode()
			var148, var213 = protoModule.writeTag(var147, var148, 2, protoModule.wireTypes.lengthDelimited)
			var148, var213 = protoModule.writeBuffer(var148, var213, var149, buffer.len(var149))
			local var150 = var148
			local var151 = var213
			local var152, var153 = protoModule.writeTag(buff, var133, 4, protoModule.wireTypes.lengthDelimited)
			var152, var217 = protoModule.writeBuffer(var152, var153, var150, var151)
			buff = var152
			var133 = var153
		end
	end
	if self.localized_literals ~= nil and next(self.localized_literals) ~= nil then
		for i, v in self.localized_literals do
			local var154, var155 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var154, var219 = protoModule.writeString(var154, var155, i)
			var154, var219 = protoModule.writeTag(var154, var155, 2, protoModule.wireTypes.lengthDelimited)
			var154, var219 = protoModule.writeString(var154, var155, v)
			local var156 = var154
			local var157 = var155
			local var158, var159 = protoModule.writeTag(buff, var133, 5, protoModule.wireTypes.lengthDelimited)
			var158, var223 = protoModule.writeBuffer(var158, var159, var156, var157)
			buff = var158
			var133 = var159
		end
	end
	local buff_1 = buffer.create(var133)
	buffer.copy(buff_1, 0, buff, 0, var133)
	
	return buff_1
end

function t_6.decode(p6)
	-- upvalues: t_6 (ref), protoModule (ref), pageEntryContentModule (ref), hydrationContentModule (ref), t (ref), templateEntryModule (ref)
	local var160 = t_6.new()
	local var161 = 0
	while var161 < buffer.len(p6) do
		local _ = nil
		local var162 = nil
		local var163, var164, var165 = protoModule.readTag(p6, var161)
		local var166 = var163
		var162 = var164
		var161 = var165
		
		if var162 == protoModule.wireTypes.varint then
			local _ = nil
			local var167, var168 = protoModule.readVarInt(p6, var161)
			local _ = var167
			var161 = var168
			continue
		end
		if var162 == protoModule.wireTypes.lengthDelimited then
			if var166 == 1 then
				local _ = nil
				local var169, var170 = protoModule.readBuffer(p6, var161)
				var161 = var170
				table.insert(var160.page_entries, pageEntryContentModule.UniversalPageEntry.decode(var169))
			elseif var166 == 2 then
				local _ = nil
				local var171, var172 = protoModule.readBuffer(p6, var161)
				var161 = var172
				var160.hydration_data = hydrationContentModule.HydrationContent.decode(var171)
			elseif var166 == 3 then
				local _ = nil
				local var173, var174 = protoModule.readBuffer(p6, var161)
				var161 = var174
				var173 = t.GetEligiblePromptsResponse_TemplatesEntry.decode(var173)
				var160.templates[var173.key or ""] = var173.value or templateEntryModule.TemplateEntry.new()
			elseif var166 == 4 then
				local _ = nil
				local var175, var176 = protoModule.readBuffer(p6, var161)
				var161 = var176
				var175 = t.GetEligiblePromptsResponse_CustomPromptsEntry.decode(var175)
				var160.custom_prompts[var175.key or ""] = var175.value or t.CustomPrompt.new()
			elseif var166 == 5 then
				local _ = nil
				local var177, var178 = protoModule.readBuffer(p6, var161)
				var161 = var178
				var177 = t.GetEligiblePromptsResponse_LocalizedLiteralsEntry.decode(var177)
				var160.localized_literals[var177.key or ""] = var177.value or ""
			else
				local _ = nil
				local var179, var180 = protoModule.readVarInt(p6, var161)
				var161 = var180 + var179
			end
		elseif var162 == protoModule.wireTypes.i32 then
			local _ = nil
			local var181, var182 = protoModule.readFixed32(p6, var161)
			local _ = var181
			var161 = var182
		elseif var162 == protoModule.wireTypes.i64 then
			local _ = nil
			local var183, var184 = protoModule.readFixed64(p6, var161)
			local _ = var183
			var161 = var184
		else
			error("Unsupported wire type: " .. var227)
		end
	end
	return var160
end

function t_6:jsonEncode()
	local t = {}
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		local t_1 = {}
		
		for i, v in self.page_entries do
			table.insert(t_1, v:jsonEncode())
		end
		t.pageEntries = t_1
	end
	if self.hydration_data ~= nil then
		t.hydrationData = self.hydration_data:jsonEncode()
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		local t_1 = {}
		
		for i, v in self.templates do
			t_1[i] = v:jsonEncode()
		end
		t.templates = t_1
	end
	if self.custom_prompts ~= nil and next(self.custom_prompts) ~= nil then
		local t_1 = {}
		
		for i, v in self.custom_prompts do
			t_1[i] = v:jsonEncode()
		end
		t.customPrompts = t_1
	end
	if self.localized_literals ~= nil and next(self.localized_literals) ~= nil then
		local t_1 = {}
		
		for i, v in self.localized_literals do
			t_1[i] = v
		end
		t.localizedLiterals = t_1
	end
	return t
end

function t_6:jsonDecode()
	-- upvalues: t_6 (ref), pageEntryContentModule (ref), hydrationContentModule (ref), templateEntryModule (ref), t (ref)
	local var185 = t_6.new()
	
	if self.page_entries ~= nil then
		local t_1 = {}
		
		for i, v in self.page_entries do
			table.insert(t_1, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var185.page_entries = t_1
	end
	if self.pageEntries ~= nil then
		local t_1 = {}
		
		for i, v in self.pageEntries do
			table.insert(t_1, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var185.page_entries = t_1
	end
	if self.hydration_data ~= nil then
		var185.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		var185.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	if self.templates ~= nil then
		local t_1 = {}
		
		for i, v in self.templates do
			t_1[i] = templateEntryModule.TemplateEntry.jsonDecode(v)
		end
		var185.templates = t_1
	end
	if self.custom_prompts ~= nil then
		local t_1 = {}
		
		for i, v in self.custom_prompts do
			t_1[i] = t.CustomPrompt.jsonDecode(v)
		end
		var185.custom_prompts = t_1
	end
	if self.customPrompts ~= nil then
		local t_1 = {}
		
		for i, v in self.customPrompts do
			t_1[i] = t.CustomPrompt.jsonDecode(v)
		end
		var185.custom_prompts = t_1
	end
	if self.localized_literals ~= nil then
		local t_1 = {}
		
		for i, v in self.localized_literals do
			t_1[i] = v
		end
		var185.localized_literals = t_1
	end
	if self.localizedLiterals ~= nil then
		local t_1 = {}
		
		for i, v in self.localizedLiterals do
			t_1[i] = v
		end
		var185.localized_literals = t_1
	end
	return var185
end

t_6.descriptor = {
	name = "GetEligiblePromptsResponse",
	fullName = "roblox.apppageplatform.prompts.v1beta1.GetEligiblePromptsResponse"
}
t.GetEligiblePromptsResponse = t_6
typeRegistryModule.default:register(t.GetEligiblePromptsResponse)
local t_7 = {}
t_7.__index = t_7

function t_7.new(p7)
	-- upvalues: t_7 (ref)
	return setmetatable({
		key = if p7 == nil or p7.key == nil then "" else p7.key,
		value = if p7 == nil or p7.value == nil then nil else p7.value
	}, t_7)
end

function t_7:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var186 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var187, var188 = protoModule.writeTag(buff, var186, 1, protoModule.wireTypes.lengthDelimited)
		var187, var266 = protoModule.writeString(var187, var188, self.key)
		buff = var187
		var186 = var188
	end
	if self.value ~= nil then
		local var189 = self.value:encode()
		local var190, var191 = protoModule.writeTag(buff, var186, 2, protoModule.wireTypes.lengthDelimited)
		var190, var269 = protoModule.writeBuffer(var190, var191, var189, buffer.len(var189))
		buff = var190
		var186 = var191
	end
	local buff_1 = buffer.create(var186)
	buffer.copy(buff_1, 0, buff, 0, var186)
	
	return buff_1
end

function t_7.decode(p7)
	-- upvalues: t_7 (ref), protoModule (ref), templateEntryModule (ref)
	local var186 = t_7.new()
	local var187 = 0
	while var187 < buffer.len(p7) do
		local _ = nil
		local var188 = nil
		local var189, var190, var191 = protoModule.readTag(p7, var187)
		local var192 = var189
		var188 = var190
		var187 = var191
		
		if var188 == protoModule.wireTypes.varint then
			local _ = nil
			local var193, var194 = protoModule.readVarInt(p7, var187)
			local _ = var193
			var187 = var194
			continue
		end
		if var188 == protoModule.wireTypes.lengthDelimited then
			if var192 == 1 then
				local _ = nil
				local var195, var196 = protoModule.readBuffer(p7, var187)
				var187 = var196
				var186.key = buffer.tostring(var195)
			elseif var192 == 2 then
				local _ = nil
				local var197, var198 = protoModule.readBuffer(p7, var187)
				var187 = var198
				var186.value = templateEntryModule.TemplateEntry.decode(var197)
			else
				local _ = nil
				local var199, var200 = protoModule.readVarInt(p7, var187)
				var187 = var200 + var199
			end
		elseif var188 == protoModule.wireTypes.i32 then
			local _ = nil
			local var201, var202 = protoModule.readFixed32(p7, var187)
			local _ = var201
			var187 = var202
		elseif var188 == protoModule.wireTypes.i64 then
			local _ = nil
			local var203, var204 = protoModule.readFixed64(p7, var187)
			local _ = var203
			var187 = var204
		else
			error("Unsupported wire type: " .. var273)
		end
	end
	return var186
end

function t_7:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_7:jsonDecode()
	-- upvalues: t_7 (ref), templateEntryModule (ref)
	local var205 = t_7.new()
	
	if self.key ~= nil then
		var205.key = self.key
	end
	if self.value ~= nil then
		var205.value = templateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return var205
end

t_7.descriptor = {
	name = "GetEligiblePromptsResponse_TemplatesEntry",
	fullName = "roblox.apppageplatform.prompts.v1beta1.TemplatesEntry"
}
t.GetEligiblePromptsResponse_TemplatesEntry = t_7
typeRegistryModule.default:register(t.GetEligiblePromptsResponse_TemplatesEntry)
local t_8 = {}
t_8.__index = t_8

function t_8.new(p8)
	-- upvalues: t_8 (ref)
	return setmetatable({
		key = if p8 == nil or p8.key == nil then "" else p8.key,
		value = if p8 == nil or p8.value == nil then nil else p8.value
	}, t_8)
end

function t_8:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var205 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var206, var207 = protoModule.writeTag(buff, var205, 1, protoModule.wireTypes.lengthDelimited)
		var206, var295 = protoModule.writeString(var206, var207, self.key)
		buff = var206
		var205 = var207
	end
	if self.value ~= nil then
		local var208 = self.value:encode()
		local var209, var210 = protoModule.writeTag(buff, var205, 2, protoModule.wireTypes.lengthDelimited)
		var209, var298 = protoModule.writeBuffer(var209, var210, var208, buffer.len(var208))
		buff = var209
		var205 = var210
	end
	local buff_1 = buffer.create(var205)
	buffer.copy(buff_1, 0, buff, 0, var205)
	
	return buff_1
end

function t_8.decode(p8)
	-- upvalues: t_8 (ref), protoModule (ref), t (ref)
	local var205 = t_8.new()
	local var206 = 0
	while var206 < buffer.len(p8) do
		local _ = nil
		local var207 = nil
		local var208, var209, var210 = protoModule.readTag(p8, var206)
		local var211 = var208
		var207 = var209
		var206 = var210
		
		if var207 == protoModule.wireTypes.varint then
			local _ = nil
			local var212, var213 = protoModule.readVarInt(p8, var206)
			local _ = var212
			var206 = var213
			continue
		end
		if var207 == protoModule.wireTypes.lengthDelimited then
			if var211 == 1 then
				local _ = nil
				local var214, var215 = protoModule.readBuffer(p8, var206)
				var206 = var215
				var205.key = buffer.tostring(var214)
			elseif var211 == 2 then
				local _ = nil
				local var216, var217 = protoModule.readBuffer(p8, var206)
				var206 = var217
				var205.value = t.CustomPrompt.decode(var216)
			else
				local _ = nil
				local var218, var219 = protoModule.readVarInt(p8, var206)
				var206 = var219 + var218
			end
		elseif var207 == protoModule.wireTypes.i32 then
			local _ = nil
			local var220, var221 = protoModule.readFixed32(p8, var206)
			local _ = var220
			var206 = var221
		elseif var207 == protoModule.wireTypes.i64 then
			local _ = nil
			local var222, var223 = protoModule.readFixed64(p8, var206)
			local _ = var222
			var206 = var223
		else
			error("Unsupported wire type: " .. var302)
		end
	end
	return var205
end

function t_8:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_8:jsonDecode()
	-- upvalues: t_8 (ref), t (ref)
	local var224 = t_8.new()
	
	if self.key ~= nil then
		var224.key = self.key
	end
	if self.value ~= nil then
		var224.value = t.CustomPrompt.jsonDecode(self.value)
	end
	return var224
end

t_8.descriptor = {
	name = "GetEligiblePromptsResponse_CustomPromptsEntry",
	fullName = "roblox.apppageplatform.prompts.v1beta1.CustomPromptsEntry"
}
t.GetEligiblePromptsResponse_CustomPromptsEntry = t_8
typeRegistryModule.default:register(t.GetEligiblePromptsResponse_CustomPromptsEntry)
local t_9 = {}
t_9.__index = t_9

function t_9.new(p9)
	-- upvalues: t_9 (ref)
	return setmetatable({
		key = if p9 == nil or p9.key == nil then "" else p9.key,
		value = if p9 == nil or p9.value == nil then "" else p9.value
	}, t_9)
end

function t_9:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var224 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var225, var226 = protoModule.writeTag(buff, var224, 1, protoModule.wireTypes.lengthDelimited)
		var225, var324 = protoModule.writeString(var225, var226, self.key)
		buff = var225
		var224 = var226
	end
	if self.value ~= nil and self.value ~= "" then
		local var227, var228 = protoModule.writeTag(buff, var224, 2, protoModule.wireTypes.lengthDelimited)
		var227, var326 = protoModule.writeString(var227, var228, self.value)
		buff = var227
		var224 = var228
	end
	local buff_1 = buffer.create(var224)
	buffer.copy(buff_1, 0, buff, 0, var224)
	
	return buff_1
end

function t_9.decode(p9)
	-- upvalues: t_9 (ref), protoModule (ref)
	local var224 = t_9.new()
	local var225 = 0
	while var225 < buffer.len(p9) do
		local _ = nil
		local var226 = nil
		local var227, var228, var229 = protoModule.readTag(p9, var225)
		local var230 = var227
		var226 = var228
		var225 = var229
		
		if var226 == protoModule.wireTypes.varint then
			local _ = nil
			local var231, var232 = protoModule.readVarInt(p9, var225)
			local _ = var231
			var225 = var232
			continue
		end
		if var226 == protoModule.wireTypes.lengthDelimited then
			if var230 == 1 then
				local _ = nil
				local var233, var234 = protoModule.readBuffer(p9, var225)
				var225 = var234
				var224.key = buffer.tostring(var233)
			elseif var230 == 2 then
				local _ = nil
				local var235, var236 = protoModule.readBuffer(p9, var225)
				var225 = var236
				var224.value = buffer.tostring(var235)
			else
				local _ = nil
				local var237, var238 = protoModule.readVarInt(p9, var225)
				var225 = var238 + var237
			end
		elseif var226 == protoModule.wireTypes.i32 then
			local _ = nil
			local var239, var240 = protoModule.readFixed32(p9, var225)
			local _ = var239
			var225 = var240
		elseif var226 == protoModule.wireTypes.i64 then
			local _ = nil
			local var241, var242 = protoModule.readFixed64(p9, var225)
			local _ = var241
			var225 = var242
		else
			error("Unsupported wire type: " .. var330)
		end
	end
	return var224
end

function t_9:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function t_9:jsonDecode()
	-- upvalues: t_9 (ref)
	local var243 = t_9.new()
	
	if self.key ~= nil then
		var243.key = self.key
	end
	if self.value ~= nil then
		var243.value = self.value
	end
	return var243
end

t_9.descriptor = {
	name = "GetEligiblePromptsResponse_LocalizedLiteralsEntry",
	fullName = "roblox.apppageplatform.prompts.v1beta1.LocalizedLiteralsEntry"
}
t.GetEligiblePromptsResponse_LocalizedLiteralsEntry = t_9
typeRegistryModule.default:register(t.GetEligiblePromptsResponse_LocalizedLiteralsEntry)

return {
	CustomPrompt = t.CustomPrompt,
	GetEligiblePromptsRequest = t.GetEligiblePromptsRequest,
	GetEligiblePromptsResponse = t.GetEligiblePromptsResponse
}