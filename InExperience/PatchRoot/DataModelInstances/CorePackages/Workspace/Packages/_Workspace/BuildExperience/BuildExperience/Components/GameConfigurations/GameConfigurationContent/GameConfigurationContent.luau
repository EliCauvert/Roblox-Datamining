local captureService = game:GetService("CaptureService")
local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local useOpenWebView = require(parent.WebViewUtils).useOpenWebView
local useLocalization = require(parent.Localization).Hooks.useLocalization
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

return function(p0) --[[ line: 67 | named "GameConfigurationContent" ]]
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), useOpenWebView (ref), useArchiveGameFlowModule (ref), fFlagBuildExperiencePrivateInvitesModule (ref), useExperienceShareFlowModule (ref), reactModule (ref), universeConfigurationModule (ref), experienceGuidelinesModule (ref), signalsReactModule (ref), gameConfigurationLabelsModule (ref), privacyType (ref), fFlagEnableProvisionalRatingModule (ref), universeActivationModule (ref), contentMaturityUtilsModule (ref), fFlagBuildRehydrateOnPublishModule (ref), gameConfigurationActionsModule (ref), refreshPublishEligibilityModule (ref), captureServiceStartUploadCoreScriptBypass (ref), iconName (ref), getPrivatePlaytestersStore (ref), signalsModule (ref), view (ref), gameConfigurationListModule (ref), buildMaturityBannerModule (ref), text (ref), archiveGameDialogModule (ref), experienceShareOverlaysModule (ref)
	local GAME_CONFIGURATION_ACCESS, GAME_CONFIGURATION_ACCESS_AND_SHARING, GAME_CONFIGURATION_ACCESS_BODY, GAME_CONFIGURATION_ARCHIVE_GAME, GAME_CONFIGURATION_AUDIENCE, GAME_CONFIGURATION_CONTENT_RATING, GAME_CONFIGURATION_CREATOR_HUB, GAME_CONFIGURATION_CREATOR_HUB_DESCRIPTION, GAME_CONFIGURATION_AUDIENCE_FRIENDS_ONLY, GAME_CONFIGURATION_GAME_DETAILS, GAME_CONFIGURATION_GAME_DETAILS_BODY, GAME_CONFIGURATION_ICON_AND_THUMBNAILS, GAME_CONFIGURATION_LOADING, GAME_CONFIGURATION_AUDIENCE_PRIVATE, PRIVATE_INVITES_ROW_DESCRIPTION, PRIVATE_INVITES_ROW_LOAD_ERROR, PRIVATE_INVITES_ROW_TITLE, PRIVATE_INVITES_ROW_TITLE_EMPTY, PRIVATE_INVITES_SHARE_LINK, GAME_CONFIGURATION_AUDIENCE_PUBLIC, GAME_CONFIGURATION_QUESTIONNAIRE_REQUIRED_BANNER, GAME_CONFIGURATION_TITLE_AND_DESCRIPTION, GAME_CONFIGURATION_AUDIENCE_UNKNOWN
	local testId = p0.testId or "game-configuration-content"
	local var26 = if fFlagBuildLocalization then useLocalization({
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
		GAME_CONFIGURATION_ACCESS = var26.access
		GAME_CONFIGURATION_ACCESS_AND_SHARING = var26.accessAndSharing
		GAME_CONFIGURATION_ACCESS_BODY = var26.accessBody
		GAME_CONFIGURATION_ARCHIVE_GAME = var26.archiveGame
		GAME_CONFIGURATION_AUDIENCE = var26.audience
		GAME_CONFIGURATION_CONTENT_RATING = var26.contentRating
		GAME_CONFIGURATION_CREATOR_HUB = var26.creatorHub
		GAME_CONFIGURATION_CREATOR_HUB_DESCRIPTION = var26.creatorHubDescription
		GAME_CONFIGURATION_AUDIENCE_FRIENDS_ONLY = var26.friendsOnlyAudience
		GAME_CONFIGURATION_GAME_DETAILS = var26.gameDetails
		GAME_CONFIGURATION_GAME_DETAILS_BODY = var26.gameDetailsBody
		GAME_CONFIGURATION_ICON_AND_THUMBNAILS = var26.iconAndThumbnails
		GAME_CONFIGURATION_LOADING = var26.loading
		GAME_CONFIGURATION_AUDIENCE_PRIVATE = var26.privateAudience
		PRIVATE_INVITES_ROW_DESCRIPTION = var26.privateInvitesRowDescription
		PRIVATE_INVITES_ROW_LOAD_ERROR = var26.privateInvitesRowLoadError
		PRIVATE_INVITES_ROW_TITLE = var26.privateInvitesRowTitle
		PRIVATE_INVITES_ROW_TITLE_EMPTY = var26.privateInvitesRowTitleEmpty
		PRIVATE_INVITES_SHARE_LINK = var26.privateInvitesShareLink
		GAME_CONFIGURATION_AUDIENCE_PUBLIC = var26.publicAudience
		GAME_CONFIGURATION_QUESTIONNAIRE_REQUIRED_BANNER = var26.questionnaireRequiredBanner
		GAME_CONFIGURATION_TITLE_AND_DESCRIPTION = var26.titleAndDescription
		GAME_CONFIGURATION_AUDIENCE_UNKNOWN = var26.unknownAudience
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
	local var27 = useOpenWebView()
	local var28 = useArchiveGameFlowModule()
	local var29 = if fFlagBuildExperiencePrivateInvitesModule then useExperienceShareFlowModule(p0.universeId, p0.placeId) else nil
	local var30 = if var29 ~= nil then nil else var29.onShare
	local var31 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 178 ]]
		-- upvalues: universeConfigurationModule (copy), p0 (ref)
		return universeConfigurationModule.getUniverseConfigurationStore().getAndFetchConfiguration(p0.universeId)
	end, { p0.universeId }).data)
	local var32 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 181 ]]
		-- upvalues: experienceGuidelinesModule (copy), p0 (ref)
		return experienceGuidelinesModule.getExperienceGuidelinesStore().getAndFetchDetailedGuidelines(p0.universeId)
	end, { p0.universeId }).data)
	local var33 = if var31 then gameConfigurationLabelsModule.getAudience(var31) else nil
	local _ = nil
	local var34 = if var31 == nil then GAME_CONFIGURATION_LOADING elseif fFlagBuildLocalization then if var33 == privacyType.Private then GAME_CONFIGURATION_AUDIENCE_PRIVATE elseif var33 == privacyType.Public then GAME_CONFIGURATION_AUDIENCE_PUBLIC elseif var33 == privacyType.FriendsOnly then GAME_CONFIGURATION_AUDIENCE_FRIENDS_ONLY else gameConfigurationLabelsModule.getAudienceText(var31) or GAME_CONFIGURATION_AUDIENCE_UNKNOWN else gameConfigurationLabelsModule.getAudienceText(var31) or gameConfigurationLabelsModule.UNKNOWN_AUDIENCE_TEXT
	local var35 = nil
	local var36 = nil
	local var37 = false
	
	if fFlagEnableProvisionalRatingModule then
		local var38 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 209 ]]
			-- upvalues: universeActivationModule (copy), p0 (ref)
			return universeActivationModule.getUniverseActivationStore().getAndFetchEligibility(p0.universeId)
		end, { p0.universeId }).data)
		local var39 = reactModule.useMemo(function() --[[ line: 213 ]]
			-- upvalues: contentMaturityUtilsModule (copy), p0 (ref)
			return contentMaturityUtilsModule.isSealBroken(p0.universeId)
		end, { var38, p0.universeId })
		local var40 = reactModule.useMemo(function() --[[ line: 216 ]]
			-- upvalues: contentMaturityUtilsModule (copy), p0 (ref)
			return contentMaturityUtilsModule.isContentUnrated(p0.universeId)
		end, { var38, p0.universeId })
		
		if fFlagBuildRehydrateOnPublishModule then
			var36 = if var38 then var38.provisionalRating else nil
			var37 = var40 and not var39
		end
		if var39 and var40 then
			var35 = GAME_CONFIGURATION_QUESTIONNAIRE_REQUIRED_BANNER
		end
	end
	local var41 = gameConfigurationLabelsModule.getContentMaturityText(var32, var36, var37) or GAME_CONFIGURATION_LOADING
	local var42 = reactModule.useCallback(function() --[[ line: 234 ]]
		-- upvalues: var27 (ref), gameConfigurationActionsModule (copy), p0 (ref), GAME_CONFIGURATION_CREATOR_HUB (write)
		var27(gameConfigurationActionsModule.getCreatorHubConfigureUrl(p0.universeId), GAME_CONFIGURATION_CREATOR_HUB)
	end, { GAME_CONFIGURATION_CREATOR_HUB, var27, p0.universeId })
	local var43 = reactModule.useCallback(function() --[[ line: 238 ]]
		-- upvalues: fFlagBuildRehydrateOnPublishModule (copy), var27 (ref), gameConfigurationActionsModule (copy), p0 (ref), GAME_CONFIGURATION_CREATOR_HUB (write), refreshPublishEligibilityModule (copy)
		if fFlagBuildRehydrateOnPublishModule then
			var27(gameConfigurationActionsModule.getExperienceQuestionnaireUrl(p0.universeId), GAME_CONFIGURATION_CREATOR_HUB, function() --[[ line: 240 ]]
				-- upvalues: refreshPublishEligibilityModule (copy), p0 (copy)
				refreshPublishEligibilityModule(p0.universeId)
			end)
			
			return
		end
		var27(gameConfigurationActionsModule.getExperienceQuestionnaireUrl(p0.universeId), GAME_CONFIGURATION_CREATOR_HUB)
	end, { GAME_CONFIGURATION_CREATOR_HUB, var27, p0.universeId })
	local var44 = reactModule.useMemo(function() --[[ line: 249 ]]
		-- upvalues: GAME_CONFIGURATION_ICON_AND_THUMBNAILS (write), captureServiceStartUploadCoreScriptBypass (copy), iconName (copy), p0 (ref), var42 (ref), GAME_CONFIGURATION_TITLE_AND_DESCRIPTION (write)
		return {
			{
				id = "icon-thumbnails",
				title = GAME_CONFIGURATION_ICON_AND_THUMBNAILS,
				trailingIcon = if captureServiceStartUploadCoreScriptBypass then nil else iconName.ArrowUpRightFromSquare,
				onActivated = if captureServiceStartUploadCoreScriptBypass then p0.onOpenMediaSelectionPage else var42
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
		var42, p0.experienceName, p0.onOpenMediaSelectionPage,
		p0.onOpenTitleDescriptionPage, GAME_CONFIGURATION_ICON_AND_THUMBNAILS,
		GAME_CONFIGURATION_TITLE_AND_DESCRIPTION
	})
	local onOpenPlaytestPicker = p0.onOpenPlaytestPicker
	local onOpenPlaytestManagement = p0.onOpenPlaytestManagement
	local var45 = fFlagBuildExperiencePrivateInvitesModule and (onOpenPlaytestPicker ~= nil and onOpenPlaytestManagement ~= nil)
	local var46 = reactModule.useMemo(function() --[[ line: 284 ]]
		-- upvalues: var45 (ref), getPrivatePlaytestersStore (copy), p0 (ref)
		return if var45 then getPrivatePlaytestersStore(false).getAndFetchInvitedPlayers(p0.universeId) else nil
	end, { var45, p0.universeId })
	local var47 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 291 ]]
		-- upvalues: signalsModule (copy), var46 (ref)
		return signalsModule.createComputed(function(p1) --[[ line: 292 ]]
			-- upvalues: var46 (copy)
			return if var46 == nil then 0 else #var46.players(p1)
		end)
	end, { var46 }))
	local var48 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 298 ]]
		-- upvalues: signalsModule (copy), var46 (ref)
		return signalsModule.createComputed(function(p2) --[[ line: 299 ]]
			-- upvalues: var46 (copy)
			return if var46 == nil then "NotReady" else var46.status(p2)
		end)
	end, { var46 }))
	local var49 = if var45 then if var48 == "Ready" then if var47 > 0 then {
		id = "playtest",
		trailingIcon = nil,
		title = PRIVATE_INVITES_ROW_TITLE,
		description = localizationStringsModule.formatPrivateInvitesSent(var47, getPrivatePlaytestersStore(false).MAX_INVITES),
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
		description = if var48 == "Failed" then PRIVATE_INVITES_ROW_LOAD_ERROR else GAME_CONFIGURATION_LOADING
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
			rows = var44,
			testId = `{testId}-game-details`
		}),
		Access = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col gap-medium size-full-0 auto-y"
		}, {
			Configuration = reactModule.createElement(gameConfigurationListModule, {
				layoutOrder = 1,
				title = if var45 then GAME_CONFIGURATION_ACCESS_AND_SHARING else GAME_CONFIGURATION_ACCESS,
				body = GAME_CONFIGURATION_ACCESS_BODY,
				rows = reactModule.useMemo(function() --[[ line: 342 ]]
					-- upvalues: GAME_CONFIGURATION_AUDIENCE (write), var34 (write), p0 (ref), var49 (write), PRIVATE_INVITES_SHARE_LINK (write), var30 (ref), GAME_CONFIGURATION_CONTENT_RATING (write), var41 (ref), iconName (copy), var43 (ref)
					local list = {
						{
							id = "audience",
							trailingIcon = nil,
							title = GAME_CONFIGURATION_AUDIENCE,
							description = var34,
							onActivated = p0.onOpenAudiencePage
						}
					}
					
					if var49 ~= nil then
						table.insert(list, var49)
						table.insert(list, {
							id = "playtest-share-link",
							trailingIcon = nil,
							title = PRIVATE_INVITES_SHARE_LINK,
							onActivated = var30
						})
					end
					table.insert(list, {
						id = "content-rating",
						title = GAME_CONFIGURATION_CONTENT_RATING,
						description = var41,
						trailingIcon = iconName.ArrowUpRightFromSquare,
						onActivated = var43
					})
					
					return list
				end, {
					var34, var41, var43, var49, var30, p0.onOpenAudiencePage,
					GAME_CONFIGURATION_AUDIENCE, GAME_CONFIGURATION_CONTENT_RATING,
					PRIVATE_INVITES_SHARE_LINK
				}),
				testId = `{testId}-access`
			}),
			BuildMaturityBanner = if var35 ~= nil then nil else reactModule.createElement(buildMaturityBannerModule, { text = var35 })
		}),
		CreatorHub = reactModule.createElement(gameConfigurationListModule, {
			layoutOrder = 3,
			title = GAME_CONFIGURATION_CREATOR_HUB,
			rows = reactModule.useMemo(function() --[[ line: 386 ]]
				-- upvalues: GAME_CONFIGURATION_CREATOR_HUB (write), GAME_CONFIGURATION_CREATOR_HUB_DESCRIPTION (write), iconName (copy), var42 (ref)
				return {
					{
						id = "creator-hub",
						title = GAME_CONFIGURATION_CREATOR_HUB,
						description = GAME_CONFIGURATION_CREATOR_HUB_DESCRIPTION,
						trailingIcon = iconName.ArrowUpRightFromSquare,
						onActivated = var42
					}
				}
			end, {
				GAME_CONFIGURATION_CREATOR_HUB,
				GAME_CONFIGURATION_CREATOR_HUB_DESCRIPTION,
				var42
			}),
			testId = `{testId}-creator-hub`
		}),
		ArchiveGame = reactModule.createElement(view, {
			LayoutOrder = 4,
			tag = "row align-y-center size-full-0 auto-y padding-large stroke-standard stroke-default radius-large bg-surface-0",
			onActivated = reactModule.useCallback(function() --[[ line: 398 ]]
				-- upvalues: var28 (ref), p0 (ref)
				var28.requestArchive(p0.universeId)
			end, { var28.requestArchive, p0.universeId }),
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
			isOpen = var28.isOpen,
			onArchive = var28.confirm,
			onCancel = var28.cancel
		}),
		ShareOverlays = if fFlagBuildExperiencePrivateInvitesModule and var29 ~= nil then reactModule.createElement(experienceShareOverlaysModule, {
			activeDialog = var29.activeDialog,
			hasShareError = var29.hasShareError,
			onCancel = var29.onCancelDialog,
			onConfirmFriends = var29.onConfirmFriends,
			onConfirmPlaytesters = var29.onConfirmPlaytesters
		}) else nil
	})
end