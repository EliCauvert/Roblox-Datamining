local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local _ = require(Parent.Signals)
local LocalUserIdStore = require(Parent.UserLib).Stores.LocalUserIdStore
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local UserSettingsRequestsModule = require(script.Parent.userSettingsRequests)
local _ = require(script.Parent.UserSettingsStoreTypes)

local function resolveLocalUserId(p1)
	-- upvalues: LocalUserIdStore (copy)
	return LocalUserIdStore.getCurrentUserId(p1)
end

return function()
	-- upvalues: CreateDataCacheModule (copy), CreateDataResolverModule (copy), UserSettingsRequestsModule (copy), resolveLocalUserId (copy), LocalUserIdStore (copy)
	local DataCacheModule = CreateDataCacheModule()
	local DataResolverModule = CreateDataResolverModule({
		supportsMultiGet = false,
		cache = DataCacheModule,
		fetchFn = function(_, _)
			-- upvalues: UserSettingsRequestsModule (upval)
			return UserSettingsRequestsModule.fetchSettingsAndOptions()
		end
	})
	
	return {
		getAndFetchUserSettings = function(p1)
			-- upvalues: DataResolverModule (copy), resolveLocalUserId (upval)
			return DataResolverModule.getAndFetchItem(resolveLocalUserId(p1))
		end,
		getUserSettings = function(p1)
			-- upvalues: DataResolverModule (copy), resolveLocalUserId (upval)
			return DataResolverModule.getCachedItem(resolveLocalUserId(p1))
		end,
		fetchUserSettings = function()
			-- upvalues: DataResolverModule (copy), resolveLocalUserId (upval)
			return DataResolverModule.fetchItem(resolveLocalUserId(false))
		end,
		getAccountTheme = function(p1)
			-- upvalues: DataResolverModule (copy), resolveLocalUserId (upval)
			local DataResult = DataResolverModule.getCachedItem(resolveLocalUserId(p1)).data(p1)
			local AccountTheme = DataResult and DataResult.accountTheme
			
			return AccountTheme and AccountTheme.currentValue
		end,
		getAndFetchAccountTheme = function(p1)
			-- upvalues: DataResolverModule (copy), resolveLocalUserId (upval)
			local DataResult = DataResolverModule.getAndFetchItem(resolveLocalUserId(p1)).data(p1)
			local AccountTheme = DataResult and DataResult.accountTheme
			
			return AccountTheme and AccountTheme.currentValue
		end,
		updateAccountTheme = function(AccountTheme)
			-- upvalues: UserSettingsRequestsModule (upval), LocalUserIdStore (upval), DataCacheModule (copy)
			return UserSettingsRequestsModule.postUserSettings({ accountTheme = AccountTheme }):andThen(function()
				-- upvalues: LocalUserIdStore (upval), DataCacheModule (upval), AccountTheme (copy)
				DataCacheModule.updateItem(LocalUserIdStore.getCurrentUserId(false), { accountTheme = { currentValue = AccountTheme } })
			end)
		end,
		clear = DataResolverModule.clear,
		dispose = DataResolverModule.dispose
	}
end