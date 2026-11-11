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
local Enums = FoundationModule.Enums
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
local Images = require(Parent.UIBlox).App.ImageSet.Images
local PostSendUserSignalFunction = UserSignalsModule.PostSendUserSignal
local UserSignalTypes = UserSignalsModule.UserSignalTypes
local GameTileOverflowMenuActionFunction = require(Parent.DiscoveryAnalytics).Events.gameTileOverflowMenuAction
local NotInterestedUserSignalTelemetryEventConfigsModule = require(GameTile.NotInterestedUserSignalTelemetryEventConfigs)
local SendNotInterestedFeedbackFormAnalyticsModule = require(GameTile.sendNotInterestedFeedbackFormAnalytics)
local UseGameTileOverflowMenuFocusNavigationModule = require(GameTile.useGameTileOverflowMenuFocusNavigation)
local TileOverflowMenuItems = require(GameTile.GameTileConstants).TileOverflowMenuItems
local FFlagUseNavigationSelectors = SharedFlagsModule.FFlagUseNavigationSelectors
local FFlagSignalsNavP3hMisc = SharedFlagsModule.FFlagSignalsNavP3hMisc
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3hMisc then require(Parent.NavigationRodux).GetLegacyNavigationStore else nil
local FFlagLuaAppGameTileOverflowMenuTelemetry = SharedFlagsModule.FFlagLuaAppGameTileOverflowMenuTelemetry
local FFlagLuaAppMakeDisclaimerOptInForFeedbackForm = SharedFlagsModule.FFlagLuaAppMakeDisclaimerOptInForFeedbackForm
local FFlagLuaAppNotInterestedFeedbackFormTelemetry = SharedFlagsModule.FFlagLuaAppNotInterestedFeedbackFormTelemetry
local FFlagLuaAppFixExplicitFeedbackTelemetry = SharedFlagsModule.FFlagLuaAppFixExplicitFeedbackTelemetry
local FFlagLuaAppEnableWhyThisAdModal = SharedFlagsModule.FFlagLuaAppEnableWhyThisAdModal
local FFlagLuaAppEnableSponsoredReportAd = SharedFlagsModule.FFlagLuaAppEnableSponsoredReportAd
local LuaAppAdjustOverflowMenuVisual = game:DefineFastFlag("LuaAppAdjustOverflowMenuVisual", false)
local FFlagLuaAppSupportSponsoredExplicitFeedback = SharedFlagsModule.FFlagLuaAppSupportSponsoredExplicitFeedback
local FFlagLuaAppUseSnackbarForProvideFeedbackToast = SharedFlagsModule.FFlagLuaAppUseSnackbarForProvideFeedbackToast
local FFlagLuaAppFixExplicitFeedbackConsoleTelemetry = SharedFlagsModule.FFlagLuaAppFixExplicitFeedbackConsoleTelemetry

return ReactModule.memo(function(p1)
	-- upvalues: UseDispatchFunction (copy), UseTokensFunction (copy), UseLastInputFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), UseLocalizationFunction (copy), FFlagLuaAppEnableWhyThisAdModal (copy), FFlagLuaAppEnableSponsoredReportAd (copy), LuaAppAdjustOverflowMenuVisual (copy), GetOverflowMenuSignalStoreFunction (copy), FFlagLuaAppFixExplicitFeedbackConsoleTelemetry (copy), UseGameTileOverflowMenuFocusNavigationModule (copy), ReactModule (copy), UserSignalTypes (copy), OpenDynamicAbuseReportModule (copy), AbuseVectorModule (copy), CloseCentralOverlayFunction (copy), Default (copy), NotInterestedUserSignalTelemetryEventConfigsModule (copy), SetNetworkingErrorToastFunction (copy), PostSendUserSignalFunction (copy), HttpService (copy), FFlagLuaAppSupportSponsoredExplicitFeedback (copy), MutedErrorFunction (copy), FFlagLuaAppNotInterestedFeedbackFormTelemetry (copy), SendNotInterestedFeedbackFormAnalyticsModule (copy), FFlagLuaAppFixExplicitFeedbackTelemetry (copy), FFlagLuaAppMakeDisclaimerOptInForFeedbackForm (copy), FFlagLuaAppGameTileOverflowMenuTelemetry (copy), GameTileOverflowMenuActionFunction (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy), FFlagLuaAppUseSnackbarForProvideFeedbackToast (copy), Enums (copy), Images (copy), TileOverflowMenuItems (copy), FlaggedMutedErrorFunction (copy), IconName (copy), FFlagSignalsNavP3hMisc (copy), GetLegacyNavigationStore (copy), UseSignalStateFunction (copy), UseSelectorFunction (copy), FFlagUseNavigationSelectors (copy), Selectors (copy), UserInputService (copy), OverflowMenu (copy), ResponsiveModule (copy), IconSize (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseTokensResult = UseTokensFunction()
	local UseLastInputResult = UseLastInputFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseLocalizationResult = UseLocalizationFunction({
		notInterested = "Feature.GameDetails.Action.NotInterested",
		dialogTitle = "Feature.GameDetails.Label.ProvideFeedbackTitle",
		dialogText = "Feature.GameDetails.Message.HelpImproveExperience",
		checkboxListTitle = "Feature.GameDetails.Message.HidingExperienceQuestion",
		tooRepetitive = "Feature.GameDetails.Label.TooRepetitive",
		dontLikeGame = "Feature.GameDetails.Label.DontLikeGame",
		dontLikeImage = "Feature.GameDetails.Label.DontLikeImage",
		inappropriateContent = "Feature.GameDetails.Label.InappropriateContent",
		somethingElse = "Feature.GameDetails.Label.SomethingElse",
		whyThisAd = if FFlagLuaAppEnableWhyThisAdModal then "Feature.GameDetails.Action.WhyThisAd" else nil,
		reportAd = if FFlagLuaAppEnableSponsoredReportAd then "Feature.GameDetails.Action.ReportAd" else nil
	})
	local CollectionId = p1.collectionId or ""
	local MenuKey = p1.menuKey
	local _Vector2 = Vector2.new(1, 0)
	local _UDim2 = UDim2.new(1, if LuaAppAdjustOverflowMenuVisual then -UseTokensResult.Padding.Medium else -UseTokensResult.Padding.Small, 0, if LuaAppAdjustOverflowMenuVisual then UseTokensResult.Padding.Medium else UseTokensResult.Padding.Small)
	local OverflowMenuSignalStore = GetOverflowMenuSignalStoreFunction()
	local UseGameTileOverflowMenuFocusNavigationModuleResult = if FFlagLuaAppFixExplicitFeedbackConsoleTelemetry then nil else UseGameTileOverflowMenuFocusNavigationModule(MenuKey, p1.isSelected, p1.parentRef)
	local UseMemoResult = ReactModule.useMemo(function()
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
	end, { UseLocalizationResult })
	local UseResult = ReactModule.useCallback(function(p2, TextResponse)
		-- upvalues: UseMemoResult (copy), UserSignalTypes (upval), UseDispatchResult (copy), OpenDynamicAbuseReportModule (upval), AbuseVectorModule (upval), p1 (copy), CloseCentralOverlayFunction (upval), Default (upval), NotInterestedUserSignalTelemetryEventConfigsModule (upval), SetNetworkingErrorToastFunction (upval), PostSendUserSignalFunction (upval), UseRoactServiceResult (copy), HttpService (upval), FFlagLuaAppSupportSponsoredExplicitFeedback (upval), CollectionId (copy), MutedErrorFunction (upval), FFlagLuaAppNotInterestedFeedbackFormTelemetry (upval), SendNotInterestedFeedbackFormAnalyticsModule (upval), FFlagLuaAppFixExplicitFeedbackTelemetry (upval)
		local Flag = false
		local Items = {}
		
		for _, value in UseMemoResult do
			table.insert(Items, { id = value.id, selected = p2[value.id] or false })
			
			if value.id == UserSignalTypes.NotInterestedFeedbackItem.InappropriateContent and p2[value.id] then
				Flag = true
			end
		end
		if Flag then
			UseDispatchResult(OpenDynamicAbuseReportModule({
				abuseVector = AbuseVectorModule.Place,
				targetId = p1.universeId,
				onClose = function()
					-- upvalues: UseDispatchResult (upval), CloseCentralOverlayFunction (upval)
					UseDispatchResult(CloseCentralOverlayFunction())
				end
			}))
		end
		if not p1.appPage then
			Default:logRobloxTelemetryCounter(NotInterestedUserSignalTelemetryEventConfigsModule.NotInterestedMissingAppPage, 1)
			UseDispatchResult(SetNetworkingErrorToastFunction())
			
			return
		end
		local Success, Result = pcall(function()
			-- upvalues: PostSendUserSignalFunction (upval), UseRoactServiceResult (upval), HttpService (upval), UserSignalTypes (upval), TextResponse (copy), Items (copy), p1 (upval), FFlagLuaAppSupportSponsoredExplicitFeedback (upval), CollectionId (upval), UseDispatchResult (upval), SetNetworkingErrorToastFunction (upval), Default (upval), NotInterestedUserSignalTelemetryEventConfigsModule (upval)
			PostSendUserSignalFunction(UseRoactServiceResult, {
				stringValue = HttpService:JSONEncode({
					formId = UserSignalTypes.NotInterestedFeedbackFormId.NotInterestedFeedback1,
					titleId = UserSignalTypes.NotInterestedFeedbackFormTitleId.WhyHideExperience,
					textResponse = TextResponse,
					items = Items
				})
			}, {
				id = p1.universeId,
				assetType = if FFlagLuaAppSupportSponsoredExplicitFeedback and p1.isSponsored then UserSignalTypes.AssetType.SponsoredGame else UserSignalTypes.AssetType.Game,
				signalOrigin = {
					productSurface = p1.appPage,
					topicId = CollectionId,
					subIds = { CollectionId }
				}
			}, UserSignalTypes.SignalValueType.String, UserSignalTypes.SignalType.NotInterestedFeedback):catch(function(Err)
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
				ctx = if FFlagLuaAppFixExplicitFeedbackTelemetry then nil else p1.appPage,
				universeId = p1.universeId,
				sortId = CollectionId
			}, if FFlagLuaAppFixExplicitFeedbackTelemetry then p1.appPage else nil)
		end
	end, {
		UseRoactServiceResult, UseMemoResult, UseLocalizationResult, p1.universeId,
		p1.appPage, CollectionId, UseDispatchResult,
		if FFlagLuaAppSupportSponsoredExplicitFeedback then p1.isSponsored else nil
	})
	local UseResult1 = nil
	local UseResult2 = nil
	
	if FFlagLuaAppNotInterestedFeedbackFormTelemetry then
		UseResult1 = ReactModule.useCallback(function(p3)
			-- upvalues: SendNotInterestedFeedbackFormAnalyticsModule (upval), FFlagLuaAppFixExplicitFeedbackTelemetry (upval), p1 (copy), CollectionId (copy)
			if not p3 then
				SendNotInterestedFeedbackFormAnalyticsModule({
					actionType = "NotInterestedFeedbackFormClosedWithoutSubmit",
					ctx = if FFlagLuaAppFixExplicitFeedbackTelemetry then nil else p1.appPage,
					universeId = p1.universeId,
					sortId = CollectionId
				}, if FFlagLuaAppFixExplicitFeedbackTelemetry then p1.appPage else nil)
				
				return
			end
		end, { p1.appPage, p1.universeId, CollectionId })
		UseResult2 = ReactModule.useCallback(function()
			-- upvalues: SendNotInterestedFeedbackFormAnalyticsModule (upval), FFlagLuaAppFixExplicitFeedbackTelemetry (upval), p1 (copy), CollectionId (copy)
			SendNotInterestedFeedbackFormAnalyticsModule({
				actionType = "NotInterestedFeedbackFormOpened",
				ctx = if FFlagLuaAppFixExplicitFeedbackTelemetry then nil else p1.appPage,
				universeId = p1.universeId,
				sortId = CollectionId
			}, if FFlagLuaAppFixExplicitFeedbackTelemetry then p1.appPage else nil)
		end, { p1.appPage, p1.universeId, CollectionId })
	end
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseLocalizationResult (copy), UseMemoResult (copy), UseResult (copy), FFlagLuaAppNotInterestedFeedbackFormTelemetry (upval), UseResult1 (ref), FFlagLuaAppMakeDisclaimerOptInForFeedbackForm (upval)
		return {
			dialogTitle = UseLocalizationResult.dialogTitle,
			dialogText = UseLocalizationResult.dialogText,
			checkboxListTitle = UseLocalizationResult.checkboxListTitle,
			checkboxItems = UseMemoResult,
			onSubmit = UseResult,
			onClose = if FFlagLuaAppNotInterestedFeedbackFormTelemetry then UseResult1 else nil,
			showTermsOfUseDisclaimer = not FFlagLuaAppMakeDisclaimerOptInForFeedbackForm and nil
		}
	end, { UseLocalizationResult, UseMemoResult, UseResult })
	local UseResult3 = nil
	local Callback = nil
	
	if FFlagLuaAppGameTileOverflowMenuTelemetry then
		local Joined = nil
		
		if FFlagLuaAppEnableWhyThisAdModal then
			local List = {}
			
			for i, _ in p1.availableMenuItems do
				table.insert(List, i)
			end
			Joined = table.concat(List, ",")
		else
			Joined = "NotInterested"
		end
		UseResult3 = ReactModule.useCallback(function(p3)
			-- upvalues: p1 (copy), Joined (ref)
			if p1.onMenuOpenChanged then
				p1.onMenuOpenChanged(p3, Joined)
			end
		end, { p1.onMenuOpenChanged, Joined })
		Callback = ReactModule.useCallback(function(MenuItem)
			-- upvalues: FFlagLuaAppFixExplicitFeedbackTelemetry (upval), p1 (copy), CollectionId (copy), Joined (ref), GameTileOverflowMenuActionFunction (upval)
			GameTileOverflowMenuActionFunction({
				actionType = "GameTileOverflowMenuItemActivated",
				ctx = if FFlagLuaAppFixExplicitFeedbackTelemetry then nil else p1.appPage,
				universeId = p1.universeId,
				sortId = CollectionId,
				menuItem = MenuItem,
				availableMenuItems = Joined
			}, if FFlagLuaAppFixExplicitFeedbackTelemetry then p1.appPage else nil)
		end, { p1.appPage, p1.universeId, CollectionId, Joined })
		
		if FFlagLuaAppFixExplicitFeedbackConsoleTelemetry then
			UseGameTileOverflowMenuFocusNavigationModuleResult = UseGameTileOverflowMenuFocusNavigationModule(MenuKey, p1.isSelected, p1.parentRef, UseResult3)
		end
	end
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), Default (upval), NotInterestedUserSignalTelemetryEventConfigsModule (upval), UseDispatchResult (copy), SetNetworkingErrorToastFunction (upval), SetCentralOverlayFunction (upval), CentralOverlayType (upval), UseMemoResult1 (copy), FFlagLuaAppUseSnackbarForProvideFeedbackToast (upval), Enums (upval), Images (upval), FFlagLuaAppNotInterestedFeedbackFormTelemetry (upval), UseResult2 (ref), PostSendUserSignalFunction (upval), UseRoactServiceResult (copy), FFlagLuaAppSupportSponsoredExplicitFeedback (upval), UserSignalTypes (upval), CollectionId (copy), MutedErrorFunction (upval), FFlagLuaAppGameTileOverflowMenuTelemetry (upval), Callback (ref), TileOverflowMenuItems (upval)
		if not p1.appPage then
			Default:logRobloxTelemetryCounter(NotInterestedUserSignalTelemetryEventConfigsModule.NotInterestedMissingAppPage, 1)
			UseDispatchResult(SetNetworkingErrorToastFunction())
			
			return
		end
		p1.setGameHidden(p1.universeId, true)
		UseDispatchResult(SetCentralOverlayFunction(CentralOverlayType.ProvideFeedbackToast, {
			feedbackFormProps = UseMemoResult1,
			toastIcon = if FFlagLuaAppUseSnackbarForProvideFeedbackToast then Enums.IconName.CircleMinus else Images["icons/actions/edit/remove"],
			onToastActivated = if FFlagLuaAppNotInterestedFeedbackFormTelemetry then UseResult2 else nil
		}))
		local Success, Result = pcall(function()
			-- upvalues: PostSendUserSignalFunction (upval), UseRoactServiceResult (upval), p1 (upval), FFlagLuaAppSupportSponsoredExplicitFeedback (upval), UserSignalTypes (upval), CollectionId (upval), UseDispatchResult (upval), SetNetworkingErrorToastFunction (upval), Default (upval), NotInterestedUserSignalTelemetryEventConfigsModule (upval)
			PostSendUserSignalFunction(UseRoactServiceResult, { boolValue = true }, {
				id = p1.universeId,
				assetType = if FFlagLuaAppSupportSponsoredExplicitFeedback and p1.isSponsored then UserSignalTypes.AssetType.SponsoredGame else UserSignalTypes.AssetType.Game,
				signalOrigin = {
					productSurface = p1.appPage,
					topicId = CollectionId,
					subIds = { CollectionId }
				}
			}, UserSignalTypes.SignalValueType.Bool, UserSignalTypes.SignalType.NotInterested):catch(function(Err)
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
		if FFlagLuaAppGameTileOverflowMenuTelemetry then
			Callback(TileOverflowMenuItems.NotInterested)
		end
	end, {
		UseRoactServiceResult, p1.setGameHidden, UseDispatchResult, UseMemoResult1,
		p1.universeId, CollectionId, p1.appPage,
		if FFlagLuaAppGameTileOverflowMenuTelemetry then Callback else nil,
		if FFlagLuaAppSupportSponsoredExplicitFeedback then p1.isSponsored else nil
	})
	local UseResult5 = if FFlagLuaAppEnableWhyThisAdModal then ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), SetCentralOverlayFunction (upval), CentralOverlayType (upval), p1 (copy), FFlagLuaAppGameTileOverflowMenuTelemetry (upval), Callback (ref), TileOverflowMenuItems (upval)
		UseDispatchResult(SetCentralOverlayFunction(CentralOverlayType.WhyThisAdModal, {
			universeId = p1.universeId,
			payerName = p1.payerName,
			sponsoredUserCohort = p1.sponsoredUserCohort
		}))
		
		if FFlagLuaAppGameTileOverflowMenuTelemetry then
			Callback(TileOverflowMenuItems.WhyThisAd)
		end
	end, {
		UseDispatchResult,
		p1.universeId,
		p1.payerName,
		p1.sponsoredUserCohort,
		if FFlagLuaAppGameTileOverflowMenuTelemetry then Callback else nil
	}) else nil
	local UseResult6 = if FFlagLuaAppEnableSponsoredReportAd then ReactModule.useCallback(function()
		-- upvalues: p1 (copy), FlaggedMutedErrorFunction (upval), UseDispatchResult (copy), OpenDynamicAbuseReportModule (upval), AbuseVectorModule (upval), CloseCentralOverlayFunction (upval), FFlagLuaAppGameTileOverflowMenuTelemetry (upval), Callback (ref), TileOverflowMenuItems (upval)
		if not p1.adId then
			FlaggedMutedErrorFunction("ReportSponsoredAdError", "Report ad clicked without valid target ad id")
			
			return
		end
		UseDispatchResult(OpenDynamicAbuseReportModule({
			abuseVector = AbuseVectorModule.AdV2,
			targetId = p1.adId,
			onClose = function()
				-- upvalues: UseDispatchResult (upval), CloseCentralOverlayFunction (upval)
				UseDispatchResult(CloseCentralOverlayFunction())
			end
		}))
		
		if FFlagLuaAppGameTileOverflowMenuTelemetry then
			Callback(TileOverflowMenuItems.ReportAd)
		end
	end, {
		UseDispatchResult,
		p1.adId,
		if FFlagLuaAppGameTileOverflowMenuTelemetry then Callback else nil
	}) else nil
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: FFlagLuaAppEnableWhyThisAdModal (upval), FFlagLuaAppSupportSponsoredExplicitFeedback (upval), p1 (copy), TileOverflowMenuItems (upval), UseLocalizationResult (copy), UseResult4 (copy), UseResult5 (copy), FFlagLuaAppEnableSponsoredReportAd (upval), IconName (upval), UseResult6 (copy)
		if not FFlagLuaAppEnableWhyThisAdModal then
			return {
				{
					icon = "icons/actions/block",
					id = TileOverflowMenuItems.NotInterested,
					text = UseLocalizationResult.notInterested,
					onActivated = UseResult4
				}
			}
		end
		local List = {}
		
		if FFlagLuaAppSupportSponsoredExplicitFeedback and p1.availableMenuItems[TileOverflowMenuItems.NotInterested] then
			table.insert(List, {
				icon = "icons/actions/block",
				id = TileOverflowMenuItems.NotInterested,
				text = UseLocalizationResult.notInterested,
				onActivated = UseResult4
			})
		end
		if p1.availableMenuItems[TileOverflowMenuItems.WhyThisAd] then
			table.insert(List, {
				icon = "icons/actions/info",
				id = TileOverflowMenuItems.WhyThisAd,
				text = UseLocalizationResult.whyThisAd,
				onActivated = UseResult5
			})
		end
		if FFlagLuaAppEnableSponsoredReportAd and p1.availableMenuItems[TileOverflowMenuItems.ReportAd] then
			table.insert(List, {
				icon = IconName.Flag,
				id = TileOverflowMenuItems.ReportAd,
				text = UseLocalizationResult.reportAd,
				onActivated = UseResult6
			})
		end
		if not FFlagLuaAppSupportSponsoredExplicitFeedback and p1.availableMenuItems[TileOverflowMenuItems.NotInterested] then
			table.insert(List, {
				icon = "icons/actions/block",
				id = TileOverflowMenuItems.NotInterested,
				text = UseLocalizationResult.notInterested,
				onActivated = UseResult4
			})
		end
		return List
	end, {
		UseResult4,
		UseLocalizationResult,
		if FFlagLuaAppEnableWhyThisAdModal then UseResult5 else nil,
		if FFlagLuaAppEnableWhyThisAdModal then p1.isSponsored else nil,
		p1.availableMenuItems
	})
	local Key = nil
	Key = if FFlagSignalsNavP3hMisc then UseSignalStateFunction(GetLegacyNavigationStore(false).getCurrentRoute).key or "" else UseSelectorFunction(function(p3)
		-- upvalues: FFlagUseNavigationSelectors (upval), Selectors (upval)
		return (if FFlagUseNavigationSelectors then Selectors.selectCurrentRoactNavigationRoute(p3).key else p3.Navigation.currentRoute.key) or ""
	end)
	local UseRefResult = ReactModule.useRef(Key)
	ReactModule.useEffect(function()
		-- upvalues: Key (ref), UseRefResult (copy), OverflowMenuSignalStore (copy), MenuKey (copy)
		if Key ~= UseRefResult.current then
			OverflowMenuSignalStore.closeMenu(MenuKey)
		end
	end, { Key, MenuKey })
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
	end, { p1.menuOpen, p1.isHovered, MenuKey })
	
	return ReactModule.createElement(OverflowMenu, {
		anchorPoint = _Vector2,
		anchorPosition = _UDim2,
		menuItems = UseMemoResult2,
		hasOverflowButton = UseLastInputResult == ResponsiveModule.Input.Pointer,
		shouldShowAnchor = p1.isHovered,
		buttonIconBackgroundStyle = UseTokensResult.Color.OverMedia.OverMedia_0,
		menuKey = MenuKey,
		setFocusRef = UseGameTileOverflowMenuFocusNavigationModuleResult,
		onMenuOpenChanged = if FFlagLuaAppGameTileOverflowMenuTelemetry then UseResult3 else nil,
		buttonIconSize = if LuaAppAdjustOverflowMenuVisual then IconSize.Small else nil
	})
end)