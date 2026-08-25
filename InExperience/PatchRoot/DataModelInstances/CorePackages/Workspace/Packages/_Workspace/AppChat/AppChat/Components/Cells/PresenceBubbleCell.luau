local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local UIBloxModule = require(parent.UIBlox)
local foundationModule = require(parent.Foundation)
local radius = foundationModule.Enums.Radius
local skeleton = foundationModule.Skeleton
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local useTextSizeOffset = UIBloxModule.Core.Style.useTextSizeOffset
local baseCellModule = require(script.Parent.BaseCell)
local conversationFacePileModule = require(appChat.Components.Cells.ConversationFacePile)
local avatarCircleModule = require(script.Parent.AvatarCircle)
local fFlagDebugAppChatEnableDomLocatorsModule = require(appChat.Flags.FFlagDebugAppChatEnableDomLocators)
local fFlagEnableBlackbirdCheck = require(parent.SharedFlags).FFlagEnableBlackbirdCheck
local fFlagAppChatFixPlusBadgeAlignmentModule = require(appChat.Flags.FFlagAppChatFixPlusBadgeAlignment)
local fFlagAppChatTimestampInSubtitleModule = require(appChat.Flags.FFlagAppChatTimestampInSubtitle)
local t = {
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

return reactModule.memo(function(p0)
	-- upvalues: cryoModule (ref), t (ref), useTextSizeOffset (ref), fFlagAppChatTimestampInSubtitleModule (ref), reactModule (ref), baseCellModule (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), conversationFacePileModule (ref), avatarCircleModule (ref), skeleton (ref), radius (ref), fFlagAppChatFixPlusBadgeAlignmentModule (ref), foundationModule (ref), fFlagEnableBlackbirdCheck (ref), imageSetLabel (ref)
	local var12 = cryoModule.Dictionary.join(t, p0)
	local var13 = useTextSizeOffset()
	local var14 = var12.subTitleTextSize + var13
	local var15 = var12.titleTextSize + var13
	local var16 = var12.subTitleTextSize + var13
	local _ = nil
	local var17 = nil
	local _ = nil
	local var18 = nil
	local var19 = nil
	local var20 = nil
	
	if fFlagAppChatTimestampInSubtitleModule then
		local var21, var22 = reactModule.useBinding(1e999)
		local var23 = var21
		var17 = var22
		local var24, var25 = reactModule.useBinding(0)
		var18 = var25
		var19 = reactModule.joinBindings({ var23, var24 }):map(function(p1)
			return Vector2.new(math.max(0, p1[1] - p1[2]), 1e999)
		end)
		var20 = reactModule.useMemo(function()
			-- upvalues: var12 (ref)
			if not var12.subTitleTimestamp then
				return nil
			end
			local subTitleText = var12.subTitleText
			
			return if subTitleText and subTitleText ~= "" then var12.subTitleTimestamp:map(function(p2)
				return if p2 == "" then "" else " \194\183 " .. p2
			end) else var12.subTitleTimestamp
		end, { var12.subTitleTimestamp, var12.subTitleText })
	end
	local frame
	local var26 = var12.conversationId ~= nil
	local var27 = -(var12.paddingLeft + var12.paddingRight + var12.childWidth)
	local var28 = cryoModule.Dictionary.join({
		layout = reactModule.createElement("UIListLayout", {
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}, var12.children or {})
	local createElement = reactModule.createElement
	local t_1 = {
		BorderSizePixel = 0,
		AutoButtonColor = false,
		Size = var12.Size,
		BackgroundTransparency = var12.BackgroundTransparency,
		BackgroundColor3 = var12.BackgroundColor3,
		dividerColor3 = var12.dividerColor3,
		dividerTransparency = var12.dividerTransparency,
		avatarCircleCellWidth = var12.avatarCircleCellWidth,
		onPressedBackgroundColor3 = var12.onPressedBackgroundColor3,
		onPressedBackgroundTransparency = var12.onPressedBackgroundTransparency,
		testId = if fFlagDebugAppChatEnableDomLocatorsModule then var12.testId else nil,
		LayoutOrder = var12.LayoutOrder,
		onActivated = var12.onActivated,
		showDivider = var12.showDivider
	}
	local t_2 = {}
	local createElement_1 = reactModule.createElement
	local var31 = "Frame"
	local t_3 = {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, var27, 1, 0)
	}
	local t_4 = {
		uiPadding = reactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, var12.paddingLeft) }),
		layout = reactModule.createElement("UIListLayout", {
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}
	local createElement_2 = reactModule.createElement
	local var34 = "Frame"
	local t_5 = {
		BackgroundTransparency = 1,
		LayoutOrder = 0,
		Size = UDim2.new(0, var12.avatarCircleCellWidth, 1, 0)
	}
	local t_6 = {
		layout = reactModule.createElement("UIListLayout", {
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = if var12.hideLeftAvatarPadding then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Center
		})
	}
	
	if not var12.isLoading then
		frame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, var12.avatarCircleSize, 0, var12.avatarCircleSize)
		}, {
			conversationFacePile = if var26 then reactModule.createElement(conversationFacePileModule, {
				conversationId = var12.conversationId,
				onActivated = var12.onCircleActivated or var12.onActivated,
				selectable = if var12.onCircleActivated == nil then false else nil
			}) else nil,
			avatarCircle = if not var26 then reactModule.createElement(avatarCircleModule, {
				circleColor3 = var12.BackgroundColor3,
				circleTransparency = var12.BackgroundTransparency,
				circleInteriorBackgroundColor3 = var12.avatarCircleBackgroundColor3,
				circleDividerColor3 = var12.avatarCircleDividerColor3,
				circleDividerTransparency = var12.avatarCircleDividerTransparency,
				thumbnails = var12.thumbnails,
				presenceImage = var12.avatarCirclePresenceImage,
				presenceImageColor3 = var12.avatarCirclePresenceImageColor3,
				presenceImageTransparency = var12.avatarCirclePresenceImageTransparency,
				selectable = if var12.onCircleActivated == nil then false else nil,
				showNewPresenceImage = var12.showNewPresenceImage,
				onActivated = var12.onCircleActivated or var12.onActivated
			}) else nil
		}) or reactModule.createElement(skeleton, {
			Size = UDim2.new(0, var12.avatarCircleSize, 0, var12.avatarCircleSize),
			radius = radius.Circle
		})
	end
	local frame_1
	t_6.circleSizeContainer = frame
	t_4.circleHolder = createElement_2(var34, t_5, t_6)
	local createElement_3 = reactModule.createElement
	local var38 = "Frame"
	local t_7 = {
		BackgroundTransparency = 1,
		LayoutOrder = 1,
		Size = UDim2.new(1, -var12.avatarCircleCellWidth, 1, 0)
	}
	local t_8 = {
		layout = reactModule.createElement("UIListLayout", {
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 2)
		})
	}
	
	if not var12.isLoading then
		frame_1 = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, var15)
		}, {
			layout = reactModule.createElement("UIListLayout", {
				VerticalAlignment = if fFlagAppChatFixPlusBadgeAlignmentModule then Enum.VerticalAlignment.Center else Enum.VerticalAlignment.Bottom,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 4)
			}),
			title = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				AutomaticSize = Enum.AutomaticSize.X,
				Size = UDim2.new(0, 0, 0, var15),
				TextSize = var12.titleTextSize,
				TextColor3 = var12.titleTextColor3,
				TextTransparency = var12.titleTextTransparency,
				Font = var12.titleFont,
				Text = var12.titleText or "",
				TextTruncate = Enum.TextTruncate.SplitWord,
				TextXAlignment = Enum.TextXAlignment.Left
			}, {
				flex = reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Shrink })
			}),
			subscriptionBadge = if fFlagAppChatFixPlusBadgeAlignmentModule then if var12.isRobloxSubscriber then reactModule.createElement(foundationModule.Icon, {
				LayoutOrder = 2,
				name = foundationModule.Enums.IconName.RobloxPlus,
				size = foundationModule.Enums.IconSize.Small,
				style = {
					Color3 = var12.titleTextColor3,
					Transparency = var12.titleTextTransparency
				}
			}) else nil else reactModule.createElement(foundationModule.View, {
				tag = "size-400-400",
				LayoutOrder = 2,
				Visible = var12.isRobloxSubscriber == true
			}, {
				Icon = reactModule.createElement(foundationModule.Icon, {
					name = foundationModule.Enums.IconName.RobloxPlus,
					size = foundationModule.Enums.IconSize.Small,
					style = {
						Color3 = var12.titleTextColor3,
						Transparency = var12.titleTextTransparency
					}
				})
			}),
			secondaryTitle = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, 0, 0, var12.secondaryTitleTextSize),
				TextSize = var12.secondaryTitleTextSize,
				TextColor3 = var12.secondaryTitleTextColor3,
				TextTransparency = var12.secondaryTitleTextTransparency,
				Font = var12.secondaryTitleFont,
				Text = var12.secondaryTitleText or "",
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Left,
				LayoutOrder = if fFlagEnableBlackbirdCheck then 3 else 2
			}, {
				flex = reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill })
			})
		}) or reactModule.createElement(skeleton, {
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, var15),
			radius = radius.Small
		})
	end
	local createElement_4
	t_8.titleContainer = frame_1
	
	if var12.subTitleText then
		createElement_4 = reactModule.createElement
		createElement_4 = createElement_4("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, var14),
			LayoutOrder = 2,
			[reactModule.Change.AbsoluteSize] = if fFlagAppChatTimestampInSubtitleModule then function(p3)
				-- upvalues: var17 (write)
				var17(p3.AbsoluteSize.X)
			end else nil
		}, {
			layout = reactModule.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, if fFlagAppChatTimestampInSubtitleModule and not var12.subTitleIcon then 0 else var12.subTitlePadding)
			}),
			subTitleIcon = if var12.subTitleIcon and not var12.isLoading then reactModule.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(0, var14, 0, var14),
				Image = var12.subTitleIcon,
				ImageColor3 = var12.subTitleIconColor3,
				ImageTransparency = var12.subTitleIconTransparency
			}) else nil,
			userPresenceLabel = if var12.isLoading then reactModule.createElement(skeleton, {
				LayoutOrder = 2,
				Size = UDim2.new(0.6, 0, 0, var16),
				radius = radius.Small
			}) else reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				AutomaticSize = if fFlagAppChatTimestampInSubtitleModule then Enum.AutomaticSize.X else nil,
				Size = if fFlagAppChatTimestampInSubtitleModule then UDim2.new(0, 0, 0, var16) else UDim2.new(1, if var12.subTitleIcon then (-var14) - var12.subTitlePadding else 0, 0, var16),
				TextSize = var12.subTitleTextSize + 1,
				TextColor3 = var12.subTitleTextColor3,
				TextTransparency = var12.subTitleTextTransparency,
				TextXAlignment = Enum.TextXAlignment.Left,
				Text = var12.subTitleText,
				TextTruncate = if fFlagAppChatTimestampInSubtitleModule then Enum.TextTruncate.SplitWord else Enum.TextTruncate.AtEnd,
				Font = var12.subTitleTextFont
			}, if fFlagAppChatTimestampInSubtitleModule then {
				sizeConstraint = reactModule.createElement("UISizeConstraint", { MaxSize = var19 })
			} else nil),
			timestampLabel = if fFlagAppChatTimestampInSubtitleModule and var12.subTitleTimestamp and not var12.isLoading then reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.X,
				Size = UDim2.new(0, 0, 0, var16),
				TextSize = var12.subTitleTextSize + 1,
				TextColor3 = var12.subTitleTextColor3,
				TextTransparency = var12.subTitleTextTransparency,
				TextXAlignment = Enum.TextXAlignment.Left,
				Text = var20,
				Font = var12.subTitleTextFont,
				LayoutOrder = 3,
				[reactModule.Change.AbsoluteSize] = function(p4)
					-- upvalues: var18 (write)
					var18(p4.AbsoluteSize.X)
				end
			}) else nil
		})
	else
		createElement_4 = nil
	end
	t_8.userPresenceLabelWithIcon = createElement_4
	t_4.conversationInfo = createElement_3(var38, t_7, t_8)
	t_2.leftAlign = createElement_1(var31, t_3, t_4)
	t_2.rightAlign = reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, var12.childWidth, 1, 0),
		Position = UDim2.new(1, -var12.childWidth, 0, 0)
	}, cryoModule.Dictionary.join({
		uiPadding = reactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, var12.paddingRight) }),
		layout = reactModule.createElement("UIListLayout", {
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}, var28))
	
	return createElement(baseCellModule, t_1, t_2)
end)