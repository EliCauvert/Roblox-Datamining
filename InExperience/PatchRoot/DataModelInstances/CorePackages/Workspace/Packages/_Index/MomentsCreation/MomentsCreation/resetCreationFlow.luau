local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local momentsCommonModule = require(momentsCreation.Parent.MomentsCommon)
local _ = require(momentsCreation.Enums.CreationFlowState)
local getCreationFlowStoreModule = require(momentsCreation.Stores.GetCreationFlowStore)

return function(value)
	-- upvalues: getCreationFlowStoreModule (ref), momentsCommonModule (ref)
	local var1 = getCreationFlowStoreModule(false)
	local TTSAudio = var1.getTTSAudio(false)
	
	if TTSAudio ~= nil then
		TTSAudio.destroy()
		var1.setTTSAudio(nil)
	end
	var1.clearEdits(value)
	local funnelTypes = momentsCommonModule.Analytics.FunnelEventNames.FunnelTypes
	local sessionManager = momentsCommonModule.Analytics.SessionManager
	sessionManager.endSession(funnelTypes.CreationFlow)
	sessionManager.endSession(funnelTypes.MusicEnhancement)
	sessionManager.endSession(funnelTypes.TextOverlayEnhancement)
	sessionManager.endSession(funnelTypes.StickerOverlayEnhancement)
	sessionManager.endSession(funnelTypes.TrimEnhancement)
	sessionManager.endSession(funnelTypes.VoiceEnhancement)
end