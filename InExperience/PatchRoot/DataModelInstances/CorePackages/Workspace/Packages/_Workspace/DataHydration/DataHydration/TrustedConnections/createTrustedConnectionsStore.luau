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
local getLocalPlayerUserId = require(dataHydration.DataHydrationUtils).getLocalPlayerUserId
local fFlagTCShareLinkReceiverUI = require(parent.SharedFlags).FFlagTCShareLinkReceiverUI
local fFlagConnectionManagementChips = require(parent.SharedFlags).FFlagConnectionManagementChips
local trustedConnectionsStoreDataTtlSec = game:DefineFastInt("TrustedConnectionsStoreDataTtlSec", 0)
game:DefineFastInt("TrustedConnectionsStoreProcessDelaySec", 1)

local _ = function() --[[ line: 49 ]]
	return game:GetFastInt("TrustedConnectionsStoreProcessDelaySec")
end

return function() --[[ line: 53 | named "createTrustedConnectionsStore" ]]
	-- upvalues: trustedConnectionsStoreDataTtlSec (ref), createDataCacheModule (ref), fFlagConnectionManagementChips (ref), createDataResolverModule (ref), requestsModule (ref), cryoModule (ref), createTrustedConnectionEventListenerModule (ref), trustedConnectionStatusModule (ref), getLocalPlayerUserId (ref), promiseModule (ref), fFlagTCShareLinkReceiverUI (ref)
	local var9 = if trustedConnectionsStoreDataTtlSec > 0 then trustedConnectionsStoreDataTtlSec else 1e999
	local var10 = createDataCacheModule(var9)
	local var11 = createDataCacheModule(var9)
	local var12 = if fFlagConnectionManagementChips then createDataCacheModule(var9) else nil
	local var13 = if fFlagConnectionManagementChips then createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = var12,
		queueProcessDelaySec = game:GetFastInt("TrustedConnectionsStoreProcessDelaySec"),
		fetchFn = function(p0) --[[ line: 69 ]]
			-- upvalues: requestsModule (copy), cryoModule (copy)
			return requestsModule.GetUserTrustedConnections(p0):andThen(function(p1) --[[ line: 70 ]]
				-- upvalues: cryoModule (copy)
				return cryoModule.List.map(p1.PageItems or {}, function(p2) --[[ line: 72 ]]
					return { id = tostring(p2.id) }
				end)
			end)
		end
	}) else nil
	local var14 = createTrustedConnectionEventListenerModule(function(p3, p4) --[[ line: 83 ]]
		-- upvalues: var10 (ref), var11 (ref), trustedConnectionStatusModule (copy), fFlagConnectionManagementChips (copy), getLocalPlayerUserId (copy), var13 (ref)
		var10.updateItems({ [p3] = p4 })
		var11.updateItems({
			[p3] = p4 == trustedConnectionStatusModule.TrustedFriends
		})
		
		if fFlagConnectionManagementChips then
			local var17 = getLocalPlayerUserId()
			
			if var17 then
				var13.fetchItem(tostring(var17))
			end
		end
	end)
	local var15 = createDataResolverModule({
		cache = var11,
		queueProcessDelaySec = game:GetFastInt("TrustedConnectionsStoreProcessDelaySec"),
		fetchFn = function(p5) --[[ line: 105 ]]
			-- upvalues: cryoModule (copy), requestsModule (copy)
			local var18 = cryoModule.Dictionary.keys(p5)
			
			return requestsModule.MultiGetUsersAreTrustedConnections(var18):andThen(function(p6) --[[ line: 107 ]]
				-- upvalues: cryoModule (copy), var18 (ref)
				local var19 = cryoModule.List.foldLeft(p6, function(p7, p8) --[[ line: 108 ]]
					p7[tostring(p8)] = true
					
					return p7
				end, {})
				
				return cryoModule.List.foldLeft(var18, function(p9, p10) --[[ line: 113 ]]
					-- upvalues: var19 (ref)
					p9[tostring(p10)] = var19[p10] or false
					
					return p9
				end, {})
			end)
		end
	})
	local var16 = createDataResolverModule({
		cache = var10,
		queueProcessDelaySec = game:GetFastInt("TrustedConnectionsStoreProcessDelaySec"),
		fetchFn = function(p11) --[[ line: 124 ]]
			-- upvalues: cryoModule (copy), requestsModule (copy), promiseModule (copy)
			return promiseModule.all(cryoModule.List.foldLeft(cryoModule.Dictionary.keys(p11), function(p13, p14) --[[ line: 126 ]]
				-- upvalues: requestsModule (copy)
				table.insert(p13, requestsModule.GetUserTrustedConnectionStatus(p14):andThen(function(p15) --[[ line: 130 ]]
					-- upvalues: p14 (ref)
					return { [p14] = p15 }
				end))
				
				return p13
			end, {})):andThen(function(p12) --[[ line: 137 ]]
				-- upvalues: cryoModule (copy)
				return cryoModule.Dictionary.join(table.unpack(p12))
			end)
		end
	})
	
	return {
		getStatus = function(p16) --[[ line: 143 ]]
			-- upvalues: var16 (ref)
			return var16.getAndFetchItem(p16)
		end,
		getIsTrustedConnection = function(p17) --[[ line: 147 ]]
			-- upvalues: var15 (ref)
			return var15.getAndFetchItem(p17)
		end,
		getUserTrustedConnections = if fFlagConnectionManagementChips then if fFlagConnectionManagementChips then function() --[[ line: 152 ]]
			-- upvalues: getLocalPlayerUserId (copy), var13 (ref)
			return var13.getAndFetchItem(tostring(getLocalPlayerUserId()))
		end else nil else nil,
		sendTrustedConnectionRequest = function(p18, p19) --[[ line: 158 ]]
			-- upvalues: requestsModule (copy), var10 (ref), trustedConnectionStatusModule (copy)
			return requestsModule.PostUserSendTrustedConnectionRequest(p18, p19):andThen(function() --[[ line: 159 ]]
				-- upvalues: var10 (copy), p18 (ref), trustedConnectionStatusModule (copy)
				var10.updateItems({ [p18] = trustedConnectionStatusModule.RequestSent })
			end)
		end,
		acceptTrustedConnectionRequest = function(p20) --[[ line: 166 ]]
			-- upvalues: requestsModule (copy), var10 (ref), trustedConnectionStatusModule (copy), var11 (ref)
			return requestsModule.PostUserAcceptTrustedConnectionRequest(p20):andThen(function() --[[ line: 167 ]]
				-- upvalues: var10 (copy), p20 (ref), trustedConnectionStatusModule (copy), var11 (copy)
				var10.updateItems({ [p20] = trustedConnectionStatusModule.TrustedFriends })
				var11.updateItems({ [p20] = true })
			end)
		end,
		ignoreTrustedConnectionRequest = function(p21) --[[ line: 178 ]]
			-- upvalues: requestsModule (copy), var10 (ref), trustedConnectionStatusModule (copy)
			return requestsModule.PostUserIgnoreTrustedConnectionRequest(p21):andThen(function() --[[ line: 179 ]]
				-- upvalues: var10 (copy), p21 (ref), trustedConnectionStatusModule (copy)
				var10.updateItems({ [p21] = trustedConnectionStatusModule.RequestIgnored })
			end)
		end,
		removeTrustedConnectionRequest = function(p22) --[[ line: 186 ]]
			-- upvalues: requestsModule (copy), var10 (ref), trustedConnectionStatusModule (copy), var11 (ref)
			return requestsModule.PostUserRemoveTrustedConnection(p22):andThen(function() --[[ line: 187 ]]
				-- upvalues: var10 (copy), p22 (ref), trustedConnectionStatusModule (copy), var11 (copy)
				var10.updateItems({ [p22] = trustedConnectionStatusModule.RequestReceived })
				var11.updateItems({ [p22] = false })
			end)
		end,
		createTrustedFriendLink = function(p23) --[[ line: 198 ]]
			-- upvalues: requestsModule (copy)
			return requestsModule.PostUserCreateTrustedFriendLink(p23)
		end,
		validateTrustedFriendLink = if fFlagTCShareLinkReceiverUI then function(p24, p25) --[[ line: 202 ]]
			-- upvalues: requestsModule (copy)
			return requestsModule.PostUserValidateTrustedFriendLink(p24, p25)
		end else nil,
		addTrustedFriendFromLink = if fFlagTCShareLinkReceiverUI then function(p26, p27) --[[ line: 206 ]]
			-- upvalues: requestsModule (copy)
			return requestsModule.PostUserAddTrustedFriendFromLink(p26, p27)
		end else nil,
		clear = function() --[[ line: 210 ]]
			-- upvalues: var10 (ref), var11 (ref), var15 (ref), var16 (ref), fFlagConnectionManagementChips (copy), var12 (ref), var13 (ref)
			var10.clear()
			var11.clear()
			var15.clear()
			var16.clear()
			
			if fFlagConnectionManagementChips then
				var12.clear()
				var13.clear()
			end
		end,
		dispose = function() --[[ line: 222 ]]
			-- upvalues: var10 (ref), var11 (ref), var15 (ref), var16 (ref), var14 (ref), fFlagConnectionManagementChips (copy), var12 (ref), var13 (ref)
			var10.dispose()
			var11.dispose()
			var15.dispose()
			var16.dispose()
			var14()
			
			if fFlagConnectionManagementChips then
				var12.dispose()
				var13.dispose()
			end
		end
	}
end