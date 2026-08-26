local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local appChatNetworkingModule = require(parent.AppChatNetworking)
local dataHydrationModule = require(parent.DataHydration)
local _ = require(parent.Signals)
local localUserIdStore = require(parent.LocalUserIdStore).LocalUserIdStore
local name = require(appChat.Logger):new(script.Name)

local function resolveLocalUserId(p1)
	-- upvalues: localUserIdStore (ref)
	return localUserIdStore.getCurrentUserId(p1)
end

return function()
	-- upvalues: dataHydrationModule (ref), appChatNetworkingModule (ref), name (ref), resolveLocalUserId (ref), localUserIdStore (ref)
	local var1 = dataHydrationModule.createDataCache()
	local var2 = dataHydrationModule.createDataResolver({
		supportsMultiGet = false,
		cache = var1,
		fetchFn = function(_)
			-- upvalues: appChatNetworkingModule (copy)
			return appChatNetworkingModule.http.GetMetadata():andThen(function(p1)
				return p1.responseBody
			end)
		end,
		logError = function(p1)
			-- upvalues: name (copy)
			name:warning(`Failed to fetch Friends Chat metadata: {tostring(p1)}`)
		end
	})
	
	return {
		getFriendsChatMetadata = function(p1)
			-- upvalues: var2 (ref), resolveLocalUserId (copy)
			return var2.getAndFetchItem(resolveLocalUserId(p1))
		end,
		getCachedFriendsChatMetadata = function(p1)
			-- upvalues: var2 (ref), resolveLocalUserId (copy)
			return var2.getCachedItem(resolveLocalUserId(p1))
		end,
		fetchFriendsChatMetadata = function()
			-- upvalues: var2 (ref), resolveLocalUserId (copy)
			return var2.fetchItem(resolveLocalUserId(false))
		end,
		updateFriendsChatMetadata = function(p1)
			-- upvalues: var1 (ref), localUserIdStore (copy)
			var1.replaceItem(localUserIdStore.getCurrentUserId(false), p1)
		end,
		clear = var2.clear,
		dispose = var2.dispose
	}
end