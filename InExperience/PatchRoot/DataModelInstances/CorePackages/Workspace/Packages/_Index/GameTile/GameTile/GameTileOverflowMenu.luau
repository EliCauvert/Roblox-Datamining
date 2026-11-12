local UserInputService = game:GetService("UserInputService")
local GameTile = script:FindFirstAncestor("GameTile")
local Parent = GameTile.Parent
local AppBloxModule = require(Parent.AppBlox)
local CentralOverlayModule = require(Parent.CentralOverlay)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local RoactUtilsModule = require(Parent.RoactUtils)
local SharedFlagsModule = require(Parent.SharedFlags)
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
local FlaggedMutedErrorFunction = require(Parent.Loggers).flaggedMutedError
local UseLastInputFunction = ResponsiveModule.useLastInput
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local GameTileOverflowMenuActionFunction = require(Parent.DiscoveryAnalytics).Events.gameTileOverflowMenuAction
local ActivateGameNotInterestedModule = require(GameTile.activateGameNotInterested)
local UseGameTileActionsModule = require(GameTile.useGameTileActions)
local UseGameTileOverflowMenuFocusNavigationModule = require(GameTile.useGameTileOverflowMenuFocusNavigation)
local TileOverflowMenuItems = require(GameTile.GameTileConstants).TileOverflowMenuItems
local FFlagUseNavigationSelectors = SharedFlagsModule.FFlagUseNavigationSelectors
local FFlagSignalsNavP3fGameDetails = SharedFlagsModule.FFlagSignalsNavP3fGameDetails
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3fGameDetails then require(Parent.NavigationRodux).GetLegacyNavigationStore else nil
local FFlagLuaAppEnableReportExperience = SharedFlagsModule.FFlagLuaAppEnableReportExperience
local FFlagEnableNewReportFlowGameTile = SharedFlagsModule.FFlagEnableNewReportFlowGameTile
local FFlagAddThumbnailSelectorReport = SharedFlagsModule.FFlagAddThumbnailSelectorReport
local FFlagLuaAppContinueSortInstantPlay = SharedFlagsModule.FFlagLuaAppContinueSortInstantPlay
local FFlagLuaAppFixExplicitFeedbackConsoleTelemetry = SharedFlagsModule.FFlagLuaAppFixExplicitFeedbackConsoleTelemetry
local FFlagLuaAppEnableNxMRoduxApportioning = SharedFlagsModule.FFlagLuaAppEnableNxMRoduxApportioning
local FFlagLuaAppGameTileNotInterestedDirectAction = SharedFlagsModule.FFlagLuaAppGameTileNotInterestedDirectAction

return ReactModule.memo(function(p1)
	-- upvalues: FFlagLuaAppGameTileNotInterestedDirectAction (copy), UseTokensFunction (copy), UseLastInputFunction (copy), GetOverflowMenuSignalStoreFunction (copy), ReactModule (copy), FFlagLuaAppEnableNxMRoduxApportioning (copy), GameTileOverflowMenuActionFunction (copy), FFlagLuaAppFixExplicitFeedbackConsoleTelemetry (copy), UseGameTileOverflowMenuFocusNavigationModule (copy), UseGameTileActionsModule (copy), FFlagSignalsNavP3fGameDetails (copy), UseSignalStateFunction (copy), GetLegacyNavigationStore (copy), UseSelectorFunction (copy), FFlagUseNavigationSelectors (copy), Selectors (copy), UserInputService (copy), OverflowMenu (copy), ResponsiveModule (copy), IconSize (copy), UseDispatchFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), UseLocalizationFunction (copy), FFlagLuaAppContinueSortInstantPlay (copy), FFlagLuaAppEnableReportExperience (copy), TileOverflowMenuItems (copy), ActivateGameNotInterestedModule (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy), FlaggedMutedErrorFunction (copy), OpenDynamicAbuseReportModule (copy), AbuseVectorModule (copy), CloseCentralOverlayFunction (copy), FFlagEnableNewReportFlowGameTile (copy), FFlagAddThumbnailSelectorReport (copy), IconName (copy)
	if FFlagLuaAppGameTileNotInterestedDirectAction then
		local UseTokensResult = UseTokensFunction()
		local UseLastInputResult = UseLastInputFunction()
		local MenuKey = p1.menuKey
		local _Vector2 = Vector2.new(1, 0)
		local _UDim2 = UDim2.new(1, -UseTokensResult.Padding.Medium, 0, UseTokensResult.Padding.Medium)
		local OverflowMenuSignalStore = GetOverflowMenuSignalStoreFunction()
		local CollectionId = p1.collectionId or ""
		local List1 = {}
		
		for i, _ in p1.availableMenuItems do
			table.insert(List1, i)
		end
		local Joined = table.concat(List1, ",")
		local UseResult = ReactModule.useCallback(function(p2)
			-- upvalues: p1 (copy), Joined (copy)
			if p1.onMenuOpenChanged then
				p1.onMenuOpenChanged(p2, Joined)
			end
		end, { p1.onMenuOpenChanged, Joined })
		local UseGameTileOverflowMenuFocusNavigationModuleResult = if FFlagLuaAppFixExplicitFeedbackConsoleTelemetry then nil else UseGameTileOverflowMenuFocusNavigationModule(MenuKey, p1.isSelected, p1.parentRef)
		local UseGameTileActionsModuleResult = UseGameTileActionsModule(p1, (ReactModule.useCallback(function(MenuItem)
			-- upvalues: p1 (copy), CollectionId (copy), Joined (copy), FFlagLuaAppEnableNxMRoduxApportioning (upval), GameTileOverflowMenuActionFunction (upval)
			GameTileOverflowMenuActionFunction({
				actionType = "GameTileOverflowMenuItemActivated",
				universeId = p1.universeId,
				sortId = CollectionId,
				menuItem = MenuItem,
				availableMenuItems = Joined,
				contentType = if FFlagLuaAppEnableNxMRoduxApportioning then p1.contentType else nil
			}, p1.appPage)
		end, {
			p1.appPage,
			p1.universeId,
			CollectionId,
			Joined,
			if FFlagLuaAppEnableNxMRoduxApportioning then p1.contentType else nil
		})))
		
		if FFlagLuaAppFixExplicitFeedbackConsoleTelemetry then
			UseGameTileOverflowMenuFocusNavigationModuleResult = UseGameTileOverflowMenuFocusNavigationModule(MenuKey, p1.isSelected, p1.parentRef, UseResult)
		end
		local UseSignalStateResult = nil
		UseSignalStateResult = if FFlagSignalsNavP3fGameDetails then UseSignalStateFunction(GetLegacyNavigationStore(false).getCurrentRouteKey) else UseSelectorFunction(function(p2)
			-- upvalues: FFlagUseNavigationSelectors (upval), Selectors (upval)
			return (if FFlagUseNavigationSelectors then Selectors.selectCurrentRoactNavigationRoute(p2).key else p2.Navigation.currentRoute.key) or ""
		end)
		local UseRefResult = ReactModule.useRef(UseSignalStateResult)
		ReactModule.useEffect(function()
			-- upvalues: UseSignalStateResult (ref), UseRefResult (copy), OverflowMenuSignalStore (copy), MenuKey (copy)
			if UseSignalStateResult ~= UseRefResult.current then
				OverflowMenuSignalStore.closeMenu(MenuKey)
			end
		end, {
			UseSignalStateResult,
			MenuKey,
			OverflowMenuSignalStore.closeMenu
		})
		ReactModule.useEffect(function()
			-- upvalues: p1 (copy), UserInputService (upval), OverflowMenuSignalStore (copy), MenuKey (copy)
			local InputBeganConnection = if p1.menuOpen then UserInputService.InputBegan:Connect(function(Input, _)
				-- upvalues: p1 (upval), OverflowMenuSignalStore (upval), MenuKey (upval)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 and not p1.isHovered then
					OverflowMenuSignalStore.closeMenu(MenuKey)
				end
			end) else nil
			
			return function()
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
		local List2 = {}
		local UseSignalStateResult = nil
		
		for i1, _ in p1.availableMenuItems, UseSignalStateResult do
			table.insert(List2, i1)
		end
		UseSignalStateResult = List2
		local Joined1 = table.concat(UseSignalStateResult, ",")
		UseSignalStateResult = ReactModule
		UseSignalStateResult = UseSignalStateResult.useCallback
		UseSignalStateResult = UseSignalStateResult(function(p2)
			-- upvalues: p1 (copy), Joined1 (copy)
			if p1.onMenuOpenChanged then
				p1.onMenuOpenChanged(p2, Joined1)
			end
		end, { p1.onMenuOpenChanged, Joined1 })
		local UseResult = ReactModule.useCallback(function(MenuItem)
			-- upvalues: p1 (copy), CollectionId1 (copy), Joined1 (copy), FFlagLuaAppEnableNxMRoduxApportioning (upval), GameTileOverflowMenuActionFunction (upval)
			GameTileOverflowMenuActionFunction({
				actionType = "GameTileOverflowMenuItemActivated",
				universeId = p1.universeId,
				sortId = CollectionId1,
				menuItem = MenuItem,
				availableMenuItems = Joined1,
				contentType = if FFlagLuaAppEnableNxMRoduxApportioning then p1.contentType else nil
			}, p1.appPage)
		end, {
			p1.appPage,
			p1.universeId,
			CollectionId1,
			Joined1,
			if FFlagLuaAppEnableNxMRoduxApportioning then p1.contentType else nil
		})
		
		if FFlagLuaAppFixExplicitFeedbackConsoleTelemetry then
			SetFocusRef = UseGameTileOverflowMenuFocusNavigationModule(MenuKey1, p1.isSelected, p1.parentRef, UseSignalStateResult)
		end
		local UseResult1 = if FFlagLuaAppContinueSortInstantPlay then ReactModule.useCallback(function()
			-- upvalues: p1 (copy), UseResult (copy), TileOverflowMenuItems (upval)
			if p1.onGameDetailsActivated then
				p1.onGameDetailsActivated()
			end
			UseResult(TileOverflowMenuItems.GameDetails)
		end, { p1.onGameDetailsActivated, UseResult }) else nil
		local UseResult2 = ReactModule.useCallback(function()
			-- upvalues: ActivateGameNotInterestedModule (upval), p1 (copy), CollectionId1 (copy), UseDispatchResult (copy), UseLocalizationResult (copy), UseRoactServiceResult (copy), UseResult (copy), TileOverflowMenuItems (upval)
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
				UseResult(TileOverflowMenuItems.NotInterested)
			end
		end, {
			CollectionId1, UseDispatchResult, UseLocalizationResult, UseRoactServiceResult,
			UseResult, p1.appPage, p1.isSponsored, p1.placeId, p1.setGameHidden,
			p1.universeId
		})
		local UseResult3 = ReactModule.useCallback(function()
			-- upvalues: UseDispatchResult (copy), SetCentralOverlayFunction (upval), CentralOverlayType (upval), p1 (copy), FFlagLuaAppEnableNxMRoduxApportioning (upval), UseResult (copy), TileOverflowMenuItems (upval)
			UseDispatchResult(SetCentralOverlayFunction(CentralOverlayType.WhyThisAdModal, {
				universeId = p1.universeId,
				payerName = p1.payerName,
				sponsoredUserCohort = p1.sponsoredUserCohort,
				contentType = if FFlagLuaAppEnableNxMRoduxApportioning then p1.contentType else nil
			}))
			UseResult(TileOverflowMenuItems.WhyThisAd)
		end, {
			UseDispatchResult, p1.universeId, p1.payerName, p1.sponsoredUserCohort,
			if FFlagLuaAppEnableNxMRoduxApportioning then p1.contentType else nil,
			UseResult
		})
		local UseResult4 = ReactModule.useCallback(function()
			-- upvalues: p1 (copy), FlaggedMutedErrorFunction (upval), UseDispatchResult (copy), OpenDynamicAbuseReportModule (upval), AbuseVectorModule (upval), CloseCentralOverlayFunction (upval), UseResult (copy), TileOverflowMenuItems (upval)
			if p1.adId then
				UseDispatchResult(OpenDynamicAbuseReportModule({
					abuseVector = AbuseVectorModule.AdV2,
					targetId = p1.adId,
					onClose = function()
						-- upvalues: UseDispatchResult (upval), CloseCentralOverlayFunction (upval)
						UseDispatchResult(CloseCentralOverlayFunction())
					end
				}))
				UseResult(TileOverflowMenuItems.ReportAd)
				
				return
			else
				FlaggedMutedErrorFunction("ReportSponsoredAdError", "Report ad clicked without valid target ad id")
			end
		end, { UseDispatchResult, p1.adId, UseResult })
		local UseResult5 = if FFlagLuaAppEnableReportExperience then ReactModule.useCallback(function()
			-- upvalues: p1 (copy), FlaggedMutedErrorFunction (upval), UseDispatchResult (copy), OpenDynamicAbuseReportModule (upval), FFlagEnableNewReportFlowGameTile (upval), AbuseVectorModule (upval), FFlagAddThumbnailSelectorReport (upval), CloseCentralOverlayFunction (upval), UseResult (copy), TileOverflowMenuItems (upval)
			if p1.placeId then
				UseDispatchResult(OpenDynamicAbuseReportModule({
					abuseVector = if FFlagEnableNewReportFlowGameTile then AbuseVectorModule.GameTile else AbuseVectorModule.Place,
					targetId = p1.placeId,
					custom = if FFlagAddThumbnailSelectorReport then { universeId = p1.universeId } else nil,
					onClose = function()
						-- upvalues: UseDispatchResult (upval), CloseCentralOverlayFunction (upval)
						UseDispatchResult(CloseCentralOverlayFunction())
					end
				}))
				UseResult(TileOverflowMenuItems.ReportExperience)
				
				return
			else
				FlaggedMutedErrorFunction("ReportExperienceError", "Report experience clicked without valid target place id")
			end
		end, { UseDispatchResult, p1.placeId, p1.universeId, UseResult }) else nil
		local UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: FFlagLuaAppContinueSortInstantPlay (upval), p1 (copy), TileOverflowMenuItems (upval), UseLocalizationResult (copy), UseResult1 (copy), UseResult2 (copy), UseResult3 (copy), IconName (upval), UseResult4 (copy), FFlagLuaAppEnableReportExperience (upval), UseResult5 (copy)
			local List = {}
			
			if FFlagLuaAppContinueSortInstantPlay and p1.availableMenuItems[TileOverflowMenuItems.GameDetails] then
				table.insert(List, {
					icon = "icons/actions/info",
					id = TileOverflowMenuItems.GameDetails,
					text = UseLocalizationResult.gameDetails,
					onActivated = UseResult1
				})
			end
			if p1.availableMenuItems[TileOverflowMenuItems.NotInterested] then
				table.insert(List, {
					icon = "icons/actions/block",
					id = TileOverflowMenuItems.NotInterested,
					text = UseLocalizationResult.notInterested,
					onActivated = UseResult2
				})
			end
			if p1.availableMenuItems[TileOverflowMenuItems.WhyThisAd] then
				table.insert(List, {
					icon = "icons/actions/info",
					id = TileOverflowMenuItems.WhyThisAd,
					text = UseLocalizationResult.whyThisAd,
					onActivated = UseResult3
				})
			end
			if p1.availableMenuItems[TileOverflowMenuItems.ReportAd] then
				table.insert(List, {
					icon = IconName.Flag,
					id = TileOverflowMenuItems.ReportAd,
					text = UseLocalizationResult.reportAd,
					onActivated = UseResult4
				})
			end
			if FFlagLuaAppEnableReportExperience and p1.availableMenuItems[TileOverflowMenuItems.ReportExperience] then
				table.insert(List, {
					icon = IconName.Flag,
					id = TileOverflowMenuItems.ReportExperience,
					text = UseLocalizationResult.reportExperience,
					onActivated = UseResult5
				})
			end
			return List
		end, {
			if FFlagLuaAppContinueSortInstantPlay then UseResult1 else nil, UseResult2,
			UseLocalizationResult, UseResult3,
			FFlagLuaAppEnableReportExperience and UseResult4 or nil,
			FFlagLuaAppEnableReportExperience and UseResult5 or nil, p1.isSponsored,
			p1.availableMenuItems
		})
		local UseSignalStateResult1 = nil
		UseSignalStateResult1 = if FFlagSignalsNavP3fGameDetails then UseSignalStateFunction(GetLegacyNavigationStore(false).getCurrentRouteKey) else UseSelectorFunction(function(p2)
			-- upvalues: FFlagUseNavigationSelectors (upval), Selectors (upval)
			return (if FFlagUseNavigationSelectors then Selectors.selectCurrentRoactNavigationRoute(p2).key else p2.Navigation.currentRoute.key) or ""
		end)
		local UseRefResult1 = ReactModule.useRef(UseSignalStateResult1)
		ReactModule.useEffect(function()
			-- upvalues: UseSignalStateResult1 (ref), UseRefResult1 (copy), OverflowMenuSignalStore1 (copy), MenuKey1 (copy)
			if UseSignalStateResult1 ~= UseRefResult1.current then
				OverflowMenuSignalStore1.closeMenu(MenuKey1)
			end
		end, { UseSignalStateResult1, MenuKey1 })
		ReactModule.useEffect(function()
			-- upvalues: p1 (copy), UserInputService (upval), OverflowMenuSignalStore1 (copy), MenuKey1 (copy)
			local InputBeganConnection = if p1.menuOpen then UserInputService.InputBegan:Connect(function(Input, _)
				-- upvalues: p1 (upval), OverflowMenuSignalStore1 (upval), MenuKey1 (upval)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 and not p1.isHovered then
					OverflowMenuSignalStore1.closeMenu(MenuKey1)
				end
			end) else nil
			
			return function()
				-- upvalues: InputBeganConnection (ref)
				if InputBeganConnection then
					InputBeganConnection:Disconnect()
				end
			end
		end, { p1.menuOpen, p1.isHovered, MenuKey1 })
		
		return ReactModule.createElement(OverflowMenu, {
			anchorPoint = _Vector2_1,
			anchorPosition = _UDim2_1,
			menuItems = UseMemoResult,
			hasOverflowButton = UseLastInputResult1 == ResponsiveModule.Input.Pointer,
			shouldShowAnchor = p1.isHovered,
			buttonIconBackgroundStyle = UseTokensResult1.Color.OverMedia.OverMedia_0,
			menuKey = MenuKey1,
			setFocusRef = SetFocusRef,
			onMenuOpenChanged = UseSignalStateResult,
			buttonIconSize = IconSize.Small
		})
	end
end)