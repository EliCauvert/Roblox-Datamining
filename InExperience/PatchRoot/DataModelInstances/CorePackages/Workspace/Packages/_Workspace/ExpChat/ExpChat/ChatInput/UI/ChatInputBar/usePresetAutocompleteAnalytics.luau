local HttpService = game:GetService("HttpService")
local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ReactModule = require(Parent.React)
local ExpChatSharedModule = require(Parent.ExpChatShared)
local GetPresetChatStoreModule = require(ExpChat.Stores.GetPresetChatStore)
local ConstantsModule = require(ExpChat.PresetChat.Constants)
local PresetSearchModule = require(ExpChat.Autocomplete.PresetSearch)
local GetEnableChatInputBarConfigurationAutocompleteEnabledModule = require(ExpChat.Flags.getEnableChatInputBarConfigurationAutocompleteEnabled)
local ExtendedStandardizedFields = ConstantsModule.Analytics.ExtendedStandardizedFields
local t = {}

return function(p1)
	-- upvalues: t (copy), GetEnableChatInputBarConfigurationAutocompleteEnabledModule (copy), ReactModule (copy), ExpChatSharedModule (copy), ConstantsModule (copy), HttpService (copy), ExtendedStandardizedFields (copy), PresetSearchModule (copy), GetPresetChatStoreModule (copy)
	local AutocompleteDropdownReducer = p1.autocompleteDropdownReducer
	local T = if AutocompleteDropdownReducer == nil then t else AutocompleteDropdownReducer.results
	local EnableChatInputBarConfigurationAutocompleteEnabledModule = AutocompleteDropdownReducer ~= nil and (AutocompleteDropdownReducer.activated and (AutocompleteDropdownReducer.autocompleteType == "presets" and #T > 0 and (p1.isFocused and (p1.autocompleteEnabled == true and GetEnableChatInputBarConfigurationAutocompleteEnabledModule()))))
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef({})
	local UseRefResult2 = ReactModule.useRef({})
	local UseRefResult3 = ReactModule.useRef({})
	local UseRefResult4 = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UseRefResult3 (copy), UseRefResult1 (copy), UseRefResult4 (copy), UseRefResult2 (copy), ExpChatSharedModule (upval), ConstantsModule (upval), HttpService (upval), ExtendedStandardizedFields (upval)
		local Current = UseRefResult.current
		
		if Current == nil then return end
		local t = {}
		
		for i, value in UseRefResult3.current do
			t[value] = i - 1
		end
		local List = {}
		
		for _, Preset_id in UseRefResult1.current do
			local Entry = t[Preset_id]
			table.insert(List, {
				preset_id = Preset_id,
				index = if Entry == nil then -1 else Entry,
				click = if UseRefResult4.current == Preset_id then 1 else 0
			})
		end
		UseRefResult.current = nil
		UseRefResult1.current = {}
		UseRefResult2.current = {}
		UseRefResult3.current = {}
		UseRefResult4.current = nil
		ExpChatSharedModule.Analytics:TelemetryLogEvent(ExpChatSharedModule.Analytics.ExpChatPresetActionConfig, {
			event_type = ConstantsModule.Analytics.EventTypes.Dismiss,
			component = ConstantsModule.Analytics.Components.AutocompleteDropdown,
			autocomplete_session_id = Current,
			preset_items = HttpService:JSONEncode(List)
		}, ExtendedStandardizedFields)
	end, {})
	local UseResult1 = ReactModule.useCallback(function(p2)
		-- upvalues: UseRefResult (copy), PresetSearchModule (upval), GetPresetChatStoreModule (upval), UseRefResult4 (copy)
		if UseRefResult.current == nil then return end
		local PresetIdForValue = PresetSearchModule.getPresetIdForValue(GetPresetChatStoreModule(false), p2)
		
		if PresetIdForValue ~= nil then
			UseRefResult4.current = PresetIdForValue
			
			return
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: EnableChatInputBarConfigurationAutocompleteEnabledModule (copy), GetPresetChatStoreModule (upval), T (copy), PresetSearchModule (upval), UseRefResult2 (copy), UseRefResult1 (copy), UseRefResult3 (copy)
		if not EnableChatInputBarConfigurationAutocompleteEnabledModule then return end
		local PresetChatStoreModule = GetPresetChatStoreModule(false)
		local Current = {}
		
		for _, value in T do
			local PresetIdForValue = PresetSearchModule.getPresetIdForValue(PresetChatStoreModule, value)
			local NoPresetIdForValue = PresetIdForValue == nil
			
			if not NoPresetIdForValue then
				table.insert(Current, PresetIdForValue)
				NoPresetIdForValue = UseRefResult2.current[PresetIdForValue]
			end
			if not NoPresetIdForValue then
				UseRefResult2.current[PresetIdForValue] = true
				table.insert(UseRefResult1.current, PresetIdForValue)
			end
		end
		UseRefResult3.current = Current
	end, {
		EnableChatInputBarConfigurationAutocompleteEnabledModule,
		T
	})
	ReactModule.useEffect(function()
		-- upvalues: EnableChatInputBarConfigurationAutocompleteEnabledModule (copy), UseResult (copy), UseRefResult (copy), HttpService (upval), ExpChatSharedModule (upval), ConstantsModule (upval), ExtendedStandardizedFields (upval)
		if not EnableChatInputBarConfigurationAutocompleteEnabledModule then
			UseResult()
			
			return
		end
		if UseRefResult.current == nil then
			local Guid = HttpService:GenerateGUID(false)
			UseRefResult.current = Guid
			ExpChatSharedModule.Analytics:TelemetryLogEvent(ExpChatSharedModule.Analytics.ExpChatPresetActionConfig, {
				event_type = ConstantsModule.Analytics.EventTypes.Show,
				component = ConstantsModule.Analytics.Components.AutocompleteDropdown,
				autocomplete_session_id = Guid
			}, ExtendedStandardizedFields)
			
			return
		end
	end, {
		EnableChatInputBarConfigurationAutocompleteEnabledModule,
		UseResult
	})
	ReactModule.useEffect(function()
		-- upvalues: UseResult (copy)
		return function()
			-- upvalues: UseResult (upval)
			UseResult()
		end
	end, { UseResult })
	
	return { recordPresetChosen = UseResult1 }
end