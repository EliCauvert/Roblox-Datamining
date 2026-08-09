local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local promiseModule = require(parent.Promise)
local performFetch = require(parent.Http).PerformFetch
local getCountryCodesModule = require(authCommon.Http.Requests.GetCountryCodes)
local countryCodeModule = require(authCommon.Models.CountryCode)
local setCountryCodeListModule = require(authCommon.Actions.SetCountryCodeList)
local t = {
	_updateStoreWithCountryCodes = function(p0, p1) --[[ line: 13 ]]
		-- upvalues: countryCodeModule (ref), setCountryCodeListModule (ref), promiseModule (ref)
		local t = {}
		
		for i, v in pairs(p1.responseBody) do
			t[i] = countryCodeModule.fromJSON(v)
		end
		p0:dispatch(setCountryCodeListModule(t))
		
		return promiseModule.resolve()
	end
}

function t.Fetch(p2) --[[ line: 22 ]]
	-- upvalues: performFetch (ref), getCountryCodesModule (ref), t (ref), promiseModule (ref)
	return performFetch.Single("luaapp.countriesapi.countrycodes", function(p3) --[[ line: 23 ]]
		-- upvalues: getCountryCodesModule (copy), p2 (ref), t (copy), promiseModule (copy)
		return getCountryCodesModule(p2):andThen(function(p4) --[[ line: 24 ]]
			-- upvalues: t (copy), p3 (ref), promiseModule (copy)
			return if p4 and p4.responseBody then t._updateStoreWithCountryCodes(p3, p4) else promiseModule.reject()
		end)
	end)
end

function t.GetFetchingStatus(p5) --[[ line: 34 ]]
	-- upvalues: performFetch (ref)
	return performFetch.GetStatus(p5, "luaapp.countriesapi.countrycodes")
end

return t