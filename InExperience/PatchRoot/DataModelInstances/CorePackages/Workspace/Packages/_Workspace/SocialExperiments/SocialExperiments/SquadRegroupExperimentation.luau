local parent = script:FindFirstAncestor("SocialExperiments").Parent
local experimentCacheManager = require(parent.ExperimentCacheManager).ExperimentCacheManager
local sharedFlagsModule = require(parent.SharedFlags)
local fStringSquadRegroupExpLayer = game:DefineFastString("FStringSquadRegroupExpLayer", "Party.Coordination.UnifyCoplay")
local squadEnableRegroupVariant = game:DefineFastString("SquadEnableRegroupVariant", "enableSquadRegroup")
local fFlagForceEnableSquadRegroup = sharedFlagsModule.FFlagForceEnableSquadRegroup
local fFlagEnableSquadRegroupExperimentation = sharedFlagsModule.FFlagEnableSquadRegroupExperimentation

local function _(p1)
	-- upvalues: experimentCacheManager (ref), fStringSquadRegroupExpLayer (ref)
	local var1 = experimentCacheManager.default:getLayerVariables(fStringSquadRegroupExpLayer)
	
	return if var1 and var1[p1] ~= nil then var1[p1] else false
end

return {
	getSquadRegroupEnabled = function()
		-- upvalues: fFlagForceEnableSquadRegroup (ref), fFlagEnableSquadRegroupExperimentation (ref), squadEnableRegroupVariant (ref), experimentCacheManager (ref), fStringSquadRegroupExpLayer (ref)
		local var1 = fFlagForceEnableSquadRegroup
		
		if not var1 then
			var1 = fFlagEnableSquadRegroupExperimentation
			
			if var1 then
				local var2 = squadEnableRegroupVariant
				local var3 = experimentCacheManager.default:getLayerVariables(fStringSquadRegroupExpLayer)
				
				if var3 and var3[var2] ~= nil then
					return var3[var2]
				end
				var1 = false
			end
		end
		return var1
	end,
	logExposure = function()
		-- upvalues: fFlagForceEnableSquadRegroup (ref), fFlagEnableSquadRegroupExperimentation (ref), experimentCacheManager (ref), fStringSquadRegroupExpLayer (ref)
		if not fFlagForceEnableSquadRegroup and fFlagEnableSquadRegroupExperimentation and experimentCacheManager.default:getLayerVariables(fStringSquadRegroupExpLayer) ~= nil then
			experimentCacheManager.default:logLayerExposure(fStringSquadRegroupExpLayer)
		end
	end
}