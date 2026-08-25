local foundationModule = require(script:FindFirstAncestor("AvatarExperienceControlBar").Parent.Foundation)

return function()
	-- upvalues: foundationModule (ref)
	local var1 = foundationModule.Hooks.useTokens()
	
	return {
		borderStrokeTransparency = 0.5,
		contentDisabledTransparency = 0.68,
		defaultIconContainerSize = var1.Size.Size_900,
		defaultIconSize = var1.Size.Size_900,
		defaultLegacyIconSize = var1.Size.Size_600,
		closeIconSize = var1.Size.Size_600,
		activeIconBackgroundStyle = var1.Color.Shift.Shift_400,
		hoverIconBackgroundStyle = var1.Color.Shift.Shift_200,
		thumbnailBackgroundStyle = var1.Color.Surface.Surface_200,
		tooltipBackgroundStyle = var1.Color.Surface.Surface_300,
		hoverThumbnailBackgroundStyle = var1.Color.Shift.Shift_400,
		imageBorderFocusStyle = var1.Color.ActionEmphasis.Background.Color3,
		borderStrokeThickness = var1.Stroke.Standard,
		defaultIconTextButtonRadius = var1.Size.Size_200,
		iconTextButtonIconContainerSize = var1.Size.Size_900,
		textButtonPaddingLeft = var1.Size.Size_200,
		textButtonPaddingRight = var1.Size.Size_400,
		textButtonPaddingY = var1.Size.Size_150,
		contentForegroundStyle = var1.Color.Content.Emphasis,
		menuBackgroundStyle = var1.Color.OverMedia.OverMedia_0,
		defaultIconTextMenuRadius = var1.Size.Size_200,
		iconOnlyMenuItemGap = var1.Size.Size_150
	}
end