local httpService = game:GetService("HttpService")
local sduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local parent = sduiSharedUtilities.Parent
local getProtoVariableMapper = require(parent.SduiCoreSystem).getProtoVariableMapper
local _ = require(sduiSharedUtilities.SduiIntegrationTypes)
local fFlagSduiUniversalPageEntry = require(parent.SharedFlags).FFlagSduiUniversalPageEntry
local fFlagSduiHydrationDataCamelCaseTopLevelKeys = require(parent.SharedFlags).FFlagSduiHydrationDataCamelCaseTopLevelKeys
local fFlagSduiHydrationDataCamelCasePropertyKeys = require(parent.SharedFlags).FFlagSduiHydrationDataCamelCasePropertyKeys
local fFlagSduiLocalizedLiterals = require(parent.SharedFlags).FFlagSduiLocalizedLiterals
local fFlagEnableHomepagePromptsForModalsAndBanners = require(parent.SharedFlags).FFlagEnableHomepagePromptsForModalsAndBanners
local fFlagPromptsHandlerEnabled = require(parent.SharedFlags).FFlagPromptsHandlerEnabled
local fFlagSduiPageEntrySurfacing = require(parent.SharedFlags).FFlagSduiPageEntrySurfacing
local fFlagSduiClientTemplateCache = require(parent.SharedFlags).FFlagSduiClientTemplateCache

local function decodeProto(p0, p1) --[[ line: 28 ]]
	return p0.decode(if typeof(p1) == "string" then buffer.fromstring(p1) else p1)
end

local function decodeProtobufJson(p2, p3) --[[ line: 40 ]]
	-- upvalues: httpService (ref)
	return p2.jsonDecode(httpService:JSONDecode(if typeof(p3) == "buffer" then buffer.tostring(p3) else p3))
end

local function parseSurfacing(p4) --[[ line: 72 ]]
	-- upvalues: getProtoVariableMapper (ref)
	if not p4 or not p4.kind then
		return nil
	end
	local kind = p4.kind
	
	if kind.type == nil or kind.value == nil then
		return nil
	end
	local var5 = getProtoVariableMapper()
	
	return {
		[var5.mapPropName(kind.type)] = var5.camelCaseKeys(kind.value)
	}
end

return {
	decodeProto = decodeProto,
	decodeProtobufJson = decodeProtobufJson,
	makeProtoResponseDecoder = function(p5) --[[ line: 48 ]]
		-- upvalues: decodeProto (ref)
		return function(p6) --[[ line: 49 ]]
			-- upvalues: decodeProto (copy), p5 (ref)
			return decodeProto(p5, p6)
		end
	end,
	makeProtobufJsonResponseDecoder = function(p7) --[[ line: 57 ]]
		-- upvalues: decodeProtobufJson (ref)
		return function(p8) --[[ line: 58 ]]
			-- upvalues: decodeProtobufJson (copy), p7 (ref)
			return decodeProtobufJson(p7, p8)
		end
	end,
	parsePageEntriesFromResponse = function(p9) --[[ line: 89 ]]
		-- upvalues: fFlagSduiUniversalPageEntry (ref), fFlagEnableHomepagePromptsForModalsAndBanners (ref), fFlagPromptsHandlerEnabled (ref), fFlagSduiPageEntrySurfacing (ref), parseSurfacing (ref)
		local t = {}
		
		if p9.page_entries then
			for i, v in p9.page_entries do
				local robloxComponent = v.page_entry.roblox_component
				local var7 = if fFlagSduiUniversalPageEntry then v.input_data and (v.input_data.kind and v.input_data.kind.value) else v.kind and v.kind.value
				local identifier = v.page_entry.identifier
				local var8 = if fFlagEnableHomepagePromptsForModalsAndBanners or fFlagPromptsHandlerEnabled then v.page_entry.category else nil
				table.insert(t, {
					robloxComponentType = robloxComponent,
					identifier = if identifier ~= "" then nil else identifier,
					componentInputData = var7,
					title = v.page_entry.title,
					category = if var8 == nil or var8 == "" then nil else var8,
					surfacing = if fFlagSduiPageEntrySurfacing then parseSurfacing(v.page_entry.surfacing) else nil
				})
			end
		end
		return t
	end,
	parseHydrationDataFromResponse = function(p10) --[[ line: 123 ]]
		-- upvalues: fFlagSduiHydrationDataCamelCasePropertyKeys (ref), getProtoVariableMapper (ref), fFlagSduiHydrationDataCamelCaseTopLevelKeys (ref)
		local hydrationData = p10.hydration_data
		
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
				local var9 = getProtoVariableMapper()
				local t = {}
				
				for i_1, v_1 in hydrationData do
					if v_1 then
						t[var9.mapPropName(i_1)] = v_1
					end
				end
				for i_2, v_2 in t do
					hydrationData[i_2] = v_2
				end
			end
		end
		return hydrationData
	end,
	parseLocalizedLiteralsFromResponse = function(p11) --[[ line: 172 ]]
		-- upvalues: fFlagSduiLocalizedLiterals (ref)
		return if fFlagSduiLocalizedLiterals and p11.localized_literals then p11.localized_literals else nil
	end,
	parseTemplateEntriesFromResponse = function(value, p12) --[[ line: 187 ]]
		-- upvalues: fFlagSduiClientTemplateCache (ref)
		local t = {}
		local t_1 = {}
		local t_2 = {}
		
		if value.templates then
			for i, v in value.templates do
				t_1[v.roblox_component] = v.template
				
				if fFlagSduiClientTemplateCache and p12 then
					t_2[v.roblox_component] = i
				end
				t[i] = v.template
			end
		end
		return t, t_1, t_2
	end
}