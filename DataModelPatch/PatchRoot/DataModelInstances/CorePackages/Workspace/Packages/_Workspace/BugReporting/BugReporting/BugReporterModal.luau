local Parent = script:FindFirstAncestor("BugReporting").Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.AppCommonLib)
local UIBloxModule = require(Parent.UIBlox)
local _ = require(Parent.SystemInfoProtocol)
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local PartialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local VerticalScrollView = UIBloxModule.App.Container.VerticalScrollView
local _ = require(script.Parent.BugReporterTypes)

return function(p1)
	-- upvalues: ReactModule (copy), PartialPageModal (copy), ButtonType (copy), VerticalScrollView (copy)
	local LocalizedStrings = p1.localizedStrings
	local LocalizedDeviceSummary = p1.localizedDeviceSummary
	local ScreenSize = p1.screenSize
	local DesignTokens = p1.designTokens
	local config = {
		modalTitleHeight = DesignTokens.Size.Size_1200,
		modalPadding = DesignTokens.Size.Size_1200,
		modalButtonHeight = DesignTokens.Size.Size_900,
		contentPadding = DesignTokens.Size.Size_600,
		labelPadding = DesignTokens.Size.Size_300,
		screenShotHeight = DesignTokens.Size.Size_2200
	}
	local ScreenshotContentId = p1.screenshotContentId
	local ScrollContentHeight = p1.scrollContentHeight
	local OnListLayoutSizeChange = p1.onListLayoutSizeChange
	local CommentText = p1.commentText
	local CommentErrorMessage = p1.commentErrorMessage
	local OnCommentTextChange = p1.onCommentTextChange
	local CanSubmit = p1.canSubmit
	local OnSubmit = p1.onSubmit
	local OnClose = p1.onClose
	local Y: number = p1.onScreenKeyboardSize.Y
	local IsYAbove = Y > 0
	local NewBottomInset = -Y + p1.bottomInset
	local YDelta = ScreenSize.Y - Y - config.modalTitleHeight - config.modalPadding * 2 - config.modalButtonHeight - (if IsYAbove then 0 else config.modalPadding)
	local NewScreenShotHeight = config.screenShotHeight + config.contentPadding * 2 + config.labelPadding
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), IsYAbove (copy), NewScreenShotHeight (copy)
		local Current = UseRefResult.current
		
		if Current and IsYAbove then
			Current.CanvasPosition = Vector2.new(0, NewScreenShotHeight)
		end
	end, { IsYAbove, NewScreenShotHeight })
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy)
		p1.onLoad()
	end, {})
	
	return ReactModule.createElement(PartialPageModal, {
		marginSize = 0,
		title = LocalizedStrings.title,
		screenSize = ScreenSize,
		buttonStackProps = {
			buttons = {
				{
					buttonType = ButtonType.PrimaryContextual,
					props = {
						onActivated = OnSubmit,
						isDisabled = CanSubmit == false,
						text = LocalizedStrings.submit
					}
				}
			}
		},
		onCloseClicked = OnClose,
		position = IsYAbove and UDim2.new(0.5, 0, 1, NewBottomInset) or nil,
		anchorPoint = IsYAbove and Vector2.new(0.5, 1) or nil
	}, {
		Content = ReactModule.createElement(VerticalScrollView, {
			useAutomaticCanvasSize = true,
			size = UDim2.new(1, 0, 0, (math.min(ScrollContentHeight + 2 * config.contentPadding, YDelta))),
			canvasSizeY = UDim.new(),
			elasticBehavior = Enum.ElasticBehavior.Never,
			scrollingFrameRef = UseRefResult
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				Padding = UDim.new(0, config.contentPadding),
				[ReactModule.Change.AbsoluteContentSize] = OnListLayoutSizeChange
			}),
			ContentPadding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, config.contentPadding),
				PaddingBottom = UDim.new(0, config.contentPadding),
				PaddingLeft = UDim.new(0, config.contentPadding),
				PaddingRight = UDim.new(0, config.contentPadding)
			}),
			ScreenshotContainer = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0)
			}, {
				UIListLayout = ReactModule.createElement("UIListLayout", {
					Padding = UDim.new(0, config.labelPadding),
					FillDirection = Enum.FillDirection.Horizontal,
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Bottom,
					ItemLineAlignment = Enum.ItemLineAlignment.End
				}),
				Screenshot = ReactModule.createElement("ImageLabel", {
					BackgroundTransparency = 0,
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, config.screenShotHeight),
					Image = ScreenshotContentId,
					ScaleType = Enum.ScaleType.Tile,
					SizeConstraint = Enum.SizeConstraint.RelativeYY
				}, {
					UIAspectRatioConstraint = ReactModule.createElement("UIAspectRatioConstraint", {
						AspectRatio = math.max(1, ScreenSize.X) / math.max(1, ScreenSize.Y)
					})
				}),
				ScreenshotAnnotation = ReactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, 0, 0, 0),
					Font = DesignTokens.Typography.BodyLarge.Font,
					TextXAlignment = Enum.TextXAlignment.Left,
					Text = LocalizedStrings.screenshotAnnotation,
					TextSize = DesignTokens.Typography.BodyLarge.FontSize,
					TextColor3 = DesignTokens.Color.Content.Default.Color3,
					TextTransparency = DesignTokens.Color.Content.Default.Transparency,
					LineHeight = DesignTokens.LineHeight.LineHeight_120
				})
			}),
			CommentContainer = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0)
			}, {
				UIListLayout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					Padding = UDim.new(0, config.labelPadding)
				}),
				CommmentLabel = ReactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextWrapped = true,
					LayoutOrder = 1,
					Text = LocalizedStrings.commentLabel,
					TextSize = DesignTokens.Typography.BodyLarge.FontSize,
					TextColor3 = DesignTokens.Color.Content.Emphasis.Color3,
					TextTransparency = DesignTokens.Color.Content.Emphasis.Transparency,
					Font = DesignTokens.Typography.BodyLarge.Font,
					TextXAlignment = Enum.TextXAlignment.Left,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, 0, 0, 0)
				}),
				Commment = ReactModule.createElement("Frame", {
					BorderSizePixel = 1,
					LayoutOrder = 2,
					BackgroundColor3 = DesignTokens.Color.Surface.Surface_200.Color3,
					BackgroundTransparency = DesignTokens.Color.Surface.Surface_200.Transparency,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, 0, 0, 0)
				}, {
					UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, DesignTokens.Radius.Small) }),
					UIPadding = ReactModule.createElement("UIPadding", {
						PaddingTop = UDim.new(0, DesignTokens.Size.Size_200),
						PaddingBottom = UDim.new(0, DesignTokens.Size.Size_200),
						PaddingLeft = UDim.new(0, DesignTokens.Size.Size_200),
						PaddingRight = UDim.new(0, DesignTokens.Size.Size_200)
					}),
					TextBox = ReactModule.createElement("TextBox", {
						Text = CommentText,
						PlaceholderText = LocalizedStrings.commentPlaceholder,
						PlaceholderColor3 = DesignTokens.Color.Content.Default.Color3,
						Size = UDim2.new(1, 0, 0, DesignTokens.Size.Size_2400),
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Top,
						ClearTextOnFocus = false,
						MultiLine = true,
						TextWrapped = true,
						ClipsDescendants = true,
						OverlayNativeInput = true,
						TextColor3 = DesignTokens.Color.Content.Emphasis.Color3,
						TextTransparency = DesignTokens.Color.Content.Emphasis.Transparency,
						BackgroundColor3 = DesignTokens.Color.Surface.Surface_200.Color3,
						BackgroundTransparency = DesignTokens.Color.Surface.Surface_200.Transparency,
						Font = DesignTokens.Typography.BodyLarge.Font,
						TextSize = DesignTokens.Typography.BodyLarge.FontSize,
						AutomaticSize = Enum.AutomaticSize.Y,
						BorderSizePixel = 0,
						[ReactModule.Change.Text] = OnCommentTextChange
					})
				}),
				CharacterCount = ReactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextWrapped = true,
					LayoutOrder = 3,
					Text = LocalizedStrings.commentCharacterCount,
					TextSize = DesignTokens.Typography.BodyLarge.FontSize,
					TextColor3 = DesignTokens.Color.Content.Emphasis.Color3,
					TextTransparency = DesignTokens.Color.Content.Emphasis.Transparency,
					Font = DesignTokens.Typography.BodyLarge.Font,
					TextXAlignment = Enum.TextXAlignment.Left,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, 0, 0, 0)
				})
			}),
			HelperText = if CommentErrorMessage == nil then nil else ReactModule.createElement("TextLabel", {
				TextWrapped = true,
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				Text = CommentErrorMessage,
				TextTransparency = DesignTokens.Color.ActionAlert.Foreground.Transparency,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				TextColor3 = DesignTokens.Color.ActionAlert.Foreground.Color3,
				Font = DesignTokens.Typography.CaptionSmall.Font,
				TextSize = DesignTokens.Typography.CaptionSmall.FontSize,
				LineHeight = DesignTokens.Typography.CaptionSmall.FontSize,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}),
			DeviceSummary = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = true,
				LayoutOrder = 4,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0),
				Font = DesignTokens.Typography.BodyLarge.Font,
				TextXAlignment = Enum.TextXAlignment.Left,
				Text = LocalizedDeviceSummary,
				TextSize = DesignTokens.Typography.BodyLarge.FontSize,
				TextColor3 = DesignTokens.Color.Content.Muted.Color3,
				TextTransparency = DesignTokens.Color.Content.Muted.Transparency,
				LineHeight = DesignTokens.LineHeight.LineHeight_120
			})
		})
	})
end