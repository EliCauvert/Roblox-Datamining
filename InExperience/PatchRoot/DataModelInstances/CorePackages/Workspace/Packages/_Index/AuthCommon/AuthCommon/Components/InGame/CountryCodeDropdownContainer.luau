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
local _ = require(authCommon.Common.Types)

return function(p0) --[[ line: 20 | named "CountryCodeDropdownContainer" ]]
	-- upvalues: useRoactService (ref), roactNetworking (ref), useDispatch (ref), apiFetchCountryCodesModule (ref), useSelector (ref), reactModule (ref), countryCodeDropdownViewModule (ref)
	local var5 = useRoactService(roactNetworking)
	local var6 = useDispatch()
	local position = p0.position
	local maxHeight = p0.maxHeight
	local dropdownVisible = p0.dropdownVisible
	local onCountryCodeSelected = p0.onCountryCodeSelected
	
	local _ = function(p1) --[[ line: 28 ]]
		-- upvalues: var6 (ref), apiFetchCountryCodesModule (copy)
		return var6(apiFetchCountryCodesModule.Fetch(p1))
	end
	
	local var7 = useSelector(function(p2) --[[ line: 32 ]]
		return p2.CountryCodeList
	end)
	reactModule.useEffect(function() --[[ line: 36 ]]
		-- upvalues: var5 (ref), var6 (ref), apiFetchCountryCodesModule (copy)
		var6(apiFetchCountryCodesModule.Fetch(var5)):catch(function() --[[ line: 37 ]] end)
	end, {})
	
	return reactModule.createElement(countryCodeDropdownViewModule, {
		dropdownVisible = dropdownVisible,
		countryCodeList = var7,
		onCountryCodeSelected = onCountryCodeSelected,
		maxHeight = maxHeight,
		position = position
	})
end