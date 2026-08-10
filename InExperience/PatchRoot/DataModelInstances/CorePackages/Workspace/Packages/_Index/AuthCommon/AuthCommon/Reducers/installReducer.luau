local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local roduxModule = require(parent.Rodux)
local countryCodeListModule = require(authCommon.Reducers.CountryCodeList)
local fFlagUseSignalsForCountryCodeList = require(parent.SharedFlags).FFlagUseSignalsForCountryCodeList

return function() --[[ line: 10 ]]
	-- upvalues: roduxModule (ref), fFlagUseSignalsForCountryCodeList (ref), countryCodeListModule (ref)
	return roduxModule.combineReducers({
		CountryCodeList = if fFlagUseSignalsForCountryCodeList then nil else countryCodeListModule
	})
end