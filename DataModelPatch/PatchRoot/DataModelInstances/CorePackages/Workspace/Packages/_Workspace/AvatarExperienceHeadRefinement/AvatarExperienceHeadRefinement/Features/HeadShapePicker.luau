local AvatarExperienceHeadRefinement = script:FindFirstAncestor("AvatarExperienceHeadRefinement")
local Parent = AvatarExperienceHeadRefinement.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.RobloxAppEnums)
local FoundationModule = require(Parent.Foundation)
local FFlagRenameDeprecatedUIBloxTokens = require(Parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagDHMHideHeadRefinementSubheading = AvatarExperienceFlagsModule.FFlagDHMHideHeadRefinementSubheading
local FFlagHeadRefinementFacialAnimationToggle = AvatarExperienceFlagsModule.FFlagHeadRefinementFacialAnimationToggle
local FFlagAXEnableResponsiveHeadRefinementMenu = AvatarExperienceFlagsModule.FFlagAXEnableResponsiveHeadRefinementMenu
local StyledTextLabel = require(Parent.UIBlox).App.Text.StyledTextLabel
local HeadShapeListModule = require(AvatarExperienceHeadRefinement.Components.HeadShapeList)
local Toggle = FoundationModule.Toggle
local Divider = FoundationModule.Divider
local View = FoundationModule.View
local InputSize = FoundationModule.Enums.InputSize
local Loading = FoundationModule.Loading
local IconSize = FoundationModule.Enums.IconSize
local _ = require(AvatarExperienceHeadRefinement.Enums.HeadShapeTileSize)
local SortHeadShapesModule = require(AvatarExperienceHeadRefinement.Utils.sortHeadShapes)
local UseDesignTokensFunction = require(Parent.AppCommonStyle).useDesignTokens
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization

return function(p1)
	-- upvalues: UseDesignTokensFunction (copy), UseLocalizationFunction (copy), FFlagDHMHideHeadRefinementSubheading (copy), FFlagHeadRefinementFacialAnimationToggle (copy), ReactModule (copy), SortHeadShapesModule (copy), FFlagRenameDeprecatedUIBloxTokens (copy), StyledTextLabel (copy), Loading (copy), IconSize (copy), HeadShapeListModule (copy), FFlagAXEnableResponsiveHeadRefinementMenu (copy), View (copy), Divider (copy), Toggle (copy), InputSize (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		headingText = "Feature.Avatar.Label.HeadRefinement.Title",
		unsupportedText = "Feature.Avatar.Label.HeadRefinement.Description.Unsupported",
		subheadingText = if FFlagDHMHideHeadRefinementSubheading then nil else "Feature.Avatar.Label.HeadRefinement.Description",
		facialAnimationLabel = if FFlagHeadRefinementFacialAnimationToggle then "Feature.Avatar.Label.HeadRefinement.FacialAnimation" else nil
	})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: SortHeadShapesModule (upval), p1 (copy)
		return SortHeadShapesModule(p1.items or {}, function(p2)
			return p2.headShapeName
		end)
	end, { p1.items })
	
	return ReactModule.createElement("Frame", {
		Size = p1.size or UDim2.new(1, 0, 0, 0),
		BackgroundColor3 = (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Surface.Surface_0 else UseDesignTokensResult.Semantic.Color.Background.Default).Color3,
		BackgroundTransparency = (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Surface.Surface_0 else UseDesignTokensResult.Semantic.Color.Background.Default).Transparency,
		AutomaticSize = Enum.AutomaticSize.XY,
		[ReactModule.Tag] = "data-testid=AvatarExperienceHeadRefinement_HeadShapePickerContainer",
		ref = p1.containerRef,
		NextSelectionUp = p1.NextSelectionUp
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical
		}),
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_400 else UseDesignTokensResult.Global.Size_200),
			PaddingBottom = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_500 else UseDesignTokensResult.Global.Size_250)
		}),
		UICorner = ReactModule.createElement("UICorner", {
			CornerRadius = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Radius.Medium else UseDesignTokensResult.Semantic.Radius.Medium)
		}),
		Heading = ReactModule.createElement("Frame", {
			AutomaticSize = Enum.AutomaticSize.XY,
			LayoutOrder = 1,
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			[ReactModule.Tag] = "data-testid=AvatarExperienceHeadRefinement_HeadShapePickerHeadingText"
		}, {
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_500 else UseDesignTokensResult.Global.Size_250),
				PaddingRight = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_500 else UseDesignTokensResult.Global.Size_250),
				PaddingBottom = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_300 else UseDesignTokensResult.Global.Size_150)
			}),
			StyledTextLabel = ReactModule.createElement(StyledTextLabel, {
				automaticSize = Enum.AutomaticSize.XY,
				size = UDim2.new(0, 0, 0, 0),
				text = UseLocalizationResult.headingText,
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Center,
				fontStyle = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Typography.HeadingSmall else UseDesignTokensResult.Semantic.Typography.Header,
				colorStyle = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Content.Emphasis else UseDesignTokensResult.Semantic.Color.Text.Emphasis
			})
		}),
		HeadShapePickerLoading = if p1.isLoading then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 2,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0)
		}, {
			Padding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_300 else UseDesignTokensResult.Global.Size_150),
				PaddingBottom = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_300 else UseDesignTokensResult.Global.Size_150)
			}),
			Spinner = if FFlagHeadRefinementFacialAnimationToggle then ReactModule.createElement(Loading, {
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_500 else UseDesignTokensResult.Global.Size_250, 0.5, 0),
				size = IconSize.Medium
			}) else ReactModule.createElement(Loading, {
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_500 else UseDesignTokensResult.Global.Size_250, 0.5, 0),
				size = IconSize.Medium
			})
		}) else nil,
		Subheading = if p1.isLoading or FFlagDHMHideHeadRefinementSubheading and not p1.isUnsupported then nil else ReactModule.createElement("Frame", {
			AutomaticSize = Enum.AutomaticSize.XY,
			LayoutOrder = 2,
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			[ReactModule.Tag] = "data-testid=AvatarExperienceHeadRefinement_HeadShapePickerSubheadingText"
		}, {
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_500 else UseDesignTokensResult.Global.Size_250),
				PaddingRight = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_500 else UseDesignTokensResult.Global.Size_250),
				PaddingBottom = if p1.isUnsupported then nil else UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_300 else UseDesignTokensResult.Global.Size_150)
			}),
			StyledTextLabel = ReactModule.createElement(StyledTextLabel, {
				textWrapped = true,
				automaticSize = Enum.AutomaticSize.XY,
				size = UDim2.new(0, 0, 0, 0),
				text = if p1.isUnsupported then UseLocalizationResult.unsupportedText else UseLocalizationResult.subheadingText,
				textXAlignment = Enum.TextXAlignment.Left,
				fontStyle = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Typography.BodySmall else UseDesignTokensResult.Semantic.Typography.CaptionBody,
				colorStyle = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Content.Default else UseDesignTokensResult.Semantic.Color.Text.Default
			})
		}),
		HeadShapeList = if p1.isUnsupported or p1.isLoading then nil else ReactModule.createElement(HeadShapeListModule, {
			LayoutOrder = 3,
			orientation = p1.orientation,
			tileSize = p1.tileSize,
			items = UseMemoResult,
			NextSelectionUp = p1.NextSelectionUp,
			maxHeight = if FFlagAXEnableResponsiveHeadRefinementMenu then p1.headShapeListMaxHeight else nil
		}),
		FacialAnimationDivider = if FFlagHeadRefinementFacialAnimationToggle and not p1.isLoading and p1.isFacialAnimationEnabled ~= nil and p1.onFacialAnimationToggle ~= nil then ReactModule.createElement(View, {
			tag = "size-full-0 auto-y",
			LayoutOrder = 4,
			testId = "AvatarExperienceHeadRefinement_FacialAnimationDivider"
		}, {
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_500 else UseDesignTokensResult.Global.Size_250),
				PaddingRight = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_500 else UseDesignTokensResult.Global.Size_250),
				PaddingTop = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_300 else UseDesignTokensResult.Global.Size_150),
				PaddingBottom = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_300 else UseDesignTokensResult.Global.Size_150)
			}),
			Divider = ReactModule.createElement(Divider, {
				Orientation = Enum.FillDirection.Horizontal,
				Size = UDim2.new(1, 0, 0, 1)
			})
		}) else nil,
		FacialAnimationToggle = if FFlagHeadRefinementFacialAnimationToggle and not p1.isLoading and p1.isFacialAnimationEnabled ~= nil and p1.onFacialAnimationToggle ~= nil then ReactModule.createElement(View, {
			tag = "size-full-0 auto-y",
			LayoutOrder = 5,
			testId = "AvatarExperienceHeadRefinement_FacialAnimationToggle"
		}, {
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_500 else UseDesignTokensResult.Global.Size_250),
				PaddingRight = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_500 else UseDesignTokensResult.Global.Size_250),
				PaddingTop = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_300 else UseDesignTokensResult.Global.Size_150),
				PaddingBottom = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_300 else UseDesignTokensResult.Global.Size_150)
			}),
			UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_400 else UseDesignTokensResult.Global.Size_200)
			}),
			ToggleWrapper = ReactModule.createElement(View, { tag = "auto-xy", LayoutOrder = 1 }, {
				Toggle = ReactModule.createElement(Toggle, {
					label = "",
					testId = "AvatarExperienceHeadRefinement_FacialAnimationToggleButton",
					isChecked = p1.isFacialAnimationEnabled,
					onActivated = function(p2)
						-- upvalues: p1 (copy)
						if p1.onFacialAnimationToggle then
							p1.onFacialAnimationToggle(p2)
						end
					end,
					size = InputSize.Medium
				})
			}),
			Label = ReactModule.createElement(View, { tag = "auto-xy", LayoutOrder = 2 }, {
				StyledTextLabel = ReactModule.createElement(StyledTextLabel, {
					automaticSize = Enum.AutomaticSize.XY,
					size = UDim2.new(0, 0, 0, 0),
					text = UseLocalizationResult.facialAnimationLabel,
					textXAlignment = Enum.TextXAlignment.Left,
					textYAlignment = Enum.TextYAlignment.Center,
					fontStyle = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Typography.BodySmall else UseDesignTokensResult.Semantic.Typography.CaptionBody,
					colorStyle = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Content.Default else UseDesignTokensResult.Semantic.Color.Text.Default
				})
			})
		}) else nil
	})
end