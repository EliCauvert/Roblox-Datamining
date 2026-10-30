local HttpService = game:GetService("HttpService")
local SduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local Parent = SduiSharedUtilities.Parent
local GetProtoVariableMapperFunction = require(Parent.SduiCoreSystem).getProtoVariableMapper
local _ = require(SduiSharedUtilities.SduiIntegrationTypes)
local FFlagSduiHydrationDataCamelCasePropertyKeys = require(Parent.SharedFlags).FFlagSduiHydrationDataCamelCasePropertyKeys
local FFlagEnableHomepagePromptsForModalsAndBanners = require(Parent.SharedFlags).FFlagEnableHomepagePromptsForModalsAndBanners
local FFlagPromptsHandlerEnabled = require(Parent.SharedFlags).FFlagPromptsHandlerEnabled
local FFlagSduiSandboxContentInputData = require(Parent.SharedFlags).FFlagSduiSandboxContentInputData

local function decodeProto(p1, p2)
	return p1.decode(if typeof(p2) == "string" then buffer.fromstring(p2) else p2)
end

local function decodeProtobufJson(p1, Buf)
	-- upvalues: HttpService (copy)
	return p1.jsonDecode(HttpService:JSONDecode(if typeof(Buf) == "buffer" then buffer.tostring(Buf) else Buf))
end

local function parseSurfacing(Surfacing)
	-- upvalues: GetProtoVariableMapperFunction (copy)
	if not Surfacing or not Surfacing.kind then
		return nil
	end
	local Kind = Surfacing.kind
	
	if Kind.type == nil or Kind.value == nil then
		return nil
	else
		local ProtoVariableMapper = GetProtoVariableMapperFunction()
		
		return {
			[ProtoVariableMapper.mapPropName(Kind.type)] = ProtoVariableMapper.camelCaseKeys(Kind.value)
		}
	end
end

local Callback = nil

local function unwrapSandboxValue(p1)
	-- upvalues: Callback (ref), unwrapSandboxValue (copy)
	if typeof(p1) ~= "table" or typeof(p1.kind) ~= "table" then
		return p1
	end
	local Kind = p1.kind
	
	if Kind.type == "null_value" then
		return nil
	end
	if Kind.type == "struct_value" then
		return Callback(Kind.value)
	end
	if Kind.type ~= "list_value" then
		return Kind.value
	end
	local t = {}
	local Values = if typeof(Kind.value) == "table" and typeof(Kind.value.values) == "table" then Kind.value.values else {}
	for i, value in Values do
		t[i] = unwrapSandboxValue(value)
	end
	return t
end

Callback = function(p2)
	-- upvalues: unwrapSandboxValue (copy)
	if typeof(p2) ~= "table" or typeof(p2.fields) ~= "table" then
		return p2
	end
	local t = {}
	
	for i, field in p2.fields do
		t[i] = unwrapSandboxValue(field)
	end
	return t
end

return {
	decodeProto = decodeProto,
	decodeProtobufJson = decodeProtobufJson,
	makeProtoResponseDecoder = function(p3)
		-- upvalues: decodeProto (copy)
		return function(p4)
			-- upvalues: decodeProto (upval), p3 (copy)
			return decodeProto(p3, p4)
		end
	end,
	makeProtobufJsonResponseDecoder = function(p3)
		-- upvalues: decodeProtobufJson (copy)
		return function(p4)
			-- upvalues: decodeProtobufJson (upval), p3 (copy)
			return decodeProtobufJson(p3, p4)
		end
	end,
	parsePageEntriesFromResponse = function(p3)
		-- upvalues: FFlagSduiSandboxContentInputData (copy), Callback (ref), FFlagEnableHomepagePromptsForModalsAndBanners (copy), FFlagPromptsHandlerEnabled (copy), parseSurfacing (copy)
		local List = {}
		
		if p3.page_entries then
			for _, pageEntry in p3.page_entries do
				local RobloxComponent = pageEntry.page_entry.roblox_component
				local Value = pageEntry.input_data and (pageEntry.input_data.kind and pageEntry.input_data.kind.value)
				
				if FFlagSduiSandboxContentInputData then
					local Kind = pageEntry.input_data and pageEntry.input_data.kind
					
					if Kind and Kind.type == "sandbox_content" then
						Value = Callback(Kind.value)
					end
				end
				local Identifier = pageEntry.page_entry.identifier
				local Category = if FFlagEnableHomepagePromptsForModalsAndBanners or FFlagPromptsHandlerEnabled then pageEntry.page_entry.category else nil
				table.insert(List, {
					robloxComponentType = RobloxComponent,
					identifier = if Identifier == "" then nil else Identifier,
					componentInputData = Value,
					title = pageEntry.page_entry.title,
					category = if Category == nil or Category == "" then nil else Category,
					surfacing = parseSurfacing(pageEntry.page_entry.surfacing)
				})
			end
		end
		return List
	end,
	parseHydrationDataFromResponse = function(p4)
		-- upvalues: FFlagSduiHydrationDataCamelCasePropertyKeys (copy), GetProtoVariableMapperFunction (copy)
		local HydrationData = p4.hydration_data
		
		if HydrationData then
			for _, value in HydrationData do
				for _, value1 in value do
					if FFlagSduiHydrationDataCamelCasePropertyKeys then
						local t = {}
						
						for i, value2 in value1 do
							t[GetProtoVariableMapperFunction().mapPropName(i)] = value2
						end
						for i1, value3 in t do
							value1[i1] = value3
						end
					else
						for i2, value4 in value1 do
							value1[GetProtoVariableMapperFunction().mapPropName(i2)] = value4
						end
					end
				end
			end
			local ProtoVariableMapper = GetProtoVariableMapperFunction()
			local t = {}
			
			for i3, value5 in HydrationData do
				if value5 then
					t[ProtoVariableMapper.mapPropName(i3)] = value5
				end
			end
			for i4, value6 in t do
				HydrationData[i4] = value6
			end
		end
		return HydrationData
	end,
	parseLocalizedLiteralsFromResponse = function(p5)
		return if p5.localized_literals then p5.localized_literals else nil
	end,
	parseTemplateEntriesFromResponse = function(p5, p6)
		local Templates = {}
		local Templates1 = {}
		local t = {}
		
		if p5.templates then
			for i, template in p5.templates do
				Templates1[template.roblox_component] = template.template
				
				if p6 then
					t[template.roblox_component] = i
				end
				Templates[i] = template.template
			end
		end
		return Templates, Templates1, t
	end
}