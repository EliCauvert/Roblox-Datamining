local ExperimentCacheManager = require(script:FindFirstAncestor("SocialExperiments").Parent.ExperimentCacheManager).ExperimentCacheManager
local ArgoPartyLayer = game:DefineFastString("ArgoPartyLayer", "Social.ConnectTab")
local ArgoPartyVariant = game:DefineFastString("ArgoPartyVariant", "enableArgoPartyChanges")
local ForceEnableArgoPartyChanges7 = game:DefineFastFlag("ForceEnableArgoPartyChanges7", false)
local EnableArgoPartyExperimentation7 = game:DefineFastFlag("EnableArgoPartyExperimentation7", false)
local EnableArgoPartyChanges = game:DefineFastFlag("EnableArgoPartyChanges", false)

local function _(p1)
	-- upvalues: ExperimentCacheManager (copy), ArgoPartyLayer (copy)
	local LayerVariables = ExperimentCacheManager.default:getLayerVariables(ArgoPartyLayer)
	
	return if LayerVariables and LayerVariables[p1] ~= nil then LayerVariables[p1] else false
end

return {
	getIsRenameEnabled = function()
		-- upvalues: ForceEnableArgoPartyChanges7 (copy), EnableArgoPartyChanges (copy), EnableArgoPartyExperimentation7 (copy), ArgoPartyVariant (copy), ExperimentCacheManager (copy), ArgoPartyLayer (copy)
		local Flag: boolean = ForceEnableArgoPartyChanges7
		
		if not Flag then
			Flag = EnableArgoPartyChanges
			
			if not Flag then
				Flag = EnableArgoPartyExperimentation7
				
				if Flag then
					local LayerVariables = ExperimentCacheManager.default:getLayerVariables(ArgoPartyLayer)
					
					if LayerVariables and LayerVariables[ArgoPartyVariant] ~= nil then
						return LayerVariables[ArgoPartyVariant]
					end
					Flag = false
				end
			end
		end
		return Flag
	end
}