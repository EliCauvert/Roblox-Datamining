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
local fFlagLuaAppSortHeaderAnchorTag = require(parent.SharedFlags).FFlagLuaAppSortHeaderAnchorTag
local truncationCollapseSmall = images["icons/actions/truncationCollapse_small"]
local cycleRight = images["icons/actions/cycleRight"]
local t = {
	tooltipSupportsVR = true,
	tooltipSupportsTenFootUi = true,
	AutomaticSize = Enum.AutomaticSize.Y,
	Size = UDim2.new(1, 0, 0, 0)
}

local function HeaderButton(p0)
	-- upvalues: useDesignTokens (ref), reactModule (ref), imageSetLabel (ref)
	local var8 = useDesignTokens()
	local size400 = var8.Size.Size_400
	local emphasis = var8.Color.Content.Emphasis
	
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

return reactModule.memo(function(p1)
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), usePreferredInput (ref), useDesignTokens (ref), responsiveModule (ref), checkAndFormatPossibleLinkModule (ref), fFlagLuaAppSortHeaderAnchorTag (ref), HeaderButton (ref), cycleRight (ref), truncationCollapseSmall (ref), iconWithTooltip (ref), tooltipOrientation (ref)
	local var9 = cryoModule.Dictionary.join(t, p1)
	local var10, var11 = reactModule.useBinding(0)
	local var12 = reactModule.useCallback(function(p2)
		-- upvalues: var11 (ref)
		var11(p2.AbsoluteSize.X)
	end, {})
	local var13 = usePreferredInput()
	local var14 = useDesignTokens()
	local titleTypography = var9.titleTypography or var14.Typography.HeadingSmall
	local titleColor = var9.titleColor or var14.Color.Content.Emphasis
	local subtitleTypography = var9.subtitleTypography or var14.Typography.BodySmall
	local var18 = if var9.subtitleTypography then var9.subtitleTypography.FontSize else 17.64 * var14.Stroke.Standard
	local subtitleColor = var9.subtitleColor or var14.Color.Content.Default
	local size50 = var14.Size.Size_50
	local size300 = var14.Size.Size_300
	local var20 = if not var9.hideButton and var13 ~= responsiveModule.Input.Directional and var9.onActivate then true else false
	local size700 = var14.Size.Size_700
	local size100 = var14.Size.Size_100
	local size500 = var14.Size.Size_500
	local var21 = var9.tooltipInfoText ~= nil
	local var22 = if var20 then size500 else 0
	local var23 = if var21 then size700 + size300 else 0
	local var24 = if var21 then var23 else 0
	local var25 = var9.subtitle ~= nil and var9.subtitle ~= ""
	local var26, var27 = checkAndFormatPossibleLinkModule(var9.subtitle)
	local var28 = if var9.onActivateSubtitle then var9.onActivateSubtitle else var9.onActivate
	
	if var9.onActivateSubtitle then
		var26 = true
	end
	local var29 = var26 and (not var9.hideSubtitleChevron and not var20)
	local var30 = if var29 then var14.Size.Size_250 else 0
	local var31 = var26 and var28 ~= nil
	
	return reactModule.createElement("Frame", {
		Position = var9.Position,
		AutomaticSize = var9.AutomaticSize,
		Size = var9.Size,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = var9.LayoutOrder,
		ZIndex = var9.ZIndex,
		[reactModule.Tag] = if fFlagLuaAppSortHeaderAnchorTag then var9.headerTag else nil,
		[reactModule.Change.AbsoluteSize] = var12
	}, {
		LeftContentFrame = reactModule.createElement(if var20 then "TextButton" else "Frame", {
			Text = if var20 then "" else nil,
			Size = UDim2.new(1, -var24, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			AnchorPoint = var9.AnchorPoint,
			BorderSizePixel = 0,
			AutoButtonColor = if var20 then false else nil,
			[reactModule.Event.Activated] = if var20 then var9.onActivate else nil,
			Active = var20,
			Selectable = var20
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
				Title = if typeof(var9.title) == "string" then reactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextWrapped = false,
					LayoutOrder = 1,
					Text = var9.title,
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
						MaxSize = var10:map(function(p3)
							-- upvalues: var22 (ref), var23 (ref)
							local var32 = p3 - var22 - var23
							
							return if var32 > 0 then Vector2.new(var32, 1e999) else nil
						end)
					})
				}) elseif typeof(var9.title) == "function" then var9.title() else nil,
				SeeAllButton = var20 and reactModule.createElement(HeaderButton, {
					LayoutOrder = 2,
					Size = UDim2.fromOffset(size500, size500),
					image = cycleRight
				}) or nil
			}),
			SubtitleFrame = var25 and reactModule.createElement(if var31 then "TextButton" else "Frame", {
				LayoutOrder = 2,
				Text = if var31 then "" else nil,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				AutoButtonColor = if var31 then false else nil,
				[reactModule.Event.Activated] = if var31 then var28 else nil,
				Active = var31,
				Selectable = var31
			}, {
				UIListLayout = reactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					Padding = UDim.new(0, var14.Size.Size_50),
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				Subtitle = reactModule.createElement("TextLabel", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					TextWrapped = false,
					Text = var27,
					AutomaticSize = Enum.AutomaticSize.XY,
					Size = UDim2.new(0, 0, 0, 0),
					Font = subtitleTypography.Font,
					TextSize = var18,
					TextTransparency = titleColor.Transparency,
					TextColor3 = subtitleColor.Color3,
					TextTruncate = Enum.TextTruncate.SplitWord,
					TextXAlignment = Enum.TextXAlignment.Left,
					RichText = var26
				}, {
					UISizeConstraint = reactModule.createElement("UISizeConstraint", {
						MaxSize = var10:map(function(p4)
							-- upvalues: var30 (ref)
							local var33 = p4 - var30
							
							return if var33 > 0 then Vector2.new(var33, 1e999) else nil
						end)
					})
				}),
				SubtitleLinkArrow = var29 and reactModule.createElement("Frame", {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					ClipsDescendants = true,
					Size = UDim2.fromOffset(var30, var30)
				}, {
					Icon = reactModule.createElement(HeaderButton, {
						Rotation = 90,
						image = truncationCollapseSmall,
						Size = UDim2.new(1, var14.Size.Size_50, 1, var14.Size.Size_50),
						Position = UDim2.fromScale(0.5, 0.5),
						AnchorPoint = Vector2.new(0.5, 0.5)
					})
				}) or nil
			}) or nil
		}),
		IconWithTooltip = var21 and (reactModule.createElement(iconWithTooltip, {
			triggerPointName = "IconWithTooltip",
			tooltipOrientation = tooltipOrientation.Bottom,
			hoverText = var9.tooltipInfoText,
			onActivateTooltip = var9.onActivateInfoIcon,
			supportVR = var9.tooltipSupportsVR,
			supportTenFootUi = var9.tooltipSupportsTenFootUi,
			size = UDim2.new(0, size700, 0, size700),
			position = if var25 then UDim2.new(1, 0, 0, 0) else UDim2.new(1, 0, 0.5, 0),
			anchorPoint = if var25 then Vector2.new(1, 0) else Vector2.new(1, 0.5)
		}) or nil)
	})
end)