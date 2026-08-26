local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local promiseModule = require(parent.Promise)
local cryoModule = require(parent.Cryo)
local requestsModule = require(dataHydration.TrustedConnections.Requests)
local trustedConnectionStatusModule = require(dataHydration.TrustedConnections.Enums.TrustedConnectionStatus)
local createTrustedConnectionEventListenerModule = require(dataHydration.TrustedConnections.createTrustedConnectionEventListener)
local createFriendshipEventListenerModule = require(dataHydration.TrustedConnections.createFriendshipEventListener)
local getLocalPlayerUserId = require(dataHydration.DataHydrationUtils).getLocalPlayerUserId
local mergeListsWithoutDuplicates = require(dataHydration.DataHydrationUtils).mergeListsWithoutDuplicates
local fFlagTCShareLinkReceiverUI = require(parent.SharedFlags).FFlagTCShareLinkReceiverUI
local fFlagConnectionManagementChips = require(parent.SharedFlags).FFlagConnectionManagementChips
local fFlagAddFriendsPageTrustedFriendRequestSection = require(parent.SharedFlags).FFlagAddFriendsPageTrustedFriendRequestSection
local fIntTrustedFriendRequestsPageSize = require(parent.SharedFlags).FIntTrustedFriendRequestsPageSize
local trustedConnectionsStoreDataTtlSec = game:DefineFastInt("TrustedConnectionsStoreDataTtlSec", 0)
game:DefineFastInt("TrustedConnectionsStoreProcessDelaySec", 1)

local _ = function()
	return game:GetFastInt("TrustedConnectionsStoreProcessDelaySec")
end

game:DefineFastInt("TrustedConnectionsStoreIncomingRequestsProcessDelaySec", 0)

local _ = function()
	return game:GetFastInt("TrustedConnectionsStoreIncomingRequestsProcessDelaySec")
end

return function()
	-- upvalues: trustedConnectionsStoreDataTtlSec (ref), createDataCacheModule (ref), fFlagConnectionManagementChips (ref), fFlagAddFriendsPageTrustedFriendRequestSection (ref), getLocalPlayerUserId (ref), mergeListsWithoutDuplicates (ref), cryoModule (ref), createDataResolverModule (ref), requestsModule (ref), createTrustedConnectionEventListenerModule (ref), trustedConnectionStatusModule (ref), createFriendshipEventListenerModule (ref), promiseModule (ref), fIntTrustedFriendRequestsPageSize (ref), fFlagTCShareLinkReceiverUI (ref)
	local var1 = if trustedConnectionsStoreDataTtlSec > 0 then trustedConnectionsStoreDataTtlSec else 1e999
	local var2 = createDataCacheModule(var1)
	local var3 = createDataCacheModule(var1)
	local var4 = if fFlagConnectionManagementChips then createDataCacheModule(var1) else nil
	local var5 = if fFlagAddFriendsPageTrustedFriendRequestSection then createDataCacheModule(var1) else nil
	local var6 = if fFlagAddFriendsPageTrustedFriendRequestSection then createDataCacheModule(var1) else nil
	local var7 = false
	local var8 = if fFlagAddFriendsPageTrustedFriendRequestSection then function(p1)
		-- upvalues: getLocalPlayerUserId (copy), var5 (ref), mergeListsWithoutDuplicates (copy), var6 (ref)
		local var9 = tostring(getLocalPlayerUserId())
		local var10 = var5.getItem(var9).data(false)
		
		if not var10 then return end
		local var11 = mergeListsWithoutDuplicates(var10.senderIds, { p1 })
		
		if #var11 == #var10.senderIds then return end
		var5.replaceItem(var9, {
			senderIds = var11,
			nextPageCursor = var10.nextPageCursor,
			hasMore = var10.hasMore
		})
		local var12 = var6.getItem(var9).data(false)
		
		if var12 then
			var6.replaceItem(var9, math.max(var12 + 1, 0))
		end
	end else nil
	local var9 = if fFlagAddFriendsPageTrustedFriendRequestSection then function(p1)
		-- upvalues: getLocalPlayerUserId (copy), var5 (ref), cryoModule (copy), var6 (ref)
		local var10 = tostring(getLocalPlayerUserId())
		local var11 = var5.getItem(var10).data(false)
		
		if not var11 then return end
		local var12 = cryoModule.List.removeValue(var11.senderIds, p1)
		
		if #var12 == #var11.senderIds then return end
		var5.replaceItem(var10, {
			senderIds = var12,
			nextPageCursor = var11.nextPageCursor,
			hasMore = var11.hasMore
		})
		local var13 = var6.getItem(var10).data(false)
		
		if var13 then
			var6.replaceItem(var10, math.max(var13 - 1, 0))
		end
	end else nil
	local var10 = if fFlagConnectionManagementChips then createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = var4,
		queueProcessDelaySec = game:GetFastInt("TrustedConnectionsStoreProcessDelaySec"),
		fetchFn = function(p1)
			-- upvalues: requestsModule (copy), cryoModule (copy)
			return requestsModule.GetUserTrustedConnections(p1):andThen(function(p2)
				-- upvalues: cryoModule (copy)
				return cryoModule.List.map(p2.PageItems or {}, function(p3)
					return { id = tostring(p3.id) }
				end)
			end)
		end
	}) else nil
	local var11 = createTrustedConnectionEventListenerModule(function(p1, p2)
		-- upvalues: var2 (ref), var3 (ref), trustedConnectionStatusModule (copy), fFlagAddFriendsPageTrustedFriendRequestSection (copy), var8 (ref), fFlagConnectionManagementChips (copy), getLocalPlayerUserId (copy), var10 (ref)
		var2.updateItems({ [p1] = p2 })
		var3.updateItems({
			[p1] = p2 == trustedConnectionStatusModule.TrustedFriends
		})
		
		if fFlagAddFriendsPageTrustedFriendRequestSection and p2 == trustedConnectionStatusModule.RequestReceived then
			var8(p1)
		end
		if fFlagConnectionManagementChips then
			local var12 = getLocalPlayerUserId()
			
			if var12 then
				var10.fetchItem(tostring(var12))
			end
		end
	end)
	local var12 = if fFlagAddFriendsPageTrustedFriendRequestSection then createFriendshipEventListenerModule(function(p1, p2)
		-- upvalues: var2 (ref), var3 (ref), trustedConnectionStatusModule (copy), var9 (ref)
		var2.updateItems({ [p1] = p2 })
		var3.updateItems({
			[p1] = p2 == trustedConnectionStatusModule.TrustedFriends
		})
		
		if p2 == trustedConnectionStatusModule.NotFriends then
			var9(p1)
		end
	end) else nil
	local var13 = createDataResolverModule({
		cache = var3,
		queueProcessDelaySec = game:GetFastInt("TrustedConnectionsStoreProcessDelaySec"),
		fetchFn = function(p1)
			-- upvalues: cryoModule (copy), requestsModule (copy)
			local var14 = cryoModule.Dictionary.keys(p1)
			
			return requestsModule.MultiGetUsersAreTrustedConnections(var14):andThen(function(p2)
				-- upvalues: cryoModule (copy), var14 (ref)
				local var15 = cryoModule.List.foldLeft(p2, function(p3, p4)
					p3[tostring(p4)] = true
					
					return p3
				end, {})
				
				return cryoModule.List.foldLeft(var14, function(p3, p4)
					-- upvalues: var15 (ref)
					p3[tostring(p4)] = var15[p4] or false
					
					return p3
				end, {})
			end)
		end
	})
	local var14 = createDataResolverModule({
		cache = var2,
		queueProcessDelaySec = game:GetFastInt("TrustedConnectionsStoreProcessDelaySec"),
		fetchFn = function(p1)
			-- upvalues: cryoModule (copy), requestsModule (copy), promiseModule (copy)
			return promiseModule.all(cryoModule.List.foldLeft(cryoModule.Dictionary.keys(p1), function(p2, p3)
				-- upvalues: requestsModule (copy)
				table.insert(p2, requestsModule.GetUserTrustedConnectionStatus(p3):andThen(function(p4)
					-- upvalues: p3 (ref)
					return { [p3] = p4 }
				end))
				
				return p2
			end, {})):andThen(function(p2)
				-- upvalues: cryoModule (copy)
				return cryoModule.Dictionary.join(table.unpack(p2))
			end)
		end
	})
	local var15 = if fFlagAddFriendsPageTrustedFriendRequestSection then createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = var5,
		queueProcessDelaySec = game:GetFastInt("TrustedConnectionsStoreIncomingRequestsProcessDelaySec"),
		fetchFn = function(_, p1)
			-- upvalues: var7 (write), requestsModule (copy), fIntTrustedFriendRequestsPageSize (copy), cryoModule (copy), mergeListsWithoutDuplicates (copy)
			local var16 = if var7 then nil else p1.data(false)
			var7 = false
			
			return requestsModule.GetTrustedFriendRequests(if var16 then var16.nextPageCursor else nil, fIntTrustedFriendRequestsPageSize):andThen(function(p2)
				-- upvalues: cryoModule (copy), var16 (ref), mergeListsWithoutDuplicates (copy)
				local var17 = if p2 then p2.nextPageCursor else nil
				
				return {
					senderIds = mergeListsWithoutDuplicates(if var16 then var16.senderIds else nil, cryoModule.List.map((if p2 then p2.data else nil) or {}, function(p3)
						return tostring(p3.senderId)
					end)),
					nextPageCursor = var17,
					hasMore = var17 ~= nil
				}
			end)
		end
	}) else nil
	local var16 = if fFlagAddFriendsPageTrustedFriendRequestSection then createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = var6,
		queueProcessDelaySec = game:GetFastInt("TrustedConnectionsStoreIncomingRequestsProcessDelaySec"),
		fetchFn = function(_)
			-- upvalues: requestsModule (copy)
			return requestsModule.GetTrustedFriendRequestsCount():andThen(function(p1)
				return if p1 then p1.count else 0
			end)
		end
	}) else nil
	
	return {
		getStatus = function(p1)
			-- upvalues: var14 (ref)
			return var14.getAndFetchItem(p1)
		end,
		getIsTrustedConnection = function(p1)
			-- upvalues: var13 (ref)
			return var13.getAndFetchItem(p1)
		end,
		getUserTrustedConnections = if fFlagConnectionManagementChips then if fFlagConnectionManagementChips then function()
			-- upvalues: getLocalPlayerUserId (copy), var10 (ref)
			return var10.getAndFetchItem(tostring(getLocalPlayerUserId()))
		end else nil else nil,
		getTrustedFriendRequests = if fFlagAddFriendsPageTrustedFriendRequestSection then if fFlagAddFriendsPageTrustedFriendRequestSection then function()
			-- upvalues: getLocalPlayerUserId (copy), var15 (ref)
			return var15.getAndFetchItem(tostring(getLocalPlayerUserId()))
		end else nil else nil,
		getTrustedFriendRequestsCount = if fFlagAddFriendsPageTrustedFriendRequestSection then if fFlagAddFriendsPageTrustedFriendRequestSection then function()
			-- upvalues: getLocalPlayerUserId (copy), var16 (ref)
			return var16.getAndFetchItem(tostring(getLocalPlayerUserId()))
		end else nil else nil,
		loadMoreTrustedFriendRequests = if fFlagAddFriendsPageTrustedFriendRequestSection then if fFlagAddFriendsPageTrustedFriendRequestSection then function()
			-- upvalues: getLocalPlayerUserId (copy), var5 (ref), var15 (ref)
			local var17 = tostring(getLocalPlayerUserId())
			local var18 = var5.getItem(var17).data(false)
			
			if var18 and not var18.hasMore then
				return
			end
			var15.fetchItem(var17)
		end else nil else nil,
		refetchTrustedFriendRequests = if fFlagAddFriendsPageTrustedFriendRequestSection then if fFlagAddFriendsPageTrustedFriendRequestSection then function()
			-- upvalues: var7 (write), getLocalPlayerUserId (copy), var15 (ref)
			var7 = true
			var15.fetchItem(tostring(getLocalPlayerUserId()))
		end else nil else nil,
		refetchTrustedFriendRequestsCount = if fFlagAddFriendsPageTrustedFriendRequestSection then if fFlagAddFriendsPageTrustedFriendRequestSection then function()
			-- upvalues: getLocalPlayerUserId (copy), var16 (ref)
			var16.fetchItem(tostring(getLocalPlayerUserId()))
		end else nil else nil,
		sendTrustedConnectionRequest = function(p1, p2)
			-- upvalues: requestsModule (copy), var2 (ref), trustedConnectionStatusModule (copy)
			return requestsModule.PostUserSendTrustedConnectionRequest(p1, p2):andThen(function()
				-- upvalues: var2 (copy), p1 (ref), trustedConnectionStatusModule (copy)
				var2.updateItems({ [p1] = trustedConnectionStatusModule.RequestSent })
			end)
		end,
		acceptTrustedConnectionRequest = function(p1)
			-- upvalues: requestsModule (copy), var2 (ref), trustedConnectionStatusModule (copy), var3 (ref), fFlagAddFriendsPageTrustedFriendRequestSection (copy), var9 (ref)
			return requestsModule.PostUserAcceptTrustedConnectionRequest(p1):andThen(function()
				-- upvalues: var2 (copy), p1 (ref), trustedConnectionStatusModule (copy), var3 (copy), fFlagAddFriendsPageTrustedFriendRequestSection (copy), var9 (copy)
				var2.updateItems({ [p1] = trustedConnectionStatusModule.TrustedFriends })
				var3.updateItems({ [p1] = true })
				
				if fFlagAddFriendsPageTrustedFriendRequestSection then
					var9(p1)
				end
			end)
		end,
		ignoreTrustedConnectionRequest = function(p1)
			-- upvalues: requestsModule (copy), var2 (ref), trustedConnectionStatusModule (copy), fFlagAddFriendsPageTrustedFriendRequestSection (copy), var9 (ref)
			return requestsModule.PostUserIgnoreTrustedConnectionRequest(p1):andThen(function()
				-- upvalues: var2 (copy), p1 (ref), trustedConnectionStatusModule (copy), fFlagAddFriendsPageTrustedFriendRequestSection (copy), var9 (copy)
				var2.updateItems({ [p1] = trustedConnectionStatusModule.RequestIgnored })
				
				if fFlagAddFriendsPageTrustedFriendRequestSection then
					var9(p1)
				end
			end)
		end,
		ignoreAllTrustedFriendRequests = if fFlagAddFriendsPageTrustedFriendRequestSection then if fFlagAddFriendsPageTrustedFriendRequestSection then function()
			-- upvalues: requestsModule (copy), getLocalPlayerUserId (copy), var5 (ref), var6 (ref)
			return requestsModule.PostUserIgnoreAllTrustedFriendRequests():andThen(function()
				-- upvalues: getLocalPlayerUserId (copy), var5 (copy), var6 (copy)
				local var17 = tostring(getLocalPlayerUserId())
				var5.replaceItem(var17, { nextPageCursor = nil, hasMore = false, senderIds = {} })
				var6.replaceItem(var17, 0)
			end)
		end else nil else nil,
		removeTrustedConnectionRequest = function(p1)
			-- upvalues: requestsModule (copy), var2 (ref), trustedConnectionStatusModule (copy), var3 (ref)
			return requestsModule.PostUserRemoveTrustedConnection(p1):andThen(function()
				-- upvalues: var2 (copy), p1 (ref), trustedConnectionStatusModule (copy), var3 (copy)
				var2.updateItems({ [p1] = trustedConnectionStatusModule.RequestReceived })
				var3.updateItems({ [p1] = false })
			end)
		end,
		createTrustedFriendLink = function(p1)
			-- upvalues: requestsModule (copy)
			return requestsModule.PostUserCreateTrustedFriendLink(p1)
		end,
		validateTrustedFriendLink = if fFlagTCShareLinkReceiverUI then function(p1, p2)
			-- upvalues: requestsModule (copy)
			return requestsModule.PostUserValidateTrustedFriendLink(p1, p2)
		end else nil,
		addTrustedFriendFromLink = if fFlagTCShareLinkReceiverUI then function(p1, p2)
			-- upvalues: requestsModule (copy)
			return requestsModule.PostUserAddTrustedFriendFromLink(p1, p2)
		end else nil,
		clear = function()
			-- upvalues: var2 (ref), var3 (ref), var13 (ref), var14 (ref), fFlagConnectionManagementChips (copy), var4 (ref), var10 (ref), fFlagAddFriendsPageTrustedFriendRequestSection (copy), var5 (ref), var15 (ref), var6 (ref), var16 (ref)
			var2.clear()
			var3.clear()
			var13.clear()
			var14.clear()
			
			if fFlagConnectionManagementChips then
				var4.clear()
				var10.clear()
			end
			if fFlagAddFriendsPageTrustedFriendRequestSection then
				var5.clear()
				var15.clear()
				var6.clear()
				var16.clear()
			end
		end,
		dispose = function()
			-- upvalues: var2 (ref), var3 (ref), var13 (ref), var14 (ref), var11 (ref), fFlagAddFriendsPageTrustedFriendRequestSection (copy), var12 (ref), fFlagConnectionManagementChips (copy), var4 (ref), var10 (ref), var5 (ref), var15 (ref), var6 (ref), var16 (ref)
			var2.dispose()
			var3.dispose()
			var13.dispose()
			var14.dispose()
			var11()
			
			if fFlagAddFriendsPageTrustedFriendRequestSection then
				var12()
			end
			if fFlagConnectionManagementChips then
				var4.dispose()
				var10.dispose()
			end
			if fFlagAddFriendsPageTrustedFriendRequestSection then
				var5.dispose()
				var15.dispose()
				var6.dispose()
				var16.dispose()
			end
		end
	}
end