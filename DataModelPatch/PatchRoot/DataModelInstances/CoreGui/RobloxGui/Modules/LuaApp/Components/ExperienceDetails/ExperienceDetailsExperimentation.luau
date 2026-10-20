local CorePackages = game:GetService("CorePackages")
local FFlagSduiExperienceDetailsSocialProofModule = require(CorePackages.Workspace.Packages._Workspace.SharedFlags.SharedFlags.FFlagSduiExperienceDetailsSocialProof)
local ExperimentCacheManager = require(CorePackages.Workspace.Packages.ExperimentCacheManager).ExperimentCacheManager
local LuaAppEdpExperimentLayer = game:DefineFastString("LuaAppEdpExperimentLayer", "PlayerApp.GameDetailsPage.Exposure")
local FFlagLuaAppEdpBackendV2SduiInterleaveIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveIxp

local function _(p1)
	-- upvalues: LuaAppEdpExperimentLayer (copy), ExperimentCacheManager (copy)
	local LayerVariables = ExperimentCacheManager.default:getLayerVariables(LuaAppEdpExperimentLayer, true)
	
	if LayerVariables and LayerVariables[p1] ~= nil then
		ExperimentCacheManager.default:sendCustomExposureLog(LuaAppEdpExperimentLayer)
		
		return LayerVariables[p1]
	else
		return nil
	end
end

local function getShouldHydrateLegacy()
	-- upvalues: LuaAppEdpExperimentLayer (copy), ExperimentCacheManager (copy)
	local LayerVariables = ExperimentCacheManager.default:getLayerVariables(LuaAppEdpExperimentLayer, true)
	
	if LayerVariables and LayerVariables.shouldHydrateLegacy ~= nil then
		ExperimentCacheManager.default:sendCustomExposureLog(LuaAppEdpExperimentLayer)
		
		return LayerVariables.shouldHydrateLegacy
	else
		return nil
	end
end

local function getShouldInterleaveSdui()
	-- upvalues: LuaAppEdpExperimentLayer (copy), ExperimentCacheManager (copy)
	local LayerVariables = ExperimentCacheManager.default:getLayerVariables(LuaAppEdpExperimentLayer, true)
	
	if LayerVariables and LayerVariables.shouldInterleaveSdui ~= nil then
		ExperimentCacheManager.default:sendCustomExposureLog(LuaAppEdpExperimentLayer)
		
		return LayerVariables.shouldInterleaveSdui
	else
		return nil
	end
end

local function getShouldRaisePeekViewBriefHeight(): boolean
	-- upvalues: LuaAppEdpExperimentLayer (copy), ExperimentCacheManager (copy)
	local LayerVariables = ExperimentCacheManager.default:getLayerVariables(LuaAppEdpExperimentLayer, true)
	local SocialProofVariant = nil
	
	if LayerVariables and LayerVariables.socialProofVariant ~= nil then
		ExperimentCacheManager.default:sendCustomExposureLog(LuaAppEdpExperimentLayer)
		SocialProofVariant = LayerVariables.socialProofVariant
	else
		SocialProofVariant = nil
	end
	return SocialProofVariant == "text"
end

return {
	getShouldHydrateLegacy = if require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp then getShouldHydrateLegacy else nil,
	getShouldInterleaveSdui = if FFlagLuaAppEdpBackendV2SduiInterleaveIxp then getShouldInterleaveSdui else nil,
	getShouldRaisePeekViewBriefHeight = if FFlagSduiExperienceDetailsSocialProofModule then getShouldRaisePeekViewBriefHeight else nil
}