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
local isMenuPublishPublicModule = require(script.Parent.isMenuPublishPublic)
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
local fFlagBuildPublishNavigationSheetModule = require(buildExperience.Flags.FFlagBuildPublishNavigationSheet)
local fFlagBuildPublishAccountTooNewErrorModule = require(buildExperience.Flags.FFlagBuildPublishAccountTooNewError)
local fFlagBuildRehydrateOnPublishModule = require(buildExperience.Flags.FFlagBuildRehydrateOnPublish)
local fFlagBuildExperienceTooltipsLightDismissModule = require(buildExperience.Flags.FFlagBuildExperienceTooltipsLightDismiss)
local fFlagBuildAdUpsellModule = require(buildExperience.Flags.FFlagBuildAdUpsell)
local var1 = if fFlagBuildAdUpsellModule then require(buildExperience.Stores.GetAdUpsellEventStore) else nil
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
	local var2 = if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({
		preview = localizationStringsModule.GAME_CONFIGURATION_PREVIEW
	}) else nil).preview else localizationStringsModule.GAME_CONFIGURATION_PREVIEW
	local var3 = useStore()
	local var4 = useNavigation()
	local onPreview = p2.onPreview
	
	return reactModule.createElement(button, {
		LayoutOrder = 2,
		text = var2,
		size = inputSize.Medium,
		variant = buttonVariant.Standard,
		fillBehavior = fillBehavior.Fill,
		onActivated = reactModule.useCallback(function()
			-- upvalues: getRootNavigation (copy), var4 (ref), openGameDetails (copy), p2 (ref), var3 (ref), onPreview (ref)
			local var5
			local var6 = getRootNavigation(var4)
			local var7 = tostring(p2.target.universeId)
			
			if typeof(var6.clearAppScreens) == "function" then
				var5 = var6
			else
				local cloned = table.clone(var6)
				
				function cloned.clearAppScreens(p3)
					-- upvalues: var6 (ref)
					var6.dispatch({ type = "ClearAppScreensAction", routeNames = p3 })
				end
				
				var5 = cloned
			end
			openGameDetails(var7, var5, { source = "BuildExperiencePublish" })(var3)
			
			if onPreview then
				onPreview()
			end
		end, { var4, p2.target.universeId, var3, onPreview }),
		width = UDim.new(1, 0),
		testId = `{p2.actionsTestId}-preview`
	})
end

return function(p2)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), useSharePublishedExperience (ref), signalsReactModule (ref), placeVersionHistoryModule (ref), reactModule (ref), signalsModule (ref), universeConfigurationModule (ref), fFlagEnableProvisionalRatingModule (ref), gameConfigurationLabelsModule (ref), universeActivationModule (ref), contentMaturityUtilsModule (ref), useOpenWebView (ref), fFlagEnableShareSheet (ref), sharePublishedExperience (ref), privacyType (ref), gameConfigurationActionsModule (ref), refreshPublishEligibilityModule (ref), getVersionInformationStoreModule (ref), sendBuildExperienceEventModule (ref), var1 (ref), fFlagBuildAdUpsellModule (ref), isMenuPublishPublicModule (ref), buildPublicAudiences (ref), fFlagBuildRehydrateOnPublishModule (ref), experienceGuidelinesModule (ref), t (ref), debug (ref), fFlagBuildPublishAccountTooNewErrorModule (ref), view (ref), fFlagBuildPublishNavigationSheetModule (ref), privateShareTooltipModule (ref), fFlagBuildExperienceTooltipsLightDismissModule (ref), snackbar (ref), button (ref), inputSize (ref), buttonVariant (ref), fillBehavior (ref), PreviewButton (ref), friendsOnlyShareDialogModule (ref)
	local GAME_CONFIGURATION_PUBLISH_ACCOUNT_TOO_NEW_ERROR, GAME_CONFIGURATION_CREATOR_HUB, GAME_CONFIGURATION_LINK_COPIED, GAME_CONFIGURATION_PUBLISH, GAME_CONFIGURATION_PUBLISH_AUDIENCE_ERROR, GAME_CONFIGURATION_PUBLISH_ERROR, GAME_CONFIGURATION_PUBLISH_SUCCESS, GAME_CONFIGURATION_SHARE, GAME_CONFIGURATION_UPDATE_RATING
	local var2 = if fFlagBuildLocalization then useLocalization({
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
		GAME_CONFIGURATION_PUBLISH_ACCOUNT_TOO_NEW_ERROR = var2.accountTooNewError
		GAME_CONFIGURATION_CREATOR_HUB = var2.creatorHub
		GAME_CONFIGURATION_LINK_COPIED = var2.linkCopied
		GAME_CONFIGURATION_PUBLISH = var2.publish
		GAME_CONFIGURATION_PUBLISH_AUDIENCE_ERROR = var2.publishAudienceError
		GAME_CONFIGURATION_PUBLISH_ERROR = var2.publishError
		GAME_CONFIGURATION_PUBLISH_SUCCESS = var2.publishSuccess
		GAME_CONFIGURATION_SHARE = var2.share
		GAME_CONFIGURATION_UPDATE_RATING = var2.updateRating
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
	local var3 = useSharePublishedExperience(p2.target.universeId)
	local var4 = signalsReactModule.useSignalState(placeVersionHistoryModule.getPlaceVersionHistoryStore)
	local var5 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: p2 (ref), signalsModule (copy), var4 (ref)
		return if p2.target.placeId == nil then signalsModule.createSignal(nil) else var4.getAndFetchHistory(p2.target.placeId).data
	end, { var4, p2.target.placeId }))
	local var6 = if var5 then var5.placeVersions[1] else nil
	local var7 = signalsReactModule.useSignalState(universeConfigurationModule.getUniverseConfigurationStore)
	local var8 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: fFlagEnableProvisionalRatingModule (copy), signalsModule (copy), var7 (ref), p2 (ref)
		return if fFlagEnableProvisionalRatingModule then var7.getAndFetchSummary(p2.target.universeId).data else signalsModule.createSignal(nil)
	end, { var7, p2.target.universeId }))
	local audience = gameConfigurationLabelsModule.getAudience(signalsReactModule.useSignalState(var7.getAndFetchConfiguration(p2.target.universeId).data))
	local var9 = false
	local var10 = nil
	
	if fFlagEnableProvisionalRatingModule then
		local var11 = signalsReactModule.useSignalState(universeActivationModule.getUniverseActivationStore)
		var10 = var11
		var9 = reactModule.useMemo(function()
			-- upvalues: contentMaturityUtilsModule (copy), p2 (ref)
			return contentMaturityUtilsModule.isSealBroken(p2.target.universeId) and contentMaturityUtilsModule.isContentUnrated(p2.target.universeId)
		end, {
			signalsReactModule.useSignalState(reactModule.useMemo(function()
				-- upvalues: var11 (ref), p2 (ref)
				return var11.getAndFetchEligibility(p2.target.universeId)
			end, { var11, p2.target.universeId }).data),
			p2.target.universeId
		})
	end
	local var12 = useOpenWebView()
	local var13, var14 = reactModule.useState(false)
	local var15, var16 = reactModule.useState("")
	local var17, var18 = reactModule.useState(nil)
	local var19 = var15 == GAME_CONFIGURATION_PUBLISH_SUCCESS and (p2.target.placeId ~= nil and audience ~= nil)
	local var20 = reactModule.useCallback(function()
		-- upvalues: var16 (ref), var18 (ref)
		var16("")
		var18(nil)
	end, {})
	local var21 = reactModule.useCallback(function()
		-- upvalues: p2 (ref), var18 (ref), fFlagEnableShareSheet (copy), var3 (ref), sharePublishedExperience (copy), GAME_CONFIGURATION_LINK_COPIED (write), var16 (ref)
		if p2.target.placeId == nil then return end
		var18(nil)
		
		if fFlagEnableShareSheet then
			var3(p2.target.placeId)
			
			return
		end
		local var22 = sharePublishedExperience(p2.target.placeId)
		
		if var22 ~= nil and var22.copiedToClipboard and GAME_CONFIGURATION_LINK_COPIED ~= nil then
			var16(GAME_CONFIGURATION_LINK_COPIED)
		end
	end, { GAME_CONFIGURATION_LINK_COPIED, p2.target.placeId, var3 })
	local var22 = reactModule.useCallback(function()
		-- upvalues: audience (ref), privacyType (copy), var18 (ref), var17 (ref), var21 (ref)
		if audience == privacyType.Private then
			var18(if var17 == "private" then nil else "private")
			
			return
		elseif audience == privacyType.FriendsOnly then
			var18("friends")
			
			return
		elseif audience == privacyType.Public then
			var21()
		end
	end, { audience, var17, var21 })
	local var23 = reactModule.useCallback(function()
		-- upvalues: var18 (ref)
		var18(nil)
	end, {})
	local testId = `{p2.testId}.actions`
	
	return reactModule.createElement(view, {
		LayoutOrder = 3,
		tag = {
			["col gap-small size-full-0 auto-y"] = true,
			["bg-surface-0"] = not fFlagBuildPublishNavigationSheetModule
		}
	}, {
		PublishSnackbarWrapper = if var15 ~= "" then nil else reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row align-x-center size-full-0 auto-y padding-x-large"
		}, {
			PublishSnackbar = reactModule.createElement(privateShareTooltipModule, {
				LayoutOrder = 1,
				isOpen = var17 == "private" and audience == privacyType.Private,
				onPressedOutside = if fFlagBuildExperienceTooltipsLightDismissModule then var23 else nil
			}, {
				Snackbar = reactModule.createElement(snackbar, {
					LayoutOrder = 1,
					title = var15,
					action = if var19 then { text = GAME_CONFIGURATION_SHARE, onActivated = var22 } else nil,
					onClose = if var19 then nil else var20,
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
				text = if var9 then GAME_CONFIGURATION_UPDATE_RATING else GAME_CONFIGURATION_PUBLISH,
				size = inputSize.Medium,
				variant = buttonVariant.Emphasis,
				fillBehavior = fillBehavior.Fill,
				isDisabled = p2.target.placeId == nil,
				isLoading = var13,
				onActivated = if var9 then reactModule.useCallback(function()
					-- upvalues: var12 (ref), gameConfigurationActionsModule (copy), p2 (ref), GAME_CONFIGURATION_CREATOR_HUB (write), refreshPublishEligibilityModule (copy)
					var12(gameConfigurationActionsModule.getExperienceQuestionnaireUrl(p2.target.universeId), GAME_CONFIGURATION_CREATOR_HUB, function()
						-- upvalues: refreshPublishEligibilityModule (copy), p2 (copy)
						refreshPublishEligibilityModule(p2.target.universeId)
					end)
				end, {
					GAME_CONFIGURATION_CREATOR_HUB,
					var12,
					p2.target.universeId
				}) else reactModule.useCallback(function()
					-- upvalues: var13 (ref), p2 (ref), getVersionInformationStoreModule (copy), var6 (ref), sendBuildExperienceEventModule (copy), var14 (ref), var20 (ref), var1 (copy), var8 (ref), fFlagBuildAdUpsellModule (copy), isMenuPublishPublicModule (copy), audience (ref), privacyType (copy), fFlagEnableProvisionalRatingModule (copy), gameConfigurationActionsModule (copy), buildPublicAudiences (copy), fFlagBuildRehydrateOnPublishModule (copy), var10 (write), contentMaturityUtilsModule (copy), experienceGuidelinesModule (copy), t (copy), debug (copy), var7 (ref), var4 (ref), var16 (ref), GAME_CONFIGURATION_PUBLISH_SUCCESS (write), fFlagBuildPublishAccountTooNewErrorModule (copy), GAME_CONFIGURATION_PUBLISH_AUDIENCE_ERROR (write), GAME_CONFIGURATION_PUBLISH_ERROR (write), GAME_CONFIGURATION_PUBLISH_ACCOUNT_TOO_NEW_ERROR (write)
					if var13 then return end
					local placeId = p2.target.placeId
					
					if placeId == nil then return end
					local draft = getVersionInformationStoreModule().getDraft()
					local title = nil
					local description = nil
					
					if draft ~= nil and draft.placeId == placeId then
						title = if draft.title == "" then nil else draft.title
						description = if draft.description == "" then nil else draft.description
					elseif var6 ~= nil then
						title = var6.title
						description = var6.description
					end
					local var24
					sendBuildExperienceEventModule("PUBLISH_CLICK", {
						universeId = p2.target.universeId,
						placeId = placeId,
						conversationId = p2.target.sessionId
					})
					var14(true)
					var20()
					local var25 = "save_and_publish"
					local var26 = false
					
					local function _(p3)
						-- upvalues: var1 (copy), p2 (copy), var26 (write)
						if typeof(p3) ~= "table" and (p3.status == "success" and (typeof(p3.version) == "string" and p3.version ~= "")) then
							var1(false).reportMenuPublish(p2.target.universeId, p2.target.sessionId, p3.version, var26)
							
							return
						end
					end
					
					local function publish(p3)
						-- upvalues: var25 (write), var8 (copy), fFlagBuildAdUpsellModule (copy), var26 (write), isMenuPublishPublicModule (copy), audience (copy), privacyType (copy), fFlagEnableProvisionalRatingModule (copy), gameConfigurationActionsModule (copy), p2 (copy), placeId (ref), title (write), description (write), buildPublicAudiences (copy)
						var25 = "save_and_publish"
						p3 = p3 or var8
						
						if fFlagBuildAdUpsellModule then
							var26 = isMenuPublishPublicModule({
								isCurrentlyPublic = audience == privacyType.Public,
								isActive = p3 ~= nil and p3.isActive == true
							})
						end
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
					
					if fFlagEnableProvisionalRatingModule and fFlagBuildRehydrateOnPublishModule and var10 ~= nil then
						var25 = "refresh_eligibility"
						var24 = var10.refreshEligibility(p2.target.universeId):andThen(function()
							-- upvalues: contentMaturityUtilsModule (copy), p2 (copy), experienceGuidelinesModule (copy), t (copy), debug (copy), var25 (write), var7 (copy), publish (ref)
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
							var25 = "refresh_summary"
							
							return var7.refreshSummary(p2.target.universeId):andThen(function(p3)
								-- upvalues: publish (copy)
								return publish(p3)
							end)
						end)
					else
						var24 = publish()
					end
					var24:andThen(function(p3)
						-- upvalues: t (copy), fFlagBuildAdUpsellModule (copy), var1 (copy), p2 (copy), var26 (write), getVersionInformationStoreModule (copy), placeId (ref), var4 (copy), var16 (copy), GAME_CONFIGURATION_PUBLISH_SUCCESS (copy)
						if p3 == t then return end
						if not (typeof(p3) ~= "table" and (p3.status == "success" and (typeof(p3.version) == "string" and p3.version ~= ""))) then
							error({
								errorMessage = "save_and_publish expected status=success and a non-empty version; " .. `got status={tostring(p3.status)}, version={tostring(p3.version)}`
							})
						end
						if fFlagBuildAdUpsellModule and (typeof(p3) ~= "table" and (p3.status == "success" and (typeof(p3.version) == "string" and p3.version ~= ""))) then
							var1(false).reportMenuPublish(p2.target.universeId, p2.target.sessionId, p3.version, var26)
						end
						getVersionInformationStoreModule().clearDraft(placeId)
						var4.fetchHistory(placeId)
						var16(GAME_CONFIGURATION_PUBLISH_SUCCESS)
					end):catch(function(p3)
						-- upvalues: fFlagBuildRehydrateOnPublishModule (copy), gameConfigurationActionsModule (copy), fFlagBuildPublishAccountTooNewErrorModule (copy), GAME_CONFIGURATION_PUBLISH_AUDIENCE_ERROR (copy), GAME_CONFIGURATION_PUBLISH_ERROR (copy), GAME_CONFIGURATION_PUBLISH_ACCOUNT_TOO_NEW_ERROR (copy), getVersionInformationStoreModule (copy), placeId (ref), var4 (copy), debug (copy), var25 (write), p2 (copy), var16 (copy)
						local isTable = typeof(p3) == "table"
						local var27 = fFlagBuildRehydrateOnPublishModule and (isTable and p3.stage == gameConfigurationActionsModule.PublishFailureStage.SetAudience)
						local var28 = var27
						
						if var28 then
							local publishResult = p3.publishResult
							var28 = typeof(publishResult) ~= "table" and (publishResult.status == "success" and (typeof(publishResult.version) == "string" and publishResult.version ~= ""))
						end
						local var29 = if fFlagBuildPublishAccountTooNewErrorModule and (isTable and p3.responseCode == 16) then GAME_CONFIGURATION_PUBLISH_ACCOUNT_TOO_NEW_ERROR elseif var28 then GAME_CONFIGURATION_PUBLISH_AUDIENCE_ERROR else GAME_CONFIGURATION_PUBLISH_ERROR
						
						if var28 then
							getVersionInformationStoreModule().clearDraft(placeId)
							var4.fetchHistory(placeId)
						end
						debug.log("warn", "build_experience publish failed", {
							errorMessage = if isTable and p3.errorMessage ~= nil then tostring(p3.errorMessage) else tostring(p3),
							placeId = placeId,
							responseCode = if isTable then p3.responseCode else nil,
							stage = if var27 then gameConfigurationActionsModule.PublishFailureStage.SetAudience else var25,
							universeId = p2.target.universeId
						})
						var16(var29)
					end):finally(function()
						-- upvalues: var14 (copy)
						var14(false)
					end)
				end, {
					if fFlagBuildAdUpsellModule then audience else nil, var20, var13, var4,
					p2.target.placeId, p2.target.sessionId, p2.target.universeId, var6, var10,
					var7, var8, GAME_CONFIGURATION_PUBLISH_ACCOUNT_TOO_NEW_ERROR,
					GAME_CONFIGURATION_PUBLISH_AUDIENCE_ERROR, GAME_CONFIGURATION_PUBLISH_ERROR,
					GAME_CONFIGURATION_PUBLISH_SUCCESS
				}),
				width = UDim.new(1, 0),
				testId = `{testId}-publish`
			}),
			Preview = if p2.showPreviewButton == false then nil else reactModule.createElement(PreviewButton, {
				target = p2.target,
				actionsTestId = testId,
				onPreview = p2.onPreview
			})
		}),
		FriendsOnlyShareDialog = if var17 == "friends" and audience == privacyType.FriendsOnly then reactModule.createElement(friendsOnlyShareDialogModule, { onCancel = var23, onShare = var21 }) else nil
	})
end