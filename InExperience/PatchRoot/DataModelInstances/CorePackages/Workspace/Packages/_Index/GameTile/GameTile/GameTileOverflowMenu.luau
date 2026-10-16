local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local GameTile = script:FindFirstAncestor("GameTile")
local Parent = GameTile.Parent
local AppBloxModule = require(Parent.AppBlox)
local CentralOverlayModule = require(Parent.CentralOverlay)
local FoundationModule = require(Parent.Foundation)
local LoggersModule = require(Parent.Loggers)
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local RoactUtilsModule = require(Parent.RoactUtils)
local SharedFlagsModule = require(Parent.SharedFlags)
local UserSignalsModule = require(Parent.UserSignals)
local Selectors = require(Parent.NavigationRodux).Selectors
local GetOverflowMenuSignalStoreFunction = AppBloxModule.getOverflowMenuSignalStore
local OverflowMenu = AppBloxModule.OverflowMenu
local CloseCentralOverlayFunction = CentralOverlayModule.Thunks.CloseCentralOverlay
local SetCentralOverlayFunction = CentralOverlayModule.Actions.SetCentralOverlay
local UseTokensFunction = FoundationModule.Hooks.useTokens
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local AbuseVectorModule = require(Parent.GenericAbuseReporting.AbuseVector)
local OpenDynamicAbuseReportModule = require(Parent.GenericAbuseReporting.OpenDynamicAbuseReport)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local MutedErrorFunction = LoggersModule.mutedError
local FlaggedMutedErrorFunction = LoggersModule.flaggedMutedError
local Default = require(Parent.LoggingProtocol).default
local UseLastInputFunction = ResponsiveModule.useLastInput
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local SetNetworkingErrorToastFunction = require(Parent.RobloxAppToastsRodux).Thunks.SetNetworkingErrorToast
local PostSendUserSignalFunction = UserSignalsModule.PostSendUserSignal
local UserSignalTypes = UserSignalsModule.UserSignalTypes
local GameTileOverflowMenuActionFunction = require(Parent.DiscoveryAnalytics).Events.gameTileOverflowMenuAction
local NotInterestedUserSignalTelemetryEventConfigsModule = require(GameTile.NotInterestedUserSignalTelemetryEventConfigs)
local ActivateGameNotInterestedModule = require(GameTile.activateGameNotInterested)
local SendNotInterestedFeedbackFormAnalyticsModule = require(GameTile.sendNotInterestedFeedbackFormAnalytics)
local UseGameTileActionsModule = require(GameTile.useGameTileActions)
local UseGameTileOverflowMenuFocusNavigationModule = require(GameTile.useGameTileOverflowMenuFocusNavigation)
local TileOverflowMenuItems = require(GameTile.GameTileConstants).TileOverflowMenuItems
local FFlagUseNavigationSelectors = SharedFlagsModule.FFlagUseNavigationSelectors
local FFlagSignalsNavP3fGameDetails = SharedFlagsModule.FFlagSignalsNavP3fGameDetails
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3fGameDetails then require(Parent.NavigationRodux).GetLegacyNavigationStore else nil
local FFlagLuaAppMakeDisclaimerOptInForFeedbackForm = SharedFlagsModule.FFlagLuaAppMakeDisclaimerOptInForFeedbackForm
local FFlagLuaAppNotInterestedFeedbackFormTelemetry = SharedFlagsModule.FFlagLuaAppNotInterestedFeedbackFormTelemetry
local FFlagLuaAppEnableReportExperience = SharedFlagsModule.FFlagLuaAppEnableReportExperience
local FFlagEnableNewReportFlowGameTile = SharedFlagsModule.FFlagEnableNewReportFlowGameTile
local FFlagAddThumbnailSelectorReport = SharedFlagsModule.FFlagAddThumbnailSelectorReport
local FFlagLuaAppContinueSortInstantPlay = SharedFlagsModule.FFlagLuaAppContinueSortInstantPlay
local FFlagLuaAppFixExplicitFeedbackConsoleTelemetry = SharedFlagsModule.FFlagLuaAppFixExplicitFeedbackConsoleTelemetry
local FFlagLuaAppEnableHomepageOneByTwoTile = SharedFlagsModule.FFlagLuaAppEnableHomepageOneByTwoTile
local FFlagLuaAppGameTileNotInterestedDirectAction = SharedFlagsModule.FFlagLuaAppGameTileNotInterestedDirectAction
local FFlagLuaAppExtractNotInterestedHelper = SharedFlagsModule.FFlagLuaAppExtractNotInterestedHelper

return ReactModule.memo(function(p1) --[[ Line: 106 | Named "GameTileOverflowMenu" ]]
	-- upvalues: FFlagLuaAppGameTileNotInterestedDirectAction (copy), UseTokensFunction (copy), UseLastInputFunction (copy), GetOverflowMenuSignalStoreFunction (copy), ReactModule (copy), FFlagLuaAppEnableHomepageOneByTwoTile (copy), GameTileOverflowMenuActionFunction (copy), FFlagLuaAppFixExplicitFeedbackConsoleTelemetry (copy), UseGameTileOverflowMenuFocusNavigationModule (copy), UseGameTileActionsModule (copy), FFlagSignalsNavP3fGameDetails (copy), UseSignalStateFunction (copy), GetLegacyNavigationStore (copy), UseSelectorFunction (copy), FFlagUseNavigationSelectors (copy), Selectors (copy), UserInputService (copy), OverflowMenu (copy), ResponsiveModule (copy), IconSize (copy), UseDispatchFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), UseLocalizationFunction (copy), FFlagLuaAppContinueSortInstantPlay (copy), FFlagLuaAppEnableReportExperience (copy), UserSignalTypes (copy), FlaggedMutedErrorFunction (copy), OpenDynamicAbuseReportModule (copy), AbuseVectorModule (copy), CloseCentralOverlayFunction (copy), Default (copy), NotInterestedUserSignalTelemetryEventConfigsModule (copy), SetNetworkingErrorToastFunction (copy), PostSendUserSignalFunction (copy), HttpService (copy), MutedErrorFunction (copy), FFlagLuaAppNotInterestedFeedbackFormTelemetry (copy), SendNotInterestedFeedbackFormAnalyticsModule (copy), FFlagLuaAppMakeDisclaimerOptInForFeedbackForm (copy), TileOverflowMenuItems (copy), FFlagLuaAppExtractNotInterestedHelper (copy), ActivateGameNotInterestedModule (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy), IconName (copy), FFlagEnableNewReportFlowGameTile (copy), FFlagAddThumbnailSelectorReport (copy)
	if FFlagLuaAppGameTileNotInterestedDirectAction then
		local UseTokensResult = UseTokensFunction()
		local UseLastInputResult = UseLastInputFunction()
		local MenuKey = p1.menuKey
		local _Vector2 = Vector2.new(1, 0)
		local _UDim2 = UDim2.new(1, -UseTokensResult.Padding.Medium, 0, UseTokensResult.Padding.Medium)
		local OverflowMenuSignalStore = GetOverflowMenuSignalStoreFunction()
		local CollectionId = p1.collectionId or ""
		local List = {}
		
		for i, _ in p1.availableMenuItems do
			table.insert(List, i)
		end
		local Joined = table.concat(List, ",")
		local UseResult = ReactModule.useCallback(function(p2) --[[ Line: 121 ]]
			-- upvalues: p1 (copy), Joined (copy)
			if p1.onMenuOpenChanged then
				p1.onMenuOpenChanged(p2, Joined)
			end
		end, { p1.onMenuOpenChanged, Joined })
		local UseGameTileOverflowMenuFocusNavigationModuleResult = if FFlagLuaAppFixExplicitFeedbackConsoleTelemetry then nil else UseGameTileOverflowMenuFocusNavigationModule(MenuKey, p1.isSelected, p1.parentRef)
		local UseGameTileActionsModuleResult = UseGameTileActionsModule(p1, (ReactModule.useCallback(function(MenuItem) --[[ Line: 128 ]]
			-- upvalues: p1 (copy), CollectionId (copy), Joined (copy), FFlagLuaAppEnableHomepageOneByTwoTile (upval), GameTileOverflowMenuActionFunction (upval)
			GameTileOverflowMenuActionFunction({
				actionType = "GameTileOverflowMenuItemActivated",
				universeId = p1.universeId,
				sortId = CollectionId,
				menuItem = MenuItem,
				availableMenuItems = Joined,
				contentType = if FFlagLuaAppEnableHomepageOneByTwoTile then p1.contentType else nil
			}, p1.appPage)
		end, {
			p1.appPage,
			p1.universeId,
			CollectionId,
			Joined,
			if FFlagLuaAppEnableHomepageOneByTwoTile then p1.contentType else nil
		})))
		
		if FFlagLuaAppFixExplicitFeedbackConsoleTelemetry then
			UseGameTileOverflowMenuFocusNavigationModuleResult = UseGameTileOverflowMenuFocusNavigationModule(MenuKey, p1.isSelected, p1.parentRef, UseResult)
		end
		local UseSignalStateResult = nil
		UseSignalStateResult = if FFlagSignalsNavP3fGameDetails then UseSignalStateFunction(GetLegacyNavigationStore(false).getCurrentRouteKey) else UseSelectorFunction(function(p2) --[[ Line: 165 ]]
			-- upvalues: FFlagUseNavigationSelectors (upval), Selectors (upval)
			return (if FFlagUseNavigationSelectors then Selectors.selectCurrentRoactNavigationRoute(p2).key else p2.Navigation.currentRoute.key) or ""
		end)
		local UseRefResult = ReactModule.useRef(UseSignalStateResult)
		ReactModule.useEffect(function() --[[ Line: 174 ]]
			-- upvalues: UseSignalStateResult (ref), UseRefResult (copy), OverflowMenuSignalStore (copy), MenuKey (copy)
			if UseSignalStateResult ~= UseRefResult.current then
				OverflowMenuSignalStore.closeMenu(MenuKey)
			end
		end, {
			UseSignalStateResult,
			MenuKey,
			OverflowMenuSignalStore.closeMenu
		})
		ReactModule.useEffect(function() --[[ Line: 180 ]]
			-- upvalues: p1 (copy), UserInputService (upval), OverflowMenuSignalStore (copy), MenuKey (copy)
			local InputBeganConnection = if p1.menuOpen then UserInputService.InputBegan:Connect(function(Input, _) --[[ Line: 184 ]]
				-- upvalues: p1 (upval), OverflowMenuSignalStore (upval), MenuKey (upval)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 and not p1.isHovered then
					OverflowMenuSignalStore.closeMenu(MenuKey)
				end
			end) else nil
			
			return function() --[[ Line: 193 ]]
				-- upvalues: InputBeganConnection (ref)
				if InputBeganConnection then
					InputBeganConnection:Disconnect()
				end
			end
		end, {
			p1.menuOpen,
			p1.isHovered,
			MenuKey,
			OverflowMenuSignalStore.closeMenu
		})
		
		return ReactModule.createElement(OverflowMenu, {
			anchorPoint = _Vector2,
			anchorPosition = _UDim2,
			menuItems = UseGameTileActionsModuleResult,
			hasOverflowButton = UseLastInputResult == ResponsiveModule.Input.Pointer,
			shouldShowAnchor = p1.isHovered,
			buttonIconBackgroundStyle = UseTokensResult.Color.OverMedia.OverMedia_0,
			menuKey = MenuKey,
			setFocusRef = UseGameTileOverflowMenuFocusNavigationModuleResult,
			onMenuOpenChanged = UseResult,
			buttonIconSize = IconSize.Small
		})
	else
		local UseDispatchResult = UseDispatchFunction()
		local UseTokensResult1 = UseTokensFunction()
		local UseLastInputResult1 = UseLastInputFunction()
		local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
		local UseLocalizationResult = UseLocalizationFunction({
			notInterested = "Feature.GameDetails.Action.NotInterested",
			whyThisAd = "Feature.GameDetails.Action.WhyThisAd",
			reportAd = "Feature.GameDetails.Action.ReportAd",
			dialogTitle = "Feature.GameDetails.Label.ProvideFeedbackTitle",
			dialogText = "Feature.GameDetails.Message.HelpImproveExperience",
			checkboxListTitle = "Feature.GameDetails.Message.HidingExperienceQuestion",
			tooRepetitive = "Feature.GameDetails.Label.TooRepetitive",
			dontLikeGame = "Feature.GameDetails.Label.DontLikeGame",
			dontLikeImage = "Feature.GameDetails.Label.DontLikeImage",
			inappropriateContent = "Feature.GameDetails.Label.InappropriateContent",
			somethingElse = "Feature.GameDetails.Label.SomethingElse",
			gameDetails = if FFlagLuaAppContinueSortInstantPlay then "Feature.GameDetails.Action.GameDetails" else nil,
			reportExperience = if FFlagLuaAppEnableReportExperience then "Feature.GameDetails.Action.Report" else nil
		})
		local CollectionId1 = p1.collectionId or ""
		local MenuKey1 = p1.menuKey
		local _Vector2_1 = Vector2.new(1, 0)
		local _UDim2_1 = UDim2.new(1, -UseTokensResult1.Padding.Medium, 0, UseTokensResult1.Padding.Medium)
		local OverflowMenuSignalStore1 = GetOverflowMenuSignalStoreFunction()
		local SetFocusRef = nil
		
		if not FFlagLuaAppFixExplicitFeedbackConsoleTelemetry then
			local UseSignalStateResult = p1.isSelected
			SetFocusRef = UseGameTileOverflowMenuFocusNavigationModule(MenuKey1, UseSignalStateResult, p1.parentRef)
		end
		local UseSignalStateResult = { UseLocalizationResult }
		local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 245 ]]
			-- upvalues: UserSignalTypes (upval), UseLocalizationResult (copy)
			return {
				{
					id = UserSignalTypes.NotInterestedFeedbackItem.TooRepetitive,
					text = UseLocalizationResult.tooRepetitive
				},
				{
					id = UserSignalTypes.NotInterestedFeedbackItem.DontLikeGame,
					text = UseLocalizationResult.dontLikeGame
				},
				{
					id = UserSignalTypes.NotInterestedFeedbackItem.DontLikeImage,
					text = UseLocalizationResult.dontLikeImage
				},
				{
					id = UserSignalTypes.NotInterestedFeedbackItem.InappropriateContent,
					text = UseLocalizationResult.inappropriateContent
				},
				{
					triggersOtherTextbox = true,
					id = UserSignalTypes.NotInterestedFeedbackItem.SomethingElse,
					text = UseLocalizationResult.somethingElse
				}
			}
		end, UseSignalStateResult)
		
		UseSignalStateResult = function(p2, TextResponse) --[[ Line: 272 ]]
			-- upvalues: UseMemoResult (copy), UserSignalTypes (upval), p1 (copy), FlaggedMutedErrorFunction (upval), UseDispatchResult (copy), OpenDynamicAbuseReportModule (upval), AbuseVectorModule (upval), CloseCentralOverlayFunction (upval), Default (upval), NotInterestedUserSignalTelemetryEventConfigsModule (upval), SetNetworkingErrorToastFunction (upval), PostSendUserSignalFunction (upval), UseRoactServiceResult (copy), HttpService (upval), CollectionId1 (copy), MutedErrorFunction (upval), FFlagLuaAppNotInterestedFeedbackFormTelemetry (upval), SendNotInterestedFeedbackFormAnalyticsModule (upval)
			local Flag = false
			local Items = {}
			
			for _, value in UseMemoResult do
				table.insert(Items, { id = value.id, selected = p2[value.id] or false })
				
				if value.id == UserSignalTypes.NotInterestedFeedbackItem.InappropriateContent and p2[value.id] then
					Flag = true
				end
			end
			if Flag then
				if p1.placeId and p1.placeId ~= "" then
					UseDispatchResult(OpenDynamicAbuseReportModule({
						abuseVector = AbuseVectorModule.Place,
						targetId = p1.placeId,
						onClose = function() --[[ Line: 294 ]]
							-- upvalues: UseDispatchResult (upval), CloseCentralOverlayFunction (upval)
							UseDispatchResult(CloseCentralOverlayFunction())
						end
					}))
				else
					FlaggedMutedErrorFunction("NotInterestedReportPlaceIdMissing", "Place report opened without a place id")
				end
			end
			if not p1.appPage then
				Default:logRobloxTelemetryCounter(NotInterestedUserSignalTelemetryEventConfigsModule.NotInterestedMissingAppPage, 1)
				UseDispatchResult(SetNetworkingErrorToastFunction())
				
				return
			end
			local Success, Result = pcall(function() --[[ Line: 310 ]]
				-- upvalues: PostSendUserSignalFunction (upval), UseRoactServiceResult (upval), HttpService (upval), UserSignalTypes (upval), TextResponse (copy), Items (copy), p1 (upval), CollectionId1 (upval), UseDispatchResult (upval), SetNetworkingErrorToastFunction (upval), Default (upval), NotInterestedUserSignalTelemetryEventConfigsModule (upval)
				PostSendUserSignalFunction(UseRoactServiceResult, {
					stringValue = HttpService:JSONEncode({
						formId = UserSignalTypes.NotInterestedFeedbackFormId.NotInterestedFeedback1,
						titleId = UserSignalTypes.NotInterestedFeedbackFormTitleId.WhyHideExperience,
						textResponse = TextResponse,
						items = Items
					})
				}, {
					id = p1.universeId,
					assetType = if p1.isSponsored then UserSignalTypes.AssetType.SponsoredGame else UserSignalTypes.AssetType.Game,
					signalOrigin = {
						productSurface = p1.appPage,
						topicId = CollectionId1,
						subIds = { CollectionId1 }
					}
				}, UserSignalTypes.SignalValueType.String, UserSignalTypes.SignalType.NotInterestedFeedback):catch(function(Err) --[[ Line: 329 ]]
					-- upvalues: UseDispatchResult (upval), SetNetworkingErrorToastFunction (upval), Default (upval), NotInterestedUserSignalTelemetryEventConfigsModule (upval)
					UseDispatchResult(SetNetworkingErrorToastFunction(Err))
					Default:logRobloxTelemetryCounter(NotInterestedUserSignalTelemetryEventConfigsModule.NotInterestedUserSignalFailed, 1)
				end)
			end)
			
			if not Success then
				MutedErrorFunction(Result)
			end
			if FFlagLuaAppNotInterestedFeedbackFormTelemetry then
				SendNotInterestedFeedbackFormAnalyticsModule({
					actionType = "NotInterestedFeedbackFormSubmitted",
					universeId = p1.universeId,
					sortId = CollectionId1
				}, p1.appPage)
			end
		end
		
		local UseResult = ReactModule.useCallback(UseSignalStateResult, {
			UseRoactServiceResult, UseMemoResult, UseLocalizationResult, p1.universeId,
			p1.placeId, p1.appPage, CollectionId1, UseDispatchResult, p1.isSponsored
		})
		UseSignalStateResult = nil
		local UseResult1 = nil
		
		if FFlagLuaAppNotInterestedFeedbackFormTelemetry then
			UseSignalStateResult = ReactModule.useCallback(function(p3) --[[ Line: 366 ]]
				-- upvalues: SendNotInterestedFeedbackFormAnalyticsModule (upval), p1 (copy), CollectionId1 (copy)
				if not p3 then
					SendNotInterestedFeedbackFormAnalyticsModule({
						actionType = "NotInterestedFeedbackFormClosedWithoutSubmit",
						universeId = p1.universeId,
						sortId = CollectionId1
					}, p1.appPage)
					
					return
				end
			end, { p1.appPage, p1.universeId, CollectionId1 })
			UseResult1 = ReactModule.useCallback(function() --[[ Line: 379 ]]
				-- upvalues: SendNotInterestedFeedbackFormAnalyticsModule (upval), p1 (copy), CollectionId1 (copy)
				SendNotInterestedFeedbackFormAnalyticsModule({
					actionType = "NotInterestedFeedbackFormOpened",
					universeId = p1.universeId,
					sortId = CollectionId1
				}, p1.appPage)
			end, { p1.appPage, p1.universeId, CollectionId1 })
		end
		local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 388 ]]
			-- upvalues: UseLocalizationResult (copy), UseMemoResult (copy), UseResult (copy), FFlagLuaAppNotInterestedFeedbackFormTelemetry (upval), UseSignalStateResult (ref), FFlagLuaAppMakeDisclaimerOptInForFeedbackForm (upval)
			return {
				dialogTitle = UseLocalizationResult.dialogTitle,
				dialogText = UseLocalizationResult.dialogText,
				checkboxListTitle = UseLocalizationResult.checkboxListTitle,
				checkboxItems = UseMemoResult,
				onSubmit = UseResult,
				onClose = if FFlagLuaAppNotInterestedFeedbackFormTelemetry then UseSignalStateResult else nil,
				showTermsOfUseDisclaimer = not FFlagLuaAppMakeDisclaimerOptInForFeedbackForm and nil
			}
		end, { UseLocalizationResult, UseMemoResult, UseResult })
		local List = {}
		
		for i1, _ in p1.availableMenuItems do
			table.insert(List, i1)
		end
		local Joined1 = table.concat(List, ",")
		local UseResult2 = ReactModule.useCallback(function(p3) --[[ Line: 406 ]]
			-- upvalues: p1 (copy), Joined1 (copy)
			if p1.onMenuOpenChanged then
				p1.onMenuOpenChanged(p3, Joined1)
			end
		end, { p1.onMenuOpenChanged, Joined1 })
		local UseResult3 = ReactModule.useCallback(function(MenuItem) --[[ Line: 413 ]]
			-- upvalues: p1 (copy), CollectionId1 (copy), Joined1 (copy), FFlagLuaAppEnableHomepageOneByTwoTile (upval), GameTileOverflowMenuActionFunction (upval)
			GameTileOverflowMenuActionFunction({
				actionType = "GameTileOverflowMenuItemActivated",
				universeId = p1.universeId,
				sortId = CollectionId1,
				menuItem = MenuItem,
				availableMenuItems = Joined1,
				contentType = if FFlagLuaAppEnableHomepageOneByTwoTile then p1.contentType else nil
			}, p1.appPage)
		end, {
			p1.appPage,
			p1.universeId,
			CollectionId1,
			Joined1,
			if FFlagLuaAppEnableHomepageOneByTwoTile then p1.contentType else nil
		})
		
		if FFlagLuaAppFixExplicitFeedbackConsoleTelemetry then
			SetFocusRef = UseGameTileOverflowMenuFocusNavigationModule(MenuKey1, p1.isSelected, p1.parentRef, UseResult2)
		end
		local UseResult4 = if FFlagLuaAppContinueSortInstantPlay then ReactModule.useCallback(function() --[[ Line: 440 ]]
			-- upvalues: p1 (copy), UseResult3 (copy), TileOverflowMenuItems (upval)
			if p1.onGameDetailsActivated then
				p1.onGameDetailsActivated()
			end
			UseResult3(TileOverflowMenuItems.GameDetails)
		end, { p1.onGameDetailsActivated, UseResult3 }) else nil
		local UseResult5 = nil
		UseResult5 = if FFlagLuaAppExtractNotInterestedHelper then ReactModule.useCallback(function() --[[ Line: 452 ]]
			-- upvalues: ActivateGameNotInterestedModule (upval), p1 (copy), CollectionId1 (copy), UseDispatchResult (copy), UseLocalizationResult (copy), UseRoactServiceResult (copy), UseResult3 (copy), TileOverflowMenuItems (upval)
			if ActivateGameNotInterestedModule({
				appPage = p1.appPage,
				collectionId = CollectionId1,
				dispatch = UseDispatchResult,
				isSponsored = p1.isSponsored,
				localizedStrings = UseLocalizationResult,
				networking = UseRoactServiceResult,
				placeId = p1.placeId,
				setGameHidden = p1.setGameHidden,
				universeId = p1.universeId
			}) then
				UseResult3(TileOverflowMenuItems.NotInterested)
			end
		end, {
			CollectionId1, UseDispatchResult, UseLocalizationResult, UseRoactServiceResult,
			UseResult3, p1.appPage, p1.isSponsored, p1.placeId, p1.setGameHidden,
			p1.universeId
		}) else ReactModule.useCallback(function() --[[ Line: 484 ]]
			-- upvalues: p1 (copy), Default (upval), NotInterestedUserSignalTelemetryEventConfigsModule (upval), UseDispatchResult (copy), SetNetworkingErrorToastFunction (upval), SetCentralOverlayFunction (upval), CentralOverlayType (upval), UseMemoResult1 (copy), IconName (upval), FFlagLuaAppNotInterestedFeedbackFormTelemetry (upval), UseResult1 (ref), PostSendUserSignalFunction (upval), UseRoactServiceResult (copy), UserSignalTypes (upval), CollectionId1 (copy), MutedErrorFunction (upval), UseResult3 (copy), TileOverflowMenuItems (upval)
			if not p1.appPage then
				Default:logRobloxTelemetryCounter(NotInterestedUserSignalTelemetryEventConfigsModule.NotInterestedMissingAppPage, 1)
				UseDispatchResult(SetNetworkingErrorToastFunction())
				
				return
			end
			p1.setGameHidden(p1.universeId, true)
			UseDispatchResult(SetCentralOverlayFunction(CentralOverlayType.ProvideFeedbackToast, {
				feedbackFormProps = UseMemoResult1,
				toastIcon = IconName.CircleMinus,
				onToastActivated = if FFlagLuaAppNotInterestedFeedbackFormTelemetry then UseResult1 else nil
			}))
			local Success, Result = pcall(function() --[[ Line: 503 ]]
				-- upvalues: PostSendUserSignalFunction (upval), UseRoactServiceResult (upval), p1 (upval), UserSignalTypes (upval), CollectionId1 (upval), UseDispatchResult (upval), SetNetworkingErrorToastFunction (upval), Default (upval), NotInterestedUserSignalTelemetryEventConfigsModule (upval)
				PostSendUserSignalFunction(UseRoactServiceResult, { boolValue = true }, {
					id = p1.universeId,
					assetType = if p1.isSponsored then UserSignalTypes.AssetType.SponsoredGame else UserSignalTypes.AssetType.Game,
					signalOrigin = {
						productSurface = p1.appPage,
						topicId = CollectionId1,
						subIds = { CollectionId1 }
					}
				}, UserSignalTypes.SignalValueType.Bool, UserSignalTypes.SignalType.NotInterested):catch(function(Err) --[[ Line: 517 ]]
					-- upvalues: p1 (upval), UseDispatchResult (upval), SetNetworkingErrorToastFunction (upval), Default (upval), NotInterestedUserSignalTelemetryEventConfigsModule (upval)
					p1.setGameHidden(p1.universeId, false)
					UseDispatchResult(SetNetworkingErrorToastFunction(Err))
					Default:logRobloxTelemetryCounter(NotInterestedUserSignalTelemetryEventConfigsModule.NotInterestedUserSignalFailed, 1)
				end)
			end)
			
			if not Success then
				p1.setGameHidden(p1.universeId, false)
				MutedErrorFunction(Result)
			end
			UseResult3(TileOverflowMenuItems.NotInterested)
		end, {
			UseRoactServiceResult, p1.setGameHidden, UseDispatchResult, UseMemoResult1,
			p1.universeId, CollectionId1, p1.appPage, UseResult3, p1.isSponsored
		})
		local UseResult6 = ReactModule.useCallback(function() --[[ Line: 550 ]]
			-- upvalues: UseDispatchResult (copy), SetCentralOverlayFunction (upval), CentralOverlayType (upval), p1 (copy), FFlagLuaAppEnableHomepageOneByTwoTile (upval), UseResult3 (copy), TileOverflowMenuItems (upval)
			UseDispatchResult(SetCentralOverlayFunction(CentralOverlayType.WhyThisAdModal, {
				universeId = p1.universeId,
				payerName = p1.payerName,
				sponsoredUserCohort = p1.sponsoredUserCohort,
				contentType = if FFlagLuaAppEnableHomepageOneByTwoTile then p1.contentType else nil
			}))
			UseResult3(TileOverflowMenuItems.WhyThisAd)
		end, {
			UseDispatchResult, p1.universeId, p1.payerName, p1.sponsoredUserCohort,
			if FFlagLuaAppEnableHomepageOneByTwoTile then p1.contentType else nil,
			UseResult3
		})
		local UseResult7 = ReactModule.useCallback(function() --[[ Line: 571 ]]
			-- upvalues: p1 (copy), FlaggedMutedErrorFunction (upval), UseDispatchResult (copy), OpenDynamicAbuseReportModule (upval), AbuseVectorModule (upval), CloseCentralOverlayFunction (upval), UseResult3 (copy), TileOverflowMenuItems (upval)
			if p1.adId then
				UseDispatchResult(OpenDynamicAbuseReportModule({
					abuseVector = AbuseVectorModule.AdV2,
					targetId = p1.adId,
					onClose = function() --[[ Line: 580 ]]
						-- upvalues: UseDispatchResult (upval), CloseCentralOverlayFunction (upval)
						UseDispatchResult(CloseCentralOverlayFunction())
					end
				}))
				UseResult3(TileOverflowMenuItems.ReportAd)
				
				return
			else
				FlaggedMutedErrorFunction("ReportSponsoredAdError", "Report ad clicked without valid target ad id")
			end
		end, { UseDispatchResult, p1.adId, UseResult3 })
		local UseResult8 = if FFlagLuaAppEnableReportExperience then ReactModule.useCallback(function() --[[ Line: 596 ]]
			-- upvalues: p1 (copy), FlaggedMutedErrorFunction (upval), UseDispatchResult (copy), OpenDynamicAbuseReportModule (upval), FFlagEnableNewReportFlowGameTile (upval), AbuseVectorModule (upval), FFlagAddThumbnailSelectorReport (upval), CloseCentralOverlayFunction (upval), UseResult3 (copy), TileOverflowMenuItems (upval)
			if p1.placeId then
				UseDispatchResult(OpenDynamicAbuseReportModule({
					abuseVector = if FFlagEnableNewReportFlowGameTile then AbuseVectorModule.GameTile else AbuseVectorModule.Place,
					targetId = p1.placeId,
					custom = if FFlagAddThumbnailSelectorReport then { universeId = p1.universeId } else nil,
					onClose = function() --[[ Line: 613 ]]
						-- upvalues: UseDispatchResult (upval), CloseCentralOverlayFunction (upval)
						UseDispatchResult(CloseCentralOverlayFunction())
					end
				}))
				UseResult3(TileOverflowMenuItems.ReportExperience)
				
				return
			else
				FlaggedMutedErrorFunction("ReportExperienceError", "Report experience clicked without valid target place id")
			end
		end, { UseDispatchResult, p1.placeId, p1.universeId, UseResult3 }) else nil
		local UseMemoResult2 = ReactModule.useMemo(function() --[[ Line: 630 ]]
			-- upvalues: FFlagLuaAppContinueSortInstantPlay (upval), p1 (copy), TileOverflowMenuItems (upval), UseLocalizationResult (copy), UseResult4 (copy), UseResult5 (ref), UseResult6 (copy), IconName (upval), UseResult7 (copy), FFlagLuaAppEnableReportExperience (upval), UseResult8 (copy)
			local List = {}
			
			if FFlagLuaAppContinueSortInstantPlay and p1.availableMenuItems[TileOverflowMenuItems.GameDetails] then
				table.insert(List, {
					icon = "icons/actions/info",
					id = TileOverflowMenuItems.GameDetails,
					text = UseLocalizationResult.gameDetails,
					onActivated = UseResult4
				})
			end
			if p1.availableMenuItems[TileOverflowMenuItems.NotInterested] then
				table.insert(List, {
					icon = "icons/actions/block",
					id = TileOverflowMenuItems.NotInterested,
					text = UseLocalizationResult.notInterested,
					onActivated = UseResult5
				})
			end
			if p1.availableMenuItems[TileOverflowMenuItems.WhyThisAd] then
				table.insert(List, {
					icon = "icons/actions/info",
					id = TileOverflowMenuItems.WhyThisAd,
					text = UseLocalizationResult.whyThisAd,
					onActivated = UseResult6
				})
			end
			if p1.availableMenuItems[TileOverflowMenuItems.ReportAd] then
				table.insert(List, {
					icon = IconName.Flag,
					id = TileOverflowMenuItems.ReportAd,
					text = UseLocalizationResult.reportAd,
					onActivated = UseResult7
				})
			end
			if FFlagLuaAppEnableReportExperience and p1.availableMenuItems[TileOverflowMenuItems.ReportExperience] then
				table.insert(List, {
					icon = IconName.Flag,
					id = TileOverflowMenuItems.ReportExperience,
					text = UseLocalizationResult.reportExperience,
					onActivated = UseResult8
				})
			end
			return List
		end, {
			if FFlagLuaAppContinueSortInstantPlay then UseResult4 else nil, UseResult5,
			UseLocalizationResult, UseResult6,
			FFlagLuaAppEnableReportExperience and UseResult7 or nil,
			FFlagLuaAppEnableReportExperience and UseResult8 or nil, p1.isSponsored,
			p1.availableMenuItems
		})
		local UseSignalStateResult1 = nil
		UseSignalStateResult1 = if FFlagSignalsNavP3fGameDetails then UseSignalStateFunction(GetLegacyNavigationStore(false).getCurrentRouteKey) else UseSelectorFunction(function(p3) --[[ Line: 699 ]]
			-- upvalues: FFlagUseNavigationSelectors (upval), Selectors (upval)
			return (if FFlagUseNavigationSelectors then Selectors.selectCurrentRoactNavigationRoute(p3).key else p3.Navigation.currentRoute.key) or ""
		end)
		local UseRefResult1 = ReactModule.useRef(UseSignalStateResult1)
		ReactModule.useEffect(function() --[[ Line: 708 ]]
			-- upvalues: UseSignalStateResult1 (ref), UseRefResult1 (copy), OverflowMenuSignalStore1 (copy), MenuKey1 (copy)
			if UseSignalStateResult1 ~= UseRefResult1.current then
				OverflowMenuSignalStore1.closeMenu(MenuKey1)
			end
		end, { UseSignalStateResult1, MenuKey1 })
		ReactModule.useEffect(function() --[[ Line: 714 ]]
			-- upvalues: p1 (copy), UserInputService (upval), OverflowMenuSignalStore1 (copy), MenuKey1 (copy)
			local InputBeganConnection = if p1.menuOpen then UserInputService.InputBegan:Connect(function(Input, _) --[[ Line: 717 ]]
				-- upvalues: p1 (upval), OverflowMenuSignalStore1 (upval), MenuKey1 (upval)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 and not p1.isHovered then
					OverflowMenuSignalStore1.closeMenu(MenuKey1)
				end
			end) else nil
			
			return function() --[[ Line: 725 ]]
				-- upvalues: InputBeganConnection (ref)
				if InputBeganConnection then
					InputBeganConnection:Disconnect()
				end
			end
		end, { p1.menuOpen, p1.isHovered, MenuKey1 })
		
		return ReactModule.createElement(OverflowMenu, {
			anchorPoint = _Vector2_1,
			anchorPosition = _UDim2_1,
			menuItems = UseMemoResult2,
			hasOverflowButton = UseLastInputResult1 == ResponsiveModule.Input.Pointer,
			shouldShowAnchor = p1.isHovered,
			buttonIconBackgroundStyle = UseTokensResult1.Color.OverMedia.OverMedia_0,
			menuKey = MenuKey1,
			setFocusRef = SetFocusRef,
			onMenuOpenChanged = UseResult2,
			buttonIconSize = IconSize.Small
		})
	end
end)