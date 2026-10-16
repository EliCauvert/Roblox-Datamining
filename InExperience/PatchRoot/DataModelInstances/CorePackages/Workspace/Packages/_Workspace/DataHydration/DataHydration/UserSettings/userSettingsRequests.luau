local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local HttpModule = require(Parent.Http)
local HttpClientModule = require(Parent.HttpClient)
local WithCsrfRetryModule = require(DataHydration.withCsrfRetry)
local _ = require(script.Parent.UserSettingsStoreTypes)
local FetchFunction = HttpClientModule.fetch
local AsPromiseFunction = HttpClientModule.asPromise

local function _(): string --[[ Line: 23 | Named "settingsAndOptionsUrl" ]]
	-- upvalues: HttpModule (copy)
	return `{HttpModule.Url.APIS_URL}user-settings-api/v1/user-settings`
end

local function normalizeCachedUserSettings(CurrentValues) --[[ Line: 27 ]]
	if typeof(CurrentValues) ~= "table" then
		return {}
	end
	local t = {}
	
	for i, currentValue in CurrentValues do
		t[i] = { currentValue = currentValue }
	end
	return t
end

local _ = function(): string --[[ Line: 38 | Named "settingsUpdateUrl" ]]
	-- upvalues: HttpModule (copy)
	return `{HttpModule.Url.APIS_URL}user-settings-api/v1/user-settings`
end

return {
	fetchSettingsAndOptions = function(p1) --[[ Line: 42 ]]
		-- upvalues: HttpClientModule (copy), FetchFunction (copy), HttpModule (copy), normalizeCachedUserSettings (copy), AsPromiseFunction (copy)
		return AsPromiseFunction((FetchFunction({
			method = "GET",
			analyticsKey = "user-settings.settings-and-options.get",
			url = `{HttpModule.Url.APIS_URL}user-settings-api/v1/user-settings`,
			network = p1 and p1.network or HttpClientModule.createRequestInternalNetwork(),
			decode = function(p2) --[[ Line: 49 ]]
				-- upvalues: normalizeCachedUserSettings (upval)
				return (normalizeCachedUserSettings(p2))
			end
		})))
	end,
	postUserSettings = function(Body, p1) --[[ Line: 56 ]]
		-- upvalues: HttpClientModule (copy), FetchFunction (copy), HttpModule (copy), WithCsrfRetryModule (copy), AsPromiseFunction (copy)
		return AsPromiseFunction((FetchFunction({
			method = "POST",
			analyticsKey = "user-settings.update.post",
			url = `{HttpModule.Url.APIS_URL}user-settings-api/v1/user-settings`,
			body = Body,
			network = WithCsrfRetryModule(p1 and p1.network or HttpClientModule.createRequestInternalNetwork()),
			decode = function(_) --[[ Line: 64 ]]
				-- upvalues: Body (copy)
				return Body
			end
		})))
	end
}