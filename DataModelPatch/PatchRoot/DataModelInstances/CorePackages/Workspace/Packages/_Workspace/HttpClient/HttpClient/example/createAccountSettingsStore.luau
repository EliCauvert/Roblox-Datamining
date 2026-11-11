local HttpClient = script:FindFirstAncestor("HttpClient")
local DataHydrationModule = require(HttpClient.Parent.Dev.DataHydration)
local Module = require(HttpClient)
local FetchFunction = Module.fetch
local AsPromiseFunction = Module.asPromise

local function _(p1, p2): string
	return `{p1}/account-settings/v1/settings/{p2}`
end

return function(p1)
	-- upvalues: DataHydrationModule (copy), FetchFunction (copy), AsPromiseFunction (copy)
	local P2 = p1 or {}
	local UrlBase = P2.urlBase or "https://apis.roblox.com"
	local Network = P2.network
	local DataCache = DataHydrationModule.createDataCache()
	local DataResolver = DataHydrationModule.createDataResolver({
		supportsMultiGet = false,
		cache = DataCache,
		fetchFn = function(p2, _)
			-- upvalues: FetchFunction (upval), UrlBase (copy), Network (copy), AsPromiseFunction (upval)
			return AsPromiseFunction((FetchFunction({
				method = "GET",
				analyticsKey = "account-settings.get",
				url = `{UrlBase}/account-settings/v1/settings/{p2}`,
				network = Network,
				decode = function(p3)
					return p3
				end
			})))
		end
	})
	
	return {
		getSettings = function(p2)
			-- upvalues: DataResolver (copy)
			return (DataResolver.getAndFetchItem(p2))
		end,
		updateSettings = function(p2, Body)
			-- upvalues: FetchFunction (upval), UrlBase (copy), Network (copy), AsPromiseFunction (upval), DataCache (copy)
			return AsPromiseFunction((FetchFunction({
				method = "PATCH",
				analyticsKey = "account-settings.patch",
				url = `{UrlBase}/account-settings/v1/settings/{p2}`,
				body = Body,
				network = Network,
				decode = function(p3)
					return p3
				end
			}))):andThen(function(Result)
				-- upvalues: DataCache (upval), p2 (copy)
				DataCache.updateItem(p2, Result)
				
				return Result
			end)
		end,
		clear = DataResolver.clear,
		dispose = DataResolver.dispose
	}
end