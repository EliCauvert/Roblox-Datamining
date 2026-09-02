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
local fFlagBuildRehydrateOnPublishModule = require(buildExperience.Flags.FFlagBuildRehydrateOnPublish)
local privacyType = universeConfigurationModule.PrivacyType

return function(p1)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), localizationModule (ref), useOpenWebView (ref), useArchiveGameFlowModule (ref), fFlagBuildExperiencePrivateInvitesModule (ref), useExperienceShareFlowModule (ref), universeConfigurationModule (ref), experienceGuidelinesModule (ref), signalsReactModule (ref), gameConfigurationLabelsModule (ref), privacyType (ref), universeActivationModule (ref), contentMaturityUtilsModule (ref), fFlagBuildRehydrateOnPublishModule (ref), gameConfigurationActionsModule (ref), refreshPublishEligibilityModule (ref), captureServiceStartUploadCoreScriptBypass (ref), iconName (ref), getPrivatePlaytestersStore (ref), signalsModule (ref), view (ref), gameConfigurationListModule (ref), buildMaturityBannerModule (ref), text (ref), archiveGameDialogModule (ref), experienceShareOverlaysModule (ref)
	local GAME_CONFIGURATION_ACCESS, GAME_CONFIGURATION_ACCESS_AND_SHARING, GAME_CONFIGURATION_ACCESS_BODY, GAME_CONFIGURATION_ARCHIVE_GAME, GAME_CONFIGURATION_AUDIENCE, GAME_CONFIGURATION_CONTENT_RATING, GAME_CONFIGURATION_CREATOR_HUB, GAME_CONFIGURATION_CREATOR_HUB_DESCRIPTION, GAME_CONFIGURATION_AUDIENCE_FRIENDS_ONLY, GAME_CONFIGURATION_GAME_DETAILS, GAME_CONFIGURATION_GAME_DETAILS_BODY, GAME_CONFIGURATION_ICON_AND_THUMBNAILS, GAME_CONFIGURATION_LOADING, GAME_CONFIGURATION_AUDIENCE_PRIVATE, PRIVATE_INVITES_ROW_DESCRIPTION, PRIVATE_INVITES_ROW_LOAD_ERROR, PRIVATE_INVITES_ROW_TITLE, PRIVATE_INVITES_ROW_TITLE_EMPTY, PRIVATE_INVITES_SHARE_LINK, GAME_CONFIGURATION_AUDIENCE_PUBLIC, GAME_CONFIGURATION_QUESTIONNAIRE_REQUIRED_BANNER, GAME_CONFIGURATION_TITLE_AND_DESCRIPTION, GAME_CONFIGURATION_AUDIENCE_UNKNOWN
	local testId = p1.testId or "game-configuration-content"
	local var1 = if fFlagBuildLocalization then useLocalization({
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
	local var2 = if fFlagBuildLocalization then reactModule.useContext(localizationModule.LocalizationRoactContext) else nil
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
		GAME_CONFIGURATION_ACCESS = var1.access
		GAME_CONFIGURATION_ACCESS_AND_SHARING = var1.accessAndSharing
		GAME_CONFIGURATION_ACCESS_BODY = var1.accessBody
		GAME_CONFIGURATION_ARCHIVE_GAME = var1.archiveGame
		GAME_CONFIGURATION_AUDIENCE = var1.audience
		GAME_CONFIGURATION_CONTENT_RATING = var1.contentRating
		GAME_CONFIGURATION_CREATOR_HUB = var1.creatorHub
		GAME_CONFIGURATION_CREATOR_HUB_DESCRIPTION = var1.creatorHubDescription
		GAME_CONFIGURATION_AUDIENCE_FRIENDS_ONLY = var1.friendsOnlyAudience
		GAME_CONFIGURATION_GAME_DETAILS = var1.gameDetails
		GAME_CONFIGURATION_GAME_DETAILS_BODY = var1.gameDetailsBody
		GAME_CONFIGURATION_ICON_AND_THUMBNAILS = var1.iconAndThumbnails
		GAME_CONFIGURATION_LOADING = var1.loading
		GAME_CONFIGURATION_AUDIENCE_PRIVATE = var1.privateAudience
		PRIVATE_INVITES_ROW_DESCRIPTION = var1.privateInvitesRowDescription
		PRIVATE_INVITES_ROW_LOAD_ERROR = var1.privateInvitesRowLoadError
		PRIVATE_INVITES_ROW_TITLE = var1.privateInvitesRowTitle
		PRIVATE_INVITES_ROW_TITLE_EMPTY = var1.privateInvitesRowTitleEmpty
		PRIVATE_INVITES_SHARE_LINK = var1.privateInvitesShareLink
		GAME_CONFIGURATION_AUDIENCE_PUBLIC = var1.publicAudience
		GAME_CONFIGURATION_QUESTIONNAIRE_REQUIRED_BANNER = var1.questionnaireRequiredBanner
		GAME_CONFIGURATION_TITLE_AND_DESCRIPTION = var1.titleAndDescription
		GAME_CONFIGURATION_AUDIENCE_UNKNOWN = var1.unknownAudience
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
	local var3 = useOpenWebView()
	local var4 = useArchiveGameFlowModule()
	local var5 = if fFlagBuildExperiencePrivateInvitesModule then useExperienceShareFlowModule(p1.universeId, p1.placeId) else nil
	local var6 = if var5 ~= nil then nil else var5.onShare
	local var7 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: universeConfigurationModule (copy), p1 (ref)
		return universeConfigurationModule.getUniverseConfigurationStore().getAndFetchConfiguration(p1.universeId)
	end, { p1.universeId }).data)
	local var8 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: experienceGuidelinesModule (copy), p1 (ref)
		return experienceGuidelinesModule.getExperienceGuidelinesStore().getAndFetchDetailedGuidelines(p1.universeId)
	end, { p1.universeId }).data)
	local var9 = if var7 then gameConfigurationLabelsModule.getAudience(var7) else nil
	local _ = nil
	local var10 = if var7 == nil then GAME_CONFIGURATION_LOADING elseif fFlagBuildLocalization then if var9 == privacyType.Private then GAME_CONFIGURATION_AUDIENCE_PRIVATE elseif var9 == privacyType.Public then GAME_CONFIGURATION_AUDIENCE_PUBLIC elseif var9 == privacyType.FriendsOnly then GAME_CONFIGURATION_AUDIENCE_FRIENDS_ONLY else gameConfigurationLabelsModule.getAudienceText(var7) or GAME_CONFIGURATION_AUDIENCE_UNKNOWN else gameConfigurationLabelsModule.getAudienceText(var7) or gameConfigurationLabelsModule.UNKNOWN_AUDIENCE_TEXT
	local var11 = nil
	local var12 = nil
	local var13 = false
	local var14 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: universeActivationModule (copy), p1 (ref)
		return universeActivationModule.getUniverseActivationStore().getAndFetchEligibility(p1.universeId)
	end, { p1.universeId }).data)
	local var15 = reactModule.useMemo(function()
		-- upvalues: contentMaturityUtilsModule (copy), p1 (ref)
		return contentMaturityUtilsModule.isSealBroken(p1.universeId)
	end, { var14, p1.universeId })
	local var16 = reactModule.useMemo(function()
		-- upvalues: contentMaturityUtilsModule (copy), p1 (ref)
		return contentMaturityUtilsModule.isContentUnrated(p1.universeId)
	end, { var14, p1.universeId })
	
	if fFlagBuildRehydrateOnPublishModule then
		var12 = if var14 then var14.provisionalRating else nil
		var13 = var16 and not var15
	end
	if var15 and var16 then
		var11 = GAME_CONFIGURATION_QUESTIONNAIRE_REQUIRED_BANNER
	end
	local var17 = gameConfigurationLabelsModule.getContentMaturityText(var8, var12, var13) or GAME_CONFIGURATION_LOADING
	local var18 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), gameConfigurationActionsModule (copy), p1 (ref), GAME_CONFIGURATION_CREATOR_HUB (write)
		var3(gameConfigurationActionsModule.getCreatorHubConfigureUrl(p1.universeId), GAME_CONFIGURATION_CREATOR_HUB)
	end, { GAME_CONFIGURATION_CREATOR_HUB, var3, p1.universeId })
	local var19 = reactModule.useCallback(function()
		-- upvalues: fFlagBuildRehydrateOnPublishModule (copy), var3 (ref), gameConfigurationActionsModule (copy), p1 (ref), GAME_CONFIGURATION_CREATOR_HUB (write), refreshPublishEligibilityModule (copy)
		if fFlagBuildRehydrateOnPublishModule then
			var3(gameConfigurationActionsModule.getExperienceQuestionnaireUrl(p1.universeId), GAME_CONFIGURATION_CREATOR_HUB, function()
				-- upvalues: refreshPublishEligibilityModule (copy), p1 (copy)
				refreshPublishEligibilityModule(p1.universeId)
			end)
			
			return
		end
		var3(gameConfigurationActionsModule.getExperienceQuestionnaireUrl(p1.universeId), GAME_CONFIGURATION_CREATOR_HUB)
	end, { GAME_CONFIGURATION_CREATOR_HUB, var3, p1.universeId })
	local var20 = reactModule.useMemo(function()
		-- upvalues: GAME_CONFIGURATION_ICON_AND_THUMBNAILS (write), captureServiceStartUploadCoreScriptBypass (copy), iconName (copy), p1 (ref), var18 (ref), GAME_CONFIGURATION_TITLE_AND_DESCRIPTION (write)
		return {
			{
				id = "icon-thumbnails",
				title = GAME_CONFIGURATION_ICON_AND_THUMBNAILS,
				trailingIcon = if captureServiceStartUploadCoreScriptBypass then nil else iconName.ArrowUpRightFromSquare,
				onActivated = if captureServiceStartUploadCoreScriptBypass then p1.onOpenMediaSelectionPage else var18
			},
			{
				id = "title-description",
				trailingIcon = nil,
				title = GAME_CONFIGURATION_TITLE_AND_DESCRIPTION,
				description = p1.experienceName,
				onActivated = p1.onOpenTitleDescriptionPage
			}
		}
	end, {
		var18, p1.experienceName, p1.onOpenMediaSelectionPage,
		p1.onOpenTitleDescriptionPage, GAME_CONFIGURATION_ICON_AND_THUMBNAILS,
		GAME_CONFIGURATION_TITLE_AND_DESCRIPTION
	})
	local onOpenPlaytestPicker = p1.onOpenPlaytestPicker
	local onOpenPlaytestManagement = p1.onOpenPlaytestManagement
	local var21 = fFlagBuildExperiencePrivateInvitesModule and (onOpenPlaytestPicker ~= nil and onOpenPlaytestManagement ~= nil)
	local var22 = reactModule.useMemo(function()
		-- upvalues: var21 (ref), getPrivatePlaytestersStore (copy), p1 (ref)
		return if var21 then getPrivatePlaytestersStore(false).getAndFetchInvitedPlayers(p1.universeId) else nil
	end, { var21, p1.universeId })
	local var23 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var22 (ref)
		return signalsModule.createComputed(function(p2)
			-- upvalues: var22 (copy)
			return if var22 == nil then 0 else #var22.players(p2)
		end)
	end, { var22 }))
	local var24 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var22 (ref)
		return signalsModule.createComputed(function(p2)
			-- upvalues: var22 (copy)
			return if var22 == nil then "NotReady" else var22.status(p2)
		end)
	end, { var22 }))
	local MAX_INVITES = getPrivatePlaytestersStore(false).MAX_INVITES
	local var25 = if var21 then if var24 == "Ready" then if var23 > 0 then {
		id = "playtest",
		trailingIcon = nil,
		title = PRIVATE_INVITES_ROW_TITLE,
		description = if var23 > 0 then if fFlagBuildLocalization then var2:Format(localizationStringsModule.PRIVATE_INVITES_SENT, { INVITED_COUNT = var23, MAX_INVITES = MAX_INVITES }) else localizationStringsModule.formatPrivateInvitesSent(var23, MAX_INVITES) else nil,
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
		description = if var24 == "Failed" then PRIVATE_INVITES_ROW_LOAD_ERROR else GAME_CONFIGURATION_LOADING
	} else nil
	
	return reactModule.createElement(view, {
		tag = "col gap-xlarge size-full-0 auto-y padding-y-large",
		LayoutOrder = p1.layoutOrder,
		testId = testId
	}, {
		GameDetails = reactModule.createElement(gameConfigurationListModule, {
			layoutOrder = 1,
			title = GAME_CONFIGURATION_GAME_DETAILS,
			body = GAME_CONFIGURATION_GAME_DETAILS_BODY,
			rows = var20,
			testId = `{testId}-game-details`
		}),
		Access = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col gap-medium size-full-0 auto-y"
		}, {
			Configuration = reactModule.createElement(gameConfigurationListModule, {
				layoutOrder = 1,
				title = if var21 then GAME_CONFIGURATION_ACCESS_AND_SHARING else GAME_CONFIGURATION_ACCESS,
				body = GAME_CONFIGURATION_ACCESS_BODY,
				rows = reactModule.useMemo(function()
					-- upvalues: GAME_CONFIGURATION_AUDIENCE (write), var10 (write), p1 (ref), var25 (write), PRIVATE_INVITES_SHARE_LINK (write), var6 (ref), GAME_CONFIGURATION_CONTENT_RATING (write), var17 (ref), iconName (copy), var19 (ref)
					local list = {
						{
							id = "audience",
							trailingIcon = nil,
							title = GAME_CONFIGURATION_AUDIENCE,
							description = var10,
							onActivated = p1.onOpenAudiencePage
						}
					}
					
					if var25 ~= nil then
						table.insert(list, var25)
						table.insert(list, {
							id = "playtest-share-link",
							trailingIcon = nil,
							title = PRIVATE_INVITES_SHARE_LINK,
							onActivated = var6
						})
					end
					table.insert(list, {
						id = "content-rating",
						title = GAME_CONFIGURATION_CONTENT_RATING,
						description = var17,
						trailingIcon = iconName.ArrowUpRightFromSquare,
						onActivated = var19
					})
					
					return list
				end, {
					var10, var17, var19, var25, var6, p1.onOpenAudiencePage,
					GAME_CONFIGURATION_AUDIENCE, GAME_CONFIGURATION_CONTENT_RATING,
					PRIVATE_INVITES_SHARE_LINK
				}),
				testId = `{testId}-access`
			}),
			BuildMaturityBanner = if var11 ~= nil then nil else reactModule.createElement(buildMaturityBannerModule, { text = var11 })
		}),
		CreatorHub = reactModule.createElement(gameConfigurationListModule, {
			layoutOrder = 3,
			title = GAME_CONFIGURATION_CREATOR_HUB,
			rows = reactModule.useMemo(function()
				-- upvalues: GAME_CONFIGURATION_CREATOR_HUB (write), GAME_CONFIGURATION_CREATOR_HUB_DESCRIPTION (write), iconName (copy), var18 (ref)
				return {
					{
						id = "creator-hub",
						title = GAME_CONFIGURATION_CREATOR_HUB,
						description = GAME_CONFIGURATION_CREATOR_HUB_DESCRIPTION,
						trailingIcon = iconName.ArrowUpRightFromSquare,
						onActivated = var18
					}
				}
			end, {
				GAME_CONFIGURATION_CREATOR_HUB,
				GAME_CONFIGURATION_CREATOR_HUB_DESCRIPTION,
				var18
			}),
			testId = `{testId}-creator-hub`
		}),
		ArchiveGame = reactModule.createElement(view, {
			LayoutOrder = 4,
			tag = "row align-y-center size-full-0 auto-y padding-large stroke-standard stroke-default radius-large bg-surface-0",
			onActivated = reactModule.useCallback(function()
				-- upvalues: var4 (ref), p1 (ref)
				var4.requestArchive(p1.universeId)
			end, { var4.requestArchive, p1.universeId }),
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
			isOpen = var4.isOpen,
			onArchive = var4.confirm,
			onCancel = var4.cancel
		}),
		ShareOverlays = if fFlagBuildExperiencePrivateInvitesModule and var5 ~= nil then reactModule.createElement(experienceShareOverlaysModule, {
			activeDialog = var5.activeDialog,
			hasShareError = var5.hasShareError,
			onCancel = var5.onCancelDialog,
			onConfirmFriends = var5.onConfirmFriends,
			onConfirmPlaytesters = var5.onConfirmPlaytesters
		}) else nil
	})
end