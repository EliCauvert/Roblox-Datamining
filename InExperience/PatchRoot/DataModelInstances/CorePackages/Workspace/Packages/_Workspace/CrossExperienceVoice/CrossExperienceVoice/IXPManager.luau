local dependenciesModule = require(script:FindFirstAncestor("CrossExperienceVoice").dependencies)
local experimentCacheManager = dependenciesModule.ExperimentCacheManager.ExperimentCacheManager
local getFFlagEnableCrossExpVoice = dependenciesModule.SharedFlags.GetFFlagEnableCrossExpVoice
local crossExpVoiceIXPLayer = game:DefineFastString("CrossExpVoiceIXPLayer", "Social.PartyVoice")
local debugCrossExpVoiceIXPLayer = game:DefineFastString("DebugCrossExpVoiceIXPLayer", "")
local partyVoiceVolumeEngineFeature = game:GetEngineFeature("PartyVoiceVolume")
local t = {}
t.__index = t
local partyVoiceDisallowIXPLayerExposureOnInit = game:DefineFastFlag("PartyVoiceDisallowIXPLayerExposureOnInit", false)
local t_1 = {
	CrossExpVoiceDebugVariant_0 = { partyVoiceExp = false },
	CrossExpVoiceDebugVariant_1 = { partyVoiceExp = true }
}

function t.new() --[[ line: 50 ]]
	-- upvalues: t (ref)
	local t_1 = { initialized = false, variant = {} }
	setmetatable(t_1, t)
	
	return t_1
end

function t:initialize() --[[ line: 61 ]]
	-- upvalues: experimentCacheManager (ref), crossExpVoiceIXPLayer (ref), debugCrossExpVoiceIXPLayer (ref), t_1 (ref), partyVoiceDisallowIXPLayerExposureOnInit (ref)
	local var8 = experimentCacheManager.default:getLayerVariables(crossExpVoiceIXPLayer)
	
	if var8 ~= nil then
		self.initialized = true
		self.variant = table.clone(var8)
	end
	if debugCrossExpVoiceIXPLayer ~= "None" then
		self.initialized = true
		self.variant = t_1[debugCrossExpVoiceIXPLayer] or self.variant
	end
	if self.initialized and not partyVoiceDisallowIXPLayerExposureOnInit then
		self:logLayerExposure()
	end
end

function t.logLayerExposure(_) --[[ line: 81 ]]
	-- upvalues: experimentCacheManager (ref), crossExpVoiceIXPLayer (ref)
	experimentCacheManager.default:logLayerExposure(crossExpVoiceIXPLayer)
end

function t.getHasPartyVoiceVolume() --[[ line: 85 ]]
	-- upvalues: partyVoiceVolumeEngineFeature (ref), t (ref)
	return partyVoiceVolumeEngineFeature and t.default.variant.partyVoiceExp
end

t.default = if getFFlagEnableCrossExpVoice() then t.new() else nil

return t