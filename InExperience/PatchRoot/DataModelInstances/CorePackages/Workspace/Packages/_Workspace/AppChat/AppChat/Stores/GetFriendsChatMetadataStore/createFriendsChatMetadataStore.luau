local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local appChatNetworkingModule = require(parent.AppChatNetworking)
local dataHydrationModule = require(parent.DataHydration)
local _ = require(parent.Signals)
local localUserIdStore = require(parent.LocalUserIdStore).LocalUserIdStore
local name = require(appChat.Logger):new(script.Name)

local function resolveLocalUserId(p0) --[[ line: 24 ]]
	-- upvalues: localUserIdStore (ref)
	return localUserIdStore.getCurrentUserId(p0)
end

return function() --[[ line: 28 | named "createFriendsChatMetadataStore" ]]
	-- upvalues: dataHydrationModule (ref), appChatNetworkingModule (ref), name (ref), resolveLocalUserId (ref), localUserIdStore (ref)
	local var5 = dataHydrationModule.createDataCache()
	local var6 = dataHydrationModule.createDataResolver({
		supportsMultiGet = false,
		cache = var5,
		fetchFn = function(_) --[[ line: 33 ]]
			-- upvalues: appChatNetworkingModule (copy)
			return appChatNetworkingModule.http.GetMetadata():andThen(function(p1) --[[ line: 34 ]]
				return p1.responseBody
			end)
		end,
		logError = function(p2) --[[ line: 38 ]]
			-- upvalues: name (copy)
			name:warning(`Failed to fetch Friends Chat metadata: {tostring(p2)}`)
		end
	})
	
	return {
		getFriendsChatMetadata = function(p3) --[[ line: 43 ]]
			-- upvalues: var6 (ref), resolveLocalUserId (copy)
			return var6.getAndFetchItem(resolveLocalUserId(p3))
		end,
		getCachedFriendsChatMetadata = function(p4) --[[ line: 47 ]]
			-- upvalues: var6 (ref), resolveLocalUserId (copy)
			return var6.getCachedItem(resolveLocalUserId(p4))
		end,
		fetchFriendsChatMetadata = function() --[[ line: 51 ]]
			-- upvalues: var6 (ref), resolveLocalUserId (copy)
			return var6.fetchItem(resolveLocalUserId(false))
		end,
		updateFriendsChatMetadata = function(p5) --[[ line: 55 ]]
			-- upvalues: var5 (ref), localUserIdStore (copy)
			var5.replaceItem(localUserIdStore.getCurrentUserId(false), p5)
		end,
		clear = var6.clear,
		dispose = var6.dispose
	}
end