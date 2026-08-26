local experimentCacheManager = require(script:FindFirstAncestor("SocialExperiments").Parent.ExperimentCacheManager).ExperimentCacheManager
local argoPartyLayer = game:DefineFastString("ArgoPartyLayer", "Social.ConnectTab")
local argoPartyVariant = game:DefineFastString("ArgoPartyVariant", "enableArgoPartyChanges")
local forceEnableArgoPartyChanges7 = game:DefineFastFlag("ForceEnableArgoPartyChanges7", false)
local enableArgoPartyExperimentation7 = game:DefineFastFlag("EnableArgoPartyExperimentation7", false)
local enableArgoPartyChanges = game:DefineFastFlag("EnableArgoPartyChanges", false)

local function _(p1)
	-- upvalues: experimentCacheManager (ref), argoPartyLayer (ref)
	local var1 = experimentCacheManager.default:getLayerVariables(argoPartyLayer)
	
	return if var1 and var1[p1] ~= nil then var1[p1] else false
end

return {
	getIsRenameEnabled = function()
		-- upvalues: forceEnableArgoPartyChanges7 (ref), enableArgoPartyChanges (ref), enableArgoPartyExperimentation7 (ref), argoPartyVariant (ref), experimentCacheManager (ref), argoPartyLayer (ref)
		local var1 = forceEnableArgoPartyChanges7
		
		if not var1 then
			var1 = enableArgoPartyChanges
			
			if not var1 then
				var1 = enableArgoPartyExperimentation7
				
				if var1 then
					local var2 = argoPartyVariant
					local var3 = experimentCacheManager.default:getLayerVariables(argoPartyLayer)
					
					if var3 and var3[var2] ~= nil then
						return var3[var2]
					end
					var1 = false
				end
			end
		end
		return var1
	end
}