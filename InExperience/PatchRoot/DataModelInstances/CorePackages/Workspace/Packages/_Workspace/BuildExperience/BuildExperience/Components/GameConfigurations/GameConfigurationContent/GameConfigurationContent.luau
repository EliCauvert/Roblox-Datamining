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
local privacyType = universeConfigurationModule.PrivacyType

return function(p1)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), reactModule (ref), localizationModule (ref), useOpenWebView (ref), useArchiveGameFlowModule (ref), fFlagBuildExperiencePrivateInvitesModule (ref), useExperienceShareFlowModule (ref), universeConfigurationModule (ref), experienceGuidelinesModule (ref), signalsReactModule (ref), gameConfigurationLabelsModule (ref), privacyType (ref), universeActivationModule (ref), contentMaturityUtilsModule (ref), gameConfigurationActionsModule (ref), refreshPublishEligibilityModule (ref), captureServiceStartUploadCoreScriptBypass (ref), iconName (ref), getPrivatePlaytestersStore (ref), signalsModule (ref), view (ref), gameConfigurationListModule (ref), buildMaturityBannerModule (ref), text (ref), archiveGameDialogModule (ref), experienceShareOverlaysModule (ref)
	local testId = p1.testId or "game-configuration-content"
	local var1 = useLocalization({
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
	})
	local var2 = reactModule.useContext(localizationModule.LocalizationRoactContext)
	local access = var1.access
	local accessAndSharing = var1.accessAndSharing
	local accessBody = var1.accessBody
	local archiveGame = var1.archiveGame
	local audience = var1.audience
	local contentRating = var1.contentRating
	local creatorHub = var1.creatorHub
	local creatorHubDescription = var1.creatorHubDescription
	local friendsOnlyAudience = var1.friendsOnlyAudience
	local gameDetails = var1.gameDetails
	local gameDetailsBody = var1.gameDetailsBody
	local iconAndThumbnails = var1.iconAndThumbnails
	local loading = var1.loading
	local privateAudience = var1.privateAudience
	local privateInvitesRowDescription = var1.privateInvitesRowDescription
	local privateInvitesRowLoadError = var1.privateInvitesRowLoadError
	local privateInvitesRowTitle = var1.privateInvitesRowTitle
	local privateInvitesRowTitleEmpty = var1.privateInvitesRowTitleEmpty
	local privateInvitesShareLink = var1.privateInvitesShareLink
	local publicAudience = var1.publicAudience
	local questionnaireRequiredBanner = var1.questionnaireRequiredBanner
	local titleAndDescription = var1.titleAndDescription
	local unknownAudience = var1.unknownAudience
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
	local var10 = if var7 == nil then loading elseif var9 == privacyType.Private then privateAudience elseif var9 == privacyType.Public then publicAudience elseif var9 == privacyType.FriendsOnly then friendsOnlyAudience else gameConfigurationLabelsModule.getAudienceText(var7) or unknownAudience
	local var11 = nil
	local var12 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: universeActivationModule (copy), p1 (ref)
		return universeActivationModule.getUniverseActivationStore().getAndFetchEligibility(p1.universeId)
	end, { p1.universeId }).data)
	local var13 = reactModule.useMemo(function()
		-- upvalues: contentMaturityUtilsModule (copy), p1 (ref)
		return contentMaturityUtilsModule.isSealBroken(p1.universeId)
	end, { var12, p1.universeId })
	local var14 = reactModule.useMemo(function()
		-- upvalues: contentMaturityUtilsModule (copy), p1 (ref)
		return contentMaturityUtilsModule.isContentUnrated(p1.universeId)
	end, { var12, p1.universeId })
	local var15 = if var12 then var12.provisionalRating else nil
	local var16 = var14 and not var13
	
	if var13 and var14 then
		var11 = questionnaireRequiredBanner
	end
	local var17 = gameConfigurationLabelsModule.getContentMaturityText(var8, var15, var16) or loading
	local var18 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), gameConfigurationActionsModule (copy), p1 (ref), creatorHub (ref)
		var3(gameConfigurationActionsModule.getCreatorHubConfigureUrl(p1.universeId), creatorHub)
	end, { creatorHub, var3, p1.universeId })
	local var19 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), gameConfigurationActionsModule (copy), p1 (ref), creatorHub (ref), refreshPublishEligibilityModule (copy)
		var3(gameConfigurationActionsModule.getExperienceQuestionnaireUrl(p1.universeId), creatorHub, function()
			-- upvalues: refreshPublishEligibilityModule (copy), p1 (copy)
			refreshPublishEligibilityModule(p1.universeId)
		end)
	end, { creatorHub, var3, p1.universeId })
	local var20 = reactModule.useMemo(function()
		-- upvalues: iconAndThumbnails (ref), captureServiceStartUploadCoreScriptBypass (copy), iconName (copy), p1 (ref), var18 (ref), titleAndDescription (ref)
		return {
			{
				id = "icon-thumbnails",
				title = iconAndThumbnails,
				trailingIcon = if captureServiceStartUploadCoreScriptBypass then nil else iconName.ArrowUpRightFromSquare,
				onActivated = if captureServiceStartUploadCoreScriptBypass then p1.onOpenMediaSelectionPage else var18
			},
			{
				id = "title-description",
				trailingIcon = nil,
				title = titleAndDescription,
				description = p1.experienceName,
				onActivated = p1.onOpenTitleDescriptionPage
			}
		}
	end, {
		var18, p1.experienceName, p1.onOpenMediaSelectionPage,
		p1.onOpenTitleDescriptionPage, iconAndThumbnails, titleAndDescription
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
	local var25 = if var21 then if var24 == "Ready" then if var23 > 0 then {
		id = "playtest",
		trailingIcon = nil,
		title = privateInvitesRowTitle,
		description = if var23 > 0 then var2:Format(localizationStringsModule.PRIVATE_INVITES_SENT, {
			INVITED_COUNT = var23,
			MAX_INVITES = getPrivatePlaytestersStore(false).MAX_INVITES
		}) else nil,
		onActivated = onOpenPlaytestManagement
	} else {
		id = "playtest",
		trailingIcon = nil,
		title = privateInvitesRowTitleEmpty,
		description = privateInvitesRowDescription,
		onActivated = onOpenPlaytestPicker
	} else {
		id = "playtest",
		trailingIcon = nil,
		onActivated = nil,
		title = privateInvitesRowTitle,
		description = if var24 == "Failed" then privateInvitesRowLoadError else loading
	} else nil
	
	return reactModule.createElement(view, {
		tag = "col gap-xlarge size-full-0 auto-y padding-y-large",
		LayoutOrder = p1.layoutOrder,
		testId = testId
	}, {
		GameDetails = reactModule.createElement(gameConfigurationListModule, {
			layoutOrder = 1,
			title = gameDetails,
			body = gameDetailsBody,
			rows = var20,
			testId = `{testId}-game-details`
		}),
		Access = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col gap-medium size-full-0 auto-y"
		}, {
			Configuration = reactModule.createElement(gameConfigurationListModule, {
				layoutOrder = 1,
				title = if var21 then accessAndSharing else access,
				body = accessBody,
				rows = reactModule.useMemo(function()
					-- upvalues: audience (ref), var10 (write), p1 (ref), var25 (write), privateInvitesShareLink (ref), var6 (ref), contentRating (ref), var17 (ref), iconName (copy), var19 (ref)
					local list = {
						{
							id = "audience",
							trailingIcon = nil,
							title = audience,
							description = var10,
							onActivated = p1.onOpenAudiencePage
						}
					}
					
					if var25 ~= nil then
						table.insert(list, var25)
						table.insert(list, {
							id = "playtest-share-link",
							trailingIcon = nil,
							title = privateInvitesShareLink,
							onActivated = var6
						})
					end
					table.insert(list, {
						id = "content-rating",
						title = contentRating,
						description = var17,
						trailingIcon = iconName.ArrowUpRightFromSquare,
						onActivated = var19
					})
					
					return list
				end, {
					var10, var17, var19, var25, var6, p1.onOpenAudiencePage, audience,
					contentRating, privateInvitesShareLink
				}),
				testId = `{testId}-access`
			}),
			BuildMaturityBanner = if var11 ~= nil then nil else reactModule.createElement(buildMaturityBannerModule, { text = var11 })
		}),
		CreatorHub = reactModule.createElement(gameConfigurationListModule, {
			layoutOrder = 3,
			title = creatorHub,
			rows = reactModule.useMemo(function()
				-- upvalues: creatorHub (ref), creatorHubDescription (ref), iconName (copy), var18 (ref)
				return {
					{
						id = "creator-hub",
						title = creatorHub,
						description = creatorHubDescription,
						trailingIcon = iconName.ArrowUpRightFromSquare,
						onActivated = var18
					}
				}
			end, { creatorHub, creatorHubDescription, var18 }),
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
				Text = archiveGame
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