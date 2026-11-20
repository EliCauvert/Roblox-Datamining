local HttpService = game:GetService("HttpService")
local GameTile = script:FindFirstAncestor("GameTile")
local Parent = GameTile.Parent
local CentralOverlayModule = require(Parent.CentralOverlay)
local DisplayModule = require(Parent.Display)
local FoundationModule = require(Parent.Foundation)
local LoggersModule = require(Parent.Loggers)
local ResponsiveModule = require(Parent.Responsive)
local RobloxAppToastsRoduxModule = require(Parent.RobloxAppToastsRodux)
local SharedFlagsModule = require(Parent.SharedFlags)
local UserSignalsModule = require(Parent.UserSignals)
local AbuseVectorModule = require(Parent.GenericAbuseReporting.AbuseVector)
local CircleMinus = FoundationModule.Enums.IconName.CircleMinus
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local CloseCentralOverlayFunction = CentralOverlayModule.Thunks.CloseCentralOverlay
local Default = require(Parent.LoggingProtocol).default
local OpenDynamicAbuseReportModule = require(Parent.GenericAbuseReporting.OpenDynamicAbuseReport)
local PostSendUserSignalFunction = UserSignalsModule.PostSendUserSignal
local SetCentralOverlayFunction = CentralOverlayModule.Actions.SetCentralOverlay
local SetNetworkingErrorToastFunction = RobloxAppToastsRoduxModule.Thunks.SetNetworkingErrorToast
local UserSignalTypes = UserSignalsModule.UserSignalTypes
local FlaggedMutedErrorFunction = LoggersModule.flaggedMutedError
local MutedErrorFunction = LoggersModule.mutedError
local GetGameTileHiddenStoreModule = require(GameTile.HiddenGameTile.getGameTileHiddenStore)
local NotInterestedUserSignalTelemetryEventConfigsModule = require(GameTile.NotInterestedUserSignalTelemetryEventConfigs)
local SendNotInterestedFeedbackFormAnalyticsModule = require(GameTile.sendNotInterestedFeedbackFormAnalytics)
local FFlagLuaAppMakeDisclaimerOptInForFeedbackForm = SharedFlagsModule.FFlagLuaAppMakeDisclaimerOptInForFeedbackForm
local FFlagLuaAppNotInterestedFeedbackFormTelemetry = SharedFlagsModule.FFlagLuaAppNotInterestedFeedbackFormTelemetry
local FFlagLuaAppNotInterestedTileFeedbackButton = SharedFlagsModule.FFlagLuaAppNotInterestedTileFeedbackButton
local FFlagLuaAppNotInterestedFeedbackShuffleOptions = SharedFlagsModule.FFlagLuaAppNotInterestedFeedbackShuffleOptions
local FFlagLuaAppNotInterestedMobileSnackbar = SharedFlagsModule.FFlagLuaAppNotInterestedMobileSnackbar

local function shuffleCheckboxItems(CheckboxItems)
	local t = {}
	local t1 = {}
	
	for _, checkboxItem in CheckboxItems do
		table.insert(if checkboxItem.triggersOtherTextbox then t1 else t, checkboxItem)
	end
	local _Random = Random.new()
	
	for i = #t, 2, -1 do
		local NextIntegerResult = _Random:NextInteger(1, i)
		local Entry = t[i]
		t[i] = t[NextIntegerResult]
		t[NextIntegerResult] = Entry
	end
	table.move(t1, 1, #t1, #t + 1, t)
	
	return t
end

local function _(p1, UniverseId, SortId, ActionType)
	-- upvalues: FFlagLuaAppNotInterestedFeedbackFormTelemetry (copy), SendNotInterestedFeedbackFormAnalyticsModule (copy)
	if FFlagLuaAppNotInterestedFeedbackFormTelemetry then
		SendNotInterestedFeedbackFormAnalyticsModule({
			universeId = UniverseId,
			sortId = SortId,
			actionType = ActionType
		}, p1)
		
		return
	end
end

local _ = function(p1, p2, UniverseId, SortId)
	-- upvalues: FFlagLuaAppNotInterestedFeedbackFormTelemetry (copy), SendNotInterestedFeedbackFormAnalyticsModule (copy)
	if p1 then return end
	if FFlagLuaAppNotInterestedFeedbackFormTelemetry then
		SendNotInterestedFeedbackFormAnalyticsModule({
			actionType = "NotInterestedFeedbackFormClosedWithoutSubmit",
			universeId = UniverseId,
			sortId = SortId
		}, p2)
		
		return
	end
end

local function onFeedbackFormSubmitted(p1, TextResponse, CheckboxItems, ProductSurface, SortId, Callback: (any) -> (), Networking, TargetId, IsSponsored, UniverseId, FeedbackOpener)
	-- upvalues: UserSignalTypes (copy), FlaggedMutedErrorFunction (copy), OpenDynamicAbuseReportModule (copy), AbuseVectorModule (copy), CloseCentralOverlayFunction (copy), PostSendUserSignalFunction (copy), HttpService (copy), FFlagLuaAppNotInterestedTileFeedbackButton (copy), GetGameTileHiddenStoreModule (copy), SetNetworkingErrorToastFunction (copy), Default (copy), NotInterestedUserSignalTelemetryEventConfigsModule (copy), MutedErrorFunction (copy), FFlagLuaAppNotInterestedFeedbackFormTelemetry (copy), SendNotInterestedFeedbackFormAnalyticsModule (copy)
	local SponsoredGame = if IsSponsored then UserSignalTypes.AssetType.SponsoredGame else UserSignalTypes.AssetType.Game
	local Items = {}
	local Flag = false
	
	for _, checkboxItem in CheckboxItems do
		local Selected = p1[checkboxItem.id] or false
		table.insert(Items, { id = checkboxItem.id, selected = Selected })
		
		if checkboxItem.id == UserSignalTypes.NotInterestedFeedbackItem.InappropriateContent and Selected then
			Flag = true
		end
	end
	if Flag then
		if TargetId == nil or TargetId == "" then
			FlaggedMutedErrorFunction("NotInterestedReportPlaceIdMissing", "Place report opened without a place id")
		else
			Callback(OpenDynamicAbuseReportModule({
				abuseVector = AbuseVectorModule.Place,
				targetId = TargetId,
				onClose = function()
					-- upvalues: Callback (copy), CloseCentralOverlayFunction (upval)
					Callback(CloseCentralOverlayFunction())
				end
			}))
		end
	end
	local Success, Result = pcall(function()
		-- upvalues: PostSendUserSignalFunction (upval), Networking (copy), HttpService (upval), UserSignalTypes (upval), TextResponse (copy), Items (copy), UniverseId (copy), SponsoredGame (copy), ProductSurface (copy), SortId (copy), FFlagLuaAppNotInterestedTileFeedbackButton (upval), FeedbackOpener (copy), GetGameTileHiddenStoreModule (upval), Callback (copy), SetNetworkingErrorToastFunction (upval), Default (upval), NotInterestedUserSignalTelemetryEventConfigsModule (upval)
		local PostSendUserSignalResult = PostSendUserSignalFunction(Networking, {
			stringValue = HttpService:JSONEncode({
				formId = UserSignalTypes.NotInterestedFeedbackFormId.NotInterestedFeedback1,
				titleId = UserSignalTypes.NotInterestedFeedbackFormTitleId.WhyHideExperience,
				textResponse = TextResponse,
				items = Items
			})
		}, {
			id = UniverseId,
			assetType = SponsoredGame,
			signalOrigin = {
				productSurface = ProductSurface,
				topicId = SortId,
				subIds = { SortId }
			}
		}, UserSignalTypes.SignalValueType.String, UserSignalTypes.SignalType.NotInterestedFeedback)
		
		if FFlagLuaAppNotInterestedTileFeedbackButton and FeedbackOpener then
			PostSendUserSignalResult = PostSendUserSignalResult:andThen(function()
				-- upvalues: GetGameTileHiddenStoreModule (upval), SortId (upval), UniverseId (upval), FeedbackOpener (upval)
				local GameTileHiddenStoreModule = GetGameTileHiddenStoreModule(SortId)
				
				if GameTileHiddenStoreModule.getFeedbackOpeners(false)[UniverseId] == FeedbackOpener then
					GameTileHiddenStoreModule.setGameFeedbackOpener(UniverseId, nil)
				end
			end)
		end
		PostSendUserSignalResult:catch(function(Err)
			-- upvalues: Callback (upval), SetNetworkingErrorToastFunction (upval), Default (upval), NotInterestedUserSignalTelemetryEventConfigsModule (upval)
			Callback(SetNetworkingErrorToastFunction(Err))
			Default:logRobloxTelemetryCounter(NotInterestedUserSignalTelemetryEventConfigsModule.NotInterestedUserSignalFailed, 1)
		end)
	end)
	
	if not Success then
		MutedErrorFunction(Result)
	end
	if FFlagLuaAppNotInterestedFeedbackFormTelemetry then
		SendNotInterestedFeedbackFormAnalyticsModule({
			actionType = "NotInterestedFeedbackFormSubmitted",
			universeId = UniverseId,
			sortId = SortId
		}, ProductSurface)
		
		return
	end
end

return function(p2): boolean
	-- upvalues: Default (copy), NotInterestedUserSignalTelemetryEventConfigsModule (copy), SetNetworkingErrorToastFunction (copy), UserSignalTypes (copy), FFlagLuaAppNotInterestedFeedbackShuffleOptions (copy), shuffleCheckboxItems (copy), onFeedbackFormSubmitted (copy), FFlagLuaAppNotInterestedTileFeedbackButton (copy), FFlagLuaAppNotInterestedFeedbackFormTelemetry (copy), SendNotInterestedFeedbackFormAnalyticsModule (copy), FFlagLuaAppMakeDisclaimerOptInForFeedbackForm (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy), GetGameTileHiddenStoreModule (copy), CircleMinus (copy), FFlagLuaAppNotInterestedMobileSnackbar (copy), DisplayModule (copy), ResponsiveModule (copy), FoundationModule (copy), CloseCentralOverlayFunction (copy), PostSendUserSignalFunction (copy), MutedErrorFunction (copy)
	local AppPage = p2.appPage
	
	if not AppPage then
		Default:logRobloxTelemetryCounter(NotInterestedUserSignalTelemetryEventConfigsModule.NotInterestedMissingAppPage, 1)
		p2.dispatch(SetNetworkingErrorToastFunction())
		
		return false
	end
	local CollectionId = p2.collectionId
	local DispatchFunction: (any) -> () = p2.dispatch
	local Networking = p2.networking
	local PlaceId = p2.placeId
	local UniverseId = p2.universeId
	local SponsoredGame = if p2.isSponsored then UserSignalTypes.AssetType.SponsoredGame else UserSignalTypes.AssetType.Game
	local LocalizedStrings = p2.localizedStrings
	local CheckboxItems = {
		{
			id = UserSignalTypes.NotInterestedFeedbackItem.TooRepetitive,
			text = LocalizedStrings.tooRepetitive
		},
		{
			id = UserSignalTypes.NotInterestedFeedbackItem.DontLikeGame,
			text = LocalizedStrings.dontLikeGame
		},
		{
			id = UserSignalTypes.NotInterestedFeedbackItem.DontLikeImage,
			text = LocalizedStrings.dontLikeImage
		},
		{
			id = UserSignalTypes.NotInterestedFeedbackItem.InappropriateContent,
			text = LocalizedStrings.inappropriateContent
		},
		{
			triggersOtherTextbox = true,
			id = UserSignalTypes.NotInterestedFeedbackItem.SomethingElse,
			text = LocalizedStrings.somethingElse
		}
	}
	
	if FFlagLuaAppNotInterestedFeedbackShuffleOptions then
		CheckboxItems = shuffleCheckboxItems(CheckboxItems)
	end
	p2.setGameHidden(UniverseId, true)
	local v1 = nil
	local FeedbackFormProps = {
		dialogTitle = LocalizedStrings.dialogTitle,
		dialogText = LocalizedStrings.dialogText,
		checkboxListTitle = LocalizedStrings.checkboxListTitle,
		checkboxItems = CheckboxItems,
		onSubmit = function(p3, TextResponse)
			-- upvalues: onFeedbackFormSubmitted (upval), CheckboxItems (ref), AppPage (copy), CollectionId (copy), DispatchFunction (copy), Networking (copy), PlaceId (copy), p2 (copy), UniverseId (copy), FFlagLuaAppNotInterestedTileFeedbackButton (upval), v1 (ref)
			onFeedbackFormSubmitted(p3, TextResponse, CheckboxItems, AppPage, CollectionId, DispatchFunction, Networking, PlaceId, p2.isSponsored, UniverseId, if FFlagLuaAppNotInterestedTileFeedbackButton then v1 else nil)
		end,
		onClose = if FFlagLuaAppNotInterestedFeedbackFormTelemetry then function(p3)
			-- upvalues: AppPage (copy), UniverseId (copy), CollectionId (copy), FFlagLuaAppNotInterestedFeedbackFormTelemetry (upval), SendNotInterestedFeedbackFormAnalyticsModule (upval)
			if p3 then return end
			if FFlagLuaAppNotInterestedFeedbackFormTelemetry then
				SendNotInterestedFeedbackFormAnalyticsModule({
					actionType = "NotInterestedFeedbackFormClosedWithoutSubmit",
					universeId = UniverseId,
					sortId = CollectionId
				}, AppPage)
				
				return
			end
		end else nil,
		showTermsOfUseDisclaimer = not FFlagLuaAppMakeDisclaimerOptInForFeedbackForm and nil
	}
	local Callback1 = if FFlagLuaAppNotInterestedFeedbackFormTelemetry then function()
		-- upvalues: AppPage (copy), UniverseId (copy), CollectionId (copy), FFlagLuaAppNotInterestedFeedbackFormTelemetry (upval), SendNotInterestedFeedbackFormAnalyticsModule (upval)
		if FFlagLuaAppNotInterestedFeedbackFormTelemetry then
			SendNotInterestedFeedbackFormAnalyticsModule({
				actionType = "NotInterestedFeedbackFormOpened",
				universeId = UniverseId,
				sortId = CollectionId
			}, AppPage)
			
			return
		end
	end else nil
	
	if FFlagLuaAppNotInterestedTileFeedbackButton then
		v1 = function()
			-- upvalues: FFlagLuaAppNotInterestedFeedbackFormTelemetry (upval), Callback1 (copy), DispatchFunction (copy), SetCentralOverlayFunction (upval), CentralOverlayType (upval), FeedbackFormProps (copy)
			if FFlagLuaAppNotInterestedFeedbackFormTelemetry and Callback1 then
				task.spawn(Callback1)
			end
			DispatchFunction(SetCentralOverlayFunction(CentralOverlayType.CheckboxFeedbackFormModal, FeedbackFormProps))
		end
		
		GetGameTileHiddenStoreModule(CollectionId).setGameFeedbackOpener(UniverseId, v1)
	else
		DispatchFunction(SetCentralOverlayFunction(CentralOverlayType.ProvideFeedbackToast, {
			feedbackFormProps = FeedbackFormProps,
			toastIcon = CircleMinus,
			onToastActivated = Callback1
		}))
	end
	local Callback: (() -> ())? = nil
	
	if FFlagLuaAppNotInterestedMobileSnackbar and LocalizedStrings.suggestLessOften and ResponsiveModule.getIsCompactTouch(DisplayModule.GetDisplayStore(false).getViewportSize(false), (ResponsiveModule.GetInputModeStore(false).getPreferredInputType(false))) then
		local config = {
			hideToastButton = true,
			feedbackFormProps = FeedbackFormProps,
			toastIcon = FoundationModule.Enums.IconName.CircleCheck,
			toastTitle = LocalizedStrings.suggestLessOften
		}
		DispatchFunction(SetCentralOverlayFunction(CentralOverlayType.ProvideFeedbackToast, config))
		
		Callback = function()
			-- upvalues: DispatchFunction (copy), config (copy), CloseCentralOverlayFunction (upval)
			DispatchFunction(function(p3)
				-- upvalues: config (upval), CloseCentralOverlayFunction (upval)
				if p3:getState().CentralOverlay.Arguments == config then
					p3:dispatch(CloseCentralOverlayFunction())
				end
			end)
		end
	end
	local Success, Result = pcall(function()
		-- upvalues: PostSendUserSignalFunction (upval), Networking (copy), UniverseId (copy), SponsoredGame (copy), AppPage (copy), CollectionId (copy), UserSignalTypes (upval), p2 (copy), FFlagLuaAppNotInterestedTileFeedbackButton (upval), GetGameTileHiddenStoreModule (upval), FFlagLuaAppNotInterestedMobileSnackbar (upval), Callback (ref), DispatchFunction (copy), SetNetworkingErrorToastFunction (upval), Default (upval), NotInterestedUserSignalTelemetryEventConfigsModule (upval)
		PostSendUserSignalFunction(Networking, { boolValue = true }, {
			id = UniverseId,
			assetType = SponsoredGame,
			signalOrigin = {
				productSurface = AppPage,
				topicId = CollectionId,
				subIds = { CollectionId }
			}
		}, UserSignalTypes.SignalValueType.Bool, UserSignalTypes.SignalType.NotInterested):catch(function(Err)
			-- upvalues: p2 (upval), UniverseId (upval), FFlagLuaAppNotInterestedTileFeedbackButton (upval), GetGameTileHiddenStoreModule (upval), CollectionId (upval), FFlagLuaAppNotInterestedMobileSnackbar (upval), Callback (upval), DispatchFunction (upval), SetNetworkingErrorToastFunction (upval), Default (upval), NotInterestedUserSignalTelemetryEventConfigsModule (upval)
			p2.setGameHidden(UniverseId, false)
			
			if FFlagLuaAppNotInterestedTileFeedbackButton then
				GetGameTileHiddenStoreModule(CollectionId).setGameFeedbackOpener(UniverseId, nil)
			end
			if FFlagLuaAppNotInterestedMobileSnackbar and Callback then
				Callback()
			end
			DispatchFunction(SetNetworkingErrorToastFunction(Err))
			Default:logRobloxTelemetryCounter(NotInterestedUserSignalTelemetryEventConfigsModule.NotInterestedUserSignalFailed, 1)
		end)
	end)
	
	if not Success then
		p2.setGameHidden(UniverseId, false)
		
		if FFlagLuaAppNotInterestedTileFeedbackButton then
			GetGameTileHiddenStoreModule(CollectionId).setGameFeedbackOpener(UniverseId, nil)
		end
		if FFlagLuaAppNotInterestedMobileSnackbar and Callback then
			Callback()
		end
		MutedErrorFunction(Result)
	end
	return true
end