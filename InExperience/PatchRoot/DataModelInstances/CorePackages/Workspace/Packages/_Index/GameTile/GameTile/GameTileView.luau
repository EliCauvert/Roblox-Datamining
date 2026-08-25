local gameTile = script:FindFirstAncestor("GameTile")
local parent = gameTile.Parent
local reactModule = require(parent.React)
local useDesignTokens = require(parent.Style).useDesignTokens
local UIBloxModule = require(parent.UIBlox)
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local loadableImage = UIBloxModule.App.Loading.LoadableImage
local useCursor = UIBloxModule.App.SelectionCursor.useCursor
local rightAlignedButtonWrapperModule = require(gameTile.Footer.RightAlignedButtonWrapper)
local zoomAnimatedFrameModule = require(gameTile.ZoomAnimatedFrame)
local gameTileViewConfigModule = require(gameTile.GameTileViewConfig)
local fFlagLuaAppGameTileInteractionFeedback = require(parent.SharedFlags).FFlagLuaAppGameTileInteractionFeedback
local fFlagLuaAppMigrateGameTileHoverFixes = require(parent.SharedFlags).FFlagLuaAppMigrateGameTileHoverFixes
local fFlagLuaAppGameViewTileBackgroundColorOverride = require(parent.SharedFlags).FFlagLuaAppGameViewTileBackgroundColorOverride
local fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone = require(parent.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone
local fFlagLuaAppHomePageFirstImageLoadObserver = require(parent.SharedFlags).FFlagLuaAppHomePageFirstImageLoadObserver
local useTokens = require(parent.Foundation).Hooks.useTokens

return function(p0)
	-- upvalues: useDesignTokens (ref), useTokens (ref), gameTileViewConfigModule (ref), useCursor (ref), fFlagLuaAppMigrateGameTileHoverFixes (ref), fFlagLuaAppGameViewTileBackgroundColorOverride (ref), reactModule (ref), fFlagLuaAppGameTileInteractionFeedback (ref), zoomAnimatedFrameModule (ref), imageSetLabel (ref), images (ref), fFlagLuaAppHomePageFirstImageLoadObserver (ref), loadableImage (ref), fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (ref), rightAlignedButtonWrapperModule (ref)
	local var6 = useDesignTokens()
	local var7 = if p0.isUnifiedGameTile then p0.numLinesForTitle or 1 else nil
	local numLinesForMetadata = p0.numLinesForMetadata or 1
	local textSizeOffset = p0.textSizeOffset
	local var9 = useTokens()
	local elementSizes = gameTileViewConfigModule.getElementSizes(var6, textSizeOffset, if p0.isUnifiedGameTile then var7 else nil, if p0.isUnifiedGameTile then var9 else nil, if p0.isUnifiedGameTile then true else nil, numLinesForMetadata)
	local var11 = if var9 and p0.isUnifiedGameTile then var9.Radius.Medium else var6.Size.Size_200
	local uDim = UDim.new(0, var11)
	local var13 = useCursor(uDim)
	local var14 = if var9 and p0.isUnifiedGameTile then var9.Typography.TitleMedium else var6.Typography.TitleLarge
	local fontSize = var14.FontSize
	local var15 = if var9 and p0.isUnifiedGameTile then var9.Color.Content.Emphasis else var6.Color.Content.Emphasis
	local size100 = var6.Size.Size_100
	local var16 = if p0.isUnifiedGameTile then p0.hoverPadding or var6.Size.Size_300 else var6.Size.Size_300
	local var17 = if p0.hidePlayButton then 0 else elementSizes.playButtonHeight
	local _ = nil
	local var18 = if not p0.isUnifiedGameTile then if p0.isContained then p0.containmentSidePadding or var9.Padding.Medium else 0 elseif p0.isContained then var6.Size.Size_300 else 0
	local var19 = if p0.hidePlayButton or p0.isContained and p0.isUnifiedGameTile then 0 else var6.Size.Size_300
	local isHovered = p0.isHovered
	local isUnifiedGameTile = fFlagLuaAppMigrateGameTileHoverFixes and (isHovered and p0.isUnifiedGameTile)
	local uDim_1 = UDim.new(1, -(if p0.isUnifiedGameTile then var18 else var6.Size.Size_300 + var18))
	local var22 = p0.Size or UDim2.fromScale(1, 1)
	
	if isHovered then
		var22 += UDim2.fromOffset(var16 * 2, var16 * 2)
	end
	local footerHeight = gameTileViewConfigModule.getFooterHeight(var6, p0.isContained, p0.footerMetadata == nil, p0.title == nil, textSizeOffset, p0.extraFooterSpace, var7, var9, p0.isUnifiedGameTile, p0.numLinesForMetadata)
	local var24 = if p0.title or p0.footerMetadata then elementSizes.footerTopPadding else 0
	local var25 = if p0.title and p0.footerMetadata then elementSizes.paddingAboveMetadata else 0
	local var26 = if p0.title then elementSizes.titleHeight else 0
	local var27 = if var9 and p0.isUnifiedGameTile then if isHovered then var9.Color.Surface.Surface_100.Transparency else 1 elseif isHovered then var6.Color.Surface.Surface_300.Transparency else 1
	local var28 = if var9 and p0.isUnifiedGameTile then var9.Color.Surface.Surface_100.Color3 else var6.Color.Surface.Surface_300.Color3
	
	if fFlagLuaAppGameViewTileBackgroundColorOverride and p0.backgroundStyle then
		var27 = if isHovered then p0.backgroundStyle.Transparency else 1
		var28 = p0.backgroundStyle.Color3
	end
	local createElement_3
	local _ = nil
	local _ = nil
	local _ = nil
	local var29 = reactModule.useRef(false)
	local var30 = reactModule.useCallback(function(...)
		-- upvalues: var29 (write), fFlagLuaAppGameTileInteractionFeedback (copy), p0 (ref)
		var29.current = false
		
		if fFlagLuaAppGameTileInteractionFeedback and p0.onGuiStateChanged then
			p0.onGuiStateChanged(...)
		end
	end, { p0.onGuiStateChanged })
	local var31 = reactModule.useCallback(function()
		-- upvalues: p0 (ref), var29 (write)
		if p0.onTouchLongPress and not p0.isDisabled then
			local current = var29.current
			var29.current = true
			
			if current == false then
				p0.onTouchLongPress()
			end
		end
	end, { p0.onTouchLongPress, p0.isDisabled })
	local var32 = reactModule.useCallback(function()
		-- upvalues: var29 (write), p0 (ref)
		if var29.current then
			var29.current = false
			
			return
		elseif p0.onActivated and not p0.isDisabled then
			p0.onActivated()
		end
	end, { p0.onActivated, p0.isDisabled })
	local createElement = reactModule.createElement
	local t = {
		isZoomEnabled = isHovered,
		expansionOffsetX = size100 * 2,
		expansionOffsetTop = size100,
		expansionOffsetBottom = var17 + var19 + (if p0.hidePlayButton then 0 else size100) / (p0.imageAspectRatio or 1) + size100 + (if p0.hideMetadata and p0.footerMetadata then elementSizes.metadataHeight else 0),
		reducedMotion = p0.reducedMotion
	}
	local t_1 = {
		HoverShadow = isHovered and reactModule.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			ZIndex = -1,
			Position = UDim2.new(0.5, 0, 0.5, 2),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.new(1, var16 + 18, 1, var16 + 20),
			Image = images["component_assets/dropshadow_56_8"],
			ImageColor3 = var6.Color.Common.Shadow.Color3,
			ImageTransparency = var6.Color.Common.Shadow.Transparency,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(35, 35, 37, 37)
		}) or nil
	}
	local createElement_1 = reactModule.createElement
	local var35 = "TextButton"
	local t_2 = {
		SelectionOrder = p0.SelectionOrder,
		ref = p0.forwardRef,
		Size = var22,
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
		SelectionImageObject = var13,
		Active = not p0.isDisabled,
		[reactModule.Change.GuiState] = var30,
		[reactModule.Event.Activated] = var32,
		[reactModule.Event.SelectionGained] = p0.onSelectionGained,
		[reactModule.Event.SelectionLost] = p0.onSelectionLost,
		[reactModule.Event.TouchLongPress] = var31,
		ClipsDescendants = false,
		Text = "",
		BackgroundTransparency = var27,
		BackgroundColor3 = var28,
		AutoButtonColor = false,
		Selectable = p0.Selectable,
		[reactModule.Tag] = "data-testid=--game-tile"
	}
	local t_3 = {
		UIPadding = isHovered and reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, var16),
			PaddingTop = UDim.new(0, var16),
			PaddingRight = UDim.new(0, var16),
			PaddingBottom = UDim.new(0, var16)
		}) or nil,
		UICorner = reactModule.createElement("UICorner", {
			CornerRadius = if fFlagLuaAppMigrateGameTileHoverFixes and p0.isUnifiedGameTile then uDim else uDim + UDim.new(0, var16)
		}),
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}
	local createElement_2 = reactModule.createElement
	local var38 = "Frame"
	local t_4 = {
		[reactModule.Tag] = if fFlagLuaAppHomePageFirstImageLoadObserver then "observed-image" else nil,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		LayoutOrder = 1,
		ZIndex = -1
	}
	local t_5 = {}
	
	if p0.thumbnailComponent then
		createElement_3 = p0.thumbnailComponent
	else
		createElement_3 = reactModule.createElement
		createElement_3 = createElement_3(loadableImage, {
			BackgroundTransparency = 1,
			showFailedStateWhenLoadingFailed = true,
			useShimmerAnimationWhileLoading = true,
			ZIndex = -2,
			Image = p0.image,
			Size = UDim2.new(1, 0, 1, if p0.isContained and not isUnifiedGameTile then var11 else 0),
			cornerRadius = uDim,
			ScaleType = if p0.isContained and not isUnifiedGameTile then Enum.ScaleType.Tile else nil,
			TileSize = if p0.isContained and not isUnifiedGameTile then UDim2.new(1, 0, 1, -var11) else nil,
			onLoaded = if fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then p0.onTileImageLoaded else nil
		})
	end
	local createElement_7
	t_5.Thumbnail = createElement_3
	t_5.ContainedBackgroundTop = if p0.isContained and not isUnifiedGameTile then reactModule.createElement("Frame", {
		BackgroundTransparency = 0,
		ZIndex = -1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, footerHeight - var11),
		Position = UDim2.new(0, 0, 1, 0),
		BackgroundColor3 = var28
	}) else nil
	t_5.UIAspectRatioConstraint = reactModule.createElement("UIAspectRatioConstraint", { AspectRatio = p0.imageAspectRatio or 1 })
	t_5.ThumbnailOverlay = p0.thumbnailOverlay
	t_5.OverflowMenu = p0.overflowMenu
	t_3.ThumbnailFrame = createElement_2(var38, t_4, t_5)
	local createElement_4 = reactModule.createElement
	local var41 = "Frame"
	local t_6 = {
		LayoutOrder = 2,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, footerHeight),
		BackgroundTransparency = if p0.isContained then 0 else 1,
		BackgroundColor3 = var28
	}
	local t_7 = {
		UICorner = if p0.isContained then reactModule.createElement("UICorner", { CornerRadius = uDim }) else nil
	}
	local createElement_5 = reactModule.createElement
	local var44 = rightAlignedButtonWrapperModule
	local t_8 = {
		Button = p0.rightCornerButton,
		Padding = UDim.new(0, if p0.isContained then 0 else var6.Size.Size_300)
	}
	local createElement_6 = reactModule.createElement
	local fragment = reactModule.Fragment
	local var46 = nil
	local t_9 = {}
	
	if p0.title then
		local var50
		createElement_7 = reactModule.createElement
		local var48 = "TextLabel"
		local t_10 = {
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			Position = UDim2.new(0, var18, 0, var24),
			Size = UDim2.new(1, -2 * var18, 0, var26),
			Text = p0.title,
			Font = var14.Font,
			TextSize = fontSize,
			TextTransparency = var15.Transparency,
			TextColor3 = var15.Color3
		}
		
		if var7 and p0.isUnifiedGameTile then
			var50 = var7 > 1
			var50 = nil
		else
			var50 = false
		end
		t_10.TextWrapped = var50
		t_10.TextTruncate = Enum.TextTruncate.SplitWord
		t_10.TextXAlignment = Enum.TextXAlignment.Left
		t_10.TextYAlignment = if p0.isUnifiedGameTile then Enum.TextYAlignment.Top else Enum.TextYAlignment.Center
		createElement_7 = createElement_7(var48, t_10) or nil
	end
	t_9.Title = createElement_7
	t_9.Metadata = p0.footerMetadata and reactModule.createElement("Frame", {
		ClipsDescendants = false,
		BackgroundTransparency = 1,
		LayoutOrder = 5,
		Position = UDim2.new(0, var18, 0, var26 + var24 + var25),
		Size = UDim2.new(uDim_1, UDim.new(0, elementSizes.metadataHeight))
	}, { MetadataContent = p0.footerMetadata })
	t_9.ExtraContent = p0.extraFooterContent and (p0.extraFooterSpace and reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, -var18 * 2, 0, p0.extraFooterSpace),
		Position = UDim2.new(0, var18, 0, var26 + var24 + var25 + elementSizes.metadataHeight)
	}, { p0.extraFooterContent }))
	t_8.Content = createElement_6(fragment, var46, t_9)
	t_7.TextWrapper = createElement_5(var44, t_8)
	t_3.BottomContent = createElement_4(var41, t_6, t_7) or nil
	t_3.PaddingAboveActionRow = isHovered and reactModule.createElement("Frame", {
		LayoutOrder = 6,
		BackgroundTransparency = 1,
		Size = UDim2.fromOffset(0, var19)
	}) or nil
	t_3.ActionRow = isHovered and reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 7,
		Size = UDim2.new(1, 0, 0, var17)
	}, { Content = p0.hoverActionRow }) or nil
	t_1.GameTileContent = createElement_1(var35, t_2, t_3)
	
	return createElement(zoomAnimatedFrameModule, t, t_1)
end