return {
	FFlagSduiTileDisableLegacyHover = game:DefineFastFlag("SduiTileDisableLegacyHover", false),
	FFlagSduiGetItemCollectionKeys = require(script:FindFirstAncestor("ServerDrivenUi").Parent.SharedFlags).FFlagSduiGetItemCollectionKeys,
	FFlagSduiEnableHeroUnitBottomRow = game:DefineFastFlag("SduiEnableHeroUnitBottomRow", false)
}