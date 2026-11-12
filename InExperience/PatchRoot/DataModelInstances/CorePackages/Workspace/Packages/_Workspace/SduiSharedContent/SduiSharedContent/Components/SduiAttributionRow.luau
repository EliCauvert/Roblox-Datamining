local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Icon = FoundationModule.Icon
local Image = FoundationModule.Image
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), FoundationModule (copy), Image (copy), Text (copy), Icon (copy)
	local LayoutOrder = p1.layoutOrder
	local ZIndex = p1.zIndex
	local Position = p1.position
	local Size = p1.size
	local UseTokensResult = UseTokensFunction()
	local TitleFontStyle = p1.titleFontStyle or UseTokensResult.Typography.TitleMedium
	local SubtitleFontStyle = p1.subtitleFontStyle or UseTokensResult.Typography.BodyMedium
	
	return ReactModule.createElement(View, {
		tag = "row size-full-0 auto-y align-y-center align-x-left gap-medium",
		ZIndex = ZIndex,
		Position = Position,
		LayoutOrder = LayoutOrder,
		Active = p1.onActivated ~= nil,
		onActivated = p1.onActivated,
		selection = { Selectable = false },
		Size = Size or UDim2.new(1, 0, 0, UseTokensResult.Size.Size_1000),
		testId = p1.testId,
		stateLayer = {
			affordance = FoundationModule.Enums.StateLayerAffordance.None
		}
	}, {
		Image = p1.image and ReactModule.createElement(Image, {
			tag = "radius-medium",
			LayoutOrder = 1,
			Image = p1.image,
			Size = p1.imageSize or UDim2.new(0, UseTokensResult.Size.Size_1000, 0, UseTokensResult.Size.Size_1000)
		}),
		TextContainer = ReactModule.createElement(View, { LayoutOrder = 2, tag = "col auto-xy fill" }, {
			Title = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "auto-xy text-align-x-left",
				Text = p1.title,
				TextWrapped = p1.titleTextWrap,
				TextTruncate = p1.titleTextTruncate or Enum.TextTruncate.SplitWord,
				textStyle = p1.titleTextColor or UseTokensResult.DarkMode.Content.Emphasis,
				fontStyle = p1.titleFontStyle or TitleFontStyle,
				Size = p1.textContainerSize or UDim2.new(1, 0, 0, UseTokensResult.Size.Size_500)
			}),
			SubtitleContainer = ReactModule.createElement(View, {
				LayoutOrder = 2,
				Size = p1.textContainerSize or UDim2.new(1, 0, 0, UseTokensResult.Size.Size_500),
				onActivated = p1.subtitleOnActivated,
				tag = {
					["row size-full-0 auto-y"] = true,
					["align-y-center gap-xsmall"] = p1.subtitleIconName ~= nil
				}
			}, {
				Subtitle = ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = "auto-xy text-align-x-left",
					Text = p1.subtitle,
					onActivated = p1.subtitleOnActivated,
					fontStyle = p1.subtitleFontStyle or SubtitleFontStyle,
					textStyle = p1.subtitleTextColor or UseTokensResult.DarkMode.Content.Emphasis,
					TextWrapped = p1.subtitleTextWrap,
					TextTruncate = p1.subtitleTextTruncate or Enum.TextTruncate.SplitWord
				}),
				Icon = if p1.subtitleIconName and p1.subtitleBackgroundIconName then ReactModule.createElement(View, { LayoutOrder = 2, tag = "auto-xy" }, {
					BackgroundIcon = ReactModule.createElement(Icon, {
						size = if p1.subtitleIconSize then p1.subtitleIconSize else nil,
						name = p1.subtitleBackgroundIconName,
						style = if p1.subtitleBackgroundIconStyle then p1.subtitleBackgroundIconStyle else UseTokensResult.Color.System.Emphasis
					}),
					ForegroundIcon = ReactModule.createElement(Icon, {
						size = if p1.subtitleIconSize then p1.subtitleIconSize else nil,
						variant = if p1.subtitleIconVariant then p1.subtitleIconVariant else nil,
						name = p1.subtitleIconName,
						style = p1.subtitleIconStyle
					})
				}) elseif p1.subtitleIconName then ReactModule.createElement(Icon, {
					LayoutOrder = 2,
					size = if p1.subtitleIconSize then p1.subtitleIconSize else nil,
					name = p1.subtitleIconName,
					variant = if p1.subtitleIconVariant then p1.subtitleIconVariant else nil,
					style = if p1.subtitleIconStyle then p1.subtitleIconStyle else UseTokensResult.Color.System.Emphasis
				}) else nil
			}),
			Caption = if p1.caption then ReactModule.createElement(Text, {
				LayoutOrder = 3,
				tag = "auto-xy text-align-x-left text-truncate-split-word",
				Text = p1.caption,
				textStyle = p1.captionTextColor or UseTokensResult.Color.Content.Default,
				fontStyle = p1.captionFontStyle or UseTokensResult.Typography.CaptionBody,
				Size = p1.textContainerSize
			}) else nil
		}),
		RightButtonContent = p1.rightButtonContent and ReactModule.createElement(View, { LayoutOrder = 3, tag = "auto-xy row" }, { ButtonContent = p1.rightButtonContent })
	})
end)