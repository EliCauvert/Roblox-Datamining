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

local function resolveLocalUserId(p0)
	-- upvalues: localUserIdStore (ref)
	return localUserIdStore.getCurrentUserId(p0)
end

return function(value)
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), userSettingsRequestsModule (ref), resolveLocalUserId (ref), localUserIdStore (ref), promiseModule (ref)
	local t = { network = (value or {}).network }
	local var7 = createDataCacheModule()
	local var8 = createDataResolverModule({
		supportsMultiGet = false,
		cache = var7,
		fetchFn = function(_, _)
			-- upvalues: userSettingsRequestsModule (copy), t (ref)
			return userSettingsRequestsModule.fetchSettingsAndOptions(t)
		end
	})
	
	local function _(p1, p2)
		-- upvalues: var7 (ref)
		var7.updateItem(p1, { accountTheme = { currentValue = p2 } })
	end
	
	return {
		getAndFetchUserSettings = function(value)
			-- upvalues: var8 (ref), resolveLocalUserId (copy)
			return var8.getAndFetchItem(resolveLocalUserId(value))
		end,
		getUserSettings = function(value)
			-- upvalues: var8 (ref), resolveLocalUserId (copy)
			return var8.getCachedItem(resolveLocalUserId(value))
		end,
		fetchUserSettings = function()
			-- upvalues: var8 (ref), resolveLocalUserId (copy)
			return var8.fetchItem(resolveLocalUserId(false))
		end,
		getAccountTheme = function(p3)
			-- upvalues: var8 (ref), resolveLocalUserId (copy)
			local var9 = var8.getCachedItem(resolveLocalUserId(p3)).data(p3)
			local accountTheme = var9 and var9.accountTheme
			
			return accountTheme and accountTheme.currentValue
		end,
		getAndFetchAccountTheme = function(p4)
			-- upvalues: var8 (ref), resolveLocalUserId (copy)
			local var11 = var8.getAndFetchItem(resolveLocalUserId(p4)).data(p4)
			local accountTheme = var11 and var11.accountTheme
			
			return accountTheme and accountTheme.currentValue
		end,
		getAccountThemeStatus = function(p5)
			-- upvalues: var8 (ref), resolveLocalUserId (copy)
			return var8.getCachedItem(resolveLocalUserId(p5)).status(p5)
		end,
		updateAccountTheme = function(p6)
			-- upvalues: localUserIdStore (copy), var8 (ref), resolveLocalUserId (copy), var7 (ref), userSettingsRequestsModule (copy), t (ref), promiseModule (copy)
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			local var14 = var8.getCachedItem(resolveLocalUserId(false)).data(false)
			local accountTheme = var14 and var14.accountTheme
			local currentValue = accountTheme and accountTheme.currentValue
			var7.updateItem(currentUserId, { accountTheme = { currentValue = p6 } })
			
			return userSettingsRequestsModule.postUserSettings({ accountTheme = p6 }, t):catch(function(p7)
				-- upvalues: localUserIdStore (copy), currentUserId (ref), promiseModule (copy), currentValue (ref), var7 (copy), var8 (copy), resolveLocalUserId (copy)
				if localUserIdStore.getCurrentUserId(false) ~= currentUserId then
					return promiseModule.reject(p7)
				elseif currentValue == nil then
					local _ = var8.fetchItem(resolveLocalUserId(false))
				else
					var7.updateItem(currentUserId, { accountTheme = { currentValue = currentValue } })
				end
				return promiseModule.reject(p7)
			end)
		end,
		clear = var8.clear,
		dispose = var8.dispose
	}
end