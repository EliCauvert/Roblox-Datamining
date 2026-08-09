local experimentCacheManager = require(script:FindFirstAncestor("SocialExperiments").Parent.ExperimentCacheManager).ExperimentCacheManager
local argoPartyLayer = game:DefineFastString("ArgoPartyLayer", "Social.ConnectTab")
local argoPartyVariant = game:DefineFastString("ArgoPartyVariant", "enableArgoPartyChanges")
local forceEnableArgoPartyChanges6 = game:DefineFastFlag("ForceEnableArgoPartyChanges6", false)
local enableArgoPartyExperimentation6 = game:DefineFastFlag("EnableArgoPartyExperimentation6", false)

local function _(p0) --[[ line: 12 | named "getIsUserInTreatment" ]]
	-- upvalues: experimentCacheManager (ref), argoPartyLayer (ref)
	local var4 = experimentCacheManager.default:getLayerVariables(argoPartyLayer)
	
	return if var4 and var4[p0] ~= nil then var4[p0] else false
end

return {
	getIsRenameEnabled = function() --[[ line: 22 ]]
		-- upvalues: forceEnableArgoPartyChanges6 (ref), enableArgoPartyExperimentation6 (ref), argoPartyVariant (ref), experimentCacheManager (ref), argoPartyLayer (ref)
		local var5 = forceEnableArgoPartyChanges6
		
		if not var5 then
			var5 = enableArgoPartyExperimentation6
			
			if var5 then
				local var6 = argoPartyVariant
				local var7 = experimentCacheManager.default:getLayerVariables(argoPartyLayer)
				
				if var7 and var7[var6] ~= nil then
					return var7[var6]
				end
				var5 = false
			end
		end
		return var5
	end
}