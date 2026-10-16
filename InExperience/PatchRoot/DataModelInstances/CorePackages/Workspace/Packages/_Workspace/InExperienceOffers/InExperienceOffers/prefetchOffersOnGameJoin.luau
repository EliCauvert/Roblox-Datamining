local InExperienceOffers = script:FindFirstAncestor("InExperienceOffers")
local FFlagEnableOffersPrefetch = require(InExperienceOffers.Parent.SharedFlags).FFlagEnableOffersPrefetch
local FIntOffersPrefetchDelayMsModule = require(InExperienceOffers.Flags.FIntOffersPrefetchDelayMs)
local GetOffersStoreModule = require(InExperienceOffers.Stores.GetOffersStore)
local _ = require(InExperienceOffers.Enums.FeatureKey)
local WhenJoinSettlesModule = require(InExperienceOffers.JoinLifecycle.whenJoinSettles)
local SchedulePrefetchDelayModule = require(InExperienceOffers.JoinLifecycle.schedulePrefetchDelay)
local OffersDebugLoggerModule = require(InExperienceOffers.Internal.OffersDebugLogger)
local v1 = (function(Text: string) --[[ Line: 21 | Named "parseFeatureKeys" ]]
	local List = {}
	
	for _, value in string.split(Text, ",") do
		local SS = value:match("^%s*(.-)%s*$")
		
		if SS and SS ~= "" then
			table.insert(List, SS)
		end
	end
	return List
end)((require(InExperienceOffers.Flags.FStringOffersPrefetchFeatureKeys)))

local function triggerFetch() --[[ Line: 34 ]]
	-- upvalues: v1 (copy), GetOffersStoreModule (copy)
	if #v1 ~= 0 then
		GetOffersStoreModule(false).fetchOffers(v1)
		
		return
	end
end

return function() --[[ Line: 46 | Named "prefetchOffersOnGameJoin" ]]
	-- upvalues: FFlagEnableOffersPrefetch (copy), OffersDebugLoggerModule (copy), WhenJoinSettlesModule (copy), FIntOffersPrefetchDelayMsModule (copy), v1 (copy), GetOffersStoreModule (copy), SchedulePrefetchDelayModule (copy), triggerFetch (copy)
	if FFlagEnableOffersPrefetch then
		OffersDebugLoggerModule.log("prefetchOffersOnGameJoin: waiting for join to settle")
		WhenJoinSettlesModule(function(p1) --[[ Line: 51 ]]
			-- upvalues: OffersDebugLoggerModule (upval), FIntOffersPrefetchDelayMsModule (upval), v1 (upval), GetOffersStoreModule (upval), SchedulePrefetchDelayModule (upval), triggerFetch (upval)
			OffersDebugLoggerModule.logLazy(function(): string --[[ Line: 52 ]]
				-- upvalues: p1 (copy)
				return "prefetchOffersOnGameJoin: join settled path=" .. p1
			end)
			
			if FIntOffersPrefetchDelayMsModule > 0 then
				SchedulePrefetchDelayModule(FIntOffersPrefetchDelayMsModule / 1000, triggerFetch)
				
				return
			end
			if #v1 ~= 0 then
				GetOffersStoreModule(false).fetchOffers(v1)
				
				return
			end
		end)
		
		return
	end
end