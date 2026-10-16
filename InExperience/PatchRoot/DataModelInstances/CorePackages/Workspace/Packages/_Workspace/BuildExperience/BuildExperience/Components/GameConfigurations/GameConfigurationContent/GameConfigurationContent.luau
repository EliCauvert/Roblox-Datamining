local CaptureService = game:GetService("CaptureService")
local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local LocalizationModule = require(Parent.Localization)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local UseOpenWebViewFunction = require(Parent.WebViewUtils).useOpenWebView
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local ExperienceGuidelinesModule = require(Parent.DataHydration.ExperienceGuidelines)
local UniverseConfigurationModule = require(Parent.DataHydration.UniverseConfiguration)
local UniverseActivationModule = require(Parent.DataHydration.UniverseActivation)
local GameConfigurationLabelsModule = require(BuildExperience.utils.GameConfigurationLabels)
local ArchiveGameDialogModule = require(BuildExperience.Components.GameConfigurations.ArchiveGameDialog)
local ExperienceShareOverlaysModule = require(BuildExperience.Components.ShareAudience.ExperienceShareOverlays)
local BuildMaturityBannerModule = require(BuildExperience.Components.GameConfigurations.BuildMaturityBanner.BuildMaturityBanner)
local ContentMaturityUtilsModule = require(BuildExperience.utils.ContentMaturityUtils)
local GameConfigurationActionsModule = require(BuildExperience.utils.GameConfigurationActions)
local RefreshPublishEligibilityModule = require(BuildExperience.utils.refreshPublishEligibility)
local UseArchiveGameFlowModule = require(BuildExperience.utils.useArchiveGameFlow)
local UseExperienceShareFlowModule = require(BuildExperience.utils.useExperienceShareFlow)
local GameConfigurationListModule = require(script.Parent.Parent.GameConfigurationList.GameConfigurationList)
local GetPrivatePlaytestersStoreFunction = require(Parent.DataHydration.PrivatePlaytesters).getPrivatePlaytestersStore
local FFlagBuildExperiencePrivateInvitesModule = require(BuildExperience.Flags.FFlagBuildExperiencePrivateInvites)
local FFlagBuildExperienceMonetizationNativeUIModule = require(BuildExperience.Flags.FFlagBuildExperienceMonetizationNativeUI)
local Text = FoundationModule.Text
local View = FoundationModule.View
local IconName = FoundationModule.Enums.IconName
local CaptureServiceStartUploadCoreScriptBypassEngineFeature = require(Parent.SharedFlags).FFlagMyStatsMediaSelector and (CaptureService.PromptCaptureGalleryPermissionAsync and game:GetEngineFeature("CaptureServiceStartUploadCoreScriptBypass"))
local PrivacyType = UniverseConfigurationModule.PrivacyType

return function(p1) --[[ Line: 67 | Named "GameConfigurationContent" ]]
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), ReactModule (copy), LocalizationModule (copy), UseOpenWebViewFunction (copy), UseArchiveGameFlowModule (copy), FFlagBuildExperiencePrivateInvitesModule (copy), UseExperienceShareFlowModule (copy), UniverseConfigurationModule (copy), ExperienceGuidelinesModule (copy), SignalsReactModule (copy), GameConfigurationLabelsModule (copy), PrivacyType (copy), UniverseActivationModule (copy), ContentMaturityUtilsModule (copy), GameConfigurationActionsModule (copy), RefreshPublishEligibilityModule (copy), CaptureServiceStartUploadCoreScriptBypassEngineFeature (copy), IconName (copy), GetPrivatePlaytestersStoreFunction (copy), SignalsModule (copy), FFlagBuildExperienceMonetizationNativeUIModule (copy), View (copy), GameConfigurationListModule (copy), BuildMaturityBannerModule (copy), Text (copy), ArchiveGameDialogModule (copy), ExperienceShareOverlaysModule (copy)
	local TestId = p1.testId or "game-configuration-content"
	local UseLocalizationResult = UseLocalizationFunction({
		access = LocalizationStringsModule.GAME_CONFIGURATION_ACCESS,
		accessAndSharing = LocalizationStringsModule.GAME_CONFIGURATION_ACCESS_AND_SHARING,
		accessBody = LocalizationStringsModule.GAME_CONFIGURATION_ACCESS_BODY,
		archiveGame = LocalizationStringsModule.GAME_CONFIGURATION_ARCHIVE_GAME,
		audience = LocalizationStringsModule.GAME_CONFIGURATION_AUDIENCE,
		contentRating = LocalizationStringsModule.GAME_CONFIGURATION_CONTENT_RATING,
		creatorHub = LocalizationStringsModule.GAME_CONFIGURATION_CREATOR_HUB,
		creatorHubDescription = LocalizationStringsModule.GAME_CONFIGURATION_CREATOR_HUB_DESCRIPTION,
		gameConfiguration = LocalizationStringsModule.GAME_CONFIGURATION_GAME_CONFIGURATION,
		gameConfigurationBody = LocalizationStringsModule.GAME_CONFIGURATION_GAME_CONFIGURATION_BODY,
		salesOptions = LocalizationStringsModule.GAME_CONFIGURATION_SALES_OPTIONS,
		friendsOnlyAudience = LocalizationStringsModule.GAME_CONFIGURATION_AUDIENCE_FRIENDS_ONLY,
		gameDetails = LocalizationStringsModule.GAME_CONFIGURATION_GAME_DETAILS,
		gameDetailsBody = LocalizationStringsModule.GAME_CONFIGURATION_GAME_DETAILS_BODY,
		iconAndThumbnails = LocalizationStringsModule.GAME_CONFIGURATION_ICON_AND_THUMBNAILS,
		loading = LocalizationStringsModule.GAME_CONFIGURATION_LOADING,
		privateAudience = LocalizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PRIVATE,
		privateInvitesRowDescription = LocalizationStringsModule.PRIVATE_INVITES_ROW_DESCRIPTION,
		privateInvitesRowLoadError = LocalizationStringsModule.PRIVATE_INVITES_ROW_LOAD_ERROR,
		privateInvitesRowTitle = LocalizationStringsModule.PRIVATE_INVITES_ROW_TITLE,
		privateInvitesRowTitleEmpty = LocalizationStringsModule.PRIVATE_INVITES_ROW_TITLE_EMPTY,
		privateInvitesShareLink = LocalizationStringsModule.PRIVATE_INVITES_SHARE_LINK,
		publicAudience = LocalizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PUBLIC,
		questionnaireRequiredBanner = LocalizationStringsModule.GAME_CONFIGURATION_QUESTIONNAIRE_REQUIRED_BANNER,
		titleAndDescription = LocalizationStringsModule.GAME_CONFIGURATION_TITLE_AND_DESCRIPTION,
		unknownAudience = LocalizationStringsModule.GAME_CONFIGURATION_AUDIENCE_UNKNOWN
	})
	local UseContextResult = ReactModule.useContext(LocalizationModule.LocalizationRoactContext)
	local Access = UseLocalizationResult.access
	local AccessAndSharing = UseLocalizationResult.accessAndSharing
	local AccessBody = UseLocalizationResult.accessBody
	local ArchiveGame = UseLocalizationResult.archiveGame
	local Audience = UseLocalizationResult.audience
	local ContentRating = UseLocalizationResult.contentRating
	local CreatorHub = UseLocalizationResult.creatorHub
	local CreatorHubDescription = UseLocalizationResult.creatorHubDescription
	local FriendsOnlyAudience = UseLocalizationResult.friendsOnlyAudience
	local GameDetails = UseLocalizationResult.gameDetails
	local GameDetailsBody = UseLocalizationResult.gameDetailsBody
	local IconAndThumbnails = UseLocalizationResult.iconAndThumbnails
	local Loading = UseLocalizationResult.loading
	local PrivateAudience = UseLocalizationResult.privateAudience
	local PrivateInvitesRowDescription = UseLocalizationResult.privateInvitesRowDescription
	local PrivateInvitesRowLoadError = UseLocalizationResult.privateInvitesRowLoadError
	local PrivateInvitesRowTitle = UseLocalizationResult.privateInvitesRowTitle
	local PrivateInvitesRowTitleEmpty = UseLocalizationResult.privateInvitesRowTitleEmpty
	local PrivateInvitesShareLink = UseLocalizationResult.privateInvitesShareLink
	local PublicAudience = UseLocalizationResult.publicAudience
	local QuestionnaireRequiredBanner = UseLocalizationResult.questionnaireRequiredBanner
	local TitleAndDescription = UseLocalizationResult.titleAndDescription
	local UnknownAudience = UseLocalizationResult.unknownAudience
	local UseOpenWebViewResult = UseOpenWebViewFunction()
	local UseArchiveGameFlowModuleResult = UseArchiveGameFlowModule()
	local UseExperienceShareFlowModuleResult = if FFlagBuildExperiencePrivateInvitesModule then UseExperienceShareFlowModule(p1.universeId, p1.placeId) else nil
	local OnShare = if UseExperienceShareFlowModuleResult == nil then nil else UseExperienceShareFlowModuleResult.onShare
	local UseSignalStateResult = SignalsReactModule.useSignalState(ReactModule.useMemo(function() --[[ Line: 131 ]]
		-- upvalues: UniverseConfigurationModule (upval), p1 (copy)
		return UniverseConfigurationModule.getUniverseConfigurationStore().getAndFetchConfiguration(p1.universeId)
	end, { p1.universeId }).data)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(ReactModule.useMemo(function() --[[ Line: 134 ]]
		-- upvalues: ExperienceGuidelinesModule (upval), p1 (copy)
		return ExperienceGuidelinesModule.getExperienceGuidelinesStore().getAndFetchDetailedGuidelines(p1.universeId)
	end, { p1.universeId }).data)
	local Audience1 = if UseSignalStateResult then GameConfigurationLabelsModule.getAudience(UseSignalStateResult) else nil
	local Loading1 = nil
	Loading1 = if UseSignalStateResult == nil then Loading elseif Audience1 == PrivacyType.Private then PrivateAudience elseif Audience1 == PrivacyType.Public then PublicAudience elseif Audience1 == PrivacyType.FriendsOnly then FriendsOnlyAudience else GameConfigurationLabelsModule.getAudienceText(UseSignalStateResult) or UnknownAudience
	local Text1 = nil
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(ReactModule.useMemo(function() --[[ Line: 156 ]]
		-- upvalues: UniverseActivationModule (upval), p1 (copy)
		return UniverseActivationModule.getUniverseActivationStore().getAndFetchEligibility(p1.universeId)
	end, { p1.universeId }).data)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 160 ]]
		-- upvalues: ContentMaturityUtilsModule (upval), p1 (copy)
		return ContentMaturityUtilsModule.isSealBroken(p1.universeId)
	end, { UseSignalStateResult2, p1.universeId })
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 163 ]]
		-- upvalues: ContentMaturityUtilsModule (upval), p1 (copy)
		return ContentMaturityUtilsModule.isContentUnrated(p1.universeId)
	end, { UseSignalStateResult2, p1.universeId })
	local ProvisionalRating = if UseSignalStateResult2 then UseSignalStateResult2.provisionalRating else nil
	local NoUseMemoResult: boolean = UseMemoResult1 and not UseMemoResult
	
	if UseMemoResult and UseMemoResult1 then
		Text1 = QuestionnaireRequiredBanner
	end
	local ContentMaturityText = GameConfigurationLabelsModule.getContentMaturityText(UseSignalStateResult1, ProvisionalRating, NoUseMemoResult) or Loading
	local UseResult = ReactModule.useCallback(function() --[[ Line: 180 ]]
		-- upvalues: UseOpenWebViewResult (copy), GameConfigurationActionsModule (upval), p1 (copy), CreatorHub (copy)
		UseOpenWebViewResult(GameConfigurationActionsModule.getCreatorHubConfigureUrl(p1.universeId), CreatorHub)
	end, { CreatorHub, UseOpenWebViewResult, p1.universeId })
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 184 ]]
		-- upvalues: UseOpenWebViewResult (copy), GameConfigurationActionsModule (upval), p1 (copy), CreatorHub (copy), RefreshPublishEligibilityModule (upval)
		UseOpenWebViewResult(GameConfigurationActionsModule.getExperienceQuestionnaireUrl(p1.universeId), CreatorHub, function() --[[ Line: 185 ]]
			-- upvalues: RefreshPublishEligibilityModule (upval), p1 (upval)
			RefreshPublishEligibilityModule(p1.universeId)
		end)
	end, { CreatorHub, UseOpenWebViewResult, p1.universeId })
	local UseMemoResult2 = ReactModule.useMemo(function() --[[ Line: 191 ]]
		-- upvalues: IconAndThumbnails (copy), CaptureServiceStartUploadCoreScriptBypassEngineFeature (upval), IconName (upval), p1 (copy), UseResult (copy), TitleAndDescription (copy)
		return {
			{
				id = "icon-thumbnails",
				title = IconAndThumbnails,
				trailingIcon = if CaptureServiceStartUploadCoreScriptBypassEngineFeature then nil else IconName.ArrowUpRightFromSquare,
				onActivated = if CaptureServiceStartUploadCoreScriptBypassEngineFeature then p1.onOpenMediaSelectionPage else UseResult
			},
			{
				id = "title-description",
				trailingIcon = nil,
				title = TitleAndDescription,
				description = p1.experienceName,
				onActivated = p1.onOpenTitleDescriptionPage
			}
		}
	end, {
		UseResult, p1.experienceName, p1.onOpenMediaSelectionPage,
		p1.onOpenTitleDescriptionPage, IconAndThumbnails, TitleAndDescription
	})
	local OnOpenPlaytestPicker = p1.onOpenPlaytestPicker
	local OnOpenPlaytestManagement = p1.onOpenPlaytestManagement
	local HasOnOpenPlaytestManagement: boolean = FFlagBuildExperiencePrivateInvitesModule and (OnOpenPlaytestPicker ~= nil and OnOpenPlaytestManagement ~= nil)
	local UseMemoResult21 = ReactModule.useMemo(function() --[[ Line: 226 ]]
		-- upvalues: HasOnOpenPlaytestManagement (copy), GetPrivatePlaytestersStoreFunction (upval), p1 (copy)
		return if HasOnOpenPlaytestManagement then GetPrivatePlaytestersStoreFunction(false).getAndFetchInvitedPlayers(p1.universeId) else nil
	end, { HasOnOpenPlaytestManagement, p1.universeId })
	local UseSignalStateResult3: number = SignalsReactModule.useSignalState((ReactModule.useMemo(function() --[[ Line: 233 ]]
		-- upvalues: SignalsModule (upval), UseMemoResult21 (copy)
		return SignalsModule.createComputed(function(p2): number --[[ Line: 234 ]]
			-- upvalues: UseMemoResult21 (upval)
			return if UseMemoResult21 == nil then 0 else #UseMemoResult21.players(p2)
		end)
	end, { UseMemoResult21 })))
	local UseSignalStateResult21 = SignalsReactModule.useSignalState((ReactModule.useMemo(function() --[[ Line: 240 ]]
		-- upvalues: SignalsModule (upval), UseMemoResult21 (copy)
		return SignalsModule.createComputed(function(p2) --[[ Line: 241 ]]
			-- upvalues: UseMemoResult21 (upval)
			return if UseMemoResult21 == nil then "NotReady" else UseMemoResult21.status(p2)
		end)
	end, { UseMemoResult21 })))
	local MAXINVITES = GetPrivatePlaytestersStoreFunction(false).MAX_INVITES
	local Config = nil
	
	if HasOnOpenPlaytestManagement then
		if UseSignalStateResult21 == "Ready" then
			local FormatResult = if UseSignalStateResult3 > 0 then UseContextResult:Format(LocalizationStringsModule.PRIVATE_INVITES_SENT, {
				INVITED_COUNT = UseSignalStateResult3,
				MAX_INVITES = MAXINVITES
			}) else nil
			Config = if UseSignalStateResult3 > 0 then {
				id = "playtest",
				trailingIcon = nil,
				title = PrivateInvitesRowTitle,
				description = FormatResult,
				onActivated = OnOpenPlaytestManagement
			} else {
				id = "playtest",
				trailingIcon = nil,
				title = PrivateInvitesRowTitleEmpty,
				description = PrivateInvitesRowDescription,
				onActivated = OnOpenPlaytestPicker
			}
		else
			Config = {
				id = "playtest",
				trailingIcon = nil,
				onActivated = nil,
				title = PrivateInvitesRowTitle,
				description = if UseSignalStateResult21 == "Failed" then PrivateInvitesRowLoadError else Loading
			}
		end
	end
	local UseMemoResult3 = ReactModule.useMemo(function() --[[ Line: 291 ]]
		-- upvalues: Audience (copy), Loading1 (ref), p1 (copy), Config (ref), PrivateInvitesShareLink (copy), OnShare (copy), ContentRating (copy), ContentMaturityText (copy), IconName (upval), UseResult1 (copy)
		local List = {
			{
				id = "audience",
				trailingIcon = nil,
				title = Audience,
				description = Loading1,
				onActivated = p1.onOpenAudiencePage
			}
		}
		
		if Config ~= nil then
			table.insert(List, Config)
			table.insert(List, {
				id = "playtest-share-link",
				trailingIcon = nil,
				title = PrivateInvitesShareLink,
				onActivated = OnShare
			})
		end
		table.insert(List, {
			id = "content-rating",
			title = ContentRating,
			description = ContentMaturityText,
			trailingIcon = IconName.ArrowUpRightFromSquare,
			onActivated = UseResult1
		})
		
		return List
	end, {
		Loading1, ContentMaturityText, UseResult1, Config, OnShare,
		p1.onOpenAudiencePage, Audience, ContentRating, PrivateInvitesShareLink
	})
	local UseMemoResult4 = ReactModule.useMemo(function() --[[ Line: 335 ]]
		-- upvalues: CreatorHub (copy), CreatorHubDescription (copy), IconName (upval), UseResult (copy)
		return {
			{
				id = "creator-hub",
				title = CreatorHub,
				description = CreatorHubDescription,
				trailingIcon = IconName.ArrowUpRightFromSquare,
				onActivated = UseResult
			}
		}
	end, { CreatorHub, CreatorHubDescription, UseResult })
	local Rows = {}
	
	if FFlagBuildExperienceMonetizationNativeUIModule then
		table.insert(Rows, {
			id = "sales-options",
			title = UseLocalizationResult.salesOptions,
			onActivated = p1.onOpenMonetizationPage
		})
	end
	return ReactModule.createElement(View, {
		tag = "col gap-xlarge size-full-0 auto-y padding-y-large",
		LayoutOrder = p1.layoutOrder,
		testId = TestId
	}, {
		GameDetails = ReactModule.createElement(GameConfigurationListModule, {
			layoutOrder = 1,
			title = GameDetails,
			body = GameDetailsBody,
			rows = UseMemoResult2,
			testId = `{TestId}-game-details`
		}),
		Access = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "col gap-medium size-full-0 auto-y"
		}, {
			Configuration = ReactModule.createElement(GameConfigurationListModule, {
				layoutOrder = 1,
				title = if HasOnOpenPlaytestManagement then AccessAndSharing else Access,
				body = AccessBody,
				rows = UseMemoResult3,
				testId = `{TestId}-access`
			}),
			BuildMaturityBanner = if Text1 == nil then nil else ReactModule.createElement(BuildMaturityBannerModule, { text = Text1 })
		}),
		GameConfiguration = if FFlagBuildExperienceMonetizationNativeUIModule then ReactModule.createElement(GameConfigurationListModule, {
			layoutOrder = 3,
			title = UseLocalizationResult.gameConfiguration,
			body = UseLocalizationResult.gameConfigurationBody,
			rows = Rows,
			testId = `{TestId}-game-configuration`
		}) else nil,
		CreatorHub = ReactModule.createElement(GameConfigurationListModule, {
			layoutOrder = if FFlagBuildExperienceMonetizationNativeUIModule then 4 else 3,
			title = CreatorHub,
			rows = UseMemoResult4,
			testId = `{TestId}-creator-hub`
		}),
		ArchiveGame = ReactModule.createElement(View, {
			tag = "row align-y-center size-full-0 auto-y padding-large stroke-standard stroke-default radius-large bg-surface-0",
			LayoutOrder = if FFlagBuildExperienceMonetizationNativeUIModule then 5 else 4,
			onActivated = ReactModule.useCallback(function() --[[ Line: 357 ]]
				-- upvalues: UseArchiveGameFlowModuleResult (copy), p1 (copy)
				UseArchiveGameFlowModuleResult.requestArchive(p1.universeId)
			end, {
				UseArchiveGameFlowModuleResult.requestArchive,
				p1.universeId
			}),
			stateLayer = {},
			testId = `{TestId}-archive-game`
		}, {
			Label = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "fill auto-y text-title-medium text-align-x-left content-default",
				Text = ArchiveGame
			})
		}),
		ArchiveDialog = ReactModule.createElement(ArchiveGameDialogModule, {
			isOpen = UseArchiveGameFlowModuleResult.isOpen,
			onArchive = UseArchiveGameFlowModuleResult.confirm,
			onCancel = UseArchiveGameFlowModuleResult.cancel
		}),
		ShareOverlays = if FFlagBuildExperiencePrivateInvitesModule and UseExperienceShareFlowModuleResult ~= nil then ReactModule.createElement(ExperienceShareOverlaysModule, {
			activeDialog = UseExperienceShareFlowModuleResult.activeDialog,
			hasShareError = UseExperienceShareFlowModuleResult.hasShareError,
			onCancel = UseExperienceShareFlowModuleResult.onCancelDialog,
			onConfirmFriends = UseExperienceShareFlowModuleResult.onConfirmFriends,
			onConfirmPlaytesters = UseExperienceShareFlowModuleResult.onConfirmPlaytesters
		}) else nil
	})
end