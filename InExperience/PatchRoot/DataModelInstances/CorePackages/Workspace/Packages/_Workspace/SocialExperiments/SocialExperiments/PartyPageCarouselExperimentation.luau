local experimentCacheManager = require(script:FindFirstAncestor("SocialExperiments").Parent.ExperimentCacheManager).ExperimentCacheManager
local fStringPartyPageCarouselExpLayer = game:DefineFastString("FStringPartyPageCarouselExpLayer", "Party.Coordination.UI")
local partyPageCarouselVariant = game:DefineFastString("PartyPageCarouselVariant", "enablePartyCoordinationUi")
local forceEnableSocialCarouselPartyPage5 = game:DefineFastFlag("ForceEnableSocialCarouselPartyPage5", false)
local enablePartyPageCarouselExperimentation4 = game:DefineFastFlag("EnablePartyPageCarouselExperimentation4", false)

local function _(p0)
	-- upvalues: experimentCacheManager (ref), fStringPartyPageCarouselExpLayer (ref)
	local var4 = experimentCacheManager.default:getLayerVariables(fStringPartyPageCarouselExpLayer)
	
	return if var4 and var4[p0] ~= nil then var4[p0] else false
end

return {
	getAppChatFormFactorEnabled = function()
		-- upvalues: forceEnableSocialCarouselPartyPage5 (ref), enablePartyPageCarouselExperimentation4 (ref), partyPageCarouselVariant (ref), experimentCacheManager (ref), fStringPartyPageCarouselExpLayer (ref)
		local var5 = forceEnableSocialCarouselPartyPage5
		
		if not var5 then
			var5 = enablePartyPageCarouselExperimentation4
			
			if var5 then
				local var6 = partyPageCarouselVariant
				local var7 = experimentCacheManager.default:getLayerVariables(fStringPartyPageCarouselExpLayer)
				
				if var7 and var7[var6] ~= nil then
					return var7[var6]
				end
				var5 = false
			end
		end
		return var5
	end,
	getPartyPageCarouselEnabled = function()
		-- upvalues: forceEnableSocialCarouselPartyPage5 (ref), enablePartyPageCarouselExperimentation4 (ref), partyPageCarouselVariant (ref), experimentCacheManager (ref), fStringPartyPageCarouselExpLayer (ref)
		local var8 = forceEnableSocialCarouselPartyPage5
		
		if not var8 then
			var8 = enablePartyPageCarouselExperimentation4
			
			if var8 then
				local var9 = partyPageCarouselVariant
				local var10 = experimentCacheManager.default:getLayerVariables(fStringPartyPageCarouselExpLayer)
				
				if var10 and var10[var9] ~= nil then
					return var10[var9]
				end
				var8 = false
			end
		end
		return var8
	end,
	logExposure = function()
		-- upvalues: enablePartyPageCarouselExperimentation4 (ref), experimentCacheManager (ref), fStringPartyPageCarouselExpLayer (ref)
		if enablePartyPageCarouselExperimentation4 and experimentCacheManager.default:getLayerVariables(fStringPartyPageCarouselExpLayer) ~= nil then
			experimentCacheManager.default:logLayerExposure(fStringPartyPageCarouselExpLayer)
		end
	end
}