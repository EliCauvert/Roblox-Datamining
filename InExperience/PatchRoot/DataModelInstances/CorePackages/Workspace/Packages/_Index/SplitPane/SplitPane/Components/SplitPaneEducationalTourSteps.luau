local splitPaneEducationalTourVideoAssetIdsModule = require(script.Parent.Parent.Flags.SplitPaneEducationalTourVideoAssetIds)

return {
	{
		videoAssetId = splitPaneEducationalTourVideoAssetIdsModule.step1Video,
		gamepadVideoAssetId = splitPaneEducationalTourVideoAssetIdsModule.step1GamepadVideo,
		collapsedVideoAssetId = splitPaneEducationalTourVideoAssetIdsModule.step1CollapsedVideo,
		collapsedGamepadVideoAssetId = splitPaneEducationalTourVideoAssetIdsModule.step1CollapsedGamepadVideo
	},
	{
		videoAssetId = splitPaneEducationalTourVideoAssetIdsModule.step2Video,
		gamepadVideoAssetId = splitPaneEducationalTourVideoAssetIdsModule.step2GamepadVideo
	},
	{
		isFinal = true,
		videoAssetId = splitPaneEducationalTourVideoAssetIdsModule.step3Video,
		gamepadVideoAssetId = splitPaneEducationalTourVideoAssetIdsModule.step3GamepadVideo
	}
}