return {
	FFlagEnableStickyShortcutBarOnAllPlatformsIxpEnabled = game:DefineFastFlag("EnableStickyShortcutBarOnAllPlatformsIxpEnabled", false),
	FStringEnableStickyShortcutBarOnAllPlatformsIxpLayer = game:DefineFastString("EnableStickyShortcutBarOnAllPlatformsIxpLayer", require(script:FindFirstAncestor("AppShortcutBar").Parent.ExperimentLayers).AppUserLayers.UnifyShortcutBarExposureLayer),
	FFlagStickyShortcutBarTvRemoteWithGamepad = game:DefineFastFlag("StickyShortcutBarTvRemoteWithGamepad", false),
	FFlagShortcutBarPlatformGamepadIcons = game:DefineFastFlag("ShortcutBarPlatformGamepadIcons", false)
}