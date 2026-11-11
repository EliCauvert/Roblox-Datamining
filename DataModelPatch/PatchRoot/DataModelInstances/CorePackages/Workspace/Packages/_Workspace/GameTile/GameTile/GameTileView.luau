local GameTile = script:FindFirstAncestor("GameTile")
local Parent = GameTile.Parent
local ReactModule = require(Parent.React)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local UIBloxModule = require(Parent.UIBlox)
local FFlagRenameDeprecatedUIBloxTokens = require(Parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local LoadableImage = UIBloxModule.App.Loading.LoadableImage
local UseCursorFunction = UIBloxModule.App.SelectionCursor.useCursor
local RightAlignedButtonWrapperModule = require(GameTile.Footer.RightAlignedButtonWrapper)
local ZoomAnimatedFrameModule = require(GameTile.ZoomAnimatedFrame)
local GameTileViewConfigModule = require(GameTile.GameTileViewConfig)
local FFlagLuaAppGameTileInteractionFeedback = require(Parent.SharedFlags).FFlagLuaAppGameTileInteractionFeedback
local FFlagLuaAppMigrateGameTileHoverFixes = require(Parent.SharedFlags).FFlagLuaAppMigrateGameTileHoverFixes
local FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone = require(Parent.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone
local FFlagLuaAppHomePageFirstImageLoadObserver = require(Parent.SharedFlags).FFlagLuaAppHomePageFirstImageLoadObserver
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens

return function(Gui)
	-- upvalues: UseDesignTokensFunction (copy), UseTokensFunction (copy), GameTileViewConfigModule (copy), FFlagRenameDeprecatedUIBloxTokens (copy), UseCursorFunction (copy), FFlagLuaAppMigrateGameTileHoverFixes (copy), ReactModule (copy), FFlagLuaAppGameTileInteractionFeedback (copy), ZoomAnimatedFrameModule (copy), ImageSetLabel (copy), Images (copy), FFlagLuaAppHomePageFirstImageLoadObserver (copy), LoadableImage (copy), FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (copy), RightAlignedButtonWrapperModule (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local NumLinesForTitle = if Gui.isUnifiedGameTile then Gui.numLinesForTitle or 1 else nil
	local NumLinesForMetadata = Gui.numLinesForMetadata or 1
	local TextSizeOffset = Gui.textSizeOffset
	local UseTokensResult = UseTokensFunction()
	local ElementSizes = GameTileViewConfigModule.getElementSizes(UseDesignTokensResult, TextSizeOffset, if Gui.isUnifiedGameTile then NumLinesForTitle else nil, if Gui.isUnifiedGameTile then UseTokensResult else nil, if Gui.isUnifiedGameTile then true else nil, NumLinesForMetadata)
	local Medium = if UseTokensResult and Gui.isUnifiedGameTile then UseTokensResult.Radius.Medium elseif FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_200 else UseDesignTokensResult.Global.Space_100
	local _UDim = UDim.new(0, Medium)
	local UseCursorResult = UseCursorFunction(_UDim)
	local TitleMedium = if UseTokensResult and Gui.isUnifiedGameTile then UseTokensResult.Typography.TitleMedium elseif FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Typography.TitleLarge else UseDesignTokensResult.Semantic.Typography.Subheader
	local FontSize = TitleMedium.FontSize
	local Emphasis = if UseTokensResult and Gui.isUnifiedGameTile then UseTokensResult.Color.Content.Emphasis elseif FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Content.Emphasis else UseDesignTokensResult.Semantic.Color.Text.Emphasis
	local Size100 = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_100 else UseDesignTokensResult.Global.Space_50
	local HoverPadding = Gui.isUnifiedGameTile and Gui.hoverPadding or (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_300 else UseDesignTokensResult.Global.Space_150)
	local PlayButtonHeight = if Gui.hidePlayButton then 0 else ElementSizes.playButtonHeight
	local ContainmentSidePadding = if Gui.isUnifiedGameTile then if Gui.isContained then Gui.containmentSidePadding or UseTokensResult.Padding.Medium else 0 elseif Gui.isContained then if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_300 else UseDesignTokensResult.Global.Space_150 else 0
	local Size300 = if Gui.hidePlayButton or Gui.isContained and Gui.isUnifiedGameTile then 0 elseif FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_300 else UseDesignTokensResult.Global.Space_150
	local IsHovered = Gui.isHovered
	local IsUnifiedGameTile = FFlagLuaAppMigrateGameTileHoverFixes and (IsHovered and Gui.isUnifiedGameTile)
	local _UDim1 = UDim.new(1, -(if Gui.isUnifiedGameTile then ContainmentSidePadding else (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_300 else UseDesignTokensResult.Global.Space_150) + ContainmentSidePadding))
	local Size = Gui.Size or UDim2.fromScale(1, 1)
	
	if IsHovered then
		Size += UDim2.fromOffset(HoverPadding * 2, HoverPadding * 2)
	end
	local FooterHeight = GameTileViewConfigModule.getFooterHeight(UseDesignTokensResult, Gui.isContained, Gui.footerMetadata == nil, Gui.title == nil, TextSizeOffset, Gui.extraFooterSpace, NumLinesForTitle, UseTokensResult, Gui.isUnifiedGameTile, Gui.numLinesForMetadata)
	local FooterTopPadding = if Gui.title or Gui.footerMetadata then ElementSizes.footerTopPadding else 0
	local PaddingAboveMetadata = if Gui.title and Gui.footerMetadata then ElementSizes.paddingAboveMetadata else 0
	local TitleHeight = if Gui.title then ElementSizes.titleHeight else 0
	local UseRefResult = nil
	UseRefResult = ReactModule.useRef(false)
	
	return ReactModule.createElement(ZoomAnimatedFrameModule, {
		isZoomEnabled = IsHovered,
		expansionOffsetX = Size100 * 2,
		expansionOffsetTop = Size100,
		expansionOffsetBottom = PlayButtonHeight + Size300 + (if Gui.hidePlayButton then 0 else Size100) / (Gui.imageAspectRatio or 1) + Size100 + (if Gui.hideMetadata and Gui.footerMetadata then ElementSizes.metadataHeight else 0),
		reducedMotion = Gui.reducedMotion
	}, {
		HoverShadow = IsHovered and ReactModule.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			ZIndex = -1,
			Position = UDim2.new(0.5, 0, 0.5, 2),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.new(1, HoverPadding + 18, 1, HoverPadding + 20),
			Image = Images["component_assets/dropshadow_56_8"],
			ImageColor3 = (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Common.Shadow else UseDesignTokensResult.Semantic.Color.Common.DropShadow).Color3,
			ImageTransparency = (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Common.Shadow else UseDesignTokensResult.Semantic.Color.Common.DropShadow).Transparency,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(35, 35, 37, 37)
		}) or nil,
		GameTileContent = ReactModule.createElement("TextButton", {
			SelectionOrder = Gui.SelectionOrder,
			ref = Gui.forwardRef,
			Size = Size,
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			SelectionImageObject = UseCursorResult,
			Active = not Gui.isDisabled,
			[ReactModule.Change.GuiState] = ReactModule.useCallback(function(...)
				-- upvalues: UseRefResult (ref), FFlagLuaAppGameTileInteractionFeedback (upval), Gui (copy)
				UseRefResult.current = false
				
				if FFlagLuaAppGameTileInteractionFeedback and Gui.onGuiStateChanged then
					Gui.onGuiStateChanged(...)
				end
			end, { Gui.onGuiStateChanged }),
			[ReactModule.Event.Activated] = ReactModule.useCallback(function()
				-- upvalues: UseRefResult (ref), Gui (copy)
				if UseRefResult.current then
					UseRefResult.current = false
					
					return
				end
				if Gui.onActivated and not Gui.isDisabled then
					Gui.onActivated()
				end
			end, { Gui.onActivated, Gui.isDisabled }),
			[ReactModule.Event.SelectionGained] = Gui.onSelectionGained,
			[ReactModule.Event.SelectionLost] = Gui.onSelectionLost,
			[ReactModule.Event.TouchLongPress] = ReactModule.useCallback(function()
				-- upvalues: Gui (copy), UseRefResult (ref)
				if Gui.onTouchLongPress and not Gui.isDisabled then
					UseRefResult.current = true
					
					if UseRefResult.current == false then
						Gui.onTouchLongPress()
					end
				end
			end, { Gui.onTouchLongPress, Gui.isDisabled }),
			ClipsDescendants = false,
			Text = "",
			BackgroundTransparency = (if UseTokensResult and Gui.isUnifiedGameTile then IsHovered and UseTokensResult.Color.Surface.Surface_100.Transparency else IsHovered and (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Surface.Surface_300 else UseDesignTokensResult.Semantic.Color.BackgroundUi.Default).Transparency) or 1,
			BackgroundColor3 = if UseTokensResult and Gui.isUnifiedGameTile then UseTokensResult.Color.Surface.Surface_100.Color3 else (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Surface.Surface_300 else UseDesignTokensResult.Semantic.Color.BackgroundUi.Default).Color3,
			AutoButtonColor = false,
			Selectable = Gui.Selectable,
			[ReactModule.Tag] = "data-testid=--game-tile"
		}, {
			UIPadding = IsHovered and ReactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, HoverPadding),
				PaddingTop = UDim.new(0, HoverPadding),
				PaddingRight = UDim.new(0, HoverPadding),
				PaddingBottom = UDim.new(0, HoverPadding)
			}) or nil,
			UICorner = ReactModule.createElement("UICorner", {
				CornerRadius = if FFlagLuaAppMigrateGameTileHoverFixes and Gui.isUnifiedGameTile then _UDim else _UDim + UDim.new(0, HoverPadding)
			}),
			UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			ThumbnailFrame = ReactModule.createElement("Frame", {
				[ReactModule.Tag] = if FFlagLuaAppHomePageFirstImageLoadObserver then "observed-image" else nil,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				LayoutOrder = 1,
				ZIndex = -1
			}, {
				Thumbnail = if Gui.thumbnailComponent then Gui.thumbnailComponent else ReactModule.createElement(LoadableImage, {
					BackgroundTransparency = 1,
					showFailedStateWhenLoadingFailed = true,
					useShimmerAnimationWhileLoading = true,
					ZIndex = -2,
					Image = Gui.image,
					Size = UDim2.new(1, 0, 1, if Gui.isContained and not IsUnifiedGameTile then Medium else 0),
					cornerRadius = _UDim,
					ScaleType = if Gui.isContained and not IsUnifiedGameTile then Enum.ScaleType.Tile else nil,
					TileSize = if Gui.isContained and not IsUnifiedGameTile then UDim2.new(1, 0, 1, -Medium) else nil,
					onLoaded = if FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then Gui.onTileImageLoaded else nil
				}),
				ContainedBackgroundTop = if Gui.isContained and not IsUnifiedGameTile then ReactModule.createElement("Frame", {
					BackgroundTransparency = 0,
					ZIndex = -1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, FooterHeight - Medium),
					Position = UDim2.new(0, 0, 1, 0),
					BackgroundColor3 = if Gui.isUnifiedGameTile and UseTokensResult then UseTokensResult.Color.Surface.Surface_100.Color3 else (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Surface.Surface_300 else UseDesignTokensResult.Semantic.Color.BackgroundUi.Default).Color3
				}) else nil,
				UIAspectRatioConstraint = ReactModule.createElement("UIAspectRatioConstraint", { AspectRatio = Gui.imageAspectRatio or 1 }),
				ThumbnailOverlay = Gui.thumbnailOverlay,
				OverflowMenu = Gui.overflowMenu
			}),
			BottomContent = ReactModule.createElement("Frame", {
				LayoutOrder = 2,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, FooterHeight),
				BackgroundTransparency = if Gui.isContained then 0 else 1,
				BackgroundColor3 = if UseTokensResult and Gui.isUnifiedGameTile then UseTokensResult.Color.Surface.Surface_100.Color3 else (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Surface.Surface_300 else UseDesignTokensResult.Semantic.Color.BackgroundUi.Default).Color3
			}, {
				UICorner = if Gui.isContained then ReactModule.createElement("UICorner", { CornerRadius = _UDim }) else nil,
				TextWrapper = ReactModule.createElement(RightAlignedButtonWrapperModule, {
					Button = Gui.rightCornerButton,
					Padding = UDim.new(0, if Gui.isContained then 0 elseif FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_300 else UseDesignTokensResult.Global.Space_150),
					Content = ReactModule.createElement(ReactModule.Fragment, nil, {
						Title = Gui.title and ReactModule.createElement("TextLabel", {
							BackgroundTransparency = 1,
							LayoutOrder = 3,
							Position = UDim2.new(0, ContainmentSidePadding, 0, FooterTopPadding),
							Size = UDim2.new(1, -2 * ContainmentSidePadding, 0, TitleHeight),
							Text = Gui.title,
							Font = TitleMedium.Font,
							TextSize = FontSize,
							TextTransparency = Emphasis.Transparency,
							TextColor3 = Emphasis.Color3,
							TextWrapped = if NumLinesForTitle and Gui.isUnifiedGameTile then NumLinesForTitle > 1 else false,
							TextTruncate = Enum.TextTruncate.SplitWord,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextYAlignment = if Gui.isUnifiedGameTile then Enum.TextYAlignment.Top else Enum.TextYAlignment.Center
						}) or nil,
						Metadata = Gui.footerMetadata and ReactModule.createElement("Frame", {
							ClipsDescendants = false,
							BackgroundTransparency = 1,
							LayoutOrder = 5,
							Position = UDim2.new(0, ContainmentSidePadding, 0, TitleHeight + FooterTopPadding + PaddingAboveMetadata),
							Size = UDim2.new(_UDim1, UDim.new(0, ElementSizes.metadataHeight))
						}, { MetadataContent = Gui.footerMetadata }),
						ExtraContent = Gui.extraFooterContent and (Gui.extraFooterSpace and ReactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							Size = UDim2.new(1, -ContainmentSidePadding * 2, 0, Gui.extraFooterSpace),
							Position = UDim2.new(0, ContainmentSidePadding, 0, TitleHeight + FooterTopPadding + PaddingAboveMetadata + ElementSizes.metadataHeight)
						}, { Gui.extraFooterContent }))
					})
				})
			}) or nil,
			PaddingAboveActionRow = IsHovered and ReactModule.createElement("Frame", {
				LayoutOrder = 6,
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(0, Size300)
			}) or nil,
			ActionRow = IsHovered and ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 7,
				Size = UDim2.new(1, 0, 0, PlayButtonHeight)
			}, { Content = Gui.hoverActionRow }) or nil
		})
	})
end