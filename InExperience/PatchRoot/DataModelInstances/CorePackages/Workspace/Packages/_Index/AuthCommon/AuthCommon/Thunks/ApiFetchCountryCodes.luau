local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local promiseModule = require(parent.Promise)
local performFetch = require(parent.Http).PerformFetch
local getCountryCodesModule = require(authCommon.Http.Requests.GetCountryCodes)
local countryCodeModule = require(authCommon.Models.CountryCode)
local setCountryCodeListModule = require(authCommon.Actions.SetCountryCodeList)
local fFlagUseSignalsForCountryCodeList = require(parent.SharedFlags).FFlagUseSignalsForCountryCodeList
local getCountryCodeListStoreModule = require(authCommon.Stores.GetCountryCodeListStore)
local t = {
	_updateStoreWithCountryCodes = function(p0, p1) --[[ line: 15 ]]
		-- upvalues: countryCodeModule (ref), fFlagUseSignalsForCountryCodeList (ref), getCountryCodeListStoreModule (ref), setCountryCodeListModule (ref), promiseModule (ref)
		local t = {}
		
		for i, v in pairs(p1.responseBody) do
			t[i] = countryCodeModule.fromJSON(v)
		end
		if fFlagUseSignalsForCountryCodeList then
			getCountryCodeListStoreModule(false).setCountryCodeList(t)
		else
			p0:dispatch(setCountryCodeListModule(t))
		end
		return promiseModule.resolve()
	end
}

function t.Fetch(p2) --[[ line: 28 ]]
	-- upvalues: performFetch (ref), getCountryCodesModule (ref), t (ref), promiseModule (ref)
	return performFetch.Single("luaapp.countriesapi.countrycodes", function(p3) --[[ line: 29 ]]
		-- upvalues: getCountryCodesModule (copy), p2 (ref), t (copy), promiseModule (copy)
		return getCountryCodesModule(p2):andThen(function(p4) --[[ line: 30 ]]
			-- upvalues: t (copy), p3 (ref), promiseModule (copy)
			return if p4 and p4.responseBody then t._updateStoreWithCountryCodes(p3, p4) else promiseModule.reject()
		end)
	end)
end

function t.GetFetchingStatus(p5) --[[ line: 40 ]]
	-- upvalues: performFetch (ref)
	return performFetch.GetStatus(p5, "luaapp.countriesapi.countrycodes")
end

return t