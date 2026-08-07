local parent = script:FindFirstAncestor("SocialExperiments").Parent
local experimentCacheManager = require(parent.ExperimentCacheManager).ExperimentCacheManager
local sharedFlagsModule = require(parent.SharedFlags)
local argoPartyLayer = game:DefineFastString("ArgoPartyLayer", "Social.ConnectTab")
local argoPartyVariant = game:DefineFastString("ArgoPartyVariant", "enableArgoPartyChanges")
local forceEnableArgoPartyChanges7 = game:DefineFastFlag("ForceEnableArgoPartyChanges7", false)
local enableArgoPartyExperimentation7 = game:DefineFastFlag("EnableArgoPartyExperimentation7", false)
local fFlagAppChatRenameGuacPolicyEnabled = sharedFlagsModule.FFlagAppChatRenameGuacPolicyEnabled
local enableArgoPartyChanges = game:DefineFastFlag("EnableArgoPartyChanges", false)

local function _(p0) --[[ line: 15 | named "getIsUserInTreatment" ]]
	-- upvalues: experimentCacheManager (ref), argoPartyLayer (ref)
	local var6 = experimentCacheManager.default:getLayerVariables(argoPartyLayer)
	
	return if var6 and var6[p0] ~= nil then var6[p0] else false
end

return {
	getIsRenameEnabled = function() --[[ line: 25 ]]
		-- upvalues: forceEnableArgoPartyChanges7 (ref), enableArgoPartyChanges (ref), fFlagAppChatRenameGuacPolicyEnabled (ref), enableArgoPartyExperimentation7 (ref), argoPartyVariant (ref), experimentCacheManager (ref), argoPartyLayer (ref)
		local var7 = forceEnableArgoPartyChanges7
		
		if not var7 then
			if enableArgoPartyChanges then
				var7 = fFlagAppChatRenameGuacPolicyEnabled
				
				if not var7 then
					var7 = enableArgoPartyExperimentation7
					
					if var7 then
						var7 = fFlagAppChatRenameGuacPolicyEnabled
						
						if var7 then
							local var8 = argoPartyVariant
							local var9 = experimentCacheManager.default:getLayerVariables(argoPartyLayer)
							
							if var9 and var9[var8] ~= nil then
								return var9[var8]
							end
							var7 = false
						end
					end
				end
			end
		end
		return var7
	end
}