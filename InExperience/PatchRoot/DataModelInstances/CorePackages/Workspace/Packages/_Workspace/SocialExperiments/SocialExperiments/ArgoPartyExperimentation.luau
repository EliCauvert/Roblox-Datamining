local experimentCacheManager = require(script:FindFirstAncestor("SocialExperiments").Parent.ExperimentCacheManager).ExperimentCacheManager
local argoPartyLayer = game:DefineFastString("ArgoPartyLayer", "Social.ConnectTab")
local argoPartyVariant = game:DefineFastString("ArgoPartyVariant", "enableArgoPartyChanges")
local forceEnableArgoPartyChanges7 = game:DefineFastFlag("ForceEnableArgoPartyChanges7", false)
local enableArgoPartyExperimentation7 = game:DefineFastFlag("EnableArgoPartyExperimentation7", false)
local enableArgoPartyChanges = game:DefineFastFlag("EnableArgoPartyChanges", false)

local function _(p0)
	-- upvalues: experimentCacheManager (ref), argoPartyLayer (ref)
	local var5 = experimentCacheManager.default:getLayerVariables(argoPartyLayer)
	
	return if var5 and var5[p0] ~= nil then var5[p0] else false
end

return {
	getIsRenameEnabled = function()
		-- upvalues: forceEnableArgoPartyChanges7 (ref), enableArgoPartyChanges (ref), enableArgoPartyExperimentation7 (ref), argoPartyVariant (ref), experimentCacheManager (ref), argoPartyLayer (ref)
		local var6 = forceEnableArgoPartyChanges7
		
		if not var6 then
			var6 = enableArgoPartyChanges
			
			if not var6 then
				var6 = enableArgoPartyExperimentation7
				
				if var6 then
					local var7 = argoPartyVariant
					local var8 = experimentCacheManager.default:getLayerVariables(argoPartyLayer)
					
					if var8 and var8[var7] ~= nil then
						return var8[var7]
					end
					var6 = false
				end
			end
		end
		return var6
	end
}