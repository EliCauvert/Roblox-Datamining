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
local fFlagLuaAppSduiVideoThumbnail = require(parent.SharedFlags).FFlagLuaAppSduiVideoThumbnail
local sduiGameTileDisableDefaultPlayButtonOnHover = game:DefineFastFlag("SduiGameTileDisableDefaultPlayButtonOnHover", false)

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), usePreferences (ref), fFlagSduiTileDisableLegacyHover (ref), fFlagLuaAppSduiVideoThumbnail (ref), fFlagLuaAppSduiGameTileHoverShadow (ref), reactModule (ref), useUidRefString (ref), sduiErrors (ref), getInputModeStore (ref), sduiParseHelpers (ref), videoEndReason (ref), sduiParsers (ref), sduiActionType (ref), default (ref), responsiveModule (ref), fFlagLuaAppResetHoverOnSduiPlayButtonActivation (ref), sduiGameTileDisableDefaultPlayButtonOnHover (ref), sduiBuilder (ref), sduiPlayButton (ref), fFlagLuaAppSduiGameTilePlayButtonDefaults (ref), localizeStrings (ref), discoveryAnalyticsModule (ref), sduiHoldToPlayModule (ref), sduiGameTileFooterModule (ref), sduiDefaultTileImageModule (ref), sduiGameVideoThumbnailModule (ref), sduiTileModule (ref), cryoModule (ref), zoomAnimatedFrame (ref), tileHoverShadowModule (ref)
	local var1 = useTokens()
	local var2 = usePreferences()
	local enableLegacyHoverState = not fFlagSduiTileDisableLegacyHover and p1.enableLegacyHoverState
	local var3 = if fFlagLuaAppSduiVideoThumbnail then p1.sduiContext.videoPlaybackContext else nil
	local var4 = if fFlagLuaAppSduiGameTileHoverShadow then reactModule.useRef(nil) else nil
	local current = useUidRefString().current
	local universeId = p1.universeId
	local placeId = p1.placeId
	local var5 = reactModule.useRef(nil)
	local var6 = reactModule.useCallback(function(p2)
		-- upvalues: var5 (ref), p1 (ref)
		var5.current = p2
		
		if p1.setGuiObject then
			p1.setGuiObject(p2)
		end
	end, { p1.setGuiObject })
	local var7 = reactModule.useRef(false)
	local var8 = reactModule.useCallback(function(p2)
		-- upvalues: var7 (ref)
		var7.current = p2
	end, {})
	local var9 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), sduiErrors (copy), getInputModeStore (copy), sduiParseHelpers (copy), var7 (ref), fFlagLuaAppSduiVideoThumbnail (copy), var3 (ref), videoEndReason (copy), universeId (ref), sduiParsers (copy), sduiActionType (copy), placeId (ref)
		p1.sduiContext.dependencies.logger.reportCounter(sduiErrors.SduiCounterName.GameTileActivated, { name = getInputModeStore(false).getLastInputType(false) }, true)
		
		local function logFailure(p2)
			-- upvalues: sduiParseHelpers (copy), p1 (copy), sduiErrors (copy), getInputModeStore (copy)
			p1.sduiContext.dependencies.logger.reportError(sduiErrors.SduiErrorType.FailedToExecuteAction, {
				componentType = "GameTile",
				message = `Error executing GameTile.onActivated error: '{if p3 then sduiParseHelpers.stringifyValue(p3) else ""}' config: {sduiParseHelpers.stringifyValue(p1.componentConfig)}`,
				name = getInputModeStore(false).getLastInputType(false)
			}, p1.sduiContext.appPage)
		end
		
		local ok, status = pcall(function()
			-- upvalues: var7 (copy), fFlagLuaAppSduiVideoThumbnail (copy), var3 (copy), videoEndReason (copy), universeId (copy), p1 (copy), sduiParsers (copy), sduiActionType (copy), placeId (copy), sduiErrors (copy), getInputModeStore (copy), logFailure (ref)
			if var7.current then
				p1.sduiContext.dependencies.logger.reportCounter(sduiErrors.SduiCounterName.GameTileActivatedWhenDisabled, { name = getInputModeStore(false).getLastInputType(false) })
				
				return
			elseif fFlagLuaAppSduiVideoThumbnail and var3 then
				var3.videoPlaybackCoordinator:reset(videoEndReason.TileClicked, nil, universeId, nil)
			end
			if p1.onActivated then
				p1.onActivated()
				
				return
			end
			local var10 = sduiParsers.safeParseCallback({
				actionType = sduiActionType.OpenGameDetails,
				actionParams = { placeId = placeId, universeId = universeId }
			}, p1.sduiContext, p1.analyticsContext)
			
			if var10 then
				p1.sduiContext.dependencies.logger.reportCounter(sduiErrors.SduiCounterName.GameTileActivatedExecuteCallback, { name = getInputModeStore(false).getLastInputType(false) }, true)
				var10()
				
				return
			end
			logFailure("Callback is nil after parsing")
		end)
		
		if not ok then
			logFailure(status)
		end
	end, {
		p1.onActivated, p1.sduiContext, p1.analyticsContext, placeId, universeId,
		p1.componentConfig, if fFlagLuaAppSduiVideoThumbnail then var3 else nil
	})
	local var10, var11 = reactModule.useState(false)
	local var12, var13 = reactModule.useState(false)
	local var14 = reactModule.useCallback(function()
		-- upvalues: var11 (ref), p1 (ref)
		var11(true)
		
		if p1.setCustomConditionState then
			p1.setCustomConditionState("selected", true)
		end
	end, { p1.setCustomConditionState })
	local var15 = reactModule.useCallback(function()
		-- upvalues: var11 (ref), p1 (ref)
		var11(false)
		
		if p1.setCustomConditionState then
			p1.setCustomConditionState("selected", false)
		end
	end, { p1.setCustomConditionState })
	local var16 = reactModule.useRef(0)
	
	if var12 == false then
		var16.current = 0
	end
	local default_1 = default.default
	local var17 = reactModule.useCallback(function()
		-- upvalues: var16 (ref), current (ref), getInputModeStore (copy), responsiveModule (copy), default_1 (ref)
		if var16.current == 0 and current and getInputModeStore(false).getLastInputType(false) == responsiveModule.Input.Pointer then
			default_1:requestHover(current)
		end
		var16.current += 1
	end, { current })
	local var18 = reactModule.useCallback(function()
		-- upvalues: var16 (ref), current (ref), default_1 (ref)
		var16.current -= 1
		
		if var16.current < 0 then
			var16.current = 0
		end
		if var16.current == 0 and current then
			default_1:cancelHover(current)
		end
	end, { current })
	reactModule.useEffect(function()
		-- upvalues: current (ref), var12 (ref), default_1 (ref), var13 (ref), p1 (ref), var16 (ref)
		local var19 = var12
		local _ = nil
		local changedConnection = default_1.changed:connect(function(p2)
			-- upvalues: current (copy), var13 (copy), p1 (copy), var19 (write)
			local var20 = p2 == current
			var13(var20)
			
			if p1.setCustomConditionState and var20 ~= var19 then
				p1.setCustomConditionState("hovered", var20)
			end
			var19 = var20
		end)
		
		return function()
			-- upvalues: default_1 (copy), current (ref), var16 (copy), changedConnection (write)
			default_1:cancelHover(current)
			var16.current = 0
			
			if changedConnection ~= nil then
				changedConnection:disconnect()
			end
		end
	end, { current, p1.setCustomConditionState })
	local var19 = if fFlagLuaAppResetHoverOnSduiPlayButtonActivation then reactModule.useCallback(function()
		-- upvalues: var12 (ref), default_1 (ref)
		if var12 then
			default_1:reset()
		end
	end, { var12 }) else nil
	local var20 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), var12 (ref), sduiGameTileDisableDefaultPlayButtonOnHover (copy), sduiBuilder (copy), universeId (ref), placeId (ref), fFlagSduiTileDisableLegacyHover (copy), reactModule (copy), sduiPlayButton (copy), fFlagLuaAppResetHoverOnSduiPlayButtonActivation (copy), var19 (ref), fFlagLuaAppSduiGameTilePlayButtonDefaults (copy), localizeStrings (copy)
		if p1.ctaButtonComponent then
			return p1.ctaButtonComponent
		elseif not var12 or sduiGameTileDisableDefaultPlayButtonOnHover and p1.disableDefaultPlayButtonOnHover then
			return nil
		end
		local var21 = sduiBuilder.buildAnalyticsContext({}, p1.analyticsContext, {
			eventContext = "ExperienceTile",
			universeId = universeId,
			placeId = placeId,
			referralSource = p1.sduiContext.appPage
		})
		
		return if fFlagSduiTileDisableLegacyHover or not p1.enableLegacyHoverState then reactModule.createElement(sduiPlayButton, {
			hidePlayableIcon = true,
			height = 40,
			buttonSize = "Medium",
			hideOptionalText = true,
			isPlayableWhenLoading = true,
			preferSecondaryPlayButton = true,
			universeId = universeId,
			placeId = placeId,
			sduiContext = p1.sduiContext,
			playableText = localizeStrings(p1.sduiContext.dependencies.localization, { Join = "Common.VisitGame.Label.Play" }).Join,
			width = UDim.new(0, 60),
			analyticsContext = var21,
			onActivatedEffect = if fFlagLuaAppResetHoverOnSduiPlayButtonActivation then var19 else nil,
			enableUiBloxButton = if fFlagLuaAppSduiGameTilePlayButtonDefaults then p1.enableUiBloxButton ~= nil or p1.enableUiBloxButton else nil,
			openGameDetailsOnPurchaseRequired = if fFlagLuaAppSduiGameTilePlayButtonDefaults then p1.openGameDetailsOnPurchaseRequired ~= nil or p1.openGameDetailsOnPurchaseRequired else nil
		}) else reactModule.createElement(sduiPlayButton, {
			buttonSize = "Medium",
			fillBehavior = "Fill",
			isPlayableWhenLoading = true,
			preferSecondaryPlayButton = true,
			universeId = universeId,
			placeId = placeId,
			sduiContext = p1.sduiContext,
			analyticsContext = var21,
			onActivatedEffect = if fFlagLuaAppResetHoverOnSduiPlayButtonActivation then var19 else nil,
			enableUiBloxButton = if fFlagLuaAppSduiGameTilePlayButtonDefaults then p1.enableUiBloxButton ~= nil or p1.enableUiBloxButton else nil,
			openGameDetailsOnPurchaseRequired = if fFlagLuaAppSduiGameTilePlayButtonDefaults then p1.openGameDetailsOnPurchaseRequired ~= nil or p1.openGameDetailsOnPurchaseRequired else nil
		})
	end, {
		var12, p1.enableLegacyHoverState, universeId, placeId, p1.ctaButtonComponent,
		p1.analyticsContext, p1.sduiContext,
		if fFlagLuaAppResetHoverOnSduiPlayButtonActivation then var19 else nil,
		if fFlagLuaAppSduiGameTilePlayButtonDefaults then p1.enableUiBloxButton else nil,
		if fFlagLuaAppSduiGameTilePlayButtonDefaults then p1.openGameDetailsOnPurchaseRequired else nil,
		if sduiGameTileDisableDefaultPlayButtonOnHover then p1.disableDefaultPlayButtonOnHover else nil
	})
	local var21 = if fFlagSduiTileDisableLegacyHover then nil else reactModule.useCallback(function(p2, p3, p4)
		-- upvalues: p1 (ref), reactModule (copy), var17 (ref), var18 (ref), fFlagLuaAppSduiGameTileHoverShadow (copy), var4 (write), var20 (ref)
		return if p1.enableLegacyHoverState then reactModule.createElement("Frame", {
			AutomaticSize = Enum.AutomaticSize.Y,
			Position = UDim2.new(0, -p2, 0, -p2),
			Size = UDim2.new(1, p2 * 2, 0, 0),
			BackgroundColor3 = p3,
			BorderSizePixel = 0,
			BackgroundTransparency = 0,
			[reactModule.Event.MouseEnter] = var17,
			[reactModule.Event.MouseLeave] = var18,
			ref = if fFlagLuaAppSduiGameTileHoverShadow then var4 else nil
		}, {
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalFlex = Enum.UIFlexAlignment.Fill
			}),
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, p2),
				PaddingRight = UDim.new(0, p2),
				PaddingBottom = UDim.new(0, p2),
				PaddingTop = UDim.new(0, p2 * 2)
			}),
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p4) }),
			ctaButtonComponent = var20
		}) else nil
	end, { var20, var17, var18, p1.enableLegacyHoverState })
	local var22 = nil
	
	if var10 then
		if p1.focusNavActionsComponent then
			var22 = reactModule.cloneElement(p1.focusNavActionsComponent, { extraLocalProps = { guiObject = var5.current } })
		elseif not p1.disableHoldToPlay then
			var22 = reactModule.createElement(sduiHoldToPlayModule, {
				sduiContext = p1.sduiContext,
				analyticsContext = sduiBuilder.buildAnalyticsContext({}, p1.analyticsContext, {
					eventContext = discoveryAnalyticsModule.Constants.Context.HoldToPlayLauncher,
					referralSource = p1.sduiContext.appPage
				}),
				universeId = universeId,
				placeId = p1.placeId,
				guiObject = var5.current,
				setDisabledForHold = var8
			})
		end
	end
	local var23 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), reactModule (copy), sduiGameTileFooterModule (copy), var12 (ref), var10 (ref), universeId (ref), placeId (ref)
		return if p1.disableDefaultFooterLogic then p1.footerComponent else reactModule.createElement(sduiGameTileFooterModule, {
			isHovered = var12,
			isSelected = var10,
			ageRatingText = p1.ageRatingText,
			footerComponent = p1.footerComponent,
			sduiContext = p1.sduiContext,
			universeId = universeId,
			placeId = placeId,
			analyticsContext = p1.analyticsContext,
			ratingText = p1.ratingText,
			playerCount = p1.playerCount
		})
	end, {
		var12, var10, universeId, placeId, p1.ageRatingText,
		p1.disableDefaultFooterLogic, p1.footerComponent, p1.sduiContext,
		p1.analyticsContext, p1.ratingText, p1.playerCount
	})
	local var24 = nil
	
	if fFlagLuaAppSduiVideoThumbnail and p1.videoPlayer then
		local cornerRadius = p1.cornerRadius or var1.Radius.Medium
		var24 = reactModule.createElement(sduiGameVideoThumbnailModule, {
			sduiContext = p1.sduiContext,
			videoPlayer = p1.videoPlayer,
			imageComponent = if not (p1.imageComponent or p1.image == nil) then reactModule.createElement(sduiDefaultTileImageModule, {
				image = p1.image,
				thumbnailBackgroundStyle = p1.thumbnailBackgroundStyle,
				isContained = p1.isContained,
				cardCornerRadius = cornerRadius,
				onTileImageLoaded = p1.onTileImageLoaded
			}) else p1.imageComponent,
			universeId = universeId,
			cornerRadius = cornerRadius,
			isHovered = var12,
			isSelected = var10,
			playbackCandidateRef = var5
		})
	end
	local createElement = reactModule.createElement
	createElement = createElement(sduiTileModule, cryoModule.Dictionary.join(p1, {
		testId = "--sdui-game-tile",
		ctaButtonComponent = var20,
		onMouseEnter = var17,
		onMouseLeave = var18,
		onSelectionGained = var14,
		onSelectionLost = var15,
		renderLegacyHoverState = if fFlagSduiTileDisableLegacyHover then nil else var21,
		isHovered = var12,
		imageComponent = if fFlagLuaAppSduiVideoThumbnail and var24 then var24 else p1.imageComponent,
		setGuiObject = var6,
		onActivated = var9,
		focusNavActionsComponent = var22,
		footerComponent = var23
	}))
	
	if not enableLegacyHoverState then
		return createElement
	end
	local xSmall = var1.Gap.XSmall
	
	return reactModule.createElement(zoomAnimatedFrame, {
		isZoomEnabled = var12,
		expansionOffsetX = xSmall * 2,
		expansionOffsetTop = xSmall,
		expansionOffsetBottom = xSmall,
		reducedMotion = var2.reducedMotion
	}, {
		HoverShadow = if fFlagLuaAppSduiGameTileHoverShadow and var12 and var4 then reactModule.createElement(tileHoverShadowModule, {
			contentRef = var4,
			hoverPadding = p1.containmentPadding,
			containmentPadding = p1.containmentPadding
		}) else nil,
		Tile = createElement
	})
end)