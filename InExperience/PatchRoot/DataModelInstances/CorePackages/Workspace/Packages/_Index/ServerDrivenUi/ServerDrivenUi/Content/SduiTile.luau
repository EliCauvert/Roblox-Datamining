local contentProviderService = game:GetService("ContentProvider")
local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local getInputModeStore = responsiveModule.GetInputModeStore
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local normalizeFontFace = foundationModule.Utility.normalizeFontFace
local foundationFontFaceMigration = foundationModule.Utility.Flags.FoundationFontFaceMigration
local UIBloxModule = require(parent.UIBlox)
local cryoModule = require(parent.Cryo)
local loadableImage = UIBloxModule.App.Loading.LoadableImage
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local textSizeModule = require(parent.TextSize)
local _ = require(parent.SduiCoreSystem)
local holdDetector = require(parent.HoldToPlay).HoldDetector
local sduiDefaultTileImageModule = require(script.Parent.SduiDefaultTileImage)
local useTileHoldActionModule = require(script.Parent.useTileHoldAction)
local fFlagSduiTileDisableLegacyHover = require(serverDrivenUi.Flags).FFlagSduiTileDisableLegacyHover
local fFlagLuaAppHomePageFirstImageLoadObserver = require(parent.SharedFlags).FFlagLuaAppHomePageFirstImageLoadObserver
local fFlagSduiTileThumbnailPadding = require(parent.SharedFlags).FFlagSduiTileThumbnailPadding
local fFlagLuaAppSduiVideoThumbnail = require(parent.SharedFlags).FFlagLuaAppSduiVideoThumbnail
local fFlagLuaAppSduiGameTileFeedback = require(parent.SharedFlags).FFlagLuaAppSduiGameTileFeedback
local sduiTileInsetImageModule = require(script.Parent.SduiTileInsetImage)
local t = {}

local function _(p1)
	return if string.match(p1, "^rbxthumb://") == nil then string.match(p1, "^rbxasset") ~= nil else true
end

local function maybeLayoutForButton(p1, p2, p3, p4, p5)
	-- upvalues: reactModule (ref), cryoModule (ref)
	return if p2 == nil or p5 then p1 else {
		Content = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			UIListLayout = reactModule.createElement("UIListLayout", {
				HorizontalFlex = Enum.UIFlexAlignment.None,
				SortOrder = Enum.SortOrder.Name,
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, p3 or 0),
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Bottom
			}),
			UIPadding = if p4 > 0 then reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, p4),
				PaddingRight = UDim.new(0, p4),
				PaddingBottom = UDim.new(0, p4)
			}) else nil,
			LeftContent = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(0, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.XY
			}, cryoModule.Dictionary.join({
				UIFlexItem = reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Shrink })
			}, p1)),
			RightContent = p2
		})
	}
end

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), contentProviderService (ref), textSizeModule (ref), useTokens (ref), getInputModeStore (ref), responsiveModule (ref), useTileHoldActionModule (ref), fFlagLuaAppSduiGameTileFeedback (ref), fFlagSduiTileDisableLegacyHover (ref), sduiTileInsetImageModule (ref), fFlagSduiTileThumbnailPadding (ref), fFlagLuaAppHomePageFirstImageLoadObserver (ref), imageSetLabel (ref), fFlagLuaAppSduiVideoThumbnail (ref), sduiDefaultTileImageModule (ref), loadableImage (ref), maybeLayoutForButton (ref), foundationFontFaceMigration (ref), normalizeFontFace (ref), cryoModule (ref), t (ref), holdDetector (ref)
	local backgroundStyle, color3
	local layoutOrder = p1.layoutOrder
	local anchorPoint = p1.anchorPoint
	local automaticSize = p1.automaticSize
	local size = p1.size
	local zIndex = p1.zIndex
	local position = p1.position
	local backgroundColor3 = p1.backgroundColor3
	local selectionOrder = p1.selectionOrder
	reactModule.useLayoutEffect(function()
		-- upvalues: p1 (ref), contentProviderService (copy)
		local image = p1.image
		
		if image and (if string.match(image, "^rbxthumb://") == nil then string.match(image, "^rbxasset") ~= nil else true) then
			task.spawn(function()
				-- upvalues: contentProviderService (copy), image (ref)
				contentProviderService:PreloadAsync({ image })
			end)
		end
	end, { p1.image })
	local textSizeOffset = textSizeModule.getTextSizeStore(false).getTextSizeOffset(false)
	local var1 = useTokens()
	local var2 = if p1.imageAspectRatio and p1.imageAspectRatio == 0 then 1 else p1.imageAspectRatio or 1
	local titleLines = p1.titleLines or 1
	local cornerRadius = p1.cornerRadius or var1.Radius.Medium
	local titleFont = p1.titleFont or var1.Typography.TitleMedium
	local emphasis = var1.Color.Content.Emphasis
	local ceiled = math.ceil(titleLines * (titleFont.LineHeight * titleFont.FontSize + textSizeOffset))
	local var3 = p1.ctaButtonComponent ~= nil
	local var4, var5 = reactModule.useState(false)
	local isContained = p1.isContained
	local _ = nil
	local _ = nil
	
	if p1.backgroundStyle == nil then
		backgroundStyle = var1.Color.Surface.Surface_100
		color3 = backgroundColor3 or backgroundStyle.Color3
	else
		backgroundStyle = p1.backgroundStyle
		color3 = backgroundStyle.Color3
	end
	local containmentPadding = p1.containmentPadding or var1.Padding.Small
	local var6, var7 = reactModule.useState(false)
	local var8 = if p1.isHovered ~= nil then var6 else p1.isHovered
	local var9 = reactModule.useCallback(function()
		-- upvalues: getInputModeStore (copy), responsiveModule (copy), var7 (ref), p1 (ref)
		if getInputModeStore(false).getLastInputType(false) == responsiveModule.Input.Pointer then
			var7(true)
			
			if p1.onMouseEnter then
				p1.onMouseEnter()
				
				return
			elseif p1.setCustomConditionState then
				p1.setCustomConditionState("hovered", true)
			end
		end
	end, { p1.onMouseEnter, p1.setCustomConditionState })
	local var10 = reactModule.useCallback(function()
		-- upvalues: var7 (ref), p1 (ref)
		var7(false)
		
		if p1.onMouseLeave then
			p1.onMouseLeave()
			
			return
		elseif p1.setCustomConditionState then
			p1.setCustomConditionState("hovered", false)
		end
	end, { p1.onMouseLeave, p1.setCustomConditionState })
	local var11 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		if p1.onSelectionGained then
			p1.onSelectionGained()
			
			return
		elseif p1.setCustomConditionState then
			p1.setCustomConditionState("selected", true)
		end
	end, { p1.onSelectionGained, p1.setCustomConditionState })
	local var12 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		if p1.onSelectionLost then
			p1.onSelectionLost()
			
			return
		elseif p1.setCustomConditionState then
			p1.setCustomConditionState("selected", false)
		end
	end, { p1.onSelectionLost, p1.setCustomConditionState })
	local var13 = useTileHoldActionModule(p1.holdActionConfig, p1.setGuiObject, p1.onActivated)
	local var14 = nil
	local var15 = nil
	local var16 = nil
	
	if fFlagLuaAppSduiGameTileFeedback then
		local var17 = reactModule.useRef(false)
		var14 = reactModule.useCallback(function(...)
			-- upvalues: var17 (ref), p1 (ref)
			var17.current = false
			
			if p1.onGuiStateChanged then
				p1.onGuiStateChanged(...)
			end
		end, { p1.onGuiStateChanged })
		var16 = reactModule.useCallback(function()
			-- upvalues: var17 (ref), var13 (ref), p1 (ref)
			if var17.current then
				var17.current = false
				
				return
			elseif var13 then
				var13.onActivated()
				
				return
			elseif p1.onActivated then
				p1.onActivated()
			end
		end, { var13, p1.onActivated })
		var15 = reactModule.useCallback(function()
			-- upvalues: p1 (ref), var17 (ref)
			if p1.onTouchLongPress and not p1.isDisabled then
				local current = var17.current
				var17.current = true
				
				if not current then
					p1.onTouchLongPress()
				end
			end
		end, { p1.onTouchLongPress, p1.isDisabled })
	end
	local var18 = nil
	local containmentPadding_1 = nil
	local var19 = nil
	local var20 = nil
	
	if not fFlagSduiTileDisableLegacyHover and p1.enableLegacyHoverState then
		var18 = var8
		containmentPadding_1 = p1.containmentPadding or var1.Padding.Medium
		var19 = if var8 then UDim2.new(1, containmentPadding_1 * 2, 1, containmentPadding_1 * 2) else nil
		var20 = if var8 then UDim2.new(0, -containmentPadding_1, 0, -containmentPadding_1) else nil
	end
	local var21
	local transparency = backgroundStyle.Transparency
	local var22 = if p1.imagePadding ~= nil then reactModule.createElement(sduiTileInsetImageModule, {
		image = p1.image,
		imageComponent = p1.imageComponent,
		imagePadding = p1.imagePadding,
		imageCornerRadius = p1.imageCornerRadius or 1000,
		cardCornerRadius = cornerRadius,
		isContained = isContained,
		backgroundStyle = p1.thumbnailBackgroundStyle
	}) else nil
	local createElement = reactModule.createElement
	local var23 = "TextButton"
	local t_1 = {
		[reactModule.Tag] = if p1.testId then `data-testid={p1.testId}` else nil,
		ref = if var13 then var13.tileRef else p1.setGuiObject,
		Size = var19 or (size or UDim2.new(1, 0, 1, 0)),
		Position = var20 or position,
		AnchorPoint = anchorPoint,
		LayoutOrder = layoutOrder,
		ZIndex = zIndex,
		SelectionImageObject = p1.sduiContext.dependencies.cursors.tileCursor,
		Active = if fFlagLuaAppSduiGameTileFeedback then not p1.isDisabled else p1.isDisabled,
		Selectable = if fFlagLuaAppSduiGameTileFeedback then p1.selectable else nil,
		[reactModule.Change.GuiState] = if fFlagLuaAppSduiGameTileFeedback then var14 else p1.onGuiStateChanged,
		[reactModule.Event.Activated] = if fFlagLuaAppSduiGameTileFeedback then var16 elseif var13 then var13.onActivated else p1.onActivated,
		[reactModule.Event.MouseEnter] = var9,
		[reactModule.Event.MouseLeave] = var10,
		[reactModule.Event.SelectionGained] = var11,
		[reactModule.Event.SelectionLost] = var12,
		[reactModule.Event.TouchLongPress] = if fFlagLuaAppSduiGameTileFeedback and p1.onTouchLongPress then var15 else nil,
		ClipsDescendants = false,
		Text = "",
		TextTransparency = 1,
		BackgroundTransparency = if isContained or var18 then transparency else 1,
		AutoButtonColor = false,
		AutomaticSize = automaticSize or Enum.AutomaticSize.Y,
		BackgroundColor3 = color3,
		BorderSizePixel = 0,
		SelectionOrder = selectionOrder
	}
	local t_2 = {
		UIPadding = if fFlagSduiTileDisableLegacyHover then nil elseif var18 then reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, containmentPadding_1),
			PaddingRight = UDim.new(0, containmentPadding_1),
			PaddingTop = UDim.new(0, containmentPadding_1)
		}) else nil,
		UICorner = if isContained or not fFlagSduiTileDisableLegacyHover and var18 then reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, cornerRadius) }) else nil,
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, var1.Gap.Medium),
			HorizontalAlignment = if fFlagSduiTileThumbnailPadding then Enum.HorizontalAlignment.Center else nil
		}),
		ImageFrame = reactModule.createElement("Frame", {
			[reactModule.Tag] = if fFlagLuaAppHomePageFirstImageLoadObserver then "observed-image" else nil,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = if fFlagSduiTileThumbnailPadding and p1.thumbnailPadding ~= nil then UDim2.new(1, p1.thumbnailPadding * -2, 1 / var2, 0) else UDim2.new(1, 0, 1 / var2, 0),
			ZIndex = -1,
			LayoutOrder = 1,
			ClipsDescendants = if isContained then true else nil,
			SizeConstraint = Enum.SizeConstraint.RelativeXX
		}, {
			BackgroundImage = if p1.backgroundImageComponent then p1.backgroundImageComponent elseif p1.backgroundImage then reactModule.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				ZIndex = -3,
				Size = UDim2.new(1, 0, 1, 0),
				Image = p1.backgroundImage
			}, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, cornerRadius) })
			}) else nil,
			Thumbnail = var22 or (if p1.imageComponent then p1.imageComponent elseif p1.image then if fFlagLuaAppSduiVideoThumbnail then reactModule.createElement(sduiDefaultTileImageModule, {
				image = p1.image,
				thumbnailBackgroundStyle = p1.thumbnailBackgroundStyle,
				isContained = isContained,
				cardCornerRadius = cornerRadius
			}) else reactModule.createElement(loadableImage, {
				showFailedStateWhenLoadingFailed = true,
				useShimmerAnimationWhileLoading = true,
				ZIndex = -2,
				BackgroundColor3 = if p1.thumbnailBackgroundStyle then p1.thumbnailBackgroundStyle.Color3 else nil,
				BackgroundTransparency = if p1.thumbnailBackgroundStyle then p1.thumbnailBackgroundStyle.Transparency else 1,
				Image = p1.image,
				Size = UDim2.new(1, 0, 1, if isContained then cornerRadius else 0),
				cornerRadius = UDim.new(0, cornerRadius),
				ScaleType = if isContained then Enum.ScaleType.Tile else nil,
				TileSize = if isContained then UDim2.new(1, 0, 1, -cornerRadius) else nil
			}) else nil),
			UIAspectRatioConstraint = reactModule.createElement("UIAspectRatioConstraint", { AspectRatio = var2 or 1 }),
			ThumbnailOverlay = p1.thumbnailOverlayComponent,
			OverflowMenu = if fFlagLuaAppSduiGameTileFeedback then p1.thumbnailOverflowMenuComponent else nil,
			HoverOverlay = if var8 and not var4 then reactModule.createElement("Frame", {
				BackgroundColor3 = var1.Color.State.Hover.Color3,
				BackgroundTransparency = var1.Color.State.Hover.Transparency,
				Size = UDim2.new(1, 0, 1, if isContained then cornerRadius else 0)
			}, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, cornerRadius) })
			}) else nil
		}),
		BottomContent = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 2,
			ZIndex = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0)
		}, maybeLayoutForButton({
			UIPadding = if isContained and not var3 then reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, containmentPadding),
				PaddingRight = UDim.new(0, containmentPadding),
				PaddingBottom = UDim.new(0, containmentPadding)
			}) else nil,
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.Name,
				HorizontalFlex = Enum.UIFlexAlignment.Fill
			}),
			["1_Title"] = if p1.titleComponent then p1.titleComponent elseif p1.titleText and p1.titleText ~= "" then reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, ceiled),
				Text = p1.titleText,
				Font = if foundationFontFaceMigration then nil else titleFont.Font,
				FontFace = if foundationFontFaceMigration then normalizeFontFace(titleFont.Font) else nil,
				TextSize = titleFont.FontSize,
				TextTransparency = emphasis.Transparency,
				TextColor3 = emphasis.Color3,
				TextWrapped = titleLines > 1,
				TextTruncate = Enum.TextTruncate.SplitWord,
				TextXAlignment = p1.titleTextXAlignment or Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				AutomaticSize = if var3 then Enum.AutomaticSize.X else nil
			}) else nil,
			["2_Footer"] = if p1.footerComponent then p1.footerComponent else nil,
			["3_BottomButton"] = if p1.bottomButtonComponent then reactModule.createElement("Frame", {
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 0),
				[reactModule.Event.MouseEnter] = function()
					-- upvalues: var5 (ref)
					if var5 then
						var5(true)
					end
				end,
				[reactModule.Event.MouseLeave] = function()
					-- upvalues: var5 (ref)
					if var5 then
						var5(false)
					end
				end
			}, {
				UIPadding = reactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, p1.bottomButtonGap or var1.Gap.Small)
				}),
				Content = p1.bottomButtonComponent
			}) else nil,
			Z_3_ExtraOverflow = if fFlagSduiTileDisableLegacyHover then nil elseif var18 and p1.renderLegacyHoverState then reactModule.createElement("Frame", { ZIndex = -1, Size = UDim2.new(1, 0, 0, 0) }, {
				ExtraOverflow = p1.renderLegacyHoverState(containmentPadding_1, color3, cornerRadius)
			}) else nil
		}, p1.ctaButtonComponent, var1.Gap.Small, if isContained then containmentPadding else 0, var18))
	}
	
	if p1.focusNavActionsComponent or p1.children then
		var21 = reactModule.createElement
		var21 = var21(reactModule.Fragment, nil, cryoModule.Dictionary.join(p1.children or t, { focusNavActions = p1.focusNavActionsComponent }))
	else
		var21 = nil
	end
	t_2.ExtraChildren = var21
	t_2.HoldDetector = if var13 and var13.holdDetectorProps then reactModule.createElement(holdDetector, var13.holdDetectorProps) else nil
	
	return createElement(var23, t_1, t_2)
end)