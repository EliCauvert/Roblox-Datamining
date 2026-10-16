local SplitPaneEducationalTourVideoAssetIdsModule = require(script.Parent.Parent.Flags.SplitPaneEducationalTourVideoAssetIds)

return {
	{
		videoAssetId = SplitPaneEducationalTourVideoAssetIdsModule.step1Video,
		gamepadVideoAssetId = SplitPaneEducationalTourVideoAssetIdsModule.step1GamepadVideo,
		collapsedVideoAssetId = SplitPaneEducationalTourVideoAssetIdsModule.step1CollapsedVideo,
		collapsedGamepadVideoAssetId = SplitPaneEducationalTourVideoAssetIdsModule.step1CollapsedGamepadVideo
	},
	{
		videoAssetId = SplitPaneEducationalTourVideoAssetIdsModule.step2Video,
		gamepadVideoAssetId = SplitPaneEducationalTourVideoAssetIdsModule.step2GamepadVideo
	},
	{
		isFinal = true,
		videoAssetId = SplitPaneEducationalTourVideoAssetIdsModule.step3Video,
		gamepadVideoAssetId = SplitPaneEducationalTourVideoAssetIdsModule.step3GamepadVideo
	}
}