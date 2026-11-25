local GameTile = script:FindFirstAncestor("GameTile")
local Parent = GameTile.Parent
local CentralOverlayModule = require(Parent.CentralOverlay)
local FoundationModule = require(Parent.Foundation)
local LocalizationModule = require(Parent.Localization)
local LoggersModule = require(Parent.Loggers)
local ReactModule = require(Parent.React)
local RoactServiceTagsModule = require(Parent.RoactServiceTags)
local RoactUtilsModule = require(Parent.RoactUtils)
local RobloxAppEnumsModule = require(Parent.RobloxAppEnums)
local RobloxAppHooksModule = require(Parent.RobloxAppHooks)
local SharedFlagsModule = require(Parent.SharedFlags)
local AbuseVectorModule = require(Parent.GenericAbuseReporting.AbuseVector)
local OpenDynamicAbuseReportModule = require(Parent.GenericAbuseReporting.OpenDynamicAbuseReport)
local ActivateGameNotInterestedModule = require(GameTile.activateGameNotInterested)
local TileOverflowMenuItems = require(GameTile.GameTileConstants).TileOverflowMenuItems
local CloseCentralOverlayFunction = CentralOverlayModule.Thunks.CloseCentralOverlay
local SetCentralOverlayFunction = CentralOverlayModule.Actions.SetCentralOverlay
local IconName = FoundationModule.Enums.IconName
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization
local FlaggedMutedErrorFunction = LoggersModule.flaggedMutedError
local RoactNetworking = RoactServiceTagsModule.RoactNetworking
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local CentralOverlayType = RobloxAppEnumsModule.CentralOverlayType
local UseRoactServiceFunction = RobloxAppHooksModule.useRoactService
local FFlagLuaAppEnableReportExperience = SharedFlagsModule.FFlagLuaAppEnableReportExperience
local FFlagEnableNewReportFlowGameTile = SharedFlagsModule.FFlagEnableNewReportFlowGameTile
local FFlagAddThumbnailSelectorReport = SharedFlagsModule.FFlagAddThumbnailSelectorReport
local FFlagLuaAppEnableNxMRoduxApportioning = SharedFlagsModule.FFlagLuaAppEnableNxMRoduxApportioning
local FFlagLuaAppContinueSortInstantPlay = SharedFlagsModule.FFlagLuaAppContinueSortInstantPlay

return function(p1, Callback)
	-- upvalues: UseDispatchFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), UseLocalizationFunction (copy), FFlagLuaAppEnableReportExperience (copy), FFlagLuaAppContinueSortInstantPlay (copy), ReactModule (copy), TileOverflowMenuItems (copy), ActivateGameNotInterestedModule (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy), FFlagLuaAppEnableNxMRoduxApportioning (copy), FlaggedMutedErrorFunction (copy), OpenDynamicAbuseReportModule (copy), AbuseVectorModule (copy), CloseCentralOverlayFunction (copy), FFlagEnableNewReportFlowGameTile (copy), FFlagAddThumbnailSelectorReport (copy), IconName (copy)
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
	local UseResult = if FFlagLuaAppContinueSortInstantPlay then ReactModule.useCallback(function()
		-- upvalues: p1 (copy), Callback (copy), TileOverflowMenuItems (upval)
		if p1.onGameDetailsActivated then
			p1.onGameDetailsActivated()
		end
		if Callback then
			Callback(TileOverflowMenuItems.GameDetails)
		end
	end, { p1.onGameDetailsActivated, Callback }) else nil
	local UseResult1 = ReactModule.useCallback(function()
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
	})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), SetCentralOverlayFunction (upval), CentralOverlayType (upval), p1 (copy), FFlagLuaAppEnableNxMRoduxApportioning (upval), Callback (copy), TileOverflowMenuItems (upval)
		UseDispatchResult(SetCentralOverlayFunction(CentralOverlayType.WhyThisAdModal, {
			universeId = p1.universeId,
			payerName = p1.payerName,
			sponsoredUserCohort = p1.sponsoredUserCohort,
			contentType = if FFlagLuaAppEnableNxMRoduxApportioning then p1.contentType else nil
		}))
		
		if Callback then
			Callback(TileOverflowMenuItems.WhyThisAd)
		end
	end, {
		UseDispatchResult, p1.universeId, p1.payerName, p1.sponsoredUserCohort,
		if FFlagLuaAppEnableNxMRoduxApportioning then p1.contentType else nil, Callback
	})
	local UseResult3 = ReactModule.useCallback(function()
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
	local UseResult4 = if FFlagLuaAppEnableReportExperience then ReactModule.useCallback(function()
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
		-- upvalues: FFlagLuaAppContinueSortInstantPlay (upval), p1 (copy), TileOverflowMenuItems (upval), UseLocalizationResult (copy), UseResult (copy), UseResult1 (copy), UseResult2 (copy), IconName (upval), UseResult3 (copy), FFlagLuaAppEnableReportExperience (upval), UseResult4 (copy)
		local List = {}
		
		if FFlagLuaAppContinueSortInstantPlay and p1.availableMenuItems[TileOverflowMenuItems.GameDetails] then
			table.insert(List, {
				icon = "icons/actions/info",
				id = TileOverflowMenuItems.GameDetails,
				text = UseLocalizationResult.gameDetails,
				onActivated = UseResult
			})
		end
		if p1.availableMenuItems[TileOverflowMenuItems.NotInterested] then
			table.insert(List, {
				icon = "icons/actions/block",
				id = TileOverflowMenuItems.NotInterested,
				text = UseLocalizationResult.notInterested,
				onActivated = UseResult1
			})
		end
		if p1.availableMenuItems[TileOverflowMenuItems.WhyThisAd] then
			table.insert(List, {
				icon = "icons/actions/info",
				id = TileOverflowMenuItems.WhyThisAd,
				text = UseLocalizationResult.whyThisAd,
				onActivated = UseResult2
			})
		end
		if p1.availableMenuItems[TileOverflowMenuItems.ReportAd] then
			table.insert(List, {
				icon = IconName.Flag,
				id = TileOverflowMenuItems.ReportAd,
				text = UseLocalizationResult.reportAd,
				onActivated = UseResult3
			})
		end
		if FFlagLuaAppEnableReportExperience and p1.availableMenuItems[TileOverflowMenuItems.ReportExperience] then
			table.insert(List, {
				icon = IconName.Flag,
				id = TileOverflowMenuItems.ReportExperience,
				text = UseLocalizationResult.reportExperience,
				onActivated = UseResult4
			})
		end
		return List
	end, {
		if FFlagLuaAppContinueSortInstantPlay then UseResult else nil, UseResult1,
		UseLocalizationResult, UseResult2, p1.isSponsored, p1.availableMenuItems,
		UseResult3, if FFlagLuaAppEnableReportExperience then UseResult4 else nil
	}))
end