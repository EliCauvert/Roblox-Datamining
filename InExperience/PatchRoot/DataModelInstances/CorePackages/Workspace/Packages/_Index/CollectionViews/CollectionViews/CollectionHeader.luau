local collectionViews = script:FindFirstAncestor("CollectionViews")
local parent = collectionViews.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local UIBloxModule = require(parent.UIBlox)
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local tooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation
local useDesignTokens = require(parent.Style).useDesignTokens
local iconWithTooltip = require(parent.AppBlox).IconWithTooltip
local responsiveModule = require(parent.Responsive)
local usePreferredInput = responsiveModule.usePreferredInput
local checkAndFormatPossibleLinkModule = require(collectionViews.checkAndFormatPossibleLink)
local _ = require(collectionViews.SeeAllButtonType_Legacy)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagRenameDeprecatedUIBloxTokens = sharedFlagsModule.FFlagRenameDeprecatedUIBloxTokens
local fFlagLuaAppHideCarouselSubtitleChevron = sharedFlagsModule.FFlagLuaAppHideCarouselSubtitleChevron
local fFlagLuaAppSortHeaderAnchorTag = sharedFlagsModule.FFlagLuaAppSortHeaderAnchorTag
local truncationCollapseSmall = images["icons/actions/truncationCollapse_small"]
local cycleRight = images["icons/actions/cycleRight"]
local t = {
	tooltipSupportsVR = true,
	tooltipSupportsTenFootUi = true,
	AutomaticSize = Enum.AutomaticSize.Y,
	Size = UDim2.new(1, 0, 0, 0)
}

local function HeaderButton(p0) --[[ line: 89 ]]
	-- upvalues: useDesignTokens (ref), fFlagRenameDeprecatedUIBloxTokens (ref), reactModule (ref), imageSetLabel (ref)
	local var9 = useDesignTokens()
	local var10 = if fFlagRenameDeprecatedUIBloxTokens then var9.Size.Size_400 else var9.Global.Size_200
	local var11 = if fFlagRenameDeprecatedUIBloxTokens then var9.Color.Content.Emphasis else var9.Semantic.Color.Text.Emphasis
	
	return reactModule.createElement(imageSetLabel, {
		BackgroundTransparency = 1,
		Size = p0.Size or UDim2.new(0, var10, 0, var10),
		Image = p0.image,
		ImageColor3 = var11.Color3,
		ImageTransparency = var11.Transparency,
		LayoutOrder = p0.LayoutOrder,
		Rotation = p0.Rotation,
		AnchorPoint = p0.AnchorPoint,
		Position = p0.Position
	})
end

return reactModule.memo(function(p1) --[[ line: 121 | named "CollectionHeader" ]]
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), usePreferredInput (ref), useDesignTokens (ref), fFlagRenameDeprecatedUIBloxTokens (ref), responsiveModule (ref), checkAndFormatPossibleLinkModule (ref), fFlagLuaAppHideCarouselSubtitleChevron (ref), fFlagLuaAppSortHeaderAnchorTag (ref), HeaderButton (ref), cycleRight (ref), truncationCollapseSmall (ref), iconWithTooltip (ref), tooltipOrientation (ref)
	local var12 = cryoModule.Dictionary.join(t, p1)
	local var13, var14 = reactModule.useBinding(0)
	local var15 = reactModule.useCallback(function(p2) --[[ line: 125 ]]
		-- upvalues: var14 (ref)
		var14(p2.AbsoluteSize.X)
	end, {})
	local var16 = usePreferredInput()
	local var17 = useDesignTokens()
	local titleTypography = var12.titleTypography or (if fFlagRenameDeprecatedUIBloxTokens then var17.Typography.HeadingSmall else var17.Semantic.Typography.Header)
	local titleColor = var12.titleColor or (if fFlagRenameDeprecatedUIBloxTokens then var17.Color.Content.Emphasis else var17.Semantic.Color.Text.Emphasis)
	local subtitleTypography = var12.subtitleTypography or (if fFlagRenameDeprecatedUIBloxTokens then var17.Typography.BodySmall else var17.Semantic.Typography.CaptionBody)
	local var21 = if var12.subtitleTypography then var12.subtitleTypography.FontSize else 17.64 * (if fFlagRenameDeprecatedUIBloxTokens then var17.Stroke.Standard else var17.Global.Stroke_100)
	local subtitleColor = var12.subtitleColor or (if fFlagRenameDeprecatedUIBloxTokens then var17.Color.Content.Default else var17.Semantic.Color.Text.Default)
	local var23 = if fFlagRenameDeprecatedUIBloxTokens then var17.Size.Size_50 else var17.Global.Space_25
	local var24 = if fFlagRenameDeprecatedUIBloxTokens then var17.Size.Size_300 else var17.Global.Space_150
	local var25 = if not var12.hideButton and var16 ~= responsiveModule.Input.Directional and var12.onActivate then true else false
	local var26 = if fFlagRenameDeprecatedUIBloxTokens then var17.Size.Size_700 else var17.Global.Size_350
	local var27 = if fFlagRenameDeprecatedUIBloxTokens then var17.Size.Size_100 else var17.Global.Space_50
	local var28 = if fFlagRenameDeprecatedUIBloxTokens then var17.Size.Size_500 else var17.Global.Size_250
	local var29 = var12.tooltipInfoText ~= nil
	local var30 = if var25 then var28 else 0
	local var31 = if var29 then var26 + var24 else 0
	local var32 = if var29 then var31 else 0
	local var33 = var12.subtitle ~= nil and var12.subtitle ~= ""
	local var34, var35 = checkAndFormatPossibleLinkModule(var12.subtitle)
	local var36 = if var12.onActivateSubtitle then var12.onActivateSubtitle else var12.onActivate
	
	if var12.onActivateSubtitle then
		var34 = true
	end
	local var37 = if fFlagLuaAppHideCarouselSubtitleChevron then var34 and (not var12.hideSubtitleChevron and not var25) else nil
	local var38 = if if fFlagLuaAppHideCarouselSubtitleChevron then var37 else var34 then if fFlagRenameDeprecatedUIBloxTokens then var17.Size.Size_250 else var17.Global.Size_125 else 0
	local var39 = var34 and var36 ~= nil
	
	return reactModule.createElement("Frame", {
		Position = var12.Position,
		AutomaticSize = var12.AutomaticSize,
		Size = var12.Size,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = var12.LayoutOrder,
		ZIndex = var12.ZIndex,
		[reactModule.Tag] = if fFlagLuaAppSortHeaderAnchorTag then var12.headerTag else nil,
		[reactModule.Change.AbsoluteSize] = var15
	}, {
		LeftContentFrame = reactModule.createElement(if var25 then "TextButton" else "Frame", {
			Text = if var25 then "" else nil,
			Size = UDim2.new(1, -var32, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			AnchorPoint = var12.AnchorPoint,
			BorderSizePixel = 0,
			AutoButtonColor = if var25 then false else nil,
			[reactModule.Event.Activated] = if var25 then var12.onActivate else nil,
			Active = var25,
			Selectable = var25
		}, {
			UIListLayout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				Padding = UDim.new(0, var23),
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			TitleContainer = reactModule.createElement("Frame", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0)
			}, {
				UIListLayout = reactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					Padding = UDim.new(0, var27),
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				Title = if typeof(var12.title) == "string" then reactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextWrapped = false,
					LayoutOrder = 1,
					Text = var12.title,
					AutomaticSize = Enum.AutomaticSize.XY,
					Size = UDim2.new(0, 0, 0, 0),
					Font = titleTypography.Font,
					TextSize = titleTypography.FontSize,
					TextTransparency = titleColor.Transparency,
					TextColor3 = titleColor.Color3,
					TextTruncate = Enum.TextTruncate.SplitWord,
					TextXAlignment = Enum.TextXAlignment.Left
				}, {
					UISizeConstraint = reactModule.createElement("UISizeConstraint", {
						MaxSize = var13:map(function(p3) --[[ line: 283 ]]
							-- upvalues: var30 (ref), var31 (ref)
							local var40 = p3 - var30 - var31
							
							return if var40 > 0 then Vector2.new(var40, 1e999) else nil
						end)
					})
				}) elseif typeof(var12.title) == "function" then var12.title() else nil,
				SeeAllButton = var25 and reactModule.createElement(HeaderButton, {
					LayoutOrder = 2,
					Size = UDim2.fromOffset(var28, var28),
					image = cycleRight
				}) or nil
			}),
			SubtitleFrame = var33 and (reactModule.createElement(if var39 then "TextButton" else "Frame", {
				LayoutOrder = 2,
				Text = if var39 then "" else nil,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				AutoButtonColor = if var39 then false else nil,
				[reactModule.Event.Activated] = if var39 then var36 else nil,
				Active = var39,
				Selectable = var39
			}, {
				UIListLayout = reactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					Padding = UDim.new(0, if fFlagRenameDeprecatedUIBloxTokens then var17.Size.Size_50 else var17.Global.Size_25),
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				Subtitle = reactModule.createElement("TextLabel", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					TextWrapped = false,
					Text = var35,
					AutomaticSize = Enum.AutomaticSize.XY,
					Size = UDim2.new(0, 0, 0, 0),
					Font = subtitleTypography.Font,
					TextSize = var21,
					TextTransparency = titleColor.Transparency,
					TextColor3 = subtitleColor.Color3,
					TextTruncate = Enum.TextTruncate.SplitWord,
					TextXAlignment = Enum.TextXAlignment.Left,
					RichText = var34
				}, {
					UISizeConstraint = reactModule.createElement("UISizeConstraint", {
						MaxSize = var13:map(function(p4) --[[ line: 342 ]]
							-- upvalues: var38 (ref)
							local var41 = p4 - var38
							
							return if var41 > 0 then Vector2.new(var41, 1e999) else nil
						end)
					})
				}),
				SubtitleLinkArrow = (if fFlagLuaAppHideCarouselSubtitleChevron then var37 else var34 and not var25) and reactModule.createElement("Frame", {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					ClipsDescendants = true,
					Size = UDim2.fromOffset(var38, var38)
				}, {
					Icon = reactModule.createElement(HeaderButton, {
						Rotation = 90,
						image = truncationCollapseSmall,
						Size = UDim2.new(1, if fFlagRenameDeprecatedUIBloxTokens then var17.Size.Size_50 else var17.Global.Size_25, 1, if fFlagRenameDeprecatedUIBloxTokens then var17.Size.Size_50 else var17.Global.Size_25),
						Position = UDim2.fromScale(0.5, 0.5),
						AnchorPoint = Vector2.new(0.5, 0.5)
					})
				}) or nil
			}) or nil)
		}),
		IconWithTooltip = var29 and (reactModule.createElement(iconWithTooltip, {
			triggerPointName = "IconWithTooltip",
			tooltipOrientation = tooltipOrientation.Bottom,
			hoverText = var12.tooltipInfoText,
			onActivateTooltip = var12.onActivateInfoIcon,
			supportVR = var12.tooltipSupportsVR,
			supportTenFootUi = var12.tooltipSupportsTenFootUi,
			size = UDim2.new(0, var26, 0, var26),
			position = if var33 then UDim2.new(1, 0, 0, 0) else UDim2.new(1, 0, 0.5, 0),
			anchorPoint = if var33 then Vector2.new(1, 0) else Vector2.new(1, 0.5)
		}) or nil)
	})
end)