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
local isNotificationEligibleModule = require(inExperienceOffers.Utils.isNotificationEligible)
local notificationLocationModule = require(inExperienceOffers.Enums.NotificationLocation)
local fFlagEnableUserOffers = sharedFlagsModule.FFlagEnableUserOffers
local fFlagUseMockUserOffersModule = require(inExperienceOffers.Flags.FFlagUseMockUserOffers)

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
	-- upvalues: createSessionScopedSignal (ref), signalsModule (ref), isNotificationEligibleModule (ref), notificationLocationModule (ref), fFlagUseMockUserOffersModule (ref), mockGetAllUserOffersModule (ref), getAllUserOffersModule (ref), normalizePresentationData (ref), fFlagEnableUserOffers (ref), offersDebugLoggerModule (ref)
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
	
	local function commitOffers(p4)
		-- upvalues: normalizePresentationData (copy), var2 (ref)
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
				local var20 = t[v_1]
				
				if var20 == nil then
					var20 = {}
					t[v_1] = var20
				end
				table.insert(var20, t_1)
			end
		end
		var2(t)
	end
	
	return {
		getOffers = var1,
		getOfferNotificationShown = var11,
		getOfferNotificationShownWithEnum = var14,
		getOfferExposureSnapshot = var3,
		getHasInExperienceShopOpened = var5,
		getIsInExperienceShopGlobalIconAvailable = var7,
		getIsShopAvailable = var9,
		fetchOffers = function(p5)
			-- upvalues: fFlagEnableUserOffers (copy), var19 (ref), commitOffers (ref), offersDebugLoggerModule (copy)
			if fFlagEnableUserOffers then
				var19(p5):andThen(commitOffers):catch(function(p6)
					-- upvalues: offersDebugLoggerModule (copy)
					offersDebugLoggerModule.log("fetchOffers failed: " .. tostring(p6))
				end)
				
				return
			end
		end,
		hydrateOfferExposureSnapshot = hydrateOfferExposureSnapshot,
		markInExperienceShopOpened = markInExperienceShopOpened,
		setInExperienceShopGlobalIconAvailable = var8,
		setIsShopAvailable = var10
	}
end