local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local getInputModeStore = responsiveModule.GetInputModeStore
local appBloxModule = require(parent.AppBlox)
local foundationModule = require(parent.Foundation)
local cryoModule = require(parent.Cryo)
local discoveryAnalyticsModule = require(parent.DiscoveryAnalytics)
local localizeStrings = require(parent.Localization).localizeStrings
local useTokens = foundationModule.Hooks.useTokens
local usePreferences = foundationModule.Hooks.usePreferences
local gameTileOverflowMenuAction = discoveryAnalyticsModule.Events.gameTileOverflowMenuAction
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
local getOverflowMenuSignalStore = appBloxModule.getOverflowMenuSignalStore
local sduiTileModule = require(serverDrivenUi.Content.SduiTile)
local sduiGameTileOverflowMenuModule = require(serverDrivenUi.Content.SduiGameTileOverflowMenu)
local sduiGameVideoThumbnailModule = require(serverDrivenUi.Content.SduiGameVideoThumbnail)
local tileHoverShadowModule = require(serverDrivenUi.Content.TileHoverShadow)
local sduiGameTileFooterModule = require(serverDrivenUi.Content.SduiGameTileFooter)
local sduiHoldToPlayModule = require(serverDrivenUi.FocusNavigation.SduiHoldToPlay)
local sduiDefaultTileImageModule = require(serverDrivenUi.Content.SduiDefaultTileImage)
local fFlagSduiTileDisableLegacyHover = require(serverDrivenUi.Flags).FFlagSduiTileDisableLegacyHover
local fFlagLuaAppResetHoverOnSduiPlayButtonActivation = require(parent.SharedFlags).FFlagLuaAppResetHoverOnSduiPlayButtonActivation
local fFlagLuaAppSduiGameTileHoverShadow = require(parent.SharedFlags).FFlagLuaAppSduiGameTileHoverShadow
local fFlagLuaAppSduiVideoThumbnail = require(parent.SharedFlags).FFlagLuaAppSduiVideoThumbnail
local fFlagLuaAppSduiGameTileFeedback = require(parent.SharedFlags).FFlagLuaAppSduiGameTileFeedback
local sduiGameTileDisableDefaultPlayButtonOnHover = game:DefineFastFlag("SduiGameTileDisableDefaultPlayButtonOnHover", false)

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), usePreferences (ref), fFlagSduiTileDisableLegacyHover (ref), fFlagLuaAppSduiVideoThumbnail (ref), fFlagLuaAppSduiGameTileHoverShadow (ref), reactModule (ref), useUidRefString (ref), fFlagLuaAppSduiGameTileFeedback (ref), sduiErrors (ref), getInputModeStore (ref), sduiParseHelpers (ref), videoEndReason (ref), sduiParsers (ref), sduiActionType (ref), default (ref), responsiveModule (ref), gameTileOverflowMenuAction (ref), getOverflowMenuSignalStore (ref), fFlagLuaAppResetHoverOnSduiPlayButtonActivation (ref), sduiGameTileDisableDefaultPlayButtonOnHover (ref), sduiBuilder (ref), sduiPlayButton (ref), localizeStrings (ref), discoveryAnalyticsModule (ref), sduiHoldToPlayModule (ref), sduiGameTileFooterModule (ref), sduiGameTileOverflowMenuModule (ref), sduiDefaultTileImageModule (ref), sduiGameVideoThumbnailModule (ref), sduiTileModule (ref), cryoModule (ref), zoomAnimatedFrame (ref), tileHoverShadowModule (ref)
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
	local var7 = nil
	local triggerFeedback = nil
	
	if fFlagLuaAppSduiGameTileFeedback then
		var7 = p1.overflowMenuComponent ~= nil and (p1.collectionId ~= nil and p1.collectionId ~= "")
		triggerFeedback = p1.sduiContext.dependencies.triggerFeedback
	end
	local var8 = reactModule.useRef(false)
	local var9 = reactModule.useCallback(function(p2)
		-- upvalues: var8 (ref)
		var8.current = p2
	end, {})
	local var10 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), sduiErrors (copy), getInputModeStore (copy), sduiParseHelpers (copy), var8 (ref), fFlagLuaAppSduiVideoThumbnail (copy), var3 (ref), videoEndReason (copy), universeId (ref), sduiParsers (copy), sduiActionType (copy), placeId (ref)
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
			-- upvalues: var8 (copy), fFlagLuaAppSduiVideoThumbnail (copy), var3 (copy), videoEndReason (copy), universeId (copy), p1 (copy), sduiParsers (copy), sduiActionType (copy), placeId (copy), sduiErrors (copy), getInputModeStore (copy), logFailure (ref)
			if var8.current then
				p1.sduiContext.dependencies.logger.reportCounter(sduiErrors.SduiCounterName.GameTileActivatedWhenDisabled, { name = getInputModeStore(false).getLastInputType(false) })
				
				return
			elseif fFlagLuaAppSduiVideoThumbnail and var3 then
				var3.videoPlaybackCoordinator:reset(videoEndReason.TileClicked, nil, universeId, nil)
			end
			if p1.onActivated then
				p1.onActivated()
				
				return
			end
			local var11 = sduiParsers.safeParseCallback({
				actionType = sduiActionType.OpenGameDetails,
				actionParams = { placeId = placeId, universeId = universeId }
			}, p1.sduiContext, p1.analyticsContext)
			
			if var11 then
				p1.sduiContext.dependencies.logger.reportCounter(sduiErrors.SduiCounterName.GameTileActivatedExecuteCallback, { name = getInputModeStore(false).getLastInputType(false) }, true)
				var11()
				
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
	local var11, var12 = reactModule.useState(false)
	local var13, var14 = reactModule.useState(false)
	local var15 = reactModule.useCallback(function()
		-- upvalues: var12 (ref), p1 (ref)
		var12(true)
		
		if p1.setCustomConditionState then
			p1.setCustomConditionState("selected", true)
		end
	end, { p1.setCustomConditionState })
	local var16 = reactModule.useCallback(function()
		-- upvalues: var12 (ref), p1 (ref)
		var12(false)
		
		if p1.setCustomConditionState then
			p1.setCustomConditionState("selected", false)
		end
	end, { p1.setCustomConditionState })
	local var17 = reactModule.useRef(0)
	
	if var13 == false then
		var17.current = 0
	end
	local default_1 = default.default
	local var18 = reactModule.useCallback(function()
		-- upvalues: var17 (ref), current (ref), getInputModeStore (copy), responsiveModule (copy), default_1 (ref)
		if var17.current == 0 and current and getInputModeStore(false).getLastInputType(false) == responsiveModule.Input.Pointer then
			default_1:requestHover(current)
		end
		var17.current += 1
	end, { current })
	local var19 = reactModule.useCallback(function()
		-- upvalues: var17 (ref), current (ref), default_1 (ref)
		var17.current -= 1
		
		if var17.current < 0 then
			var17.current = 0
		end
		if var17.current == 0 and current then
			default_1:cancelHover(current)
		end
	end, { current })
	reactModule.useEffect(function()
		-- upvalues: current (ref), var13 (ref), default_1 (ref), var14 (ref), p1 (ref), var17 (ref)
		local var20 = var13
		local _ = nil
		local changedConnection = default_1.changed:connect(function(p2)
			-- upvalues: current (copy), var14 (copy), p1 (copy), var20 (write)
			local var21 = p2 == current
			var14(var21)
			
			if p1.setCustomConditionState and var21 ~= var20 then
				p1.setCustomConditionState("hovered", var21)
			end
			var20 = var21
		end)
		
		return function()
			-- upvalues: default_1 (copy), current (ref), var17 (copy), changedConnection (write)
			default_1:cancelHover(current)
			var17.current = 0
			
			if changedConnection ~= nil then
				changedConnection:disconnect()
			end
		end
	end, { current, p1.setCustomConditionState })
	local var20 = nil
	local var21 = nil
	
	if fFlagLuaAppSduiGameTileFeedback then
		var20 = reactModule.useCallback(function(p2)
			-- upvalues: gameTileOverflowMenuAction (copy), universeId (ref), p1 (ref)
			gameTileOverflowMenuAction({
				universeId = universeId,
				sortId = p1.collectionId,
				actionType = if p2 then "GameTileOverflowMenuClosed" else "GameTileOverflowMenuOpened"
			}, p1.sduiContext.appPage)
		end, { universeId, p1.collectionId, p1.sduiContext.appPage })
		var21 = reactModule.useCallback(function()
			-- upvalues: getOverflowMenuSignalStore (copy), triggerFeedback (write), current (ref), p1 (ref), universeId (ref), var20 (write)
			local var22 = getOverflowMenuSignalStore()
			
			if triggerFeedback and not var22.getIsMenuOpen(current) then
				triggerFeedback("TileLongPress", "Press", p1.sduiContext.appPage or "Unknown", { universeId = universeId, sortId = p1.collectionId })
			end
			var22.openMenu(current)
			var20(false)
		end, {
			triggerFeedback, current, p1.sduiContext.appPage, p1.collectionId, var20,
			universeId
		})
	end
	local var22 = if fFlagLuaAppResetHoverOnSduiPlayButtonActivation then reactModule.useCallback(function()
		-- upvalues: var13 (ref), default_1 (ref)
		if var13 then
			default_1:reset()
		end
	end, { var13 }) else nil
	local var23 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), var13 (ref), sduiGameTileDisableDefaultPlayButtonOnHover (copy), sduiBuilder (copy), universeId (ref), placeId (ref), fFlagSduiTileDisableLegacyHover (copy), reactModule (copy), sduiPlayButton (copy), fFlagLuaAppResetHoverOnSduiPlayButtonActivation (copy), var22 (ref), localizeStrings (copy)
		if p1.ctaButtonComponent then
			return p1.ctaButtonComponent
		elseif not var13 or sduiGameTileDisableDefaultPlayButtonOnHover and p1.disableDefaultPlayButtonOnHover then
			return nil
		end
		local var24 = sduiBuilder.buildAnalyticsContext({}, p1.analyticsContext, {
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
			analyticsContext = var24,
			onActivatedEffect = if fFlagLuaAppResetHoverOnSduiPlayButtonActivation then var22 else nil,
			enableUiBloxButton = p1.enableUiBloxButton ~= nil or p1.enableUiBloxButton,
			openGameDetailsOnPurchaseRequired = p1.openGameDetailsOnPurchaseRequired ~= nil or p1.openGameDetailsOnPurchaseRequired
		}) else reactModule.createElement(sduiPlayButton, {
			buttonSize = "Medium",
			fillBehavior = "Fill",
			isPlayableWhenLoading = true,
			preferSecondaryPlayButton = true,
			universeId = universeId,
			placeId = placeId,
			sduiContext = p1.sduiContext,
			analyticsContext = var24,
			onActivatedEffect = if fFlagLuaAppResetHoverOnSduiPlayButtonActivation then var22 else nil,
			enableUiBloxButton = p1.enableUiBloxButton ~= nil or p1.enableUiBloxButton,
			openGameDetailsOnPurchaseRequired = p1.openGameDetailsOnPurchaseRequired ~= nil or p1.openGameDetailsOnPurchaseRequired
		})
	end, {
		var13, p1.enableLegacyHoverState, universeId, placeId, p1.ctaButtonComponent,
		p1.analyticsContext, p1.sduiContext,
		if fFlagLuaAppResetHoverOnSduiPlayButtonActivation then var22 else nil,
		p1.enableUiBloxButton, p1.openGameDetailsOnPurchaseRequired,
		if sduiGameTileDisableDefaultPlayButtonOnHover then p1.disableDefaultPlayButtonOnHover else nil
	})
	local var24 = if fFlagSduiTileDisableLegacyHover then nil else reactModule.useCallback(function(p2, p3, p4)
		-- upvalues: p1 (ref), reactModule (copy), var18 (ref), var19 (ref), fFlagLuaAppSduiGameTileHoverShadow (copy), var4 (write), var23 (ref)
		return if p1.enableLegacyHoverState then reactModule.createElement("Frame", {
			AutomaticSize = Enum.AutomaticSize.Y,
			Position = UDim2.new(0, -p2, 0, -p2),
			Size = UDim2.new(1, p2 * 2, 0, 0),
			BackgroundColor3 = p3,
			BorderSizePixel = 0,
			BackgroundTransparency = 0,
			[reactModule.Event.MouseEnter] = var18,
			[reactModule.Event.MouseLeave] = var19,
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
			ctaButtonComponent = var23
		}) else nil
	end, { var23, var18, var19, p1.enableLegacyHoverState })
	local var25 = nil
	
	if var11 then
		if p1.focusNavActionsComponent then
			var25 = reactModule.cloneElement(p1.focusNavActionsComponent, { extraLocalProps = { guiObject = var5.current } })
		elseif not p1.disableHoldToPlay then
			var25 = reactModule.createElement(sduiHoldToPlayModule, {
				sduiContext = p1.sduiContext,
				analyticsContext = sduiBuilder.buildAnalyticsContext({}, p1.analyticsContext, {
					eventContext = discoveryAnalyticsModule.Constants.Context.HoldToPlayLauncher,
					referralSource = p1.sduiContext.appPage
				}),
				universeId = universeId,
				placeId = p1.placeId,
				guiObject = var5.current,
				setDisabledForHold = var9
			})
		end
	end
	local var26 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), reactModule (copy), sduiGameTileFooterModule (copy), var13 (ref), var11 (ref), universeId (ref), placeId (ref)
		return if p1.disableDefaultFooterLogic then p1.footerComponent else reactModule.createElement(sduiGameTileFooterModule, {
			isHovered = var13,
			isSelected = var11,
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
		var13, var11, universeId, placeId, p1.ageRatingText,
		p1.disableDefaultFooterLogic, p1.footerComponent, p1.sduiContext,
		p1.analyticsContext, p1.ratingText, p1.playerCount
	})
	local var27 = if fFlagLuaAppSduiGameTileFeedback and var7 and p1.overflowMenuComponent then reactModule.createElement(sduiGameTileOverflowMenuModule, {
		componentConfig = p1.overflowMenuComponent,
		isHovered = var13,
		isSelected = var11,
		menuKey = current,
		onMenuOpenChanged = var20,
		parentRef = var5,
		sduiContext = p1.sduiContext
	}) else nil
	local var28 = nil
	
	if fFlagLuaAppSduiVideoThumbnail and p1.videoPlayer then
		local cornerRadius = p1.cornerRadius or var1.Radius.Medium
		var28 = reactModule.createElement(sduiGameVideoThumbnailModule, {
			sduiContext = p1.sduiContext,
			analyticsContext = p1.analyticsContext,
			videoPlayer = p1.videoPlayer,
			imageComponent = if not (p1.imageComponent or p1.image == nil) then reactModule.createElement(sduiDefaultTileImageModule, {
				image = p1.image,
				thumbnailBackgroundStyle = p1.thumbnailBackgroundStyle,
				isContained = p1.isContained,
				cardCornerRadius = cornerRadius,
				onTileImageLoaded = p1.onTileImageLoaded
			}) else p1.imageComponent,
			universeId = universeId,
			placeId = placeId,
			cornerRadius = cornerRadius,
			isHovered = var13,
			isSelected = var11,
			playbackCandidateRef = var5
		})
	end
	local createElement = reactModule.createElement
	createElement = createElement(sduiTileModule, cryoModule.Dictionary.join(p1, {
		testId = "--sdui-game-tile",
		ctaButtonComponent = var23,
		onMouseEnter = var18,
		onMouseLeave = var19,
		onSelectionGained = var15,
		onSelectionLost = var16,
		renderLegacyHoverState = if fFlagSduiTileDisableLegacyHover then nil else var24,
		isHovered = var13,
		imageComponent = if fFlagLuaAppSduiVideoThumbnail and var28 then var28 else p1.imageComponent,
		setGuiObject = var6,
		onActivated = var10,
		onTouchLongPress = if fFlagLuaAppSduiGameTileFeedback and var27 then var21 else nil,
		thumbnailOverflowMenuComponent = if fFlagLuaAppSduiGameTileFeedback then var27 else nil,
		focusNavActionsComponent = var25,
		footerComponent = var26
	}))
	
	if not enableLegacyHoverState then
		return createElement
	end
	local xSmall = var1.Gap.XSmall
	
	return reactModule.createElement(zoomAnimatedFrame, {
		isZoomEnabled = var13,
		expansionOffsetX = xSmall * 2,
		expansionOffsetTop = xSmall,
		expansionOffsetBottom = xSmall,
		reducedMotion = var2.reducedMotion
	}, {
		HoverShadow = if fFlagLuaAppSduiGameTileHoverShadow and var13 and var4 then reactModule.createElement(tileHoverShadowModule, {
			contentRef = var4,
			hoverPadding = p1.containmentPadding,
			containmentPadding = p1.containmentPadding
		}) else nil,
		Tile = createElement
	})
end)