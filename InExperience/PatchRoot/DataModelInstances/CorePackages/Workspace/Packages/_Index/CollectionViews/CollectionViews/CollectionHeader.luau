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

local function HeaderButton(p1)
	-- upvalues: useDesignTokens (ref), reactModule (ref), imageSetLabel (ref)
	local var1 = useDesignTokens()
	local size400 = var1.Size.Size_400
	local emphasis = var1.Color.Content.Emphasis
	
	return reactModule.createElement(imageSetLabel, {
		BackgroundTransparency = 1,
		Size = p1.Size or UDim2.new(0, size400, 0, size400),
		Image = p1.image,
		ImageColor3 = emphasis.Color3,
		ImageTransparency = emphasis.Transparency,
		LayoutOrder = p1.LayoutOrder,
		Rotation = p1.Rotation,
		AnchorPoint = p1.AnchorPoint,
		Position = p1.Position
	})
end

return reactModule.memo(function(p1)
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), usePreferredInput (ref), useDesignTokens (ref), responsiveModule (ref), checkAndFormatPossibleLinkModule (ref), fFlagLuaAppSortHeaderAnchorTag (ref), HeaderButton (ref), cycleRight (ref), truncationCollapseSmall (ref), iconWithTooltip (ref), tooltipOrientation (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local var2, var3 = reactModule.useBinding(0)
	local var4 = reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref)
		var3(p2.AbsoluteSize.X)
	end, {})
	local var5 = usePreferredInput()
	local var6 = useDesignTokens()
	local titleTypography = var1.titleTypography or var6.Typography.HeadingSmall
	local titleColor = var1.titleColor or var6.Color.Content.Emphasis
	local subtitleTypography = var1.subtitleTypography or var6.Typography.BodySmall
	local var7 = if var1.subtitleTypography then var1.subtitleTypography.FontSize else 17.64 * var6.Stroke.Standard
	local subtitleColor = var1.subtitleColor or var6.Color.Content.Default
	local size50 = var6.Size.Size_50
	local size300 = var6.Size.Size_300
	local var8 = if not var1.hideButton and var5 ~= responsiveModule.Input.Directional and var1.onActivate then true else false
	local size700 = var6.Size.Size_700
	local size100 = var6.Size.Size_100
	local size500 = var6.Size.Size_500
	local var9 = var1.tooltipInfoText ~= nil
	local var10 = if var8 then size500 else 0
	local var11 = if var9 then size700 + size300 else 0
	local var12 = if var9 then var11 else 0
	local var13 = var1.subtitle ~= nil and var1.subtitle ~= ""
	local var14, var15 = checkAndFormatPossibleLinkModule(var1.subtitle)
	local var16 = if var1.onActivateSubtitle then var1.onActivateSubtitle else var1.onActivate
	
	if var1.onActivateSubtitle then
		var14 = true
	end
	local var17 = var14 and (not var1.hideSubtitleChevron and not var8)
	local var18 = if var17 then var6.Size.Size_250 else 0
	local var19 = var14 and var16 ~= nil
	
	return reactModule.createElement("Frame", {
		Position = var1.Position,
		AutomaticSize = var1.AutomaticSize,
		Size = var1.Size,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = var1.LayoutOrder,
		ZIndex = var1.ZIndex,
		[reactModule.Tag] = if fFlagLuaAppSortHeaderAnchorTag then var1.headerTag else nil,
		[reactModule.Change.AbsoluteSize] = var4
	}, {
		LeftContentFrame = reactModule.createElement(if var8 then "TextButton" else "Frame", {
			Text = if var8 then "" else nil,
			Size = UDim2.new(1, -var12, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			AnchorPoint = var1.AnchorPoint,
			BorderSizePixel = 0,
			AutoButtonColor = if var8 then false else nil,
			[reactModule.Event.Activated] = if var8 then var1.onActivate else nil,
			Active = var8,
			Selectable = var8
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
				Title = if typeof(var1.title) == "string" then reactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextWrapped = false,
					LayoutOrder = 1,
					Text = var1.title,
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
						MaxSize = var2:map(function(p2)
							-- upvalues: var10 (ref), var11 (ref)
							local var20 = p2 - var10 - var11
							
							return if var20 > 0 then Vector2.new(var20, 1e999) else nil
						end)
					})
				}) elseif typeof(var1.title) == "function" then var1.title() else nil,
				SeeAllButton = var8 and reactModule.createElement(HeaderButton, {
					LayoutOrder = 2,
					Size = UDim2.fromOffset(size500, size500),
					image = cycleRight
				}) or nil
			}),
			SubtitleFrame = var13 and reactModule.createElement(if var19 then "TextButton" else "Frame", {
				LayoutOrder = 2,
				Text = if var19 then "" else nil,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				AutoButtonColor = if var19 then false else nil,
				[reactModule.Event.Activated] = if var19 then var16 else nil,
				Active = var19,
				Selectable = var19
			}, {
				UIListLayout = reactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					Padding = UDim.new(0, var6.Size.Size_50),
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				Subtitle = reactModule.createElement("TextLabel", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					TextWrapped = false,
					Text = var15,
					AutomaticSize = Enum.AutomaticSize.XY,
					Size = UDim2.new(0, 0, 0, 0),
					Font = subtitleTypography.Font,
					TextSize = var7,
					TextTransparency = titleColor.Transparency,
					TextColor3 = subtitleColor.Color3,
					TextTruncate = Enum.TextTruncate.SplitWord,
					TextXAlignment = Enum.TextXAlignment.Left,
					RichText = var14
				}, {
					UISizeConstraint = reactModule.createElement("UISizeConstraint", {
						MaxSize = var2:map(function(p2)
							-- upvalues: var18 (ref)
							local var20 = p2 - var18
							
							return if var20 > 0 then Vector2.new(var20, 1e999) else nil
						end)
					})
				}),
				SubtitleLinkArrow = var17 and reactModule.createElement("Frame", {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					ClipsDescendants = true,
					Size = UDim2.fromOffset(var18, var18)
				}, {
					Icon = reactModule.createElement(HeaderButton, {
						Rotation = 90,
						image = truncationCollapseSmall,
						Size = UDim2.new(1, var6.Size.Size_50, 1, var6.Size.Size_50),
						Position = UDim2.fromScale(0.5, 0.5),
						AnchorPoint = Vector2.new(0.5, 0.5)
					})
				}) or nil
			}) or nil
		}),
		IconWithTooltip = var9 and (reactModule.createElement(iconWithTooltip, {
			triggerPointName = "IconWithTooltip",
			tooltipOrientation = tooltipOrientation.Bottom,
			hoverText = var1.tooltipInfoText,
			onActivateTooltip = var1.onActivateInfoIcon,
			supportVR = var1.tooltipSupportsVR,
			supportTenFootUi = var1.tooltipSupportsTenFootUi,
			size = UDim2.new(0, size700, 0, size700),
			position = if var13 then UDim2.new(1, 0, 0, 0) else UDim2.new(1, 0, 0.5, 0),
			anchorPoint = if var13 then Vector2.new(1, 0) else Vector2.new(1, 0.5)
		}) or nil)
	})
end)