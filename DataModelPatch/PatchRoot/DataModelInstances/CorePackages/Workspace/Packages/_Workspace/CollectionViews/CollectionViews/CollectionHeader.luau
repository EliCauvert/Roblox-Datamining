local CollectionViews = script:FindFirstAncestor("CollectionViews")
local Parent = CollectionViews.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local UIBloxModule = require(Parent.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local TooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local IconWithTooltip = require(Parent.AppBlox).IconWithTooltip
local ResponsiveModule = require(Parent.Responsive)
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local CheckAndFormatPossibleLinkModule = require(CollectionViews.checkAndFormatPossibleLink)
local _ = require(CollectionViews.SeeAllButtonType_Legacy)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagRenameDeprecatedUIBloxTokens = SharedFlagsModule.FFlagRenameDeprecatedUIBloxTokens
local FFlagLuaAppHideCarouselSubtitleChevron = SharedFlagsModule.FFlagLuaAppHideCarouselSubtitleChevron
local FFlagLuaAppSortHeaderAnchorTag = SharedFlagsModule.FFlagLuaAppSortHeaderAnchorTag
local IconsActionsTruncationCollapseSmall = Images["icons/actions/truncationCollapse_small"]
local IconsActionsCycleRight = Images["icons/actions/cycleRight"]
local config = {
	tooltipSupportsVR = true,
	tooltipSupportsTenFootUi = true,
	AutomaticSize = Enum.AutomaticSize.Y,
	Size = UDim2.new(1, 0, 0, 0)
}

local function HeaderButton(Frame: Frame)
	-- upvalues: UseDesignTokensFunction (copy), FFlagRenameDeprecatedUIBloxTokens (copy), ReactModule (copy), ImageSetLabel (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local Size400 = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_400 else UseDesignTokensResult.Global.Size_200
	local Emphasis = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Content.Emphasis else UseDesignTokensResult.Semantic.Color.Text.Emphasis
	
	return ReactModule.createElement(ImageSetLabel, {
		BackgroundTransparency = 1,
		Size = Frame.Size or UDim2.new(0, Size400, 0, Size400),
		Image = Frame.image,
		ImageColor3 = Emphasis.Color3,
		ImageTransparency = Emphasis.Transparency,
		LayoutOrder = Frame.LayoutOrder,
		Rotation = Frame.Rotation,
		AnchorPoint = Frame.AnchorPoint,
		Position = Frame.Position
	})
end

return ReactModule.memo(function(p1)
	-- upvalues: CryoModule (copy), config (copy), ReactModule (copy), UsePreferredInputFunction (copy), UseDesignTokensFunction (copy), FFlagRenameDeprecatedUIBloxTokens (copy), ResponsiveModule (copy), CheckAndFormatPossibleLinkModule (copy), FFlagLuaAppHideCarouselSubtitleChevron (copy), FFlagLuaAppSortHeaderAnchorTag (copy), HeaderButton (copy), IconsActionsCycleRight (copy), IconsActionsTruncationCollapseSmall (copy), IconWithTooltip (copy), TooltipOrientation (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: UseBindingResult2 (copy)
		UseBindingResult2(Frame.AbsoluteSize.X)
	end, {})
	local UsePreferredInputResult = UsePreferredInputFunction()
	local UseDesignTokensResult = UseDesignTokensFunction()
	local TitleTypography = JoinResult.titleTypography or (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Typography.HeadingSmall else UseDesignTokensResult.Semantic.Typography.Header)
	local TitleColor = JoinResult.titleColor or (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Content.Emphasis else UseDesignTokensResult.Semantic.Color.Text.Emphasis)
	local SubtitleTypography = JoinResult.subtitleTypography or (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Typography.BodySmall else UseDesignTokensResult.Semantic.Typography.CaptionBody)
	local FontSize = JoinResult.subtitleTypography and JoinResult.subtitleTypography.FontSize or 17.64 * (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Stroke.Standard else UseDesignTokensResult.Global.Stroke_100)
	local SubtitleColor = JoinResult.subtitleColor or (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Content.Default else UseDesignTokensResult.Semantic.Color.Text.Default)
	local Size50 = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_50 else UseDesignTokensResult.Global.Space_25
	local Size300 = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_300 else UseDesignTokensResult.Global.Space_150
	local IsNotUsePreferredInputResultMatch: boolean = not JoinResult.hideButton and UsePreferredInputResult ~= ResponsiveModule.Input.Directional
	local Active: boolean = if IsNotUsePreferredInputResultMatch and JoinResult.onActivate then true else false
	local Size700 = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_700 else UseDesignTokensResult.Global.Size_350
	local Size100 = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_100 else UseDesignTokensResult.Global.Space_50
	local Size500 = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_500 else UseDesignTokensResult.Global.Size_250
	local HasTooltipInfoText = JoinResult.tooltipInfoText ~= nil
	local Size = if Active then Size500 else 0
	local NewSize = if HasTooltipInfoText then Size700 + Size300 else 0
	local NewSize1 = if HasTooltipInfoText then NewSize else 0
	local IsNotSubtitleMatch: boolean = JoinResult.subtitle ~= nil and JoinResult.subtitle ~= ""
	local CheckAndFormatPossibleLinkModuleResult, CheckAndFormatPossibleLinkModuleResult2 = CheckAndFormatPossibleLinkModule(JoinResult.subtitle)
	local OnActivateSubtitle = if JoinResult.onActivateSubtitle then JoinResult.onActivateSubtitle else JoinResult.onActivate
	
	if JoinResult.onActivateSubtitle then
		CheckAndFormatPossibleLinkModuleResult = true
	end
	local NoActive = if FFlagLuaAppHideCarouselSubtitleChevron then CheckAndFormatPossibleLinkModuleResult and (not JoinResult.hideSubtitleChevron and not Active) else nil
	local Size250 = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_250 else UseDesignTokensResult.Global.Size_125
	local NoActive1 = if FFlagLuaAppHideCarouselSubtitleChevron then NoActive else CheckAndFormatPossibleLinkModuleResult
	local XOffset = if NoActive1 then Size250 else 0
	local HasOnActivateSubtitle: boolean = CheckAndFormatPossibleLinkModuleResult and OnActivateSubtitle ~= nil
	
	return ReactModule.createElement("Frame", {
		Position = JoinResult.Position,
		AutomaticSize = JoinResult.AutomaticSize,
		Size = JoinResult.Size,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = JoinResult.LayoutOrder,
		ZIndex = JoinResult.ZIndex,
		[ReactModule.Tag] = if FFlagLuaAppSortHeaderAnchorTag then JoinResult.headerTag else nil,
		[ReactModule.Change.AbsoluteSize] = UseResult
	}, {
		LeftContentFrame = ReactModule.createElement(if Active then "TextButton" else "Frame", {
			Text = if Active then "" else nil,
			Size = UDim2.new(1, -NewSize1, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			AnchorPoint = JoinResult.AnchorPoint,
			BorderSizePixel = 0,
			AutoButtonColor = not Active and nil,
			[ReactModule.Event.Activated] = if Active then JoinResult.onActivate else nil,
			Active = Active,
			Selectable = Active
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				Padding = UDim.new(0, Size50),
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			TitleContainer = ReactModule.createElement("Frame", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0)
			}, {
				UIListLayout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					Padding = UDim.new(0, Size100),
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				Title = if typeof(JoinResult.title) == "string" then ReactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextWrapped = false,
					LayoutOrder = 1,
					Text = JoinResult.title,
					AutomaticSize = Enum.AutomaticSize.XY,
					Size = UDim2.new(0, 0, 0, 0),
					Font = TitleTypography.Font,
					TextSize = TitleTypography.FontSize,
					TextTransparency = TitleColor.Transparency,
					TextColor3 = TitleColor.Color3,
					TextTruncate = Enum.TextTruncate.SplitWord,
					TextXAlignment = Enum.TextXAlignment.Left
				}, {
					UISizeConstraint = ReactModule.createElement("UISizeConstraint", {
						MaxSize = UseBindingResult:map(function(p2)
							-- upvalues: Size (copy), NewSize (copy)
							local SizeDelta = p2 - Size - NewSize
							
							return if SizeDelta > 0 then Vector2.new(SizeDelta, 1e999) else nil
						end)
					})
				}) elseif typeof(JoinResult.title) == "function" then JoinResult.title() else nil,
				SeeAllButton = Active and ReactModule.createElement(HeaderButton, {
					LayoutOrder = 2,
					Size = UDim2.fromOffset(Size500, Size500),
					image = IconsActionsCycleRight
				}) or nil
			}),
			SubtitleFrame = IsNotSubtitleMatch and ReactModule.createElement(if HasOnActivateSubtitle then "TextButton" else "Frame", {
				LayoutOrder = 2,
				Text = if HasOnActivateSubtitle then "" else nil,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				AutoButtonColor = not HasOnActivateSubtitle and nil,
				[ReactModule.Event.Activated] = if HasOnActivateSubtitle then OnActivateSubtitle else nil,
				Active = HasOnActivateSubtitle,
				Selectable = HasOnActivateSubtitle
			}, {
				UIListLayout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					Padding = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_50 else UseDesignTokensResult.Global.Size_25),
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				Subtitle = ReactModule.createElement("TextLabel", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					TextWrapped = false,
					Text = CheckAndFormatPossibleLinkModuleResult2,
					AutomaticSize = Enum.AutomaticSize.XY,
					Size = UDim2.new(0, 0, 0, 0),
					Font = SubtitleTypography.Font,
					TextSize = FontSize,
					TextTransparency = TitleColor.Transparency,
					TextColor3 = SubtitleColor.Color3,
					TextTruncate = Enum.TextTruncate.SplitWord,
					TextXAlignment = Enum.TextXAlignment.Left,
					RichText = CheckAndFormatPossibleLinkModuleResult
				}, {
					UISizeConstraint = ReactModule.createElement("UISizeConstraint", {
						MaxSize = UseBindingResult:map(function(p2)
							-- upvalues: XOffset (copy)
							local X = p2 - XOffset
							
							return if X > 0 then Vector2.new(X, 1e999) else nil
						end)
					})
				}),
				SubtitleLinkArrow = (if FFlagLuaAppHideCarouselSubtitleChevron then NoActive else CheckAndFormatPossibleLinkModuleResult and not Active) and ReactModule.createElement("Frame", {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					ClipsDescendants = true,
					Size = UDim2.fromOffset(XOffset, XOffset)
				}, {
					Icon = ReactModule.createElement(HeaderButton, {
						Rotation = 90,
						image = IconsActionsTruncationCollapseSmall,
						Size = UDim2.new(1, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_50 else UseDesignTokensResult.Global.Size_25, 1, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_50 else UseDesignTokensResult.Global.Size_25),
						Position = UDim2.fromScale(0.5, 0.5),
						AnchorPoint = Vector2.new(0.5, 0.5)
					})
				}) or nil
			}) or nil
		}),
		IconWithTooltip = HasTooltipInfoText and ReactModule.createElement(IconWithTooltip, {
			triggerPointName = "IconWithTooltip",
			tooltipOrientation = TooltipOrientation.Bottom,
			hoverText = JoinResult.tooltipInfoText,
			onActivateTooltip = JoinResult.onActivateInfoIcon,
			supportVR = JoinResult.tooltipSupportsVR,
			supportTenFootUi = JoinResult.tooltipSupportsTenFootUi,
			size = UDim2.new(0, Size700, 0, Size700),
			position = if IsNotSubtitleMatch then UDim2.new(1, 0, 0, 0) else UDim2.new(1, 0, 0.5, 0),
			anchorPoint = if IsNotSubtitleMatch then Vector2.new(1, 0) else Vector2.new(1, 0.5)
		}) or nil
	})
end)