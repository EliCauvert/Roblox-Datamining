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

return function(value)
	-- upvalues: t (ref), getEnableChatInputBarConfigurationAutocompleteEnabledModule (ref), reactModule (ref), expChatSharedModule (ref), constantsModule (ref), httpService (ref), extendedStandardizedFields (ref), presetSearchModule (ref), getPresetChatStoreModule (ref)
	local autocompleteDropdownReducer = value.autocompleteDropdownReducer
	local var1 = if autocompleteDropdownReducer ~= nil then t else autocompleteDropdownReducer.results
	local var2 = autocompleteDropdownReducer ~= nil and (autocompleteDropdownReducer.activated and (autocompleteDropdownReducer.autocompleteType == "presets" and (#var1 > 0 and (value.isFocused and (value.autocompleteEnabled == true and getEnableChatInputBarConfigurationAutocompleteEnabledModule())))))
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.useRef({})
	local var5 = reactModule.useRef({})
	local var6 = reactModule.useRef({})
	local var7 = reactModule.useRef(nil)
	local var8 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var6 (ref), var4 (ref), var7 (ref), var5 (ref), expChatSharedModule (copy), constantsModule (copy), httpService (copy), extendedStandardizedFields (copy)
		local current = var3.current
		
		if current == nil then return end
		local t = {}
		
		for i, v in var6.current do
			t[v] = i - 1
		end
		local t_1 = {}
		
		for i_1, v_1 in var4.current do
			local var9 = t[v_1]
			table.insert(t_1, {
				preset_id = v_1,
				index = if var9 ~= nil then -1 else var9,
				click = if var7.current == v_1 then 1 else 0
			})
		end
		var3.current = nil
		var4.current = {}
		var5.current = {}
		var6.current = {}
		var7.current = nil
		expChatSharedModule.Analytics:TelemetryLogEvent(expChatSharedModule.Analytics.ExpChatPresetActionConfig, {
			event_type = constantsModule.Analytics.EventTypes.Dismiss,
			component = constantsModule.Analytics.Components.AutocompleteDropdown,
			autocomplete_session_id = current,
			preset_items = httpService:JSONEncode(t_1)
		}, extendedStandardizedFields)
	end, {})
	local var10 = reactModule.useCallback(function(p1)
		-- upvalues: var3 (ref), presetSearchModule (copy), getPresetChatStoreModule (copy), var7 (ref)
		if var3.current == nil then return end
		local presetIdForValue = presetSearchModule.getPresetIdForValue(getPresetChatStoreModule(false), p1)
		
		if presetIdForValue == nil then
			return
		end
		var7.current = presetIdForValue
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), getPresetChatStoreModule (copy), var1 (ref), presetSearchModule (copy), var5 (ref), var4 (ref), var6 (ref)
		if not var2 then return end
		local var11 = getPresetChatStoreModule(false)
		local t = {}
		
		for i, v in var1 do
			local presetIdForValue = presetSearchModule.getPresetIdForValue(var11, v)
			
			if presetIdForValue ~= nil then
				table.insert(t, presetIdForValue)
				
				if not var5.current[presetIdForValue] then
					var5.current[presetIdForValue] = true
					table.insert(var4.current, presetIdForValue)
				end
			end
		end
		var6.current = t
	end, { var2, var1 })
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var8 (ref), var3 (ref), httpService (copy), expChatSharedModule (copy), constantsModule (copy), extendedStandardizedFields (copy)
		if not var2 then
			var8()
			
			return
		elseif var3.current == nil then
			local var12 = httpService:GenerateGUID(false)
			var3.current = var12
			expChatSharedModule.Analytics:TelemetryLogEvent(expChatSharedModule.Analytics.ExpChatPresetActionConfig, {
				event_type = constantsModule.Analytics.EventTypes.Show,
				component = constantsModule.Analytics.Components.AutocompleteDropdown,
				autocomplete_session_id = var12
			}, extendedStandardizedFields)
			
			return
		end
	end, { var2, var8 })
	reactModule.useEffect(function()
		-- upvalues: var8 (ref)
		return function()
			-- upvalues: var8 (copy)
			var8()
		end
	end, { var8 })
	
	return { recordPresetChosen = var10 }
end