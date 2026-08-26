local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local icon = foundationModule.Icon
local image = foundationModule.Image
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens
local fFlagSduiAttributionRowV2 = require(parent.SharedFlags).FFlagSduiAttributionRowV2

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), fFlagSduiAttributionRowV2 (ref), reactModule (ref), view (ref), foundationModule (ref), image (ref), text (ref), icon (ref)
	local layoutOrder = p1.layoutOrder
	local zIndex = p1.zIndex
	local position = p1.position
	local size = p1.size
	local var1 = useTokens()
	local titleMedium = var1.Typography.TitleMedium
	local bodyMedium = var1.Typography.BodyMedium
	
	if not fFlagSduiAttributionRowV2 then
		return reactModule.createElement("TextButton", {
			Size = UDim2.new(1, 0, 0, var1.Size.Size_1000),
			AutoButtonColor = false,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = layoutOrder,
			ZIndex = zIndex,
			Position = position,
			[reactModule.Event.Activated] = p1.onActivated,
			Text = "",
			Active = p1.onActivated ~= nil,
			Selectable = false,
			[reactModule.Tag] = if p1.testId then `data-testid={p1.testId}` else nil
		}, {
			UIListLayout = reactModule.createElement("UIListLayout", {
				Padding = UDim.new(0, var1.Gap.Medium),
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				SortOrder = Enum.SortOrder.LayoutOrder,
				ItemLineAlignment = Enum.ItemLineAlignment.Start
			}),
			Image = reactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 1,
				Image = p1.image,
				Size = UDim2.new(0, var1.Size.Size_1000, 0, var1.Size.Size_1000)
			}, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var1.Radius.Medium) })
			}),
			TextContainer = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 1, 0)
			}, {
				UIFlexItem = reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }),
				Title = reactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					Text = p1.title,
					AnchorPoint = Vector2.new(0, 0),
					Position = UDim2.new(0, 0, 0, 0),
					Size = UDim2.new(1, 0, 0, var1.Size.Size_500),
					TextSize = titleMedium.FontSize,
					Font = titleMedium.Font,
					TextColor3 = var1.DarkMode.Content.Emphasis.Color3,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextTruncate = Enum.TextTruncate.SplitWord
				}),
				Subtitle = reactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					Text = p1.subtitle,
					AnchorPoint = Vector2.new(0, 1),
					Position = UDim2.new(0, 0, 1, 0),
					Size = UDim2.new(1, 0, 0, var1.Size.Size_500),
					TextSize = bodyMedium.FontSize,
					Font = bodyMedium.Font,
					TextColor3 = var1.DarkMode.Content.Emphasis.Color3,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextTruncate = Enum.TextTruncate.SplitWord
				})
			}),
			ButtonContainer = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 3,
				AutomaticSize = Enum.AutomaticSize.XY
			}, { ButtonContent = p1.rightButtonContent })
		})
	end
	titleMedium = p1.titleFontStyle or titleMedium
	bodyMedium = p1.subtitleFontStyle or bodyMedium
	
	return reactModule.createElement(view, {
		tag = "row size-full-0 auto-y align-y-center align-x-left gap-medium",
		ZIndex = zIndex,
		Position = position,
		LayoutOrder = layoutOrder,
		Active = p1.onActivated ~= nil,
		onActivated = p1.onActivated,
		selection = { Selectable = false },
		Size = size or UDim2.new(1, 0, 0, var1.Size.Size_1000),
		testId = p1.testId,
		stateLayer = {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		}
	}, {
		Image = p1.image and reactModule.createElement(image, {
			tag = "radius-medium",
			LayoutOrder = 1,
			Image = p1.image,
			Size = p1.imageSize or UDim2.new(0, var1.Size.Size_1000, 0, var1.Size.Size_1000)
		}),
		TextContainer = reactModule.createElement(view, { LayoutOrder = 2, tag = "col auto-xy fill" }, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "auto-xy text-align-x-left",
				Text = p1.title,
				TextWrapped = p1.titleTextWrap,
				TextTruncate = p1.titleTextTruncate or Enum.TextTruncate.SplitWord,
				textStyle = p1.titleTextColor or var1.DarkMode.Content.Emphasis,
				fontStyle = p1.titleFontStyle or titleMedium,
				Size = p1.textContainerSize or UDim2.new(1, 0, 0, var1.Size.Size_500)
			}),
			SubtitleContainer = reactModule.createElement(view, {
				LayoutOrder = 2,
				Size = p1.textContainerSize or UDim2.new(1, 0, 0, var1.Size.Size_500),
				onActivated = p1.subtitleOnActivated,
				tag = {
					["row size-full-0 auto-y"] = true,
					["align-y-center gap-xsmall"] = p1.subtitleIconName ~= nil
				}
			}, {
				Subtitle = reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "auto-xy text-align-x-left",
					Text = p1.subtitle,
					onActivated = p1.subtitleOnActivated,
					fontStyle = p1.subtitleFontStyle or bodyMedium,
					textStyle = p1.subtitleTextColor or var1.DarkMode.Content.Emphasis,
					TextWrapped = p1.subtitleTextWrap,
					TextTruncate = p1.subtitleTextTruncate or Enum.TextTruncate.SplitWord
				}),
				Icon = if p1.subtitleIconName and p1.subtitleBackgroundIconName then reactModule.createElement(view, { LayoutOrder = 2, tag = "auto-xy" }, {
					BackgroundIcon = reactModule.createElement(icon, {
						size = if p1.subtitleIconSize then p1.subtitleIconSize else nil,
						name = p1.subtitleBackgroundIconName,
						style = if p1.subtitleBackgroundIconStyle then p1.subtitleBackgroundIconStyle else var1.Color.System.Emphasis
					}),
					ForegroundIcon = reactModule.createElement(icon, {
						size = if p1.subtitleIconSize then p1.subtitleIconSize else nil,
						variant = if p1.subtitleIconVariant then p1.subtitleIconVariant else nil,
						name = p1.subtitleIconName,
						style = p1.subtitleIconStyle
					})
				}) elseif p1.subtitleIconName then reactModule.createElement(icon, {
					LayoutOrder = 2,
					size = if p1.subtitleIconSize then p1.subtitleIconSize else nil,
					name = p1.subtitleIconName,
					variant = if p1.subtitleIconVariant then p1.subtitleIconVariant else nil,
					style = if p1.subtitleIconStyle then p1.subtitleIconStyle else var1.Color.System.Emphasis
				}) else nil
			}),
			Caption = if p1.caption then reactModule.createElement(text, {
				LayoutOrder = 3,
				tag = "auto-xy text-align-x-left text-truncate-split-word",
				Text = p1.caption,
				textStyle = p1.captionTextColor or var1.Color.Content.Default,
				fontStyle = p1.captionFontStyle or var1.Typography.CaptionBody,
				Size = p1.textContainerSize
			}) else nil
		}),
		RightButtonContent = p1.rightButtonContent and reactModule.createElement(view, { LayoutOrder = 3, tag = "auto-xy row" }, { ButtonContent = p1.rightButtonContent })
	})
end)