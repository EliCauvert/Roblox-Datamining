local httpService = game:GetService("HttpService")
local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local expChatSharedModule = require(parent.ExpChatShared)
local getPresetChatStoreModule = require(expChat.Stores.GetPresetChatStore)
local constantsModule = require(expChat.PresetChat.Constants)
local presetSearchModule = require(expChat.Autocomplete.PresetSearch)
local getEnableChatInputBarConfigurationAutocompleteEnabledModule = require(expChat.Flags.getEnableChatInputBarConfigurationAutocompleteEnabled)
local extendedStandardizedFields = constantsModule.Analytics.ExtendedStandardizedFields
local t = {}

return function(value) --[[ line: 74 | named "usePresetAutocompleteAnalytics" ]]
	-- upvalues: t (ref), getEnableChatInputBarConfigurationAutocompleteEnabledModule (ref), reactModule (ref), expChatSharedModule (ref), constantsModule (ref), httpService (ref), extendedStandardizedFields (ref), presetSearchModule (ref), getPresetChatStoreModule (ref)
	local autocompleteDropdownReducer = value.autocompleteDropdownReducer
	local var9 = if autocompleteDropdownReducer ~= nil then t else autocompleteDropdownReducer.results
	local var10 = autocompleteDropdownReducer ~= nil and (autocompleteDropdownReducer.activated and (autocompleteDropdownReducer.autocompleteType == "presets" and (#var9 > 0 and (value.isFocused and (value.autocompleteEnabled == true and getEnableChatInputBarConfigurationAutocompleteEnabledModule())))))
	local var11 = reactModule.useRef(nil)
	local var12 = reactModule.useRef({})
	local var13 = reactModule.useRef({})
	local var14 = reactModule.useRef({})
	local var15 = reactModule.useRef(nil)
	local var16 = reactModule.useCallback(function() --[[ line: 103 ]]
		-- upvalues: var11 (ref), var14 (ref), var12 (ref), var15 (ref), var13 (ref), expChatSharedModule (copy), constantsModule (copy), httpService (copy), extendedStandardizedFields (copy)
		local current = var11.current
		
		if current == nil then return end
		local t = {}
		
		for i, v in var14.current do
			t[v] = i - 1
		end
		local t_1 = {}
		
		for i_1, v_1 in var12.current do
			local var20 = t[v_1]
			table.insert(t_1, {
				preset_id = v_1,
				index = if var20 ~= nil then -1 else var20,
				click = if var15.current == v_1 then 1 else 0
			})
		end
		var11.current = nil
		var12.current = {}
		var13.current = {}
		var14.current = {}
		var15.current = nil
		expChatSharedModule.Analytics:TelemetryLogEvent(expChatSharedModule.Analytics.ExpChatPresetActionConfig, {
			event_type = constantsModule.Analytics.EventTypes.Dismiss,
			component = constantsModule.Analytics.Components.AutocompleteDropdown,
			autocomplete_session_id = current,
			preset_items = httpService:JSONEncode(t_1)
		}, extendedStandardizedFields)
	end, {})
	local var17 = reactModule.useCallback(function(p0) --[[ line: 150 ]]
		-- upvalues: var11 (ref), presetSearchModule (copy), getPresetChatStoreModule (copy), var15 (ref)
		if var11.current == nil then return end
		local presetIdForValue = presetSearchModule.getPresetIdForValue(getPresetChatStoreModule(false), p0)
		
		if presetIdForValue == nil then
			return
		end
		var15.current = presetIdForValue
	end, {})
	reactModule.useEffect(function() --[[ line: 163 ]]
		-- upvalues: var10 (ref), getPresetChatStoreModule (copy), var9 (ref), presetSearchModule (copy), var13 (ref), var12 (ref), var14 (ref)
		if not var10 then return end
		local var22 = getPresetChatStoreModule(false)
		local t = {}
		
		for i, v in var9 do
			local presetIdForValue = presetSearchModule.getPresetIdForValue(var22, v)
			
			if presetIdForValue ~= nil then
				table.insert(t, presetIdForValue)
				
				if not var13.current[presetIdForValue] then
					var13.current[presetIdForValue] = true
					table.insert(var12.current, presetIdForValue)
				end
			end
		end
		var14.current = t
	end, { var10, var9 })
	reactModule.useEffect(function() --[[ line: 183 ]]
		-- upvalues: var10 (ref), var16 (ref), var11 (ref), httpService (copy), expChatSharedModule (copy), constantsModule (copy), extendedStandardizedFields (copy)
		if not var10 then
			var16()
			
			return
		elseif var11.current == nil then
			local var25 = httpService:GenerateGUID(false)
			var11.current = var25
			expChatSharedModule.Analytics:TelemetryLogEvent(expChatSharedModule.Analytics.ExpChatPresetActionConfig, {
				event_type = constantsModule.Analytics.EventTypes.Show,
				component = constantsModule.Analytics.Components.AutocompleteDropdown,
				autocomplete_session_id = var25
			}, extendedStandardizedFields)
			
			return
		end
	end, { var10, var16 })
	reactModule.useEffect(function() --[[ line: 205 ]]
		-- upvalues: var16 (ref)
		return function() --[[ line: 206 ]]
			-- upvalues: var16 (copy)
			var16()
		end
	end, { var16 })
	
	return { recordPresetChosen = var17 }
end