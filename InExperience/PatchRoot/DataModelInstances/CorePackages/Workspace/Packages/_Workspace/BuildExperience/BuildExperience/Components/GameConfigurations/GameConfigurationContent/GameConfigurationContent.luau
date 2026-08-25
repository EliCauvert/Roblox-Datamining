local captureService = game:GetService("CaptureService")
local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local useOpenWebView = require(parent.WebViewUtils).useOpenWebView
local useLocalization = localizationModule.Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local experienceGuidelinesModule = require(parent.DataHydration.ExperienceGuidelines)
local universeConfigurationModule = require(parent.DataHydration.UniverseConfiguration)
local universeActivationModule = require(parent.DataHydration.UniverseActivation)
local gameConfigurationLabelsModule = require(buildExperience.utils.GameConfigurationLabels)
local archiveGameDialogModule = require(buildExperience.Components.GameConfigurations.ArchiveGameDialog)
local experienceShareOverlaysModule = require(buildExperience.Components.ShareAudience.ExperienceShareOverlays)
local buildMaturityBannerModule = require(buildExperience.Components.GameConfigurations.BuildMaturityBanner.BuildMaturityBanner)
local contentMaturityUtilsModule = require(buildExperience.utils.ContentMaturityUtils)
local gameConfigurationActionsModule = require(buildExperience.utils.GameConfigurationActions)
local refreshPublishEligibilityModule = require(buildExperience.utils.refreshPublishEligibility)
local useArchiveGameFlowModule = require(buildExperience.utils.useArchiveGameFlow)
local useExperienceShareFlowModule = require(buildExperience.utils.useExperienceShareFlow)
local gameConfigurationListModule = require(script.Parent.Parent.GameConfigurationList.GameConfigurationList)
local getPrivatePlaytestersStore = require(parent.DataHydration.PrivatePlaytesters).getPrivatePlaytestersStore
local fFlagBuildExperiencePrivateInvitesModule = require(buildExperience.Flags.FFlagBuildExperiencePrivateInvites)
local text = foundationModule.Text
local view = foundationModule.View
local iconName = foundationModule.Enums.IconName
local captureServiceStartUploadCoreScriptBypass = sharedFlagsModule.FFlagMyStatsMediaSelector and (captureService.PromptCaptureGalleryPermissionAsync and game:GetEngineFeature("CaptureServiceStartUploadCoreScriptBypass"))
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local fFlagEnableProvisionalRatingModule = require(buildExperience.Flags.FFlagEnableProvisionalRating)
local fFlagBuildRehydrateOnPublishModule = require(buildExperience.Flags.FFlagBuildRehydrateOnPublish)
local privacyType = universeConfigurationModule.PrivacyType

return function(p0)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), localizationModule (ref), useOpenWebView (ref), useArchiveGameFlowModule (ref), fFlagBuildExperiencePrivateInvitesModule (ref), useExperienceShareFlowModule (ref), universeConfigurationModule (ref), experienceGuidelinesModule (ref), signalsReactModule (ref), gameConfigurationLabelsModule (ref), privacyType (ref), fFlagEnableProvisionalRatingModule (ref), universeActivationModule (ref), contentMaturityUtilsModule (ref), fFlagBuildRehydrateOnPublishModule (ref), gameConfigurationActionsModule (ref), refreshPublishEligibilityModule (ref), captureServiceStartUploadCoreScriptBypass (ref), iconName (ref), getPrivatePlaytestersStore (ref), signalsModule (ref), view (ref), gameConfigurationListModule (ref), buildMaturityBannerModule (ref), text (ref), archiveGameDialogModule (ref), experienceShareOverlaysModule (ref)
	local GAME_CONFIGURATION_ACCESS, GAME_CONFIGURATION_ACCESS_AND_SHARING, GAME_CONFIGURATION_ACCESS_BODY, GAME_CONFIGURATION_ARCHIVE_GAME, GAME_CONFIGURATION_AUDIENCE, GAME_CONFIGURATION_CONTENT_RATING, GAME_CONFIGURATION_CREATOR_HUB, GAME_CONFIGURATION_CREATOR_HUB_DESCRIPTION, GAME_CONFIGURATION_AUDIENCE_FRIENDS_ONLY, GAME_CONFIGURATION_GAME_DETAILS, GAME_CONFIGURATION_GAME_DETAILS_BODY, GAME_CONFIGURATION_ICON_AND_THUMBNAILS, GAME_CONFIGURATION_LOADING, GAME_CONFIGURATION_AUDIENCE_PRIVATE, PRIVATE_INVITES_ROW_DESCRIPTION, PRIVATE_INVITES_ROW_LOAD_ERROR, PRIVATE_INVITES_ROW_TITLE, PRIVATE_INVITES_ROW_TITLE_EMPTY, PRIVATE_INVITES_SHARE_LINK, GAME_CONFIGURATION_AUDIENCE_PUBLIC, GAME_CONFIGURATION_QUESTIONNAIRE_REQUIRED_BANNER, GAME_CONFIGURATION_TITLE_AND_DESCRIPTION, GAME_CONFIGURATION_AUDIENCE_UNKNOWN
	local testId = p0.testId or "game-configuration-content"
	local var27 = if fFlagBuildLocalization then useLocalization({
		access = localizationStringsModule.GAME_CONFIGURATION_ACCESS,
		accessAndSharing = localizationStringsModule.GAME_CONFIGURATION_ACCESS_AND_SHARING,
		accessBody = localizationStringsModule.GAME_CONFIGURATION_ACCESS_BODY,
		archiveGame = localizationStringsModule.GAME_CONFIGURATION_ARCHIVE_GAME,
		audience = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE,
		contentRating = localizationStringsModule.GAME_CONFIGURATION_CONTENT_RATING,
		creatorHub = localizationStringsModule.GAME_CONFIGURATION_CREATOR_HUB,
		creatorHubDescription = localizationStringsModule.GAME_CONFIGURATION_CREATOR_HUB_DESCRIPTION,
		friendsOnlyAudience = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_FRIENDS_ONLY,
		gameDetails = localizationStringsModule.GAME_CONFIGURATION_GAME_DETAILS,
		gameDetailsBody = localizationStringsModule.GAME_CONFIGURATION_GAME_DETAILS_BODY,
		iconAndThumbnails = localizationStringsModule.GAME_CONFIGURATION_ICON_AND_THUMBNAILS,
		loading = localizationStringsModule.GAME_CONFIGURATION_LOADING,
		privateAudience = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PRIVATE,
		privateInvitesRowDescription = localizationStringsModule.PRIVATE_INVITES_ROW_DESCRIPTION,
		privateInvitesRowLoadError = localizationStringsModule.PRIVATE_INVITES_ROW_LOAD_ERROR,
		privateInvitesRowTitle = localizationStringsModule.PRIVATE_INVITES_ROW_TITLE,
		privateInvitesRowTitleEmpty = localizationStringsModule.PRIVATE_INVITES_ROW_TITLE_EMPTY,
		privateInvitesShareLink = localizationStringsModule.PRIVATE_INVITES_SHARE_LINK,
		publicAudience = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PUBLIC,
		questionnaireRequiredBanner = localizationStringsModule.GAME_CONFIGURATION_QUESTIONNAIRE_REQUIRED_BANNER,
		titleAndDescription = localizationStringsModule.GAME_CONFIGURATION_TITLE_AND_DESCRIPTION,
		unknownAudience = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_UNKNOWN
	}) else nil
	local var28 = if fFlagBuildLocalization then reactModule.useContext(localizationModule.LocalizationRoactContext) else nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if fFlagBuildLocalization then
		GAME_CONFIGURATION_ACCESS = var27.access
		GAME_CONFIGURATION_ACCESS_AND_SHARING = var27.accessAndSharing
		GAME_CONFIGURATION_ACCESS_BODY = var27.accessBody
		GAME_CONFIGURATION_ARCHIVE_GAME = var27.archiveGame
		GAME_CONFIGURATION_AUDIENCE = var27.audience
		GAME_CONFIGURATION_CONTENT_RATING = var27.contentRating
		GAME_CONFIGURATION_CREATOR_HUB = var27.creatorHub
		GAME_CONFIGURATION_CREATOR_HUB_DESCRIPTION = var27.creatorHubDescription
		GAME_CONFIGURATION_AUDIENCE_FRIENDS_ONLY = var27.friendsOnlyAudience
		GAME_CONFIGURATION_GAME_DETAILS = var27.gameDetails
		GAME_CONFIGURATION_GAME_DETAILS_BODY = var27.gameDetailsBody
		GAME_CONFIGURATION_ICON_AND_THUMBNAILS = var27.iconAndThumbnails
		GAME_CONFIGURATION_LOADING = var27.loading
		GAME_CONFIGURATION_AUDIENCE_PRIVATE = var27.privateAudience
		PRIVATE_INVITES_ROW_DESCRIPTION = var27.privateInvitesRowDescription
		PRIVATE_INVITES_ROW_LOAD_ERROR = var27.privateInvitesRowLoadError
		PRIVATE_INVITES_ROW_TITLE = var27.privateInvitesRowTitle
		PRIVATE_INVITES_ROW_TITLE_EMPTY = var27.privateInvitesRowTitleEmpty
		PRIVATE_INVITES_SHARE_LINK = var27.privateInvitesShareLink
		GAME_CONFIGURATION_AUDIENCE_PUBLIC = var27.publicAudience
		GAME_CONFIGURATION_QUESTIONNAIRE_REQUIRED_BANNER = var27.questionnaireRequiredBanner
		GAME_CONFIGURATION_TITLE_AND_DESCRIPTION = var27.titleAndDescription
		GAME_CONFIGURATION_AUDIENCE_UNKNOWN = var27.unknownAudience
	else
		GAME_CONFIGURATION_ACCESS = localizationStringsModule.GAME_CONFIGURATION_ACCESS
		GAME_CONFIGURATION_ACCESS_AND_SHARING = localizationStringsModule.GAME_CONFIGURATION_ACCESS_AND_SHARING
		GAME_CONFIGURATION_ACCESS_BODY = localizationStringsModule.GAME_CONFIGURATION_ACCESS_BODY
		GAME_CONFIGURATION_ARCHIVE_GAME = localizationStringsModule.GAME_CONFIGURATION_ARCHIVE_GAME
		GAME_CONFIGURATION_AUDIENCE = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE
		GAME_CONFIGURATION_CONTENT_RATING = localizationStringsModule.GAME_CONFIGURATION_CONTENT_RATING
		GAME_CONFIGURATION_CREATOR_HUB = localizationStringsModule.GAME_CONFIGURATION_CREATOR_HUB
		GAME_CONFIGURATION_CREATOR_HUB_DESCRIPTION = localizationStringsModule.GAME_CONFIGURATION_CREATOR_HUB_DESCRIPTION
		GAME_CONFIGURATION_AUDIENCE_FRIENDS_ONLY = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_FRIENDS_ONLY
		GAME_CONFIGURATION_GAME_DETAILS = localizationStringsModule.GAME_CONFIGURATION_GAME_DETAILS
		GAME_CONFIGURATION_GAME_DETAILS_BODY = localizationStringsModule.GAME_CONFIGURATION_GAME_DETAILS_BODY
		GAME_CONFIGURATION_ICON_AND_THUMBNAILS = localizationStringsModule.GAME_CONFIGURATION_ICON_AND_THUMBNAILS
		GAME_CONFIGURATION_LOADING = localizationStringsModule.GAME_CONFIGURATION_LOADING
		GAME_CONFIGURATION_AUDIENCE_PRIVATE = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PRIVATE
		PRIVATE_INVITES_ROW_DESCRIPTION = localizationStringsModule.PRIVATE_INVITES_ROW_DESCRIPTION
		PRIVATE_INVITES_ROW_LOAD_ERROR = localizationStringsModule.PRIVATE_INVITES_ROW_LOAD_ERROR
		PRIVATE_INVITES_ROW_TITLE = localizationStringsModule.PRIVATE_INVITES_ROW_TITLE
		PRIVATE_INVITES_ROW_TITLE_EMPTY = localizationStringsModule.PRIVATE_INVITES_ROW_TITLE_EMPTY
		PRIVATE_INVITES_SHARE_LINK = localizationStringsModule.PRIVATE_INVITES_SHARE_LINK
		GAME_CONFIGURATION_AUDIENCE_PUBLIC = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PUBLIC
		GAME_CONFIGURATION_QUESTIONNAIRE_REQUIRED_BANNER = localizationStringsModule.GAME_CONFIGURATION_QUESTIONNAIRE_REQUIRED_BANNER
		GAME_CONFIGURATION_TITLE_AND_DESCRIPTION = localizationStringsModule.GAME_CONFIGURATION_TITLE_AND_DESCRIPTION
		GAME_CONFIGURATION_AUDIENCE_UNKNOWN = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_UNKNOWN
	end
	local var29 = useOpenWebView()
	local var30 = useArchiveGameFlowModule()
	local var31 = if fFlagBuildExperiencePrivateInvitesModule then useExperienceShareFlowModule(p0.universeId, p0.placeId) else nil
	local var32 = if var31 ~= nil then nil else var31.onShare
	local var33 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: universeConfigurationModule (copy), p0 (ref)
		return universeConfigurationModule.getUniverseConfigurationStore().getAndFetchConfiguration(p0.universeId)
	end, { p0.universeId }).data)
	local var34 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: experienceGuidelinesModule (copy), p0 (ref)
		return experienceGuidelinesModule.getExperienceGuidelinesStore().getAndFetchDetailedGuidelines(p0.universeId)
	end, { p0.universeId }).data)
	local var35 = if var33 then gameConfigurationLabelsModule.getAudience(var33) else nil
	local _ = nil
	local var36 = if var33 == nil then GAME_CONFIGURATION_LOADING elseif fFlagBuildLocalization then if var35 == privacyType.Private then GAME_CONFIGURATION_AUDIENCE_PRIVATE elseif var35 == privacyType.Public then GAME_CONFIGURATION_AUDIENCE_PUBLIC elseif var35 == privacyType.FriendsOnly then GAME_CONFIGURATION_AUDIENCE_FRIENDS_ONLY else gameConfigurationLabelsModule.getAudienceText(var33) or GAME_CONFIGURATION_AUDIENCE_UNKNOWN else gameConfigurationLabelsModule.getAudienceText(var33) or gameConfigurationLabelsModule.UNKNOWN_AUDIENCE_TEXT
	local var37 = nil
	local var38 = nil
	local var39 = false
	
	if fFlagEnableProvisionalRatingModule then
		local var40 = signalsReactModule.useSignalState(reactModule.useMemo(function()
			-- upvalues: universeActivationModule (copy), p0 (ref)
			return universeActivationModule.getUniverseActivationStore().getAndFetchEligibility(p0.universeId)
		end, { p0.universeId }).data)
		local var41 = reactModule.useMemo(function()
			-- upvalues: contentMaturityUtilsModule (copy), p0 (ref)
			return contentMaturityUtilsModule.isSealBroken(p0.universeId)
		end, { var40, p0.universeId })
		local var42 = reactModule.useMemo(function()
			-- upvalues: contentMaturityUtilsModule (copy), p0 (ref)
			return contentMaturityUtilsModule.isContentUnrated(p0.universeId)
		end, { var40, p0.universeId })
		
		if fFlagBuildRehydrateOnPublishModule then
			var38 = if var40 then var40.provisionalRating else nil
			var39 = var42 and not var41
		end
		if var41 and var42 then
			var37 = GAME_CONFIGURATION_QUESTIONNAIRE_REQUIRED_BANNER
		end
	end
	local var43 = gameConfigurationLabelsModule.getContentMaturityText(var34, var38, var39) or GAME_CONFIGURATION_LOADING
	local var44 = reactModule.useCallback(function()
		-- upvalues: var29 (ref), gameConfigurationActionsModule (copy), p0 (ref), GAME_CONFIGURATION_CREATOR_HUB (write)
		var29(gameConfigurationActionsModule.getCreatorHubConfigureUrl(p0.universeId), GAME_CONFIGURATION_CREATOR_HUB)
	end, { GAME_CONFIGURATION_CREATOR_HUB, var29, p0.universeId })
	local var45 = reactModule.useCallback(function()
		-- upvalues: fFlagBuildRehydrateOnPublishModule (copy), var29 (ref), gameConfigurationActionsModule (copy), p0 (ref), GAME_CONFIGURATION_CREATOR_HUB (write), refreshPublishEligibilityModule (copy)
		if fFlagBuildRehydrateOnPublishModule then
			var29(gameConfigurationActionsModule.getExperienceQuestionnaireUrl(p0.universeId), GAME_CONFIGURATION_CREATOR_HUB, function()
				-- upvalues: refreshPublishEligibilityModule (copy), p0 (copy)
				refreshPublishEligibilityModule(p0.universeId)
			end)
			
			return
		end
		var29(gameConfigurationActionsModule.getExperienceQuestionnaireUrl(p0.universeId), GAME_CONFIGURATION_CREATOR_HUB)
	end, { GAME_CONFIGURATION_CREATOR_HUB, var29, p0.universeId })
	local var46 = reactModule.useMemo(function()
		-- upvalues: GAME_CONFIGURATION_ICON_AND_THUMBNAILS (write), captureServiceStartUploadCoreScriptBypass (copy), iconName (copy), p0 (ref), var44 (ref), GAME_CONFIGURATION_TITLE_AND_DESCRIPTION (write)
		return {
			{
				id = "icon-thumbnails",
				title = GAME_CONFIGURATION_ICON_AND_THUMBNAILS,
				trailingIcon = if captureServiceStartUploadCoreScriptBypass then nil else iconName.ArrowUpRightFromSquare,
				onActivated = if captureServiceStartUploadCoreScriptBypass then p0.onOpenMediaSelectionPage else var44
			},
			{
				id = "title-description",
				trailingIcon = nil,
				title = GAME_CONFIGURATION_TITLE_AND_DESCRIPTION,
				description = p0.experienceName,
				onActivated = p0.onOpenTitleDescriptionPage
			}
		}
	end, {
		var44, p0.experienceName, p0.onOpenMediaSelectionPage,
		p0.onOpenTitleDescriptionPage, GAME_CONFIGURATION_ICON_AND_THUMBNAILS,
		GAME_CONFIGURATION_TITLE_AND_DESCRIPTION
	})
	local onOpenPlaytestPicker = p0.onOpenPlaytestPicker
	local onOpenPlaytestManagement = p0.onOpenPlaytestManagement
	local var47 = fFlagBuildExperiencePrivateInvitesModule and (onOpenPlaytestPicker ~= nil and onOpenPlaytestManagement ~= nil)
	local var48 = reactModule.useMemo(function()
		-- upvalues: var47 (ref), getPrivatePlaytestersStore (copy), p0 (ref)
		return if var47 then getPrivatePlaytestersStore(false).getAndFetchInvitedPlayers(p0.universeId) else nil
	end, { var47, p0.universeId })
	local var49 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var48 (ref)
		return signalsModule.createComputed(function(p1)
			-- upvalues: var48 (copy)
			return if var48 == nil then 0 else #var48.players(p1)
		end)
	end, { var48 }))
	local var50 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var48 (ref)
		return signalsModule.createComputed(function(p2)
			-- upvalues: var48 (copy)
			return if var48 == nil then "NotReady" else var48.status(p2)
		end)
	end, { var48 }))
	local MAX_INVITES = getPrivatePlaytestersStore(false).MAX_INVITES
	local var51 = if var47 then if var50 == "Ready" then if var49 > 0 then {
		id = "playtest",
		trailingIcon = nil,
		title = PRIVATE_INVITES_ROW_TITLE,
		description = if var49 > 0 then if fFlagBuildLocalization then var28:Format(localizationStringsModule.PRIVATE_INVITES_SENT, { INVITED_COUNT = var49, MAX_INVITES = MAX_INVITES }) else localizationStringsModule.formatPrivateInvitesSent(var49, MAX_INVITES) else nil,
		onActivated = onOpenPlaytestManagement
	} else {
		id = "playtest",
		trailingIcon = nil,
		title = PRIVATE_INVITES_ROW_TITLE_EMPTY,
		description = PRIVATE_INVITES_ROW_DESCRIPTION,
		onActivated = onOpenPlaytestPicker
	} else {
		id = "playtest",
		trailingIcon = nil,
		onActivated = nil,
		title = PRIVATE_INVITES_ROW_TITLE,
		description = if var50 == "Failed" then PRIVATE_INVITES_ROW_LOAD_ERROR else GAME_CONFIGURATION_LOADING
	} else nil
	
	return reactModule.createElement(view, {
		tag = "col gap-xlarge size-full-0 auto-y padding-y-large",
		LayoutOrder = p0.layoutOrder,
		testId = testId
	}, {
		GameDetails = reactModule.createElement(gameConfigurationListModule, {
			layoutOrder = 1,
			title = GAME_CONFIGURATION_GAME_DETAILS,
			body = GAME_CONFIGURATION_GAME_DETAILS_BODY,
			rows = var46,
			testId = `{testId}-game-details`
		}),
		Access = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col gap-medium size-full-0 auto-y"
		}, {
			Configuration = reactModule.createElement(gameConfigurationListModule, {
				layoutOrder = 1,
				title = if var47 then GAME_CONFIGURATION_ACCESS_AND_SHARING else GAME_CONFIGURATION_ACCESS,
				body = GAME_CONFIGURATION_ACCESS_BODY,
				rows = reactModule.useMemo(function()
					-- upvalues: GAME_CONFIGURATION_AUDIENCE (write), var36 (write), p0 (ref), var51 (write), PRIVATE_INVITES_SHARE_LINK (write), var32 (ref), GAME_CONFIGURATION_CONTENT_RATING (write), var43 (ref), iconName (copy), var45 (ref)
					local list = {
						{
							id = "audience",
							trailingIcon = nil,
							title = GAME_CONFIGURATION_AUDIENCE,
							description = var36,
							onActivated = p0.onOpenAudiencePage
						}
					}
					
					if var51 ~= nil then
						table.insert(list, var51)
						table.insert(list, {
							id = "playtest-share-link",
							trailingIcon = nil,
							title = PRIVATE_INVITES_SHARE_LINK,
							onActivated = var32
						})
					end
					table.insert(list, {
						id = "content-rating",
						title = GAME_CONFIGURATION_CONTENT_RATING,
						description = var43,
						trailingIcon = iconName.ArrowUpRightFromSquare,
						onActivated = var45
					})
					
					return list
				end, {
					var36, var43, var45, var51, var32, p0.onOpenAudiencePage,
					GAME_CONFIGURATION_AUDIENCE, GAME_CONFIGURATION_CONTENT_RATING,
					PRIVATE_INVITES_SHARE_LINK
				}),
				testId = `{testId}-access`
			}),
			BuildMaturityBanner = if var37 ~= nil then nil else reactModule.createElement(buildMaturityBannerModule, { text = var37 })
		}),
		CreatorHub = reactModule.createElement(gameConfigurationListModule, {
			layoutOrder = 3,
			title = GAME_CONFIGURATION_CREATOR_HUB,
			rows = reactModule.useMemo(function()
				-- upvalues: GAME_CONFIGURATION_CREATOR_HUB (write), GAME_CONFIGURATION_CREATOR_HUB_DESCRIPTION (write), iconName (copy), var44 (ref)
				return {
					{
						id = "creator-hub",
						title = GAME_CONFIGURATION_CREATOR_HUB,
						description = GAME_CONFIGURATION_CREATOR_HUB_DESCRIPTION,
						trailingIcon = iconName.ArrowUpRightFromSquare,
						onActivated = var44
					}
				}
			end, {
				GAME_CONFIGURATION_CREATOR_HUB,
				GAME_CONFIGURATION_CREATOR_HUB_DESCRIPTION,
				var44
			}),
			testId = `{testId}-creator-hub`
		}),
		ArchiveGame = reactModule.createElement(view, {
			LayoutOrder = 4,
			tag = "row align-y-center size-full-0 auto-y padding-large stroke-standard stroke-default radius-large bg-surface-0",
			onActivated = reactModule.useCallback(function()
				-- upvalues: var30 (ref), p0 (ref)
				var30.requestArchive(p0.universeId)
			end, { var30.requestArchive, p0.universeId }),
			stateLayer = {},
			testId = `{testId}-archive-game`
		}, {
			Label = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "fill auto-y text-title-medium text-align-x-left content-default",
				Text = GAME_CONFIGURATION_ARCHIVE_GAME
			})
		}),
		ArchiveDialog = reactModule.createElement(archiveGameDialogModule, {
			isOpen = var30.isOpen,
			onArchive = var30.confirm,
			onCancel = var30.cancel
		}),
		ShareOverlays = if fFlagBuildExperiencePrivateInvitesModule and var31 ~= nil then reactModule.createElement(experienceShareOverlaysModule, {
			activeDialog = var31.activeDialog,
			hasShareError = var31.hasShareError,
			onCancel = var31.onCancelDialog,
			onConfirmFriends = var31.onConfirmFriends,
			onConfirmPlaytesters = var31.onConfirmPlaytesters
		}) else nil
	})
end