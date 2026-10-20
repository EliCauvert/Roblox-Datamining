local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local _ = require(MomentsCreation.Types.CreationFlowTypes)

return {
	require(MomentsCreation.Tools.trimTool),
	require(MomentsCreation.Tools.musicTool),
	(require(MomentsCreation.Tools.textTool))
}