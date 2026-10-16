local AuthCommon = script:FindFirstAncestor("AuthCommon")
local Parent = AuthCommon.Parent
local RoduxModule = require(Parent.Rodux)
local CountryCodeListModule = require(AuthCommon.Reducers.CountryCodeList)
local FFlagUseSignalsForCountryCodeList = require(Parent.SharedFlags).FFlagUseSignalsForCountryCodeList

return function() --[[ Line: 10 ]]
	-- upvalues: RoduxModule (copy), FFlagUseSignalsForCountryCodeList (copy), CountryCodeListModule (copy)
	return RoduxModule.combineReducers({
		CountryCodeList = if FFlagUseSignalsForCountryCodeList then nil else CountryCodeListModule
	})
end