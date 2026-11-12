local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FoundationModule = require(Parent.Foundation)
local NavigationModule = require(Parent.Navigation)
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local SharedFlagsModule = require(Parent.SharedFlags)
local SignalsReactModule = require(Parent.SignalsReact)
local UseOpenWebViewFunction = require(Parent.WebViewUtils).useOpenWebView
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ExperienceGuidelinesModule = require(Parent.DataHydration.ExperienceGuidelines)
local PlaceVersionHistoryModule = require(Parent.DataHydration.PlaceVersionHistory)
local UniverseConfigurationModule = require(Parent.DataHydration.UniverseConfiguration)
local UniverseActivationModule = require(Parent.DataHydration.UniverseActivation)
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local FFlagBuildPostPublishShareDismissibleModule = require(BuildExperience.Flags.FFlagBuildPostPublishShareDismissible)
local FIntBuildPostPublishSnackbarAutoDismissSecondsModule = require(BuildExperience.Flags.FIntBuildPostPublishSnackbarAutoDismissSeconds)
local FriendsOnlyShareDialogModule = require(BuildExperience.Components.ShareAudience.FriendsOnlyShareDialog)
local ContentMaturityUtilsModule = require(BuildExperience.utils.ContentMaturityUtils)
local GameConfigurationActionsModule = require(BuildExperience.utils.GameConfigurationActions)
local GameConfigurationLabelsModule = require(BuildExperience.utils.GameConfigurationLabels)
local GetGameDetailsNavigationModule = require(BuildExperience.utils.getGameDetailsNavigation)
local RefreshPublishEligibilityModule = require(BuildExperience.utils.refreshPublishEligibility)
local UseClosableFocusRootModule = require(BuildExperience.utils.useClosableFocusRoot)
local GetVersionInformationStoreModule = require(BuildExperience.Stores.GetVersionInformationStore)
local UseGamePermissionsModule = require(BuildExperience.useGamePermissions)
local FFlagBuildCheckGamePermissionsModule = require(BuildExperience.Flags.FFlagBuildCheckGamePermissions)
local Button = FoundationModule.Button
local Popover = FoundationModule.Popover
local Snackbar = FoundationModule.Snackbar
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local InputSize = FoundationModule.Enums.InputSize
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local PopoverSide = FoundationModule.Enums.PopoverSide
local PrivacyType = UniverseConfigurationModule.PrivacyType
local FFlagEnableShareSheet = SharedFlagsModule.FFlagEnableShareSheet
local FFlagShareSheetFriendsSort = SharedFlagsModule.FFlagShareSheetFriendsSort
local FFlagBuildPublishNavigationSheetModule = require(BuildExperience.Flags.FFlagBuildPublishNavigationSheet)
local FFlagBuildAdUpsellModule = require(BuildExperience.Flags.FFlagBuildAdUpsell)
local FFlagBuildExperiencePlaytestCardPublishCtaModule = require(BuildExperience.Flags.FFlagBuildExperiencePlaytestCardPublishCta)
local GetAdUpsellEventStoreModule = if FFlagBuildAdUpsellModule then require(BuildExperience.Stores.GetAdUpsellEventStore) else nil
local UseStoreFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useStore
local GetRootNavigationFunction = NavigationModule.getRootNavigation
local UseNavigationFunction = NavigationModule.useNavigation
local OpenGameDetailsFunction = require(Parent.GameDetail).OpenGameDetails
local Debug = require(Parent.DataHydration.CreatorAgentChat).debug
local SendBuildExperienceEventModule = require(BuildExperience.Telemetry.sendBuildExperienceEvent)
local SharePublishedExperienceModule = require(BuildExperience.utils.sharePublishedExperience)
local SharePublishedExperienceFunction = SharePublishedExperienceModule.sharePublishedExperience
local UseSharePublishedExperienceFunction = SharePublishedExperienceModule.useSharePublishedExperience
local UniversalShareSheet = require(Parent.ShareSheet).UniversalShareSheet
local t = {}

local function _(p1): boolean
	return typeof(p1) == "table" and (p1.status == "success" and typeof(p1.version) == "string" and p1.version ~= "")
end

local function buildPublicAudiences(Audiences)
	-- upvalues: UniverseActivationModule (copy)
	local List = {}
	local Audiences1 = Audiences or {}
	for _, value in Audiences1 do
		if value ~= UniverseActivationModule.Audience.Public and value ~= UniverseActivationModule.Audience.Friends then
			table.insert(List, value)
		end
	end
	table.insert(List, UniverseActivationModule.Audience.Public)
	
	return List
end

local function PreviewButton(p1)
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), UseStoreFunction (copy), UseNavigationFunction (copy), ReactModule (copy), GetRootNavigationFunction (copy), OpenGameDetailsFunction (copy), GetGameDetailsNavigationModule (copy), Button (copy), InputSize (copy), ButtonVariant (copy), FillBehavior (copy)
	local Preview = UseLocalizationFunction({
		preview = LocalizationStringsModule.GAME_CONFIGURATION_PREVIEW
	}).preview
	local UseStoreResult = UseStoreFunction()
	local UseNavigationResult = UseNavigationFunction()
	local OnPreviewFunction = p1.onPreview
	
	return ReactModule.createElement(Button, {
		LayoutOrder = 2,
		text = Preview,
		size = InputSize.Medium,
		variant = ButtonVariant.Standard,
		fillBehavior = FillBehavior.Fill,
		onActivated = ReactModule.useCallback(function()
			-- upvalues: GetRootNavigationFunction (upval), UseNavigationResult (copy), OpenGameDetailsFunction (upval), p1 (copy), GetGameDetailsNavigationModule (upval), UseStoreResult (copy), OnPreviewFunction (copy)
			OpenGameDetailsFunction(tostring(p1.target.universeId), GetGameDetailsNavigationModule((GetRootNavigationFunction(UseNavigationResult))), { source = "BuildExperiencePublish" })(UseStoreResult)
			
			if OnPreviewFunction then
				OnPreviewFunction()
			end
		end, {
			UseNavigationResult,
			p1.target.universeId,
			UseStoreResult,
			OnPreviewFunction
		}),
		width = UDim.new(1, 0),
		testId = `{p1.actionsTestId}-preview`
	})
end

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), UseSharePublishedExperienceFunction (copy), SignalsReactModule (copy), PlaceVersionHistoryModule (copy), UniverseConfigurationModule (copy), ReactModule (copy), GameConfigurationLabelsModule (copy), UniverseActivationModule (copy), ContentMaturityUtilsModule (copy), UseOpenWebViewFunction (copy), PrivacyType (copy), FFlagBuildPostPublishShareDismissibleModule (copy), FIntBuildPostPublishSnackbarAutoDismissSecondsModule (copy), FFlagEnableShareSheet (copy), FFlagShareSheetFriendsSort (copy), UniversalShareSheet (copy), SharePublishedExperienceFunction (copy), GameConfigurationActionsModule (copy), RefreshPublishEligibilityModule (copy), GetVersionInformationStoreModule (copy), SendBuildExperienceEventModule (copy), GetAdUpsellEventStoreModule (copy), FFlagBuildAdUpsellModule (copy), buildPublicAudiences (copy), ExperienceGuidelinesModule (copy), t (copy), Debug (copy), FFlagBuildExperiencePlaytestCardPublishCtaModule (copy), FFlagBuildCheckGamePermissionsModule (copy), UseGamePermissionsModule (copy), FoundationModule (copy), UseClosableFocusRootModule (copy), FocusNavigationUtilsModule (copy), ResponsiveModule (copy), Snackbar (copy), View (copy), FFlagBuildPublishNavigationSheetModule (copy), Popover (copy), PopoverAlign (copy), PopoverSide (copy), Button (copy), InputSize (copy), ButtonVariant (copy), FillBehavior (copy), PreviewButton (copy), FriendsOnlyShareDialogModule (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		accountTooNewError = LocalizationStringsModule.GAME_CONFIGURATION_PUBLISH_ACCOUNT_TOO_NEW_ERROR,
		creatorHub = LocalizationStringsModule.GAME_CONFIGURATION_CREATOR_HUB,
		linkCopied = LocalizationStringsModule.GAME_CONFIGURATION_LINK_COPIED,
		publish = LocalizationStringsModule.GAME_CONFIGURATION_PUBLISH,
		publishAudienceError = LocalizationStringsModule.GAME_CONFIGURATION_PUBLISH_AUDIENCE_ERROR,
		publishError = LocalizationStringsModule.GAME_CONFIGURATION_PUBLISH_ERROR,
		publishSuccess = LocalizationStringsModule.GAME_CONFIGURATION_PUBLISH_SUCCESS,
		share = LocalizationStringsModule.GAME_CONFIGURATION_SHARE,
		updateRating = LocalizationStringsModule.GAME_CONFIGURATION_UPDATE_RATING
	})
	local AccountTooNewError = UseLocalizationResult.accountTooNewError
	local CreatorHub = UseLocalizationResult.creatorHub
	local LinkCopied = UseLocalizationResult.linkCopied
	local Publish = UseLocalizationResult.publish
	local PublishAudienceError = UseLocalizationResult.publishAudienceError
	local PublishError = UseLocalizationResult.publishError
	local PublishSuccess = UseLocalizationResult.publishSuccess
	local Share = UseLocalizationResult.share
	local UpdateRating = UseLocalizationResult.updateRating
	local UseSharePublishedExperienceResult = UseSharePublishedExperienceFunction(p1.target.universeId)
	local UseSignalStateResult = SignalsReactModule.useSignalState(PlaceVersionHistoryModule.getPlaceVersionHistoryStore)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(UniverseConfigurationModule.getUniverseConfigurationStore)
	local UseSignalStateResult2 = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: UseSignalStateResult1 (copy), p1 (copy)
		return UseSignalStateResult1.getAndFetchSummary(p1.target.universeId).data
	end, { UseSignalStateResult1, p1.target.universeId })))
	local Audience = GameConfigurationLabelsModule.getAudience((SignalsReactModule.useSignalState(UseSignalStateResult1.getAndFetchConfiguration(p1.target.universeId).data)))
	local UseSignalStateResult4 = nil
	local UseSignalStateResult3 = SignalsReactModule.useSignalState(UniverseActivationModule.getUniverseActivationStore)
	UseSignalStateResult4 = UseSignalStateResult3
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: ContentMaturityUtilsModule (upval), p1 (copy)
		return ContentMaturityUtilsModule.isSealBroken(p1.target.universeId) and ContentMaturityUtilsModule.isContentUnrated(p1.target.universeId)
	end, {
		SignalsReactModule.useSignalState(ReactModule.useMemo(function()
			-- upvalues: UseSignalStateResult3 (copy), p1 (copy)
			return UseSignalStateResult3.getAndFetchEligibility(p1.target.universeId)
		end, { UseSignalStateResult3, p1.target.universeId }).data),
		p1.target.universeId
	})
	local UseOpenWebViewResult = UseOpenWebViewFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState("")
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(nil)
	local IsNotAudienceMatch: boolean = UseStateResult1 == PublishSuccess and (p1.target.placeId ~= nil and (Audience ~= nil and Audience ~= PrivacyType.Private))
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_1 (copy), UseStateResult2_2 (copy)
		UseStateResult2_1("")
		UseStateResult2_2(nil)
	end, {})
	
	if FFlagBuildPostPublishShareDismissibleModule then
		ReactModule.useEffect(function()
			-- upvalues: UseStateResult1 (copy), FIntBuildPostPublishSnackbarAutoDismissSecondsModule (upval), UseStateResult2_1 (copy)
			if UseStateResult1 == "" then
				return nil
			else
				local DelayedThread = task.delay(FIntBuildPostPublishSnackbarAutoDismissSecondsModule, UseStateResult2_1, "")
				
				return function()
					-- upvalues: DelayedThread (copy)
					task.cancel(DelayedThread)
				end
			end
		end, { UseStateResult1 })
	end
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), UseStateResult2_2 (copy), FFlagEnableShareSheet (upval), UseSharePublishedExperienceResult (copy), FFlagShareSheetFriendsSort (upval), UniversalShareSheet (upval), SharePublishedExperienceFunction (upval), LinkCopied (copy), UseStateResult2_1 (copy)
		if p1.target.placeId == nil then return end
		UseStateResult2_2(nil)
		
		if FFlagEnableShareSheet then
			UseSharePublishedExperienceResult(p1.target.placeId, if FFlagShareSheetFriendsSort then UniversalShareSheet.RecipientSource.OneToOneFriends else nil)
			
			return
		end
		local SharePublishedExperienceResult = SharePublishedExperienceFunction(p1.target.placeId)
		
		if SharePublishedExperienceResult ~= nil and SharePublishedExperienceResult.copiedToClipboard and LinkCopied ~= nil then
			UseStateResult2_1(LinkCopied)
		end
	end, {
		LinkCopied,
		p1.target.placeId,
		UseSharePublishedExperienceResult
	})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: FFlagBuildPostPublishShareDismissibleModule (upval), UseStateResult2_1 (copy), Audience (copy), PrivacyType (upval), UseStateResult2_2 (copy), UseResult1 (copy)
		if FFlagBuildPostPublishShareDismissibleModule then
			UseStateResult2_1("")
		end
		if Audience == PrivacyType.FriendsOnly then
			UseStateResult2_2("friends")
			
			return
		end
		if Audience == PrivacyType.Public then
			UseResult1()
		end
	end, { Audience, UseResult1 })
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_2 (copy)
		UseStateResult2_2(nil)
	end, {})
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: UseOpenWebViewResult (copy), GameConfigurationActionsModule (upval), p1 (copy), CreatorHub (copy), RefreshPublishEligibilityModule (upval)
		UseOpenWebViewResult(GameConfigurationActionsModule.getExperienceQuestionnaireUrl(p1.target.universeId), CreatorHub, function()
			-- upvalues: RefreshPublishEligibilityModule (upval), p1 (upval)
			RefreshPublishEligibilityModule(p1.target.universeId)
		end)
	end, { CreatorHub, UseOpenWebViewResult, p1.target.universeId })
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult (copy), p1 (copy), GetVersionInformationStoreModule (upval), SendBuildExperienceEventModule (upval), UseStateResult2 (copy), UseResult (copy), GetAdUpsellEventStoreModule (upval), UseSignalStateResult2 (copy), FFlagBuildAdUpsellModule (upval), GameConfigurationActionsModule (upval), buildPublicAudiences (upval), UseSignalStateResult4 (ref), ContentMaturityUtilsModule (upval), ExperienceGuidelinesModule (upval), t (upval), Debug (upval), UseSignalStateResult1 (copy), UseSignalStateResult (copy), FFlagBuildExperiencePlaytestCardPublishCtaModule (upval), UseStateResult2_1 (copy), PublishSuccess (copy), PublishAudienceError (copy), PublishError (copy), AccountTooNewError (copy)
		if UseStateResult then return end
		local PlaceId = p1.target.placeId
		
		if PlaceId == nil then return end
		local Title = nil
		local Description = nil
		
		local function selectVersionNotes(Result)
			-- upvalues: GetVersionInformationStoreModule (upval), PlaceId (copy), Title (ref), Description (ref)
			local Draft = GetVersionInformationStoreModule().getDraft()
			local PlaceVersion = if Result == nil then nil else Result.placeVersions[1]
			
			if Draft ~= nil and Draft.placeId == PlaceId then
				Title = if Draft.title == "" then nil else Draft.title
				Description = if Draft.description == "" then nil else Draft.description
				
				return
			end
			if PlaceVersion ~= nil then
				Title = PlaceVersion.title
				Description = PlaceVersion.description
			end
		end
		
		SendBuildExperienceEventModule("PUBLISH_CLICK", {
			universeId = p1.target.universeId,
			placeId = PlaceId,
			conversationId = p1.target.sessionId
		})
		UseStateResult2(true)
		UseResult()
		local v1 = "save_and_publish"
		local Flag = false
		
		local function _(p2)
			-- upvalues: GetAdUpsellEventStoreModule (upval), p1 (upval), Flag (ref)
			if typeof(p2) == "table" and p2.status == "success" and typeof(p2.version) == "string" and p2.version ~= "" then
				GetAdUpsellEventStoreModule(false).reportMenuPublish(p1.target.universeId, p1.target.sessionId, p2.version, Flag)
				
				return
			end
		end
		
		local function publish(p2)
			-- upvalues: v1 (ref), UseSignalStateResult2 (upval), FFlagBuildAdUpsellModule (upval), Flag (ref), GameConfigurationActionsModule (upval), p1 (upval), PlaceId (copy), Title (ref), Description (ref), buildPublicAudiences (upval)
			v1 = "save_and_publish"
			local P6 = p2 or UseSignalStateResult2
			
			if FFlagBuildAdUpsellModule then
				Flag = true
			end
			return GameConfigurationActionsModule.publishExperience({
				universeId = p1.target.universeId,
				placeId = PlaceId,
				title = Title,
				description = Description,
				isActive = P6 ~= nil and P6.isActive == true,
				audiences = buildPublicAudiences(if P6 then P6.audiences else nil)
			})
		end
		
		local function startPublish()
			-- upvalues: UseSignalStateResult4 (upval), publish (copy), v1 (ref), p1 (upval), ContentMaturityUtilsModule (upval), ExperienceGuidelinesModule (upval), t (upval), Debug (upval), UseSignalStateResult1 (upval)
			if UseSignalStateResult4 == nil then
				return publish()
			else
				v1 = "refresh_eligibility"
				
				return UseSignalStateResult4.refreshEligibility(p1.target.universeId):andThen(function()
					-- upvalues: ContentMaturityUtilsModule (upval), p1 (upval), ExperienceGuidelinesModule (upval), t (upval), Debug (upval), v1 (upval), UseSignalStateResult1 (upval), publish (upval)
					if ContentMaturityUtilsModule.isSealBroken(p1.target.universeId) and ContentMaturityUtilsModule.isContentUnrated(p1.target.universeId) then
						return ExperienceGuidelinesModule.getExperienceGuidelinesStore().refreshDetailedGuidelines(p1.target.universeId):andThen(function()
							-- upvalues: t (upval)
							return t
						end, function(p2)
							-- upvalues: Debug (upval), p1 (upval), t (upval)
							Debug.log("warn", "build_experience content maturity refresh failed", {
								errorMessage = tostring(p2),
								universeId = p1.target.universeId
							})
							
							return t
						end)
					else
						v1 = "refresh_summary"
						
						return UseSignalStateResult1.refreshSummary(p1.target.universeId):andThen(function(Result)
							-- upvalues: publish (upval)
							return publish(Result)
						end)
					end
				end)
			end
		end
		
		local Draft = GetVersionInformationStoreModule().getDraft()
		local Promise = nil
		
		if Draft == nil or Draft.placeId ~= PlaceId then
			Promise = UseSignalStateResult.fetchPageHistory(PlaceId):andThen(selectVersionNotes, function()
				-- upvalues: GetVersionInformationStoreModule (upval), PlaceId (copy), Title (ref), Description (ref)
				local Draft = GetVersionInformationStoreModule().getDraft()
				
				if Draft ~= nil and Draft.placeId == PlaceId then
					Title = if Draft.title == "" then nil else Draft.title
					Description = if Draft.description == "" then nil else Draft.description
					
					return
				end
			end):andThen(startPublish)
		else
			local Draft1 = GetVersionInformationStoreModule().getDraft()
			
			if Draft1 ~= nil and Draft1.placeId == PlaceId then
				Title = if Draft1.title == "" then nil else Draft1.title
				Description = if Draft1.description == "" then nil else Draft1.description
			end
			if UseSignalStateResult4 == nil then
				Promise = publish()
			else
				v1 = "refresh_eligibility"
				Promise = UseSignalStateResult4.refreshEligibility(p1.target.universeId):andThen(function()
					-- upvalues: ContentMaturityUtilsModule (upval), p1 (upval), ExperienceGuidelinesModule (upval), t (upval), Debug (upval), v1 (ref), UseSignalStateResult1 (upval), publish (copy)
					if ContentMaturityUtilsModule.isSealBroken(p1.target.universeId) and ContentMaturityUtilsModule.isContentUnrated(p1.target.universeId) then
						return ExperienceGuidelinesModule.getExperienceGuidelinesStore().refreshDetailedGuidelines(p1.target.universeId):andThen(function()
							-- upvalues: t (upval)
							return t
						end, function(p2)
							-- upvalues: Debug (upval), p1 (upval), t (upval)
							Debug.log("warn", "build_experience content maturity refresh failed", {
								errorMessage = tostring(p2),
								universeId = p1.target.universeId
							})
							
							return t
						end)
					else
						v1 = "refresh_summary"
						
						return UseSignalStateResult1.refreshSummary(p1.target.universeId):andThen(function(Result)
							-- upvalues: publish (upval)
							return publish(Result)
						end)
					end
				end)
			end
		end
		Promise:andThen(function(Result)
			-- upvalues: t (upval), FFlagBuildAdUpsellModule (upval), GetAdUpsellEventStoreModule (upval), p1 (upval), Flag (ref), GetVersionInformationStoreModule (upval), PlaceId (copy), UseSignalStateResult (upval), FFlagBuildExperiencePlaytestCardPublishCtaModule (upval), UseStateResult2_1 (upval), PublishSuccess (upval)
			if Result == t then return end
			if typeof(Result) ~= "table" or Result.status ~= "success" or typeof(Result.version) ~= "string" or Result.version == "" then
				error({
					errorMessage = "save_and_publish expected status=success and a non-empty version; " .. `got status={tostring(Result.status)}, version={tostring(Result.version)}`
				})
			end
			if FFlagBuildAdUpsellModule and (typeof(Result) == "table" and Result.status == "success" and typeof(Result.version) == "string" and Result.version ~= "") then
				GetAdUpsellEventStoreModule(false).reportMenuPublish(p1.target.universeId, p1.target.sessionId, Result.version, Flag)
			end
			GetVersionInformationStoreModule().clearDraft(PlaceId)
			UseSignalStateResult.fetchHistory(PlaceId)
			
			if FFlagBuildExperiencePlaytestCardPublishCtaModule then
				UseSignalStateResult.fetchLiveVersion(PlaceId)
			end
			UseStateResult2_1(PublishSuccess)
		end):catch(function(Err)
			-- upvalues: GameConfigurationActionsModule (upval), PublishAudienceError (upval), PublishError (upval), AccountTooNewError (upval), GetVersionInformationStoreModule (upval), PlaceId (copy), UseSignalStateResult (upval), FFlagBuildExperiencePlaytestCardPublishCtaModule (upval), Debug (upval), v1 (ref), p1 (upval), UseStateResult2_1 (upval)
			local IsTable = typeof(Err) == "table"
			local IsStageMatch: boolean = IsTable and Err.stage == GameConfigurationActionsModule.PublishFailureStage.SetAudience
			local IsNotVersionMatch: boolean = IsStageMatch
			
			if IsNotVersionMatch then
				local PublishResult = Err.publishResult
				IsNotVersionMatch = typeof(PublishResult) == "table" and (PublishResult.status == "success" and typeof(PublishResult.version) == "string") and PublishResult.version ~= ""
			end
			local IsResponseCodeMatch: boolean = IsTable and Err.responseCode == 16
			local AccountTooNewError1 = if IsResponseCodeMatch then AccountTooNewError elseif IsNotVersionMatch then PublishAudienceError else PublishError
			
			if IsNotVersionMatch then
				GetVersionInformationStoreModule().clearDraft(PlaceId)
				UseSignalStateResult.fetchHistory(PlaceId)
				
				if FFlagBuildExperiencePlaytestCardPublishCtaModule then
					UseSignalStateResult.fetchLiveVersion(PlaceId)
				end
			end
			Debug.log("warn", "build_experience publish failed", {
				errorMessage = if IsTable and Err.errorMessage ~= nil then tostring(Err.errorMessage) else tostring(Err),
				placeId = PlaceId,
				responseCode = if IsTable then Err.responseCode else nil,
				stage = if IsStageMatch then GameConfigurationActionsModule.PublishFailureStage.SetAudience else v1,
				universeId = p1.target.universeId
			})
			UseStateResult2_1(AccountTooNewError1)
		end):finally(function()
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(false)
		end)
	end, {
		if FFlagBuildAdUpsellModule then Audience else nil, UseResult, UseStateResult,
		UseSignalStateResult, p1.target.placeId, p1.target.sessionId,
		p1.target.universeId, UseSignalStateResult4, UseSignalStateResult1,
		UseSignalStateResult2, AccountTooNewError, PublishAudienceError, PublishError,
		PublishSuccess
	})
	local ActionsName: string = `{p1.testId}.actions`
	local UseGamePermissionsModuleResult = if FFlagBuildCheckGamePermissionsModule then UseGamePermissionsModule({
		universeId = p1.target.universeId,
		isNewGame = p1.target.isNewGameTarget
	}) else nil
	local NoFFlagBuildCheckGamePermissionsModule = not FFlagBuildCheckGamePermissionsModule or UseGamePermissionsModuleResult.canPublish
	local UseRefResult = if FFlagBuildPostPublishShareDismissibleModule then ReactModule.useRef(nil) else nil
	local UseTokensResult = if FFlagBuildPostPublishShareDismissibleModule then FoundationModule.Hooks.useTokens() else nil
	local UseClosableFocusRootModuleResult = if FFlagBuildPostPublishShareDismissibleModule then UseClosableFocusRootModule({
		surfaceIdentifier = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum.PopUp,
		isOpen = UseStateResult1 ~= "",
		onClose = UseResult
	}) else nil
	local IsUsePreferredInputResultMatch = if FFlagBuildPostPublishShareDismissibleModule then ResponsiveModule.usePreferredInput() == ResponsiveModule.Input.Directional else nil
	local Element = ReactModule.createElement(Snackbar, {
		LayoutOrder = 1,
		ref = if FFlagBuildPostPublishShareDismissibleModule then UseClosableFocusRootModuleResult else nil,
		title = UseStateResult1,
		action = if IsNotAudienceMatch then { text = Share, onActivated = UseResult2 } else nil,
		onClose = if FFlagBuildPostPublishShareDismissibleModule then if IsUsePreferredInputResultMatch then nil else UseResult elseif IsNotAudienceMatch then nil else UseResult,
		testId = `{p1.testId}.publish-snackbar`
	})
	
	return ReactModule.createElement(View, {
		LayoutOrder = 3,
		tag = {
			["col gap-small size-full-0 auto-y"] = true,
			["bg-surface-0"] = not FFlagBuildPublishNavigationSheetModule
		}
	}, {
		PublishSnackbar = if FFlagBuildPostPublishShareDismissibleModule then ReactModule.createElement(Popover.Root, {
			isOpen = UseStateResult1 ~= "",
			testId = `{p1.testId}.publish-snackbar-popover`
		}, {
			Anchor = ReactModule.createElement(Popover.Anchor, { anchorRef = UseRefResult }),
			Content = ReactModule.createElement(Popover.Content, {
				hasArrow = false,
				selectionGroup = false,
				align = PopoverAlign.Center,
				backgroundStyle = UseTokensResult.Color.None,
				side = PopoverSide.Top
			}, { Snackbar = Element })
		}) else nil,
		PublishSnackbarWrapper = if FFlagBuildPostPublishShareDismissibleModule then nil elseif UseStateResult1 == "" then nil else ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "row align-x-center size-full-0 auto-y padding-x-large"
		}, { PublishSnackbar = Element }),
		Actions = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "row gap-small size-full-0 auto-y padding-y-medium",
			ref = if FFlagBuildPostPublishShareDismissibleModule then UseRefResult else nil,
			testId = ActionsName
		}, {
			Publish = ReactModule.createElement(Button, {
				LayoutOrder = 1,
				text = if UseMemoResult then UpdateRating else Publish,
				size = InputSize.Medium,
				variant = ButtonVariant.Emphasis,
				fillBehavior = FillBehavior.Fill,
				isDisabled = p1.target.placeId == nil or not NoFFlagBuildCheckGamePermissionsModule,
				isLoading = UseStateResult,
				onActivated = if UseMemoResult then UseResult4 else UseResult5,
				width = UDim.new(1, 0),
				testId = `{ActionsName}-publish`
			}),
			Preview = if p1.showPreviewButton == false then nil else ReactModule.createElement(PreviewButton, {
				target = p1.target,
				actionsTestId = ActionsName,
				onPreview = p1.onPreview
			})
		}),
		FriendsOnlyShareDialog = if UseStateResult3 == "friends" and Audience == PrivacyType.FriendsOnly then ReactModule.createElement(FriendsOnlyShareDialogModule, { onCancel = UseResult3, onShare = UseResult1 }) else nil
	})
end