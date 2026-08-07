local captureService = game:GetService("CaptureService")
local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local useOpenWebView = require(parent.WebViewUtils).useOpenWebView
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
local fFlagEnableProvisionalRatingModule = require(buildExperience.Flags.FFlagEnableProvisionalRating)
local fFlagBuildRehydrateOnPublishModule = require(buildExperience.Flags.FFlagBuildRehydrateOnPublish)

return function(p0) --[[ line: 64 | named "GameConfigurationContent" ]]
	-- upvalues: useOpenWebView (ref), useArchiveGameFlowModule (ref), fFlagBuildExperiencePrivateInvitesModule (ref), useExperienceShareFlowModule (ref), reactModule (ref), universeConfigurationModule (ref), experienceGuidelinesModule (ref), signalsReactModule (ref), gameConfigurationLabelsModule (ref), localizationStringsModule (ref), fFlagEnableProvisionalRatingModule (ref), universeActivationModule (ref), contentMaturityUtilsModule (ref), fFlagBuildRehydrateOnPublishModule (ref), gameConfigurationActionsModule (ref), refreshPublishEligibilityModule (ref), captureServiceStartUploadCoreScriptBypass (ref), iconName (ref), getPrivatePlaytestersStore (ref), signalsModule (ref), view (ref), gameConfigurationListModule (ref), buildMaturityBannerModule (ref), text (ref), archiveGameDialogModule (ref), experienceShareOverlaysModule (ref)
	local testId = p0.testId or "game-configuration-content"
	local var26 = useOpenWebView()
	local var27 = useArchiveGameFlowModule()
	local var28 = if fFlagBuildExperiencePrivateInvitesModule then useExperienceShareFlowModule(p0.universeId, p0.placeId) else nil
	local var29 = if var28 ~= nil then nil else var28.onShare
	local var30 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 76 ]]
		-- upvalues: universeConfigurationModule (copy), p0 (ref)
		return universeConfigurationModule.getUniverseConfigurationStore().getAndFetchConfiguration(p0.universeId)
	end, { p0.universeId }).data)
	local var31 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 79 ]]
		-- upvalues: experienceGuidelinesModule (copy), p0 (ref)
		return experienceGuidelinesModule.getExperienceGuidelinesStore().getAndFetchDetailedGuidelines(p0.universeId)
	end, { p0.universeId }).data)
	local var32 = if var30 then gameConfigurationLabelsModule.getAudienceText(var30) or gameConfigurationLabelsModule.UNKNOWN_AUDIENCE_TEXT else localizationStringsModule.GAME_CONFIGURATION_LOADING
	local GAME_CONFIGURATION_QUESTIONNAIRE_REQUIRED_BANNER = nil
	local var33 = nil
	local var34 = false
	
	if fFlagEnableProvisionalRatingModule then
		local var35 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 92 ]]
			-- upvalues: universeActivationModule (copy), p0 (ref)
			return universeActivationModule.getUniverseActivationStore().getAndFetchEligibility(p0.universeId)
		end, { p0.universeId }).data)
		local var36 = reactModule.useMemo(function() --[[ line: 96 ]]
			-- upvalues: contentMaturityUtilsModule (copy), p0 (ref)
			return contentMaturityUtilsModule.isSealBroken(p0.universeId)
		end, { var35, p0.universeId })
		local var37 = reactModule.useMemo(function() --[[ line: 99 ]]
			-- upvalues: contentMaturityUtilsModule (copy), p0 (ref)
			return contentMaturityUtilsModule.isContentUnrated(p0.universeId)
		end, { var35, p0.universeId })
		
		if fFlagBuildRehydrateOnPublishModule then
			var33 = if var35 then var35.provisionalRating else nil
			var34 = var37 and not var36
		end
		if var36 and var37 then
			GAME_CONFIGURATION_QUESTIONNAIRE_REQUIRED_BANNER = localizationStringsModule.GAME_CONFIGURATION_QUESTIONNAIRE_REQUIRED_BANNER
		end
	end
	local var38 = gameConfigurationLabelsModule.getContentMaturityText(var31, var33, var34) or localizationStringsModule.GAME_CONFIGURATION_LOADING
	local var39 = reactModule.useCallback(function() --[[ line: 117 ]]
		-- upvalues: var26 (ref), gameConfigurationActionsModule (copy), p0 (ref), localizationStringsModule (copy)
		var26(gameConfigurationActionsModule.getCreatorHubConfigureUrl(p0.universeId), localizationStringsModule.GAME_CONFIGURATION_CREATOR_HUB)
	end, { var26, p0.universeId })
	local var40 = reactModule.useCallback(function() --[[ line: 124 ]]
		-- upvalues: fFlagBuildRehydrateOnPublishModule (copy), var26 (ref), gameConfigurationActionsModule (copy), p0 (ref), localizationStringsModule (copy), refreshPublishEligibilityModule (copy)
		if fFlagBuildRehydrateOnPublishModule then
			var26(gameConfigurationActionsModule.getExperienceQuestionnaireUrl(p0.universeId), localizationStringsModule.GAME_CONFIGURATION_CREATOR_HUB, function() --[[ line: 129 ]]
				-- upvalues: refreshPublishEligibilityModule (copy), p0 (copy)
				refreshPublishEligibilityModule(p0.universeId)
			end)
			
			return
		end
		var26(gameConfigurationActionsModule.getExperienceQuestionnaireUrl(p0.universeId), localizationStringsModule.GAME_CONFIGURATION_CREATOR_HUB)
	end, { var26, p0.universeId })
	local var41 = reactModule.useMemo(function() --[[ line: 142 ]]
		-- upvalues: localizationStringsModule (copy), captureServiceStartUploadCoreScriptBypass (copy), iconName (copy), p0 (ref), var39 (ref)
		return {
			{
				id = "icon-thumbnails",
				title = localizationStringsModule.GAME_CONFIGURATION_ICON_AND_THUMBNAILS,
				trailingIcon = if captureServiceStartUploadCoreScriptBypass then nil else iconName.ArrowUpRightFromSquare,
				onActivated = if captureServiceStartUploadCoreScriptBypass then p0.onOpenMediaSelectionPage else var39
			},
			{
				id = "title-description",
				trailingIcon = nil,
				title = localizationStringsModule.GAME_CONFIGURATION_TITLE_AND_DESCRIPTION,
				description = p0.experienceName,
				onActivated = p0.onOpenTitleDescriptionPage
			}
		}
	end, {
		var39,
		p0.experienceName,
		p0.onOpenMediaSelectionPage,
		p0.onOpenTitleDescriptionPage
	})
	local onOpenPlaytestPicker = p0.onOpenPlaytestPicker
	local onOpenPlaytestManagement = p0.onOpenPlaytestManagement
	local var42 = fFlagBuildExperiencePrivateInvitesModule and (onOpenPlaytestPicker ~= nil and onOpenPlaytestManagement ~= nil)
	local var43 = reactModule.useMemo(function() --[[ line: 170 ]]
		-- upvalues: var42 (ref), getPrivatePlaytestersStore (copy), p0 (ref)
		return if var42 then getPrivatePlaytestersStore(false).getAndFetchInvitedPlayers(p0.universeId) else nil
	end, { var42, p0.universeId })
	local var44 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 177 ]]
		-- upvalues: signalsModule (copy), var43 (ref)
		return signalsModule.createComputed(function(p1) --[[ line: 178 ]]
			-- upvalues: var43 (copy)
			return if var43 == nil then 0 else #var43.players(p1)
		end)
	end, { var43 }))
	local var45 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 184 ]]
		-- upvalues: signalsModule (copy), var43 (ref)
		return signalsModule.createComputed(function(p2) --[[ line: 185 ]]
			-- upvalues: var43 (copy)
			return if var43 == nil then "NotReady" else var43.status(p2)
		end)
	end, { var43 }))
	local var46 = if var42 then if var45 == "Ready" then if var44 > 0 then {
		id = "playtest",
		trailingIcon = nil,
		title = localizationStringsModule.PRIVATE_INVITES_ROW_TITLE,
		description = localizationStringsModule.formatPrivateInvitesSent(var44, getPrivatePlaytestersStore(false).MAX_INVITES),
		onActivated = onOpenPlaytestManagement
	} else {
		id = "playtest",
		trailingIcon = nil,
		title = localizationStringsModule.PRIVATE_INVITES_ROW_TITLE_EMPTY,
		description = localizationStringsModule.PRIVATE_INVITES_ROW_DESCRIPTION,
		onActivated = onOpenPlaytestPicker
	} else {
		id = "playtest",
		trailingIcon = nil,
		onActivated = nil,
		title = localizationStringsModule.PRIVATE_INVITES_ROW_TITLE,
		description = if var45 == "Failed" then localizationStringsModule.PRIVATE_INVITES_ROW_LOAD_ERROR else localizationStringsModule.GAME_CONFIGURATION_LOADING
	} else nil
	
	return reactModule.createElement(view, {
		tag = "col gap-xlarge size-full-0 auto-y padding-y-large",
		LayoutOrder = p0.layoutOrder,
		testId = testId
	}, {
		GameDetails = reactModule.createElement(gameConfigurationListModule, {
			layoutOrder = 1,
			title = localizationStringsModule.GAME_CONFIGURATION_GAME_DETAILS,
			body = localizationStringsModule.GAME_CONFIGURATION_GAME_DETAILS_BODY,
			rows = var41,
			testId = `{testId}-game-details`
		}),
		Access = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col gap-medium size-full-0 auto-y"
		}, {
			Configuration = reactModule.createElement(gameConfigurationListModule, {
				layoutOrder = 1,
				title = if var42 then localizationStringsModule.GAME_CONFIGURATION_ACCESS_AND_SHARING else localizationStringsModule.GAME_CONFIGURATION_ACCESS,
				body = localizationStringsModule.GAME_CONFIGURATION_ACCESS_BODY,
				rows = reactModule.useMemo(function() --[[ line: 230 ]]
					-- upvalues: localizationStringsModule (copy), var32 (ref), p0 (ref), var46 (write), var29 (ref), var38 (ref), iconName (copy), var40 (ref)
					local list = {
						{
							id = "audience",
							trailingIcon = nil,
							title = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE,
							description = var32,
							onActivated = p0.onOpenAudiencePage
						}
					}
					
					if var46 ~= nil then
						table.insert(list, var46)
						table.insert(list, {
							id = "playtest-share-link",
							trailingIcon = nil,
							title = localizationStringsModule.PRIVATE_INVITES_SHARE_LINK,
							onActivated = var29
						})
					end
					table.insert(list, {
						id = "content-rating",
						title = localizationStringsModule.GAME_CONFIGURATION_CONTENT_RATING,
						description = var38,
						trailingIcon = iconName.ArrowUpRightFromSquare,
						onActivated = var40
					})
					
					return list
				end, {
					var32, var38, var40, var46, var29, p0.onOpenAudiencePage
				}),
				testId = `{testId}-access`
			}),
			BuildMaturityBanner = if GAME_CONFIGURATION_QUESTIONNAIRE_REQUIRED_BANNER ~= nil then nil else reactModule.createElement(buildMaturityBannerModule, { text = GAME_CONFIGURATION_QUESTIONNAIRE_REQUIRED_BANNER })
		}),
		CreatorHub = reactModule.createElement(gameConfigurationListModule, {
			layoutOrder = 3,
			title = localizationStringsModule.GAME_CONFIGURATION_CREATOR_HUB,
			rows = reactModule.useMemo(function() --[[ line: 271 ]]
				-- upvalues: localizationStringsModule (copy), iconName (copy), var39 (ref)
				return {
					{
						id = "creator-hub",
						title = localizationStringsModule.GAME_CONFIGURATION_CREATOR_HUB,
						description = localizationStringsModule.GAME_CONFIGURATION_CREATOR_HUB_DESCRIPTION,
						trailingIcon = iconName.ArrowUpRightFromSquare,
						onActivated = var39
					}
				}
			end, { var39 }),
			testId = `{testId}-creator-hub`
		}),
		ArchiveGame = reactModule.createElement(view, {
			LayoutOrder = 4,
			tag = "row align-y-center size-full-0 auto-y padding-large stroke-standard stroke-default radius-large bg-surface-0",
			onActivated = reactModule.useCallback(function() --[[ line: 283 ]]
				-- upvalues: var27 (ref), p0 (ref)
				var27.requestArchive(p0.universeId)
			end, { var27.requestArchive, p0.universeId }),
			stateLayer = {},
			testId = `{testId}-archive-game`
		}, {
			Label = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "fill auto-y text-title-medium text-align-x-left content-default",
				Text = localizationStringsModule.GAME_CONFIGURATION_ARCHIVE_GAME
			})
		}),
		ArchiveDialog = reactModule.createElement(archiveGameDialogModule, {
			isOpen = var27.isOpen,
			onArchive = var27.confirm,
			onCancel = var27.cancel
		}),
		ShareOverlays = if fFlagBuildExperiencePrivateInvitesModule and var28 ~= nil then reactModule.createElement(experienceShareOverlaysModule, {
			activeDialog = var28.activeDialog,
			hasShareError = var28.hasShareError,
			onCancel = var28.onCancelDialog,
			onConfirmFriends = var28.onConfirmFriends,
			onConfirmPlaytesters = var28.onConfirmPlaytesters
		}) else nil
	})
end