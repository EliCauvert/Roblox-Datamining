local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local icon = foundationModule.Icon
local image = foundationModule.Image
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens
local fFlagSduiAttributionRowV2 = require(parent.SharedFlags).FFlagSduiAttributionRowV2

return reactModule.memo(function(p0) --[[ line: 58 | named "SduiAttributionRow" ]]
	-- upvalues: useTokens (ref), fFlagSduiAttributionRowV2 (ref), reactModule (ref), view (ref), foundationModule (ref), image (ref), text (ref), icon (ref)
	local layoutOrder = p0.layoutOrder
	local zIndex = p0.zIndex
	local position = p0.position
	local size = p0.size
	local var2 = useTokens()
	local titleMedium = var2.Typography.TitleMedium
	local bodyMedium = var2.Typography.BodyMedium
	
	if not fFlagSduiAttributionRowV2 then
		return reactModule.createElement("TextButton", {
			Size = UDim2.new(1, 0, 0, var2.Size.Size_1000),
			AutoButtonColor = false,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = layoutOrder,
			ZIndex = zIndex,
			Position = position,
			[reactModule.Event.Activated] = p0.onActivated,
			Text = "",
			Active = p0.onActivated ~= nil,
			Selectable = false,
			[reactModule.Tag] = if p0.testId then `data-testid={p0.testId}` else nil
		}, {
			UIListLayout = reactModule.createElement("UIListLayout", {
				Padding = UDim.new(0, var2.Gap.Medium),
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
				Image = p0.image,
				Size = UDim2.new(0, var2.Size.Size_1000, 0, var2.Size.Size_1000)
			}, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var2.Radius.Medium) })
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
					Text = p0.title,
					AnchorPoint = Vector2.new(0, 0),
					Position = UDim2.new(0, 0, 0, 0),
					Size = UDim2.new(1, 0, 0, var2.Size.Size_500),
					TextSize = titleMedium.FontSize,
					Font = titleMedium.Font,
					TextColor3 = var2.DarkMode.Content.Emphasis.Color3,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextTruncate = Enum.TextTruncate.SplitWord
				}),
				Subtitle = reactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					Text = p0.subtitle,
					AnchorPoint = Vector2.new(0, 1),
					Position = UDim2.new(0, 0, 1, 0),
					Size = UDim2.new(1, 0, 0, var2.Size.Size_500),
					TextSize = bodyMedium.FontSize,
					Font = bodyMedium.Font,
					TextColor3 = var2.DarkMode.Content.Emphasis.Color3,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextTruncate = Enum.TextTruncate.SplitWord
				})
			}),
			ButtonContainer = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 3,
				AutomaticSize = Enum.AutomaticSize.XY
			}, { ButtonContent = p0.rightButtonContent })
		})
	end
	titleMedium = p0.titleFontStyle or titleMedium
	bodyMedium = p0.subtitleFontStyle or bodyMedium
	
	return reactModule.createElement(view, {
		tag = "row size-full-0 auto-y align-y-center align-x-left gap-medium",
		ZIndex = zIndex,
		Position = position,
		LayoutOrder = layoutOrder,
		Active = p0.onActivated ~= nil,
		onActivated = p0.onActivated,
		selection = { Selectable = false },
		Size = size or UDim2.new(1, 0, 0, var2.Size.Size_1000),
		testId = p0.testId,
		stateLayer = {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		}
	}, {
		Image = p0.image and reactModule.createElement(image, {
			tag = "radius-medium",
			LayoutOrder = 1,
			Image = p0.image,
			Size = p0.imageSize or UDim2.new(0, var2.Size.Size_1000, 0, var2.Size.Size_1000)
		}),
		TextContainer = reactModule.createElement(view, { LayoutOrder = 2, tag = "col auto-xy fill" }, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "auto-xy text-align-x-left",
				Text = p0.title,
				TextWrapped = p0.titleTextWrap,
				TextTruncate = p0.titleTextTruncate or Enum.TextTruncate.SplitWord,
				textStyle = p0.titleTextColor or var2.DarkMode.Content.Emphasis,
				fontStyle = p0.titleFontStyle or titleMedium,
				Size = p0.textContainerSize or UDim2.new(1, 0, 0, var2.Size.Size_500)
			}),
			SubtitleContainer = reactModule.createElement(view, {
				LayoutOrder = 2,
				Size = p0.textContainerSize or UDim2.new(1, 0, 0, var2.Size.Size_500),
				onActivated = p0.subtitleOnActivated,
				tag = {
					["row size-full-0 auto-y"] = true,
					["align-y-center gap-xsmall"] = p0.subtitleIconName ~= nil
				}
			}, {
				Subtitle = reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "auto-xy text-align-x-left",
					Text = p0.subtitle,
					onActivated = p0.subtitleOnActivated,
					fontStyle = p0.subtitleFontStyle or bodyMedium,
					textStyle = p0.subtitleTextColor or var2.DarkMode.Content.Emphasis,
					TextWrapped = p0.subtitleTextWrap,
					TextTruncate = p0.subtitleTextTruncate or Enum.TextTruncate.SplitWord
				}),
				Icon = if p0.subtitleIconName and p0.subtitleBackgroundIconName then reactModule.createElement(view, { LayoutOrder = 2, tag = "auto-xy" }, {
					BackgroundIcon = reactModule.createElement(icon, {
						size = if p0.subtitleIconSize then p0.subtitleIconSize else nil,
						name = p0.subtitleBackgroundIconName,
						style = if p0.subtitleBackgroundIconStyle then p0.subtitleBackgroundIconStyle else var2.Color.System.Emphasis
					}),
					ForegroundIcon = reactModule.createElement(icon, {
						size = if p0.subtitleIconSize then p0.subtitleIconSize else nil,
						variant = if p0.subtitleIconVariant then p0.subtitleIconVariant else nil,
						name = p0.subtitleIconName,
						style = p0.subtitleIconStyle
					})
				}) elseif p0.subtitleIconName then reactModule.createElement(icon, {
					LayoutOrder = 2,
					size = if p0.subtitleIconSize then p0.subtitleIconSize else nil,
					name = p0.subtitleIconName,
					variant = if p0.subtitleIconVariant then p0.subtitleIconVariant else nil,
					style = if p0.subtitleIconStyle then p0.subtitleIconStyle else var2.Color.System.Emphasis
				}) else nil
			}),
			Caption = if p0.caption then reactModule.createElement(text, {
				LayoutOrder = 3,
				tag = "auto-xy text-align-x-left text-truncate-split-word",
				Text = p0.caption,
				textStyle = p0.captionTextColor or var2.Color.Content.Default,
				fontStyle = p0.captionFontStyle or var2.Typography.CaptionBody,
				Size = p0.textContainerSize
			}) else nil
		}),
		RightButtonContent = p0.rightButtonContent and reactModule.createElement(view, { LayoutOrder = 3, tag = "auto-xy row" }, { ButtonContent = p0.rightButtonContent })
	})
end)