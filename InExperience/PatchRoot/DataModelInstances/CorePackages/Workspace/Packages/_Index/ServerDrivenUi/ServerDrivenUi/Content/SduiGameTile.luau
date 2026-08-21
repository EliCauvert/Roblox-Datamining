local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local getInputModeStore = responsiveModule.GetInputModeStore
local foundationModule = require(parent.Foundation)
local cryoModule = require(parent.Cryo)
local discoveryAnalyticsModule = require(parent.DiscoveryAnalytics)
local localizeStrings = require(parent.Localization).localizeStrings
local useTokens = foundationModule.Hooks.useTokens
local usePreferences = foundationModule.Hooks.usePreferences
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiBuilder = sduiCoreSystemModule.SduiBuilder
local sduiErrors = sduiCoreSystemModule.SduiErrors
local sduiPlayButton = require(parent.SduiSharedContent).SduiPlayButton
local sduiParsers = sduiCoreSystemModule.SduiParsers
local sduiParseHelpers = sduiCoreSystemModule.SduiParseHelpers
local useUidRefString = sduiCoreSystemModule.useUidRefString
local gameTileModule = require(parent.GameTile)
local default = gameTileModule.HoverTileCoordinator.default
local zoomAnimatedFrame = gameTileModule.ZoomAnimatedFrame
local sduiTileModule = require(serverDrivenUi.Content.SduiTile)
local tileHoverShadowModule = require(serverDrivenUi.Content.TileHoverShadow)
local sduiGameTileFooterModule = require(serverDrivenUi.Content.SduiGameTileFooter)
local sduiHoldToPlayModule = require(serverDrivenUi.FocusNavigation.SduiHoldToPlay)
local fFlagSduiTileDisableLegacyHover = require(serverDrivenUi.Flags).FFlagSduiTileDisableLegacyHover
local fFlagLuaAppResetHoverOnSduiPlayButtonActivation = require(parent.SharedFlags).FFlagLuaAppResetHoverOnSduiPlayButtonActivation
local fFlagLuaAppSduiGameTileHoverShadow = require(parent.SharedFlags).FFlagLuaAppSduiGameTileHoverShadow
local fFlagLuaAppSduiGameTilePlayButtonDefaults = require(parent.SharedFlags).FFlagLuaAppSduiGameTilePlayButtonDefaults
local fFlagLuaAppDemoModePlayButton = require(parent.SharedFlags).FFlagLuaAppDemoModePlayButton

return reactModule.memo(function(p0) --[[ line: 73 | named "SduiGameTile" ]]
	-- upvalues: useTokens (ref), usePreferences (ref), fFlagSduiTileDisableLegacyHover (ref), fFlagLuaAppSduiGameTileHoverShadow (ref), reactModule (ref), useUidRefString (ref), sduiErrors (ref), getInputModeStore (ref), sduiParseHelpers (ref), sduiParsers (ref), sduiActionType (ref), default (ref), responsiveModule (ref), fFlagLuaAppResetHoverOnSduiPlayButtonActivation (ref), sduiBuilder (ref), sduiPlayButton (ref), fFlagLuaAppDemoModePlayButton (ref), fFlagLuaAppSduiGameTilePlayButtonDefaults (ref), localizeStrings (ref), discoveryAnalyticsModule (ref), sduiHoldToPlayModule (ref), sduiGameTileFooterModule (ref), sduiTileModule (ref), cryoModule (ref), zoomAnimatedFrame (ref), tileHoverShadowModule (ref)
	local var12 = useTokens()
	local var13 = usePreferences()
	local enableLegacyHoverState = not fFlagSduiTileDisableLegacyHover and p0.enableLegacyHoverState
	local var15 = if fFlagLuaAppSduiGameTileHoverShadow then reactModule.useRef(nil) else nil
	local current = useUidRefString().current
	local universeId = p0.universeId
	local placeId = p0.placeId
	local var16 = reactModule.useRef(nil)
	local var17 = reactModule.useCallback(function(p1) --[[ line: 90 ]]
		-- upvalues: var16 (ref), p0 (ref)
		var16.current = p1
		
		if p0.setGuiObject then
			p0.setGuiObject(p1)
		end
	end, { p0.setGuiObject })
	local var18 = reactModule.useRef(false)
	local var19 = reactModule.useCallback(function(p2) --[[ line: 98 ]]
		-- upvalues: var18 (ref)
		var18.current = p2
	end, {})
	local var20 = reactModule.useCallback(function() --[[ line: 102 ]]
		-- upvalues: p0 (ref), sduiErrors (copy), getInputModeStore (copy), sduiParseHelpers (copy), var18 (ref), sduiParsers (copy), sduiActionType (copy), placeId (ref), universeId (ref)
		p0.sduiContext.dependencies.logger.reportCounter(sduiErrors.SduiCounterName.GameTileActivated, { name = getInputModeStore(false).getLastInputType(false) }, true)
		
		local function logFailure(p3) --[[ line: 107 ]]
			-- upvalues: sduiParseHelpers (copy), p0 (copy), sduiErrors (copy), getInputModeStore (copy)
			p0.sduiContext.dependencies.logger.reportError(sduiErrors.SduiErrorType.FailedToExecuteAction, {
				componentType = "GameTile",
				message = `Error executing GameTile.onActivated error: '{if p3 then sduiParseHelpers.stringifyValue(p3) else ""}' config: {sduiParseHelpers.stringifyValue(p0.componentConfig)}`,
				name = getInputModeStore(false).getLastInputType(false)
			}, p0.sduiContext.appPage)
		end
		
		local ok, status = pcall(function() --[[ line: 117 ]]
			-- upvalues: var18 (copy), p0 (copy), sduiParsers (copy), sduiActionType (copy), placeId (copy), universeId (copy), sduiErrors (copy), getInputModeStore (copy), logFailure (ref)
			if var18.current then
				p0.sduiContext.dependencies.logger.reportCounter(sduiErrors.SduiCounterName.GameTileActivatedWhenDisabled, { name = getInputModeStore(false).getLastInputType(false) })
				
				return
			elseif p0.onActivated then
				p0.onActivated()
				
				return
			end
			local var36 = sduiParsers.safeParseCallback({
				actionType = sduiActionType.OpenGameDetails,
				actionParams = { placeId = placeId, universeId = universeId }
			}, p0.sduiContext, p0.analyticsContext)
			
			if var36 then
				p0.sduiContext.dependencies.logger.reportCounter(sduiErrors.SduiCounterName.GameTileActivatedExecuteCallback, { name = getInputModeStore(false).getLastInputType(false) }, true)
				var36()
				
				return
			end
			logFailure("Callback is nil after parsing")
		end)
		
		if not ok then
			logFailure(status)
		end
	end, {
		p0.onActivated, p0.sduiContext, p0.analyticsContext, placeId, universeId,
		p0.componentConfig
	})
	local var21, var22 = reactModule.useState(false)
	local var23, var24 = reactModule.useState(false)
	local var25 = reactModule.useCallback(function() --[[ line: 162 ]]
		-- upvalues: var22 (ref), p0 (ref)
		var22(true)
		
		if p0.setCustomConditionState then
			p0.setCustomConditionState("selected", true)
		end
	end, { p0.setCustomConditionState })
	local var26 = reactModule.useCallback(function() --[[ line: 169 ]]
		-- upvalues: var22 (ref), p0 (ref)
		var22(false)
		
		if p0.setCustomConditionState then
			p0.setCustomConditionState("selected", false)
		end
	end, { p0.setCustomConditionState })
	local var27 = reactModule.useRef(0)
	
	if var23 == false then
		var27.current = 0
	end
	local default_1 = default.default
	local var28 = reactModule.useCallback(function() --[[ line: 193 ]]
		-- upvalues: var27 (ref), current (ref), getInputModeStore (copy), responsiveModule (copy), default_1 (ref)
		if var27.current == 0 and current and getInputModeStore(false).getLastInputType(false) == responsiveModule.Input.Pointer then
			default_1:requestHover(current)
		end
		var27.current += 1
	end, { current })
	local var29 = reactModule.useCallback(function() --[[ line: 203 ]]
		-- upvalues: var27 (ref), current (ref), default_1 (ref)
		var27.current -= 1
		
		if var27.current < 0 then
			var27.current = 0
		end
		if var27.current == 0 and current then
			default_1:cancelHover(current)
		end
	end, { current })
	reactModule.useEffect(function() --[[ line: 213 ]]
		-- upvalues: current (ref), var23 (ref), default_1 (ref), var24 (ref), p0 (ref), var27 (ref)
		local var37 = var23
		local _ = nil
		local changedConnection = default_1.changed:connect(function(p4) --[[ line: 217 ]]
			-- upvalues: current (copy), var24 (copy), p0 (copy), var37 (write)
			local var39 = p4 == current
			var24(var39)
			
			if p0.setCustomConditionState and var39 ~= var37 then
				p0.setCustomConditionState("hovered", var39)
			end
			var37 = var39
		end)
		
		return function() --[[ line: 226 ]]
			-- upvalues: default_1 (copy), current (ref), var27 (copy), changedConnection (write)
			default_1:cancelHover(current)
			var27.current = 0
			
			if changedConnection ~= nil then
				changedConnection:disconnect()
			end
		end
	end, { current, p0.setCustomConditionState })
	local var30 = if fFlagLuaAppResetHoverOnSduiPlayButtonActivation then reactModule.useCallback(function() --[[ line: 237 ]]
		-- upvalues: var23 (ref), default_1 (ref)
		if var23 then
			default_1:reset()
		end
	end, { var23 }) else nil
	local var31 = reactModule.useMemo(function() --[[ line: 245 ]]
		-- upvalues: p0 (ref), var23 (ref), sduiBuilder (copy), universeId (ref), placeId (ref), fFlagSduiTileDisableLegacyHover (copy), reactModule (copy), sduiPlayButton (copy), fFlagLuaAppDemoModePlayButton (copy), fFlagLuaAppResetHoverOnSduiPlayButtonActivation (copy), var30 (ref), fFlagLuaAppSduiGameTilePlayButtonDefaults (copy), localizeStrings (copy)
		if p0.ctaButtonComponent then
			return p0.ctaButtonComponent
		elseif not var23 then
			return nil
		end
		local var40 = sduiBuilder.buildAnalyticsContext({}, p0.analyticsContext, {
			eventContext = "ExperienceTile",
			universeId = universeId,
			placeId = placeId,
			referralSource = p0.sduiContext.appPage
		})
		
		return if fFlagSduiTileDisableLegacyHover or not p0.enableLegacyHoverState then reactModule.createElement(sduiPlayButton, {
			hidePlayableIcon = true,
			height = 40,
			buttonSize = "Medium",
			hideOptionalText = true,
			isPlayableWhenLoading = true,
			universeId = universeId,
			placeId = placeId,
			sduiContext = p0.sduiContext,
			playableText = localizeStrings(p0.sduiContext.dependencies.localization, { Join = "Common.VisitGame.Label.Play" }).Join,
			width = UDim.new(0, 60),
			analyticsContext = var40,
			preferSecondaryPlayButton = if fFlagLuaAppDemoModePlayButton then true else nil,
			onActivatedEffect = if fFlagLuaAppResetHoverOnSduiPlayButtonActivation then var30 else nil,
			enableUiBloxButton = if fFlagLuaAppSduiGameTilePlayButtonDefaults then p0.enableUiBloxButton ~= nil or p0.enableUiBloxButton else nil,
			openGameDetailsOnPurchaseRequired = if fFlagLuaAppSduiGameTilePlayButtonDefaults then p0.openGameDetailsOnPurchaseRequired ~= nil or p0.openGameDetailsOnPurchaseRequired else nil
		}) else reactModule.createElement(sduiPlayButton, {
			buttonSize = "Medium",
			fillBehavior = "Fill",
			isPlayableWhenLoading = true,
			universeId = universeId,
			placeId = placeId,
			preferSecondaryPlayButton = if fFlagLuaAppDemoModePlayButton then true else nil,
			sduiContext = p0.sduiContext,
			analyticsContext = var40,
			onActivatedEffect = if fFlagLuaAppResetHoverOnSduiPlayButtonActivation then var30 else nil,
			enableUiBloxButton = if fFlagLuaAppSduiGameTilePlayButtonDefaults then p0.enableUiBloxButton ~= nil or p0.enableUiBloxButton else nil,
			openGameDetailsOnPurchaseRequired = if fFlagLuaAppSduiGameTilePlayButtonDefaults then p0.openGameDetailsOnPurchaseRequired ~= nil or p0.openGameDetailsOnPurchaseRequired else nil
		})
	end, {
		var23, p0.enableLegacyHoverState, universeId, placeId, p0.ctaButtonComponent,
		p0.analyticsContext, p0.sduiContext,
		if fFlagLuaAppResetHoverOnSduiPlayButtonActivation then var30 else nil,
		if fFlagLuaAppSduiGameTilePlayButtonDefaults then p0.enableUiBloxButton else nil,
		if fFlagLuaAppSduiGameTilePlayButtonDefaults then p0.openGameDetailsOnPurchaseRequired else nil
	})
	local var32 = if fFlagSduiTileDisableLegacyHover then nil else reactModule.useCallback(function(p5, p6, p7) --[[ line: 333 ]]
		-- upvalues: p0 (ref), reactModule (copy), var28 (ref), var29 (ref), fFlagLuaAppSduiGameTileHoverShadow (copy), var15 (write), var31 (ref)
		return if p0.enableLegacyHoverState then reactModule.createElement("Frame", {
			AutomaticSize = Enum.AutomaticSize.Y,
			Position = UDim2.new(0, -p5, 0, -p5),
			Size = UDim2.new(1, p5 * 2, 0, 0),
			BackgroundColor3 = p6,
			BorderSizePixel = 0,
			BackgroundTransparency = 0,
			[reactModule.Event.MouseEnter] = var28,
			[reactModule.Event.MouseLeave] = var29,
			ref = if fFlagLuaAppSduiGameTileHoverShadow then var15 else nil
		}, {
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalFlex = Enum.UIFlexAlignment.Fill
			}),
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, p5),
				PaddingRight = UDim.new(0, p5),
				PaddingBottom = UDim.new(0, p5),
				PaddingTop = UDim.new(0, p5 * 2)
			}),
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p7) }),
			ctaButtonComponent = var31
		}) else nil
	end, { var31, var28, var29, p0.enableLegacyHoverState })
	local var33 = nil
	
	if var21 then
		if p0.focusNavActionsComponent then
			var33 = reactModule.cloneElement(p0.focusNavActionsComponent, { extraLocalProps = { guiObject = var16.current } })
		elseif not p0.disableHoldToPlay then
			var33 = reactModule.createElement(sduiHoldToPlayModule, {
				sduiContext = p0.sduiContext,
				analyticsContext = sduiBuilder.buildAnalyticsContext({}, p0.analyticsContext, {
					eventContext = discoveryAnalyticsModule.Constants.Context.HoldToPlayLauncher,
					referralSource = p0.sduiContext.appPage
				}),
				universeId = universeId,
				placeId = p0.placeId,
				guiObject = var16.current,
				setDisabledForHold = var19
			})
		end
	end
	local var34 = reactModule.createElement(sduiTileModule, cryoModule.Dictionary.join(p0, {
		testId = "--sdui-game-tile",
		ctaButtonComponent = var31,
		onMouseEnter = var28,
		onMouseLeave = var29,
		onSelectionGained = var25,
		onSelectionLost = var26,
		renderLegacyHoverState = if fFlagSduiTileDisableLegacyHover then nil else var32,
		isHovered = var23,
		setGuiObject = var17,
		onActivated = var20,
		focusNavActionsComponent = var33,
		footerComponent = reactModule.useMemo(function() --[[ line: 394 ]]
			-- upvalues: p0 (ref), reactModule (copy), sduiGameTileFooterModule (copy), var23 (ref), var21 (ref), universeId (ref), placeId (ref)
			return if p0.disableDefaultFooterLogic then p0.footerComponent else reactModule.createElement(sduiGameTileFooterModule, {
				isHovered = var23,
				isSelected = var21,
				ageRatingText = p0.ageRatingText,
				footerComponent = p0.footerComponent,
				sduiContext = p0.sduiContext,
				universeId = universeId,
				placeId = placeId,
				analyticsContext = p0.analyticsContext,
				ratingText = p0.ratingText,
				playerCount = p0.playerCount
			})
		end, {
			var23, var21, universeId, placeId, p0.ageRatingText,
			p0.disableDefaultFooterLogic, p0.footerComponent, p0.sduiContext,
			p0.analyticsContext, p0.ratingText, p0.playerCount
		})
	}))
	
	if not enableLegacyHoverState then
		return var34
	end
	local xSmall = var12.Gap.XSmall
	
	return reactModule.createElement(zoomAnimatedFrame, {
		isZoomEnabled = var23,
		expansionOffsetX = xSmall * 2,
		expansionOffsetTop = xSmall,
		expansionOffsetBottom = xSmall,
		reducedMotion = var13.reducedMotion
	}, {
		HoverShadow = if fFlagLuaAppSduiGameTileHoverShadow and var23 and var15 then reactModule.createElement(tileHoverShadowModule, {
			contentRef = var15,
			hoverPadding = p0.containmentPadding,
			containmentPadding = p0.containmentPadding
		}) else nil,
		Tile = var34
	})
end)