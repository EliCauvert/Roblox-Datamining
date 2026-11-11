local AuthCommon = script:FindFirstAncestor("AuthCommon")
local RoduxModule = require(AuthCommon.Parent.Rodux)
local CountryCodeListModule = require(AuthCommon.Reducers.CountryCodeList)

return function()
	-- upvalues: RoduxModule (copy), CountryCodeListModule (copy)
	return RoduxModule.combineReducers({ CountryCodeList = CountryCodeListModule })
end