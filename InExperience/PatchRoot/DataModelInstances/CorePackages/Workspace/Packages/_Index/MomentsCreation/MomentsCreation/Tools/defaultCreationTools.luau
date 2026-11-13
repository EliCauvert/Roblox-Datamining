local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local _ = require(MomentsCreation.Types.CreationFlowTypes)
local StickerToolModule = require(MomentsCreation.Tools.stickerTool)
local VoiceToolModule = require(MomentsCreation.Tools.voiceTool)
local GetFFlagMomentsStickerButtonFunction = require(MomentsCreation.Parent.MomentsCommon).Flags.GetFFlagMomentsStickerButton
local GetFFlagMomentsTTSAudioOverlayModule = require(MomentsCreation.Flags.GetFFlagMomentsTTSAudioOverlay)
local List = {
	require(MomentsCreation.Tools.trimTool),
	require(MomentsCreation.Tools.musicTool),
	require(MomentsCreation.Tools.textTool),
	(require(MomentsCreation.Tools.generateTextTool))
}

if GetFFlagMomentsStickerButtonFunction() then
	table.insert(List, StickerToolModule)
end
if GetFFlagMomentsTTSAudioOverlayModule and game:GetEngineFeature("TextToSpeechPlatformPreview") then
	table.insert(List, VoiceToolModule)
end
return List