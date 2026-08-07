local useLocalTraversalHistory699v1 = game:DefineFastFlag("UseLocalTraversalHistory699v1", false)
local useTeleportTraversalHistory699v1 = game:DefineFastFlag("UseTeleportTraversalHistory699v1", false)
local useLocalTraversalHistory699v1_1 = useLocalTraversalHistory699v1 or useTeleportTraversalHistory699v1

return {
	FFlagAddTraversalBackButton = game:DefineFastFlag("AddTraversalBackButton699v1", false) and useLocalTraversalHistory699v1_1,
	FFlagAddTraversalBackButtonAnimation = game:DefineFastFlag("AddTraversalBackButtonAnimation699v1", false) and useLocalTraversalHistory699v1_1,
	FFlagAddTraversalHistory = game:DefineFastFlag("AddTraversalHistory699v1", false) and useLocalTraversalHistory699v1_1,
	FFlagUseLocalTraversalHistory = useLocalTraversalHistory699v1,
	FFlagUseTeleportTraversalHistory = useTeleportTraversalHistory699v1,
	FIntMaximumTraversalHistoryItemsFetch = game:DefineFastInt("MaximumTraversalHistoryItemsFetch", 20),
	FFlagTraversalExpCardFontSizeFix = game:DefineFastFlag("TraversalExpCardFontSizeFix", false),
	FFlagTraversalExpPagePaddingFixes = game:DefineFastFlag("TraversalExpPagePaddingFixes709", false),
	FFlagTraversalHistoryMenuFocusNavFix = game:DefineFastFlag("TraversalHistoryMenuFocusNavFix709", false),
	FFlagFixTraversalHistoryMenuFixesV3 = game:DefineFastFlag("FixTraversalHistoryMenuFixesV3v1", false)
}