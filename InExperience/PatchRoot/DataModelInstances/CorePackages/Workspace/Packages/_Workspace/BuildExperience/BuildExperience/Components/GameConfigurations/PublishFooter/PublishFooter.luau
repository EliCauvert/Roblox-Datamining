local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local gameDetailModule = require(parent.GameDetail)
local navigationModule = require(parent.Navigation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local useOpenWebView = require(parent.WebViewUtils).useOpenWebView
local useLocalization = require(parent.Localization).Hooks.useLocalization
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local experienceGuidelinesModule = require(parent.DataHydration.ExperienceGuidelines)
local placeVersionHistoryModule = require(parent.DataHydration.PlaceVersionHistory)
local universeConfigurationModule = require(parent.DataHydration.UniverseConfiguration)
local universeActivationModule = require(parent.DataHydration.UniverseActivation)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local friendsOnlyShareDialogModule = require(buildExperience.Components.ShareAudience.FriendsOnlyShareDialog)
local privateShareTooltipModule = require(buildExperience.Components.ShareAudience.PrivateShareTooltip)
local contentMaturityUtilsModule = require(buildExperience.utils.ContentMaturityUtils)
local gameConfigurationActionsModule = require(buildExperience.utils.GameConfigurationActions)
local gameConfigurationLabelsModule = require(buildExperience.utils.GameConfigurationLabels)
local refreshPublishEligibilityModule = require(buildExperience.utils.refreshPublishEligibility)
local getVersionInformationStoreModule = require(buildExperience.Stores.GetVersionInformationStore)
local button = foundationModule.Button
local snackbar = foundationModule.Snackbar
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local inputSize = foundationModule.Enums.InputSize
local privacyType = universeConfigurationModule.PrivacyType
local fFlagEnableShareSheet = sharedFlagsModule.FFlagEnableShareSheet
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local fFlagEnableProvisionalRatingModule = require(buildExperience.Flags.FFlagEnableProvisionalRating)
local fFlagBuildPublishAccountTooNewErrorModule = require(buildExperience.Flags.FFlagBuildPublishAccountTooNewError)
local fFlagBuildRehydrateOnPublishModule = require(buildExperience.Flags.FFlagBuildRehydrateOnPublish)
local fFlagBuildExperienceTooltipsLightDismissModule = require(buildExperience.Flags.FFlagBuildExperienceTooltipsLightDismiss)
local useStore = require(parent.RoactUtils).Hooks.RoactRodux.useStore
local getRootNavigation = navigationModule.getRootNavigation
local useNavigation = navigationModule.useNavigation
local openGameDetails = gameDetailModule.OpenGameDetails
local debug = creatorAgentChatModule.debug
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local sharePublishedExperienceModule = require(buildExperience.utils.sharePublishedExperience)
local sharePublishedExperience = sharePublishedExperienceModule.sharePublishedExperience
local useSharePublishedExperience = sharePublishedExperienceModule.useSharePublishedExperience
local t = {}

local function _(p0) --[[ line: 71 | named "isPublishedVersion" ]]
	return typeof(p0) == "table" and (p0.status == "success" and (typeof(p0.version) == "string" and p0.version ~= ""))
end

local function buildPublicAudiences(p1) --[[ line: 78 ]]
	-- upvalues: universeActivationModule (ref)
	local t = {}
	
	for i, v in p1 or {} do
		if v ~= universeActivationModule.Audience.Public and v ~= universeActivationModule.Audience.Friends then
			table.insert(t, v)
		end
	end
	table.insert(t, universeActivationModule.Audience.Public)
	
	return t
end

local _ = function(p2) --[[ line: 90 | named "getGameDetailsNavigation" ]]
	if typeof(p2.clearAppScreens) == "function" then
		return p2
	end
	local cloned = table.clone(p2)
	
	function cloned.clearAppScreens(p3) --[[ line: 96 ]]
		-- upvalues: p2 (ref)
		p2.dispatch({ type = "ClearAppScreensAction", routeNames = p3 })
	end
	
	return cloned
end

local function PreviewButton(p4) --[[ line: 112 ]]
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), useStore (ref), useNavigation (ref), reactModule (ref), getRootNavigation (ref), openGameDetails (ref), button (ref), inputSize (ref), buttonVariant (ref), fillBehavior (ref)
	local var32 = if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({
		preview = localizationStringsModule.GAME_CONFIGURATION_PREVIEW
	}) else nil).preview else localizationStringsModule.GAME_CONFIGURATION_PREVIEW
	local var33 = useStore()
	local var34 = useNavigation()
	
	return reactModule.createElement(button, {
		LayoutOrder = 2,
		text = var32,
		size = inputSize.Medium,
		variant = buttonVariant.Standard,
		fillBehavior = fillBehavior.Fill,
		onActivated = reactModule.useCallback(function() --[[ line: 127 ]]
			-- upvalues: getRootNavigation (copy), var34 (ref), openGameDetails (copy), p4 (ref), var33 (ref)
			local var37
			local var35 = getRootNavigation(var34)
			local var36 = tostring(p4.target.universeId)
			
			if typeof(var35.clearAppScreens) == "function" then
				var37 = var35
			else
				local cloned = table.clone(var35)
				
				function cloned.clearAppScreens(p5) --[[ line: 96 ]]
					-- upvalues: var35 (ref)
					var35.dispatch({ type = "ClearAppScreensAction", routeNames = p5 })
				end
				
				var37 = cloned
			end
			openGameDetails(var36, var37, { source = "BuildExperiencePublish" })(var33)
		end, { var34, p4.target.universeId, var33 }),
		width = UDim.new(1, 0),
		testId = `{p4.actionsTestId}-preview`
	})
end

return function(p6) --[[ line: 146 | named "PublishFooter" ]]
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), useSharePublishedExperience (ref), signalsReactModule (ref), placeVersionHistoryModule (ref), reactModule (ref), signalsModule (ref), universeConfigurationModule (ref), fFlagEnableProvisionalRatingModule (ref), gameConfigurationLabelsModule (ref), universeActivationModule (ref), contentMaturityUtilsModule (ref), useOpenWebView (ref), fFlagEnableShareSheet (ref), sharePublishedExperience (ref), privacyType (ref), gameConfigurationActionsModule (ref), refreshPublishEligibilityModule (ref), getVersionInformationStoreModule (ref), sendBuildExperienceEventModule (ref), buildPublicAudiences (ref), fFlagBuildRehydrateOnPublishModule (ref), experienceGuidelinesModule (ref), t (ref), debug (ref), fFlagBuildPublishAccountTooNewErrorModule (ref), view (ref), privateShareTooltipModule (ref), fFlagBuildExperienceTooltipsLightDismissModule (ref), snackbar (ref), button (ref), inputSize (ref), buttonVariant (ref), fillBehavior (ref), PreviewButton (ref), friendsOnlyShareDialogModule (ref)
	local GAME_CONFIGURATION_PUBLISH_ACCOUNT_TOO_NEW_ERROR, GAME_CONFIGURATION_CREATOR_HUB, GAME_CONFIGURATION_LINK_COPIED, GAME_CONFIGURATION_PUBLISH, GAME_CONFIGURATION_PUBLISH_AUDIENCE_ERROR, GAME_CONFIGURATION_PUBLISH_ERROR, GAME_CONFIGURATION_PUBLISH_SUCCESS, GAME_CONFIGURATION_SHARE, GAME_CONFIGURATION_UPDATE_RATING
	local var39 = if fFlagBuildLocalization then useLocalization({
		accountTooNewError = localizationStringsModule.GAME_CONFIGURATION_PUBLISH_ACCOUNT_TOO_NEW_ERROR,
		creatorHub = localizationStringsModule.GAME_CONFIGURATION_CREATOR_HUB,
		linkCopied = localizationStringsModule.GAME_CONFIGURATION_LINK_COPIED,
		publish = localizationStringsModule.GAME_CONFIGURATION_PUBLISH,
		publishAudienceError = localizationStringsModule.GAME_CONFIGURATION_PUBLISH_AUDIENCE_ERROR,
		publishError = localizationStringsModule.GAME_CONFIGURATION_PUBLISH_ERROR,
		publishSuccess = localizationStringsModule.GAME_CONFIGURATION_PUBLISH_SUCCESS,
		share = localizationStringsModule.GAME_CONFIGURATION_SHARE,
		updateRating = localizationStringsModule.GAME_CONFIGURATION_UPDATE_RATING
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
	
	if fFlagBuildLocalization then
		GAME_CONFIGURATION_PUBLISH_ACCOUNT_TOO_NEW_ERROR = var39.accountTooNewError
		GAME_CONFIGURATION_CREATOR_HUB = var39.creatorHub
		GAME_CONFIGURATION_LINK_COPIED = var39.linkCopied
		GAME_CONFIGURATION_PUBLISH = var39.publish
		GAME_CONFIGURATION_PUBLISH_AUDIENCE_ERROR = var39.publishAudienceError
		GAME_CONFIGURATION_PUBLISH_ERROR = var39.publishError
		GAME_CONFIGURATION_PUBLISH_SUCCESS = var39.publishSuccess
		GAME_CONFIGURATION_SHARE = var39.share
		GAME_CONFIGURATION_UPDATE_RATING = var39.updateRating
	else
		GAME_CONFIGURATION_PUBLISH_ACCOUNT_TOO_NEW_ERROR = localizationStringsModule.GAME_CONFIGURATION_PUBLISH_ACCOUNT_TOO_NEW_ERROR
		GAME_CONFIGURATION_CREATOR_HUB = localizationStringsModule.GAME_CONFIGURATION_CREATOR_HUB
		GAME_CONFIGURATION_LINK_COPIED = localizationStringsModule.GAME_CONFIGURATION_LINK_COPIED
		GAME_CONFIGURATION_PUBLISH = localizationStringsModule.GAME_CONFIGURATION_PUBLISH
		GAME_CONFIGURATION_PUBLISH_AUDIENCE_ERROR = localizationStringsModule.GAME_CONFIGURATION_PUBLISH_AUDIENCE_ERROR
		GAME_CONFIGURATION_PUBLISH_ERROR = localizationStringsModule.GAME_CONFIGURATION_PUBLISH_ERROR
		GAME_CONFIGURATION_PUBLISH_SUCCESS = localizationStringsModule.GAME_CONFIGURATION_PUBLISH_SUCCESS
		GAME_CONFIGURATION_SHARE = localizationStringsModule.GAME_CONFIGURATION_SHARE
		GAME_CONFIGURATION_UPDATE_RATING = localizationStringsModule.GAME_CONFIGURATION_UPDATE_RATING
	end
	local var40 = useSharePublishedExperience(p6.target.universeId)
	local var41 = signalsReactModule.useSignalState(placeVersionHistoryModule.getPlaceVersionHistoryStore)
	local var42 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 192 ]]
		-- upvalues: p6 (ref), signalsModule (copy), var41 (ref)
		return if p6.target.placeId == nil then signalsModule.createSignal(nil) else var41.getAndFetchHistory(p6.target.placeId).data
	end, { var41, p6.target.placeId }))
	local var43 = if var42 then var42.placeVersions[1] else nil
	local var44 = signalsReactModule.useSignalState(universeConfigurationModule.getUniverseConfigurationStore)
	local var45 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 205 ]]
		-- upvalues: fFlagEnableProvisionalRatingModule (copy), signalsModule (copy), var44 (ref), p6 (ref)
		return if fFlagEnableProvisionalRatingModule then var44.getAndFetchSummary(p6.target.universeId).data else signalsModule.createSignal(nil)
	end, { var44, p6.target.universeId }))
	local audience = gameConfigurationLabelsModule.getAudience(signalsReactModule.useSignalState(var44.getAndFetchConfiguration(p6.target.universeId).data))
	local var47 = false
	local var48 = nil
	
	if fFlagEnableProvisionalRatingModule then
		local var49 = signalsReactModule.useSignalState(universeActivationModule.getUniverseActivationStore)
		var48 = var49
		var47 = reactModule.useMemo(function() --[[ line: 223 ]]
			-- upvalues: contentMaturityUtilsModule (copy), p6 (ref)
			return contentMaturityUtilsModule.isSealBroken(p6.target.universeId) and contentMaturityUtilsModule.isContentUnrated(p6.target.universeId)
		end, {
			signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 219 ]]
				-- upvalues: var49 (ref), p6 (ref)
				return var49.getAndFetchEligibility(p6.target.universeId)
			end, { var49, p6.target.universeId }).data),
			p6.target.universeId
		})
	end
	local var50 = useOpenWebView()
	local var51, var52 = reactModule.useState(false)
	local var53, var54 = reactModule.useState("")
	local var55, var56 = reactModule.useState(nil)
	local var57 = var53 == GAME_CONFIGURATION_PUBLISH_SUCCESS and (p6.target.placeId ~= nil and audience ~= nil)
	local var58 = reactModule.useCallback(function() --[[ line: 236 ]]
		-- upvalues: var54 (ref), var56 (ref)
		var54("")
		var56(nil)
	end, {})
	local var59 = reactModule.useCallback(function() --[[ line: 241 ]]
		-- upvalues: p6 (ref), var56 (ref), fFlagEnableShareSheet (copy), var40 (ref), sharePublishedExperience (copy), GAME_CONFIGURATION_LINK_COPIED (write), var54 (ref)
		if p6.target.placeId == nil then return end
		var56(nil)
		
		if fFlagEnableShareSheet then
			var40(p6.target.placeId)
			
			return
		end
		local var63 = sharePublishedExperience(p6.target.placeId)
		
		if var63 ~= nil and var63.copiedToClipboard and GAME_CONFIGURATION_LINK_COPIED ~= nil then
			var54(GAME_CONFIGURATION_LINK_COPIED)
		end
	end, { GAME_CONFIGURATION_LINK_COPIED, p6.target.placeId, var40 })
	local var60 = reactModule.useCallback(function() --[[ line: 258 ]]
		-- upvalues: audience (ref), privacyType (copy), var56 (ref), var55 (ref), var59 (ref)
		if audience == privacyType.Private then
			var56(if var55 == "private" then nil else "private")
			
			return
		elseif audience == privacyType.FriendsOnly then
			var56("friends")
			
			return
		elseif audience == privacyType.Public then
			var59()
		end
	end, { audience, var55, var59 })
	local var61 = reactModule.useCallback(function() --[[ line: 276 ]]
		-- upvalues: var56 (ref)
		var56(nil)
	end, {})
	local testId = `{p6.testId}.actions`
	
	return reactModule.createElement(view, {
		LayoutOrder = 3,
		tag = "col gap-small size-full-0 auto-y bg-surface-0"
	}, {
		PublishSnackbarWrapper = if var53 ~= "" then nil else reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row align-x-center size-full-0 auto-y padding-x-large"
		}, {
			PublishSnackbar = reactModule.createElement(privateShareTooltipModule, {
				LayoutOrder = 1,
				isOpen = var55 == "private" and audience == privacyType.Private,
				onPressedOutside = if fFlagBuildExperienceTooltipsLightDismissModule then var61 else nil
			}, {
				Snackbar = reactModule.createElement(snackbar, {
					LayoutOrder = 1,
					title = var53,
					action = if var57 then { text = GAME_CONFIGURATION_SHARE, onActivated = var60 } else nil,
					onClose = if var57 then nil else var58,
					testId = `{p6.testId}.publish-snackbar`
				})
			})
		}),
		Actions = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "row gap-small size-full-0 auto-y padding-y-medium",
			testId = testId
		}, {
			Publish = fFlagEnableProvisionalRatingModule and reactModule.createElement(button, {
				LayoutOrder = 1,
				text = if var47 then GAME_CONFIGURATION_UPDATE_RATING else GAME_CONFIGURATION_PUBLISH,
				size = inputSize.Medium,
				variant = buttonVariant.Emphasis,
				fillBehavior = fillBehavior.Fill,
				isDisabled = p6.target.placeId == nil,
				isLoading = var51,
				onActivated = if var47 then reactModule.useCallback(function() --[[ line: 280 ]]
					-- upvalues: var50 (ref), gameConfigurationActionsModule (copy), p6 (ref), GAME_CONFIGURATION_CREATOR_HUB (write), refreshPublishEligibilityModule (copy)
					var50(gameConfigurationActionsModule.getExperienceQuestionnaireUrl(p6.target.universeId), GAME_CONFIGURATION_CREATOR_HUB, function() --[[ line: 284 ]]
						-- upvalues: refreshPublishEligibilityModule (copy), p6 (copy)
						refreshPublishEligibilityModule(p6.target.universeId)
					end)
				end, {
					GAME_CONFIGURATION_CREATOR_HUB,
					var50,
					p6.target.universeId
				}) else reactModule.useCallback(function() --[[ line: 291 ]]
					-- upvalues: var51 (ref), p6 (ref), getVersionInformationStoreModule (copy), var43 (ref), sendBuildExperienceEventModule (copy), var52 (ref), var58 (ref), var45 (ref), fFlagEnableProvisionalRatingModule (copy), gameConfigurationActionsModule (copy), buildPublicAudiences (copy), fFlagBuildRehydrateOnPublishModule (copy), var48 (write), contentMaturityUtilsModule (copy), experienceGuidelinesModule (copy), t (copy), debug (copy), var44 (ref), var41 (ref), var54 (ref), GAME_CONFIGURATION_PUBLISH_SUCCESS (write), fFlagBuildPublishAccountTooNewErrorModule (copy), GAME_CONFIGURATION_PUBLISH_AUDIENCE_ERROR (write), GAME_CONFIGURATION_PUBLISH_ERROR (write), GAME_CONFIGURATION_PUBLISH_ACCOUNT_TOO_NEW_ERROR (write)
					if var51 then return end
					local placeId = p6.target.placeId
					
					if placeId == nil then return end
					local draft = getVersionInformationStoreModule().getDraft()
					local title = nil
					local description = nil
					
					if draft ~= nil and draft.placeId == placeId then
						title = if draft.title == "" then nil else draft.title
						description = if draft.description == "" then nil else draft.description
					elseif var43 ~= nil then
						title = var43.title
						description = var43.description
					end
					local var67
					sendBuildExperienceEventModule("PUBLISH_CLICK", {
						universeId = p6.target.universeId,
						placeId = placeId,
						conversationId = p6.target.sessionId
					})
					var52(true)
					var58()
					local var65 = "save_and_publish"
					
					local function publish(p7) --[[ line: 320 ]]
						-- upvalues: var65 (write), var45 (copy), fFlagEnableProvisionalRatingModule (copy), gameConfigurationActionsModule (copy), p6 (copy), placeId (ref), title (write), description (write), buildPublicAudiences (copy)
						var65 = "save_and_publish"
						p7 = p7 or var45
						
						return if fFlagEnableProvisionalRatingModule then gameConfigurationActionsModule.publishExperience({
							universeId = p6.target.universeId,
							placeId = placeId,
							title = title,
							description = description,
							isActive = p7 ~= nil and p7.isActive == true,
							audiences = buildPublicAudiences(if p7 then p7.audiences else nil)
						}) else gameConfigurationActionsModule.saveAndPublishPlace({
							placeId = placeId,
							title = title,
							description = description
						})
					end
					
					local _ = nil
					
					if fFlagEnableProvisionalRatingModule and fFlagBuildRehydrateOnPublishModule and var48 ~= nil then
						var65 = "refresh_eligibility"
						var67 = var48.refreshEligibility(p6.target.universeId):andThen(function() --[[ line: 341 ]]
							-- upvalues: contentMaturityUtilsModule (copy), p6 (copy), experienceGuidelinesModule (copy), t (copy), debug (copy), var65 (write), var44 (copy), publish (ref)
							if contentMaturityUtilsModule.isSealBroken(p6.target.universeId) and contentMaturityUtilsModule.isContentUnrated(p6.target.universeId) then
								return experienceGuidelinesModule.getExperienceGuidelinesStore().refreshDetailedGuidelines(p6.target.universeId):andThen(function() --[[ line: 348 ]]
									-- upvalues: t (copy)
									return t
								end, function(p8) --[[ line: 350 ]]
									-- upvalues: debug (copy), p6 (copy), t (copy)
									debug.log("warn", "build_experience content maturity refresh failed", {
										errorMessage = tostring(p8),
										universeId = p6.target.universeId
									})
									
									return t
								end)
							end
							var65 = "refresh_summary"
							
							return var44.refreshSummary(p6.target.universeId):andThen(function(p9) --[[ line: 365 ]]
								-- upvalues: publish (copy)
								return publish(p9)
							end)
						end)
					else
						var67 = publish()
					end
					var67:andThen(function(p11) --[[ line: 373 ]]
						-- upvalues: t (copy), getVersionInformationStoreModule (copy), placeId (ref), var41 (copy), var54 (copy), GAME_CONFIGURATION_PUBLISH_SUCCESS (copy)
						if p11 == t then return end
						if not (typeof(p11) ~= "table" and (p11.status == "success" and (typeof(p11.version) == "string" and p11.version ~= ""))) then
							error({
								errorMessage = "save_and_publish expected status=success and a non-empty version; " .. `got status={tostring(p11.status)}, version={tostring(p11.version)}`
							})
						end
						getVersionInformationStoreModule().clearDraft(placeId)
						var41.fetchHistory(placeId)
						var54(GAME_CONFIGURATION_PUBLISH_SUCCESS)
					end):catch(function(p10) --[[ line: 387 ]]
						-- upvalues: fFlagBuildRehydrateOnPublishModule (copy), gameConfigurationActionsModule (copy), fFlagBuildPublishAccountTooNewErrorModule (copy), GAME_CONFIGURATION_PUBLISH_AUDIENCE_ERROR (copy), GAME_CONFIGURATION_PUBLISH_ERROR (copy), GAME_CONFIGURATION_PUBLISH_ACCOUNT_TOO_NEW_ERROR (copy), getVersionInformationStoreModule (copy), placeId (ref), var41 (copy), debug (copy), var65 (write), p6 (copy), var54 (copy)
						local isTable = typeof(p10) == "table"
						local var70 = fFlagBuildRehydrateOnPublishModule and (isTable and p10.stage == gameConfigurationActionsModule.PublishFailureStage.SetAudience)
						local var71 = var70
						
						if var71 then
							local publishResult = p10.publishResult
							var71 = typeof(publishResult) ~= "table" and (publishResult.status == "success" and (typeof(publishResult.version) == "string" and publishResult.version ~= ""))
						end
						local var72 = if fFlagBuildPublishAccountTooNewErrorModule and (isTable and p10.responseCode == 16) then GAME_CONFIGURATION_PUBLISH_ACCOUNT_TOO_NEW_ERROR elseif var71 then GAME_CONFIGURATION_PUBLISH_AUDIENCE_ERROR else GAME_CONFIGURATION_PUBLISH_ERROR
						
						if var71 then
							getVersionInformationStoreModule().clearDraft(placeId)
							var41.fetchHistory(placeId)
						end
						debug.log("warn", "build_experience publish failed", {
							errorMessage = if isTable and p10.errorMessage ~= nil then tostring(p10.errorMessage) else tostring(p10),
							placeId = placeId,
							responseCode = if isTable then p10.responseCode else nil,
							stage = if var70 then gameConfigurationActionsModule.PublishFailureStage.SetAudience else var65,
							universeId = p6.target.universeId
						})
						var54(var72)
					end):finally(function() --[[ line: 421 ]]
						-- upvalues: var52 (copy)
						var52(false)
					end)
				end, {
					var58, var51, var41, p6.target.placeId, p6.target.sessionId,
					p6.target.universeId, var43, var48, var44, var45,
					GAME_CONFIGURATION_PUBLISH_ACCOUNT_TOO_NEW_ERROR,
					GAME_CONFIGURATION_PUBLISH_AUDIENCE_ERROR, GAME_CONFIGURATION_PUBLISH_ERROR,
					GAME_CONFIGURATION_PUBLISH_SUCCESS
				}),
				width = UDim.new(1, 0),
				testId = `{testId}-publish`
			}),
			Preview = if p6.showPreviewButton == false then nil else reactModule.createElement(PreviewButton, { target = p6.target, actionsTestId = testId })
		}),
		FriendsOnlyShareDialog = if var55 == "friends" and audience == privacyType.FriendsOnly then reactModule.createElement(friendsOnlyShareDialogModule, { onCancel = var61, onShare = var59 }) else nil
	})
end