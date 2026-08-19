local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local momentsCommonModule = require(momentsCreation.Parent.MomentsCommon)
local _ = require(momentsCreation.Types.CreationFlowTypes)
local trimToolModule = require(momentsCreation.Tools.trimTool)
local musicToolModule = require(momentsCreation.Tools.musicTool)
local textToolModule = require(momentsCreation.Tools.textTool)
local generateTextToolModule = require(momentsCreation.Tools.generateTextTool)
local stickerToolModule = require(momentsCreation.Tools.stickerTool)
local voiceToolModule = require(momentsCreation.Tools.voiceTool)
local getFFlagMomentsStickerButton = momentsCommonModule.Flags.GetFFlagMomentsStickerButton
local getFFlagMomentsTTSAudioOverlayModule = require(momentsCreation.Flags.GetFFlagMomentsTTSAudioOverlay)
local list = {
	trimToolModule,
	musicToolModule,
	textToolModule,
	generateTextToolModule
}

if getFFlagMomentsStickerButton() then
	table.insert(list, stickerToolModule)
end
if getFFlagMomentsTTSAudioOverlayModule and game:GetEngineFeature("TextToSpeechPlatformPreview") then
	table.insert(list, voiceToolModule)
end
return list