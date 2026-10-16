local FoundationModule = require(script:FindFirstAncestor("AvatarExperienceControlBar").Parent.Foundation)

return function() --[[ Line: 6 | Named "useSemanticTokens" ]]
	-- upvalues: FoundationModule (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	
	return {
		borderStrokeTransparency = 0.5,
		contentDisabledTransparency = 0.68,
		defaultIconContainerSize = UseTokensResult.Size.Size_900,
		defaultIconSize = UseTokensResult.Size.Size_900,
		defaultLegacyIconSize = UseTokensResult.Size.Size_600,
		closeIconSize = UseTokensResult.Size.Size_600,
		activeIconBackgroundStyle = UseTokensResult.Color.Shift.Shift_400,
		hoverIconBackgroundStyle = UseTokensResult.Color.Shift.Shift_200,
		thumbnailBackgroundStyle = UseTokensResult.Color.Surface.Surface_200,
		tooltipBackgroundStyle = UseTokensResult.Color.Surface.Surface_300,
		hoverThumbnailBackgroundStyle = UseTokensResult.Color.Shift.Shift_400,
		imageBorderFocusStyle = UseTokensResult.Color.ActionEmphasis.Background.Color3,
		borderStrokeThickness = UseTokensResult.Stroke.Standard,
		defaultIconTextButtonRadius = UseTokensResult.Size.Size_200,
		iconTextButtonIconContainerSize = UseTokensResult.Size.Size_900,
		textButtonPaddingLeft = UseTokensResult.Size.Size_200,
		textButtonPaddingRight = UseTokensResult.Size.Size_400,
		textButtonPaddingY = UseTokensResult.Size.Size_150,
		contentForegroundStyle = UseTokensResult.Color.Content.Emphasis,
		menuBackgroundStyle = UseTokensResult.Color.OverMedia.OverMedia_0,
		defaultIconTextMenuRadius = UseTokensResult.Size.Size_200,
		iconOnlyMenuItemGap = UseTokensResult.Size.Size_150
	}
end