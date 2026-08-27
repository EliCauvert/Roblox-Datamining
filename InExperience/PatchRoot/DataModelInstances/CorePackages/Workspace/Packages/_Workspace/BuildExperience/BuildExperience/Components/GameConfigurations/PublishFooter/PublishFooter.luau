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

local function _(p1)
	return typeof(p1) == "table" and (p1.status == "success" and (typeof(p1.version) == "string" and p1.version ~= ""))
end

local function buildPublicAudiences(p1)
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

local _ = function(p2)
	if typeof(p2.clearAppScreens) == "function" then
		return p2
	end
	local cloned = table.clone(p2)
	
	function cloned.clearAppScreens(p3)
		-- upvalues: p2 (ref)
		p2.dispatch({ type = "ClearAppScreensAction", routeNames = p3 })
	end
	
	return cloned
end

local function PreviewButton(p2)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), useStore (ref), useNavigation (ref), reactModule (ref), getRootNavigation (ref), openGameDetails (ref), button (ref), inputSize (ref), buttonVariant (ref), fillBehavior (ref)
	local var1 = if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({
		preview = localizationStringsModule.GAME_CONFIGURATION_PREVIEW
	}) else nil).preview else localizationStringsModule.GAME_CONFIGURATION_PREVIEW
	local var2 = useStore()
	local var3 = useNavigation()
	
	return reactModule.createElement(button, {
		LayoutOrder = 2,
		text = var1,
		size = inputSize.Medium,
		variant = buttonVariant.Standard,
		fillBehavior = fillBehavior.Fill,
		onActivated = reactModule.useCallback(function()
			-- upvalues: getRootNavigation (copy), var3 (ref), openGameDetails (copy), p2 (ref), var2 (ref)
			local var4
			local var5 = getRootNavigation(var3)
			local var6 = tostring(p2.target.universeId)
			
			if typeof(var5.clearAppScreens) == "function" then
				var4 = var5
			else
				local cloned = table.clone(var5)
				
				function cloned.clearAppScreens(p3)
					-- upvalues: var5 (ref)
					var5.dispatch({ type = "ClearAppScreensAction", routeNames = p3 })
				end
				
				var4 = cloned
			end
			openGameDetails(var6, var4, { source = "BuildExperiencePublish" })(var2)
		end, { var3, p2.target.universeId, var2 }),
		width = UDim.new(1, 0),
		testId = `{p2.actionsTestId}-preview`
	})
end

return function(p2)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), useSharePublishedExperience (ref), signalsReactModule (ref), placeVersionHistoryModule (ref), reactModule (ref), signalsModule (ref), universeConfigurationModule (ref), fFlagEnableProvisionalRatingModule (ref), gameConfigurationLabelsModule (ref), universeActivationModule (ref), contentMaturityUtilsModule (ref), useOpenWebView (ref), fFlagEnableShareSheet (ref), sharePublishedExperience (ref), privacyType (ref), gameConfigurationActionsModule (ref), refreshPublishEligibilityModule (ref), getVersionInformationStoreModule (ref), sendBuildExperienceEventModule (ref), buildPublicAudiences (ref), fFlagBuildRehydrateOnPublishModule (ref), experienceGuidelinesModule (ref), t (ref), debug (ref), fFlagBuildPublishAccountTooNewErrorModule (ref), view (ref), privateShareTooltipModule (ref), fFlagBuildExperienceTooltipsLightDismissModule (ref), snackbar (ref), button (ref), inputSize (ref), buttonVariant (ref), fillBehavior (ref), PreviewButton (ref), friendsOnlyShareDialogModule (ref)
	local GAME_CONFIGURATION_PUBLISH_ACCOUNT_TOO_NEW_ERROR, GAME_CONFIGURATION_CREATOR_HUB, GAME_CONFIGURATION_LINK_COPIED, GAME_CONFIGURATION_PUBLISH, GAME_CONFIGURATION_PUBLISH_AUDIENCE_ERROR, GAME_CONFIGURATION_PUBLISH_ERROR, GAME_CONFIGURATION_PUBLISH_SUCCESS, GAME_CONFIGURATION_SHARE, GAME_CONFIGURATION_UPDATE_RATING
	local var1 = if fFlagBuildLocalization then useLocalization({
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
		GAME_CONFIGURATION_PUBLISH_ACCOUNT_TOO_NEW_ERROR = var1.accountTooNewError
		GAME_CONFIGURATION_CREATOR_HUB = var1.creatorHub
		GAME_CONFIGURATION_LINK_COPIED = var1.linkCopied
		GAME_CONFIGURATION_PUBLISH = var1.publish
		GAME_CONFIGURATION_PUBLISH_AUDIENCE_ERROR = var1.publishAudienceError
		GAME_CONFIGURATION_PUBLISH_ERROR = var1.publishError
		GAME_CONFIGURATION_PUBLISH_SUCCESS = var1.publishSuccess
		GAME_CONFIGURATION_SHARE = var1.share
		GAME_CONFIGURATION_UPDATE_RATING = var1.updateRating
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
	local var2 = useSharePublishedExperience(p2.target.universeId)
	local var3 = signalsReactModule.useSignalState(placeVersionHistoryModule.getPlaceVersionHistoryStore)
	local var4 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: p2 (ref), signalsModule (copy), var3 (ref)
		return if p2.target.placeId == nil then signalsModule.createSignal(nil) else var3.getAndFetchHistory(p2.target.placeId).data
	end, { var3, p2.target.placeId }))
	local var5 = if var4 then var4.placeVersions[1] else nil
	local var6 = signalsReactModule.useSignalState(universeConfigurationModule.getUniverseConfigurationStore)
	local var7 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: fFlagEnableProvisionalRatingModule (copy), signalsModule (copy), var6 (ref), p2 (ref)
		return if fFlagEnableProvisionalRatingModule then var6.getAndFetchSummary(p2.target.universeId).data else signalsModule.createSignal(nil)
	end, { var6, p2.target.universeId }))
	local audience = gameConfigurationLabelsModule.getAudience(signalsReactModule.useSignalState(var6.getAndFetchConfiguration(p2.target.universeId).data))
	local var8 = false
	local var9 = nil
	
	if fFlagEnableProvisionalRatingModule then
		local var10 = signalsReactModule.useSignalState(universeActivationModule.getUniverseActivationStore)
		var9 = var10
		var8 = reactModule.useMemo(function()
			-- upvalues: contentMaturityUtilsModule (copy), p2 (ref)
			return contentMaturityUtilsModule.isSealBroken(p2.target.universeId) and contentMaturityUtilsModule.isContentUnrated(p2.target.universeId)
		end, {
			signalsReactModule.useSignalState(reactModule.useMemo(function()
				-- upvalues: var10 (ref), p2 (ref)
				return var10.getAndFetchEligibility(p2.target.universeId)
			end, { var10, p2.target.universeId }).data),
			p2.target.universeId
		})
	end
	local var11 = useOpenWebView()
	local var12, var13 = reactModule.useState(false)
	local var14, var15 = reactModule.useState("")
	local var16, var17 = reactModule.useState(nil)
	local var18 = var14 == GAME_CONFIGURATION_PUBLISH_SUCCESS and (p2.target.placeId ~= nil and audience ~= nil)
	local var19 = reactModule.useCallback(function()
		-- upvalues: var15 (ref), var17 (ref)
		var15("")
		var17(nil)
	end, {})
	local var20 = reactModule.useCallback(function()
		-- upvalues: p2 (ref), var17 (ref), fFlagEnableShareSheet (copy), var2 (ref), sharePublishedExperience (copy), GAME_CONFIGURATION_LINK_COPIED (write), var15 (ref)
		if p2.target.placeId == nil then return end
		var17(nil)
		
		if fFlagEnableShareSheet then
			var2(p2.target.placeId)
			
			return
		end
		local var21 = sharePublishedExperience(p2.target.placeId)
		
		if var21 ~= nil and var21.copiedToClipboard and GAME_CONFIGURATION_LINK_COPIED ~= nil then
			var15(GAME_CONFIGURATION_LINK_COPIED)
		end
	end, { GAME_CONFIGURATION_LINK_COPIED, p2.target.placeId, var2 })
	local var21 = reactModule.useCallback(function()
		-- upvalues: audience (ref), privacyType (copy), var17 (ref), var16 (ref), var20 (ref)
		if audience == privacyType.Private then
			var17(if var16 == "private" then nil else "private")
			
			return
		elseif audience == privacyType.FriendsOnly then
			var17("friends")
			
			return
		elseif audience == privacyType.Public then
			var20()
		end
	end, { audience, var16, var20 })
	local var22 = reactModule.useCallback(function()
		-- upvalues: var17 (ref)
		var17(nil)
	end, {})
	local testId = `{p2.testId}.actions`
	
	return reactModule.createElement(view, {
		LayoutOrder = 3,
		tag = "col gap-small size-full-0 auto-y bg-surface-0"
	}, {
		PublishSnackbarWrapper = if var14 ~= "" then nil else reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row align-x-center size-full-0 auto-y padding-x-large"
		}, {
			PublishSnackbar = reactModule.createElement(privateShareTooltipModule, {
				LayoutOrder = 1,
				isOpen = var16 == "private" and audience == privacyType.Private,
				onPressedOutside = if fFlagBuildExperienceTooltipsLightDismissModule then var22 else nil
			}, {
				Snackbar = reactModule.createElement(snackbar, {
					LayoutOrder = 1,
					title = var14,
					action = if var18 then { text = GAME_CONFIGURATION_SHARE, onActivated = var21 } else nil,
					onClose = if var18 then nil else var19,
					testId = `{p2.testId}.publish-snackbar`
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
				text = if var8 then GAME_CONFIGURATION_UPDATE_RATING else GAME_CONFIGURATION_PUBLISH,
				size = inputSize.Medium,
				variant = buttonVariant.Emphasis,
				fillBehavior = fillBehavior.Fill,
				isDisabled = p2.target.placeId == nil,
				isLoading = var12,
				onActivated = if var8 then reactModule.useCallback(function()
					-- upvalues: var11 (ref), gameConfigurationActionsModule (copy), p2 (ref), GAME_CONFIGURATION_CREATOR_HUB (write), refreshPublishEligibilityModule (copy)
					var11(gameConfigurationActionsModule.getExperienceQuestionnaireUrl(p2.target.universeId), GAME_CONFIGURATION_CREATOR_HUB, function()
						-- upvalues: refreshPublishEligibilityModule (copy), p2 (copy)
						refreshPublishEligibilityModule(p2.target.universeId)
					end)
				end, {
					GAME_CONFIGURATION_CREATOR_HUB,
					var11,
					p2.target.universeId
				}) else reactModule.useCallback(function()
					-- upvalues: var12 (ref), p2 (ref), getVersionInformationStoreModule (copy), var5 (ref), sendBuildExperienceEventModule (copy), var13 (ref), var19 (ref), var7 (ref), fFlagEnableProvisionalRatingModule (copy), gameConfigurationActionsModule (copy), buildPublicAudiences (copy), fFlagBuildRehydrateOnPublishModule (copy), var9 (write), contentMaturityUtilsModule (copy), experienceGuidelinesModule (copy), t (copy), debug (copy), var6 (ref), var3 (ref), var15 (ref), GAME_CONFIGURATION_PUBLISH_SUCCESS (write), fFlagBuildPublishAccountTooNewErrorModule (copy), GAME_CONFIGURATION_PUBLISH_AUDIENCE_ERROR (write), GAME_CONFIGURATION_PUBLISH_ERROR (write), GAME_CONFIGURATION_PUBLISH_ACCOUNT_TOO_NEW_ERROR (write)
					if var12 then return end
					local placeId = p2.target.placeId
					
					if placeId == nil then return end
					local draft = getVersionInformationStoreModule().getDraft()
					local title = nil
					local description = nil
					
					if draft ~= nil and draft.placeId == placeId then
						title = if draft.title == "" then nil else draft.title
						description = if draft.description == "" then nil else draft.description
					elseif var5 ~= nil then
						title = var5.title
						description = var5.description
					end
					local var23
					sendBuildExperienceEventModule("PUBLISH_CLICK", {
						universeId = p2.target.universeId,
						placeId = placeId,
						conversationId = p2.target.sessionId
					})
					var13(true)
					var19()
					local var24 = "save_and_publish"
					
					local function publish(p3)
						-- upvalues: var24 (write), var7 (copy), fFlagEnableProvisionalRatingModule (copy), gameConfigurationActionsModule (copy), p2 (copy), placeId (ref), title (write), description (write), buildPublicAudiences (copy)
						var24 = "save_and_publish"
						p3 = p3 or var7
						
						return if fFlagEnableProvisionalRatingModule then gameConfigurationActionsModule.publishExperience({
							universeId = p2.target.universeId,
							placeId = placeId,
							title = title,
							description = description,
							isActive = p3 ~= nil and p3.isActive == true,
							audiences = buildPublicAudiences(if p3 then p3.audiences else nil)
						}) else gameConfigurationActionsModule.saveAndPublishPlace({
							placeId = placeId,
							title = title,
							description = description
						})
					end
					
					local _ = nil
					
					if fFlagEnableProvisionalRatingModule and fFlagBuildRehydrateOnPublishModule and var9 ~= nil then
						var24 = "refresh_eligibility"
						var23 = var9.refreshEligibility(p2.target.universeId):andThen(function()
							-- upvalues: contentMaturityUtilsModule (copy), p2 (copy), experienceGuidelinesModule (copy), t (copy), debug (copy), var24 (write), var6 (copy), publish (ref)
							if contentMaturityUtilsModule.isSealBroken(p2.target.universeId) and contentMaturityUtilsModule.isContentUnrated(p2.target.universeId) then
								return experienceGuidelinesModule.getExperienceGuidelinesStore().refreshDetailedGuidelines(p2.target.universeId):andThen(function()
									-- upvalues: t (copy)
									return t
								end, function(p3)
									-- upvalues: debug (copy), p2 (copy), t (copy)
									debug.log("warn", "build_experience content maturity refresh failed", {
										errorMessage = tostring(p3),
										universeId = p2.target.universeId
									})
									
									return t
								end)
							end
							var24 = "refresh_summary"
							
							return var6.refreshSummary(p2.target.universeId):andThen(function(p3)
								-- upvalues: publish (copy)
								return publish(p3)
							end)
						end)
					else
						var23 = publish()
					end
					var23:andThen(function(p3)
						-- upvalues: t (copy), getVersionInformationStoreModule (copy), placeId (ref), var3 (copy), var15 (copy), GAME_CONFIGURATION_PUBLISH_SUCCESS (copy)
						if p3 == t then return end
						if not (typeof(p3) ~= "table" and (p3.status == "success" and (typeof(p3.version) == "string" and p3.version ~= ""))) then
							error({
								errorMessage = "save_and_publish expected status=success and a non-empty version; " .. `got status={tostring(p3.status)}, version={tostring(p3.version)}`
							})
						end
						getVersionInformationStoreModule().clearDraft(placeId)
						var3.fetchHistory(placeId)
						var15(GAME_CONFIGURATION_PUBLISH_SUCCESS)
					end):catch(function(p3)
						-- upvalues: fFlagBuildRehydrateOnPublishModule (copy), gameConfigurationActionsModule (copy), fFlagBuildPublishAccountTooNewErrorModule (copy), GAME_CONFIGURATION_PUBLISH_AUDIENCE_ERROR (copy), GAME_CONFIGURATION_PUBLISH_ERROR (copy), GAME_CONFIGURATION_PUBLISH_ACCOUNT_TOO_NEW_ERROR (copy), getVersionInformationStoreModule (copy), placeId (ref), var3 (copy), debug (copy), var24 (write), p2 (copy), var15 (copy)
						local isTable = typeof(p3) == "table"
						local var25 = fFlagBuildRehydrateOnPublishModule and (isTable and p3.stage == gameConfigurationActionsModule.PublishFailureStage.SetAudience)
						local var26 = var25
						
						if var26 then
							local publishResult = p3.publishResult
							var26 = typeof(publishResult) ~= "table" and (publishResult.status == "success" and (typeof(publishResult.version) == "string" and publishResult.version ~= ""))
						end
						local var27 = if fFlagBuildPublishAccountTooNewErrorModule and (isTable and p3.responseCode == 16) then GAME_CONFIGURATION_PUBLISH_ACCOUNT_TOO_NEW_ERROR elseif var26 then GAME_CONFIGURATION_PUBLISH_AUDIENCE_ERROR else GAME_CONFIGURATION_PUBLISH_ERROR
						
						if var26 then
							getVersionInformationStoreModule().clearDraft(placeId)
							var3.fetchHistory(placeId)
						end
						debug.log("warn", "build_experience publish failed", {
							errorMessage = if isTable and p3.errorMessage ~= nil then tostring(p3.errorMessage) else tostring(p3),
							placeId = placeId,
							responseCode = if isTable then p3.responseCode else nil,
							stage = if var25 then gameConfigurationActionsModule.PublishFailureStage.SetAudience else var24,
							universeId = p2.target.universeId
						})
						var15(var27)
					end):finally(function()
						-- upvalues: var13 (copy)
						var13(false)
					end)
				end, {
					var19, var12, var3, p2.target.placeId, p2.target.sessionId,
					p2.target.universeId, var5, var9, var6, var7,
					GAME_CONFIGURATION_PUBLISH_ACCOUNT_TOO_NEW_ERROR,
					GAME_CONFIGURATION_PUBLISH_AUDIENCE_ERROR, GAME_CONFIGURATION_PUBLISH_ERROR,
					GAME_CONFIGURATION_PUBLISH_SUCCESS
				}),
				width = UDim.new(1, 0),
				testId = `{testId}-publish`
			}),
			Preview = if p2.showPreviewButton == false then nil else reactModule.createElement(PreviewButton, { target = p2.target, actionsTestId = testId })
		}),
		FriendsOnlyShareDialog = if var16 == "friends" and audience == privacyType.FriendsOnly then reactModule.createElement(friendsOnlyShareDialogModule, { onCancel = var22, onShare = var20 }) else nil
	})
end