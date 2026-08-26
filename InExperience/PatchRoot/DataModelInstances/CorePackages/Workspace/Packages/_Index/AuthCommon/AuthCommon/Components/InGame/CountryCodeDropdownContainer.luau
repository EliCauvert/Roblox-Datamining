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

return function(p1)
	-- upvalues: useRoactService (ref), roactNetworking (ref), useDispatch (ref), apiFetchCountryCodesModule (ref), fFlagUseSignalsForCountryCodeList (ref), useSignalState (ref), getCountryCodeListStoreModule (ref), useSelector (ref), reactModule (ref), countryCodeDropdownViewModule (ref)
	local var1 = useRoactService(roactNetworking)
	local var2 = useDispatch()
	local position = p1.position
	local maxHeight = p1.maxHeight
	local dropdownVisible = p1.dropdownVisible
	local onCountryCodeSelected = p1.onCountryCodeSelected
	
	local _ = function(p2)
		-- upvalues: var2 (ref), apiFetchCountryCodesModule (copy)
		return var2(apiFetchCountryCodesModule.Fetch(p2))
	end
	
	local var3 = if fFlagUseSignalsForCountryCodeList then useSignalState(getCountryCodeListStoreModule(false).getCountryCodeList) else useSelector(function(p2)
		return p2.CountryCodeList
	end)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var2 (ref), apiFetchCountryCodesModule (copy)
		var2(apiFetchCountryCodesModule.Fetch(var1)):catch(function() end)
	end, {})
	
	return reactModule.createElement(countryCodeDropdownViewModule, {
		dropdownVisible = dropdownVisible,
		countryCodeList = var3,
		onCountryCodeSelected = onCountryCodeSelected,
		maxHeight = maxHeight,
		position = position
	})
end