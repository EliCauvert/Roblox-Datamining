local inExperienceOffers = script:FindFirstAncestor("InExperienceOffers")
local parent = inExperienceOffers.Parent
local _ = require(parent.Promise)
local sharedFlagsModule = require(parent.SharedFlags)
local _ = require(parent.Signals)
local createSessionScopedSignal = require(parent.SignalsUtils).createSessionScopedSignal
local getAllUserOffersModule = require(inExperienceOffers.Api.getAllUserOffers)
local offersDebugLoggerModule = require(inExperienceOffers.Internal.OffersDebugLogger)
local _ = require(inExperienceOffers.Types)
local mockGetAllUserOffersModule = require(inExperienceOffers.Mocks.MockGetAllUserOffers)
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
	-- upvalues: createSessionScopedSignal (ref), fFlagUseMockUserOffersModule (ref), mockGetAllUserOffersModule (ref), getAllUserOffersModule (ref), normalizePresentationData (ref), fFlagEnableUserOffers (ref), offersDebugLoggerModule (ref)
	local var1, var2 = createSessionScopedSignal(nil)
	local var3 = if fFlagUseMockUserOffersModule then mockGetAllUserOffersModule else getAllUserOffersModule
	
	local function commitOffers(p2)
		-- upvalues: normalizePresentationData (copy), var2 (ref)
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
				local var4 = t[v_1]
				
				if var4 == nil then
					var4 = {}
					t[v_1] = var4
				end
				table.insert(var4, t_1)
			end
		end
		var2(t)
	end
	
	return {
		getOffers = var1,
		fetchOffers = function(p3)
			-- upvalues: fFlagEnableUserOffers (copy), var3 (ref), commitOffers (ref), offersDebugLoggerModule (copy)
			if fFlagEnableUserOffers then
				var3(p3):andThen(commitOffers):catch(function(p4)
					-- upvalues: offersDebugLoggerModule (copy)
					offersDebugLoggerModule.log("fetchOffers failed: " .. tostring(p4))
				end)
				
				return
			end
		end
	}
end