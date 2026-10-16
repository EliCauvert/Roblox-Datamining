local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local _ = require(Parent.Signals)
local PromiseModule = require(Parent.Promise)
local _ = require(Parent.HttpClient)
local LocalUserIdStore = require(Parent.LocalUserIdStore).LocalUserIdStore
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local UserSettingsRequestsModule = require(script.Parent.userSettingsRequests)
local _ = require(script.Parent.UserSettingsStoreTypes)

local function resolveLocalUserId(p1) --[[ Line: 29 ]]
	-- upvalues: LocalUserIdStore (copy)
	return LocalUserIdStore.getCurrentUserId(p1)
end

return function(p1) --[[ Line: 33 | Named "createUserSettingsStore" ]]
	-- upvalues: CreateDataCacheModule (copy), CreateDataResolverModule (copy), UserSettingsRequestsModule (copy), resolveLocalUserId (copy), LocalUserIdStore (copy), PromiseModule (copy)
	local config = { network = (p1 or {}).network }
	local DataCacheModule = CreateDataCacheModule()
	local DataResolverModule = CreateDataResolverModule({
		supportsMultiGet = false,
		cache = DataCacheModule,
		fetchFn = function(_, _) --[[ Line: 41 ]]
			-- upvalues: UserSettingsRequestsModule (upval), config (copy)
			return UserSettingsRequestsModule.fetchSettingsAndOptions(config)
		end
	})
	
	local function _(p2, CurrentValue) --[[ Line: 74 | Named "writeAccountThemeToCache" ]]
		-- upvalues: DataCacheModule (copy)
		DataCacheModule.updateItem(p2, { accountTheme = { currentValue = CurrentValue } })
	end
	
	return {
		getAndFetchUserSettings = function(p2) --[[ Line: 46 ]]
			-- upvalues: DataResolverModule (copy), resolveLocalUserId (upval)
			return DataResolverModule.getAndFetchItem(resolveLocalUserId(p2))
		end,
		getUserSettings = function(p2) --[[ Line: 50 ]]
			-- upvalues: DataResolverModule (copy), resolveLocalUserId (upval)
			return DataResolverModule.getCachedItem(resolveLocalUserId(p2))
		end,
		fetchUserSettings = function() --[[ Line: 54 ]]
			-- upvalues: DataResolverModule (copy), resolveLocalUserId (upval)
			return DataResolverModule.fetchItem(resolveLocalUserId(false))
		end,
		getAccountTheme = function(p2) --[[ Line: 58 ]]
			-- upvalues: DataResolverModule (copy), resolveLocalUserId (upval)
			local DataResult = DataResolverModule.getCachedItem(resolveLocalUserId(p2)).data(p2)
			local AccountTheme = DataResult and DataResult.accountTheme
			
			return AccountTheme and AccountTheme.currentValue
		end,
		getAndFetchAccountTheme = function(p2) --[[ Line: 64 ]]
			-- upvalues: DataResolverModule (copy), resolveLocalUserId (upval)
			local DataResult = DataResolverModule.getAndFetchItem(resolveLocalUserId(p2)).data(p2)
			local AccountTheme = DataResult and DataResult.accountTheme
			
			return AccountTheme and AccountTheme.currentValue
		end,
		getAccountThemeStatus = function(p2) --[[ Line: 70 ]]
			-- upvalues: DataResolverModule (copy), resolveLocalUserId (upval)
			return DataResolverModule.getCachedItem(resolveLocalUserId(p2)).status(p2)
		end,
		updateAccountTheme = function(AccountTheme) --[[ Line: 82 ]]
			-- upvalues: LocalUserIdStore (upval), DataResolverModule (copy), resolveLocalUserId (upval), DataCacheModule (copy), UserSettingsRequestsModule (upval), config (copy), PromiseModule (upval)
			local CurrentUserId = LocalUserIdStore.getCurrentUserId(false)
			local DataResult = DataResolverModule.getCachedItem(resolveLocalUserId(false)).data(false)
			local AccountTheme1 = DataResult and DataResult.accountTheme
			local CurrentValue = AccountTheme1 and AccountTheme1.currentValue
			DataCacheModule.updateItem(CurrentUserId, { accountTheme = { currentValue = AccountTheme } })
			
			return UserSettingsRequestsModule.postUserSettings({ accountTheme = AccountTheme }, config):catch(function(Err) --[[ Line: 92 ]]
				-- upvalues: LocalUserIdStore (upval), CurrentUserId (copy), PromiseModule (upval), CurrentValue (copy), DataCacheModule (upval), DataResolverModule (upval), resolveLocalUserId (upval)
				if LocalUserIdStore.getCurrentUserId(false) ~= CurrentUserId then
					return PromiseModule.reject(Err)
				end
				if CurrentValue == nil then
					local _ = DataResolverModule.fetchItem(resolveLocalUserId(false))
				else
					DataCacheModule.updateItem(CurrentUserId, { accountTheme = { currentValue = CurrentValue } })
				end
				return PromiseModule.reject(Err)
			end)
		end,
		clear = DataResolverModule.clear,
		dispose = DataResolverModule.dispose
	}
end