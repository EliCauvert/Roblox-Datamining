local experimentCacheManager = require(script:FindFirstAncestor("SocialExperiments").Parent.ExperimentCacheManager).ExperimentCacheManager
local fStringPartyPageCarouselExpLayer = game:DefineFastString("FStringPartyPageCarouselExpLayer", "Party.Coordination.UI")
local partyPageCarouselVariant = game:DefineFastString("PartyPageCarouselVariant", "enablePartyCoordinationUi")
local forceEnableSocialCarouselPartyPage5 = game:DefineFastFlag("ForceEnableSocialCarouselPartyPage5", false)
local enablePartyPageCarouselExperimentation4 = game:DefineFastFlag("EnablePartyPageCarouselExperimentation4", false)

local function _(p1)
	-- upvalues: experimentCacheManager (ref), fStringPartyPageCarouselExpLayer (ref)
	local var1 = experimentCacheManager.default:getLayerVariables(fStringPartyPageCarouselExpLayer)
	
	return if var1 and var1[p1] ~= nil then var1[p1] else false
end

return {
	getAppChatFormFactorEnabled = function()
		-- upvalues: forceEnableSocialCarouselPartyPage5 (ref), enablePartyPageCarouselExperimentation4 (ref), partyPageCarouselVariant (ref), experimentCacheManager (ref), fStringPartyPageCarouselExpLayer (ref)
		local var1 = forceEnableSocialCarouselPartyPage5
		
		if not var1 then
			var1 = enablePartyPageCarouselExperimentation4
			
			if var1 then
				local var2 = partyPageCarouselVariant
				local var3 = experimentCacheManager.default:getLayerVariables(fStringPartyPageCarouselExpLayer)
				
				if var3 and var3[var2] ~= nil then
					return var3[var2]
				end
				var1 = false
			end
		end
		return var1
	end,
	getPartyPageCarouselEnabled = function()
		-- upvalues: forceEnableSocialCarouselPartyPage5 (ref), enablePartyPageCarouselExperimentation4 (ref), partyPageCarouselVariant (ref), experimentCacheManager (ref), fStringPartyPageCarouselExpLayer (ref)
		local var1 = forceEnableSocialCarouselPartyPage5
		
		if not var1 then
			var1 = enablePartyPageCarouselExperimentation4
			
			if var1 then
				local var2 = partyPageCarouselVariant
				local var3 = experimentCacheManager.default:getLayerVariables(fStringPartyPageCarouselExpLayer)
				
				if var3 and var3[var2] ~= nil then
					return var3[var2]
				end
				var1 = false
			end
		end
		return var1
	end,
	logExposure = function()
		-- upvalues: enablePartyPageCarouselExperimentation4 (ref), experimentCacheManager (ref), fStringPartyPageCarouselExpLayer (ref)
		if enablePartyPageCarouselExperimentation4 and experimentCacheManager.default:getLayerVariables(fStringPartyPageCarouselExpLayer) ~= nil then
			experimentCacheManager.default:logLayerExposure(fStringPartyPageCarouselExpLayer)
		end
	end
}