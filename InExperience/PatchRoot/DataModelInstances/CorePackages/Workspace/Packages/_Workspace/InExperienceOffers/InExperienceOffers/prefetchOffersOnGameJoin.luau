local inExperienceOffers = script:FindFirstAncestor("InExperienceOffers")
local fFlagEnableOffersPrefetch = require(inExperienceOffers.Parent.SharedFlags).FFlagEnableOffersPrefetch
local fIntOffersPrefetchDelayMsModule = require(inExperienceOffers.Flags.FIntOffersPrefetchDelayMs)
local fStringOffersPrefetchFeatureKeysModule = require(inExperienceOffers.Flags.FStringOffersPrefetchFeatureKeys)
local getOffersStoreModule = require(inExperienceOffers.Stores.GetOffersStore)
local _ = require(inExperienceOffers.Enums.FeatureKey)
local whenJoinSettlesModule = require(inExperienceOffers.JoinLifecycle.whenJoinSettles)
local schedulePrefetchDelayModule = require(inExperienceOffers.JoinLifecycle.schedulePrefetchDelay)
local offersDebugLoggerModule = require(inExperienceOffers.Internal.OffersDebugLogger)
local var1 = (function(p1)
	local t = {}
	
	for i, v in string.split(p1, ",") do
		local var2 = v:match("^%s*(.-)%s*$")
		
		if var2 and var2 ~= "" then
			table.insert(t, var2)
		end
	end
	return t
end)(fStringOffersPrefetchFeatureKeysModule)

local function triggerFetch()
	-- upvalues: var1 (ref), getOffersStoreModule (ref)
	if #var1 == 0 then
		return
	end
	getOffersStoreModule(false).fetchOffers(var1)
end

return function()
	-- upvalues: fFlagEnableOffersPrefetch (ref), offersDebugLoggerModule (ref), whenJoinSettlesModule (ref), fIntOffersPrefetchDelayMsModule (ref), var1 (ref), getOffersStoreModule (ref), schedulePrefetchDelayModule (ref), triggerFetch (ref)
	if fFlagEnableOffersPrefetch then
		offersDebugLoggerModule.log("prefetchOffersOnGameJoin: waiting for join to settle")
		whenJoinSettlesModule(function(p2)
			-- upvalues: offersDebugLoggerModule (copy), fIntOffersPrefetchDelayMsModule (copy), var1 (copy), getOffersStoreModule (copy), schedulePrefetchDelayModule (copy), triggerFetch (copy)
			offersDebugLoggerModule.logLazy(function()
				-- upvalues: p2 (ref)
				return "prefetchOffersOnGameJoin: join settled path=" .. p1
			end)
			
			if fIntOffersPrefetchDelayMsModule > 0 then
				schedulePrefetchDelayModule(fIntOffersPrefetchDelayMsModule / 1000, triggerFetch)
				
				return
			elseif #var1 == 0 then
				return
			end
			getOffersStoreModule(false).fetchOffers(var1)
		end)
		
		return
	end
end