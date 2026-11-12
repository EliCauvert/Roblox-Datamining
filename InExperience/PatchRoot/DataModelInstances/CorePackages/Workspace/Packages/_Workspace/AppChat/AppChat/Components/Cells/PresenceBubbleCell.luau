local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local Radius = FoundationModule.Enums.Radius
local Skeleton = FoundationModule.Skeleton
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local UseTextSizeOffsetFunction = UIBloxModule.Core.Style.useTextSizeOffset
local BaseCellModule = require(script.Parent.BaseCell)
local ConversationFacePileModule = require(AppChat.Components.Cells.ConversationFacePile)
local AvatarCircleModule = require(script.Parent.AvatarCircle)
local FFlagDebugAppChatEnableDomLocatorsModule = require(AppChat.Flags.FFlagDebugAppChatEnableDomLocators)
local FFlagEnableBlackbirdCheck = require(Parent.SharedFlags).FFlagEnableBlackbirdCheck
local FFlagAppChatFixPlusBadgeAlignmentModule = require(AppChat.Flags.FFlagAppChatFixPlusBadgeAlignment)
local FFlagAppChatTimestampInSubtitleModule = require(AppChat.Flags.FFlagAppChatTimestampInSubtitle)
local config = {
	BackgroundColor3 = Color3.new(1, 1, 1),
	BackgroundTransparency = 0,
	onPressedBackgroundColor3 = Color3.new(0, 0.2, 0.3),
	onPressedBackgroundTransparency = 1,
	testId = nil,
	avatarCircleCellWidth = 60,
	avatarCircleSize = 36,
	avatarCircleBackgroundColor3 = Color3.new(0.4, 0.4, 0.4),
	avatarCircleDividerColor3 = Color3.new(0.2, 0.2, 0.2),
	avatarCircleDividerTransparency = 0,
	avatarCirclePresenceImage = nil,
	subTitleText = nil,
	subTitleTextFont = Enum.Font.Gotham,
	subTitleTextTransparency = 0,
	subTitleTextColor3 = Color3.new(0.1, 0.1, 0.1),
	subTitleTextSize = 15,
	subTitlePadding = 2,
	subTitleIconColor3 = Color3.new(0.1, 0.1, 0.1),
	subTitleIconTransparency = 0,
	titleText = "titleText",
	titleFont = Enum.Font.Gotham,
	titleTextTransparency = 0,
	titleTextColor3 = Color3.new(0, 0, 0),
	titleTextSize = 20,
	secondaryTitleText = nil,
	secondaryTitleFont = Enum.Font.Gotham,
	secondaryTitleTextTransparency = 0,
	secondaryTitleTextColor3 = Color3.new(0.2, 0.2, 0.2),
	secondaryTitleTextSize = 16,
	showDivider = true,
	dividerTransparency = 0,
	dividerColor3 = Color3.fromRGB(227, 227, 227),
	thumbnails = {},
	conversationId = nil,
	childWidth = 0,
	onActivated = nil,
	onCircleActivated = nil,
	Size = UDim2.new(1, 0, 1, 0),
	isLoading = false,
	hideLeftAvatarPadding = false,
	paddingLeft = 0,
	paddingRight = 0
}

return ReactModule.memo(function(p1)
	-- upvalues: CryoModule (copy), config (copy), UseTextSizeOffsetFunction (copy), FFlagAppChatTimestampInSubtitleModule (copy), ReactModule (copy), BaseCellModule (copy), FFlagDebugAppChatEnableDomLocatorsModule (copy), ConversationFacePileModule (copy), AvatarCircleModule (copy), Skeleton (copy), Radius (copy), FFlagAppChatFixPlusBadgeAlignmentModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), FoundationModule (copy), FFlagEnableBlackbirdCheck (copy), ImageSetLabel (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseTextSizeOffsetResult = UseTextSizeOffsetFunction()
	local NewSubTitleTextSize = JoinResult.subTitleTextSize + UseTextSizeOffsetResult
	local NewTitleTextSize = JoinResult.titleTextSize + UseTextSizeOffsetResult
	local NewSubTitleTextSize1 = JoinResult.subTitleTextSize + UseTextSizeOffsetResult
	local Callback = nil
	local Callback1 = nil
	local MapResult = nil
	local UseMemoResult = nil
	
	if FFlagAppChatTimestampInSubtitleModule then
		local UseBindingResult
		UseBindingResult, Callback = ReactModule.useBinding(1e999)
		local UseBindingResult1
		UseBindingResult1, Callback1 = ReactModule.useBinding(0)
		MapResult = ReactModule.joinBindings({ UseBindingResult, UseBindingResult1 }):map(function(Entry): Vector2
			return Vector2.new(math.max(0, Entry[1] - Entry[2]), 1e999)
		end)
		UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: JoinResult (copy)
			if JoinResult.subTitleTimestamp then
				local SubTitleText = JoinResult.subTitleText
				
				return if SubTitleText and SubTitleText ~= "" then JoinResult.subTitleTimestamp:map(function(Text): string
					return if Text == "" then "" else " · " .. Text
				end) else JoinResult.subTitleTimestamp
			else
				return nil
			end
		end, { JoinResult.subTitleTimestamp, JoinResult.subTitleText })
	end
	local HasConversationId = JoinResult.conversationId ~= nil
	
	return ReactModule.createElement(BaseCellModule, {
		BorderSizePixel = 0,
		AutoButtonColor = false,
		Size = JoinResult.Size,
		BackgroundTransparency = JoinResult.BackgroundTransparency,
		BackgroundColor3 = JoinResult.BackgroundColor3,
		dividerColor3 = JoinResult.dividerColor3,
		dividerTransparency = JoinResult.dividerTransparency,
		avatarCircleCellWidth = JoinResult.avatarCircleCellWidth,
		onPressedBackgroundColor3 = JoinResult.onPressedBackgroundColor3,
		onPressedBackgroundTransparency = JoinResult.onPressedBackgroundTransparency,
		testId = if FFlagDebugAppChatEnableDomLocatorsModule then JoinResult.testId else nil,
		LayoutOrder = JoinResult.LayoutOrder,
		onActivated = JoinResult.onActivated,
		showDivider = JoinResult.showDivider
	}, {
		leftAlign = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, -(JoinResult.paddingLeft + JoinResult.paddingRight + JoinResult.childWidth), 1, 0)
		}, {
			uiPadding = ReactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, JoinResult.paddingLeft) }),
			layout = ReactModule.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			circleHolder = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 0,
				Size = UDim2.new(0, JoinResult.avatarCircleCellWidth, 1, 0)
			}, {
				layout = ReactModule.createElement("UIListLayout", {
					VerticalAlignment = Enum.VerticalAlignment.Center,
					HorizontalAlignment = if JoinResult.hideLeftAvatarPadding then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Center
				}),
				circleSizeContainer = if JoinResult.isLoading then ReactModule.createElement(Skeleton, {
					Size = UDim2.new(0, JoinResult.avatarCircleSize, 0, JoinResult.avatarCircleSize),
					radius = Radius.Circle
				}) else ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(0, JoinResult.avatarCircleSize, 0, JoinResult.avatarCircleSize)
				}, {
					conversationFacePile = if HasConversationId then ReactModule.createElement(ConversationFacePileModule, {
						conversationId = JoinResult.conversationId,
						participants = JoinResult.participants,
						onActivated = JoinResult.onCircleActivated or JoinResult.onActivated,
						selectable = JoinResult.onCircleActivated ~= nil and nil
					}) else nil,
					avatarCircle = if HasConversationId then nil else ReactModule.createElement(AvatarCircleModule, {
						circleColor3 = JoinResult.BackgroundColor3,
						circleTransparency = JoinResult.BackgroundTransparency,
						circleInteriorBackgroundColor3 = JoinResult.avatarCircleBackgroundColor3,
						circleDividerColor3 = JoinResult.avatarCircleDividerColor3,
						circleDividerTransparency = JoinResult.avatarCircleDividerTransparency,
						thumbnails = JoinResult.thumbnails,
						presenceImage = JoinResult.avatarCirclePresenceImage,
						presenceImageColor3 = JoinResult.avatarCirclePresenceImageColor3,
						presenceImageTransparency = JoinResult.avatarCirclePresenceImageTransparency,
						selectable = JoinResult.onCircleActivated ~= nil and nil,
						showNewPresenceImage = JoinResult.showNewPresenceImage,
						onActivated = JoinResult.onCircleActivated or JoinResult.onActivated
					})
				}) or ReactModule.createElement(Skeleton, {
					Size = UDim2.new(0, JoinResult.avatarCircleSize, 0, JoinResult.avatarCircleSize),
					radius = Radius.Circle
				})
			}),
			conversationInfo = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, -JoinResult.avatarCircleCellWidth, 1, 0)
			}, {
				layout = ReactModule.createElement("UIListLayout", {
					VerticalAlignment = Enum.VerticalAlignment.Center,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 2)
				}),
				titleContainer = if JoinResult.isLoading then ReactModule.createElement(Skeleton, {
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, NewTitleTextSize),
					radius = Radius.Small
				}) else ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, NewTitleTextSize)
				}, {
					layout = ReactModule.createElement("UIListLayout", {
						VerticalAlignment = if FFlagAppChatFixPlusBadgeAlignmentModule then Enum.VerticalAlignment.Center else Enum.VerticalAlignment.Bottom,
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						FillDirection = Enum.FillDirection.Horizontal,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, 4)
					}),
					title = ReactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						AutomaticSize = Enum.AutomaticSize.X,
						Size = UDim2.new(0, 0, 0, NewTitleTextSize),
						TextSize = JoinResult.titleTextSize,
						TextColor3 = JoinResult.titleTextColor3,
						TextTransparency = JoinResult.titleTextTransparency,
						Font = if FoundationFontFaceMigration then nil else JoinResult.titleFont,
						FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(JoinResult.titleFont) else nil,
						Text = JoinResult.titleText or "",
						TextTruncate = Enum.TextTruncate.SplitWord,
						TextXAlignment = Enum.TextXAlignment.Left
					}, {
						flex = ReactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Shrink })
					}),
					subscriptionBadge = if FFlagAppChatFixPlusBadgeAlignmentModule then if JoinResult.isRobloxSubscriber then ReactModule.createElement(FoundationModule.Icon, {
						LayoutOrder = 2,
						name = FoundationModule.Enums.IconName.RobloxPlus,
						size = FoundationModule.Enums.IconSize.Small,
						style = {
							Color3 = JoinResult.titleTextColor3,
							Transparency = JoinResult.titleTextTransparency
						}
					}) else nil else ReactModule.createElement(FoundationModule.View, {
						tag = "size-400-400",
						LayoutOrder = 2,
						Visible = JoinResult.isRobloxSubscriber == true
					}, {
						Icon = ReactModule.createElement(FoundationModule.Icon, {
							name = FoundationModule.Enums.IconName.RobloxPlus,
							size = FoundationModule.Enums.IconSize.Small,
							style = {
								Color3 = JoinResult.titleTextColor3,
								Transparency = JoinResult.titleTextTransparency
							}
						})
					}),
					secondaryTitle = ReactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						Size = UDim2.new(0, 0, 0, JoinResult.secondaryTitleTextSize),
						TextSize = JoinResult.secondaryTitleTextSize,
						TextColor3 = JoinResult.secondaryTitleTextColor3,
						TextTransparency = JoinResult.secondaryTitleTextTransparency,
						Font = if FoundationFontFaceMigration then nil else JoinResult.secondaryTitleFont,
						FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(JoinResult.secondaryTitleFont) else nil,
						Text = JoinResult.secondaryTitleText or "",
						TextTruncate = Enum.TextTruncate.AtEnd,
						TextXAlignment = Enum.TextXAlignment.Left,
						LayoutOrder = if FFlagEnableBlackbirdCheck then 3 else 2
					}, {
						flex = ReactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill })
					})
				}) or ReactModule.createElement(Skeleton, {
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, NewTitleTextSize),
					radius = Radius.Small
				}),
				userPresenceLabelWithIcon = if JoinResult.subTitleText then ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, NewSubTitleTextSize),
					LayoutOrder = 2,
					[ReactModule.Change.AbsoluteSize] = if FFlagAppChatTimestampInSubtitleModule then function(Frame)
						-- upvalues: Callback (ref)
						Callback(Frame.AbsoluteSize.X)
					end else nil
				}, {
					layout = ReactModule.createElement("UIListLayout", {
						VerticalAlignment = Enum.VerticalAlignment.Center,
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						FillDirection = Enum.FillDirection.Horizontal,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, if FFlagAppChatTimestampInSubtitleModule and not JoinResult.subTitleIcon then 0 else JoinResult.subTitlePadding)
					}),
					subTitleIcon = if JoinResult.subTitleIcon and not JoinResult.isLoading then ReactModule.createElement(ImageSetLabel, {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						Size = UDim2.new(0, NewSubTitleTextSize, 0, NewSubTitleTextSize),
						Image = JoinResult.subTitleIcon,
						ImageColor3 = JoinResult.subTitleIconColor3,
						ImageTransparency = JoinResult.subTitleIconTransparency
					}) else nil,
					userPresenceLabel = if JoinResult.isLoading then ReactModule.createElement(Skeleton, {
						LayoutOrder = 2,
						Size = UDim2.new(0.6, 0, 0, NewSubTitleTextSize1),
						radius = Radius.Small
					}) else ReactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						AutomaticSize = if FFlagAppChatTimestampInSubtitleModule then Enum.AutomaticSize.X else nil,
						Size = if FFlagAppChatTimestampInSubtitleModule then UDim2.new(0, 0, 0, NewSubTitleTextSize1) else UDim2.new(1, if JoinResult.subTitleIcon then -NewSubTitleTextSize - JoinResult.subTitlePadding else 0, 0, NewSubTitleTextSize1),
						TextSize = JoinResult.subTitleTextSize + 1,
						TextColor3 = JoinResult.subTitleTextColor3,
						TextTransparency = JoinResult.subTitleTextTransparency,
						TextXAlignment = Enum.TextXAlignment.Left,
						Text = JoinResult.subTitleText,
						TextTruncate = if FFlagAppChatTimestampInSubtitleModule then Enum.TextTruncate.SplitWord else Enum.TextTruncate.AtEnd,
						Font = if FoundationFontFaceMigration then nil else JoinResult.subTitleTextFont,
						FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(JoinResult.subTitleTextFont) else nil
					}, if FFlagAppChatTimestampInSubtitleModule then {
						sizeConstraint = ReactModule.createElement("UISizeConstraint", { MaxSize = MapResult })
					} else nil),
					timestampLabel = if FFlagAppChatTimestampInSubtitleModule and JoinResult.subTitleTimestamp and not JoinResult.isLoading then ReactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						AutomaticSize = Enum.AutomaticSize.X,
						Size = UDim2.new(0, 0, 0, NewSubTitleTextSize1),
						TextSize = JoinResult.subTitleTextSize + 1,
						TextColor3 = JoinResult.subTitleTextColor3,
						TextTransparency = JoinResult.subTitleTextTransparency,
						TextXAlignment = Enum.TextXAlignment.Left,
						Text = UseMemoResult,
						Font = if FoundationFontFaceMigration then nil else JoinResult.subTitleTextFont,
						FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(JoinResult.subTitleTextFont) else nil,
						LayoutOrder = 3,
						[ReactModule.Change.AbsoluteSize] = function(Frame)
							-- upvalues: Callback1 (ref)
							Callback1(Frame.AbsoluteSize.X)
						end
					}) else nil
				}) else nil
			})
		}),
		rightAlign = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, JoinResult.childWidth, 1, 0),
			Position = UDim2.new(1, -JoinResult.childWidth, 0, 0)
		}, CryoModule.Dictionary.join({
			uiPadding = ReactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, JoinResult.paddingRight) }),
			layout = ReactModule.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder
			})
		}, (CryoModule.Dictionary.join({
			layout = ReactModule.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder
			})
		}, JoinResult.children or {}))))
	})
end)