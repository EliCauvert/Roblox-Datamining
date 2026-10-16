local AuthCommon = script:FindFirstAncestor("AuthCommon")
local Parent = AuthCommon.Parent
local ReactModule = require(Parent.React)
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local ApiFetchCountryCodesModule = require(AuthCommon.Thunks.ApiFetchCountryCodes)
local CountryCodeDropdownViewModule = require(AuthCommon.Components.InGame.CountryCodeDropdownView)
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactUtilsModule = require(Parent.RoactUtils)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local FFlagUseSignalsForCountryCodeList = require(Parent.SharedFlags).FFlagUseSignalsForCountryCodeList
local GetCountryCodeListStoreModule = require(AuthCommon.Stores.GetCountryCodeListStore)
local _ = require(AuthCommon.Common.Types)

return function(p1) --[[ Line: 23 | Named "CountryCodeDropdownContainer" ]]
	-- upvalues: UseRoactServiceFunction (copy), RoactNetworking (copy), UseDispatchFunction (copy), ApiFetchCountryCodesModule (copy), FFlagUseSignalsForCountryCodeList (copy), UseSignalStateFunction (copy), GetCountryCodeListStoreModule (copy), UseSelectorFunction (copy), ReactModule (copy), CountryCodeDropdownViewModule (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseDispatchResult = UseDispatchFunction()
	local Position = p1.position
	local MaxHeight = p1.maxHeight
	local DropdownVisible = p1.dropdownVisible
	local OnCountryCodeSelected = p1.onCountryCodeSelected
	
	local function _(p2) --[[ Line: 31 ]]
		-- upvalues: UseDispatchResult (copy), ApiFetchCountryCodesModule (upval)
		return UseDispatchResult(ApiFetchCountryCodesModule.Fetch(p2))
	end
	
	local UseSignalStateResult = if FFlagUseSignalsForCountryCodeList then UseSignalStateFunction(GetCountryCodeListStoreModule(false).getCountryCodeList) else UseSelectorFunction(function(p2) --[[ Line: 37 ]]
		return p2.CountryCodeList
	end)
	ReactModule.useEffect(function() --[[ Line: 41 ]]
		-- upvalues: UseRoactServiceResult (copy), UseDispatchResult (copy), ApiFetchCountryCodesModule (upval)
		UseDispatchResult(ApiFetchCountryCodesModule.Fetch(UseRoactServiceResult)):catch(function() --[[ Line: 42 ]] end)
	end, {})
	
	return ReactModule.createElement(CountryCodeDropdownViewModule, {
		dropdownVisible = DropdownVisible,
		countryCodeList = UseSignalStateResult,
		onCountryCodeSelected = OnCountryCodeSelected,
		maxHeight = MaxHeight,
		position = Position
	})
end