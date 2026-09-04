local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local getInputModeStore = responsiveModule.GetInputModeStore
local appBloxModule = require(parent.AppBlox)
local foundationModule = require(parent.Foundation)
local cryoModule = require(parent.Cryo)
local discoveryAnalyticsModule = require(parent.DiscoveryAnalytics)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local localizeStrings = require(parent.Localization).localizeStrings
local useTokens = foundationModule.Hooks.useTokens
local usePreferences = foundationModule.Hooks.usePreferences
local gameTileOverflowMenuAction = discoveryAnalyticsModule.Events.gameTileOverflowMenuAction
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiBuilder = sduiCoreSystemModule.SduiBuilder
local sduiErrors = sduiCoreSystemModule.SduiErrors
local getSduiComponentWrapper = sduiCoreSystemModule.getSduiComponentWrapper
local sduiPlayButton = require(parent.SduiSharedContent).SduiPlayButton
local sduiParsers = sduiCoreSystemModule.SduiParsers
local sduiParseHelpers = sduiCoreSystemModule.SduiParseHelpers
local useUidRefString = sduiCoreSystemModule.useUidRefString
local findAnalyticsFieldInAncestors = sduiCoreSystemModule.findAnalyticsFieldInAncestors
local videoEndReason = require(parent.VideoUtils).AnalyticsEnums.VideoEndReason
local gameTileModule = require(parent.GameTile)
local default = gameTileModule.HoverTileCoordinator.default
local zoomAnimatedFrame = gameTileModule.ZoomAnimatedFrame
local getGameTileHiddenStore = gameTileModule.getGameTileHiddenStore
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
local fFlagSduiFixSearchTelemetry = require(parent.SharedFlags).FFlagSduiFixSearchTelemetry
local sduiGameTileDisableDefaultPlayButtonOnHover = game:DefineFastFlag("SduiGameTileDisableDefaultPlayButtonOnHover", false)
local var1 = if fFlagLuaAppSduiGameTileFeedback then signalsModule.createSignal(table.freeze({})) else nil

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), usePreferences (ref), fFlagSduiTileDisableLegacyHover (ref), fFlagLuaAppSduiVideoThumbnail (ref), fFlagLuaAppSduiGameTileHoverShadow (ref), reactModule (ref), useUidRefString (ref), fFlagLuaAppSduiGameTileFeedback (ref), getGameTileHiddenStore (ref), var1 (write), signalsReactModule (ref), sduiErrors (ref), getInputModeStore (ref), sduiParseHelpers (ref), videoEndReason (ref), sduiParsers (ref), sduiActionType (ref), getOverflowMenuSignalStore (ref), default (ref), responsiveModule (ref), gameTileOverflowMenuAction (ref), fFlagLuaAppResetHoverOnSduiPlayButtonActivation (ref), sduiGameTileDisableDefaultPlayButtonOnHover (ref), sduiBuilder (ref), fFlagSduiFixSearchTelemetry (ref), findAnalyticsFieldInAncestors (ref), sduiPlayButton (ref), localizeStrings (ref), discoveryAnalyticsModule (ref), sduiHoldToPlayModule (ref), sduiGameTileFooterModule (ref), sduiGameTileOverflowMenuModule (ref), sduiDefaultTileImageModule (ref), sduiGameVideoThumbnailModule (ref), getSduiComponentWrapper (ref), sduiTileModule (ref), cryoModule (ref), zoomAnimatedFrame (ref), tileHoverShadowModule (ref)
	local var2 = useTokens()
	local var3 = usePreferences()
	local enableLegacyHoverState = not fFlagSduiTileDisableLegacyHover and p1.enableLegacyHoverState
	local var4 = if fFlagLuaAppSduiVideoThumbnail then p1.sduiContext.videoPlaybackContext else nil
	local var5 = if fFlagLuaAppSduiGameTileHoverShadow then reactModule.useRef(nil) else nil
	local current = useUidRefString().current
	local universeId = p1.universeId
	local placeId = p1.placeId
	local var6 = reactModule.useRef(nil)
	local var7 = reactModule.useCallback(function(p2)
		-- upvalues: var6 (ref), p1 (ref)
		var6.current = p2
		
		if p1.setGuiObject then
			p1.setGuiObject(p2)
		end
	end, { p1.setGuiObject })
	local var8 = nil
	local var9 = nil
	local triggerFeedback = nil
	
	if fFlagLuaAppSduiGameTileFeedback then
		var8 = p1.overflowMenuComponent ~= nil and (p1.collectionId ~= nil and (p1.collectionId ~= "" and p1.hiddenStateComponent ~= nil))
		var9 = signalsReactModule.useSignalState(if var8 then getGameTileHiddenStore(p1.collectionId).getHiddenGames else var1)[universeId] == true and p1.hiddenStateComponent ~= nil
		triggerFeedback = p1.sduiContext.dependencies.triggerFeedback
	end
	local var10 = reactModule.useRef(false)
	local var11 = reactModule.useCallback(function(p2)
		-- upvalues: var10 (ref)
		var10.current = p2
	end, {})
	local var12 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), sduiErrors (copy), getInputModeStore (copy), sduiParseHelpers (copy), var10 (ref), fFlagLuaAppSduiVideoThumbnail (copy), var4 (ref), videoEndReason (copy), universeId (ref), sduiParsers (copy), sduiActionType (copy), placeId (ref)
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
			-- upvalues: var10 (copy), fFlagLuaAppSduiVideoThumbnail (copy), var4 (copy), videoEndReason (copy), universeId (copy), p1 (copy), sduiParsers (copy), sduiActionType (copy), placeId (copy), sduiErrors (copy), getInputModeStore (copy), logFailure (ref)
			if var10.current then
				p1.sduiContext.dependencies.logger.reportCounter(sduiErrors.SduiCounterName.GameTileActivatedWhenDisabled, { name = getInputModeStore(false).getLastInputType(false) })
				
				return
			elseif fFlagLuaAppSduiVideoThumbnail and var4 then
				var4.videoPlaybackCoordinator:reset(videoEndReason.TileClicked, nil, universeId, nil)
			end
			if p1.onActivated then
				p1.onActivated()
				
				return
			end
			local var13 = sduiParsers.safeParseCallback({
				actionType = sduiActionType.OpenGameDetails,
				actionParams = { placeId = placeId, universeId = universeId }
			}, p1.sduiContext, p1.analyticsContext)
			
			if var13 then
				p1.sduiContext.dependencies.logger.reportCounter(sduiErrors.SduiCounterName.GameTileActivatedExecuteCallback, { name = getInputModeStore(false).getLastInputType(false) }, true)
				var13()
				
				return
			end
			logFailure("Callback is nil after parsing")
		end)
		
		if not ok then
			logFailure(status)
		end
	end, {
		p1.onActivated, p1.sduiContext, p1.analyticsContext, placeId, universeId,
		p1.componentConfig, if fFlagLuaAppSduiVideoThumbnail then var4 else nil
	})
	local var13, var14 = reactModule.useState(false)
	local var15, var16 = reactModule.useState(false)
	local var17 = reactModule.useCallback(function()
		-- upvalues: var14 (ref), p1 (ref)
		var14(true)
		
		if p1.setCustomConditionState then
			p1.setCustomConditionState("selected", true)
		end
	end, { p1.setCustomConditionState })
	local var18 = reactModule.useCallback(function()
		-- upvalues: var14 (ref), p1 (ref)
		var14(false)
		
		if p1.setCustomConditionState then
			p1.setCustomConditionState("selected", false)
		end
	end, { p1.setCustomConditionState })
	
	if fFlagLuaAppSduiGameTileFeedback then
		reactModule.useEffect(function()
			-- upvalues: var9 (write), getOverflowMenuSignalStore (copy), current (ref), var18 (ref)
			if var9 then
				getOverflowMenuSignalStore().closeMenu(current)
				var18()
			end
		end, { var9, current, var18 })
	end
	local var19 = reactModule.useRef(0)
	
	if var15 == false then
		var19.current = 0
	end
	local default_1 = default.default
	local var20 = reactModule.useCallback(function()
		-- upvalues: var19 (ref), current (ref), getInputModeStore (copy), responsiveModule (copy), default_1 (ref)
		if var19.current == 0 and current and getInputModeStore(false).getLastInputType(false) == responsiveModule.Input.Pointer then
			default_1:requestHover(current)
		end
		var19.current += 1
	end, { current })
	local var21 = reactModule.useCallback(function()
		-- upvalues: var19 (ref), current (ref), default_1 (ref)
		var19.current -= 1
		
		if var19.current < 0 then
			var19.current = 0
		end
		if var19.current == 0 and current then
			default_1:cancelHover(current)
		end
	end, { current })
	reactModule.useEffect(function()
		-- upvalues: current (ref), var15 (ref), default_1 (ref), var16 (ref), p1 (ref), var19 (ref)
		local var22 = var15
		local _ = nil
		local changedConnection = default_1.changed:connect(function(p2)
			-- upvalues: current (copy), var16 (copy), p1 (copy), var22 (write)
			local var23 = p2 == current
			var16(var23)
			
			if p1.setCustomConditionState and var23 ~= var22 then
				p1.setCustomConditionState("hovered", var23)
			end
			var22 = var23
		end)
		
		return function()
			-- upvalues: default_1 (copy), current (ref), var19 (copy), changedConnection (write)
			default_1:cancelHover(current)
			var19.current = 0
			
			if changedConnection ~= nil then
				changedConnection:disconnect()
			end
		end
	end, { current, p1.setCustomConditionState })
	local var22 = nil
	local var23 = nil
	
	if fFlagLuaAppSduiGameTileFeedback then
		var22 = reactModule.useCallback(function(p2)
			-- upvalues: gameTileOverflowMenuAction (copy), universeId (ref), p1 (ref)
			gameTileOverflowMenuAction({
				universeId = universeId,
				sortId = p1.collectionId,
				actionType = if p2 then "GameTileOverflowMenuClosed" else "GameTileOverflowMenuOpened"
			}, p1.sduiContext.appPage)
		end, { universeId, p1.collectionId, p1.sduiContext.appPage })
		var23 = reactModule.useCallback(function()
			-- upvalues: getOverflowMenuSignalStore (copy), triggerFeedback (write), current (ref), p1 (ref), universeId (ref), var22 (write)
			local var24 = getOverflowMenuSignalStore()
			
			if triggerFeedback and not var24.getIsMenuOpen(current) then
				triggerFeedback("TileLongPress", "Press", p1.sduiContext.appPage or "Unknown", { universeId = universeId, sortId = p1.collectionId })
			end
			var24.openMenu(current)
			var22(false)
		end, {
			triggerFeedback, current, p1.sduiContext.appPage, p1.collectionId, var22,
			universeId
		})
	end
	local var24 = if fFlagLuaAppResetHoverOnSduiPlayButtonActivation then reactModule.useCallback(function()
		-- upvalues: var15 (ref), default_1 (ref)
		if var15 then
			default_1:reset()
		end
	end, { var15 }) else nil
	local var25 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), var15 (ref), sduiGameTileDisableDefaultPlayButtonOnHover (copy), sduiBuilder (copy), universeId (ref), placeId (ref), fFlagSduiFixSearchTelemetry (copy), findAnalyticsFieldInAncestors (copy), fFlagSduiTileDisableLegacyHover (copy), reactModule (copy), sduiPlayButton (copy), fFlagLuaAppResetHoverOnSduiPlayButtonActivation (copy), var24 (ref), localizeStrings (copy)
		if p1.ctaButtonComponent then
			return p1.ctaButtonComponent
		elseif not var15 or sduiGameTileDisableDefaultPlayButtonOnHover and p1.disableDefaultPlayButtonOnHover then
			return nil
		end
		local var26 = sduiBuilder.buildAnalyticsContext({}, p1.analyticsContext, {
			universeId = universeId,
			placeId = placeId,
			eventContext = if fFlagSduiFixSearchTelemetry then findAnalyticsFieldInAncestors("eventContext", p1.analyticsContext, "ExperienceTile") else "ExperienceTile",
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
			analyticsContext = var26,
			onActivatedEffect = if fFlagLuaAppResetHoverOnSduiPlayButtonActivation then var24 else nil,
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
			analyticsContext = var26,
			onActivatedEffect = if fFlagLuaAppResetHoverOnSduiPlayButtonActivation then var24 else nil,
			enableUiBloxButton = p1.enableUiBloxButton ~= nil or p1.enableUiBloxButton,
			openGameDetailsOnPurchaseRequired = p1.openGameDetailsOnPurchaseRequired ~= nil or p1.openGameDetailsOnPurchaseRequired
		})
	end, {
		var15, p1.enableLegacyHoverState, universeId, placeId, p1.ctaButtonComponent,
		p1.analyticsContext, p1.sduiContext,
		if fFlagLuaAppResetHoverOnSduiPlayButtonActivation then var24 else nil,
		p1.enableUiBloxButton, p1.openGameDetailsOnPurchaseRequired,
		if sduiGameTileDisableDefaultPlayButtonOnHover then p1.disableDefaultPlayButtonOnHover else nil
	})
	local var26 = if fFlagSduiTileDisableLegacyHover then nil else reactModule.useCallback(function(p2, p3, p4)
		-- upvalues: p1 (ref), reactModule (copy), var20 (ref), var21 (ref), fFlagLuaAppSduiGameTileHoverShadow (copy), var5 (write), var25 (ref)
		return if p1.enableLegacyHoverState then reactModule.createElement("Frame", {
			AutomaticSize = Enum.AutomaticSize.Y,
			Position = UDim2.new(0, -p2, 0, -p2),
			Size = UDim2.new(1, p2 * 2, 0, 0),
			BackgroundColor3 = p3,
			BorderSizePixel = 0,
			BackgroundTransparency = 0,
			[reactModule.Event.MouseEnter] = var20,
			[reactModule.Event.MouseLeave] = var21,
			ref = if fFlagLuaAppSduiGameTileHoverShadow then var5 else nil
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
			ctaButtonComponent = var25
		}) else nil
	end, { var25, var20, var21, p1.enableLegacyHoverState })
	local var27 = nil
	
	if var13 then
		if p1.focusNavActionsComponent then
			var27 = reactModule.cloneElement(p1.focusNavActionsComponent, { extraLocalProps = { guiObject = var6.current } })
		elseif not p1.disableHoldToPlay then
			var27 = reactModule.createElement(sduiHoldToPlayModule, {
				sduiContext = p1.sduiContext,
				analyticsContext = sduiBuilder.buildAnalyticsContext({}, p1.analyticsContext, {
					eventContext = discoveryAnalyticsModule.Constants.Context.HoldToPlayLauncher,
					referralSource = p1.sduiContext.appPage
				}),
				universeId = universeId,
				placeId = p1.placeId,
				guiObject = var6.current,
				setDisabledForHold = var11
			})
		end
	end
	local var28 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), reactModule (copy), sduiGameTileFooterModule (copy), var15 (ref), var13 (ref), universeId (ref), placeId (ref)
		return if p1.disableDefaultFooterLogic then p1.footerComponent else reactModule.createElement(sduiGameTileFooterModule, {
			isHovered = var15,
			isSelected = var13,
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
		var15, var13, universeId, placeId, p1.ageRatingText,
		p1.disableDefaultFooterLogic, p1.footerComponent, p1.sduiContext,
		p1.analyticsContext, p1.ratingText, p1.playerCount
	})
	local var29 = if fFlagLuaAppSduiGameTileFeedback and var8 and (p1.overflowMenuComponent and not var9) then reactModule.createElement(sduiGameTileOverflowMenuModule, {
		componentConfig = p1.overflowMenuComponent,
		isHovered = var15,
		isSelected = var13,
		menuKey = current,
		onMenuOpenChanged = var22,
		parentRef = var6,
		sduiContext = p1.sduiContext
	}) else nil
	local var30 = nil
	
	if fFlagLuaAppSduiVideoThumbnail and p1.videoPlayer and (if fFlagLuaAppSduiGameTileFeedback then not var9 else true) then
		local cornerRadius = p1.cornerRadius or var2.Radius.Medium
		var30 = reactModule.createElement(sduiGameVideoThumbnailModule, {
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
			isHovered = var15,
			isSelected = var13,
			playbackCandidateRef = var6
		})
	end
	local _ = nil
	local var31 = if fFlagLuaAppSduiGameTileFeedback and var9 and p1.hiddenStateComponent then reactModule.createElement(sduiTileModule, {
		isDisabled = true,
		isHovered = false,
		selectable = false,
		testId = "--sdui-game-tile",
		anchorPoint = p1.anchorPoint,
		automaticSize = p1.automaticSize,
		backgroundColor3 = p1.backgroundColor3,
		backgroundStyle = p1.backgroundStyle,
		containmentPadding = p1.containmentPadding,
		cornerRadius = p1.cornerRadius,
		imageAspectRatio = p1.imageAspectRatio,
		imageComponent = reactModule.createElement(getSduiComponentWrapper(p1.hiddenStateComponent), {
			debugName = "SduiGameTile.HiddenState",
			componentConfig = p1.hiddenStateComponent,
			extraLocalProps = { parentRef = var6 },
			sduiContext = p1.sduiContext
		}),
		isContained = p1.isContained,
		layoutOrder = p1.layoutOrder,
		onMouseEnter = var20,
		onMouseLeave = var21,
		position = p1.position,
		sduiContext = p1.sduiContext,
		selectionOrder = p1.selectionOrder,
		setGuiObject = var7,
		size = p1.size,
		zIndex = p1.zIndex
	}) else reactModule.createElement(sduiTileModule, cryoModule.Dictionary.join(p1, {
		testId = "--sdui-game-tile",
		ctaButtonComponent = var25,
		onMouseEnter = var20,
		onMouseLeave = var21,
		onSelectionGained = var17,
		onSelectionLost = var18,
		renderLegacyHoverState = if fFlagSduiTileDisableLegacyHover then nil else var26,
		isHovered = var15,
		imageComponent = if fFlagLuaAppSduiVideoThumbnail and var30 then var30 else p1.imageComponent,
		setGuiObject = var7,
		onActivated = var12,
		onTouchLongPress = if fFlagLuaAppSduiGameTileFeedback and var29 then var23 else nil,
		thumbnailOverflowMenuComponent = if fFlagLuaAppSduiGameTileFeedback then var29 else nil,
		focusNavActionsComponent = var27,
		footerComponent = var28
	}))
	
	if not enableLegacyHoverState then
		return var31
	end
	local xSmall = var2.Gap.XSmall
	
	return reactModule.createElement(zoomAnimatedFrame, {
		isZoomEnabled = var15 and (if fFlagLuaAppSduiGameTileFeedback then not var9 else true),
		expansionOffsetX = xSmall * 2,
		expansionOffsetTop = xSmall,
		expansionOffsetBottom = xSmall,
		reducedMotion = var3.reducedMotion
	}, {
		HoverShadow = if fFlagLuaAppSduiGameTileHoverShadow and var15 and ((if fFlagLuaAppSduiGameTileFeedback then not var9 else true) and var5) then reactModule.createElement(tileHoverShadowModule, {
			contentRef = var5,
			hoverPadding = p1.containmentPadding,
			containmentPadding = p1.containmentPadding
		}) else nil,
		Tile = var31
	})
end)