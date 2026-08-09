local authCommon = script:FindFirstAncestor("AuthCommon")
local roduxModule = require(authCommon.Parent.Rodux)
local countryCodeListModule = require(authCommon.Reducers.CountryCodeList)

return function() --[[ line: 8 ]]
	-- upvalues: roduxModule (ref), countryCodeListModule (ref)
	return roduxModule.combineReducers({ CountryCodeList = countryCodeListModule })
end