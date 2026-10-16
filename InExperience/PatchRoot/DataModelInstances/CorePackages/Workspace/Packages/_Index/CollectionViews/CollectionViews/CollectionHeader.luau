local CollectionViews = script:FindFirstAncestor("CollectionViews")
local Parent = CollectionViews.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local UIBloxModule = require(Parent.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local TooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local NormalizeFontFaceFunction = require(Parent.Foundation).Utility.normalizeFontFace
local IconWithTooltip = require(Parent.AppBlox).IconWithTooltip
local ResponsiveModule = require(Parent.Responsive)
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local CheckAndFormatPossibleLinkModule = require(CollectionViews.checkAndFormatPossibleLink)
local _ = require(CollectionViews.SeeAllButtonType_Legacy)
local FFlagLuaAppSortHeaderAnchorTag = require(Parent.SharedFlags).FFlagLuaAppSortHeaderAnchorTag
local FoundationFontFaceMigration = require(Parent.Foundation).Utility.Flags.FoundationFontFaceMigration
local IconsActionsTruncationCollapseSmall = Images["icons/actions/truncationCollapse_small"]
local IconsActionsCycleRight = Images["icons/actions/cycleRight"]
local config = {
	tooltipSupportsVR = true,
	tooltipSupportsTenFootUi = true,
	AutomaticSize = Enum.AutomaticSize.Y,
	Size = UDim2.new(1, 0, 0, 0)
}

local function HeaderButton(Frame: Frame) --[[ Line: 88 ]]
	-- upvalues: UseDesignTokensFunction (copy), ReactModule (copy), ImageSetLabel (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local Size400 = UseDesignTokensResult.Size.Size_400
	local Emphasis = UseDesignTokensResult.Color.Content.Emphasis
	
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

return ReactModule.memo(function(p1) --[[ Line: 115 | Named "CollectionHeader" ]]
	-- upvalues: CryoModule (copy), config (copy), ReactModule (copy), UsePreferredInputFunction (copy), UseDesignTokensFunction (copy), ResponsiveModule (copy), CheckAndFormatPossibleLinkModule (copy), FFlagLuaAppSortHeaderAnchorTag (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), HeaderButton (copy), IconsActionsCycleRight (copy), IconsActionsTruncationCollapseSmall (copy), IconWithTooltip (copy), TooltipOrientation (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseResult = ReactModule.useCallback(function(Frame) --[[ Line: 119 ]]
		-- upvalues: UseBindingResult2 (copy)
		UseBindingResult2(Frame.AbsoluteSize.X)
	end, {})
	local UsePreferredInputResult = UsePreferredInputFunction()
	local UseDesignTokensResult = UseDesignTokensFunction()
	local TitleTypography = JoinResult.titleTypography or UseDesignTokensResult.Typography.HeadingSmall
	local TitleColor = JoinResult.titleColor or UseDesignTokensResult.Color.Content.Emphasis
	local SubtitleTypography = JoinResult.subtitleTypography or UseDesignTokensResult.Typography.BodySmall
	local FontSize = JoinResult.subtitleTypography and JoinResult.subtitleTypography.FontSize or 17.64 * UseDesignTokensResult.Stroke.Standard
	local SubtitleColor = JoinResult.subtitleColor or UseDesignTokensResult.Color.Content.Default
	local Size50 = UseDesignTokensResult.Size.Size_50
	local Size300 = UseDesignTokensResult.Size.Size_300
	local IsNotUsePreferredInputResultMatch: boolean = not JoinResult.hideButton and UsePreferredInputResult ~= ResponsiveModule.Input.Directional
	local Active: boolean = if IsNotUsePreferredInputResultMatch and JoinResult.onActivate then true else false
	local Size700 = UseDesignTokensResult.Size.Size_700
	local Size100 = UseDesignTokensResult.Size.Size_100
	local Size500 = UseDesignTokensResult.Size.Size_500
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
	local NoActive: boolean = CheckAndFormatPossibleLinkModuleResult and (not JoinResult.hideSubtitleChevron and not Active)
	local Size250 = UseDesignTokensResult.Size.Size_250
	local XOffset = if NoActive then Size250 else 0
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
					Font = if FoundationFontFaceMigration then nil else TitleTypography.Font,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(TitleTypography.Font) else nil,
					TextSize = TitleTypography.FontSize,
					TextTransparency = TitleColor.Transparency,
					TextColor3 = TitleColor.Color3,
					TextTruncate = Enum.TextTruncate.SplitWord,
					TextXAlignment = Enum.TextXAlignment.Left
				}, {
					UISizeConstraint = ReactModule.createElement("UISizeConstraint", {
						MaxSize = UseBindingResult:map(function(p2) --[[ Line: 240 ]]
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
					Padding = UDim.new(0, UseDesignTokensResult.Size.Size_50),
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
					Font = if FoundationFontFaceMigration then nil else SubtitleTypography.Font,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(SubtitleTypography.Font) else nil,
					TextSize = FontSize,
					TextTransparency = TitleColor.Transparency,
					TextColor3 = SubtitleColor.Color3,
					TextTruncate = Enum.TextTruncate.SplitWord,
					TextXAlignment = Enum.TextXAlignment.Left,
					RichText = CheckAndFormatPossibleLinkModuleResult
				}, {
					UISizeConstraint = ReactModule.createElement("UISizeConstraint", {
						MaxSize = UseBindingResult:map(function(p2) --[[ Line: 297 ]]
							-- upvalues: XOffset (copy)
							local X = p2 - XOffset
							
							return if X > 0 then Vector2.new(X, 1e999) else nil
						end)
					})
				}),
				SubtitleLinkArrow = NoActive and ReactModule.createElement("Frame", {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					ClipsDescendants = true,
					Size = UDim2.fromOffset(XOffset, XOffset)
				}, {
					Icon = ReactModule.createElement(HeaderButton, {
						Rotation = 90,
						image = IconsActionsTruncationCollapseSmall,
						Size = UDim2.new(1, UseDesignTokensResult.Size.Size_50, 1, UseDesignTokensResult.Size.Size_50),
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