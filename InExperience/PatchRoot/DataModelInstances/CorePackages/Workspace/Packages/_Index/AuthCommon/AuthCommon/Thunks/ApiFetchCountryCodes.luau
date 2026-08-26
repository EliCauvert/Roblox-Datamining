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
	_updateStoreWithCountryCodes = function(p1, p2)
		-- upvalues: countryCodeModule (ref), fFlagUseSignalsForCountryCodeList (ref), getCountryCodeListStoreModule (ref), setCountryCodeListModule (ref), promiseModule (ref)
		local t = {}
		
		for i, v in pairs(p2.responseBody) do
			t[i] = countryCodeModule.fromJSON(v)
		end
		if fFlagUseSignalsForCountryCodeList then
			getCountryCodeListStoreModule(false).setCountryCodeList(t)
		else
			p1:dispatch(setCountryCodeListModule(t))
		end
		return promiseModule.resolve()
	end
}

function t.Fetch(p3)
	-- upvalues: performFetch (ref), getCountryCodesModule (ref), t (ref), promiseModule (ref)
	return performFetch.Single("luaapp.countriesapi.countrycodes", function(p4)
		-- upvalues: getCountryCodesModule (copy), p3 (ref), t (copy), promiseModule (copy)
		return getCountryCodesModule(p3):andThen(function(p5)
			-- upvalues: t (copy), p4 (ref), promiseModule (copy)
			return if p5 and p5.responseBody then t._updateStoreWithCountryCodes(p4, p5) else promiseModule.reject()
		end)
	end)
end

function t.GetFetchingStatus(p3)
	-- upvalues: performFetch (ref)
	return performFetch.GetStatus(p3, "luaapp.countriesapi.countrycodes")
end

return t