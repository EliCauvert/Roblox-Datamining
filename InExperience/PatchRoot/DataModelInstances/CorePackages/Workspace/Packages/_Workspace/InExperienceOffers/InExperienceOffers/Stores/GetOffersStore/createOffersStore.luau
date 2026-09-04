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
local isNotificationEligibleModule = require(inExperienceOffers.Utils.isNotificationEligible)
local featureKeyModule = require(inExperienceOffers.Enums.FeatureKey)
local notificationLocationModule = require(inExperienceOffers.Enums.NotificationLocation)
local fFlagEnableUserOffers = sharedFlagsModule.FFlagEnableUserOffers
local fFlagOffersRespectExpirationModule = require(inExperienceOffers.Flags.FFlagOffersRespectExpiration)
local fFlagUseMockUserOffersModule = require(inExperienceOffers.Flags.FFlagUseMockUserOffers)
local fIntOfferExpirationRefetchBufferSecondsModule = require(inExperienceOffers.Flags.FIntOfferExpirationRefetchBufferSeconds)
local fIntOfferExpirationRefetchJitterSecondsModule = require(inExperienceOffers.Flags.FIntOfferExpirationRefetchJitterSeconds)
local fIntOfferExpirationRefetchMaxCountModule = require(inExperienceOffers.Flags.FIntOfferExpirationRefetchMaxCount)

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

return function()
	-- upvalues: createSessionScopedSignal (ref), signalsModule (ref), isNotificationEligibleModule (ref), notificationLocationModule (ref), fFlagUseMockUserOffersModule (ref), mockGetAllUserOffersModule (ref), getAllUserOffersModule (ref), normalizePresentationData (ref), fFlagOffersRespectExpirationModule (ref), featureKeyModule (ref), fFlagEnableUserOffers (ref), offersDebugLoggerModule (ref), getSecondsUntilNextExpirationModule (ref), fIntOfferExpirationRefetchMaxCountModule (ref), fIntOfferExpirationRefetchBufferSecondsModule (ref), fIntOfferExpirationRefetchJitterSecondsModule (ref)
	local var1, var2 = createSessionScopedSignal(nil)
	local var3, var4 = createSessionScopedSignal(nil)
	local var5, var6 = createSessionScopedSignal(false)
	local var7, var8 = signalsModule.createSignal(false)
	local var9, var10 = signalsModule.createSignal(true)
	local var11 = signalsModule.createComputed(function(p2)
		-- upvalues: var1 (ref), var3 (ref), var9 (ref), isNotificationEligibleModule (copy)
		local var12 = var1(p2)
		local var13 = var3(p2)
		
		if var12 == nil or var13 == nil then
			return false
		elseif not var9(p2) then
			return false
		end
		for i, v in var12 do
			for i_1, v_1 in v do
				if isNotificationEligibleModule(v_1, var13) then
					return true
				end
			end
		end
		return false
	end)
	local var14 = signalsModule.createComputed(function(p3)
		-- upvalues: var5 (ref), notificationLocationModule (copy), var1 (ref), var3 (ref), var7 (ref), var9 (ref), isNotificationEligibleModule (copy)
		if var5(p3) then
			return notificationLocationModule.None
		end
		local var15 = var1(p3)
		local var16 = var3(p3)
		
		if var15 == nil or var16 == nil then
			return notificationLocationModule.None
		end
		local var17 = var7(p3)
		
		if not var17 and not var9(p3) then
			return notificationLocationModule.None
		end
		local var18 = if var17 then notificationLocationModule.GlobalIcon else notificationLocationModule.Hamburger
		
		for i, v in var15 do
			for i_1, v_1 in v do
				if isNotificationEligibleModule(v_1, var16) then
					return var18
				end
			end
		end
		return notificationLocationModule.None
	end)
	
	local function hydrateOfferExposureSnapshot(p4)
		-- upvalues: var3 (ref), var4 (ref)
		if var3(false) == nil then
			var4(p4)
		end
	end
	
	local function markInExperienceShopOpened()
		-- upvalues: var6 (ref)
		var6(true)
	end
	
	local var19 = if fFlagUseMockUserOffersModule then mockGetAllUserOffersModule else getAllUserOffersModule
	local var20 = nil
	local var21 = nil
	local var22 = 0
	local var23 = 0
	local scheduleExpirationRefetch = nil
	
	local function _()
		-- upvalues: var21 (write)
		if var21 ~= nil then
			pcall(task.cancel, var21)
			var21 = nil
		end
	end
	
	local function commitOffers(p4)
		-- upvalues: normalizePresentationData (copy), var2 (ref), fFlagOffersRespectExpirationModule (copy), scheduleExpirationRefetch (write)
		local t = {}
		
		for i, v in p4.offers do
			local t_1 = {
				offerId = v.offerId,
				offerStatus = v.offerStatus,
				featureKeys = v.featureKeys,
				expirationTimeInUTC = v.expirationTimeInUTC,
				presentationData = normalizePresentationData(v.presentationData)
			}
			
			for i_1, v_1 in t_1.featureKeys do
				local var24 = t[v_1]
				
				if var24 == nil then
					var24 = {}
					t[v_1] = var24
				end
				table.insert(var24, t_1)
			end
		end
		var2(t)
		
		if fFlagOffersRespectExpirationModule then
			scheduleExpirationRefetch(t)
		end
	end
	
	local function expireShopOffers()
		-- upvalues: var1 (ref), featureKeyModule (copy), var2 (ref)
		local var25 = var1(false)
		
		if var25 == nil or var25[featureKeyModule.RobloxShop] == nil then return end
		local t = {}
		
		for i, v in var25 do
			if i ~= featureKeyModule.RobloxShop then
				t[i] = v
			end
		end
		var2(t)
	end
	
	local _ = function(p5, p6)
		-- upvalues: var23 (write), commitOffers (ref)
		if p5 == var23 then
			commitOffers(p6)
			
			return
		end
	end
	
	local function fetchOffers(p5)
		-- upvalues: fFlagEnableUserOffers (copy), fFlagOffersRespectExpirationModule (copy), var20 (write), var21 (write), var23 (write), var19 (ref), commitOffers (ref), offersDebugLoggerModule (copy), var1 (ref), scheduleExpirationRefetch (write)
		if not fFlagEnableUserOffers then return end
		if not fFlagOffersRespectExpirationModule then
			var19(p5):andThen(commitOffers):catch(function(p6)
				-- upvalues: offersDebugLoggerModule (copy)
				offersDebugLoggerModule.log("fetchOffers failed: " .. tostring(p6))
			end)
			
			return
		end
		var20 = p5
		
		if var21 ~= nil then
			pcall(task.cancel, var21)
			var21 = nil
		end
		var23 += 1
		local var26 = var23
		var19(p5):andThen(function(p6)
			-- upvalues: var26 (ref), var23 (copy), commitOffers (copy)
			if var26 == var23 then
				commitOffers(p6)
				
				return
			end
		end):catch(function(p6)
			-- upvalues: offersDebugLoggerModule (copy), var26 (ref), var23 (copy), var1 (copy), scheduleExpirationRefetch (copy)
			offersDebugLoggerModule.log("fetchOffers failed: " .. tostring(p6))
			
			if var26 == var23 then
				local var27 = var1(false)
				
				if var27 ~= nil then
					scheduleExpirationRefetch(var27)
				end
			end
		end)
	end
	
	scheduleExpirationRefetch = function(p5)
		-- upvalues: var21 (write), var20 (write), getSecondsUntilNextExpirationModule (copy), var22 (write), fIntOfferExpirationRefetchMaxCountModule (copy), fIntOfferExpirationRefetchBufferSecondsModule (copy), fIntOfferExpirationRefetchJitterSecondsModule (copy), var23 (write), var19 (ref), commitOffers (ref), offersDebugLoggerModule (copy), expireShopOffers (ref)
		if var21 ~= nil then
			pcall(task.cancel, var21)
			var21 = nil
		end
		local var26 = getSecondsUntilNextExpirationModule(p5)
		
		if var20 == nil or var26 == nil then return end
		if fIntOfferExpirationRefetchMaxCountModule <= var22 then return end
		local var27 = var26 + fIntOfferExpirationRefetchBufferSecondsModule
		
		if fIntOfferExpirationRefetchJitterSecondsModule > 0 then
			var27 += math.random() * fIntOfferExpirationRefetchJitterSecondsModule
		end
		var21 = task.delay(var27, function()
			-- upvalues: var21 (copy), var22 (copy), var23 (copy), var19 (copy), var20 (ref), commitOffers (copy), offersDebugLoggerModule (copy), expireShopOffers (copy)
			var21 = nil
			var22 += 1
			var19(var20):andThen(function(p6)
				-- upvalues: var23 (ref), var23 (copy), commitOffers (copy)
				if var23 == var23 then
					commitOffers(p6)
					
					return
				end
			end):catch(function(p6)
				-- upvalues: var23 (ref), var23 (copy), offersDebugLoggerModule (copy), expireShopOffers (copy)
				if var23 == var23 then
					offersDebugLoggerModule.log("expiration refetch failed, expiring shop offers: " .. tostring(p6))
					expireShopOffers()
					
					return
				end
			end)
		end)
	end
	
	return {
		getOffers = var1,
		getOfferNotificationShown = var11,
		getOfferNotificationShownWithEnum = var14,
		getOfferExposureSnapshot = var3,
		getHasInExperienceShopOpened = var5,
		getIsInExperienceShopGlobalIconAvailable = var7,
		getIsShopAvailable = var9,
		fetchOffers = fetchOffers,
		hydrateOfferExposureSnapshot = hydrateOfferExposureSnapshot,
		markInExperienceShopOpened = markInExperienceShopOpened,
		setInExperienceShopGlobalIconAvailable = var8,
		setIsShopAvailable = var10
	}
end