local AuthCommon = script:FindFirstAncestor("AuthCommon")
local Parent = AuthCommon.Parent
local PromiseModule = require(Parent.Promise)
local PerformFetch = require(Parent.Http).PerformFetch
local GetCountryCodesModule = require(AuthCommon.Http.Requests.GetCountryCodes)
local CountryCodeModule = require(AuthCommon.Models.CountryCode)
local SetCountryCodeListModule = require(AuthCommon.Actions.SetCountryCodeList)
local ApiFetchCountryCodesModule = {
	_updateStoreWithCountryCodes = function(p1, p2)
		-- upvalues: CountryCodeModule (copy), SetCountryCodeListModule (copy), PromiseModule (copy)
		local FromJSONResults = {}
		
		for i, value in pairs(p2.responseBody) do
			FromJSONResults[i] = CountryCodeModule.fromJSON(value)
		end
		p1:dispatch(SetCountryCodeListModule(FromJSONResults))
		
		return PromiseModule.resolve()
	end
}

function ApiFetchCountryCodesModule.Fetch(p3)
	-- upvalues: PerformFetch (copy), GetCountryCodesModule (copy), ApiFetchCountryCodesModule (copy), PromiseModule (copy)
	return PerformFetch.Single("luaapp.countriesapi.countrycodes", function(p4)
		-- upvalues: GetCountryCodesModule (upval), p3 (copy), ApiFetchCountryCodesModule (upval), PromiseModule (upval)
		return GetCountryCodesModule(p3):andThen(function(Result)
			-- upvalues: ApiFetchCountryCodesModule (upval), p4 (copy), PromiseModule (upval)
			return if Result and Result.responseBody then ApiFetchCountryCodesModule._updateStoreWithCountryCodes(p4, Result) else PromiseModule.reject()
		end)
	end)
end

function ApiFetchCountryCodesModule.GetFetchingStatus(p3)
	-- upvalues: PerformFetch (copy)
	return PerformFetch.GetStatus(p3, "luaapp.countriesapi.countrycodes")
end

return ApiFetchCountryCodesModule