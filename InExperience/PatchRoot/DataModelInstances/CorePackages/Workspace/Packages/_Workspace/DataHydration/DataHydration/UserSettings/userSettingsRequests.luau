local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpModule = require(parent.Http)
local httpClientModule = require(parent.HttpClient)
local withCsrfRetryModule = require(dataHydration.withCsrfRetry)
local _ = require(script.Parent.UserSettingsStoreTypes)
local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise

local function _() --[[ line: 23 | named "settingsAndOptionsUrl" ]]
	-- upvalues: httpModule (ref)
	return `{httpModule.Url.APIS_URL}user-settings-api/v1/user-settings`
end

local function normalizeCachedUserSettings(value) --[[ line: 27 ]]
	if typeof(value) ~= "table" then
		return {}
	end
	local t = {}
	
	for i, v in value do
		t[i] = { currentValue = v }
	end
	return t
end

local _ = function() --[[ line: 38 | named "settingsUpdateUrl" ]]
	-- upvalues: httpModule (ref)
	return `{httpModule.Url.APIS_URL}user-settings-api/v1/user-settings`
end

return {
	fetchSettingsAndOptions = function(value) --[[ line: 42 ]]
		-- upvalues: httpClientModule (ref), fetch (ref), httpModule (ref), normalizeCachedUserSettings (ref), asPromise (ref)
		return asPromise(fetch({
			method = "GET",
			analyticsKey = "user-settings.settings-and-options.get",
			url = `{httpModule.Url.APIS_URL}user-settings-api/v1/user-settings`,
			network = if value then value.network else httpClientModule.createRequestInternalNetwork(),
			decode = function(p0) --[[ line: 49 ]]
				-- upvalues: normalizeCachedUserSettings (copy)
				return normalizeCachedUserSettings(p0)
			end
		}))
	end,
	postUserSettings = function(value, p1) --[[ line: 56 ]]
		-- upvalues: httpClientModule (ref), fetch (ref), httpModule (ref), withCsrfRetryModule (ref), asPromise (ref)
		return asPromise(fetch({
			method = "POST",
			analyticsKey = "user-settings.update.post",
			url = `{httpModule.Url.APIS_URL}user-settings-api/v1/user-settings`,
			body = value,
			network = withCsrfRetryModule(if p1 then p1.network else httpClientModule.createRequestInternalNetwork()),
			decode = function(_) --[[ line: 64 ]]
				-- upvalues: value (ref)
				return value
			end
		}))
	end
}