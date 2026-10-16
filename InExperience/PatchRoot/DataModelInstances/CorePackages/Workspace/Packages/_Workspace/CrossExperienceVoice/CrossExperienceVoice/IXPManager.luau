local DependenciesModule = require(script:FindFirstAncestor("CrossExperienceVoice").dependencies)
local ExperimentCacheManager = DependenciesModule.ExperimentCacheManager.ExperimentCacheManager
local GetFFlagEnableCrossExpVoiceFunction = DependenciesModule.SharedFlags.GetFFlagEnableCrossExpVoice
local CrossExpVoiceIXPLayer = game:DefineFastString("CrossExpVoiceIXPLayer", "Social.PartyVoice")
local DebugCrossExpVoiceIXPLayer = game:DefineFastString("DebugCrossExpVoiceIXPLayer", "")
local PartyVoiceVolumeEngineFeature = game:GetEngineFeature("PartyVoiceVolume")
local IXPManager = {}
IXPManager.__index = IXPManager
local config = {
	CrossExpVoiceDebugVariant_0 = { partyVoiceExp = false },
	CrossExpVoiceDebugVariant_1 = { partyVoiceExp = true }
}

function IXPManager.new() --[[ Line: 47 ]]
	-- upvalues: IXPManager (copy)
	local config = { initialized = false, variant = {} }
	setmetatable(config, IXPManager)
	
	return config
end

function IXPManager:initialize() --[[ Line: 58 ]]
	-- upvalues: ExperimentCacheManager (copy), CrossExpVoiceIXPLayer (copy), DebugCrossExpVoiceIXPLayer (copy), config (copy)
	local LayerVariables = ExperimentCacheManager.default:getLayerVariables(CrossExpVoiceIXPLayer)
	
	if LayerVariables ~= nil then
		self.initialized = true
		self.variant = table.clone(LayerVariables)
	end
	if DebugCrossExpVoiceIXPLayer ~= "None" then
		self.initialized = true
		self.variant = config[DebugCrossExpVoiceIXPLayer] or self.variant
	end
end

function IXPManager:logLayerExposure() --[[ Line: 72 ]]
	-- upvalues: ExperimentCacheManager (copy), CrossExpVoiceIXPLayer (copy)
	ExperimentCacheManager.default:logLayerExposure(CrossExpVoiceIXPLayer)
end

function IXPManager.getHasPartyVoiceVolume() --[[ Line: 76 ]]
	-- upvalues: PartyVoiceVolumeEngineFeature (copy), IXPManager (copy)
	return PartyVoiceVolumeEngineFeature and IXPManager.default.variant.partyVoiceExp
end

IXPManager.default = if GetFFlagEnableCrossExpVoiceFunction() then IXPManager.new() else nil

return IXPManager