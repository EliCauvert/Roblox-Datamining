local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local momentsCommonModule = require(momentsCreation.Parent.MomentsCommon)
local _ = require(momentsCreation.Types.CreationFlowTypes)
local stickerToolModule = require(momentsCreation.Tools.stickerTool)
local list = {
	require(momentsCreation.Tools.trimTool),
	require(momentsCreation.Tools.musicTool),
	require(momentsCreation.Tools.textTool),
	require(momentsCreation.Tools.generateTextTool)
}

if momentsCommonModule.Flags.GetFFlagMomentsStickerButton() then
	table.insert(list, stickerToolModule)
end
return list