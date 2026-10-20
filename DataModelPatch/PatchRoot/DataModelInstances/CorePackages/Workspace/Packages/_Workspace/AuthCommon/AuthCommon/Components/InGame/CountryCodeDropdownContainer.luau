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
local _ = require(AuthCommon.Common.Types)

return function(p1)
	-- upvalues: UseRoactServiceFunction (copy), RoactNetworking (copy), UseDispatchFunction (copy), ApiFetchCountryCodesModule (copy), UseSelectorFunction (copy), ReactModule (copy), CountryCodeDropdownViewModule (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseDispatchResult = UseDispatchFunction()
	local Position = p1.position
	local MaxHeight = p1.maxHeight
	local DropdownVisible = p1.dropdownVisible
	local OnCountryCodeSelected = p1.onCountryCodeSelected
	
	local function _(p2)
		-- upvalues: UseDispatchResult (copy), ApiFetchCountryCodesModule (upval)
		return UseDispatchResult(ApiFetchCountryCodesModule.Fetch(p2))
	end
	
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.CountryCodeList
	end)
	ReactModule.useEffect(function()
		-- upvalues: UseRoactServiceResult (copy), UseDispatchResult (copy), ApiFetchCountryCodesModule (upval)
		UseDispatchResult(ApiFetchCountryCodesModule.Fetch(UseRoactServiceResult)):catch(function() end)
	end, {})
	
	return ReactModule.createElement(CountryCodeDropdownViewModule, {
		dropdownVisible = DropdownVisible,
		countryCodeList = UseSelectorResult,
		onCountryCodeSelected = OnCountryCodeSelected,
		maxHeight = MaxHeight,
		position = Position
	})
end