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

return reactModule.memo(function(p1)
	-- upvalues: cryoModule (ref), t (ref), useTextSizeOffset (ref), fFlagAppChatTimestampInSubtitleModule (ref), reactModule (ref), baseCellModule (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), conversationFacePileModule (ref), avatarCircleModule (ref), skeleton (ref), radius (ref), fFlagAppChatFixPlusBadgeAlignmentModule (ref), foundationModule (ref), fFlagEnableBlackbirdCheck (ref), imageSetLabel (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local var2 = useTextSizeOffset()
	local var3 = var1.subTitleTextSize + var2
	local var4 = var1.titleTextSize + var2
	local var5 = var1.subTitleTextSize + var2
	local _ = nil
	local var6 = nil
	local _ = nil
	local var7 = nil
	local var8 = nil
	local var9 = nil
	
	if fFlagAppChatTimestampInSubtitleModule then
		local var10, var11 = reactModule.useBinding(1e999)
		local var12 = var10
		var6 = var11
		local var13, var14 = reactModule.useBinding(0)
		var7 = var14
		var8 = reactModule.joinBindings({ var12, var13 }):map(function(p2)
			return Vector2.new(math.max(0, p2[1] - p2[2]), 1e999)
		end)
		var9 = reactModule.useMemo(function()
			-- upvalues: var1 (ref)
			if not var1.subTitleTimestamp then
				return nil
			end
			local subTitleText = var1.subTitleText
			
			return if subTitleText and subTitleText ~= "" then var1.subTitleTimestamp:map(function(p2)
				return if p2 == "" then "" else " \194\183 " .. p2
			end) else var1.subTitleTimestamp
		end, { var1.subTitleTimestamp, var1.subTitleText })
	end
	local frame
	local var15 = var1.conversationId ~= nil
	local var16 = -(var1.paddingLeft + var1.paddingRight + var1.childWidth)
	local var17 = cryoModule.Dictionary.join({
		layout = reactModule.createElement("UIListLayout", {
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}, var1.children or {})
	local createElement = reactModule.createElement
	local t_1 = {
		BorderSizePixel = 0,
		AutoButtonColor = false,
		Size = var1.Size,
		BackgroundTransparency = var1.BackgroundTransparency,
		BackgroundColor3 = var1.BackgroundColor3,
		dividerColor3 = var1.dividerColor3,
		dividerTransparency = var1.dividerTransparency,
		avatarCircleCellWidth = var1.avatarCircleCellWidth,
		onPressedBackgroundColor3 = var1.onPressedBackgroundColor3,
		onPressedBackgroundTransparency = var1.onPressedBackgroundTransparency,
		testId = if fFlagDebugAppChatEnableDomLocatorsModule then var1.testId else nil,
		LayoutOrder = var1.LayoutOrder,
		onActivated = var1.onActivated,
		showDivider = var1.showDivider
	}
	local t_2 = {}
	local createElement_1 = reactModule.createElement
	local var18 = "Frame"
	local t_3 = {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, var16, 1, 0)
	}
	local t_4 = {
		uiPadding = reactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, var1.paddingLeft) }),
		layout = reactModule.createElement("UIListLayout", {
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}
	local createElement_2 = reactModule.createElement
	local var19 = "Frame"
	local t_5 = {
		BackgroundTransparency = 1,
		LayoutOrder = 0,
		Size = UDim2.new(0, var1.avatarCircleCellWidth, 1, 0)
	}
	local t_6 = {
		layout = reactModule.createElement("UIListLayout", {
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = if var1.hideLeftAvatarPadding then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Center
		})
	}
	
	if not var1.isLoading then
		frame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, var1.avatarCircleSize, 0, var1.avatarCircleSize)
		}, {
			conversationFacePile = if var15 then reactModule.createElement(conversationFacePileModule, {
				conversationId = var1.conversationId,
				onActivated = var1.onCircleActivated or var1.onActivated,
				selectable = if var1.onCircleActivated == nil then false else nil
			}) else nil,
			avatarCircle = if not var15 then reactModule.createElement(avatarCircleModule, {
				circleColor3 = var1.BackgroundColor3,
				circleTransparency = var1.BackgroundTransparency,
				circleInteriorBackgroundColor3 = var1.avatarCircleBackgroundColor3,
				circleDividerColor3 = var1.avatarCircleDividerColor3,
				circleDividerTransparency = var1.avatarCircleDividerTransparency,
				thumbnails = var1.thumbnails,
				presenceImage = var1.avatarCirclePresenceImage,
				presenceImageColor3 = var1.avatarCirclePresenceImageColor3,
				presenceImageTransparency = var1.avatarCirclePresenceImageTransparency,
				selectable = if var1.onCircleActivated == nil then false else nil,
				showNewPresenceImage = var1.showNewPresenceImage,
				onActivated = var1.onCircleActivated or var1.onActivated
			}) else nil
		}) or reactModule.createElement(skeleton, {
			Size = UDim2.new(0, var1.avatarCircleSize, 0, var1.avatarCircleSize),
			radius = radius.Circle
		})
	end
	local frame_1
	t_6.circleSizeContainer = frame
	t_4.circleHolder = createElement_2(var19, t_5, t_6)
	local createElement_3 = reactModule.createElement
	local var20 = "Frame"
	local t_7 = {
		BackgroundTransparency = 1,
		LayoutOrder = 1,
		Size = UDim2.new(1, -var1.avatarCircleCellWidth, 1, 0)
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
	
	if not var1.isLoading then
		frame_1 = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, var4)
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
				Size = UDim2.new(0, 0, 0, var4),
				TextSize = var1.titleTextSize,
				TextColor3 = var1.titleTextColor3,
				TextTransparency = var1.titleTextTransparency,
				Font = var1.titleFont,
				Text = var1.titleText or "",
				TextTruncate = Enum.TextTruncate.SplitWord,
				TextXAlignment = Enum.TextXAlignment.Left
			}, {
				flex = reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Shrink })
			}),
			subscriptionBadge = if fFlagAppChatFixPlusBadgeAlignmentModule then if var1.isRobloxSubscriber then reactModule.createElement(foundationModule.Icon, {
				LayoutOrder = 2,
				name = foundationModule.Enums.IconName.RobloxPlus,
				size = foundationModule.Enums.IconSize.Small,
				style = {
					Color3 = var1.titleTextColor3,
					Transparency = var1.titleTextTransparency
				}
			}) else nil else reactModule.createElement(foundationModule.View, {
				tag = "size-400-400",
				LayoutOrder = 2,
				Visible = var1.isRobloxSubscriber == true
			}, {
				Icon = reactModule.createElement(foundationModule.Icon, {
					name = foundationModule.Enums.IconName.RobloxPlus,
					size = foundationModule.Enums.IconSize.Small,
					style = {
						Color3 = var1.titleTextColor3,
						Transparency = var1.titleTextTransparency
					}
				})
			}),
			secondaryTitle = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, 0, 0, var1.secondaryTitleTextSize),
				TextSize = var1.secondaryTitleTextSize,
				TextColor3 = var1.secondaryTitleTextColor3,
				TextTransparency = var1.secondaryTitleTextTransparency,
				Font = var1.secondaryTitleFont,
				Text = var1.secondaryTitleText or "",
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Left,
				LayoutOrder = if fFlagEnableBlackbirdCheck then 3 else 2
			}, {
				flex = reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill })
			})
		}) or reactModule.createElement(skeleton, {
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, var4),
			radius = radius.Small
		})
	end
	local createElement_4
	t_8.titleContainer = frame_1
	
	if var1.subTitleText then
		createElement_4 = reactModule.createElement
		createElement_4 = createElement_4("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, var3),
			LayoutOrder = 2,
			[reactModule.Change.AbsoluteSize] = if fFlagAppChatTimestampInSubtitleModule then function(p2)
				-- upvalues: var6 (write)
				var6(p2.AbsoluteSize.X)
			end else nil
		}, {
			layout = reactModule.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, if fFlagAppChatTimestampInSubtitleModule and not var1.subTitleIcon then 0 else var1.subTitlePadding)
			}),
			subTitleIcon = if var1.subTitleIcon and not var1.isLoading then reactModule.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(0, var3, 0, var3),
				Image = var1.subTitleIcon,
				ImageColor3 = var1.subTitleIconColor3,
				ImageTransparency = var1.subTitleIconTransparency
			}) else nil,
			userPresenceLabel = if var1.isLoading then reactModule.createElement(skeleton, {
				LayoutOrder = 2,
				Size = UDim2.new(0.6, 0, 0, var5),
				radius = radius.Small
			}) else reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				AutomaticSize = if fFlagAppChatTimestampInSubtitleModule then Enum.AutomaticSize.X else nil,
				Size = if fFlagAppChatTimestampInSubtitleModule then UDim2.new(0, 0, 0, var5) else UDim2.new(1, if var1.subTitleIcon then (-var3) - var1.subTitlePadding else 0, 0, var5),
				TextSize = var1.subTitleTextSize + 1,
				TextColor3 = var1.subTitleTextColor3,
				TextTransparency = var1.subTitleTextTransparency,
				TextXAlignment = Enum.TextXAlignment.Left,
				Text = var1.subTitleText,
				TextTruncate = if fFlagAppChatTimestampInSubtitleModule then Enum.TextTruncate.SplitWord else Enum.TextTruncate.AtEnd,
				Font = var1.subTitleTextFont
			}, if fFlagAppChatTimestampInSubtitleModule then {
				sizeConstraint = reactModule.createElement("UISizeConstraint", { MaxSize = var8 })
			} else nil),
			timestampLabel = if fFlagAppChatTimestampInSubtitleModule and var1.subTitleTimestamp and not var1.isLoading then reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.X,
				Size = UDim2.new(0, 0, 0, var5),
				TextSize = var1.subTitleTextSize + 1,
				TextColor3 = var1.subTitleTextColor3,
				TextTransparency = var1.subTitleTextTransparency,
				TextXAlignment = Enum.TextXAlignment.Left,
				Text = var9,
				Font = var1.subTitleTextFont,
				LayoutOrder = 3,
				[reactModule.Change.AbsoluteSize] = function(p2)
					-- upvalues: var7 (write)
					var7(p2.AbsoluteSize.X)
				end
			}) else nil
		})
	else
		createElement_4 = nil
	end
	t_8.userPresenceLabelWithIcon = createElement_4
	t_4.conversationInfo = createElement_3(var20, t_7, t_8)
	t_2.leftAlign = createElement_1(var18, t_3, t_4)
	t_2.rightAlign = reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, var1.childWidth, 1, 0),
		Position = UDim2.new(1, -var1.childWidth, 0, 0)
	}, cryoModule.Dictionary.join({
		uiPadding = reactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, var1.paddingRight) }),
		layout = reactModule.createElement("UIListLayout", {
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}, var17))
	
	return createElement(baseCellModule, t_1, t_2)
end)