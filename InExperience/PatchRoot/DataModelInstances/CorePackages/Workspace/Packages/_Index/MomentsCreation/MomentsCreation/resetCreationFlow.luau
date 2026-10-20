local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local MomentsCommonModule = require(MomentsCreation.Parent.MomentsCommon)
local _ = require(MomentsCreation.Enums.CreationFlowState)
local GetCreationFlowStoreModule = require(MomentsCreation.Stores.GetCreationFlowStore)

return function(p1)
	-- upvalues: GetCreationFlowStoreModule (copy), MomentsCommonModule (copy)
	local CreationFlowStoreModule = GetCreationFlowStoreModule(false)
	local TTSAudio = CreationFlowStoreModule.getTTSAudio(false)
	
	if TTSAudio ~= nil then
		TTSAudio.destroy()
		CreationFlowStoreModule.setTTSAudio(nil)
	end
	CreationFlowStoreModule.clearEdits(p1)
	local FunnelTypes = MomentsCommonModule.Analytics.FunnelEventNames.FunnelTypes
	local SessionManager = MomentsCommonModule.Analytics.SessionManager
	SessionManager.endSession(FunnelTypes.CreationFlow)
	SessionManager.endSession(FunnelTypes.MusicEnhancement)
	SessionManager.endSession(FunnelTypes.TextOverlayEnhancement)
	SessionManager.endSession(FunnelTypes.StickerOverlayEnhancement)
	SessionManager.endSession(FunnelTypes.TrimEnhancement)
	SessionManager.endSession(FunnelTypes.VoiceEnhancement)
end