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
local useTileHoldActionModule = require(script.Parent.useTileHoldAction)
local fFlagSduiTileDisableLegacyHover = require(serverDrivenUi.Flags).FFlagSduiTileDisableLegacyHover
local fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone = require(parent.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone
local fFlagLuaAppHomePageFirstImageLoadObserver = require(parent.SharedFlags).FFlagLuaAppHomePageFirstImageLoadObserver
local fFlagSduiTileBottomButton = require(parent.SharedFlags).FFlagSduiTileBottomButton
local fFlagSduiTileHoldAction = require(parent.SharedFlags).FFlagSduiTileHoldAction
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport
local fFlagSduiTileTitleTextAlignment = require(parent.SharedFlags).FFlagSduiTileTitleTextAlignment
local fFlagSduiTileImagePaddingInset = require(parent.SharedFlags).FFlagSduiTileImagePaddingInset
local sduiTileInsetImageModule = require(script.Parent.SduiTileInsetImage)
local t = {}

local function maybeLayoutForButton(p0, p1, p2, p3, p4) --[[ line: 137 ]]
	-- upvalues: reactModule (ref), cryoModule (ref)
	return if p1 == nil or p4 then p0 else {
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
				Padding = UDim.new(0, p2 or 0),
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Bottom
			}),
			UIPadding = if p3 > 0 then reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, p3),
				PaddingRight = UDim.new(0, p3),
				PaddingBottom = UDim.new(0, p3)
			}) else nil,
			LeftContent = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(0, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.XY
			}, cryoModule.Dictionary.join({
				UIFlexItem = reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Shrink })
			}, p0)),
			RightContent = p1
		})
	}
end

return reactModule.memo(function(p5) --[[ line: 190 | named "SduiTile" ]]
	-- upvalues: reactModule (ref), contentProviderService (ref), textSizeModule (ref), useTokens (ref), fFlagSduiTileBottomButton (ref), fFlagSduiExperienceDetailsSupport (ref), getInputModeStore (ref), responsiveModule (ref), fFlagSduiTileHoldAction (ref), useTileHoldActionModule (ref), fFlagSduiTileDisableLegacyHover (ref), fFlagSduiTileImagePaddingInset (ref), sduiTileInsetImageModule (ref), fFlagLuaAppHomePageFirstImageLoadObserver (ref), imageSetLabel (ref), loadableImage (ref), fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (ref), maybeLayoutForButton (ref), fFlagSduiTileTitleTextAlignment (ref), cryoModule (ref), t (ref), holdDetector (ref)
	local layoutOrder = p5.layoutOrder
	local anchorPoint = p5.anchorPoint
	local automaticSize = p5.automaticSize
	local size = p5.size
	local zIndex = p5.zIndex
	local position = p5.position
	local backgroundColor3 = p5.backgroundColor3
	local selectionOrder = p5.selectionOrder
	reactModule.useLayoutEffect(function() --[[ line: 200 ]]
		-- upvalues: p5 (ref), contentProviderService (copy)
		if p5.image then
			task.spawn(function() --[[ line: 202 ]]
				-- upvalues: contentProviderService (copy), p5 (copy)
				contentProviderService:PreloadAsync({ p5.image })
			end)
		end
	end, { p5.image })
	local textSizeOffset = textSizeModule.getTextSizeStore(false).getTextSizeOffset(false)
	local var12 = useTokens()
	local var13 = if p5.imageAspectRatio and p5.imageAspectRatio == 0 then 1 else p5.imageAspectRatio or 1
	local titleLines = p5.titleLines or 1
	local cornerRadius = p5.cornerRadius or var12.Radius.Medium
	local titleFont = p5.titleFont or var12.Typography.TitleMedium
	local emphasis = var12.Color.Content.Emphasis
	local ceiled = math.ceil(titleLines * (titleFont.LineHeight * titleFont.FontSize + textSizeOffset))
	local var18 = p5.ctaButtonComponent ~= nil
	local var19 = nil
	local var20 = nil
	
	if fFlagSduiTileBottomButton then
		local var21, var22 = reactModule.useState(false)
		var19 = var21
		var20 = var22
	end
	local surface100, var23
	local isContained = p5.isContained
	local _ = nil
	local _ = nil
	
	if fFlagSduiExperienceDetailsSupport and p5.backgroundStyle ~= nil then
		surface100 = p5.backgroundStyle
		var23 = surface100.Color3
	else
		surface100 = var12.Color.Surface.Surface_100
		var23 = backgroundColor3 or surface100.Color3
	end
	local containmentPadding = p5.containmentPadding or var12.Padding.Small
	local var25, var26 = reactModule.useState(false)
	local var27 = if p5.isHovered ~= nil then var25 else p5.isHovered
	local var28 = reactModule.useCallback(function() --[[ line: 249 ]]
		-- upvalues: getInputModeStore (copy), responsiveModule (copy), var26 (ref), p5 (ref)
		if getInputModeStore(false).getLastInputType(false) == responsiveModule.Input.Pointer then
			var26(true)
			
			if p5.onMouseEnter then
				p5.onMouseEnter()
				
				return
			elseif p5.setCustomConditionState then
				p5.setCustomConditionState("hovered", true)
			end
		end
	end, { p5.onMouseEnter, p5.setCustomConditionState })
	local var29 = reactModule.useCallback(function() --[[ line: 262 ]]
		-- upvalues: var26 (ref), p5 (ref)
		var26(false)
		
		if p5.onMouseLeave then
			p5.onMouseLeave()
			
			return
		elseif p5.setCustomConditionState then
			p5.setCustomConditionState("hovered", false)
		end
	end, { p5.onMouseLeave, p5.setCustomConditionState })
	local var30 = reactModule.useCallback(function() --[[ line: 271 ]]
		-- upvalues: p5 (ref)
		if p5.onSelectionGained then
			p5.onSelectionGained()
			
			return
		elseif p5.setCustomConditionState then
			p5.setCustomConditionState("selected", true)
		end
	end, { p5.onSelectionGained, p5.setCustomConditionState })
	local var31 = reactModule.useCallback(function() --[[ line: 279 ]]
		-- upvalues: p5 (ref)
		if p5.onSelectionLost then
			p5.onSelectionLost()
			
			return
		elseif p5.setCustomConditionState then
			p5.setCustomConditionState("selected", false)
		end
	end, { p5.onSelectionLost, p5.setCustomConditionState })
	local var32 = if fFlagSduiTileHoldAction then useTileHoldActionModule(p5.holdActionConfig, p5.setGuiObject, p5.onActivated) else nil
	local var33 = nil
	local containmentPadding_1 = nil
	local var35 = nil
	local var36 = nil
	
	if not fFlagSduiTileDisableLegacyHover and p5.enableLegacyHoverState then
		var33 = var27
		containmentPadding_1 = p5.containmentPadding or var12.Padding.Medium
		var35 = if var27 then UDim2.new(1, containmentPadding_1 * 2, 1, containmentPadding_1 * 2) else nil
		var36 = if var27 then UDim2.new(0, -containmentPadding_1, 0, -containmentPadding_1) else nil
	end
	local var42
	local var37 = if fFlagSduiExperienceDetailsSupport then surface100.Transparency else 0
	local var38 = if fFlagSduiTileImagePaddingInset and p5.imagePadding ~= nil then reactModule.createElement(sduiTileInsetImageModule, {
		image = p5.image,
		imageComponent = p5.imageComponent,
		imagePadding = p5.imagePadding,
		imageCornerRadius = p5.imageCornerRadius or 1000,
		cardCornerRadius = cornerRadius,
		isContained = isContained,
		backgroundStyle = p5.thumbnailBackgroundStyle
	}) else nil
	local createElement = reactModule.createElement
	local var39 = "TextButton"
	local t_1 = {
		[reactModule.Tag] = if p5.testId then `data-testid={p5.testId}` else nil,
		ref = if var32 then var32.tileRef else p5.setGuiObject,
		Size = var35 or (size or UDim2.new(1, 0, 1, 0)),
		Position = var36 or position,
		AnchorPoint = anchorPoint,
		LayoutOrder = layoutOrder,
		ZIndex = zIndex,
		SelectionImageObject = p5.sduiContext.dependencies.cursors.tileCursor,
		Active = p5.isDisabled,
		[reactModule.Event.Activated] = if var32 then var32.onActivated else p5.onActivated,
		[reactModule.Event.MouseEnter] = var28,
		[reactModule.Event.MouseLeave] = var29,
		[reactModule.Event.SelectionGained] = var30,
		[reactModule.Event.SelectionLost] = var31,
		ClipsDescendants = false,
		Text = "",
		TextTransparency = 1,
		BackgroundTransparency = if isContained or var33 then var37 else 1,
		AutoButtonColor = false,
		AutomaticSize = automaticSize or Enum.AutomaticSize.Y,
		BackgroundColor3 = var23,
		BorderSizePixel = 0,
		SelectionOrder = selectionOrder
	}
	local t_2 = {
		UIPadding = if fFlagSduiTileDisableLegacyHover then nil elseif var33 then reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, containmentPadding_1),
			PaddingRight = UDim.new(0, containmentPadding_1),
			PaddingTop = UDim.new(0, containmentPadding_1)
		}) else nil,
		UICorner = if isContained or not fFlagSduiTileDisableLegacyHover and var33 then reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, cornerRadius) }) else nil,
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, var12.Gap.Medium)
		}),
		ImageFrame = reactModule.createElement("Frame", {
			[reactModule.Tag] = if fFlagLuaAppHomePageFirstImageLoadObserver then "observed-image" else nil,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1 / var13, 0),
			ZIndex = -1,
			LayoutOrder = 1,
			ClipsDescendants = if isContained then true else nil,
			SizeConstraint = Enum.SizeConstraint.RelativeXX
		}, {
			BackgroundImage = if p5.backgroundImageComponent then p5.backgroundImageComponent elseif p5.backgroundImage then reactModule.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				ZIndex = -3,
				Size = UDim2.new(1, 0, 1, 0),
				Image = p5.backgroundImage
			}, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, cornerRadius) })
			}) else nil,
			Thumbnail = var38 or (if p5.imageComponent then p5.imageComponent elseif p5.image then reactModule.createElement(loadableImage, {
				showFailedStateWhenLoadingFailed = true,
				useShimmerAnimationWhileLoading = true,
				ZIndex = -2,
				BackgroundColor3 = if p5.thumbnailBackgroundStyle then p5.thumbnailBackgroundStyle.Color3 else nil,
				BackgroundTransparency = if p5.thumbnailBackgroundStyle then p5.thumbnailBackgroundStyle.Transparency else 1,
				Image = p5.image,
				Size = UDim2.new(1, 0, 1, if isContained then cornerRadius else 0),
				cornerRadius = UDim.new(0, cornerRadius),
				ScaleType = if isContained then Enum.ScaleType.Tile else nil,
				TileSize = if isContained then UDim2.new(1, 0, 1, -cornerRadius) else nil,
				onLoaded = if fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then p5.onTileImageLoaded else nil
			}) else nil),
			UIAspectRatioConstraint = reactModule.createElement("UIAspectRatioConstraint", { AspectRatio = var13 or 1 }),
			ThumbnailOverlay = p5.thumbnailOverlayComponent,
			HoverOverlay = if var27 and (not fFlagSduiTileBottomButton or not var19) then reactModule.createElement("Frame", {
				BackgroundColor3 = var12.Color.State.Hover.Color3,
				BackgroundTransparency = var12.Color.State.Hover.Transparency,
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
			UIPadding = if isContained and not var18 then reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, containmentPadding),
				PaddingRight = UDim.new(0, containmentPadding),
				PaddingBottom = UDim.new(0, containmentPadding)
			}) else nil,
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.Name,
				HorizontalFlex = Enum.UIFlexAlignment.Fill
			}),
			["1_Title"] = if p5.titleComponent then p5.titleComponent elseif p5.titleText and p5.titleText ~= "" then reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, ceiled),
				Text = p5.titleText,
				Font = titleFont.Font,
				TextSize = titleFont.FontSize,
				TextTransparency = emphasis.Transparency,
				TextColor3 = emphasis.Color3,
				TextWrapped = titleLines > 1,
				TextTruncate = Enum.TextTruncate.SplitWord,
				TextXAlignment = if fFlagSduiTileTitleTextAlignment then p5.titleTextXAlignment or Enum.TextXAlignment.Left else Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				AutomaticSize = if var18 then Enum.AutomaticSize.X else nil
			}) else nil,
			["2_Footer"] = if p5.footerComponent then p5.footerComponent else nil,
			["3_BottomButton"] = if fFlagSduiTileBottomButton and p5.bottomButtonComponent then reactModule.createElement("Frame", {
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 0),
				[reactModule.Event.MouseEnter] = function() --[[ line: 485 ]]
					-- upvalues: var20 (write)
					if var20 then
						var20(true)
					end
				end,
				[reactModule.Event.MouseLeave] = function() --[[ line: 490 ]]
					-- upvalues: var20 (write)
					if var20 then
						var20(false)
					end
				end
			}, {
				UIPadding = reactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, p5.bottomButtonGap or var12.Gap.Small)
				}),
				Content = p5.bottomButtonComponent
			}) else nil,
			Z_3_ExtraOverflow = if fFlagSduiTileDisableLegacyHover then nil elseif var33 and p5.renderLegacyHoverState then reactModule.createElement("Frame", { ZIndex = -1, Size = UDim2.new(1, 0, 0, 0) }, {
				ExtraOverflow = p5.renderLegacyHoverState(containmentPadding_1, var23, cornerRadius)
			}) else nil
		}, p5.ctaButtonComponent, var12.Gap.Small, if isContained then containmentPadding else 0, var33))
	}
	
	if p5.focusNavActionsComponent or p5.children then
		var42 = reactModule.createElement
		var42 = var42(reactModule.Fragment, nil, cryoModule.Dictionary.join(p5.children or t, { focusNavActions = p5.focusNavActionsComponent }))
	else
		var42 = nil
	end
	t_2.ExtraChildren = var42
	t_2.HoldDetector = if var32 and var32.holdDetectorProps then reactModule.createElement(holdDetector, var32.holdDetectorProps) else nil
	
	return createElement(var39, t_1, t_2)
end)