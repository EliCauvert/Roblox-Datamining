local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local _ = require(parent.Signals)
local promiseModule = require(parent.Promise)
local _ = require(parent.HttpClient)
local localUserIdStore = require(parent.LocalUserIdStore).LocalUserIdStore
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local userSettingsRequestsModule = require(script.Parent.userSettingsRequests)
local _ = require(script.Parent.UserSettingsStoreTypes)

local function resolveLocalUserId(p1)
	-- upvalues: localUserIdStore (ref)
	return localUserIdStore.getCurrentUserId(p1)
end

return function(value)
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), userSettingsRequestsModule (ref), resolveLocalUserId (ref), localUserIdStore (ref), promiseModule (ref)
	local t = { network = (value or {}).network }
	local var1 = createDataCacheModule()
	local var2 = createDataResolverModule({
		supportsMultiGet = false,
		cache = var1,
		fetchFn = function(_, _)
			-- upvalues: userSettingsRequestsModule (copy), t (ref)
			return userSettingsRequestsModule.fetchSettingsAndOptions(t)
		end
	})
	
	local function _(p1, p2)
		-- upvalues: var1 (ref)
		var1.updateItem(p1, { accountTheme = { currentValue = p2 } })
	end
	
	return {
		getAndFetchUserSettings = function(value)
			-- upvalues: var2 (ref), resolveLocalUserId (copy)
			return var2.getAndFetchItem(resolveLocalUserId(value))
		end,
		getUserSettings = function(value)
			-- upvalues: var2 (ref), resolveLocalUserId (copy)
			return var2.getCachedItem(resolveLocalUserId(value))
		end,
		fetchUserSettings = function()
			-- upvalues: var2 (ref), resolveLocalUserId (copy)
			return var2.fetchItem(resolveLocalUserId(false))
		end,
		getAccountTheme = function(p1)
			-- upvalues: var2 (ref), resolveLocalUserId (copy)
			local var3 = var2.getCachedItem(resolveLocalUserId(p1)).data(p1)
			local accountTheme = var3 and var3.accountTheme
			
			return accountTheme and accountTheme.currentValue
		end,
		getAndFetchAccountTheme = function(p1)
			-- upvalues: var2 (ref), resolveLocalUserId (copy)
			local var3 = var2.getAndFetchItem(resolveLocalUserId(p1)).data(p1)
			local accountTheme = var3 and var3.accountTheme
			
			return accountTheme and accountTheme.currentValue
		end,
		getAccountThemeStatus = function(p1)
			-- upvalues: var2 (ref), resolveLocalUserId (copy)
			return var2.getCachedItem(resolveLocalUserId(p1)).status(p1)
		end,
		updateAccountTheme = function(p1)
			-- upvalues: localUserIdStore (copy), var2 (ref), resolveLocalUserId (copy), var1 (ref), userSettingsRequestsModule (copy), t (ref), promiseModule (copy)
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			local var3 = var2.getCachedItem(resolveLocalUserId(false)).data(false)
			local accountTheme = var3 and var3.accountTheme
			local currentValue = accountTheme and accountTheme.currentValue
			var1.updateItem(currentUserId, { accountTheme = { currentValue = p1 } })
			
			return userSettingsRequestsModule.postUserSettings({ accountTheme = p1 }, t):catch(function(p2)
				-- upvalues: localUserIdStore (copy), currentUserId (ref), promiseModule (copy), currentValue (ref), var1 (copy), var2 (copy), resolveLocalUserId (copy)
				if localUserIdStore.getCurrentUserId(false) ~= currentUserId then
					return promiseModule.reject(p2)
				elseif currentValue == nil then
					local _ = var2.fetchItem(resolveLocalUserId(false))
				else
					var1.updateItem(currentUserId, { accountTheme = { currentValue = currentValue } })
				end
				return promiseModule.reject(p2)
			end)
		end,
		clear = var2.clear,
		dispose = var2.dispose
	}
end