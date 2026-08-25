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
	local var10 = if trustedConnectionsStoreDataTtlSec > 0 then trustedConnectionsStoreDataTtlSec else 1e999
	local var11 = createDataCacheModule(var10)
	local var12 = createDataCacheModule(var10)
	local var13 = if fFlagConnectionManagementChips then createDataCacheModule(var10) else nil
	local var14 = if fFlagAddFriendsPageTrustedFriendRequestSection then createDataCacheModule(var10) else nil
	local var15 = if fFlagAddFriendsPageTrustedFriendRequestSection then createDataCacheModule(var10) else nil
	local var16 = false
	local var17 = if fFlagAddFriendsPageTrustedFriendRequestSection then function(p0)
		-- upvalues: getLocalPlayerUserId (copy), var14 (ref), mergeListsWithoutDuplicates (copy), var15 (ref)
		local var26 = tostring(getLocalPlayerUserId())
		local var27 = var14.getItem(var26).data(false)
		
		if not var27 then return end
		local var28 = mergeListsWithoutDuplicates(var27.senderIds, { p0 })
		
		if #var28 == #var27.senderIds then return end
		var14.replaceItem(var26, {
			senderIds = var28,
			nextPageCursor = var27.nextPageCursor,
			hasMore = var27.hasMore
		})
		local var29 = var15.getItem(var26).data(false)
		
		if var29 then
			var15.replaceItem(var26, math.max(var29 + 1, 0))
		end
	end else nil
	local var18 = if fFlagAddFriendsPageTrustedFriendRequestSection then function(p1)
		-- upvalues: getLocalPlayerUserId (copy), var14 (ref), cryoModule (copy), var15 (ref)
		local var30 = tostring(getLocalPlayerUserId())
		local var31 = var14.getItem(var30).data(false)
		
		if not var31 then return end
		local var32 = cryoModule.List.removeValue(var31.senderIds, p1)
		
		if #var32 == #var31.senderIds then return end
		var14.replaceItem(var30, {
			senderIds = var32,
			nextPageCursor = var31.nextPageCursor,
			hasMore = var31.hasMore
		})
		local var33 = var15.getItem(var30).data(false)
		
		if var33 then
			var15.replaceItem(var30, math.max(var33 - 1, 0))
		end
	end else nil
	local var19 = if fFlagConnectionManagementChips then createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = var13,
		queueProcessDelaySec = game:GetFastInt("TrustedConnectionsStoreProcessDelaySec"),
		fetchFn = function(p2)
			-- upvalues: requestsModule (copy), cryoModule (copy)
			return requestsModule.GetUserTrustedConnections(p2):andThen(function(p3)
				-- upvalues: cryoModule (copy)
				return cryoModule.List.map(p3.PageItems or {}, function(p4)
					return { id = tostring(p4.id) }
				end)
			end)
		end
	}) else nil
	local var20 = createTrustedConnectionEventListenerModule(function(p5, p6)
		-- upvalues: var11 (ref), var12 (ref), trustedConnectionStatusModule (copy), fFlagAddFriendsPageTrustedFriendRequestSection (copy), var17 (ref), fFlagConnectionManagementChips (copy), getLocalPlayerUserId (copy), var19 (ref)
		var11.updateItems({ [p5] = p6 })
		var12.updateItems({
			[p5] = p6 == trustedConnectionStatusModule.TrustedFriends
		})
		
		if fFlagAddFriendsPageTrustedFriendRequestSection and p6 == trustedConnectionStatusModule.RequestReceived then
			var17(p5)
		end
		if fFlagConnectionManagementChips then
			local var34 = getLocalPlayerUserId()
			
			if var34 then
				var19.fetchItem(tostring(var34))
			end
		end
	end)
	local var21 = if fFlagAddFriendsPageTrustedFriendRequestSection then createFriendshipEventListenerModule(function(p7, p8)
		-- upvalues: var11 (ref), var12 (ref), trustedConnectionStatusModule (copy), var18 (ref)
		var11.updateItems({ [p7] = p8 })
		var12.updateItems({
			[p7] = p8 == trustedConnectionStatusModule.TrustedFriends
		})
		
		if p8 == trustedConnectionStatusModule.NotFriends then
			var18(p7)
		end
	end) else nil
	local var22 = createDataResolverModule({
		cache = var12,
		queueProcessDelaySec = game:GetFastInt("TrustedConnectionsStoreProcessDelaySec"),
		fetchFn = function(p9)
			-- upvalues: cryoModule (copy), requestsModule (copy)
			local var35 = cryoModule.Dictionary.keys(p9)
			
			return requestsModule.MultiGetUsersAreTrustedConnections(var35):andThen(function(p10)
				-- upvalues: cryoModule (copy), var35 (ref)
				local var36 = cryoModule.List.foldLeft(p10, function(p11, p12)
					p11[tostring(p12)] = true
					
					return p11
				end, {})
				
				return cryoModule.List.foldLeft(var35, function(p13, p14)
					-- upvalues: var36 (ref)
					p13[tostring(p14)] = var36[p14] or false
					
					return p13
				end, {})
			end)
		end
	})
	local var23 = createDataResolverModule({
		cache = var11,
		queueProcessDelaySec = game:GetFastInt("TrustedConnectionsStoreProcessDelaySec"),
		fetchFn = function(p15)
			-- upvalues: cryoModule (copy), requestsModule (copy), promiseModule (copy)
			return promiseModule.all(cryoModule.List.foldLeft(cryoModule.Dictionary.keys(p15), function(p17, p18)
				-- upvalues: requestsModule (copy)
				table.insert(p17, requestsModule.GetUserTrustedConnectionStatus(p18):andThen(function(p19)
					-- upvalues: p18 (ref)
					return { [p18] = p19 }
				end))
				
				return p17
			end, {})):andThen(function(p16)
				-- upvalues: cryoModule (copy)
				return cryoModule.Dictionary.join(table.unpack(p16))
			end)
		end
	})
	local var24 = if fFlagAddFriendsPageTrustedFriendRequestSection then createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = var14,
		queueProcessDelaySec = game:GetFastInt("TrustedConnectionsStoreIncomingRequestsProcessDelaySec"),
		fetchFn = function(_, p20)
			-- upvalues: var16 (write), requestsModule (copy), fIntTrustedFriendRequestsPageSize (copy), cryoModule (copy), mergeListsWithoutDuplicates (copy)
			local var37 = if var16 then nil else p20.data(false)
			var16 = false
			
			return requestsModule.GetTrustedFriendRequests(if var37 then var37.nextPageCursor else nil, fIntTrustedFriendRequestsPageSize):andThen(function(p21)
				-- upvalues: cryoModule (copy), var37 (ref), mergeListsWithoutDuplicates (copy)
				local var38 = if p21 then p21.nextPageCursor else nil
				
				return {
					senderIds = mergeListsWithoutDuplicates(if var37 then var37.senderIds else nil, cryoModule.List.map((if p21 then p21.data else nil) or {}, function(p22)
						return tostring(p22.senderId)
					end)),
					nextPageCursor = var38,
					hasMore = var38 ~= nil
				}
			end)
		end
	}) else nil
	local var25 = if fFlagAddFriendsPageTrustedFriendRequestSection then createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = var15,
		queueProcessDelaySec = game:GetFastInt("TrustedConnectionsStoreIncomingRequestsProcessDelaySec"),
		fetchFn = function(_)
			-- upvalues: requestsModule (copy)
			return requestsModule.GetTrustedFriendRequestsCount():andThen(function(p23)
				return if p23 then p23.count else 0
			end)
		end
	}) else nil
	
	return {
		getStatus = function(p24)
			-- upvalues: var23 (ref)
			return var23.getAndFetchItem(p24)
		end,
		getIsTrustedConnection = function(p25)
			-- upvalues: var22 (ref)
			return var22.getAndFetchItem(p25)
		end,
		getUserTrustedConnections = if fFlagConnectionManagementChips then if fFlagConnectionManagementChips then function()
			-- upvalues: getLocalPlayerUserId (copy), var19 (ref)
			return var19.getAndFetchItem(tostring(getLocalPlayerUserId()))
		end else nil else nil,
		getTrustedFriendRequests = if fFlagAddFriendsPageTrustedFriendRequestSection then if fFlagAddFriendsPageTrustedFriendRequestSection then function()
			-- upvalues: getLocalPlayerUserId (copy), var24 (ref)
			return var24.getAndFetchItem(tostring(getLocalPlayerUserId()))
		end else nil else nil,
		getTrustedFriendRequestsCount = if fFlagAddFriendsPageTrustedFriendRequestSection then if fFlagAddFriendsPageTrustedFriendRequestSection then function()
			-- upvalues: getLocalPlayerUserId (copy), var25 (ref)
			return var25.getAndFetchItem(tostring(getLocalPlayerUserId()))
		end else nil else nil,
		loadMoreTrustedFriendRequests = if fFlagAddFriendsPageTrustedFriendRequestSection then if fFlagAddFriendsPageTrustedFriendRequestSection then function()
			-- upvalues: getLocalPlayerUserId (copy), var14 (ref), var24 (ref)
			local var39 = tostring(getLocalPlayerUserId())
			local var40 = var14.getItem(var39).data(false)
			
			if var40 and not var40.hasMore then
				return
			end
			var24.fetchItem(var39)
		end else nil else nil,
		refetchTrustedFriendRequests = if fFlagAddFriendsPageTrustedFriendRequestSection then if fFlagAddFriendsPageTrustedFriendRequestSection then function()
			-- upvalues: var16 (write), getLocalPlayerUserId (copy), var24 (ref)
			var16 = true
			var24.fetchItem(tostring(getLocalPlayerUserId()))
		end else nil else nil,
		refetchTrustedFriendRequestsCount = if fFlagAddFriendsPageTrustedFriendRequestSection then if fFlagAddFriendsPageTrustedFriendRequestSection then function()
			-- upvalues: getLocalPlayerUserId (copy), var25 (ref)
			var25.fetchItem(tostring(getLocalPlayerUserId()))
		end else nil else nil,
		sendTrustedConnectionRequest = function(p26, p27)
			-- upvalues: requestsModule (copy), var11 (ref), trustedConnectionStatusModule (copy)
			return requestsModule.PostUserSendTrustedConnectionRequest(p26, p27):andThen(function()
				-- upvalues: var11 (copy), p26 (ref), trustedConnectionStatusModule (copy)
				var11.updateItems({ [p26] = trustedConnectionStatusModule.RequestSent })
			end)
		end,
		acceptTrustedConnectionRequest = function(p28)
			-- upvalues: requestsModule (copy), var11 (ref), trustedConnectionStatusModule (copy), var12 (ref), fFlagAddFriendsPageTrustedFriendRequestSection (copy), var18 (ref)
			return requestsModule.PostUserAcceptTrustedConnectionRequest(p28):andThen(function()
				-- upvalues: var11 (copy), p28 (ref), trustedConnectionStatusModule (copy), var12 (copy), fFlagAddFriendsPageTrustedFriendRequestSection (copy), var18 (copy)
				var11.updateItems({ [p28] = trustedConnectionStatusModule.TrustedFriends })
				var12.updateItems({ [p28] = true })
				
				if fFlagAddFriendsPageTrustedFriendRequestSection then
					var18(p28)
				end
			end)
		end,
		ignoreTrustedConnectionRequest = function(p29)
			-- upvalues: requestsModule (copy), var11 (ref), trustedConnectionStatusModule (copy), fFlagAddFriendsPageTrustedFriendRequestSection (copy), var18 (ref)
			return requestsModule.PostUserIgnoreTrustedConnectionRequest(p29):andThen(function()
				-- upvalues: var11 (copy), p29 (ref), trustedConnectionStatusModule (copy), fFlagAddFriendsPageTrustedFriendRequestSection (copy), var18 (copy)
				var11.updateItems({ [p29] = trustedConnectionStatusModule.RequestIgnored })
				
				if fFlagAddFriendsPageTrustedFriendRequestSection then
					var18(p29)
				end
			end)
		end,
		ignoreAllTrustedFriendRequests = if fFlagAddFriendsPageTrustedFriendRequestSection then if fFlagAddFriendsPageTrustedFriendRequestSection then function()
			-- upvalues: requestsModule (copy), getLocalPlayerUserId (copy), var14 (ref), var15 (ref)
			return requestsModule.PostUserIgnoreAllTrustedFriendRequests():andThen(function()
				-- upvalues: getLocalPlayerUserId (copy), var14 (copy), var15 (copy)
				local var41 = tostring(getLocalPlayerUserId())
				var14.replaceItem(var41, { nextPageCursor = nil, hasMore = false, senderIds = {} })
				var15.replaceItem(var41, 0)
			end)
		end else nil else nil,
		removeTrustedConnectionRequest = function(p30)
			-- upvalues: requestsModule (copy), var11 (ref), trustedConnectionStatusModule (copy), var12 (ref)
			return requestsModule.PostUserRemoveTrustedConnection(p30):andThen(function()
				-- upvalues: var11 (copy), p30 (ref), trustedConnectionStatusModule (copy), var12 (copy)
				var11.updateItems({ [p30] = trustedConnectionStatusModule.RequestReceived })
				var12.updateItems({ [p30] = false })
			end)
		end,
		createTrustedFriendLink = function(p31)
			-- upvalues: requestsModule (copy)
			return requestsModule.PostUserCreateTrustedFriendLink(p31)
		end,
		validateTrustedFriendLink = if fFlagTCShareLinkReceiverUI then function(p32, p33)
			-- upvalues: requestsModule (copy)
			return requestsModule.PostUserValidateTrustedFriendLink(p32, p33)
		end else nil,
		addTrustedFriendFromLink = if fFlagTCShareLinkReceiverUI then function(p34, p35)
			-- upvalues: requestsModule (copy)
			return requestsModule.PostUserAddTrustedFriendFromLink(p34, p35)
		end else nil,
		clear = function()
			-- upvalues: var11 (ref), var12 (ref), var22 (ref), var23 (ref), fFlagConnectionManagementChips (copy), var13 (ref), var19 (ref), fFlagAddFriendsPageTrustedFriendRequestSection (copy), var14 (ref), var24 (ref), var15 (ref), var25 (ref)
			var11.clear()
			var12.clear()
			var22.clear()
			var23.clear()
			
			if fFlagConnectionManagementChips then
				var13.clear()
				var19.clear()
			end
			if fFlagAddFriendsPageTrustedFriendRequestSection then
				var14.clear()
				var24.clear()
				var15.clear()
				var25.clear()
			end
		end,
		dispose = function()
			-- upvalues: var11 (ref), var12 (ref), var22 (ref), var23 (ref), var20 (ref), fFlagAddFriendsPageTrustedFriendRequestSection (copy), var21 (ref), fFlagConnectionManagementChips (copy), var13 (ref), var19 (ref), var14 (ref), var24 (ref), var15 (ref), var25 (ref)
			var11.dispose()
			var12.dispose()
			var22.dispose()
			var23.dispose()
			var20()
			
			if fFlagAddFriendsPageTrustedFriendRequestSection then
				var21()
			end
			if fFlagConnectionManagementChips then
				var13.dispose()
				var19.dispose()
			end
			if fFlagAddFriendsPageTrustedFriendRequestSection then
				var14.dispose()
				var24.dispose()
				var15.dispose()
				var25.dispose()
			end
		end
	}
end