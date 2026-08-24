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
local videoEndReason = require(parent.VideoUtils).AnalyticsEnums.VideoEndReason
local gameTileModule = require(parent.GameTile)
local default = gameTileModule.HoverTileCoordinator.default
local zoomAnimatedFrame = gameTileModule.ZoomAnimatedFrame
local sduiTileModule = require(serverDrivenUi.Content.SduiTile)
local sduiGameVideoThumbnailModule = require(serverDrivenUi.Content.SduiGameVideoThumbnail)
local tileHoverShadowModule = require(serverDrivenUi.Content.TileHoverShadow)
local sduiGameTileFooterModule = require(serverDrivenUi.Content.SduiGameTileFooter)
local sduiHoldToPlayModule = require(serverDrivenUi.FocusNavigation.SduiHoldToPlay)
local sduiDefaultTileImageModule = require(serverDrivenUi.Content.SduiDefaultTileImage)
local fFlagSduiTileDisableLegacyHover = require(serverDrivenUi.Flags).FFlagSduiTileDisableLegacyHover
local fFlagLuaAppResetHoverOnSduiPlayButtonActivation = require(parent.SharedFlags).FFlagLuaAppResetHoverOnSduiPlayButtonActivation
local fFlagLuaAppSduiGameTileHoverShadow = require(parent.SharedFlags).FFlagLuaAppSduiGameTileHoverShadow
local fFlagLuaAppSduiGameTilePlayButtonDefaults = require(parent.SharedFlags).FFlagLuaAppSduiGameTilePlayButtonDefaults
local fFlagLuaAppDemoModePlayButton = require(parent.SharedFlags).FFlagLuaAppDemoModePlayButton
local fFlagLuaAppSduiVideoThumbnail = require(parent.SharedFlags).FFlagLuaAppSduiVideoThumbnail

return reactModule.memo(function(p0)
	-- upvalues: useTokens (ref), usePreferences (ref), fFlagSduiTileDisableLegacyHover (ref), fFlagLuaAppSduiVideoThumbnail (ref), fFlagLuaAppSduiGameTileHoverShadow (ref), reactModule (ref), useUidRefString (ref), sduiErrors (ref), getInputModeStore (ref), sduiParseHelpers (ref), videoEndReason (ref), sduiParsers (ref), sduiActionType (ref), default (ref), responsiveModule (ref), fFlagLuaAppResetHoverOnSduiPlayButtonActivation (ref), sduiBuilder (ref), sduiPlayButton (ref), fFlagLuaAppDemoModePlayButton (ref), fFlagLuaAppSduiGameTilePlayButtonDefaults (ref), localizeStrings (ref), discoveryAnalyticsModule (ref), sduiHoldToPlayModule (ref), sduiGameTileFooterModule (ref), sduiDefaultTileImageModule (ref), sduiGameVideoThumbnailModule (ref), sduiTileModule (ref), cryoModule (ref), zoomAnimatedFrame (ref), tileHoverShadowModule (ref)
	local var14 = useTokens()
	local var15 = usePreferences()
	local enableLegacyHoverState = not fFlagSduiTileDisableLegacyHover and p0.enableLegacyHoverState
	local var17 = if fFlagLuaAppSduiVideoThumbnail then p0.sduiContext.videoPlaybackContext else nil
	local var18 = if fFlagLuaAppSduiGameTileHoverShadow then reactModule.useRef(nil) else nil
	local current = useUidRefString().current
	local universeId = p0.universeId
	local placeId = p0.placeId
	local var19 = reactModule.useRef(nil)
	local var20 = reactModule.useCallback(function(p1)
		-- upvalues: var19 (ref), p0 (ref)
		var19.current = p1
		
		if p0.setGuiObject then
			p0.setGuiObject(p1)
		end
	end, { p0.setGuiObject })
	local var21 = reactModule.useRef(false)
	local var22 = reactModule.useCallback(function(p2)
		-- upvalues: var21 (ref)
		var21.current = p2
	end, {})
	local var23 = reactModule.useCallback(function()
		-- upvalues: p0 (ref), sduiErrors (copy), getInputModeStore (copy), sduiParseHelpers (copy), var21 (ref), fFlagLuaAppSduiVideoThumbnail (copy), var17 (ref), videoEndReason (copy), universeId (ref), sduiParsers (copy), sduiActionType (copy), placeId (ref)
		p0.sduiContext.dependencies.logger.reportCounter(sduiErrors.SduiCounterName.GameTileActivated, { name = getInputModeStore(false).getLastInputType(false) }, true)
		
		local function logFailure(p3)
			-- upvalues: sduiParseHelpers (copy), p0 (copy), sduiErrors (copy), getInputModeStore (copy)
			p0.sduiContext.dependencies.logger.reportError(sduiErrors.SduiErrorType.FailedToExecuteAction, {
				componentType = "GameTile",
				message = `Error executing GameTile.onActivated error: '{if p3 then sduiParseHelpers.stringifyValue(p3) else ""}' config: {sduiParseHelpers.stringifyValue(p0.componentConfig)}`,
				name = getInputModeStore(false).getLastInputType(false)
			}, p0.sduiContext.appPage)
		end
		
		local ok, status = pcall(function()
			-- upvalues: var21 (copy), fFlagLuaAppSduiVideoThumbnail (copy), var17 (copy), videoEndReason (copy), universeId (copy), p0 (copy), sduiParsers (copy), sduiActionType (copy), placeId (copy), sduiErrors (copy), getInputModeStore (copy), logFailure (ref)
			if var21.current then
				p0.sduiContext.dependencies.logger.reportCounter(sduiErrors.SduiCounterName.GameTileActivatedWhenDisabled, { name = getInputModeStore(false).getLastInputType(false) })
				
				return
			elseif fFlagLuaAppSduiVideoThumbnail and var17 then
				var17.videoPlaybackCoordinator:reset(videoEndReason.TileClicked, nil, universeId, nil)
			end
			if p0.onActivated then
				p0.onActivated()
				
				return
			end
			local var41 = sduiParsers.safeParseCallback({
				actionType = sduiActionType.OpenGameDetails,
				actionParams = { placeId = placeId, universeId = universeId }
			}, p0.sduiContext, p0.analyticsContext)
			
			if var41 then
				p0.sduiContext.dependencies.logger.reportCounter(sduiErrors.SduiCounterName.GameTileActivatedExecuteCallback, { name = getInputModeStore(false).getLastInputType(false) }, true)
				var41()
				
				return
			end
			logFailure("Callback is nil after parsing")
		end)
		
		if not ok then
			logFailure(status)
		end
	end, {
		p0.onActivated, p0.sduiContext, p0.analyticsContext, placeId, universeId,
		p0.componentConfig, if fFlagLuaAppSduiVideoThumbnail then var17 else nil
	})
	local var24, var25 = reactModule.useState(false)
	local var26, var27 = reactModule.useState(false)
	local var28 = reactModule.useCallback(function()
		-- upvalues: var25 (ref), p0 (ref)
		var25(true)
		
		if p0.setCustomConditionState then
			p0.setCustomConditionState("selected", true)
		end
	end, { p0.setCustomConditionState })
	local var29 = reactModule.useCallback(function()
		-- upvalues: var25 (ref), p0 (ref)
		var25(false)
		
		if p0.setCustomConditionState then
			p0.setCustomConditionState("selected", false)
		end
	end, { p0.setCustomConditionState })
	local var30 = reactModule.useRef(0)
	
	if var26 == false then
		var30.current = 0
	end
	local default_1 = default.default
	local var31 = reactModule.useCallback(function()
		-- upvalues: var30 (ref), current (ref), getInputModeStore (copy), responsiveModule (copy), default_1 (ref)
		if var30.current == 0 and current and getInputModeStore(false).getLastInputType(false) == responsiveModule.Input.Pointer then
			default_1:requestHover(current)
		end
		var30.current += 1
	end, { current })
	local var32 = reactModule.useCallback(function()
		-- upvalues: var30 (ref), current (ref), default_1 (ref)
		var30.current -= 1
		
		if var30.current < 0 then
			var30.current = 0
		end
		if var30.current == 0 and current then
			default_1:cancelHover(current)
		end
	end, { current })
	reactModule.useEffect(function()
		-- upvalues: current (ref), var26 (ref), default_1 (ref), var27 (ref), p0 (ref), var30 (ref)
		local var42 = var26
		local _ = nil
		local changedConnection = default_1.changed:connect(function(p4)
			-- upvalues: current (copy), var27 (copy), p0 (copy), var42 (write)
			local var44 = p4 == current
			var27(var44)
			
			if p0.setCustomConditionState and var44 ~= var42 then
				p0.setCustomConditionState("hovered", var44)
			end
			var42 = var44
		end)
		
		return function()
			-- upvalues: default_1 (copy), current (ref), var30 (copy), changedConnection (write)
			default_1:cancelHover(current)
			var30.current = 0
			
			if changedConnection ~= nil then
				changedConnection:disconnect()
			end
		end
	end, { current, p0.setCustomConditionState })
	local var33 = if fFlagLuaAppResetHoverOnSduiPlayButtonActivation then reactModule.useCallback(function()
		-- upvalues: var26 (ref), default_1 (ref)
		if var26 then
			default_1:reset()
		end
	end, { var26 }) else nil
	local var34 = reactModule.useMemo(function()
		-- upvalues: p0 (ref), var26 (ref), sduiBuilder (copy), universeId (ref), placeId (ref), fFlagSduiTileDisableLegacyHover (copy), reactModule (copy), sduiPlayButton (copy), fFlagLuaAppDemoModePlayButton (copy), fFlagLuaAppResetHoverOnSduiPlayButtonActivation (copy), var33 (ref), fFlagLuaAppSduiGameTilePlayButtonDefaults (copy), localizeStrings (copy)
		if p0.ctaButtonComponent then
			return p0.ctaButtonComponent
		elseif not var26 then
			return nil
		end
		local var45 = sduiBuilder.buildAnalyticsContext({}, p0.analyticsContext, {
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
			analyticsContext = var45,
			preferSecondaryPlayButton = if fFlagLuaAppDemoModePlayButton then true else nil,
			onActivatedEffect = if fFlagLuaAppResetHoverOnSduiPlayButtonActivation then var33 else nil,
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
			analyticsContext = var45,
			onActivatedEffect = if fFlagLuaAppResetHoverOnSduiPlayButtonActivation then var33 else nil,
			enableUiBloxButton = if fFlagLuaAppSduiGameTilePlayButtonDefaults then p0.enableUiBloxButton ~= nil or p0.enableUiBloxButton else nil,
			openGameDetailsOnPurchaseRequired = if fFlagLuaAppSduiGameTilePlayButtonDefaults then p0.openGameDetailsOnPurchaseRequired ~= nil or p0.openGameDetailsOnPurchaseRequired else nil
		})
	end, {
		var26, p0.enableLegacyHoverState, universeId, placeId, p0.ctaButtonComponent,
		p0.analyticsContext, p0.sduiContext,
		if fFlagLuaAppResetHoverOnSduiPlayButtonActivation then var33 else nil,
		if fFlagLuaAppSduiGameTilePlayButtonDefaults then p0.enableUiBloxButton else nil,
		if fFlagLuaAppSduiGameTilePlayButtonDefaults then p0.openGameDetailsOnPurchaseRequired else nil
	})
	local var35 = if fFlagSduiTileDisableLegacyHover then nil else reactModule.useCallback(function(p5, p6, p7)
		-- upvalues: p0 (ref), reactModule (copy), var31 (ref), var32 (ref), fFlagLuaAppSduiGameTileHoverShadow (copy), var18 (write), var34 (ref)
		return if p0.enableLegacyHoverState then reactModule.createElement("Frame", {
			AutomaticSize = Enum.AutomaticSize.Y,
			Position = UDim2.new(0, -p5, 0, -p5),
			Size = UDim2.new(1, p5 * 2, 0, 0),
			BackgroundColor3 = p6,
			BorderSizePixel = 0,
			BackgroundTransparency = 0,
			[reactModule.Event.MouseEnter] = var31,
			[reactModule.Event.MouseLeave] = var32,
			ref = if fFlagLuaAppSduiGameTileHoverShadow then var18 else nil
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
			ctaButtonComponent = var34
		}) else nil
	end, { var34, var31, var32, p0.enableLegacyHoverState })
	local var36 = nil
	
	if var24 then
		if p0.focusNavActionsComponent then
			var36 = reactModule.cloneElement(p0.focusNavActionsComponent, { extraLocalProps = { guiObject = var19.current } })
		elseif not p0.disableHoldToPlay then
			var36 = reactModule.createElement(sduiHoldToPlayModule, {
				sduiContext = p0.sduiContext,
				analyticsContext = sduiBuilder.buildAnalyticsContext({}, p0.analyticsContext, {
					eventContext = discoveryAnalyticsModule.Constants.Context.HoldToPlayLauncher,
					referralSource = p0.sduiContext.appPage
				}),
				universeId = universeId,
				placeId = p0.placeId,
				guiObject = var19.current,
				setDisabledForHold = var22
			})
		end
	end
	local var37 = reactModule.useMemo(function()
		-- upvalues: p0 (ref), reactModule (copy), sduiGameTileFooterModule (copy), var26 (ref), var24 (ref), universeId (ref), placeId (ref)
		return if p0.disableDefaultFooterLogic then p0.footerComponent else reactModule.createElement(sduiGameTileFooterModule, {
			isHovered = var26,
			isSelected = var24,
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
		var26, var24, universeId, placeId, p0.ageRatingText,
		p0.disableDefaultFooterLogic, p0.footerComponent, p0.sduiContext,
		p0.analyticsContext, p0.ratingText, p0.playerCount
	})
	local var38 = nil
	
	if fFlagLuaAppSduiVideoThumbnail and p0.videoPlayer then
		local cornerRadius = p0.cornerRadius or var14.Radius.Medium
		var38 = reactModule.createElement(sduiGameVideoThumbnailModule, {
			sduiContext = p0.sduiContext,
			videoPlayer = p0.videoPlayer,
			imageComponent = if not (p0.imageComponent or p0.image == nil) then reactModule.createElement(sduiDefaultTileImageModule, {
				image = p0.image,
				thumbnailBackgroundStyle = p0.thumbnailBackgroundStyle,
				isContained = p0.isContained,
				cardCornerRadius = cornerRadius,
				onTileImageLoaded = p0.onTileImageLoaded
			}) else p0.imageComponent,
			universeId = universeId,
			cornerRadius = cornerRadius,
			isHovered = var26,
			isSelected = var24,
			playbackCandidateRef = var19
		})
	end
	local createElement = reactModule.createElement
	createElement = createElement(sduiTileModule, cryoModule.Dictionary.join(p0, {
		testId = "--sdui-game-tile",
		ctaButtonComponent = var34,
		onMouseEnter = var31,
		onMouseLeave = var32,
		onSelectionGained = var28,
		onSelectionLost = var29,
		renderLegacyHoverState = if fFlagSduiTileDisableLegacyHover then nil else var35,
		isHovered = var26,
		imageComponent = if fFlagLuaAppSduiVideoThumbnail and var38 then var38 else p0.imageComponent,
		setGuiObject = var20,
		onActivated = var23,
		focusNavActionsComponent = var36,
		footerComponent = var37
	}))
	
	if not enableLegacyHoverState then
		return createElement
	end
	local xSmall = var14.Gap.XSmall
	
	return reactModule.createElement(zoomAnimatedFrame, {
		isZoomEnabled = var26,
		expansionOffsetX = xSmall * 2,
		expansionOffsetTop = xSmall,
		expansionOffsetBottom = xSmall,
		reducedMotion = var15.reducedMotion
	}, {
		HoverShadow = if fFlagLuaAppSduiGameTileHoverShadow and var26 and var18 then reactModule.createElement(tileHoverShadowModule, {
			contentRef = var18,
			hoverPadding = p0.containmentPadding,
			containmentPadding = p0.containmentPadding
		}) else nil,
		Tile = createElement
	})
end)