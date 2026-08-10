local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local reactModule = require(parent.React)
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local apiFetchCountryCodesModule = require(authCommon.Thunks.ApiFetchCountryCodes)
local countryCodeDropdownViewModule = require(authCommon.Components.InGame.CountryCodeDropdownView)
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local roactUtilsModule = require(parent.RoactUtils)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useSignalState = require(parent.SignalsReact).useSignalState
local fFlagUseSignalsForCountryCodeList = require(parent.SharedFlags).FFlagUseSignalsForCountryCodeList
local getCountryCodeListStoreModule = require(authCommon.Stores.GetCountryCodeListStore)
local _ = require(authCommon.Common.Types)

return function(p0) --[[ line: 23 | named "CountryCodeDropdownContainer" ]]
	-- upvalues: useRoactService (ref), roactNetworking (ref), useDispatch (ref), apiFetchCountryCodesModule (ref), fFlagUseSignalsForCountryCodeList (ref), useSignalState (ref), getCountryCodeListStoreModule (ref), useSelector (ref), reactModule (ref), countryCodeDropdownViewModule (ref)
	local var6 = useRoactService(roactNetworking)
	local var7 = useDispatch()
	local position = p0.position
	local maxHeight = p0.maxHeight
	local dropdownVisible = p0.dropdownVisible
	local onCountryCodeSelected = p0.onCountryCodeSelected
	
	local _ = function(p1) --[[ line: 31 ]]
		-- upvalues: var7 (ref), apiFetchCountryCodesModule (copy)
		return var7(apiFetchCountryCodesModule.Fetch(p1))
	end
	
	local var8 = if fFlagUseSignalsForCountryCodeList then useSignalState(getCountryCodeListStoreModule(false).getCountryCodeList) else useSelector(function(p2) --[[ line: 37 ]]
		return p2.CountryCodeList
	end)
	reactModule.useEffect(function() --[[ line: 41 ]]
		-- upvalues: var6 (ref), var7 (ref), apiFetchCountryCodesModule (copy)
		var7(apiFetchCountryCodesModule.Fetch(var6)):catch(function() --[[ line: 42 ]] end)
	end, {})
	
	return reactModule.createElement(countryCodeDropdownViewModule, {
		dropdownVisible = dropdownVisible,
		countryCodeList = var8,
		onCountryCodeSelected = onCountryCodeSelected,
		maxHeight = maxHeight,
		position = position
	})
end