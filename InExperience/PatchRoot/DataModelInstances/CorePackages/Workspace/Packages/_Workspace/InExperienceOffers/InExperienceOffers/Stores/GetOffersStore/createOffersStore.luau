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
	-- upvalues: createSessionScopedSignal (ref), signalsModule (ref), isNotificationEligibleModule (ref), fFlagUseMockUserOffersModule (ref), mockGetAllUserOffersModule (ref), getAllUserOffersModule (ref), normalizePresentationData (ref), fFlagEnableUserOffers (ref), offersDebugLoggerModule (ref)
	local var1, var2 = createSessionScopedSignal(nil)
	local var3, var4 = createSessionScopedSignal(nil)
	local var5, var6 = signalsModule.createSignal(true)
	local var7 = signalsModule.createComputed(function(p2)
		-- upvalues: var1 (ref), var3 (ref), var5 (ref), isNotificationEligibleModule (copy)
		local var8 = var1(p2)
		local var9 = var3(p2)
		
		if var8 == nil or var9 == nil then
			return false
		elseif not var5(p2) then
			return false
		end
		for i, v in var8 do
			for i_1, v_1 in v do
				if isNotificationEligibleModule(v_1, var9) then
					return true
				end
			end
		end
		return false
	end)
	
	local function hydrateOfferExposureSnapshot(p3)
		-- upvalues: var3 (ref), var4 (ref)
		if var3(false) == nil then
			var4(p3)
		end
	end
	
	local var10 = if fFlagUseMockUserOffersModule then mockGetAllUserOffersModule else getAllUserOffersModule
	
	local function commitOffers(p3)
		-- upvalues: normalizePresentationData (copy), var2 (ref)
		local t = {}
		
		for i, v in p3.offers do
			local t_1 = {
				offerId = v.offerId,
				offerStatus = v.offerStatus,
				featureKeys = v.featureKeys,
				expirationTimeInUTC = v.expirationTimeInUTC,
				presentationData = normalizePresentationData(v.presentationData)
			}
			
			for i_1, v_1 in t_1.featureKeys do
				local var11 = t[v_1]
				
				if var11 == nil then
					var11 = {}
					t[v_1] = var11
				end
				table.insert(var11, t_1)
			end
		end
		var2(t)
	end
	
	return {
		getOffers = var1,
		getOfferNotificationShown = var7,
		getOfferExposureSnapshot = var3,
		getIsShopAvailable = var5,
		fetchOffers = function(p4)
			-- upvalues: fFlagEnableUserOffers (copy), var10 (ref), commitOffers (ref), offersDebugLoggerModule (copy)
			if fFlagEnableUserOffers then
				var10(p4):andThen(commitOffers):catch(function(p5)
					-- upvalues: offersDebugLoggerModule (copy)
					offersDebugLoggerModule.log("fetchOffers failed: " .. tostring(p5))
				end)
				
				return
			end
		end,
		hydrateOfferExposureSnapshot = hydrateOfferExposureSnapshot,
		setIsShopAvailable = var6
	}
end