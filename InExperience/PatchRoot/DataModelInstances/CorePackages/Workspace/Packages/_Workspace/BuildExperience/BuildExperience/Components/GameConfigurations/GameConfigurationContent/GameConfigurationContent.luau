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

return function(p0) --[[ line: 66 | named "GameConfigurationContent" ]]
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), useOpenWebView (ref), useArchiveGameFlowModule (ref), fFlagBuildExperiencePrivateInvitesModule (ref), useExperienceShareFlowModule (ref), reactModule (ref), universeConfigurationModule (ref), experienceGuidelinesModule (ref), signalsReactModule (ref), gameConfigurationLabelsModule (ref), fFlagEnableProvisionalRatingModule (ref), universeActivationModule (ref), contentMaturityUtilsModule (ref), fFlagBuildRehydrateOnPublishModule (ref), gameConfigurationActionsModule (ref), refreshPublishEligibilityModule (ref), captureServiceStartUploadCoreScriptBypass (ref), iconName (ref), getPrivatePlaytestersStore (ref), signalsModule (ref), view (ref), gameConfigurationListModule (ref), buildMaturityBannerModule (ref), text (ref), archiveGameDialogModule (ref), experienceShareOverlaysModule (ref)
	local GAME_CONFIGURATION_ACCESS, GAME_CONFIGURATION_ACCESS_AND_SHARING, GAME_CONFIGURATION_ACCESS_BODY, GAME_CONFIGURATION_ARCHIVE_GAME, GAME_CONFIGURATION_AUDIENCE, GAME_CONFIGURATION_CONTENT_RATING, GAME_CONFIGURATION_CREATOR_HUB, GAME_CONFIGURATION_CREATOR_HUB_DESCRIPTION, GAME_CONFIGURATION_GAME_DETAILS, GAME_CONFIGURATION_GAME_DETAILS_BODY, GAME_CONFIGURATION_ICON_AND_THUMBNAILS, GAME_CONFIGURATION_LOADING, PRIVATE_INVITES_ROW_DESCRIPTION, PRIVATE_INVITES_ROW_LOAD_ERROR, PRIVATE_INVITES_ROW_TITLE, PRIVATE_INVITES_ROW_TITLE_EMPTY, PRIVATE_INVITES_SHARE_LINK, GAME_CONFIGURATION_QUESTIONNAIRE_REQUIRED_BANNER, GAME_CONFIGURATION_TITLE_AND_DESCRIPTION
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
		gameDetails = localizationStringsModule.GAME_CONFIGURATION_GAME_DETAILS,
		gameDetailsBody = localizationStringsModule.GAME_CONFIGURATION_GAME_DETAILS_BODY,
		iconAndThumbnails = localizationStringsModule.GAME_CONFIGURATION_ICON_AND_THUMBNAILS,
		loading = localizationStringsModule.GAME_CONFIGURATION_LOADING,
		privateInvitesRowDescription = localizationStringsModule.PRIVATE_INVITES_ROW_DESCRIPTION,
		privateInvitesRowLoadError = localizationStringsModule.PRIVATE_INVITES_ROW_LOAD_ERROR,
		privateInvitesRowTitle = localizationStringsModule.PRIVATE_INVITES_ROW_TITLE,
		privateInvitesRowTitleEmpty = localizationStringsModule.PRIVATE_INVITES_ROW_TITLE_EMPTY,
		privateInvitesShareLink = localizationStringsModule.PRIVATE_INVITES_SHARE_LINK,
		questionnaireRequiredBanner = localizationStringsModule.GAME_CONFIGURATION_QUESTIONNAIRE_REQUIRED_BANNER,
		titleAndDescription = localizationStringsModule.GAME_CONFIGURATION_TITLE_AND_DESCRIPTION
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
	
	if fFlagBuildLocalization then
		GAME_CONFIGURATION_ACCESS = var26.access
		GAME_CONFIGURATION_ACCESS_AND_SHARING = var26.accessAndSharing
		GAME_CONFIGURATION_ACCESS_BODY = var26.accessBody
		GAME_CONFIGURATION_ARCHIVE_GAME = var26.archiveGame
		GAME_CONFIGURATION_AUDIENCE = var26.audience
		GAME_CONFIGURATION_CONTENT_RATING = var26.contentRating
		GAME_CONFIGURATION_CREATOR_HUB = var26.creatorHub
		GAME_CONFIGURATION_CREATOR_HUB_DESCRIPTION = var26.creatorHubDescription
		GAME_CONFIGURATION_GAME_DETAILS = var26.gameDetails
		GAME_CONFIGURATION_GAME_DETAILS_BODY = var26.gameDetailsBody
		GAME_CONFIGURATION_ICON_AND_THUMBNAILS = var26.iconAndThumbnails
		GAME_CONFIGURATION_LOADING = var26.loading
		PRIVATE_INVITES_ROW_DESCRIPTION = var26.privateInvitesRowDescription
		PRIVATE_INVITES_ROW_LOAD_ERROR = var26.privateInvitesRowLoadError
		PRIVATE_INVITES_ROW_TITLE = var26.privateInvitesRowTitle
		PRIVATE_INVITES_ROW_TITLE_EMPTY = var26.privateInvitesRowTitleEmpty
		PRIVATE_INVITES_SHARE_LINK = var26.privateInvitesShareLink
		GAME_CONFIGURATION_QUESTIONNAIRE_REQUIRED_BANNER = var26.questionnaireRequiredBanner
		GAME_CONFIGURATION_TITLE_AND_DESCRIPTION = var26.titleAndDescription
	else
		GAME_CONFIGURATION_ACCESS = localizationStringsModule.GAME_CONFIGURATION_ACCESS
		GAME_CONFIGURATION_ACCESS_AND_SHARING = localizationStringsModule.GAME_CONFIGURATION_ACCESS_AND_SHARING
		GAME_CONFIGURATION_ACCESS_BODY = localizationStringsModule.GAME_CONFIGURATION_ACCESS_BODY
		GAME_CONFIGURATION_ARCHIVE_GAME = localizationStringsModule.GAME_CONFIGURATION_ARCHIVE_GAME
		GAME_CONFIGURATION_AUDIENCE = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE
		GAME_CONFIGURATION_CONTENT_RATING = localizationStringsModule.GAME_CONFIGURATION_CONTENT_RATING
		GAME_CONFIGURATION_CREATOR_HUB = localizationStringsModule.GAME_CONFIGURATION_CREATOR_HUB
		GAME_CONFIGURATION_CREATOR_HUB_DESCRIPTION = localizationStringsModule.GAME_CONFIGURATION_CREATOR_HUB_DESCRIPTION
		GAME_CONFIGURATION_GAME_DETAILS = localizationStringsModule.GAME_CONFIGURATION_GAME_DETAILS
		GAME_CONFIGURATION_GAME_DETAILS_BODY = localizationStringsModule.GAME_CONFIGURATION_GAME_DETAILS_BODY
		GAME_CONFIGURATION_ICON_AND_THUMBNAILS = localizationStringsModule.GAME_CONFIGURATION_ICON_AND_THUMBNAILS
		GAME_CONFIGURATION_LOADING = localizationStringsModule.GAME_CONFIGURATION_LOADING
		PRIVATE_INVITES_ROW_DESCRIPTION = localizationStringsModule.PRIVATE_INVITES_ROW_DESCRIPTION
		PRIVATE_INVITES_ROW_LOAD_ERROR = localizationStringsModule.PRIVATE_INVITES_ROW_LOAD_ERROR
		PRIVATE_INVITES_ROW_TITLE = localizationStringsModule.PRIVATE_INVITES_ROW_TITLE
		PRIVATE_INVITES_ROW_TITLE_EMPTY = localizationStringsModule.PRIVATE_INVITES_ROW_TITLE_EMPTY
		PRIVATE_INVITES_SHARE_LINK = localizationStringsModule.PRIVATE_INVITES_SHARE_LINK
		GAME_CONFIGURATION_QUESTIONNAIRE_REQUIRED_BANNER = localizationStringsModule.GAME_CONFIGURATION_QUESTIONNAIRE_REQUIRED_BANNER
		GAME_CONFIGURATION_TITLE_AND_DESCRIPTION = localizationStringsModule.GAME_CONFIGURATION_TITLE_AND_DESCRIPTION
	end
	local var27 = useOpenWebView()
	local var28 = useArchiveGameFlowModule()
	local var29 = if fFlagBuildExperiencePrivateInvitesModule then useExperienceShareFlowModule(p0.universeId, p0.placeId) else nil
	local var30 = if var29 ~= nil then nil else var29.onShare
	local var31 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 161 ]]
		-- upvalues: universeConfigurationModule (copy), p0 (ref)
		return universeConfigurationModule.getUniverseConfigurationStore().getAndFetchConfiguration(p0.universeId)
	end, { p0.universeId }).data)
	local var32 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 164 ]]
		-- upvalues: experienceGuidelinesModule (copy), p0 (ref)
		return experienceGuidelinesModule.getExperienceGuidelinesStore().getAndFetchDetailedGuidelines(p0.universeId)
	end, { p0.universeId }).data)
	local var33 = if var31 then gameConfigurationLabelsModule.getAudienceText(var31) or gameConfigurationLabelsModule.UNKNOWN_AUDIENCE_TEXT else GAME_CONFIGURATION_LOADING
	local var34 = nil
	local var35 = nil
	local var36 = false
	
	if fFlagEnableProvisionalRatingModule then
		local var37 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 177 ]]
			-- upvalues: universeActivationModule (copy), p0 (ref)
			return universeActivationModule.getUniverseActivationStore().getAndFetchEligibility(p0.universeId)
		end, { p0.universeId }).data)
		local var38 = reactModule.useMemo(function() --[[ line: 181 ]]
			-- upvalues: contentMaturityUtilsModule (copy), p0 (ref)
			return contentMaturityUtilsModule.isSealBroken(p0.universeId)
		end, { var37, p0.universeId })
		local var39 = reactModule.useMemo(function() --[[ line: 184 ]]
			-- upvalues: contentMaturityUtilsModule (copy), p0 (ref)
			return contentMaturityUtilsModule.isContentUnrated(p0.universeId)
		end, { var37, p0.universeId })
		
		if fFlagBuildRehydrateOnPublishModule then
			var35 = if var37 then var37.provisionalRating else nil
			var36 = var39 and not var38
		end
		if var38 and var39 then
			var34 = GAME_CONFIGURATION_QUESTIONNAIRE_REQUIRED_BANNER
		end
	end
	local var40 = gameConfigurationLabelsModule.getContentMaturityText(var32, var35, var36) or GAME_CONFIGURATION_LOADING
	local var41 = reactModule.useCallback(function() --[[ line: 202 ]]
		-- upvalues: var27 (ref), gameConfigurationActionsModule (copy), p0 (ref), GAME_CONFIGURATION_CREATOR_HUB (write)
		var27(gameConfigurationActionsModule.getCreatorHubConfigureUrl(p0.universeId), GAME_CONFIGURATION_CREATOR_HUB)
	end, { GAME_CONFIGURATION_CREATOR_HUB, var27, p0.universeId })
	local var42 = reactModule.useCallback(function() --[[ line: 206 ]]
		-- upvalues: fFlagBuildRehydrateOnPublishModule (copy), var27 (ref), gameConfigurationActionsModule (copy), p0 (ref), GAME_CONFIGURATION_CREATOR_HUB (write), refreshPublishEligibilityModule (copy)
		if fFlagBuildRehydrateOnPublishModule then
			var27(gameConfigurationActionsModule.getExperienceQuestionnaireUrl(p0.universeId), GAME_CONFIGURATION_CREATOR_HUB, function() --[[ line: 208 ]]
				-- upvalues: refreshPublishEligibilityModule (copy), p0 (copy)
				refreshPublishEligibilityModule(p0.universeId)
			end)
			
			return
		end
		var27(gameConfigurationActionsModule.getExperienceQuestionnaireUrl(p0.universeId), GAME_CONFIGURATION_CREATOR_HUB)
	end, { GAME_CONFIGURATION_CREATOR_HUB, var27, p0.universeId })
	local var43 = reactModule.useMemo(function() --[[ line: 217 ]]
		-- upvalues: GAME_CONFIGURATION_ICON_AND_THUMBNAILS (write), captureServiceStartUploadCoreScriptBypass (copy), iconName (copy), p0 (ref), var41 (ref), GAME_CONFIGURATION_TITLE_AND_DESCRIPTION (write)
		return {
			{
				id = "icon-thumbnails",
				title = GAME_CONFIGURATION_ICON_AND_THUMBNAILS,
				trailingIcon = if captureServiceStartUploadCoreScriptBypass then nil else iconName.ArrowUpRightFromSquare,
				onActivated = if captureServiceStartUploadCoreScriptBypass then p0.onOpenMediaSelectionPage else var41
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
		var41, p0.experienceName, p0.onOpenMediaSelectionPage,
		p0.onOpenTitleDescriptionPage, GAME_CONFIGURATION_ICON_AND_THUMBNAILS,
		GAME_CONFIGURATION_TITLE_AND_DESCRIPTION
	})
	local onOpenPlaytestPicker = p0.onOpenPlaytestPicker
	local onOpenPlaytestManagement = p0.onOpenPlaytestManagement
	local var44 = fFlagBuildExperiencePrivateInvitesModule and (onOpenPlaytestPicker ~= nil and onOpenPlaytestManagement ~= nil)
	local var45 = reactModule.useMemo(function() --[[ line: 252 ]]
		-- upvalues: var44 (ref), getPrivatePlaytestersStore (copy), p0 (ref)
		return if var44 then getPrivatePlaytestersStore(false).getAndFetchInvitedPlayers(p0.universeId) else nil
	end, { var44, p0.universeId })
	local var46 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 259 ]]
		-- upvalues: signalsModule (copy), var45 (ref)
		return signalsModule.createComputed(function(p1) --[[ line: 260 ]]
			-- upvalues: var45 (copy)
			return if var45 == nil then 0 else #var45.players(p1)
		end)
	end, { var45 }))
	local var47 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 266 ]]
		-- upvalues: signalsModule (copy), var45 (ref)
		return signalsModule.createComputed(function(p2) --[[ line: 267 ]]
			-- upvalues: var45 (copy)
			return if var45 == nil then "NotReady" else var45.status(p2)
		end)
	end, { var45 }))
	local var48 = if var44 then if var47 == "Ready" then if var46 > 0 then {
		id = "playtest",
		trailingIcon = nil,
		title = PRIVATE_INVITES_ROW_TITLE,
		description = localizationStringsModule.formatPrivateInvitesSent(var46, getPrivatePlaytestersStore(false).MAX_INVITES),
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
		description = if var47 == "Failed" then PRIVATE_INVITES_ROW_LOAD_ERROR else GAME_CONFIGURATION_LOADING
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
			rows = var43,
			testId = `{testId}-game-details`
		}),
		Access = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col gap-medium size-full-0 auto-y"
		}, {
			Configuration = reactModule.createElement(gameConfigurationListModule, {
				layoutOrder = 1,
				title = if var44 then GAME_CONFIGURATION_ACCESS_AND_SHARING else GAME_CONFIGURATION_ACCESS,
				body = GAME_CONFIGURATION_ACCESS_BODY,
				rows = reactModule.useMemo(function() --[[ line: 310 ]]
					-- upvalues: GAME_CONFIGURATION_AUDIENCE (write), var33 (ref), p0 (ref), var48 (write), PRIVATE_INVITES_SHARE_LINK (write), var30 (ref), GAME_CONFIGURATION_CONTENT_RATING (write), var40 (ref), iconName (copy), var42 (ref)
					local list = {
						{
							id = "audience",
							trailingIcon = nil,
							title = GAME_CONFIGURATION_AUDIENCE,
							description = var33,
							onActivated = p0.onOpenAudiencePage
						}
					}
					
					if var48 ~= nil then
						table.insert(list, var48)
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
						description = var40,
						trailingIcon = iconName.ArrowUpRightFromSquare,
						onActivated = var42
					})
					
					return list
				end, {
					var33, var40, var42, var48, var30, p0.onOpenAudiencePage,
					GAME_CONFIGURATION_AUDIENCE, GAME_CONFIGURATION_CONTENT_RATING,
					PRIVATE_INVITES_SHARE_LINK
				}),
				testId = `{testId}-access`
			}),
			BuildMaturityBanner = if var34 ~= nil then nil else reactModule.createElement(buildMaturityBannerModule, { text = var34 })
		}),
		CreatorHub = reactModule.createElement(gameConfigurationListModule, {
			layoutOrder = 3,
			title = GAME_CONFIGURATION_CREATOR_HUB,
			rows = reactModule.useMemo(function() --[[ line: 354 ]]
				-- upvalues: GAME_CONFIGURATION_CREATOR_HUB (write), GAME_CONFIGURATION_CREATOR_HUB_DESCRIPTION (write), iconName (copy), var41 (ref)
				return {
					{
						id = "creator-hub",
						title = GAME_CONFIGURATION_CREATOR_HUB,
						description = GAME_CONFIGURATION_CREATOR_HUB_DESCRIPTION,
						trailingIcon = iconName.ArrowUpRightFromSquare,
						onActivated = var41
					}
				}
			end, {
				GAME_CONFIGURATION_CREATOR_HUB,
				GAME_CONFIGURATION_CREATOR_HUB_DESCRIPTION,
				var41
			}),
			testId = `{testId}-creator-hub`
		}),
		ArchiveGame = reactModule.createElement(view, {
			LayoutOrder = 4,
			tag = "row align-y-center size-full-0 auto-y padding-large stroke-standard stroke-default radius-large bg-surface-0",
			onActivated = reactModule.useCallback(function() --[[ line: 366 ]]
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