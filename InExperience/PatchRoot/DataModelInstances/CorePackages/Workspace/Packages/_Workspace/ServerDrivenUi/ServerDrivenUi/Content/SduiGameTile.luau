local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local GetInputModeStoreFunction = ResponsiveModule.GetInputModeStore
local FoundationModule = require(Parent.Foundation)
local CryoModule = require(Parent.Cryo)
local DiscoveryAnalyticsModule = require(Parent.DiscoveryAnalytics)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local LocalizeStringsFunction = require(Parent.Localization).localizeStrings
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UsePreferencesFunction = FoundationModule.Hooks.usePreferences
local GameTileOverflowMenuActionFunction = DiscoveryAnalyticsModule.Events.gameTileOverflowMenuAction
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiBuilder = SduiCoreSystemModule.SduiBuilder
local SduiErrors = SduiCoreSystemModule.SduiErrors
local GetSduiComponentWrapperFunction = SduiCoreSystemModule.getSduiComponentWrapper
local SduiSharedContentModule = require(Parent.SduiSharedContent)
local SduiPlayButton = SduiSharedContentModule.SduiPlayButton
local SduiTileOverflowMenu = SduiSharedContentModule.SduiTileOverflowMenu
local SduiParsers = SduiCoreSystemModule.SduiParsers
local SduiParseHelpers = SduiCoreSystemModule.SduiParseHelpers
local UseUidRefStringFunction = SduiCoreSystemModule.useUidRefString
local FindAnalyticsFieldInAncestorsFunction = SduiCoreSystemModule.findAnalyticsFieldInAncestors
local VideoEndReason = require(Parent.VideoUtils).AnalyticsEnums.VideoEndReason
local GameTileModule = require(Parent.GameTile)
local Default = GameTileModule.HoverTileCoordinator.default
local ZoomAnimatedFrame = GameTileModule.ZoomAnimatedFrame
local GetGameTileHiddenStoreFunction = GameTileModule.getGameTileHiddenStore
local GetOverflowMenuSignalStoreFunction = require(Parent.AppBlox).getOverflowMenuSignalStore
local SduiTileModule = require(ServerDrivenUi.Content.SduiTile)
local SduiGameVideoThumbnailModule = require(ServerDrivenUi.Content.SduiGameVideoThumbnail)
local TileHoverShadowModule = require(ServerDrivenUi.Content.TileHoverShadow)
local SduiGameTileFooterModule = require(ServerDrivenUi.Content.SduiGameTileFooter)
local SduiHoldToPlayModule = require(ServerDrivenUi.FocusNavigation.SduiHoldToPlay)
local SduiDefaultTileImageModule = require(ServerDrivenUi.Content.SduiDefaultTileImage)
local FFlagSduiTileDisableLegacyHover = require(ServerDrivenUi.Flags).FFlagSduiTileDisableLegacyHover
local FFlagEnableGameJoinEarlyAccess = require(Parent.SharedFlags).FFlagEnableGameJoinEarlyAccess
local FFlagLuaAppSduiVideoThumbnail = require(Parent.SharedFlags).FFlagLuaAppSduiVideoThumbnail
local FFlagLuaAppSduiGameTileFeedback = require(Parent.SharedFlags).FFlagLuaAppSduiGameTileFeedback
local FFlagLuaAppSduiGameTileMetadataFontStyle = require(Parent.SharedFlags).FFlagLuaAppSduiGameTileMetadataFontStyle
local FFlagSduiFixSearchTelemetry = require(Parent.SharedFlags).FFlagSduiFixSearchTelemetry
local SduiGameTileDisableDefaultPlayButtonOnHover = game:DefineFastFlag("SduiGameTileDisableDefaultPlayButtonOnHover", false)
local FFlagSduiGameTileDirectAction = require(Parent.SharedFlags).FFlagSduiGameTileDirectAction
local FFlagSduiGameTileUseFooterComponentAsDefault = require(Parent.SharedFlags).FFlagSduiGameTileUseFooterComponentAsDefault
local Signal = if FFlagLuaAppSduiGameTileFeedback then SignalsModule.createSignal(false) else nil

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), UsePreferencesFunction (copy), FFlagSduiTileDisableLegacyHover (copy), FFlagLuaAppSduiVideoThumbnail (copy), ReactModule (copy), UseUidRefStringFunction (copy), FFlagLuaAppSduiGameTileFeedback (copy), Signal (ref), GetGameTileHiddenStoreFunction (copy), SignalsModule (copy), SignalsReactModule (copy), SduiErrors (copy), GetInputModeStoreFunction (copy), SduiParseHelpers (copy), VideoEndReason (copy), SduiParsers (copy), SduiActionType (copy), GetOverflowMenuSignalStoreFunction (copy), Default (copy), ResponsiveModule (copy), GameTileOverflowMenuActionFunction (copy), SduiGameTileDisableDefaultPlayButtonOnHover (copy), SduiBuilder (copy), FFlagSduiFixSearchTelemetry (copy), FindAnalyticsFieldInAncestorsFunction (copy), SduiPlayButton (copy), FFlagEnableGameJoinEarlyAccess (copy), LocalizeStringsFunction (copy), DiscoveryAnalyticsModule (copy), SduiHoldToPlayModule (copy), SduiGameTileFooterModule (copy), FFlagSduiGameTileUseFooterComponentAsDefault (copy), FFlagLuaAppSduiGameTileMetadataFontStyle (copy), SduiTileOverflowMenu (copy), FFlagSduiGameTileDirectAction (copy), SduiDefaultTileImageModule (copy), SduiGameVideoThumbnailModule (copy), GetSduiComponentWrapperFunction (copy), SduiTileModule (copy), CryoModule (copy), ZoomAnimatedFrame (copy), TileHoverShadowModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UsePreferencesResult = UsePreferencesFunction()
	local EnableLegacyHoverState = not FFlagSduiTileDisableLegacyHover and p1.enableLegacyHoverState
	local VideoPlaybackContext = if FFlagLuaAppSduiVideoThumbnail then p1.sduiContext.videoPlaybackContext else nil
	local UseRefResult = ReactModule.useRef(nil)
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
	local HasHiddenStateComponent: boolean? = nil
	local UseSignalStateResult = nil
	local TriggerFeedbackFunction = nil
	
	if FFlagLuaAppSduiGameTileFeedback then
		HasHiddenStateComponent = p1.overflowMenuComponent ~= nil and (p1.collectionId ~= nil and (p1.collectionId ~= "" and p1.hiddenStateComponent ~= nil))
		UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
			-- upvalues: HasHiddenStateComponent (ref), Signal (upval), GetGameTileHiddenStoreFunction (upval), p1 (copy), SignalsModule (upval), UniverseId (copy)
			if HasHiddenStateComponent then
				local GetHiddenGamesFunction = GetGameTileHiddenStoreFunction(p1.collectionId).getHiddenGames
				
				return SignalsModule.createComputed(function(p2): boolean
					-- upvalues: GetHiddenGamesFunction (copy), UniverseId (upval)
					return GetHiddenGamesFunction(p2)[UniverseId] == true
				end)
			else
				return Signal
			end
		end, { HasHiddenStateComponent, p1.collectionId, UniverseId })))
		TriggerFeedbackFunction = p1.sduiContext.dependencies.triggerFeedback
	end
	local UseRefResult2 = ReactModule.useRef(false)
	local UseResult1 = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult2 (copy)
		UseRefResult2.current = Current
	end, {})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), SduiErrors (upval), GetInputModeStoreFunction (upval), SduiParseHelpers (upval), UseRefResult2 (copy), FFlagLuaAppSduiVideoThumbnail (upval), VideoPlaybackContext (copy), VideoEndReason (upval), UniverseId (copy), SduiParsers (upval), SduiActionType (upval), PlaceId (copy)
		p1.sduiContext.dependencies.logger.reportCounter(SduiErrors.SduiCounterName.GameTileActivated, {
			name = GetInputModeStoreFunction(false).getLastInputType(false)
		}, true)
		
		local function logFailure(p2)
			-- upvalues: SduiParseHelpers (upval), p1 (upval), SduiErrors (upval), GetInputModeStoreFunction (upval)
			p1.sduiContext.dependencies.logger.reportError(SduiErrors.SduiErrorType.FailedToExecuteAction, {
				componentType = "GameTile",
				message = `Error executing GameTile.onActivated error: '{if p4 then SduiParseHelpers.stringifyValue(p4) else ""}' config: {SduiParseHelpers.stringifyValue(p1.componentConfig)}`,
				name = GetInputModeStoreFunction(false).getLastInputType(false)
			}, p1.sduiContext.appPage)
		end
		
		local Success, Result = pcall(function()
			-- upvalues: UseRefResult2 (upval), FFlagLuaAppSduiVideoThumbnail (upval), VideoPlaybackContext (upval), VideoEndReason (upval), UniverseId (upval), p1 (upval), SduiParsers (upval), SduiActionType (upval), PlaceId (upval), SduiErrors (upval), GetInputModeStoreFunction (upval), logFailure (copy)
			if UseRefResult2.current then
				p1.sduiContext.dependencies.logger.reportCounter(SduiErrors.SduiCounterName.GameTileActivatedWhenDisabled, {
					name = GetInputModeStoreFunction(false).getLastInputType(false)
				})
				
				return
			end
			if FFlagLuaAppSduiVideoThumbnail and VideoPlaybackContext then
				VideoPlaybackContext.videoPlaybackCoordinator:reset(VideoEndReason.TileClicked, nil, UniverseId, nil)
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
		p1.componentConfig,
		if FFlagLuaAppSduiVideoThumbnail then VideoPlaybackContext else nil
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
	
	if FFlagLuaAppSduiGameTileFeedback then
		ReactModule.useEffect(function()
			-- upvalues: UseSignalStateResult (ref), GetOverflowMenuSignalStoreFunction (upval), Current (copy), UseResult4 (copy)
			if UseSignalStateResult then
				GetOverflowMenuSignalStoreFunction().closeMenu(Current)
				UseResult4()
			end
		end, { UseSignalStateResult, Current, UseResult4 })
	end
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
	local Callback = nil
	local UseResult7 = nil
	
	if FFlagLuaAppSduiGameTileFeedback then
		Callback = ReactModule.useCallback(function(p2)
			-- upvalues: GameTileOverflowMenuActionFunction (upval), UniverseId (copy), p1 (copy)
			GameTileOverflowMenuActionFunction({
				universeId = UniverseId,
				sortId = p1.collectionId,
				actionType = if p2 then "GameTileOverflowMenuClosed" else "GameTileOverflowMenuOpened"
			}, p1.sduiContext.appPage)
		end, { UniverseId, p1.collectionId, p1.sduiContext.appPage })
		UseResult7 = ReactModule.useCallback(function()
			-- upvalues: GetOverflowMenuSignalStoreFunction (upval), TriggerFeedbackFunction (ref), Current (copy), p1 (copy), UniverseId (copy), Callback (ref)
			local OverflowMenuSignalStore = GetOverflowMenuSignalStoreFunction()
			
			if TriggerFeedbackFunction and not OverflowMenuSignalStore.getIsMenuOpen(Current) then
				TriggerFeedbackFunction("TileLongPress", "Press", p1.sduiContext.appPage or "Unknown", { universeId = UniverseId, sortId = p1.collectionId })
			end
			OverflowMenuSignalStore.openMenu(Current)
			Callback(false)
		end, {
			TriggerFeedbackFunction, Current, p1.sduiContext.appPage, p1.collectionId,
			Callback, UniverseId
		})
	end
	local UseResult8 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult1 (copy), Default1 (copy)
		if UseStateResult1 then
			Default1:reset()
		end
	end, { UseStateResult1 })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), UseStateResult1 (copy), SduiGameTileDisableDefaultPlayButtonOnHover (upval), SduiBuilder (upval), UniverseId (copy), PlaceId (copy), FFlagSduiFixSearchTelemetry (upval), FindAnalyticsFieldInAncestorsFunction (upval), FFlagSduiTileDisableLegacyHover (upval), ReactModule (upval), SduiPlayButton (upval), FFlagEnableGameJoinEarlyAccess (upval), UseResult8 (copy), LocalizeStringsFunction (upval)
		if p1.ctaButtonComponent then
			return p1.ctaButtonComponent
		elseif UseStateResult1 and (not SduiGameTileDisableDefaultPlayButtonOnHover or not p1.disableDefaultPlayButtonOnHover) then
			local AnalyticsContext = SduiBuilder.buildAnalyticsContext({}, p1.analyticsContext, {
				universeId = UniverseId,
				placeId = PlaceId,
				eventContext = if FFlagSduiFixSearchTelemetry then FindAnalyticsFieldInAncestorsFunction("eventContext", p1.analyticsContext, "ExperienceTile") else "ExperienceTile",
				referralSource = p1.sduiContext.appPage
			})
			
			return if FFlagSduiTileDisableLegacyHover or not p1.enableLegacyHoverState then ReactModule.createElement(SduiPlayButton, {
				hidePlayableIcon = true,
				height = 40,
				buttonSize = "Medium",
				hideOptionalText = true,
				isPlayableWhenLoading = true,
				preferSecondaryPlayButton = true,
				universeId = UniverseId,
				placeId = PlaceId,
				sduiContext = p1.sduiContext,
				playableText = LocalizeStringsFunction(p1.sduiContext.dependencies.localization, { Join = "Common.VisitGame.Label.Play" }).Join,
				width = UDim.new(0, 60),
				analyticsContext = AnalyticsContext,
				enableEarlyAccessState = not FFlagEnableGameJoinEarlyAccess and nil,
				onActivatedEffect = UseResult8,
				enableUiBloxButton = p1.enableUiBloxButton == nil or p1.enableUiBloxButton,
				openGameDetailsOnPurchaseRequired = p1.openGameDetailsOnPurchaseRequired == nil or p1.openGameDetailsOnPurchaseRequired
			}) else ReactModule.createElement(SduiPlayButton, {
				buttonSize = "Medium",
				fillBehavior = "Fill",
				isPlayableWhenLoading = true,
				preferSecondaryPlayButton = true,
				universeId = UniverseId,
				placeId = PlaceId,
				sduiContext = p1.sduiContext,
				analyticsContext = AnalyticsContext,
				enableEarlyAccessState = not FFlagEnableGameJoinEarlyAccess and nil,
				onActivatedEffect = UseResult8,
				enableUiBloxButton = p1.enableUiBloxButton == nil or p1.enableUiBloxButton,
				openGameDetailsOnPurchaseRequired = p1.openGameDetailsOnPurchaseRequired == nil or p1.openGameDetailsOnPurchaseRequired
			})
		else
			return nil
		end
	end, {
		UseStateResult1, p1.enableLegacyHoverState, UniverseId, PlaceId,
		p1.ctaButtonComponent, p1.analyticsContext, p1.sduiContext, UseResult8,
		p1.enableUiBloxButton, p1.openGameDetailsOnPurchaseRequired,
		if SduiGameTileDisableDefaultPlayButtonOnHover then p1.disableDefaultPlayButtonOnHover else nil
	})
	local UseResult9 = if FFlagSduiTileDisableLegacyHover then nil else ReactModule.useCallback(function(Offset: number, BackgroundColor3, Offset1)
		-- upvalues: p1 (copy), ReactModule (upval), UseResult5 (copy), UseResult6 (copy), UseRefResult (copy), UseMemoResult (copy)
		return if p1.enableLegacyHoverState then ReactModule.createElement("Frame", {
			AutomaticSize = Enum.AutomaticSize.Y,
			Position = UDim2.new(0, -Offset, 0, -Offset),
			Size = UDim2.new(1, Offset * 2, 0, 0),
			BackgroundColor3 = BackgroundColor3,
			BorderSizePixel = 0,
			BackgroundTransparency = 0,
			[ReactModule.Event.MouseEnter] = UseResult5,
			[ReactModule.Event.MouseLeave] = UseResult6,
			ref = UseRefResult
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
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), ReactModule (upval), SduiGameTileFooterModule (upval), UseStateResult1 (copy), UseStateResult (copy), FFlagSduiGameTileUseFooterComponentAsDefault (upval), UniverseId (copy), PlaceId (copy), FFlagLuaAppSduiGameTileMetadataFontStyle (upval)
		return if p1.disableDefaultFooterLogic then p1.footerComponent else ReactModule.createElement(SduiGameTileFooterModule, {
			isHovered = UseStateResult1,
			isSelected = UseStateResult,
			ageRatingText = p1.ageRatingText,
			footerComponent = p1.footerComponent,
			useFooterComponentAsDefault = if FFlagSduiGameTileUseFooterComponentAsDefault then p1.useFooterComponentAsDefault else nil,
			sduiContext = p1.sduiContext,
			universeId = UniverseId,
			placeId = PlaceId,
			analyticsContext = p1.analyticsContext,
			ratingText = p1.ratingText,
			playerCount = p1.playerCount,
			metadataFontStyle = if FFlagLuaAppSduiGameTileMetadataFontStyle then p1.metadataFontStyle else nil
		})
	end, {
		UseStateResult1, UseStateResult, UniverseId, PlaceId, p1.ageRatingText,
		p1.disableDefaultFooterLogic, p1.footerComponent,
		if FFlagSduiGameTileUseFooterComponentAsDefault then p1.useFooterComponentAsDefault else nil,
		p1.sduiContext, p1.analyticsContext, p1.ratingText, p1.playerCount,
		if FFlagLuaAppSduiGameTileMetadataFontStyle then p1.metadataFontStyle else nil
	})
	local Element = if FFlagLuaAppSduiGameTileFeedback and HasHiddenStateComponent and p1.overflowMenuComponent and not UseSignalStateResult then ReactModule.createElement(SduiTileOverflowMenu, {
		debugName = "SduiGameTile.OverflowMenu",
		zIndex = 5,
		componentConfig = p1.overflowMenuComponent,
		directActionComponentConfig = if FFlagSduiGameTileDirectAction then p1.directActionComponent else nil,
		isHovered = UseStateResult1,
		isSelected = UseStateResult,
		menuKey = Current,
		onMenuOpenChanged = Callback,
		parentRef = UseRefResult1,
		sduiContext = p1.sduiContext
	}) else nil
	local Element1 = nil
	
	if FFlagLuaAppSduiVideoThumbnail and p1.videoPlayer and (not FFlagLuaAppSduiGameTileFeedback or not UseSignalStateResult) then
		local CornerRadius = p1.cornerRadius or UseTokensResult.Radius.Medium
		Element1 = ReactModule.createElement(SduiGameVideoThumbnailModule, {
			sduiContext = p1.sduiContext,
			analyticsContext = p1.analyticsContext,
			videoPlayer = p1.videoPlayer,
			imageComponent = if p1.imageComponent or p1.image == nil then p1.imageComponent else ReactModule.createElement(SduiDefaultTileImageModule, {
				image = p1.image,
				thumbnailBackgroundStyle = p1.thumbnailBackgroundStyle,
				isContained = p1.isContained,
				cardCornerRadius = CornerRadius
			}),
			universeId = UniverseId,
			placeId = PlaceId,
			cornerRadius = CornerRadius,
			isHovered = UseStateResult1,
			isSelected = UseStateResult,
			playbackCandidateRef = UseRefResult1
		})
	end
	local Element2 = if FFlagLuaAppSduiGameTileFeedback and UseSignalStateResult and p1.hiddenStateComponent then ReactModule.createElement(SduiTileModule, {
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
		imageComponent = ReactModule.createElement(GetSduiComponentWrapperFunction(p1.hiddenStateComponent), {
			debugName = "SduiGameTile.HiddenState",
			componentConfig = p1.hiddenStateComponent,
			extraLocalProps = { parentRef = UseRefResult1 },
			sduiContext = p1.sduiContext
		}),
		isContained = p1.isContained,
		layoutOrder = p1.layoutOrder,
		onMouseEnter = UseResult5,
		onMouseLeave = UseResult6,
		position = p1.position,
		sduiContext = p1.sduiContext,
		selectionOrder = p1.selectionOrder,
		setGuiObject = UseResult,
		size = p1.size,
		zIndex = p1.zIndex
	}) else ReactModule.createElement(SduiTileModule, CryoModule.Dictionary.join(p1, {
		testId = "--sdui-game-tile",
		ctaButtonComponent = UseMemoResult,
		onMouseEnter = UseResult5,
		onMouseLeave = UseResult6,
		onSelectionGained = UseResult3,
		onSelectionLost = UseResult4,
		renderLegacyHoverState = if FFlagSduiTileDisableLegacyHover then nil else UseResult9,
		isHovered = UseStateResult1,
		imageComponent = if FFlagLuaAppSduiVideoThumbnail and Element1 then Element1 else p1.imageComponent,
		setGuiObject = UseResult,
		onActivated = UseResult2,
		onTouchLongPress = if FFlagLuaAppSduiGameTileFeedback and Element then UseResult7 else nil,
		thumbnailOverflowMenuComponent = if FFlagLuaAppSduiGameTileFeedback then Element else nil,
		focusNavActionsComponent = CloneElementResult,
		footerComponent = UseMemoResult1
	}))
	
	if EnableLegacyHoverState then
		local XSmall: number = UseTokensResult.Gap.XSmall
		
		return ReactModule.createElement(ZoomAnimatedFrame, {
			isZoomEnabled = UseStateResult1 and (not FFlagLuaAppSduiGameTileFeedback or not UseSignalStateResult),
			expansionOffsetX = XSmall * 2,
			expansionOffsetTop = XSmall,
			expansionOffsetBottom = XSmall,
			reducedMotion = UsePreferencesResult.reducedMotion
		}, {
			HoverShadow = if UseStateResult1 and ((not FFlagLuaAppSduiGameTileFeedback or not UseSignalStateResult) and UseRefResult) then ReactModule.createElement(TileHoverShadowModule, {
				contentRef = UseRefResult,
				hoverPadding = p1.containmentPadding,
				containmentPadding = p1.containmentPadding
			}) else nil,
			Tile = Element2
		})
	else
		return Element2
	end
end)