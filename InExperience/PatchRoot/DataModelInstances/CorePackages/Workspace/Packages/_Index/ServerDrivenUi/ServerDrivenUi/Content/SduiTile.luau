local contentProviderService = game:GetService("ContentProvider")
local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local getInputModeStore = responsiveModule.GetInputModeStore
local useTokens = require(parent.Foundation).Hooks.useTokens
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
local fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone = require(parent.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone
local fFlagLuaAppHomePageFirstImageLoadObserver = require(parent.SharedFlags).FFlagLuaAppHomePageFirstImageLoadObserver
local fFlagSduiTileBottomButton = require(parent.SharedFlags).FFlagSduiTileBottomButton
local fFlagSduiTileHoldAction = require(parent.SharedFlags).FFlagSduiTileHoldAction
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport
local fFlagSduiTileTitleTextAlignment = require(parent.SharedFlags).FFlagSduiTileTitleTextAlignment
local fFlagSduiTileImagePaddingInset = require(parent.SharedFlags).FFlagSduiTileImagePaddingInset
local fFlagSduiGameIconSupport = require(parent.SharedFlags).FFlagSduiGameIconSupport
local fFlagSduiTileThumbnailPadding = require(parent.SharedFlags).FFlagSduiTileThumbnailPadding
local fFlagLuaAppSduiVideoThumbnail = require(parent.SharedFlags).FFlagLuaAppSduiVideoThumbnail
local sduiTileInsetImageModule = require(script.Parent.SduiTileInsetImage)
local t = {}

local function _(p0)
	return if string.match(p0, "^rbxthumb://") == nil then string.match(p0, "^rbxasset") ~= nil else true
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

return reactModule.memo(function(p6)
	-- upvalues: reactModule (ref), fFlagSduiGameIconSupport (ref), contentProviderService (ref), textSizeModule (ref), useTokens (ref), fFlagSduiTileBottomButton (ref), fFlagSduiExperienceDetailsSupport (ref), getInputModeStore (ref), responsiveModule (ref), fFlagSduiTileHoldAction (ref), useTileHoldActionModule (ref), fFlagSduiTileDisableLegacyHover (ref), fFlagSduiTileImagePaddingInset (ref), sduiTileInsetImageModule (ref), fFlagSduiTileThumbnailPadding (ref), fFlagLuaAppHomePageFirstImageLoadObserver (ref), imageSetLabel (ref), fFlagLuaAppSduiVideoThumbnail (ref), sduiDefaultTileImageModule (ref), loadableImage (ref), fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (ref), maybeLayoutForButton (ref), fFlagSduiTileTitleTextAlignment (ref), cryoModule (ref), t (ref), holdDetector (ref)
	local layoutOrder = p6.layoutOrder
	local anchorPoint = p6.anchorPoint
	local automaticSize = p6.automaticSize
	local size = p6.size
	local zIndex = p6.zIndex
	local position = p6.position
	local backgroundColor3 = p6.backgroundColor3
	local selectionOrder = p6.selectionOrder
	reactModule.useLayoutEffect(function()
		-- upvalues: p6 (ref), fFlagSduiGameIconSupport (copy), contentProviderService (copy)
		local image = p6.image
		
		if image and (not fFlagSduiGameIconSupport or (if string.match(image, "^rbxthumb://") == nil then string.match(image, "^rbxasset") ~= nil else true)) then
			task.spawn(function()
				-- upvalues: contentProviderService (copy), image (ref)
				contentProviderService:PreloadAsync({ image })
			end)
		end
	end, { p6.image })
	local textSizeOffset = textSizeModule.getTextSizeStore(false).getTextSizeOffset(false)
	local var13 = useTokens()
	local var14 = if p6.imageAspectRatio and p6.imageAspectRatio == 0 then 1 else p6.imageAspectRatio or 1
	local titleLines = p6.titleLines or 1
	local cornerRadius = p6.cornerRadius or var13.Radius.Medium
	local titleFont = p6.titleFont or var13.Typography.TitleMedium
	local emphasis = var13.Color.Content.Emphasis
	local ceiled = math.ceil(titleLines * (titleFont.LineHeight * titleFont.FontSize + textSizeOffset))
	local var19 = p6.ctaButtonComponent ~= nil
	local var20 = nil
	local var21 = nil
	
	if fFlagSduiTileBottomButton then
		local var22, var23 = reactModule.useState(false)
		var20 = var22
		var21 = var23
	end
	local surface100, var24
	local isContained = p6.isContained
	local _ = nil
	local _ = nil
	
	if fFlagSduiExperienceDetailsSupport and p6.backgroundStyle ~= nil then
		surface100 = p6.backgroundStyle
		var24 = surface100.Color3
	else
		surface100 = var13.Color.Surface.Surface_100
		var24 = backgroundColor3 or surface100.Color3
	end
	local containmentPadding = p6.containmentPadding or var13.Padding.Small
	local var26, var27 = reactModule.useState(false)
	local var28 = if p6.isHovered ~= nil then var26 else p6.isHovered
	local var29 = reactModule.useCallback(function()
		-- upvalues: getInputModeStore (copy), responsiveModule (copy), var27 (ref), p6 (ref)
		if getInputModeStore(false).getLastInputType(false) == responsiveModule.Input.Pointer then
			var27(true)
			
			if p6.onMouseEnter then
				p6.onMouseEnter()
				
				return
			elseif p6.setCustomConditionState then
				p6.setCustomConditionState("hovered", true)
			end
		end
	end, { p6.onMouseEnter, p6.setCustomConditionState })
	local var30 = reactModule.useCallback(function()
		-- upvalues: var27 (ref), p6 (ref)
		var27(false)
		
		if p6.onMouseLeave then
			p6.onMouseLeave()
			
			return
		elseif p6.setCustomConditionState then
			p6.setCustomConditionState("hovered", false)
		end
	end, { p6.onMouseLeave, p6.setCustomConditionState })
	local var31 = reactModule.useCallback(function()
		-- upvalues: p6 (ref)
		if p6.onSelectionGained then
			p6.onSelectionGained()
			
			return
		elseif p6.setCustomConditionState then
			p6.setCustomConditionState("selected", true)
		end
	end, { p6.onSelectionGained, p6.setCustomConditionState })
	local var32 = reactModule.useCallback(function()
		-- upvalues: p6 (ref)
		if p6.onSelectionLost then
			p6.onSelectionLost()
			
			return
		elseif p6.setCustomConditionState then
			p6.setCustomConditionState("selected", false)
		end
	end, { p6.onSelectionLost, p6.setCustomConditionState })
	local var33 = if fFlagSduiTileHoldAction then useTileHoldActionModule(p6.holdActionConfig, p6.setGuiObject, p6.onActivated) else nil
	local var34 = nil
	local containmentPadding_1 = nil
	local var36 = nil
	local var37 = nil
	
	if not fFlagSduiTileDisableLegacyHover and p6.enableLegacyHoverState then
		var34 = var28
		containmentPadding_1 = p6.containmentPadding or var13.Padding.Medium
		var36 = if var28 then UDim2.new(1, containmentPadding_1 * 2, 1, containmentPadding_1 * 2) else nil
		var37 = if var28 then UDim2.new(0, -containmentPadding_1, 0, -containmentPadding_1) else nil
	end
	local var43
	local var38 = if fFlagSduiExperienceDetailsSupport then surface100.Transparency else 0
	local var39 = if fFlagSduiTileImagePaddingInset and p6.imagePadding ~= nil then reactModule.createElement(sduiTileInsetImageModule, {
		image = p6.image,
		imageComponent = p6.imageComponent,
		imagePadding = p6.imagePadding,
		imageCornerRadius = p6.imageCornerRadius or 1000,
		cardCornerRadius = cornerRadius,
		isContained = isContained,
		backgroundStyle = p6.thumbnailBackgroundStyle
	}) else nil
	local createElement = reactModule.createElement
	local var40 = "TextButton"
	local t_1 = {
		[reactModule.Tag] = if p6.testId then `data-testid={p6.testId}` else nil,
		ref = if var33 then var33.tileRef else p6.setGuiObject,
		Size = var36 or (size or UDim2.new(1, 0, 1, 0)),
		Position = var37 or position,
		AnchorPoint = anchorPoint,
		LayoutOrder = layoutOrder,
		ZIndex = zIndex,
		SelectionImageObject = p6.sduiContext.dependencies.cursors.tileCursor,
		Active = p6.isDisabled,
		[reactModule.Event.Activated] = if var33 then var33.onActivated else p6.onActivated,
		[reactModule.Event.MouseEnter] = var29,
		[reactModule.Event.MouseLeave] = var30,
		[reactModule.Event.SelectionGained] = var31,
		[reactModule.Event.SelectionLost] = var32,
		ClipsDescendants = false,
		Text = "",
		TextTransparency = 1,
		BackgroundTransparency = if isContained or var34 then var38 else 1,
		AutoButtonColor = false,
		AutomaticSize = automaticSize or Enum.AutomaticSize.Y,
		BackgroundColor3 = var24,
		BorderSizePixel = 0,
		SelectionOrder = selectionOrder
	}
	local t_2 = {
		UIPadding = if fFlagSduiTileDisableLegacyHover then nil elseif var34 then reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, containmentPadding_1),
			PaddingRight = UDim.new(0, containmentPadding_1),
			PaddingTop = UDim.new(0, containmentPadding_1)
		}) else nil,
		UICorner = if isContained or not fFlagSduiTileDisableLegacyHover and var34 then reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, cornerRadius) }) else nil,
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, var13.Gap.Medium),
			HorizontalAlignment = if fFlagSduiTileThumbnailPadding then Enum.HorizontalAlignment.Center else nil
		}),
		ImageFrame = reactModule.createElement("Frame", {
			[reactModule.Tag] = if fFlagLuaAppHomePageFirstImageLoadObserver then "observed-image" else nil,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = if fFlagSduiTileThumbnailPadding and p6.thumbnailPadding ~= nil then UDim2.new(1, p6.thumbnailPadding * -2, 1 / var14, 0) else UDim2.new(1, 0, 1 / var14, 0),
			ZIndex = -1,
			LayoutOrder = 1,
			ClipsDescendants = if isContained then true else nil,
			SizeConstraint = Enum.SizeConstraint.RelativeXX
		}, {
			BackgroundImage = if p6.backgroundImageComponent then p6.backgroundImageComponent elseif p6.backgroundImage then reactModule.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				ZIndex = -3,
				Size = UDim2.new(1, 0, 1, 0),
				Image = p6.backgroundImage
			}, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, cornerRadius) })
			}) else nil,
			Thumbnail = var39 or (if p6.imageComponent then p6.imageComponent elseif p6.image then if fFlagLuaAppSduiVideoThumbnail then reactModule.createElement(sduiDefaultTileImageModule, {
				image = p6.image,
				thumbnailBackgroundStyle = p6.thumbnailBackgroundStyle,
				isContained = isContained,
				cardCornerRadius = cornerRadius,
				onTileImageLoaded = p6.onTileImageLoaded
			}) else reactModule.createElement(loadableImage, {
				showFailedStateWhenLoadingFailed = true,
				useShimmerAnimationWhileLoading = true,
				ZIndex = -2,
				BackgroundColor3 = if p6.thumbnailBackgroundStyle then p6.thumbnailBackgroundStyle.Color3 else nil,
				BackgroundTransparency = if p6.thumbnailBackgroundStyle then p6.thumbnailBackgroundStyle.Transparency else 1,
				Image = p6.image,
				Size = UDim2.new(1, 0, 1, if isContained then cornerRadius else 0),
				cornerRadius = UDim.new(0, cornerRadius),
				ScaleType = if isContained then Enum.ScaleType.Tile else nil,
				TileSize = if isContained then UDim2.new(1, 0, 1, -cornerRadius) else nil,
				onLoaded = if fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then p6.onTileImageLoaded else nil
			}) else nil),
			UIAspectRatioConstraint = reactModule.createElement("UIAspectRatioConstraint", { AspectRatio = var14 or 1 }),
			ThumbnailOverlay = p6.thumbnailOverlayComponent,
			HoverOverlay = if var28 and (not fFlagSduiTileBottomButton or not var20) then reactModule.createElement("Frame", {
				BackgroundColor3 = var13.Color.State.Hover.Color3,
				BackgroundTransparency = var13.Color.State.Hover.Transparency,
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
			UIPadding = if isContained and not var19 then reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, containmentPadding),
				PaddingRight = UDim.new(0, containmentPadding),
				PaddingBottom = UDim.new(0, containmentPadding)
			}) else nil,
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.Name,
				HorizontalFlex = Enum.UIFlexAlignment.Fill
			}),
			["1_Title"] = if p6.titleComponent then p6.titleComponent elseif p6.titleText and p6.titleText ~= "" then reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, ceiled),
				Text = p6.titleText,
				Font = titleFont.Font,
				TextSize = titleFont.FontSize,
				TextTransparency = emphasis.Transparency,
				TextColor3 = emphasis.Color3,
				TextWrapped = titleLines > 1,
				TextTruncate = Enum.TextTruncate.SplitWord,
				TextXAlignment = if fFlagSduiTileTitleTextAlignment then p6.titleTextXAlignment or Enum.TextXAlignment.Left else Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				AutomaticSize = if var19 then Enum.AutomaticSize.X else nil
			}) else nil,
			["2_Footer"] = if p6.footerComponent then p6.footerComponent else nil,
			["3_BottomButton"] = if fFlagSduiTileBottomButton and p6.bottomButtonComponent then reactModule.createElement("Frame", {
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 0),
				[reactModule.Event.MouseEnter] = function()
					-- upvalues: var21 (write)
					if var21 then
						var21(true)
					end
				end,
				[reactModule.Event.MouseLeave] = function()
					-- upvalues: var21 (write)
					if var21 then
						var21(false)
					end
				end
			}, {
				UIPadding = reactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, p6.bottomButtonGap or var13.Gap.Small)
				}),
				Content = p6.bottomButtonComponent
			}) else nil,
			Z_3_ExtraOverflow = if fFlagSduiTileDisableLegacyHover then nil elseif var34 and p6.renderLegacyHoverState then reactModule.createElement("Frame", { ZIndex = -1, Size = UDim2.new(1, 0, 0, 0) }, {
				ExtraOverflow = p6.renderLegacyHoverState(containmentPadding_1, var24, cornerRadius)
			}) else nil
		}, p6.ctaButtonComponent, var13.Gap.Small, if isContained then containmentPadding else 0, var34))
	}
	
	if p6.focusNavActionsComponent or p6.children then
		var43 = reactModule.createElement
		var43 = var43(reactModule.Fragment, nil, cryoModule.Dictionary.join(p6.children or t, { focusNavActions = p6.focusNavActionsComponent }))
	else
		var43 = nil
	end
	t_2.ExtraChildren = var43
	t_2.HoldDetector = if var33 and var33.holdDetectorProps then reactModule.createElement(holdDetector, var33.holdDetectorProps) else nil
	
	return createElement(var40, t_1, t_2)
end)