local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpModule = require(parent.Http)
local httpClientModule = require(parent.HttpClient)
local withCsrfRetryModule = require(dataHydration.withCsrfRetry)
local _ = require(script.Parent.UserSettingsStoreTypes)
local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise
local fFlagUserSettingsFetchCachedEndpointModule = require(script.Parent.FFlagUserSettingsFetchCachedEndpoint)

local function _() --[[ line: 26 | named "settingsAndOptionsUrl" ]]
	-- upvalues: fFlagUserSettingsFetchCachedEndpointModule (ref), httpModule (ref)
	return `{httpModule.Url.APIS_URL}{if fFlagUserSettingsFetchCachedEndpointModule then "user-settings-api/v1/user-settings" else "user-settings-api/v1/user-settings/settings-and-options"}`
end

local function normalizeCachedUserSettings(value) --[[ line: 31 ]]
	if typeof(value) ~= "table" then
		return {}
	end
	local t = {}
	
	for i, v in value do
		t[i] = { currentValue = v }
	end
	return t
end

local _ = function() --[[ line: 42 | named "settingsUpdateUrl" ]]
	-- upvalues: httpModule (ref)
	return `{httpModule.Url.APIS_URL}user-settings-api/v1/user-settings`
end

return {
	fetchSettingsAndOptions = function(value) --[[ line: 46 ]]
		-- upvalues: httpClientModule (ref), fetch (ref), fFlagUserSettingsFetchCachedEndpointModule (ref), httpModule (ref), normalizeCachedUserSettings (ref), asPromise (ref)
		return asPromise(fetch({
			method = "GET",
			analyticsKey = "user-settings.settings-and-options.get",
			url = `{httpModule.Url.APIS_URL}{if fFlagUserSettingsFetchCachedEndpointModule then "user-settings-api/v1/user-settings" else "user-settings-api/v1/user-settings/settings-and-options"}`,
			network = if value then value.network else httpClientModule.createRequestInternalNetwork(),
			decode = function(p0) --[[ line: 53 ]]
				-- upvalues: fFlagUserSettingsFetchCachedEndpointModule (copy), normalizeCachedUserSettings (copy)
				return if fFlagUserSettingsFetchCachedEndpointModule then normalizeCachedUserSettings(p0) else p0
			end
		}))
	end,
	postUserSettings = function(value, p1) --[[ line: 63 ]]
		-- upvalues: httpClientModule (ref), fetch (ref), httpModule (ref), withCsrfRetryModule (ref), asPromise (ref)
		return asPromise(fetch({
			method = "POST",
			analyticsKey = "user-settings.update.post",
			url = `{httpModule.Url.APIS_URL}user-settings-api/v1/user-settings`,
			body = value,
			network = withCsrfRetryModule(if p1 then p1.network else httpClientModule.createRequestInternalNetwork()),
			decode = function(_) --[[ line: 71 ]]
				-- upvalues: value (ref)
				return value
			end
		}))
	end
}