local ContentProvider = game:GetService("ContentProvider")
local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local GetInputModeStoreFunction = ResponsiveModule.GetInputModeStore
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local UIBloxModule = require(Parent.UIBlox)
local CryoModule = require(Parent.Cryo)
local LoadableImage = UIBloxModule.App.Loading.LoadableImage
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local TextSizeModule = require(Parent.TextSize)
local _ = require(Parent.SduiCoreSystem)
local HoldDetector = require(Parent.HoldToPlay).HoldDetector
local UseTileHoldActionModule = require(script.Parent.useTileHoldAction)
local FFlagSduiTileDisableLegacyHover = require(ServerDrivenUi.Flags).FFlagSduiTileDisableLegacyHover
local FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone = require(Parent.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone
local FFlagLuaAppHomePageFirstImageLoadObserver = require(Parent.SharedFlags).FFlagLuaAppHomePageFirstImageLoadObserver
local FFlagSduiTileBottomButton = require(Parent.SharedFlags).FFlagSduiTileBottomButton
local FFlagSduiTileHoldAction = require(Parent.SharedFlags).FFlagSduiTileHoldAction
local FFlagSduiExperienceDetailsSupport = require(Parent.SharedFlags).FFlagSduiExperienceDetailsSupport
local FFlagSduiTileTitleTextAlignment = require(Parent.SharedFlags).FFlagSduiTileTitleTextAlignment
local FFlagSduiTileImagePaddingInset = require(Parent.SharedFlags).FFlagSduiTileImagePaddingInset
local SduiTileInsetImageModule = require(script.Parent.SduiTileInsetImage)
local t = {}

local function maybeLayoutForButton(p1, RightContent, Small, Offset: number, p2)
	-- upvalues: ReactModule (copy), CryoModule (copy)
	return if RightContent == nil or p2 then p1 else {
		Content = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				HorizontalFlex = Enum.UIFlexAlignment.None,
				SortOrder = Enum.SortOrder.Name,
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, Small or 0),
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Bottom
			}),
			UIPadding = if Offset > 0 then ReactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, Offset),
				PaddingRight = UDim.new(0, Offset),
				PaddingBottom = UDim.new(0, Offset)
			}) else nil,
			LeftContent = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(0, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.XY
			}, CryoModule.Dictionary.join({
				UIFlexItem = ReactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Shrink })
			}, p1)),
			RightContent = RightContent
		})
	}
end

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), ContentProvider (copy), TextSizeModule (copy), UseTokensFunction (copy), FFlagSduiTileBottomButton (copy), FFlagSduiExperienceDetailsSupport (copy), GetInputModeStoreFunction (copy), ResponsiveModule (copy), FFlagSduiTileHoldAction (copy), UseTileHoldActionModule (copy), FFlagSduiTileDisableLegacyHover (copy), FFlagSduiTileImagePaddingInset (copy), SduiTileInsetImageModule (copy), FFlagLuaAppHomePageFirstImageLoadObserver (copy), ImageSetLabel (copy), LoadableImage (copy), FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (copy), maybeLayoutForButton (copy), FFlagSduiTileTitleTextAlignment (copy), CryoModule (copy), t (copy), HoldDetector (copy)
	local LayoutOrder = p1.layoutOrder
	local AnchorPoint = p1.anchorPoint
	local AutomaticSize = p1.automaticSize
	local Size = p1.size
	local ZIndex = p1.zIndex
	local Position = p1.position
	local BackgroundColor3 = p1.backgroundColor3
	local SelectionOrder = p1.selectionOrder
	ReactModule.useLayoutEffect(function()
		-- upvalues: p1 (copy), ContentProvider (upval)
		if p1.image then
			task.spawn(function()
				-- upvalues: ContentProvider (upval), p1 (upval)
				ContentProvider:PreloadAsync({ p1.image })
			end)
		end
	end, { p1.image })
	local TextSizeOffset = TextSizeModule.getTextSizeStore(false).getTextSizeOffset(false)
	local UseTokensResult = UseTokensFunction()
	local ImageAspectRatio = if p1.imageAspectRatio and p1.imageAspectRatio == 0 then 1 else p1.imageAspectRatio or 1
	local TitleLines = p1.titleLines or 1
	local CornerRadius = p1.cornerRadius or UseTokensResult.Radius.Medium
	local TitleFont = p1.titleFont or UseTokensResult.Typography.TitleMedium
	local Emphasis = UseTokensResult.Color.Content.Emphasis
	local Ceiled = math.ceil(TitleLines * (TitleFont.LineHeight * TitleFont.FontSize + TextSizeOffset))
	local HasCtaButtonComponent = p1.ctaButtonComponent ~= nil
	local v1 = nil
	local Callback = nil
	
	if FFlagSduiTileBottomButton then
		v1, Callback = ReactModule.useState(false)
	end
	local IsContained = p1.isContained
	local Surface100 = nil
	local BackgroundColor3_1 = nil
	
	if FFlagSduiExperienceDetailsSupport and p1.backgroundStyle ~= nil then
		Surface100 = p1.backgroundStyle
		BackgroundColor3_1 = Surface100.Color3
	else
		Surface100 = UseTokensResult.Color.Surface.Surface_100
		BackgroundColor3_1 = BackgroundColor3 or Surface100.Color3
	end
	local ContainmentPadding = p1.containmentPadding or UseTokensResult.Padding.Small
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1 = if p1.isHovered == nil then UseStateResult else p1.isHovered
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: GetInputModeStoreFunction (upval), ResponsiveModule (upval), UseStateResult2 (copy), p1 (copy)
		if GetInputModeStoreFunction(false).getLastInputType(false) == ResponsiveModule.Input.Pointer then
			UseStateResult2(true)
			
			if p1.onMouseEnter then
				p1.onMouseEnter()
				
				return
			end
			if p1.setCustomConditionState then
				p1.setCustomConditionState("hovered", true)
			end
		end
	end, { p1.onMouseEnter, p1.setCustomConditionState })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), p1 (copy)
		UseStateResult2(false)
		
		if p1.onMouseLeave then
			p1.onMouseLeave()
			
			return
		end
		if p1.setCustomConditionState then
			p1.setCustomConditionState("hovered", false)
		end
	end, { p1.onMouseLeave, p1.setCustomConditionState })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		if p1.onSelectionGained then
			p1.onSelectionGained()
			
			return
		end
		if p1.setCustomConditionState then
			p1.setCustomConditionState("selected", true)
		end
	end, { p1.onSelectionGained, p1.setCustomConditionState })
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		if p1.onSelectionLost then
			p1.onSelectionLost()
			
			return
		end
		if p1.setCustomConditionState then
			p1.setCustomConditionState("selected", false)
		end
	end, { p1.onSelectionLost, p1.setCustomConditionState })
	local UseTileHoldActionModuleResult = if FFlagSduiTileHoldAction then UseTileHoldActionModule(p1.holdActionConfig, p1.setGuiObject, p1.onActivated) else nil
	local v2 = nil
	local Offset = nil
	local v3 = nil
	local v4 = nil
	
	if not FFlagSduiTileDisableLegacyHover and p1.enableLegacyHoverState then
		v2 = UseStateResult1
		Offset = p1.containmentPadding or UseTokensResult.Padding.Medium
		v3 = if UseStateResult1 then UDim2.new(1, Offset * 2, 1, Offset * 2) else nil
		v4 = if UseStateResult1 then UDim2.new(0, -Offset, 0, -Offset) else nil
	end
	local Transparency = if FFlagSduiExperienceDetailsSupport then Surface100.Transparency else 0
	local Element = if FFlagSduiTileImagePaddingInset and p1.imagePadding ~= nil then ReactModule.createElement(SduiTileInsetImageModule, {
		image = p1.image,
		imageComponent = p1.imageComponent,
		imagePadding = p1.imagePadding,
		imageCornerRadius = p1.imageCornerRadius or 1000,
		cardCornerRadius = CornerRadius,
		isContained = IsContained,
		backgroundStyle = p1.thumbnailBackgroundStyle
	}) else nil
	
	return ReactModule.createElement("TextButton", {
		[ReactModule.Tag] = if p1.testId then `data-testid={p1.testId}` else nil,
		ref = if UseTileHoldActionModuleResult then UseTileHoldActionModuleResult.tileRef else p1.setGuiObject,
		Size = v3 or (Size or UDim2.new(1, 0, 1, 0)),
		Position = v4 or Position,
		AnchorPoint = AnchorPoint,
		LayoutOrder = LayoutOrder,
		ZIndex = ZIndex,
		SelectionImageObject = p1.sduiContext.dependencies.cursors.tileCursor,
		Active = p1.isDisabled,
		[ReactModule.Event.Activated] = if UseTileHoldActionModuleResult then UseTileHoldActionModuleResult.onActivated else p1.onActivated,
		[ReactModule.Event.MouseEnter] = UseResult,
		[ReactModule.Event.MouseLeave] = UseResult1,
		[ReactModule.Event.SelectionGained] = UseResult2,
		[ReactModule.Event.SelectionLost] = UseResult3,
		ClipsDescendants = false,
		Text = "",
		TextTransparency = 1,
		BackgroundTransparency = if IsContained or v2 then Transparency else 1,
		AutoButtonColor = false,
		AutomaticSize = AutomaticSize or Enum.AutomaticSize.Y,
		BackgroundColor3 = BackgroundColor3_1,
		BorderSizePixel = 0,
		SelectionOrder = SelectionOrder
	}, {
		UIPadding = if FFlagSduiTileDisableLegacyHover then nil elseif v2 then ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, Offset),
			PaddingRight = UDim.new(0, Offset),
			PaddingTop = UDim.new(0, Offset)
		}) else nil,
		UICorner = if IsContained or not FFlagSduiTileDisableLegacyHover and v2 then ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, CornerRadius) }) else nil,
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, UseTokensResult.Gap.Medium)
		}),
		ImageFrame = ReactModule.createElement("Frame", {
			[ReactModule.Tag] = if FFlagLuaAppHomePageFirstImageLoadObserver then "observed-image" else nil,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1 / ImageAspectRatio, 0),
			ZIndex = -1,
			LayoutOrder = 1,
			ClipsDescendants = if IsContained then true else nil,
			SizeConstraint = Enum.SizeConstraint.RelativeXX
		}, {
			BackgroundImage = if p1.backgroundImageComponent then p1.backgroundImageComponent elseif p1.backgroundImage then ReactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				ZIndex = -3,
				Size = UDim2.new(1, 0, 1, 0),
				Image = p1.backgroundImage
			}, {
				UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, CornerRadius) })
			}) else nil,
			Thumbnail = if Element then Element elseif p1.imageComponent then p1.imageComponent elseif p1.image then ReactModule.createElement(LoadableImage, {
				showFailedStateWhenLoadingFailed = true,
				useShimmerAnimationWhileLoading = true,
				ZIndex = -2,
				BackgroundColor3 = p1.thumbnailBackgroundStyle and p1.thumbnailBackgroundStyle.Color3 or nil,
				BackgroundTransparency = p1.thumbnailBackgroundStyle and p1.thumbnailBackgroundStyle.Transparency or 1,
				Image = p1.image,
				Size = UDim2.new(1, 0, 1, if IsContained then CornerRadius else 0),
				cornerRadius = UDim.new(0, CornerRadius),
				ScaleType = if IsContained then Enum.ScaleType.Tile else nil,
				TileSize = if IsContained then UDim2.new(1, 0, 1, -CornerRadius) else nil,
				onLoaded = if FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then p1.onTileImageLoaded else nil
			}) else nil,
			UIAspectRatioConstraint = ReactModule.createElement("UIAspectRatioConstraint", { AspectRatio = ImageAspectRatio or 1 }),
			ThumbnailOverlay = p1.thumbnailOverlayComponent,
			HoverOverlay = if UseStateResult1 and (not FFlagSduiTileBottomButton or not v1) then ReactModule.createElement("Frame", {
				BackgroundColor3 = UseTokensResult.Color.State.Hover.Color3,
				BackgroundTransparency = UseTokensResult.Color.State.Hover.Transparency,
				Size = UDim2.new(1, 0, 1, if IsContained then CornerRadius else 0)
			}, {
				UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, CornerRadius) })
			}) else nil
		}),
		BottomContent = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 2,
			ZIndex = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0)
		}, (maybeLayoutForButton({
			UIPadding = if IsContained and not HasCtaButtonComponent then ReactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, ContainmentPadding),
				PaddingRight = UDim.new(0, ContainmentPadding),
				PaddingBottom = UDim.new(0, ContainmentPadding)
			}) else nil,
			UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.Name,
				HorizontalFlex = Enum.UIFlexAlignment.Fill
			}),
			["1_Title"] = if p1.titleComponent then p1.titleComponent elseif p1.titleText and p1.titleText ~= "" then ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, Ceiled),
				Text = p1.titleText,
				Font = TitleFont.Font,
				TextSize = TitleFont.FontSize,
				TextTransparency = Emphasis.Transparency,
				TextColor3 = Emphasis.Color3,
				TextWrapped = TitleLines > 1,
				TextTruncate = Enum.TextTruncate.SplitWord,
				TextXAlignment = FFlagSduiTileTitleTextAlignment and p1.titleTextXAlignment or Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				AutomaticSize = HasCtaButtonComponent and Enum.AutomaticSize.X or nil
			}) else nil,
			["2_Footer"] = if p1.footerComponent then p1.footerComponent else nil,
			["3_BottomButton"] = if FFlagSduiTileBottomButton and p1.bottomButtonComponent then ReactModule.createElement("Frame", {
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 0),
				[ReactModule.Event.MouseEnter] = function()
					-- upvalues: Callback (ref)
					if Callback then
						Callback(true)
					end
				end,
				[ReactModule.Event.MouseLeave] = function()
					-- upvalues: Callback (ref)
					if Callback then
						Callback(false)
					end
				end
			}, {
				UIPadding = ReactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, p1.bottomButtonGap or UseTokensResult.Gap.Small)
				}),
				Content = p1.bottomButtonComponent
			}) else nil,
			Z_3_ExtraOverflow = if FFlagSduiTileDisableLegacyHover then nil elseif v2 and p1.renderLegacyHoverState then ReactModule.createElement("Frame", { ZIndex = -1, Size = UDim2.new(1, 0, 0, 0) }, {
				ExtraOverflow = p1.renderLegacyHoverState(Offset, BackgroundColor3_1, CornerRadius)
			}) else nil
		}, p1.ctaButtonComponent, UseTokensResult.Gap.Small, if IsContained then ContainmentPadding else 0, v2))),
		ExtraChildren = if p1.focusNavActionsComponent or p1.children then ReactModule.createElement(ReactModule.Fragment, nil, CryoModule.Dictionary.join(p1.children or t, { focusNavActions = p1.focusNavActionsComponent })) else nil,
		HoldDetector = if UseTileHoldActionModuleResult and UseTileHoldActionModuleResult.holdDetectorProps then ReactModule.createElement(HoldDetector, UseTileHoldActionModuleResult.holdDetectorProps) else nil
	})
end)