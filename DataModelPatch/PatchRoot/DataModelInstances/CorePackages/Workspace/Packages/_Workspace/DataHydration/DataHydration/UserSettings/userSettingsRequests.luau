local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local HttpModule = require(Parent.Http)
local HttpClientModule = require(Parent.HttpClient)
local WithCsrfRetryModule = require(DataHydration.withCsrfRetry)
local _ = require(script.Parent.UserSettingsStoreTypes)
local FetchFunction = HttpClientModule.fetch
local AsPromiseFunction = HttpClientModule.asPromise

local function _(): string
	-- upvalues: HttpModule (copy)
	return `{HttpModule.Url.APIS_URL}user-settings-api/v1/user-settings/settings-and-options`
end

local _ = function(): string
	-- upvalues: HttpModule (copy)
	return `{HttpModule.Url.APIS_URL}user-settings-api/v1/user-settings`
end

return {
	fetchSettingsAndOptions = function()
		-- upvalues: FetchFunction (copy), HttpModule (copy), HttpClientModule (copy), AsPromiseFunction (copy)
		return AsPromiseFunction((FetchFunction({
			method = "GET",
			analyticsKey = "user-settings.settings-and-options.get",
			url = `{HttpModule.Url.APIS_URL}user-settings-api/v1/user-settings/settings-and-options`,
			network = HttpClientModule.createRequestInternalNetwork(),
			decode = function(p1)
				return p1
			end
		})))
	end,
	postUserSettings = function(Body)
		-- upvalues: FetchFunction (copy), HttpModule (copy), WithCsrfRetryModule (copy), HttpClientModule (copy), AsPromiseFunction (copy)
		return AsPromiseFunction((FetchFunction({
			method = "POST",
			analyticsKey = "user-settings.update.post",
			url = `{HttpModule.Url.APIS_URL}user-settings-api/v1/user-settings`,
			body = Body,
			network = WithCsrfRetryModule(HttpClientModule.createRequestInternalNetwork()),
			decode = function(_)
				-- upvalues: Body (copy)
				return Body
			end
		})))
	end
}