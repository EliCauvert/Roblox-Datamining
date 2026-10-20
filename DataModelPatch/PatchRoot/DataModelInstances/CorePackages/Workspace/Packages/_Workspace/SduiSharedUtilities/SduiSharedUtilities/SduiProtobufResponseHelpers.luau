local HttpService = game:GetService("HttpService")
local SduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local Parent = SduiSharedUtilities.Parent
local GetProtoVariableMapperFunction = require(Parent.SduiCoreSystem).getProtoVariableMapper
local _ = require(SduiSharedUtilities.SduiIntegrationTypes)
local FFlagSduiUniversalPageEntry = require(Parent.SharedFlags).FFlagSduiUniversalPageEntry
local FFlagSduiHydrationDataCamelCaseTopLevelKeys = require(Parent.SharedFlags).FFlagSduiHydrationDataCamelCaseTopLevelKeys
local FFlagSduiHydrationDataCamelCasePropertyKeys = require(Parent.SharedFlags).FFlagSduiHydrationDataCamelCasePropertyKeys
local FFlagSduiLocalizedLiterals = require(Parent.SharedFlags).FFlagSduiLocalizedLiterals
local FFlagEnableHomepagePromptsForModalsAndBanners = require(Parent.SharedFlags).FFlagEnableHomepagePromptsForModalsAndBanners
local FFlagPromptsHandlerEnabled = require(Parent.SharedFlags).FFlagPromptsHandlerEnabled
local FFlagSduiPageEntrySurfacing = require(Parent.SharedFlags).FFlagSduiPageEntrySurfacing
local FFlagSduiClientTemplateCache = require(Parent.SharedFlags).FFlagSduiClientTemplateCache

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

return {
	decodeProto = decodeProto,
	decodeProtobufJson = decodeProtobufJson,
	makeProtoResponseDecoder = function(p1)
		-- upvalues: decodeProto (copy)
		return function(p2)
			-- upvalues: decodeProto (upval), p1 (copy)
			return decodeProto(p1, p2)
		end
	end,
	makeProtobufJsonResponseDecoder = function(p1)
		-- upvalues: decodeProtobufJson (copy)
		return function(p2)
			-- upvalues: decodeProtobufJson (upval), p1 (copy)
			return decodeProtobufJson(p1, p2)
		end
	end,
	parsePageEntriesFromResponse = function(p1)
		-- upvalues: FFlagSduiUniversalPageEntry (copy), FFlagEnableHomepagePromptsForModalsAndBanners (copy), FFlagPromptsHandlerEnabled (copy), FFlagSduiPageEntrySurfacing (copy), parseSurfacing (copy)
		local List = {}
		
		if p1.page_entries then
			for _, pageEntry in p1.page_entries do
				local Identifier = pageEntry.page_entry.identifier
				local Category = if FFlagEnableHomepagePromptsForModalsAndBanners or FFlagPromptsHandlerEnabled then pageEntry.page_entry.category else nil
				table.insert(List, {
					robloxComponentType = pageEntry.page_entry.roblox_component,
					identifier = if Identifier == "" then nil else Identifier,
					componentInputData = if FFlagSduiUniversalPageEntry then pageEntry.input_data and (pageEntry.input_data.kind and pageEntry.input_data.kind.value) else pageEntry.kind and pageEntry.kind.value,
					title = pageEntry.page_entry.title,
					category = if Category == nil or Category == "" then nil else Category,
					surfacing = if FFlagSduiPageEntrySurfacing then parseSurfacing(pageEntry.page_entry.surfacing) else nil
				})
			end
		end
		return List
	end,
	parseHydrationDataFromResponse = function(p2)
		-- upvalues: FFlagSduiHydrationDataCamelCasePropertyKeys (copy), GetProtoVariableMapperFunction (copy), FFlagSduiHydrationDataCamelCaseTopLevelKeys (copy)
		local HydrationData = p2.hydration_data
		
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
			if FFlagSduiHydrationDataCamelCaseTopLevelKeys then
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
		end
		return HydrationData
	end,
	parseLocalizedLiteralsFromResponse = function(p3)
		-- upvalues: FFlagSduiLocalizedLiterals (copy)
		return if FFlagSduiLocalizedLiterals and p3.localized_literals then p3.localized_literals else nil
	end,
	parseTemplateEntriesFromResponse = function(p3, p4)
		-- upvalues: FFlagSduiClientTemplateCache (copy)
		local Templates = {}
		local Templates1 = {}
		local t = {}
		
		if p3.templates then
			for i, template in p3.templates do
				Templates1[template.roblox_component] = template.template
				
				if FFlagSduiClientTemplateCache and p4 then
					t[template.roblox_component] = i
				end
				Templates[i] = template.template
			end
		end
		return Templates, Templates1, t
	end
}