local Parent = script:FindFirstAncestor("SocialExperiments").Parent
local ExperimentCacheManager = require(Parent.ExperimentCacheManager).ExperimentCacheManager
local SharedFlagsModule = require(Parent.SharedFlags)
local FStringSquadRegroupExpLayer = game:DefineFastString("FStringSquadRegroupExpLayer", "Party.Coordination.UnifyCoplay")
local SquadEnableRegroupVariant = game:DefineFastString("SquadEnableRegroupVariant", "enableSquadRegroup")
local FFlagForceEnableSquadRegroup = SharedFlagsModule.FFlagForceEnableSquadRegroup
local FFlagEnableSquadRegroupExperimentation = SharedFlagsModule.FFlagEnableSquadRegroupExperimentation

local function _(p1) --[[ Line: 14 | Named "getIsUserInTreatment" ]]
	-- upvalues: ExperimentCacheManager (copy), FStringSquadRegroupExpLayer (copy)
	local LayerVariables = ExperimentCacheManager.default:getLayerVariables(FStringSquadRegroupExpLayer)
	
	return if LayerVariables and LayerVariables[p1] ~= nil then LayerVariables[p1] else false
end

return {
	getSquadRegroupEnabled = function() --[[ Line: 24 ]]
		-- upvalues: FFlagForceEnableSquadRegroup (copy), FFlagEnableSquadRegroupExperimentation (copy), SquadEnableRegroupVariant (copy), ExperimentCacheManager (copy), FStringSquadRegroupExpLayer (copy)
		local FFlagForceEnableSquadRegroup1: boolean = FFlagForceEnableSquadRegroup
		
		if not FFlagForceEnableSquadRegroup1 then
			FFlagForceEnableSquadRegroup1 = FFlagEnableSquadRegroupExperimentation
			
			if FFlagForceEnableSquadRegroup1 then
				local LayerVariables = ExperimentCacheManager.default:getLayerVariables(FStringSquadRegroupExpLayer)
				
				if LayerVariables and LayerVariables[SquadEnableRegroupVariant] ~= nil then
					return LayerVariables[SquadEnableRegroupVariant]
				end
				FFlagForceEnableSquadRegroup1 = false
			end
		end
		return FFlagForceEnableSquadRegroup1
	end,
	logExposure = function() --[[ Line: 29 ]]
		-- upvalues: FFlagForceEnableSquadRegroup (copy), FFlagEnableSquadRegroupExperimentation (copy), ExperimentCacheManager (copy), FStringSquadRegroupExpLayer (copy)
		if not FFlagForceEnableSquadRegroup and FFlagEnableSquadRegroupExperimentation and ExperimentCacheManager.default:getLayerVariables(FStringSquadRegroupExpLayer) ~= nil then
			ExperimentCacheManager.default:logLayerExposure(FStringSquadRegroupExpLayer)
		end
	end
}