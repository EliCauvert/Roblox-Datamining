local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local DataHydrationModule = require(Parent.DataHydration)
local _ = require(Parent.Signals)
local LocalUserIdStore = require(Parent.LocalUserIdStore).LocalUserIdStore
local NewResult = require(AppChat.Logger):new(script.Name)

local function resolveLocalUserId(p1)
	-- upvalues: LocalUserIdStore (copy)
	return LocalUserIdStore.getCurrentUserId(p1)
end

return function()
	-- upvalues: DataHydrationModule (copy), AppChatNetworkingModule (copy), NewResult (copy), resolveLocalUserId (copy), LocalUserIdStore (copy)
	local DataCache = DataHydrationModule.createDataCache()
	local DataResolver = DataHydrationModule.createDataResolver({
		supportsMultiGet = false,
		cache = DataCache,
		fetchFn = function(_)
			-- upvalues: AppChatNetworkingModule (upval)
			return AppChatNetworkingModule.http.GetMetadata():andThen(function(Result)
				return Result.responseBody
			end)
		end,
		logError = function(p1)
			-- upvalues: NewResult (upval)
			NewResult:warning(`Failed to fetch Friends Chat metadata: {tostring(p1)}`)
		end
	})
	
	return {
		getFriendsChatMetadata = function(p1)
			-- upvalues: DataResolver (copy), resolveLocalUserId (upval)
			return DataResolver.getAndFetchItem(resolveLocalUserId(p1))
		end,
		getCachedFriendsChatMetadata = function(p1)
			-- upvalues: DataResolver (copy), resolveLocalUserId (upval)
			return DataResolver.getCachedItem(resolveLocalUserId(p1))
		end,
		fetchFriendsChatMetadata = function()
			-- upvalues: DataResolver (copy), resolveLocalUserId (upval)
			return DataResolver.fetchItem(resolveLocalUserId(false))
		end,
		updateFriendsChatMetadata = function(p1)
			-- upvalues: DataCache (copy), LocalUserIdStore (upval)
			DataCache.replaceItem(LocalUserIdStore.getCurrentUserId(false), p1)
		end,
		clear = DataResolver.clear,
		dispose = DataResolver.dispose
	}
end