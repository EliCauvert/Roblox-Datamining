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
local fFlagLuaAppMigrateGameTileHoverFixes = require(parent.SharedFlags).FFlagLuaAppMigrateGameTileHoverFixes
local fFlagLuaAppGameViewTileBackgroundColorOverride = require(parent.SharedFlags).FFlagLuaAppGameViewTileBackgroundColorOverride
local fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone = require(parent.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone
local fFlagLuaAppHomePageFirstImageLoadObserver = require(parent.SharedFlags).FFlagLuaAppHomePageFirstImageLoadObserver
local useTokens = require(parent.Foundation).Hooks.useTokens

return function(p1)
	-- upvalues: useDesignTokens (ref), useTokens (ref), gameTileViewConfigModule (ref), useCursor (ref), fFlagLuaAppMigrateGameTileHoverFixes (ref), fFlagLuaAppGameViewTileBackgroundColorOverride (ref), reactModule (ref), zoomAnimatedFrameModule (ref), imageSetLabel (ref), images (ref), fFlagLuaAppHomePageFirstImageLoadObserver (ref), loadableImage (ref), fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (ref), rightAlignedButtonWrapperModule (ref)
	local var1 = useDesignTokens()
	local var2 = if p1.isUnifiedGameTile then p1.numLinesForTitle or 1 else nil
	local numLinesForMetadata = p1.numLinesForMetadata or 1
	local textSizeOffset = p1.textSizeOffset
	local var3 = useTokens()
	local elementSizes = gameTileViewConfigModule.getElementSizes(var1, textSizeOffset, if p1.isUnifiedGameTile then var2 else nil, if p1.isUnifiedGameTile then var3 else nil, if p1.isUnifiedGameTile then true else nil, numLinesForMetadata)
	local var4 = if var3 and p1.isUnifiedGameTile then var3.Radius.Medium else var1.Size.Size_200
	local uDim = UDim.new(0, var4)
	local var5 = useCursor(uDim)
	local var6 = if var3 and p1.isUnifiedGameTile then var3.Typography.TitleMedium else var1.Typography.TitleLarge
	local fontSize = var6.FontSize
	local var7 = if var3 and p1.isUnifiedGameTile then var3.Color.Content.Emphasis else var1.Color.Content.Emphasis
	local size100 = var1.Size.Size_100
	local var8 = if p1.isUnifiedGameTile then p1.hoverPadding or var1.Size.Size_300 else var1.Size.Size_300
	local var9 = if p1.hidePlayButton then 0 else elementSizes.playButtonHeight
	local _ = nil
	local var10 = if not p1.isUnifiedGameTile then if p1.isContained then p1.containmentSidePadding or var3.Padding.Medium else 0 elseif p1.isContained then var1.Size.Size_300 else 0
	local var11 = if p1.hidePlayButton or p1.isContained and p1.isUnifiedGameTile then 0 else var1.Size.Size_300
	local isHovered = p1.isHovered
	local isUnifiedGameTile = fFlagLuaAppMigrateGameTileHoverFixes and (isHovered and p1.isUnifiedGameTile)
	local uDim_1 = UDim.new(1, -(if p1.isUnifiedGameTile then var10 else var1.Size.Size_300 + var10))
	local var12 = p1.Size or UDim2.fromScale(1, 1)
	
	if isHovered then
		var12 += UDim2.fromOffset(var8 * 2, var8 * 2)
	end
	local footerHeight = gameTileViewConfigModule.getFooterHeight(var1, p1.isContained, p1.footerMetadata == nil, p1.title == nil, textSizeOffset, p1.extraFooterSpace, var2, var3, p1.isUnifiedGameTile, p1.numLinesForMetadata)
	local var13 = if p1.title or p1.footerMetadata then elementSizes.footerTopPadding else 0
	local var14 = if p1.title and p1.footerMetadata then elementSizes.paddingAboveMetadata else 0
	local var15 = if p1.title then elementSizes.titleHeight else 0
	local var16 = if var3 and p1.isUnifiedGameTile then if isHovered then var3.Color.Surface.Surface_100.Transparency else 1 elseif isHovered then var1.Color.Surface.Surface_300.Transparency else 1
	local var17 = if var3 and p1.isUnifiedGameTile then var3.Color.Surface.Surface_100.Color3 else var1.Color.Surface.Surface_300.Color3
	
	if fFlagLuaAppGameViewTileBackgroundColorOverride and p1.backgroundStyle then
		var16 = if isHovered then p1.backgroundStyle.Transparency else 1
		var17 = p1.backgroundStyle.Color3
	end
	local createElement_3
	local _ = nil
	local _ = nil
	local _ = nil
	local var18 = reactModule.useRef(false)
	local var19 = reactModule.useCallback(function(...)
		-- upvalues: var18 (write), p1 (ref)
		var18.current = false
		
		if p1.onGuiStateChanged then
			p1.onGuiStateChanged(...)
		end
	end, { p1.onGuiStateChanged })
	local var20 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), var18 (write)
		if p1.onTouchLongPress and not p1.isDisabled then
			local current = var18.current
			var18.current = true
			
			if current == false then
				p1.onTouchLongPress()
			end
		end
	end, { p1.onTouchLongPress, p1.isDisabled })
	local var21 = reactModule.useCallback(function()
		-- upvalues: var18 (write), p1 (ref)
		if var18.current then
			var18.current = false
			
			return
		elseif p1.onActivated and not p1.isDisabled then
			p1.onActivated()
		end
	end, { p1.onActivated, p1.isDisabled })
	local createElement = reactModule.createElement
	local t = {
		isZoomEnabled = isHovered,
		expansionOffsetX = size100 * 2,
		expansionOffsetTop = size100,
		expansionOffsetBottom = var9 + var11 + (if p1.hidePlayButton then 0 else size100) / (p1.imageAspectRatio or 1) + size100 + (if p1.hideMetadata and p1.footerMetadata then elementSizes.metadataHeight else 0),
		reducedMotion = p1.reducedMotion
	}
	local t_1 = {
		HoverShadow = isHovered and reactModule.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			ZIndex = -1,
			Position = UDim2.new(0.5, 0, 0.5, 2),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.new(1, var8 + 18, 1, var8 + 20),
			Image = images["component_assets/dropshadow_56_8"],
			ImageColor3 = var1.Color.Common.Shadow.Color3,
			ImageTransparency = var1.Color.Common.Shadow.Transparency,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(35, 35, 37, 37)
		}) or nil
	}
	local createElement_1 = reactModule.createElement
	local var22 = "TextButton"
	local t_2 = {
		SelectionOrder = p1.SelectionOrder,
		ref = p1.forwardRef,
		Size = var12,
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
		SelectionImageObject = var5,
		Active = not p1.isDisabled,
		[reactModule.Change.GuiState] = var19,
		[reactModule.Event.Activated] = var21,
		[reactModule.Event.SelectionGained] = p1.onSelectionGained,
		[reactModule.Event.SelectionLost] = p1.onSelectionLost,
		[reactModule.Event.TouchLongPress] = var20,
		ClipsDescendants = false,
		Text = "",
		BackgroundTransparency = var16,
		BackgroundColor3 = var17,
		AutoButtonColor = false,
		Selectable = p1.Selectable,
		[reactModule.Tag] = "data-testid=--game-tile"
	}
	local t_3 = {
		UIPadding = isHovered and reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, var8),
			PaddingTop = UDim.new(0, var8),
			PaddingRight = UDim.new(0, var8),
			PaddingBottom = UDim.new(0, var8)
		}) or nil,
		UICorner = reactModule.createElement("UICorner", {
			CornerRadius = if fFlagLuaAppMigrateGameTileHoverFixes and p1.isUnifiedGameTile then uDim else uDim + UDim.new(0, var8)
		}),
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}
	local createElement_2 = reactModule.createElement
	local var23 = "Frame"
	local t_4 = {
		[reactModule.Tag] = if fFlagLuaAppHomePageFirstImageLoadObserver then "observed-image" else nil,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		LayoutOrder = 1,
		ZIndex = -1
	}
	local t_5 = {}
	
	if p1.thumbnailComponent then
		createElement_3 = p1.thumbnailComponent
	else
		createElement_3 = reactModule.createElement
		createElement_3 = createElement_3(loadableImage, {
			BackgroundTransparency = 1,
			showFailedStateWhenLoadingFailed = true,
			useShimmerAnimationWhileLoading = true,
			ZIndex = -2,
			Image = p1.image,
			Size = UDim2.new(1, 0, 1, if p1.isContained and not isUnifiedGameTile then var4 else 0),
			cornerRadius = uDim,
			ScaleType = if p1.isContained and not isUnifiedGameTile then Enum.ScaleType.Tile else nil,
			TileSize = if p1.isContained and not isUnifiedGameTile then UDim2.new(1, 0, 1, -var4) else nil,
			onLoaded = if fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then p1.onTileImageLoaded else nil
		})
	end
	local createElement_7
	t_5.Thumbnail = createElement_3
	t_5.ContainedBackgroundTop = if p1.isContained and not isUnifiedGameTile then reactModule.createElement("Frame", {
		BackgroundTransparency = 0,
		ZIndex = -1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, footerHeight - var4),
		Position = UDim2.new(0, 0, 1, 0),
		BackgroundColor3 = var17
	}) else nil
	t_5.UIAspectRatioConstraint = reactModule.createElement("UIAspectRatioConstraint", { AspectRatio = p1.imageAspectRatio or 1 })
	t_5.ThumbnailOverlay = p1.thumbnailOverlay
	t_5.OverflowMenu = p1.overflowMenu
	t_3.ThumbnailFrame = createElement_2(var23, t_4, t_5)
	local createElement_4 = reactModule.createElement
	local var24 = "Frame"
	local t_6 = {
		LayoutOrder = 2,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, footerHeight),
		BackgroundTransparency = if p1.isContained then 0 else 1,
		BackgroundColor3 = var17
	}
	local t_7 = {
		UICorner = if p1.isContained then reactModule.createElement("UICorner", { CornerRadius = uDim }) else nil
	}
	local createElement_5 = reactModule.createElement
	local var25 = rightAlignedButtonWrapperModule
	local t_8 = {
		Button = p1.rightCornerButton,
		Padding = UDim.new(0, if p1.isContained then 0 else var1.Size.Size_300)
	}
	local createElement_6 = reactModule.createElement
	local fragment = reactModule.Fragment
	local var26 = nil
	local t_9 = {}
	
	if p1.title then
		local var27
		createElement_7 = reactModule.createElement
		local var28 = "TextLabel"
		local t_10 = {
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			Position = UDim2.new(0, var10, 0, var13),
			Size = UDim2.new(1, -2 * var10, 0, var15),
			Text = p1.title,
			Font = var6.Font,
			TextSize = fontSize,
			TextTransparency = var7.Transparency,
			TextColor3 = var7.Color3
		}
		
		if var2 and p1.isUnifiedGameTile then
			var27 = var2 > 1
			var27 = nil
		else
			var27 = false
		end
		t_10.TextWrapped = var27
		t_10.TextTruncate = Enum.TextTruncate.SplitWord
		t_10.TextXAlignment = Enum.TextXAlignment.Left
		t_10.TextYAlignment = if p1.isUnifiedGameTile then Enum.TextYAlignment.Top else Enum.TextYAlignment.Center
		createElement_7 = createElement_7(var28, t_10) or nil
	end
	t_9.Title = createElement_7
	t_9.Metadata = p1.footerMetadata and reactModule.createElement("Frame", {
		ClipsDescendants = false,
		BackgroundTransparency = 1,
		LayoutOrder = 5,
		Position = UDim2.new(0, var10, 0, var15 + var13 + var14),
		Size = UDim2.new(uDim_1, UDim.new(0, elementSizes.metadataHeight))
	}, { MetadataContent = p1.footerMetadata })
	t_9.ExtraContent = p1.extraFooterContent and (p1.extraFooterSpace and reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, -var10 * 2, 0, p1.extraFooterSpace),
		Position = UDim2.new(0, var10, 0, var15 + var13 + var14 + elementSizes.metadataHeight)
	}, { p1.extraFooterContent }))
	t_8.Content = createElement_6(fragment, var26, t_9)
	t_7.TextWrapper = createElement_5(var25, t_8)
	t_3.BottomContent = createElement_4(var24, t_6, t_7) or nil
	t_3.PaddingAboveActionRow = isHovered and reactModule.createElement("Frame", {
		LayoutOrder = 6,
		BackgroundTransparency = 1,
		Size = UDim2.fromOffset(0, var11)
	}) or nil
	t_3.ActionRow = isHovered and reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 7,
		Size = UDim2.new(1, 0, 0, var9)
	}, { Content = p1.hoverActionRow }) or nil
	t_1.GameTileContent = createElement_1(var22, t_2, t_3)
	
	return createElement(zoomAnimatedFrameModule, t, t_1)
end