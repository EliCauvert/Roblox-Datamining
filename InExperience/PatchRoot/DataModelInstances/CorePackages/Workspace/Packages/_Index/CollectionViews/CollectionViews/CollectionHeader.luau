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

local function HeaderButton(p0) --[[ line: 88 ]]
	-- upvalues: useDesignTokens (ref), reactModule (ref), imageSetLabel (ref)
	local var9 = useDesignTokens()
	local size400 = var9.Size.Size_400
	local emphasis = var9.Color.Content.Emphasis
	
	return reactModule.createElement(imageSetLabel, {
		BackgroundTransparency = 1,
		Size = p0.Size or UDim2.new(0, size400, 0, size400),
		Image = p0.image,
		ImageColor3 = emphasis.Color3,
		ImageTransparency = emphasis.Transparency,
		LayoutOrder = p0.LayoutOrder,
		Rotation = p0.Rotation,
		AnchorPoint = p0.AnchorPoint,
		Position = p0.Position
	})
end

return reactModule.memo(function(p1) --[[ line: 115 | named "CollectionHeader" ]]
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), usePreferredInput (ref), useDesignTokens (ref), responsiveModule (ref), checkAndFormatPossibleLinkModule (ref), fFlagLuaAppHideCarouselSubtitleChevron (ref), fFlagLuaAppSortHeaderAnchorTag (ref), HeaderButton (ref), cycleRight (ref), truncationCollapseSmall (ref), iconWithTooltip (ref), tooltipOrientation (ref)
	local var10 = cryoModule.Dictionary.join(t, p1)
	local var11, var12 = reactModule.useBinding(0)
	local var13 = reactModule.useCallback(function(p2) --[[ line: 119 ]]
		-- upvalues: var12 (ref)
		var12(p2.AbsoluteSize.X)
	end, {})
	local var14 = usePreferredInput()
	local var15 = useDesignTokens()
	local titleTypography = var10.titleTypography or var15.Typography.HeadingSmall
	local titleColor = var10.titleColor or var15.Color.Content.Emphasis
	local subtitleTypography = var10.subtitleTypography or var15.Typography.BodySmall
	local var19 = if var10.subtitleTypography then var10.subtitleTypography.FontSize else 17.64 * var15.Stroke.Standard
	local subtitleColor = var10.subtitleColor or var15.Color.Content.Default
	local size50 = var15.Size.Size_50
	local size300 = var15.Size.Size_300
	local var21 = if not var10.hideButton and var14 ~= responsiveModule.Input.Directional and var10.onActivate then true else false
	local size700 = var15.Size.Size_700
	local size100 = var15.Size.Size_100
	local size500 = var15.Size.Size_500
	local var22 = var10.tooltipInfoText ~= nil
	local var23 = if var21 then size500 else 0
	local var24 = if var22 then size700 + size300 else 0
	local var25 = if var22 then var24 else 0
	local var26 = var10.subtitle ~= nil and var10.subtitle ~= ""
	local var27, var28 = checkAndFormatPossibleLinkModule(var10.subtitle)
	local var29 = if var10.onActivateSubtitle then var10.onActivateSubtitle else var10.onActivate
	
	if var10.onActivateSubtitle then
		var27 = true
	end
	local var30 = if fFlagLuaAppHideCarouselSubtitleChevron then var27 and (not var10.hideSubtitleChevron and not var21) else nil
	local var31 = if if fFlagLuaAppHideCarouselSubtitleChevron then var30 else var27 then var15.Size.Size_250 else 0
	local var32 = var27 and var29 ~= nil
	
	return reactModule.createElement("Frame", {
		Position = var10.Position,
		AutomaticSize = var10.AutomaticSize,
		Size = var10.Size,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = var10.LayoutOrder,
		ZIndex = var10.ZIndex,
		[reactModule.Tag] = if fFlagLuaAppSortHeaderAnchorTag then var10.headerTag else nil,
		[reactModule.Change.AbsoluteSize] = var13
	}, {
		LeftContentFrame = reactModule.createElement(if var21 then "TextButton" else "Frame", {
			Text = if var21 then "" else nil,
			Size = UDim2.new(1, -var25, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			AnchorPoint = var10.AnchorPoint,
			BorderSizePixel = 0,
			AutoButtonColor = if var21 then false else nil,
			[reactModule.Event.Activated] = if var21 then var10.onActivate else nil,
			Active = var21,
			Selectable = var21
		}, {
			UIListLayout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				Padding = UDim.new(0, size50),
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
					Padding = UDim.new(0, size100),
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				Title = if typeof(var10.title) == "string" then reactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextWrapped = false,
					LayoutOrder = 1,
					Text = var10.title,
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
						MaxSize = var11:map(function(p3) --[[ line: 245 ]]
							-- upvalues: var23 (ref), var24 (ref)
							local var33 = p3 - var23 - var24
							
							return if var33 > 0 then Vector2.new(var33, 1e999) else nil
						end)
					})
				}) elseif typeof(var10.title) == "function" then var10.title() else nil,
				SeeAllButton = var21 and reactModule.createElement(HeaderButton, {
					LayoutOrder = 2,
					Size = UDim2.fromOffset(size500, size500),
					image = cycleRight
				}) or nil
			}),
			SubtitleFrame = var26 and (reactModule.createElement(if var32 then "TextButton" else "Frame", {
				LayoutOrder = 2,
				Text = if var32 then "" else nil,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				AutoButtonColor = if var32 then false else nil,
				[reactModule.Event.Activated] = if var32 then var29 else nil,
				Active = var32,
				Selectable = var32
			}, {
				UIListLayout = reactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					Padding = UDim.new(0, var15.Size.Size_50),
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				Subtitle = reactModule.createElement("TextLabel", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					TextWrapped = false,
					Text = var28,
					AutomaticSize = Enum.AutomaticSize.XY,
					Size = UDim2.new(0, 0, 0, 0),
					Font = subtitleTypography.Font,
					TextSize = var19,
					TextTransparency = titleColor.Transparency,
					TextColor3 = subtitleColor.Color3,
					TextTruncate = Enum.TextTruncate.SplitWord,
					TextXAlignment = Enum.TextXAlignment.Left,
					RichText = var27
				}, {
					UISizeConstraint = reactModule.createElement("UISizeConstraint", {
						MaxSize = var11:map(function(p4) --[[ line: 299 ]]
							-- upvalues: var31 (ref)
							local var34 = p4 - var31
							
							return if var34 > 0 then Vector2.new(var34, 1e999) else nil
						end)
					})
				}),
				SubtitleLinkArrow = (if fFlagLuaAppHideCarouselSubtitleChevron then var30 else var27 and not var21) and reactModule.createElement("Frame", {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					ClipsDescendants = true,
					Size = UDim2.fromOffset(var31, var31)
				}, {
					Icon = reactModule.createElement(HeaderButton, {
						Rotation = 90,
						image = truncationCollapseSmall,
						Size = UDim2.new(1, var15.Size.Size_50, 1, var15.Size.Size_50),
						Position = UDim2.fromScale(0.5, 0.5),
						AnchorPoint = Vector2.new(0.5, 0.5)
					})
				}) or nil
			}) or nil)
		}),
		IconWithTooltip = var22 and (reactModule.createElement(iconWithTooltip, {
			triggerPointName = "IconWithTooltip",
			tooltipOrientation = tooltipOrientation.Bottom,
			hoverText = var10.tooltipInfoText,
			onActivateTooltip = var10.onActivateInfoIcon,
			supportVR = var10.tooltipSupportsVR,
			supportTenFootUi = var10.tooltipSupportsTenFootUi,
			size = UDim2.new(0, size700, 0, size700),
			position = if var26 then UDim2.new(1, 0, 0, 0) else UDim2.new(1, 0, 0.5, 0),
			anchorPoint = if var26 then Vector2.new(1, 0) else Vector2.new(1, 0.5)
		}) or nil)
	})
end)