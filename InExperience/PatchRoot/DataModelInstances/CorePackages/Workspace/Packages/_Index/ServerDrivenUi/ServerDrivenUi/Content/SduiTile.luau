local ContentProvider = game:GetService("ContentProvider")
local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local GetInputModeStoreFunction = ResponsiveModule.GetInputModeStore
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local UIBloxModule = require(Parent.UIBlox)
local CryoModule = require(Parent.Cryo)
local LoadableImage = UIBloxModule.App.Loading.LoadableImage
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local TextSizeModule = require(Parent.TextSize)
local _ = require(Parent.SduiCoreSystem)
local HoldDetector = require(Parent.HoldToPlay).HoldDetector
local SduiDefaultTileImageModule = require(script.Parent.SduiDefaultTileImage)
local UseTileHoldActionModule = require(script.Parent.useTileHoldAction)
local FFlagSduiTileDisableLegacyHover = require(ServerDrivenUi.Flags).FFlagSduiTileDisableLegacyHover
local FFlagLuaAppHomePageFirstImageLoadObserver = require(Parent.SharedFlags).FFlagLuaAppHomePageFirstImageLoadObserver
local FFlagSduiTileThumbnailPadding = require(Parent.SharedFlags).FFlagSduiTileThumbnailPadding
local FFlagLuaAppSduiVideoThumbnail = require(Parent.SharedFlags).FFlagLuaAppSduiVideoThumbnail
local FFlagLuaAppSduiGameTileFeedback = require(Parent.SharedFlags).FFlagLuaAppSduiGameTileFeedback
local SduiTileInsetImageModule = require(script.Parent.SduiTileInsetImage)
local t = {}

local function _(Text: string): boolean --[[ Line: 45 | Named "isRobloxContentUrl" ]]
	return string.match(Text, "^rbxthumb://") ~= nil or string.match(Text, "^rbxasset") ~= nil
end

local function maybeLayoutForButton(p1, RightContent, Small, Offset: number, p2) --[[ Line: 147 ]]
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

return ReactModule.memo(function(p1) --[[ Line: 200 | Named "SduiTile" ]]
	-- upvalues: ReactModule (copy), ContentProvider (copy), TextSizeModule (copy), UseTokensFunction (copy), GetInputModeStoreFunction (copy), ResponsiveModule (copy), UseTileHoldActionModule (copy), FFlagLuaAppSduiGameTileFeedback (copy), FFlagSduiTileDisableLegacyHover (copy), SduiTileInsetImageModule (copy), FFlagSduiTileThumbnailPadding (copy), FFlagLuaAppHomePageFirstImageLoadObserver (copy), ImageSetLabel (copy), FFlagLuaAppSduiVideoThumbnail (copy), SduiDefaultTileImageModule (copy), LoadableImage (copy), maybeLayoutForButton (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), CryoModule (copy), t (copy), HoldDetector (copy)
	local LayoutOrder = p1.layoutOrder
	local AnchorPoint = p1.anchorPoint
	local AutomaticSize = p1.automaticSize
	local Size = p1.size
	local ZIndex = p1.zIndex
	local Position = p1.position
	local BackgroundColor3 = p1.backgroundColor3
	local SelectionOrder = p1.selectionOrder
	ReactModule.useLayoutEffect(function() --[[ Line: 210 ]]
		-- upvalues: p1 (copy), ContentProvider (upval)
		local Image: string = p1.image
		
		if Image and (string.match(Image, "^rbxthumb://") ~= nil or string.match(Image, "^rbxasset") ~= nil) then
			task.spawn(function() --[[ Line: 213 ]]
				-- upvalues: ContentProvider (upval), Image (copy)
				ContentProvider:PreloadAsync({ Image })
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
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local IsContained = p1.isContained
	local BackgroundStyle = nil
	local BackgroundStyleColor3 = nil
	
	if p1.backgroundStyle == nil then
		BackgroundStyle = UseTokensResult.Color.Surface.Surface_100
		BackgroundStyleColor3 = BackgroundColor3 or BackgroundStyle.Color3
	else
		BackgroundStyle = p1.backgroundStyle
		BackgroundStyleColor3 = BackgroundStyle.Color3
	end
	local ContainmentPadding = p1.containmentPadding or UseTokensResult.Padding.Small
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3 = if p1.isHovered == nil then UseStateResult1 else p1.isHovered
	local UseResult = ReactModule.useCallback(function() --[[ Line: 257 ]]
		-- upvalues: GetInputModeStoreFunction (upval), ResponsiveModule (upval), UseStateResult2_1 (copy), p1 (copy)
		if GetInputModeStoreFunction(false).getLastInputType(false) == ResponsiveModule.Input.Pointer then
			UseStateResult2_1(true)
			
			if p1.onMouseEnter then
				p1.onMouseEnter()
				
				return
			end
			if p1.setCustomConditionState then
				p1.setCustomConditionState("hovered", true)
			end
		end
	end, { p1.onMouseEnter, p1.setCustomConditionState })
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 270 ]]
		-- upvalues: UseStateResult2_1 (copy), p1 (copy)
		UseStateResult2_1(false)
		
		if p1.onMouseLeave then
			p1.onMouseLeave()
			
			return
		end
		if p1.setCustomConditionState then
			p1.setCustomConditionState("hovered", false)
		end
	end, { p1.onMouseLeave, p1.setCustomConditionState })
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 279 ]]
		-- upvalues: p1 (copy)
		if p1.onSelectionGained then
			p1.onSelectionGained()
			
			return
		end
		if p1.setCustomConditionState then
			p1.setCustomConditionState("selected", true)
		end
	end, { p1.onSelectionGained, p1.setCustomConditionState })
	local UseResult3 = ReactModule.useCallback(function() --[[ Line: 287 ]]
		-- upvalues: p1 (copy)
		if p1.onSelectionLost then
			p1.onSelectionLost()
			
			return
		end
		if p1.setCustomConditionState then
			p1.setCustomConditionState("selected", false)
		end
	end, { p1.onSelectionLost, p1.setCustomConditionState })
	local UseTileHoldActionModuleResult = UseTileHoldActionModule(p1.holdActionConfig, p1.setGuiObject, p1.onActivated)
	local UseResult4 = nil
	local UseResult5 = nil
	local UseResult6 = nil
	
	if FFlagLuaAppSduiGameTileFeedback then
		local UseRefResult = ReactModule.useRef(false)
		UseResult4 = ReactModule.useCallback(function(...) --[[ Line: 303 ]]
			-- upvalues: UseRefResult (copy), p1 (copy)
			UseRefResult.current = false
			
			if p1.onGuiStateChanged then
				p1.onGuiStateChanged(...)
			end
		end, { p1.onGuiStateChanged })
		UseResult6 = ReactModule.useCallback(function() --[[ Line: 311 ]]
			-- upvalues: UseRefResult (copy), UseTileHoldActionModuleResult (copy), p1 (copy)
			if UseRefResult.current then
				UseRefResult.current = false
				
				return
			end
			if UseTileHoldActionModuleResult then
				UseTileHoldActionModuleResult.onActivated()
				
				return
			end
			if p1.onActivated then
				p1.onActivated()
			end
		end, { UseTileHoldActionModuleResult, p1.onActivated })
		UseResult5 = ReactModule.useCallback(function() --[[ Line: 324 ]]
			-- upvalues: p1 (copy), UseRefResult (copy)
			if p1.onTouchLongPress and not p1.isDisabled then
				UseRefResult.current = true
				
				if not UseRefResult.current then
					p1.onTouchLongPress()
				end
			end
		end, { p1.onTouchLongPress, p1.isDisabled })
	end
	local v1 = nil
	local Offset = nil
	local v2 = nil
	local v3 = nil
	
	if not FFlagSduiTileDisableLegacyHover and p1.enableLegacyHoverState then
		v1 = UseStateResult3
		Offset = p1.containmentPadding or UseTokensResult.Padding.Medium
		v2 = if UseStateResult3 then UDim2.new(1, Offset * 2, 1, Offset * 2) else nil
		v3 = if UseStateResult3 then UDim2.new(0, -Offset, 0, -Offset) else nil
	end
	local Transparency = BackgroundStyle.Transparency
	local Element = if p1.imagePadding == nil then nil else ReactModule.createElement(SduiTileInsetImageModule, {
		image = p1.image,
		imageComponent = p1.imageComponent,
		imagePadding = p1.imagePadding,
		imageCornerRadius = p1.imageCornerRadius or 1000,
		cardCornerRadius = CornerRadius,
		isContained = IsContained,
		backgroundStyle = p1.thumbnailBackgroundStyle
	})
	
	return ReactModule.createElement("TextButton", {
		[ReactModule.Tag] = if p1.testId then `data-testid={p1.testId}` else nil,
		ref = if UseTileHoldActionModuleResult then UseTileHoldActionModuleResult.tileRef else p1.setGuiObject,
		Size = v2 or (Size or UDim2.new(1, 0, 1, 0)),
		Position = v3 or Position,
		AnchorPoint = AnchorPoint,
		LayoutOrder = LayoutOrder,
		ZIndex = ZIndex,
		SelectionImageObject = p1.sduiContext.dependencies.cursors.tileCursor,
		Active = if FFlagLuaAppSduiGameTileFeedback then not p1.isDisabled else p1.isDisabled,
		Selectable = if FFlagLuaAppSduiGameTileFeedback then p1.selectable else nil,
		[ReactModule.Change.GuiState] = if FFlagLuaAppSduiGameTileFeedback then UseResult4 else p1.onGuiStateChanged,
		[ReactModule.Event.Activated] = if FFlagLuaAppSduiGameTileFeedback then UseResult6 elseif UseTileHoldActionModuleResult then UseTileHoldActionModuleResult.onActivated else p1.onActivated,
		[ReactModule.Event.MouseEnter] = UseResult,
		[ReactModule.Event.MouseLeave] = UseResult1,
		[ReactModule.Event.SelectionGained] = UseResult2,
		[ReactModule.Event.SelectionLost] = UseResult3,
		[ReactModule.Event.TouchLongPress] = if FFlagLuaAppSduiGameTileFeedback and p1.onTouchLongPress then UseResult5 else nil,
		ClipsDescendants = false,
		Text = "",
		TextTransparency = 1,
		BackgroundTransparency = if IsContained or v1 then Transparency else 1,
		AutoButtonColor = false,
		AutomaticSize = AutomaticSize or Enum.AutomaticSize.Y,
		BackgroundColor3 = BackgroundStyleColor3,
		BorderSizePixel = 0,
		SelectionOrder = SelectionOrder
	}, {
		UIPadding = if FFlagSduiTileDisableLegacyHover then nil elseif v1 then ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, Offset),
			PaddingRight = UDim.new(0, Offset),
			PaddingTop = UDim.new(0, Offset)
		}) else nil,
		UICorner = if IsContained or not FFlagSduiTileDisableLegacyHover and v1 then ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, CornerRadius) }) else nil,
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, UseTokensResult.Gap.Medium),
			HorizontalAlignment = if FFlagSduiTileThumbnailPadding then Enum.HorizontalAlignment.Center else nil
		}),
		ImageFrame = ReactModule.createElement("Frame", {
			[ReactModule.Tag] = if FFlagLuaAppHomePageFirstImageLoadObserver then "observed-image" else nil,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = if FFlagSduiTileThumbnailPadding and p1.thumbnailPadding ~= nil then UDim2.new(1, p1.thumbnailPadding * -2, 1 / ImageAspectRatio, 0) else UDim2.new(1, 0, 1 / ImageAspectRatio, 0),
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
			Thumbnail = if Element then Element elseif p1.imageComponent then p1.imageComponent elseif p1.image then if FFlagLuaAppSduiVideoThumbnail then ReactModule.createElement(SduiDefaultTileImageModule, {
				image = p1.image,
				thumbnailBackgroundStyle = p1.thumbnailBackgroundStyle,
				isContained = IsContained,
				cardCornerRadius = CornerRadius
			}) else ReactModule.createElement(LoadableImage, {
				showFailedStateWhenLoadingFailed = true,
				useShimmerAnimationWhileLoading = true,
				ZIndex = -2,
				BackgroundColor3 = p1.thumbnailBackgroundStyle and p1.thumbnailBackgroundStyle.Color3 or nil,
				BackgroundTransparency = p1.thumbnailBackgroundStyle and p1.thumbnailBackgroundStyle.Transparency or 1,
				Image = p1.image,
				Size = UDim2.new(1, 0, 1, if IsContained then CornerRadius else 0),
				cornerRadius = UDim.new(0, CornerRadius),
				ScaleType = if IsContained then Enum.ScaleType.Tile else nil,
				TileSize = if IsContained then UDim2.new(1, 0, 1, -CornerRadius) else nil
			}) else nil,
			UIAspectRatioConstraint = ReactModule.createElement("UIAspectRatioConstraint", { AspectRatio = ImageAspectRatio or 1 }),
			ThumbnailOverlay = p1.thumbnailOverlayComponent,
			OverflowMenu = if FFlagLuaAppSduiGameTileFeedback then p1.thumbnailOverflowMenuComponent else nil,
			HoverOverlay = if UseStateResult3 and not UseStateResult then ReactModule.createElement("Frame", {
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
				Font = if FoundationFontFaceMigration then nil else TitleFont.Font,
				FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(TitleFont.Font) else nil,
				TextSize = TitleFont.FontSize,
				TextTransparency = Emphasis.Transparency,
				TextColor3 = Emphasis.Color3,
				TextWrapped = TitleLines > 1,
				TextTruncate = Enum.TextTruncate.SplitWord,
				TextXAlignment = p1.titleTextXAlignment or Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				AutomaticSize = HasCtaButtonComponent and Enum.AutomaticSize.X or nil
			}) else nil,
			["2_Footer"] = if p1.footerComponent then p1.footerComponent else nil,
			["3_BottomButton"] = if p1.bottomButtonComponent then ReactModule.createElement("Frame", {
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 0),
				[ReactModule.Event.MouseEnter] = function() --[[ Line: 546 ]]
					-- upvalues: UseStateResult2 (copy)
					if UseStateResult2 then
						UseStateResult2(true)
					end
				end,
				[ReactModule.Event.MouseLeave] = function() --[[ Line: 551 ]]
					-- upvalues: UseStateResult2 (copy)
					if UseStateResult2 then
						UseStateResult2(false)
					end
				end
			}, {
				UIPadding = ReactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, p1.bottomButtonGap or UseTokensResult.Gap.Small)
				}),
				Content = p1.bottomButtonComponent
			}) else nil,
			Z_3_ExtraOverflow = if FFlagSduiTileDisableLegacyHover then nil elseif v1 and p1.renderLegacyHoverState then ReactModule.createElement("Frame", { ZIndex = -1, Size = UDim2.new(1, 0, 0, 0) }, {
				ExtraOverflow = p1.renderLegacyHoverState(Offset, BackgroundStyleColor3, CornerRadius)
			}) else nil
		}, p1.ctaButtonComponent, UseTokensResult.Gap.Small, if IsContained then ContainmentPadding else 0, v1))),
		ExtraChildren = if p1.focusNavActionsComponent or p1.children then ReactModule.createElement(ReactModule.Fragment, nil, CryoModule.Dictionary.join(p1.children or t, { focusNavActions = p1.focusNavActionsComponent })) else nil,
		HoldDetector = if UseTileHoldActionModuleResult and UseTileHoldActionModuleResult.holdDetectorProps then ReactModule.createElement(HoldDetector, UseTileHoldActionModuleResult.holdDetectorProps) else nil
	})
end)