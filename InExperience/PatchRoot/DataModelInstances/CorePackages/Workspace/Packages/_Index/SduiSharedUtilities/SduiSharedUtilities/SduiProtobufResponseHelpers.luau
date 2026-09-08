local httpService = game:GetService("HttpService")
local sduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local parent = sduiSharedUtilities.Parent
local getProtoVariableMapper = require(parent.SduiCoreSystem).getProtoVariableMapper
local _ = require(sduiSharedUtilities.SduiIntegrationTypes)
local fFlagSduiUniversalPageEntry = require(parent.SharedFlags).FFlagSduiUniversalPageEntry
local fFlagSduiHydrationDataCamelCaseTopLevelKeys = require(parent.SharedFlags).FFlagSduiHydrationDataCamelCaseTopLevelKeys
local fFlagSduiHydrationDataCamelCasePropertyKeys = require(parent.SharedFlags).FFlagSduiHydrationDataCamelCasePropertyKeys
local fFlagEnableHomepagePromptsForModalsAndBanners = require(parent.SharedFlags).FFlagEnableHomepagePromptsForModalsAndBanners
local fFlagPromptsHandlerEnabled = require(parent.SharedFlags).FFlagPromptsHandlerEnabled
local fFlagSduiClientTemplateCache = require(parent.SharedFlags).FFlagSduiClientTemplateCache

local function decodeProto(p1, p2)
	return p1.decode(if typeof(p2) == "string" then buffer.fromstring(p2) else p2)
end

local function decodeProtobufJson(p1, p2)
	-- upvalues: httpService (ref)
	return p1.jsonDecode(httpService:JSONDecode(if typeof(p2) == "buffer" then buffer.tostring(p2) else p2))
end

local function parseSurfacing(p1)
	-- upvalues: getProtoVariableMapper (ref)
	if not p1 or not p1.kind then
		return nil
	end
	local kind = p1.kind
	
	if kind.type == nil or kind.value == nil then
		return nil
	end
	local var1 = getProtoVariableMapper()
	
	return {
		[var1.mapPropName(kind.type)] = var1.camelCaseKeys(kind.value)
	}
end

return {
	decodeProto = decodeProto,
	decodeProtobufJson = decodeProtobufJson,
	makeProtoResponseDecoder = function(p1)
		-- upvalues: decodeProto (ref)
		return function(p2)
			-- upvalues: decodeProto (copy), p1 (ref)
			return decodeProto(p1, p2)
		end
	end,
	makeProtobufJsonResponseDecoder = function(p1)
		-- upvalues: decodeProtobufJson (ref)
		return function(p2)
			-- upvalues: decodeProtobufJson (copy), p1 (ref)
			return decodeProtobufJson(p1, p2)
		end
	end,
	parsePageEntriesFromResponse = function(p1)
		-- upvalues: fFlagSduiUniversalPageEntry (ref), fFlagEnableHomepagePromptsForModalsAndBanners (ref), fFlagPromptsHandlerEnabled (ref), parseSurfacing (ref)
		local t = {}
		
		if p1.page_entries then
			for i, v in p1.page_entries do
				local robloxComponent = v.page_entry.roblox_component
				local var1 = if fFlagSduiUniversalPageEntry then v.input_data and (v.input_data.kind and v.input_data.kind.value) else v.kind and v.kind.value
				local identifier = v.page_entry.identifier
				local var2 = if fFlagEnableHomepagePromptsForModalsAndBanners or fFlagPromptsHandlerEnabled then v.page_entry.category else nil
				table.insert(t, {
					robloxComponentType = robloxComponent,
					identifier = if identifier ~= "" then nil else identifier,
					componentInputData = var1,
					title = v.page_entry.title,
					category = if var2 == nil or var2 == "" then nil else var2,
					surfacing = parseSurfacing(v.page_entry.surfacing)
				})
			end
		end
		return t
	end,
	parseHydrationDataFromResponse = function(p2)
		-- upvalues: fFlagSduiHydrationDataCamelCasePropertyKeys (ref), getProtoVariableMapper (ref), fFlagSduiHydrationDataCamelCaseTopLevelKeys (ref)
		local hydrationData = p2.hydration_data
		
		if hydrationData then
			for i, v in hydrationData do
				for i_1, v_1 in v do
					if not fFlagSduiHydrationDataCamelCasePropertyKeys then
						for i_4, i_2 in v_1 do
							v_1[getProtoVariableMapper().mapPropName(i_4)] = i_2
						end
					end
					local t = {}
					
					for i_2, v_2 in v_1 do
						t[getProtoVariableMapper().mapPropName(i_2)] = v_2
					end
					for i_2, v_2 in t do
						v_1[i_2] = v_2
					end
				end
			end
			if fFlagSduiHydrationDataCamelCaseTopLevelKeys then
				local var3 = getProtoVariableMapper()
				local t = {}
				
				for i_1, v_1 in hydrationData do
					if v_1 then
						t[var3.mapPropName(i_1)] = v_1
					end
				end
				for i_2, v_2 in t do
					hydrationData[i_2] = v_2
				end
			end
		end
		return hydrationData
	end,
	parseLocalizedLiteralsFromResponse = function(p3)
		return if p3.localized_literals then p3.localized_literals else nil
	end,
	parseTemplateEntriesFromResponse = function(value, p3)
		-- upvalues: fFlagSduiClientTemplateCache (ref)
		local t = {}
		local t_1 = {}
		local t_2 = {}
		
		if value.templates then
			for i, v in value.templates do
				t_1[v.roblox_component] = v.template
				
				if fFlagSduiClientTemplateCache and p3 then
					t_2[v.roblox_component] = i
				end
				t[i] = v.template
			end
		end
		return t, t_1, t_2
	end
}