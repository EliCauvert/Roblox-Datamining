local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local _ = require(momentsCreation.Types.CreationFlowTypes)

return {
	require(momentsCreation.Tools.trimTool),
	require(momentsCreation.Tools.musicTool),
	require(momentsCreation.Tools.textTool)
}