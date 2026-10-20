local HttpService = game:GetService("HttpService")
local GameTile = script:FindFirstAncestor("GameTile")
local Parent = GameTile.Parent
local _ = require(Parent.AppBlox)
local CentralOverlayModule = require(Parent.CentralOverlay)
local LoggersModule = require(Parent.Loggers)
local ReactModule = require(Parent.React)
local SharedFlagsModule = require(Parent.SharedFlags)
local UserSignalsModule = require(Parent.UserSignals)
local AbuseVectorModule = require(Parent.GenericAbuseReporting.AbuseVector)
local OpenDynamicAbuseReportModule = require(Parent.GenericAbuseReporting.OpenDynamicAbuseReport)
local NotInterestedUserSignalTelemetryEventConfigsModule = require(GameTile.NotInterestedUserSignalTelemetryEventConfigs)
local ActivateGameNotInterestedModule = require(GameTile.activateGameNotInterested)
local SendNotInterestedFeedbackFormAnalyticsModule = require(GameTile.sendNotInterestedFeedbackFormAnalytics)
local TileOverflowMenuItems = require(GameTile.GameTileConstants).TileOverflowMenuItems
local CloseCentralOverlayFunction = CentralOverlayModule.Thunks.CloseCentralOverlay
local SetCentralOverlayFunction = CentralOverlayModule.Actions.SetCentralOverlay
local IconName = require(Parent.Foundation).Enums.IconName
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FlaggedMutedErrorFunction = LoggersModule.flaggedMutedError
local MutedErrorFunction = LoggersModule.mutedError
local Default = require(Parent.LoggingProtocol).default
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local SetNetworkingErrorToastFunction = require(Parent.RobloxAppToastsRodux).Thunks.SetNetworkingErrorToast
local PostSendUserSignalFunction = UserSignalsModule.PostSendUserSignal
local UserSignalTypes = UserSignalsModule.UserSignalTypes
local FFlagLuaAppMakeDisclaimerOptInForFeedbackForm = SharedFlagsModule.FFlagLuaAppMakeDisclaimerOptInForFeedbackForm
local FFlagLuaAppNotInterestedFeedbackFormTelemetry = SharedFlagsModule.FFlagLuaAppNotInterestedFeedbackFormTelemetry
local FFlagLuaAppEnableReportExperience = SharedFlagsModule.FFlagLuaAppEnableReportExperience
local FFlagEnableNewReportFlowGameTile = SharedFlagsModule.FFlagEnableNewReportFlowGameTile
local FFlagAddThumbnailSelectorReport = SharedFlagsModule.FFlagAddThumbnailSelectorReport
local FFlagLuaAppEnableHomepageOneByTwoTile = SharedFlagsModule.FFlagLuaAppEnableHomepageOneByTwoTile
local FFlagLuaAppContinueSortInstantPlay = SharedFlagsModule.FFlagLuaAppContinueSortInstantPlay
local FFlagLuaAppExtractNotInterestedHelper = SharedFlagsModule.FFlagLuaAppExtractNotInterestedHelper

return function(p1, Callback)
	-- upvalues: UseDispatchFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), UseLocalizationFunction (copy), FFlagLuaAppEnableReportExperience (copy), FFlagLuaAppContinueSortInstantPlay (copy), ReactModule (copy), UserSignalTypes (copy), FlaggedMutedErrorFunction (copy), OpenDynamicAbuseReportModule (copy), AbuseVectorModule (copy), CloseCentralOverlayFunction (copy), Default (copy), NotInterestedUserSignalTelemetryEventConfigsModule (copy), SetNetworkingErrorToastFunction (copy), PostSendUserSignalFunction (copy), HttpService (copy), MutedErrorFunction (copy), FFlagLuaAppNotInterestedFeedbackFormTelemetry (copy), SendNotInterestedFeedbackFormAnalyticsModule (copy), FFlagLuaAppMakeDisclaimerOptInForFeedbackForm (copy), TileOverflowMenuItems (copy), FFlagLuaAppExtractNotInterestedHelper (copy), ActivateGameNotInterestedModule (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy), IconName (copy), FFlagLuaAppEnableHomepageOneByTwoTile (copy), FFlagEnableNewReportFlowGameTile (copy), FFlagAddThumbnailSelectorReport (copy)
	local UseDispatchResult = UseDispatchFunction()
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
		reportExperience = if FFlagLuaAppEnableReportExperience then "Feature.GameDetails.Action.Report" else nil,
		gameDetails = if FFlagLuaAppContinueSortInstantPlay then "Feature.GameDetails.Action.GameDetails" else nil
	})
	local CollectionId = p1.collectionId or ""
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
		-- upvalues: UseMemoResult (copy), UserSignalTypes (upval), p1 (copy), FlaggedMutedErrorFunction (upval), UseDispatchResult (copy), OpenDynamicAbuseReportModule (upval), AbuseVectorModule (upval), CloseCentralOverlayFunction (upval), Default (upval), NotInterestedUserSignalTelemetryEventConfigsModule (upval), SetNetworkingErrorToastFunction (upval), PostSendUserSignalFunction (upval), UseRoactServiceResult (copy), HttpService (upval), CollectionId (copy), MutedErrorFunction (upval), FFlagLuaAppNotInterestedFeedbackFormTelemetry (upval), SendNotInterestedFeedbackFormAnalyticsModule (upval)
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
					onClose = function()
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
		local Success, Result = pcall(function()
			-- upvalues: PostSendUserSignalFunction (upval), UseRoactServiceResult (upval), HttpService (upval), UserSignalTypes (upval), TextResponse (copy), Items (copy), p1 (upval), CollectionId (upval), UseDispatchResult (upval), SetNetworkingErrorToastFunction (upval), Default (upval), NotInterestedUserSignalTelemetryEventConfigsModule (upval)
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
				universeId = p1.universeId,
				sortId = CollectionId
			}, p1.appPage)
		end
	end, {
		UseRoactServiceResult, UseMemoResult, UseLocalizationResult, p1.universeId,
		p1.placeId, p1.appPage, CollectionId, UseDispatchResult, p1.isSponsored
	})
	local UseResult1 = nil
	local UseResult2 = nil
	
	if FFlagLuaAppNotInterestedFeedbackFormTelemetry then
		UseResult1 = ReactModule.useCallback(function(p3)
			-- upvalues: SendNotInterestedFeedbackFormAnalyticsModule (upval), p1 (copy), CollectionId (copy)
			if not p3 then
				SendNotInterestedFeedbackFormAnalyticsModule({
					actionType = "NotInterestedFeedbackFormClosedWithoutSubmit",
					universeId = p1.universeId,
					sortId = CollectionId
				}, p1.appPage)
				
				return
			end
		end, { p1.appPage, p1.universeId, CollectionId })
		UseResult2 = ReactModule.useCallback(function()
			-- upvalues: SendNotInterestedFeedbackFormAnalyticsModule (upval), p1 (copy), CollectionId (copy)
			SendNotInterestedFeedbackFormAnalyticsModule({
				actionType = "NotInterestedFeedbackFormOpened",
				universeId = p1.universeId,
				sortId = CollectionId
			}, p1.appPage)
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
	end, {
		UseLocalizationResult,
		UseMemoResult,
		UseResult,
		if FFlagLuaAppNotInterestedFeedbackFormTelemetry then UseResult1 else nil
	})
	local UseResult3 = if FFlagLuaAppContinueSortInstantPlay then ReactModule.useCallback(function()
		-- upvalues: p1 (copy), Callback (copy), TileOverflowMenuItems (upval)
		if p1.onGameDetailsActivated then
			p1.onGameDetailsActivated()
		end
		if Callback then
			Callback(TileOverflowMenuItems.GameDetails)
		end
	end, { p1.onGameDetailsActivated, Callback }) else nil
	local UseResult4 = nil
	UseResult4 = if FFlagLuaAppExtractNotInterestedHelper then ReactModule.useCallback(function()
		-- upvalues: ActivateGameNotInterestedModule (upval), p1 (copy), CollectionId (copy), UseDispatchResult (copy), UseLocalizationResult (copy), UseRoactServiceResult (copy), Callback (copy), TileOverflowMenuItems (upval)
		if ActivateGameNotInterestedModule({
			appPage = p1.appPage,
			collectionId = CollectionId,
			dispatch = UseDispatchResult,
			isSponsored = p1.isSponsored,
			localizedStrings = UseLocalizationResult,
			networking = UseRoactServiceResult,
			placeId = p1.placeId,
			setGameHidden = p1.setGameHidden,
			universeId = p1.universeId
		}) and Callback then
			Callback(TileOverflowMenuItems.NotInterested)
		end
	end, {
		CollectionId, UseDispatchResult, UseLocalizationResult, UseRoactServiceResult,
		Callback, p1.appPage, p1.isSponsored, p1.placeId, p1.setGameHidden,
		p1.universeId
	}) else ReactModule.useCallback(function()
		-- upvalues: p1 (copy), Default (upval), NotInterestedUserSignalTelemetryEventConfigsModule (upval), UseDispatchResult (copy), SetNetworkingErrorToastFunction (upval), SetCentralOverlayFunction (upval), CentralOverlayType (upval), UseMemoResult1 (copy), IconName (upval), FFlagLuaAppNotInterestedFeedbackFormTelemetry (upval), UseResult2 (ref), PostSendUserSignalFunction (upval), UseRoactServiceResult (copy), UserSignalTypes (upval), CollectionId (copy), MutedErrorFunction (upval), Callback (copy), TileOverflowMenuItems (upval)
		if not p1.appPage then
			Default:logRobloxTelemetryCounter(NotInterestedUserSignalTelemetryEventConfigsModule.NotInterestedMissingAppPage, 1)
			UseDispatchResult(SetNetworkingErrorToastFunction())
			
			return
		end
		p1.setGameHidden(p1.universeId, true)
		UseDispatchResult(SetCentralOverlayFunction(CentralOverlayType.ProvideFeedbackToast, {
			feedbackFormProps = UseMemoResult1,
			toastIcon = IconName.CircleMinus,
			onToastActivated = if FFlagLuaAppNotInterestedFeedbackFormTelemetry then UseResult2 else nil
		}))
		local Success, Result = pcall(function()
			-- upvalues: PostSendUserSignalFunction (upval), UseRoactServiceResult (upval), p1 (upval), UserSignalTypes (upval), CollectionId (upval), UseDispatchResult (upval), SetNetworkingErrorToastFunction (upval), Default (upval), NotInterestedUserSignalTelemetryEventConfigsModule (upval)
			PostSendUserSignalFunction(UseRoactServiceResult, { boolValue = true }, {
				id = p1.universeId,
				assetType = if p1.isSponsored then UserSignalTypes.AssetType.SponsoredGame else UserSignalTypes.AssetType.Game,
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
		if Callback then
			Callback(TileOverflowMenuItems.NotInterested)
		end
	end, {
		UseRoactServiceResult, p1.setGameHidden, UseDispatchResult, UseMemoResult1,
		p1.universeId, CollectionId, p1.appPage, Callback, p1.isSponsored,
		if FFlagLuaAppNotInterestedFeedbackFormTelemetry then UseResult2 else nil
	})
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), SetCentralOverlayFunction (upval), CentralOverlayType (upval), p1 (copy), FFlagLuaAppEnableHomepageOneByTwoTile (upval), Callback (copy), TileOverflowMenuItems (upval)
		UseDispatchResult(SetCentralOverlayFunction(CentralOverlayType.WhyThisAdModal, {
			universeId = p1.universeId,
			payerName = p1.payerName,
			sponsoredUserCohort = p1.sponsoredUserCohort,
			contentType = if FFlagLuaAppEnableHomepageOneByTwoTile then p1.contentType else nil
		}))
		
		if Callback then
			Callback(TileOverflowMenuItems.WhyThisAd)
		end
	end, {
		UseDispatchResult, p1.universeId, p1.payerName, p1.sponsoredUserCohort,
		if FFlagLuaAppEnableHomepageOneByTwoTile then p1.contentType else nil, Callback
	})
	local UseResult6 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), FlaggedMutedErrorFunction (upval), UseDispatchResult (copy), OpenDynamicAbuseReportModule (upval), AbuseVectorModule (upval), CloseCentralOverlayFunction (upval), Callback (copy), TileOverflowMenuItems (upval)
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
		
		if Callback then
			Callback(TileOverflowMenuItems.ReportAd)
		end
	end, { UseDispatchResult, p1.adId, Callback })
	local UseResult7 = if FFlagLuaAppEnableReportExperience then ReactModule.useCallback(function()
		-- upvalues: p1 (copy), FlaggedMutedErrorFunction (upval), UseDispatchResult (copy), OpenDynamicAbuseReportModule (upval), FFlagEnableNewReportFlowGameTile (upval), AbuseVectorModule (upval), FFlagAddThumbnailSelectorReport (upval), CloseCentralOverlayFunction (upval), Callback (copy), TileOverflowMenuItems (upval)
		if not p1.placeId then
			FlaggedMutedErrorFunction("ReportExperienceError", "Report experience clicked without valid target place id")
			
			return
		end
		UseDispatchResult(OpenDynamicAbuseReportModule({
			abuseVector = if FFlagEnableNewReportFlowGameTile then AbuseVectorModule.GameTile else AbuseVectorModule.Place,
			targetId = p1.placeId,
			custom = if FFlagAddThumbnailSelectorReport then { universeId = p1.universeId } else nil,
			onClose = function()
				-- upvalues: UseDispatchResult (upval), CloseCentralOverlayFunction (upval)
				UseDispatchResult(CloseCentralOverlayFunction())
			end
		}))
		
		if Callback then
			Callback(TileOverflowMenuItems.ReportExperience)
		end
	end, { UseDispatchResult, p1.placeId, p1.universeId, Callback }) else nil
	
	return (ReactModule.useMemo(function()
		-- upvalues: FFlagLuaAppContinueSortInstantPlay (upval), p1 (copy), TileOverflowMenuItems (upval), UseLocalizationResult (copy), UseResult3 (copy), UseResult4 (ref), UseResult5 (copy), IconName (upval), UseResult6 (copy), FFlagLuaAppEnableReportExperience (upval), UseResult7 (copy)
		local List = {}
		
		if FFlagLuaAppContinueSortInstantPlay and p1.availableMenuItems[TileOverflowMenuItems.GameDetails] then
			table.insert(List, {
				icon = "icons/actions/info",
				id = TileOverflowMenuItems.GameDetails,
				text = UseLocalizationResult.gameDetails,
				onActivated = UseResult3
			})
		end
		if p1.availableMenuItems[TileOverflowMenuItems.NotInterested] then
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
		if p1.availableMenuItems[TileOverflowMenuItems.ReportAd] then
			table.insert(List, {
				icon = IconName.Flag,
				id = TileOverflowMenuItems.ReportAd,
				text = UseLocalizationResult.reportAd,
				onActivated = UseResult6
			})
		end
		if FFlagLuaAppEnableReportExperience and p1.availableMenuItems[TileOverflowMenuItems.ReportExperience] then
			table.insert(List, {
				icon = IconName.Flag,
				id = TileOverflowMenuItems.ReportExperience,
				text = UseLocalizationResult.reportExperience,
				onActivated = UseResult7
			})
		end
		return List
	end, {
		if FFlagLuaAppContinueSortInstantPlay then UseResult3 else nil, UseResult4,
		UseLocalizationResult, UseResult5, p1.isSponsored, p1.availableMenuItems,
		UseResult6, if FFlagLuaAppEnableReportExperience then UseResult7 else nil
	}))
end