local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local GetInputModeStoreFunction = ResponsiveModule.GetInputModeStore
local FoundationModule = require(Parent.Foundation)
local CryoModule = require(Parent.Cryo)
local DiscoveryAnalyticsModule = require(Parent.DiscoveryAnalytics)
local LocalizeStringsFunction = require(Parent.Localization).localizeStrings
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UsePreferencesFunction = FoundationModule.Hooks.usePreferences
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiBuilder = SduiCoreSystemModule.SduiBuilder
local SduiErrors = SduiCoreSystemModule.SduiErrors
local SduiPlayButton = require(Parent.SduiSharedContent).SduiPlayButton
local SduiParsers = SduiCoreSystemModule.SduiParsers
local SduiParseHelpers = SduiCoreSystemModule.SduiParseHelpers
local UseUidRefStringFunction = SduiCoreSystemModule.useUidRefString
local GameTileModule = require(Parent.GameTile)
local Default = GameTileModule.HoverTileCoordinator.default
local ZoomAnimatedFrame = GameTileModule.ZoomAnimatedFrame
local SduiTileModule = require(ServerDrivenUi.Content.SduiTile)
local TileHoverShadowModule = require(ServerDrivenUi.Content.TileHoverShadow)
local SduiGameTileFooterModule = require(ServerDrivenUi.Content.SduiGameTileFooter)
local SduiHoldToPlayModule = require(ServerDrivenUi.FocusNavigation.SduiHoldToPlay)
local FFlagSduiTileDisableLegacyHover = require(ServerDrivenUi.Flags).FFlagSduiTileDisableLegacyHover
local FFlagLuaAppResetHoverOnSduiPlayButtonActivation = require(Parent.SharedFlags).FFlagLuaAppResetHoverOnSduiPlayButtonActivation
local FFlagLuaAppSduiGameTileHoverShadow = require(Parent.SharedFlags).FFlagLuaAppSduiGameTileHoverShadow
local FFlagLuaAppSduiGameTilePlayButtonDefaults = require(Parent.SharedFlags).FFlagLuaAppSduiGameTilePlayButtonDefaults

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), UsePreferencesFunction (copy), FFlagSduiTileDisableLegacyHover (copy), FFlagLuaAppSduiGameTileHoverShadow (copy), ReactModule (copy), UseUidRefStringFunction (copy), SduiErrors (copy), GetInputModeStoreFunction (copy), SduiParseHelpers (copy), SduiParsers (copy), SduiActionType (copy), Default (copy), ResponsiveModule (copy), FFlagLuaAppResetHoverOnSduiPlayButtonActivation (copy), SduiBuilder (copy), SduiPlayButton (copy), FFlagLuaAppSduiGameTilePlayButtonDefaults (copy), LocalizeStringsFunction (copy), DiscoveryAnalyticsModule (copy), SduiHoldToPlayModule (copy), SduiGameTileFooterModule (copy), SduiTileModule (copy), CryoModule (copy), ZoomAnimatedFrame (copy), TileHoverShadowModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UsePreferencesResult = UsePreferencesFunction()
	local EnableLegacyHoverState = not FFlagSduiTileDisableLegacyHover and p1.enableLegacyHoverState
	local UseRefResult = if FFlagLuaAppSduiGameTileHoverShadow then ReactModule.useRef(nil) else nil
	local Current = UseUidRefStringFunction().current
	local UniverseId = p1.universeId
	local PlaceId = p1.placeId
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult1 (copy), p1 (copy)
		UseRefResult1.current = Current
		
		if p1.setGuiObject then
			p1.setGuiObject(Current)
		end
	end, { p1.setGuiObject })
	local UseRefResult2 = ReactModule.useRef(false)
	local UseResult1 = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult2 (copy)
		UseRefResult2.current = Current
	end, {})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), SduiErrors (upval), GetInputModeStoreFunction (upval), SduiParseHelpers (upval), UseRefResult2 (copy), SduiParsers (upval), SduiActionType (upval), PlaceId (copy), UniverseId (copy)
		p1.sduiContext.dependencies.logger.reportCounter(SduiErrors.SduiCounterName.GameTileActivated, {
			name = GetInputModeStoreFunction(false).getLastInputType(false)
		}, true)
		
		local function logFailure(p2)
			-- upvalues: SduiParseHelpers (upval), p1 (upval), SduiErrors (upval), GetInputModeStoreFunction (upval)
			p1.sduiContext.dependencies.logger.reportError(SduiErrors.SduiErrorType.FailedToExecuteAction, {
				componentType = "GameTile",
				message = `Error executing GameTile.onActivated error: '{if p3 then SduiParseHelpers.stringifyValue(p3) else ""}' config: {SduiParseHelpers.stringifyValue(p1.componentConfig)}`,
				name = GetInputModeStoreFunction(false).getLastInputType(false)
			}, p1.sduiContext.appPage)
		end
		
		local Success, Result = pcall(function()
			-- upvalues: UseRefResult2 (upval), p1 (upval), SduiParsers (upval), SduiActionType (upval), PlaceId (upval), UniverseId (upval), SduiErrors (upval), GetInputModeStoreFunction (upval), logFailure (copy)
			if UseRefResult2.current then
				p1.sduiContext.dependencies.logger.reportCounter(SduiErrors.SduiCounterName.GameTileActivatedWhenDisabled, {
					name = GetInputModeStoreFunction(false).getLastInputType(false)
				})
				
				return
			end
			if p1.onActivated then
				p1.onActivated()
				
				return
			end
			local SafeParseResult: () -> () = SduiParsers.safeParseCallback({
				actionType = SduiActionType.OpenGameDetails,
				actionParams = { placeId = PlaceId, universeId = UniverseId }
			}, p1.sduiContext, p1.analyticsContext)
			
			if SafeParseResult then
				p1.sduiContext.dependencies.logger.reportCounter(SduiErrors.SduiCounterName.GameTileActivatedExecuteCallback, {
					name = GetInputModeStoreFunction(false).getLastInputType(false)
				}, true)
				SafeParseResult()
				
				return
			else
				logFailure("Callback is nil after parsing")
			end
		end)
		
		if not Success then
			logFailure(Result)
		end
	end, {
		p1.onActivated, p1.sduiContext, p1.analyticsContext, PlaceId, UniverseId,
		p1.componentConfig
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), p1 (copy)
		UseStateResult2(true)
		
		if p1.setCustomConditionState then
			p1.setCustomConditionState("selected", true)
		end
	end, { p1.setCustomConditionState })
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), p1 (copy)
		UseStateResult2(false)
		
		if p1.setCustomConditionState then
			p1.setCustomConditionState("selected", false)
		end
	end, { p1.setCustomConditionState })
	local UseRefResult3 = ReactModule.useRef(0)
	
	if UseStateResult1 == false then
		UseRefResult3.current = 0
	end
	local Default1 = Default.default
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult3 (copy), Current (copy), GetInputModeStoreFunction (upval), ResponsiveModule (upval), Default1 (copy)
		if UseRefResult3.current == 0 and Current and GetInputModeStoreFunction(false).getLastInputType(false) == ResponsiveModule.Input.Pointer then
			Default1:requestHover(Current)
		end
		UseRefResult3.current += 1
	end, { Current })
	local UseResult6 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult3 (copy), Current (copy), Default1 (copy)
		UseRefResult3.current -= 1
		
		if UseRefResult3.current < 0 then
			UseRefResult3.current = 0
		end
		if UseRefResult3.current == 0 and Current then
			Default1:cancelHover(Current)
		end
	end, { Current })
	ReactModule.useEffect(function()
		-- upvalues: Current (copy), UseStateResult1 (copy), Default1 (copy), UseStateResult2_1 (copy), p1 (copy), UseRefResult3 (copy)
		local IsHovered = UseStateResult1
		local ChangedConnection = nil
		ChangedConnection = Default1.changed:connect(function(Current1)
			-- upvalues: Current (upval), UseStateResult2_1 (upval), p1 (upval), IsHovered (ref)
			local IsCurrentMatch = Current1 == Current
			UseStateResult2_1(IsCurrentMatch)
			
			if p1.setCustomConditionState and IsCurrentMatch ~= IsHovered then
				p1.setCustomConditionState("hovered", IsCurrentMatch)
			end
			IsHovered = IsCurrentMatch
		end)
		
		return function()
			-- upvalues: Default1 (upval), Current (copy), UseRefResult3 (upval), ChangedConnection (ref)
			Default1:cancelHover(Current)
			UseRefResult3.current = 0
			
			if ChangedConnection ~= nil then
				ChangedConnection:disconnect()
			end
		end
	end, { Current, p1.setCustomConditionState })
	local UseResult7 = if FFlagLuaAppResetHoverOnSduiPlayButtonActivation then ReactModule.useCallback(function()
		-- upvalues: UseStateResult1 (copy), Default1 (copy)
		if UseStateResult1 then
			Default1:reset()
		end
	end, { UseStateResult1 }) else nil
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), UseStateResult1 (copy), SduiBuilder (upval), UniverseId (copy), PlaceId (copy), FFlagSduiTileDisableLegacyHover (upval), ReactModule (upval), SduiPlayButton (upval), FFlagLuaAppResetHoverOnSduiPlayButtonActivation (upval), UseResult7 (copy), FFlagLuaAppSduiGameTilePlayButtonDefaults (upval), LocalizeStringsFunction (upval)
		if p1.ctaButtonComponent then
			return p1.ctaButtonComponent
		elseif UseStateResult1 then
			local AnalyticsContext = SduiBuilder.buildAnalyticsContext({}, p1.analyticsContext, {
				eventContext = "ExperienceTile",
				universeId = UniverseId,
				placeId = PlaceId,
				referralSource = p1.sduiContext.appPage
			})
			
			return if FFlagSduiTileDisableLegacyHover or not p1.enableLegacyHoverState then ReactModule.createElement(SduiPlayButton, {
				hidePlayableIcon = true,
				height = 40,
				buttonSize = "Medium",
				hideOptionalText = true,
				isPlayableWhenLoading = true,
				universeId = UniverseId,
				placeId = PlaceId,
				sduiContext = p1.sduiContext,
				playableText = LocalizeStringsFunction(p1.sduiContext.dependencies.localization, { Join = "Common.VisitGame.Label.Play" }).Join,
				width = UDim.new(0, 60),
				analyticsContext = AnalyticsContext,
				squadButtonHeight = UDim.new(0, 40),
				onActivatedEffect = if FFlagLuaAppResetHoverOnSduiPlayButtonActivation then UseResult7 else nil,
				enableUiBloxButton = if FFlagLuaAppSduiGameTilePlayButtonDefaults then p1.enableUiBloxButton == nil or p1.enableUiBloxButton else nil,
				openGameDetailsOnPurchaseRequired = if FFlagLuaAppSduiGameTilePlayButtonDefaults then p1.openGameDetailsOnPurchaseRequired == nil or p1.openGameDetailsOnPurchaseRequired else nil
			}) else ReactModule.createElement(SduiPlayButton, {
				buttonSize = "Medium",
				fillBehavior = "Fill",
				isPlayableWhenLoading = true,
				universeId = UniverseId,
				placeId = PlaceId,
				squadButtonHeight = UDim.new(0, 40),
				sduiContext = p1.sduiContext,
				analyticsContext = AnalyticsContext,
				onActivatedEffect = if FFlagLuaAppResetHoverOnSduiPlayButtonActivation then UseResult7 else nil,
				enableUiBloxButton = if FFlagLuaAppSduiGameTilePlayButtonDefaults then p1.enableUiBloxButton == nil or p1.enableUiBloxButton else nil,
				openGameDetailsOnPurchaseRequired = if FFlagLuaAppSduiGameTilePlayButtonDefaults then p1.openGameDetailsOnPurchaseRequired == nil or p1.openGameDetailsOnPurchaseRequired else nil
			})
		else
			return nil
		end
	end, {
		UseStateResult1, p1.enableLegacyHoverState, UniverseId, PlaceId,
		p1.ctaButtonComponent, p1.analyticsContext, p1.sduiContext,
		if FFlagLuaAppResetHoverOnSduiPlayButtonActivation then UseResult7 else nil,
		if FFlagLuaAppSduiGameTilePlayButtonDefaults then p1.enableUiBloxButton else nil,
		if FFlagLuaAppSduiGameTilePlayButtonDefaults then p1.openGameDetailsOnPurchaseRequired else nil
	})
	local UseResult8 = if FFlagSduiTileDisableLegacyHover then nil else ReactModule.useCallback(function(Offset: number, BackgroundColor3, Offset1)
		-- upvalues: p1 (copy), ReactModule (upval), UseResult5 (copy), UseResult6 (copy), FFlagLuaAppSduiGameTileHoverShadow (upval), UseRefResult (ref), UseMemoResult (copy)
		return if p1.enableLegacyHoverState then ReactModule.createElement("Frame", {
			AutomaticSize = Enum.AutomaticSize.Y,
			Position = UDim2.new(0, -Offset, 0, -Offset),
			Size = UDim2.new(1, Offset * 2, 0, 0),
			BackgroundColor3 = BackgroundColor3,
			BorderSizePixel = 0,
			BackgroundTransparency = 0,
			[ReactModule.Event.MouseEnter] = UseResult5,
			[ReactModule.Event.MouseLeave] = UseResult6,
			ref = if FFlagLuaAppSduiGameTileHoverShadow then UseRefResult else nil
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalFlex = Enum.UIFlexAlignment.Fill
			}),
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, Offset),
				PaddingRight = UDim.new(0, Offset),
				PaddingBottom = UDim.new(0, Offset),
				PaddingTop = UDim.new(0, Offset * 2)
			}),
			UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, Offset1) }),
			ctaButtonComponent = UseMemoResult
		}) else nil
	end, {
		UseMemoResult,
		UseResult5,
		UseResult6,
		p1.enableLegacyHoverState
	})
	local CloneElementResult = nil
	
	if UseStateResult then
		if p1.focusNavActionsComponent then
			CloneElementResult = ReactModule.cloneElement(p1.focusNavActionsComponent, { extraLocalProps = { guiObject = UseRefResult1.current } })
		elseif not p1.disableHoldToPlay then
			CloneElementResult = ReactModule.createElement(SduiHoldToPlayModule, {
				sduiContext = p1.sduiContext,
				analyticsContext = SduiBuilder.buildAnalyticsContext({}, p1.analyticsContext, {
					eventContext = DiscoveryAnalyticsModule.Constants.Context.HoldToPlayLauncher,
					referralSource = p1.sduiContext.appPage
				}),
				universeId = UniverseId,
				placeId = p1.placeId,
				guiObject = UseRefResult1.current,
				setDisabledForHold = UseResult1
			})
		end
	end
	local Element = ReactModule.createElement(SduiTileModule, CryoModule.Dictionary.join(p1, {
		testId = "--sdui-game-tile",
		ctaButtonComponent = UseMemoResult,
		onMouseEnter = UseResult5,
		onMouseLeave = UseResult6,
		onSelectionGained = UseResult3,
		onSelectionLost = UseResult4,
		renderLegacyHoverState = if FFlagSduiTileDisableLegacyHover then nil else UseResult8,
		isHovered = UseStateResult1,
		setGuiObject = UseResult,
		onActivated = UseResult2,
		focusNavActionsComponent = CloneElementResult,
		footerComponent = ReactModule.useMemo(function()
			-- upvalues: p1 (copy), ReactModule (upval), SduiGameTileFooterModule (upval), UseStateResult1 (copy), UseStateResult (copy), UniverseId (copy), PlaceId (copy)
			return if p1.disableDefaultFooterLogic then p1.footerComponent else ReactModule.createElement(SduiGameTileFooterModule, {
				isHovered = UseStateResult1,
				isSelected = UseStateResult,
				ageRatingText = p1.ageRatingText,
				footerComponent = p1.footerComponent,
				sduiContext = p1.sduiContext,
				universeId = UniverseId,
				placeId = PlaceId,
				analyticsContext = p1.analyticsContext,
				ratingText = p1.ratingText,
				playerCount = p1.playerCount
			})
		end, {
			UseStateResult1, UseStateResult, UniverseId, PlaceId, p1.ageRatingText,
			p1.disableDefaultFooterLogic, p1.footerComponent, p1.sduiContext,
			p1.analyticsContext, p1.ratingText, p1.playerCount
		})
	}))
	
	if EnableLegacyHoverState then
		local XSmall: number = UseTokensResult.Gap.XSmall
		
		return ReactModule.createElement(ZoomAnimatedFrame, {
			isZoomEnabled = UseStateResult1,
			expansionOffsetX = XSmall * 2,
			expansionOffsetTop = XSmall,
			expansionOffsetBottom = XSmall,
			reducedMotion = UsePreferencesResult.reducedMotion
		}, {
			HoverShadow = if FFlagLuaAppSduiGameTileHoverShadow and UseStateResult1 and UseRefResult then ReactModule.createElement(TileHoverShadowModule, {
				contentRef = UseRefResult,
				hoverPadding = p1.containmentPadding,
				containmentPadding = p1.containmentPadding
			}) else nil,
			Tile = Element
		})
	else
		return Element
	end
end)