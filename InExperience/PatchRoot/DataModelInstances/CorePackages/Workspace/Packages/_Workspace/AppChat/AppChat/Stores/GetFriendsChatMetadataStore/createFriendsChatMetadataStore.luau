local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local DataHydrationModule = require(Parent.DataHydration)
local _ = require(Parent.Signals)
local LocalUserIdStore = require(Parent.LocalUserIdStore).LocalUserIdStore
local NewResult = require(AppChat.Logger):new(script.Name)

local function resolveLocalUserId(p1) --[[ Line: 24 ]]
	-- upvalues: LocalUserIdStore (copy)
	return LocalUserIdStore.getCurrentUserId(p1)
end

return function() --[[ Line: 28 | Named "createFriendsChatMetadataStore" ]]
	-- upvalues: DataHydrationModule (copy), AppChatNetworkingModule (copy), NewResult (copy), resolveLocalUserId (copy), LocalUserIdStore (copy)
	local DataCache = DataHydrationModule.createDataCache()
	local DataResolver = DataHydrationModule.createDataResolver({
		supportsMultiGet = false,
		cache = DataCache,
		fetchFn = function(_) --[[ Line: 33 ]]
			-- upvalues: AppChatNetworkingModule (upval)
			return AppChatNetworkingModule.http.GetMetadata():andThen(function(Result) --[[ Line: 34 ]]
				return Result.responseBody
			end)
		end,
		logError = function(p1) --[[ Line: 38 ]]
			-- upvalues: NewResult (upval)
			NewResult:warning(`Failed to fetch Friends Chat metadata: {tostring(p1)}`)
		end
	})
	
	return {
		getFriendsChatMetadata = function(p1) --[[ Line: 43 ]]
			-- upvalues: DataResolver (copy), resolveLocalUserId (upval)
			return DataResolver.getAndFetchItem(resolveLocalUserId(p1))
		end,
		getCachedFriendsChatMetadata = function(p1) --[[ Line: 47 ]]
			-- upvalues: DataResolver (copy), resolveLocalUserId (upval)
			return DataResolver.getCachedItem(resolveLocalUserId(p1))
		end,
		fetchFriendsChatMetadata = function() --[[ Line: 51 ]]
			-- upvalues: DataResolver (copy), resolveLocalUserId (upval)
			return DataResolver.fetchItem(resolveLocalUserId(false))
		end,
		updateFriendsChatMetadata = function(p1) --[[ Line: 55 ]]
			-- upvalues: DataCache (copy), LocalUserIdStore (upval)
			DataCache.replaceItem(LocalUserIdStore.getCurrentUserId(false), p1)
		end,
		clear = DataResolver.clear,
		dispose = DataResolver.dispose
	}
end