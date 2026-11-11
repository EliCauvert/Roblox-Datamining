local ExperimentCacheManager = require(script:FindFirstAncestor("SocialExperiments").Parent.ExperimentCacheManager).ExperimentCacheManager
local FStringPartyPageCarouselExpLayer = game:DefineFastString("FStringPartyPageCarouselExpLayer", "Party.Coordination.UI")
local PartyPageCarouselVariant = game:DefineFastString("PartyPageCarouselVariant", "enablePartyCoordinationUi")
local ForceEnableSocialCarouselPartyPage5 = game:DefineFastFlag("ForceEnableSocialCarouselPartyPage5", false)
local EnablePartyPageCarouselExperimentation4 = game:DefineFastFlag("EnablePartyPageCarouselExperimentation4", false)

local function _(p1)
	-- upvalues: ExperimentCacheManager (copy), FStringPartyPageCarouselExpLayer (copy)
	local LayerVariables = ExperimentCacheManager.default:getLayerVariables(FStringPartyPageCarouselExpLayer)
	
	return if LayerVariables and LayerVariables[p1] ~= nil then LayerVariables[p1] else false
end

return {
	getAppChatFormFactorEnabled = function()
		-- upvalues: ForceEnableSocialCarouselPartyPage5 (copy), EnablePartyPageCarouselExperimentation4 (copy), PartyPageCarouselVariant (copy), ExperimentCacheManager (copy), FStringPartyPageCarouselExpLayer (copy)
		local Flag: boolean = ForceEnableSocialCarouselPartyPage5
		
		if not Flag then
			Flag = EnablePartyPageCarouselExperimentation4
			
			if Flag then
				local LayerVariables = ExperimentCacheManager.default:getLayerVariables(FStringPartyPageCarouselExpLayer)
				
				if LayerVariables and LayerVariables[PartyPageCarouselVariant] ~= nil then
					return LayerVariables[PartyPageCarouselVariant]
				end
				Flag = false
			end
		end
		return Flag
	end,
	getPartyPageCarouselEnabled = function()
		-- upvalues: ForceEnableSocialCarouselPartyPage5 (copy), EnablePartyPageCarouselExperimentation4 (copy), PartyPageCarouselVariant (copy), ExperimentCacheManager (copy), FStringPartyPageCarouselExpLayer (copy)
		local Flag: boolean = ForceEnableSocialCarouselPartyPage5
		
		if not Flag then
			Flag = EnablePartyPageCarouselExperimentation4
			
			if Flag then
				local LayerVariables = ExperimentCacheManager.default:getLayerVariables(FStringPartyPageCarouselExpLayer)
				
				if LayerVariables and LayerVariables[PartyPageCarouselVariant] ~= nil then
					return LayerVariables[PartyPageCarouselVariant]
				end
				Flag = false
			end
		end
		return Flag
	end,
	logExposure = function()
		-- upvalues: EnablePartyPageCarouselExperimentation4 (copy), ExperimentCacheManager (copy), FStringPartyPageCarouselExpLayer (copy)
		if EnablePartyPageCarouselExperimentation4 and ExperimentCacheManager.default:getLayerVariables(FStringPartyPageCarouselExpLayer) ~= nil then
			ExperimentCacheManager.default:logLayerExposure(FStringPartyPageCarouselExpLayer)
		end
	end
}