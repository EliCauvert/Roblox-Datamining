local parent = script:FindFirstAncestor("SocialExperiments").Parent
local experimentCacheManager = require(parent.ExperimentCacheManager).ExperimentCacheManager
local sharedFlagsModule = require(parent.SharedFlags)
local fStringSquadRegroupExpLayer = game:DefineFastString("FStringSquadRegroupExpLayer", "Party.Coordination.UnifyCoplay")
local squadEnableRegroupVariant = game:DefineFastString("SquadEnableRegroupVariant", "enableSquadRegroup")
local fFlagForceEnableSquadRegroup = sharedFlagsModule.FFlagForceEnableSquadRegroup
local fFlagEnableSquadRegroupExperimentation = sharedFlagsModule.FFlagEnableSquadRegroupExperimentation

local function _(p0)
	-- upvalues: experimentCacheManager (ref), fStringSquadRegroupExpLayer (ref)
	local var3 = experimentCacheManager.default:getLayerVariables(fStringSquadRegroupExpLayer)
	
	return if var3 and var3[p0] ~= nil then var3[p0] else false
end

return {
	getSquadRegroupEnabled = function()
		-- upvalues: fFlagForceEnableSquadRegroup (ref), fFlagEnableSquadRegroupExperimentation (ref), squadEnableRegroupVariant (ref), experimentCacheManager (ref), fStringSquadRegroupExpLayer (ref)
		local var4 = fFlagForceEnableSquadRegroup
		
		if not var4 then
			var4 = fFlagEnableSquadRegroupExperimentation
			
			if var4 then
				local var5 = squadEnableRegroupVariant
				local var6 = experimentCacheManager.default:getLayerVariables(fStringSquadRegroupExpLayer)
				
				if var6 and var6[var5] ~= nil then
					return var6[var5]
				end
				var4 = false
			end
		end
		return var4
	end,
	logExposure = function()
		-- upvalues: fFlagForceEnableSquadRegroup (ref), fFlagEnableSquadRegroupExperimentation (ref), experimentCacheManager (ref), fStringSquadRegroupExpLayer (ref)
		if not fFlagForceEnableSquadRegroup and fFlagEnableSquadRegroupExperimentation and experimentCacheManager.default:getLayerVariables(fStringSquadRegroupExpLayer) ~= nil then
			experimentCacheManager.default:logLayerExposure(fStringSquadRegroupExpLayer)
		end
	end
}