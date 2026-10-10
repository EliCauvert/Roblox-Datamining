local inExperienceOffers = script:FindFirstAncestor("InExperienceOffers")
local parent = inExperienceOffers.Parent
local _ = require(parent.Promise)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsModule = require(parent.Signals)
local createSessionScopedSignal = require(parent.SignalsUtils).createSessionScopedSignal
local getAllUserOffersModule = require(inExperienceOffers.Api.getAllUserOffers)
local offersDebugLoggerModule = require(inExperienceOffers.Internal.OffersDebugLogger)
local _ = require(inExperienceOffers.Types)
local mockGetAllUserOffersModule = require(inExperienceOffers.Mocks.MockGetAllUserOffers)
local getSecondsUntilNextExpirationModule = require(inExperienceOffers.Utils.getSecondsUntilNextExpiration)
local getSecondsUntilAnyKeyEmptiesModule = require(inExperienceOffers.Utils.getSecondsUntilAnyKeyEmpties)
local isNotificationEligibleModule = require(inExperienceOffers.Utils.isNotificationEligible)
local featureKeyModule = require(inExperienceOffers.Enums.FeatureKey)
local notificationLocationModule = require(inExperienceOffers.Enums.NotificationLocation)
local fFlagEnableUserOffers = sharedFlagsModule.FFlagEnableUserOffers
local fFlagHideOfferNotificationsWhenShopEmpty = sharedFlagsModule.FFlagHideOfferNotificationsWhenShopEmpty
local fFlagOffersRespectExpirationModule = require(inExperienceOffers.Flags.FFlagOffersRespectExpiration)
local fFlagOffersMergeStoreResultsModule = require(inExperienceOffers.Flags.FFlagOffersMergeStoreResults)
local fFlagUseMockUserOffersModule = require(inExperienceOffers.Flags.FFlagUseMockUserOffers)
local fIntOfferExpirationRefetchBufferSecondsModule = require(inExperienceOffers.Flags.FIntOfferExpirationRefetchBufferSeconds)
local fIntOfferExpirationRefetchJitterSecondsModule = require(inExperienceOffers.Flags.FIntOfferExpirationRefetchJitterSeconds)
local fIntOfferExpirationRefetchMaxCountModule = require(inExperienceOffers.Flags.FIntOfferExpirationRefetchMaxCount)
local fFlagOffersPerKeyExpiryRefetchModule = require(inExperienceOffers.Flags.FFlagOffersPerKeyExpiryRefetch)
local fFlagOffersShopScopedNotificationModule = require(inExperienceOffers.Flags.FFlagOffersShopScopedNotification)

local function normalizePresentationData(p1)
	if p1 == nil then
		return nil
	end
	local t = {}
	
	for i, v in p1 do
		if v.banner ~= nil then
			t.banner = v.banner
		end
		if v.menuBadge ~= nil then
			t.menuBadge = v.menuBadge
		end
		if v.tooltip ~= nil then
			t.tooltip = v.tooltip
		end
	end
	return t
end

local function _(p2)
	-- upvalues: normalizePresentationData (ref)
	return {
		offerId = p2.offerId,
		offerStatus = p2.offerStatus,
		featureKeys = p2.featureKeys,
		expirationTimeInUTC = p2.expirationTimeInUTC,
		presentationData = normalizePresentationData(p2.presentationData)
	}
end

local function bucketResponse(p2)
	-- upvalues: normalizePresentationData (ref)
	local t = {}
	
	for i, v in p2.offers do
		local t_1 = {
			offerId = v.offerId,
			offerStatus = v.offerStatus,
			featureKeys = v.featureKeys,
			expirationTimeInUTC = v.expirationTimeInUTC,
			presentationData = normalizePresentationData(v.presentationData)
		}
		
		for i_1, v_1 in t_1.featureKeys do
			local var1 = t[v_1]
			
			if var1 == nil then
				var1 = {}
				t[v_1] = var1
			end
			table.insert(var1, t_1)
		end
	end
	return t
end

local function mergeRequestedKeys(p3, p4, p5)
	local var2 = if p3 ~= nil then {} else table.clone(p3)
	
	for i, v in p5 do
		var2[v] = p4[v]
	end
	return var2
end

local _ = function(p6)
	local t = {}
	
	for i in p6 do
		table.insert(t, i)
	end
	return t
end

return function()
	-- upvalues: createSessionScopedSignal (ref), signalsModule (ref), fFlagHideOfferNotificationsWhenShopEmpty (ref), fFlagOffersShopScopedNotificationModule (ref), featureKeyModule (ref), isNotificationEligibleModule (ref), notificationLocationModule (ref), fFlagUseMockUserOffersModule (ref), mockGetAllUserOffersModule (ref), getAllUserOffersModule (ref), normalizePresentationData (ref), fFlagOffersRespectExpirationModule (ref), bucketResponse (ref), mergeRequestedKeys (ref), fFlagEnableUserOffers (ref), fFlagOffersMergeStoreResultsModule (ref), offersDebugLoggerModule (ref), fIntOfferExpirationRefetchMaxCountModule (ref), fIntOfferExpirationRefetchBufferSecondsModule (ref), fIntOfferExpirationRefetchJitterSecondsModule (ref), getSecondsUntilAnyKeyEmptiesModule (ref), fFlagOffersPerKeyExpiryRefetchModule (ref), getSecondsUntilNextExpirationModule (ref)
	local var3, var4 = createSessionScopedSignal(nil)
	local var5, var6 = createSessionScopedSignal(nil)
	local var7, var8 = createSessionScopedSignal(false)
	local var9, var10 = signalsModule.createSignal(false)
	local var11, var12 = signalsModule.createSignal(true)
	local var13, var14 = signalsModule.createSignal(true)
	local var15 = signalsModule.createComputed(function(p7)
		-- upvalues: var3 (ref), var5 (ref), var11 (ref), fFlagHideOfferNotificationsWhenShopEmpty (copy), var13 (ref), fFlagOffersShopScopedNotificationModule (copy), featureKeyModule (copy), isNotificationEligibleModule (copy)
		local var16 = var3(p7)
		local var17 = var5(p7)
		
		if var16 == nil or var17 == nil then
			return false
		elseif not var11(p7) then
			return false
		elseif fFlagHideOfferNotificationsWhenShopEmpty and not var13(p7) then
			return false
		elseif fFlagOffersShopScopedNotificationModule then
			local robloxShop = var16[featureKeyModule.RobloxShop]
			
			if robloxShop ~= nil then
				for i, v in robloxShop do
					if isNotificationEligibleModule(v, var17) then
						return true
					end
				end
			end
			return false
		else
			for i, v in var16 do
				for i_1, v_1 in v do
					if isNotificationEligibleModule(v_1, var17) then
						return true
					end
				end
			end
			return false
		end
	end)
	local var18 = signalsModule.createComputed(function(p8)
		-- upvalues: var7 (ref), notificationLocationModule (copy), var3 (ref), var5 (ref), fFlagHideOfferNotificationsWhenShopEmpty (copy), var13 (ref), var9 (ref), var11 (ref), fFlagOffersShopScopedNotificationModule (copy), featureKeyModule (copy), isNotificationEligibleModule (copy)
		if var7(p8) then
			return notificationLocationModule.None
		end
		local var19 = var3(p8)
		local var20 = var5(p8)
		
		if var19 == nil or var20 == nil then
			return notificationLocationModule.None
		elseif fFlagHideOfferNotificationsWhenShopEmpty and not var13(p8) then
			return notificationLocationModule.None
		end
		local var21 = var9(p8)
		
		if not var21 and not var11(p8) then
			return notificationLocationModule.None
		end
		local var22 = if var21 then notificationLocationModule.GlobalIcon else notificationLocationModule.Hamburger
		
		if fFlagOffersShopScopedNotificationModule then
			local robloxShop = var19[featureKeyModule.RobloxShop]
			
			if robloxShop ~= nil then
				for i, v in robloxShop do
					if isNotificationEligibleModule(v, var20) then
						return var22
					end
				end
			end
			return notificationLocationModule.None
		else
			for i, v in var19 do
				for i_1, v_1 in v do
					if isNotificationEligibleModule(v_1, var20) then
						return var22
					end
				end
			end
			return notificationLocationModule.None
		end
	end)
	
	local function hydrateOfferExposureSnapshot(p9)
		-- upvalues: var5 (ref), var6 (ref)
		if var5(false) == nil then
			var6(p9)
		end
	end
	
	local function markInExperienceShopOpened()
		-- upvalues: var8 (ref)
		var8(true)
	end
	
	local var23 = if fFlagUseMockUserOffersModule then mockGetAllUserOffersModule else getAllUserOffersModule
	local var24 = nil
	local var25 = nil
	local var26 = 0
	local var27 = 0
	local scheduleExpirationRefetch = nil
	
	local function _()
		-- upvalues: var25 (write)
		if var25 ~= nil then
			pcall(task.cancel, var25)
			var25 = nil
		end
	end
	
	local function commitOffers(p9)
		-- upvalues: normalizePresentationData (copy), var4 (ref), fFlagOffersRespectExpirationModule (copy), scheduleExpirationRefetch (write)
		local t = {}
		
		for i, v in p9.offers do
			local t_1 = {
				offerId = v.offerId,
				offerStatus = v.offerStatus,
				featureKeys = v.featureKeys,
				expirationTimeInUTC = v.expirationTimeInUTC,
				presentationData = normalizePresentationData(v.presentationData)
			}
			
			for i_1, v_1 in t_1.featureKeys do
				local var28 = t[v_1]
				
				if var28 == nil then
					var28 = {}
					t[v_1] = var28
				end
				table.insert(var28, t_1)
			end
		end
		var4(t)
		
		if fFlagOffersRespectExpirationModule then
			scheduleExpirationRefetch(t)
		end
	end
	
	local _ = function(p10, p11)
		-- upvalues: bucketResponse (copy), mergeRequestedKeys (copy), var3 (ref), var4 (ref), fFlagOffersRespectExpirationModule (copy), scheduleExpirationRefetch (write)
		local var29 = mergeRequestedKeys(var3(false), bucketResponse(p11), p10)
		var4(var29)
		
		if fFlagOffersRespectExpirationModule then
			scheduleExpirationRefetch(var29)
		end
	end
	
	local function expireShopOffers()
		-- upvalues: var3 (ref), featureKeyModule (copy), var4 (ref)
		local var29 = var3(false)
		
		if var29 == nil or var29[featureKeyModule.RobloxShop] == nil then return end
		local t = {}
		
		for i, v in var29 do
			if i ~= featureKeyModule.RobloxShop then
				t[i] = v
			end
		end
		var4(t)
	end
	
	local _ = function(p10, p11)
		-- upvalues: var27 (write), commitOffers (ref)
		if p10 == var27 then
			commitOffers(p11)
			
			return
		end
	end
	
	local _ = function(p10, p11, p12)
		-- upvalues: var27 (write), bucketResponse (copy), mergeRequestedKeys (copy), var3 (ref), var4 (ref), fFlagOffersRespectExpirationModule (copy), scheduleExpirationRefetch (write)
		if p10 ~= var27 then return end
		local var30 = mergeRequestedKeys(var3(false), bucketResponse(p12), p11)
		var4(var30)
		
		if fFlagOffersRespectExpirationModule then
			scheduleExpirationRefetch(var30)
		end
	end
	
	local function fetchOffers(p10)
		-- upvalues: fFlagEnableUserOffers (copy), fFlagOffersRespectExpirationModule (copy), var24 (write), var25 (write), var27 (write), var23 (ref), fFlagOffersMergeStoreResultsModule (copy), bucketResponse (copy), mergeRequestedKeys (copy), var3 (ref), var4 (ref), scheduleExpirationRefetch (write), commitOffers (ref), offersDebugLoggerModule (copy)
		if not fFlagEnableUserOffers then return end
		if not fFlagOffersRespectExpirationModule then
			var23(p10):andThen(function(p11)
				-- upvalues: fFlagOffersMergeStoreResultsModule (copy), p10 (ref), bucketResponse (copy), mergeRequestedKeys (copy), var3 (copy), var4 (copy), fFlagOffersRespectExpirationModule (copy), scheduleExpirationRefetch (copy), commitOffers (copy)
				if fFlagOffersMergeStoreResultsModule then
					local var30 = mergeRequestedKeys(var3(false), bucketResponse(p11), p10)
					var4(var30)
					
					if fFlagOffersRespectExpirationModule then
						scheduleExpirationRefetch(var30)
						
						return
					end
				else
					commitOffers(p11)
				end
			end):catch(function(p11)
				-- upvalues: offersDebugLoggerModule (copy)
				offersDebugLoggerModule.log("fetchOffers failed: " .. tostring(p11))
			end)
			
			return
		end
		var24 = p10
		
		if var25 ~= nil then
			pcall(task.cancel, var25)
			var25 = nil
		end
		var27 += 1
		local var30 = var27
		var23(p10):andThen(function(p11)
			-- upvalues: fFlagOffersMergeStoreResultsModule (copy), var30 (ref), p10 (ref), var27 (copy), bucketResponse (copy), mergeRequestedKeys (copy), var3 (copy), var4 (copy), fFlagOffersRespectExpirationModule (copy), scheduleExpirationRefetch (copy), commitOffers (copy)
			if fFlagOffersMergeStoreResultsModule then
				local var31 = p10
				
				if var30 ~= var27 then return end
				local var32 = mergeRequestedKeys(var3(false), bucketResponse(p11), var31)
				var4(var32)
				
				if fFlagOffersRespectExpirationModule then
					scheduleExpirationRefetch(var32)
					
					return
				end
			elseif var30 ~= var27 then return end
			commitOffers(p11)
		end):catch(function(p11)
			-- upvalues: offersDebugLoggerModule (copy), var30 (ref), var27 (copy), var3 (copy), scheduleExpirationRefetch (copy)
			offersDebugLoggerModule.log("fetchOffers failed: " .. tostring(p11))
			
			if var30 == var27 then
				local var31 = var3(false)
				
				if var31 ~= nil then
					scheduleExpirationRefetch(var31)
				end
			end
		end)
	end
	
	local function armExpirationRefetch(p10, p11)
		-- upvalues: var26 (write), fIntOfferExpirationRefetchMaxCountModule (copy), fIntOfferExpirationRefetchBufferSecondsModule (copy), fIntOfferExpirationRefetchJitterSecondsModule (copy), var25 (write), var27 (write), var23 (ref), fFlagOffersMergeStoreResultsModule (copy), bucketResponse (copy), mergeRequestedKeys (copy), var3 (ref), var4 (ref), fFlagOffersRespectExpirationModule (copy), scheduleExpirationRefetch (write), commitOffers (ref), offersDebugLoggerModule (copy)
		if fIntOfferExpirationRefetchMaxCountModule <= var26 then return end
		local var30 = p11 + fIntOfferExpirationRefetchBufferSecondsModule
		
		if fIntOfferExpirationRefetchJitterSecondsModule > 0 then
			var30 += math.random() * fIntOfferExpirationRefetchJitterSecondsModule
		end
		var25 = task.delay(var30, function()
			-- upvalues: var25 (copy), var26 (copy), var27 (copy), var23 (copy), p10 (ref), fFlagOffersMergeStoreResultsModule (copy), bucketResponse (copy), mergeRequestedKeys (copy), var3 (copy), var4 (copy), fFlagOffersRespectExpirationModule (copy), scheduleExpirationRefetch (copy), commitOffers (copy), offersDebugLoggerModule (copy)
			var25 = nil
			var26 += 1
			var23(p10):andThen(function(p12)
				-- upvalues: fFlagOffersMergeStoreResultsModule (copy), var27 (ref), p10 (copy), var27 (copy), bucketResponse (copy), mergeRequestedKeys (copy), var3 (copy), var4 (copy), fFlagOffersRespectExpirationModule (copy), scheduleExpirationRefetch (copy), commitOffers (copy)
				if fFlagOffersMergeStoreResultsModule then
					local var31 = p10
					
					if var27 ~= var27 then return end
					local var32 = mergeRequestedKeys(var3(false), bucketResponse(p12), var31)
					var4(var32)
					
					if fFlagOffersRespectExpirationModule then
						scheduleExpirationRefetch(var32)
						
						return
					end
				elseif var27 ~= var27 then return end
				commitOffers(p12)
			end):catch(function(p12)
				-- upvalues: var27 (ref), var27 (copy), offersDebugLoggerModule (copy), var3 (copy), scheduleExpirationRefetch (copy)
				if var27 ~= var27 then return end
				offersDebugLoggerModule.log("expiration refetch failed: " .. tostring(p12))
				local var31 = var3(false)
				
				if var31 ~= nil then
					scheduleExpirationRefetch(var31)
				end
			end)
		end)
	end
	
	local _ = function(p10)
		-- upvalues: var25 (write), getSecondsUntilAnyKeyEmptiesModule (copy), armExpirationRefetch (ref)
		if var25 ~= nil then
			pcall(task.cancel, var25)
			var25 = nil
		end
		local var30 = getSecondsUntilAnyKeyEmptiesModule(p10)
		
		if var30 == nil then return end
		local t = {}
		
		for i in p10 do
			table.insert(t, i)
		end
		armExpirationRefetch(t, var30)
	end
	
	scheduleExpirationRefetch = function(p11)
		-- upvalues: fFlagOffersPerKeyExpiryRefetchModule (copy), var25 (write), getSecondsUntilAnyKeyEmptiesModule (copy), armExpirationRefetch (ref), var24 (write), getSecondsUntilNextExpirationModule (copy), var26 (write), fIntOfferExpirationRefetchMaxCountModule (copy), fIntOfferExpirationRefetchBufferSecondsModule (copy), fIntOfferExpirationRefetchJitterSecondsModule (copy), var27 (write), var23 (ref), fFlagOffersMergeStoreResultsModule (copy), bucketResponse (copy), mergeRequestedKeys (copy), var3 (ref), var4 (ref), fFlagOffersRespectExpirationModule (copy), scheduleExpirationRefetch (write), commitOffers (ref), offersDebugLoggerModule (copy), expireShopOffers (ref)
		if fFlagOffersPerKeyExpiryRefetchModule then
			if var25 ~= nil then
				pcall(task.cancel, var25)
				var25 = nil
			end
			local var31 = getSecondsUntilAnyKeyEmptiesModule(p11)
			
			if var31 == nil then return end
			local var32 = armExpirationRefetch
			local t = {}
			
			for i in p11 do
				table.insert(t, i)
			end
			var32(t, var31)
			
			return
		elseif var25 ~= nil then
			pcall(task.cancel, var25)
			var25 = nil
		end
		local var33 = getSecondsUntilNextExpirationModule(p11)
		
		if var24 == nil or var33 == nil then return end
		if fIntOfferExpirationRefetchMaxCountModule <= var26 then return end
		local var34 = var33 + fIntOfferExpirationRefetchBufferSecondsModule
		
		if fIntOfferExpirationRefetchJitterSecondsModule > 0 then
			var34 += math.random() * fIntOfferExpirationRefetchJitterSecondsModule
		end
		var25 = task.delay(var34, function()
			-- upvalues: var25 (copy), var26 (copy), var27 (copy), var23 (copy), var24 (ref), fFlagOffersMergeStoreResultsModule (copy), bucketResponse (copy), mergeRequestedKeys (copy), var3 (copy), var4 (copy), fFlagOffersRespectExpirationModule (copy), scheduleExpirationRefetch (copy), commitOffers (copy), offersDebugLoggerModule (copy), expireShopOffers (copy)
			var25 = nil
			var26 += 1
			var23(var24):andThen(function(p12)
				-- upvalues: fFlagOffersMergeStoreResultsModule (copy), var27 (ref), var24 (copy), var27 (copy), bucketResponse (copy), mergeRequestedKeys (copy), var3 (copy), var4 (copy), fFlagOffersRespectExpirationModule (copy), scheduleExpirationRefetch (copy), commitOffers (copy)
				if fFlagOffersMergeStoreResultsModule then
					local var35 = var24
					
					if var27 ~= var27 then return end
					local var36 = mergeRequestedKeys(var3(false), bucketResponse(p12), var35)
					var4(var36)
					
					if fFlagOffersRespectExpirationModule then
						scheduleExpirationRefetch(var36)
						
						return
					end
				elseif var27 ~= var27 then return end
				commitOffers(p12)
			end):catch(function(p12)
				-- upvalues: var27 (ref), var27 (copy), offersDebugLoggerModule (copy), expireShopOffers (copy)
				if var27 == var27 then
					offersDebugLoggerModule.log("expiration refetch failed, expiring shop offers: " .. tostring(p12))
					expireShopOffers()
					
					return
				end
			end)
		end)
	end
	
	return {
		getOffers = var3,
		getOfferNotificationShown = var15,
		getOfferNotificationShownWithEnum = var18,
		getOfferExposureSnapshot = var5,
		getHasInExperienceShopOpened = var7,
		getIsInExperienceShopGlobalIconAvailable = var9,
		getIsShopAvailable = var11,
		getShopHasItems = var13,
		fetchOffers = fetchOffers,
		hydrateOfferExposureSnapshot = hydrateOfferExposureSnapshot,
		markInExperienceShopOpened = markInExperienceShopOpened,
		setInExperienceShopGlobalIconAvailable = var10,
		setIsShopAvailable = var12,
		setShopHasItems = var14
	}
end