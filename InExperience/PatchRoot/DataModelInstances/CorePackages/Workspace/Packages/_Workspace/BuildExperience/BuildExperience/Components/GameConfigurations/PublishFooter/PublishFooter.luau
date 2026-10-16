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
local fFlagBuildShareDisabledOnPrivateModule = require(buildExperience.Flags.FFlagBuildShareDisabledOnPrivate)
local friendsOnlyShareDialogModule = require(buildExperience.Components.ShareAudience.FriendsOnlyShareDialog)
local var1 = if not fFlagBuildShareDisabledOnPrivateModule then require(buildExperience.Components.ShareAudience.PrivateShareTooltip) else nil
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
local fFlagBuildPublishNavigationSheetModule = require(buildExperience.Flags.FFlagBuildPublishNavigationSheet)
local fFlagBuildExperienceTooltipsLightDismissModule = require(buildExperience.Flags.FFlagBuildExperienceTooltipsLightDismiss)
local fFlagBuildAdUpsellModule = require(buildExperience.Flags.FFlagBuildAdUpsell)
local fFlagBuildExperienceForceRefreshVersionHistoryModule = require(buildExperience.Flags.FFlagBuildExperienceForceRefreshVersionHistory)
local var2 = if fFlagBuildAdUpsellModule then require(buildExperience.Stores.GetAdUpsellEventStore) else nil
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
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), useStore (ref), useNavigation (ref), reactModule (ref), getRootNavigation (ref), openGameDetails (ref), button (ref), inputSize (ref), buttonVariant (ref), fillBehavior (ref)
	local preview = useLocalization({
		preview = localizationStringsModule.GAME_CONFIGURATION_PREVIEW
	}).preview
	local var3 = useStore()
	local var4 = useNavigation()
	local onPreview = p2.onPreview
	
	return reactModule.createElement(button, {
		LayoutOrder = 2,
		text = preview,
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
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), useSharePublishedExperience (ref), signalsReactModule (ref), placeVersionHistoryModule (ref), reactModule (ref), fFlagBuildExperienceForceRefreshVersionHistoryModule (ref), signalsModule (ref), universeConfigurationModule (ref), gameConfigurationLabelsModule (ref), universeActivationModule (ref), contentMaturityUtilsModule (ref), useOpenWebView (ref), fFlagBuildShareDisabledOnPrivateModule (ref), privacyType (ref), fFlagEnableShareSheet (ref), sharePublishedExperience (ref), gameConfigurationActionsModule (ref), refreshPublishEligibilityModule (ref), getVersionInformationStoreModule (ref), sendBuildExperienceEventModule (ref), var2 (ref), fFlagBuildAdUpsellModule (ref), buildPublicAudiences (ref), experienceGuidelinesModule (ref), t (ref), debug (ref), snackbar (ref), view (ref), fFlagBuildPublishNavigationSheetModule (ref), var1 (ref), fFlagBuildExperienceTooltipsLightDismissModule (ref), button (ref), inputSize (ref), buttonVariant (ref), fillBehavior (ref), PreviewButton (ref), friendsOnlyShareDialogModule (ref)
	local var3 = useLocalization({
		accountTooNewError = localizationStringsModule.GAME_CONFIGURATION_PUBLISH_ACCOUNT_TOO_NEW_ERROR,
		creatorHub = localizationStringsModule.GAME_CONFIGURATION_CREATOR_HUB,
		linkCopied = localizationStringsModule.GAME_CONFIGURATION_LINK_COPIED,
		publish = localizationStringsModule.GAME_CONFIGURATION_PUBLISH,
		publishAudienceError = localizationStringsModule.GAME_CONFIGURATION_PUBLISH_AUDIENCE_ERROR,
		publishError = localizationStringsModule.GAME_CONFIGURATION_PUBLISH_ERROR,
		publishSuccess = localizationStringsModule.GAME_CONFIGURATION_PUBLISH_SUCCESS,
		share = localizationStringsModule.GAME_CONFIGURATION_SHARE,
		updateRating = localizationStringsModule.GAME_CONFIGURATION_UPDATE_RATING
	})
	local accountTooNewError = var3.accountTooNewError
	local creatorHub = var3.creatorHub
	local linkCopied = var3.linkCopied
	local publish = var3.publish
	local publishAudienceError = var3.publishAudienceError
	local publishError = var3.publishError
	local publishSuccess = var3.publishSuccess
	local share = var3.share
	local updateRating = var3.updateRating
	local var4 = useSharePublishedExperience(p2.target.universeId)
	local var5 = signalsReactModule.useSignalState(placeVersionHistoryModule.getPlaceVersionHistoryStore)
	local var6 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: fFlagBuildExperienceForceRefreshVersionHistoryModule (copy), p2 (ref), signalsModule (copy), var5 (ref)
		return if fFlagBuildExperienceForceRefreshVersionHistoryModule or p2.target.placeId == nil then signalsModule.createSignal(nil) else var5.getAndFetchHistory(p2.target.placeId).data
	end, { var5, p2.target.placeId }))
	local var7 = signalsReactModule.useSignalState(universeConfigurationModule.getUniverseConfigurationStore)
	local var8 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: var7 (ref), p2 (ref)
		return var7.getAndFetchSummary(p2.target.universeId).data
	end, { var7, p2.target.universeId }))
	local audience = gameConfigurationLabelsModule.getAudience(signalsReactModule.useSignalState(var7.getAndFetchConfiguration(p2.target.universeId).data))
	local _ = false
	local _ = nil
	local var9 = signalsReactModule.useSignalState(universeActivationModule.getUniverseActivationStore)
	local var10 = var9
	local var11 = reactModule.useMemo(function()
		-- upvalues: contentMaturityUtilsModule (copy), p2 (ref)
		return contentMaturityUtilsModule.isSealBroken(p2.target.universeId) and contentMaturityUtilsModule.isContentUnrated(p2.target.universeId)
	end, {
		signalsReactModule.useSignalState(reactModule.useMemo(function()
			-- upvalues: var9 (ref), p2 (ref)
			return var9.getAndFetchEligibility(p2.target.universeId)
		end, { var9, p2.target.universeId }).data),
		p2.target.universeId
	})
	local var12 = useOpenWebView()
	local var13, var14 = reactModule.useState(false)
	local var15, var16 = reactModule.useState("")
	local var17, var18 = reactModule.useState(nil)
	local var19 = var15 == publishSuccess and (p2.target.placeId ~= nil and (audience ~= nil and (not fFlagBuildShareDisabledOnPrivateModule or audience ~= privacyType.Private)))
	local var20 = reactModule.useCallback(function()
		-- upvalues: var16 (ref), var18 (ref)
		var16("")
		var18(nil)
	end, {})
	local var21 = reactModule.useCallback(function()
		-- upvalues: p2 (ref), var18 (ref), fFlagEnableShareSheet (copy), var4 (ref), sharePublishedExperience (copy), linkCopied (ref), var16 (ref)
		if p2.target.placeId == nil then return end
		var18(nil)
		
		if fFlagEnableShareSheet then
			var4(p2.target.placeId)
			
			return
		end
		local var22 = sharePublishedExperience(p2.target.placeId)
		
		if var22 ~= nil and var22.copiedToClipboard and linkCopied ~= nil then
			var16(linkCopied)
		end
	end, { linkCopied, p2.target.placeId, var4 })
	local var22 = reactModule.useCallback(function()
		-- upvalues: audience (ref), privacyType (copy), fFlagBuildShareDisabledOnPrivateModule (copy), var18 (ref), var17 (ref), var21 (ref)
		if audience == privacyType.Private then
			if not fFlagBuildShareDisabledOnPrivateModule then
				var18(if var17 == "private" then nil else "private")
			end
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
	local var24 = reactModule.useCallback(function()
		-- upvalues: var12 (ref), gameConfigurationActionsModule (copy), p2 (ref), creatorHub (ref), refreshPublishEligibilityModule (copy)
		var12(gameConfigurationActionsModule.getExperienceQuestionnaireUrl(p2.target.universeId), creatorHub, function()
			-- upvalues: refreshPublishEligibilityModule (copy), p2 (copy)
			refreshPublishEligibilityModule(p2.target.universeId)
		end)
	end, { creatorHub, var12, p2.target.universeId })
	local var25 = reactModule.useCallback(function()
		-- upvalues: var13 (ref), p2 (ref), getVersionInformationStoreModule (copy), sendBuildExperienceEventModule (copy), var14 (ref), var20 (ref), var2 (copy), var8 (ref), fFlagBuildAdUpsellModule (copy), gameConfigurationActionsModule (copy), buildPublicAudiences (copy), var10 (write), contentMaturityUtilsModule (copy), experienceGuidelinesModule (copy), t (copy), debug (copy), var7 (ref), fFlagBuildExperienceForceRefreshVersionHistoryModule (copy), var5 (ref), var6 (ref), var16 (ref), publishSuccess (ref), publishAudienceError (ref), publishError (ref), accountTooNewError (ref)
		if var13 then return end
		local placeId = p2.target.placeId
		
		if placeId == nil then return end
		local var26
		local var27 = nil
		local var28 = nil
		
		local function selectVersionNotes(p3)
			-- upvalues: getVersionInformationStoreModule (copy), placeId (ref), var27 (write), var28 (write)
			local draft = getVersionInformationStoreModule().getDraft()
			local var29 = if p3 ~= nil then nil else p3.placeVersions[1]
			
			if draft ~= nil and draft.placeId == placeId then
				var27 = if draft.title == "" then nil else draft.title
				var28 = if draft.description == "" then nil else draft.description
				
				return
			elseif var29 ~= nil then
				var27 = var29.title
				var28 = var29.description
			end
		end
		
		sendBuildExperienceEventModule("PUBLISH_CLICK", {
			universeId = p2.target.universeId,
			placeId = placeId,
			conversationId = p2.target.sessionId
		})
		var14(true)
		var20()
		local var29 = "save_and_publish"
		local var30 = false
		
		local function _(p3)
			-- upvalues: var2 (copy), p2 (copy), var30 (write)
			if typeof(p3) ~= "table" and (p3.status == "success" and (typeof(p3.version) == "string" and p3.version ~= "")) then
				var2(false).reportMenuPublish(p2.target.universeId, p2.target.sessionId, p3.version, var30)
				
				return
			end
		end
		
		local function publish(p3)
			-- upvalues: var29 (write), var8 (copy), fFlagBuildAdUpsellModule (copy), var30 (write), gameConfigurationActionsModule (copy), p2 (copy), placeId (ref), var27 (write), var28 (write), buildPublicAudiences (copy)
			var29 = "save_and_publish"
			p3 = p3 or var8
			
			if fFlagBuildAdUpsellModule then
				var30 = true
			end
			return gameConfigurationActionsModule.publishExperience({
				universeId = p2.target.universeId,
				placeId = placeId,
				title = var27,
				description = var28,
				isActive = p3 ~= nil and p3.isActive == true,
				audiences = buildPublicAudiences(if p3 then p3.audiences else nil)
			})
		end
		
		local function startPublish()
			-- upvalues: var10 (copy), publish (ref), var29 (write), p2 (copy), contentMaturityUtilsModule (copy), experienceGuidelinesModule (copy), t (copy), debug (copy), var7 (copy)
			if var10 == nil then
				return publish()
			end
			var29 = "refresh_eligibility"
			
			return var10.refreshEligibility(p2.target.universeId):andThen(function()
				-- upvalues: contentMaturityUtilsModule (copy), p2 (copy), experienceGuidelinesModule (copy), t (copy), debug (copy), var29 (copy), var7 (copy), publish (copy)
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
				var29 = "refresh_summary"
				
				return var7.refreshSummary(p2.target.universeId):andThen(function(p3)
					-- upvalues: publish (copy)
					return publish(p3)
				end)
			end)
		end
		
		local _ = nil
		
		if fFlagBuildExperienceForceRefreshVersionHistoryModule then
			local draft = getVersionInformationStoreModule().getDraft()
			
			if draft == nil or draft.placeId ~= placeId then
				var26 = var5.fetchPageHistory(placeId):andThen(selectVersionNotes, function()
					-- upvalues: getVersionInformationStoreModule (copy), placeId (ref), var27 (write), var28 (write)
					local draft = getVersionInformationStoreModule().getDraft()
					
					if draft == nil or draft.placeId ~= placeId then
						return
					end
					var27 = if draft.title == "" then nil else draft.title
					var28 = if draft.description == "" then nil else draft.description
				end):andThen(startPublish)
			else
				local draft_1 = getVersionInformationStoreModule().getDraft()
				
				if draft_1 ~= nil and draft_1.placeId == placeId then
					local _ = if draft_1.title == "" then nil else draft_1.title
					local _ = if draft_1.description == "" then nil else draft_1.description
				end
				if var10 == nil then
					var26 = publish()
				else
					var29 = "refresh_eligibility"
					var26 = var10.refreshEligibility(p2.target.universeId):andThen(function()
						-- upvalues: contentMaturityUtilsModule (copy), p2 (copy), experienceGuidelinesModule (copy), t (copy), debug (copy), var29 (write), var7 (copy), publish (ref)
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
						var29 = "refresh_summary"
						
						return var7.refreshSummary(p2.target.universeId):andThen(function(p3)
							-- upvalues: publish (copy)
							return publish(p3)
						end)
					end)
				end
			end
		else
			selectVersionNotes(var6)
			
			if var10 == nil then
				var26 = publish()
			else
				var29 = "refresh_eligibility"
				var26 = var10.refreshEligibility(p2.target.universeId):andThen(function()
					-- upvalues: contentMaturityUtilsModule (copy), p2 (copy), experienceGuidelinesModule (copy), t (copy), debug (copy), var29 (write), var7 (copy), publish (ref)
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
					var29 = "refresh_summary"
					
					return var7.refreshSummary(p2.target.universeId):andThen(function(p3)
						-- upvalues: publish (copy)
						return publish(p3)
					end)
				end)
			end
		end
		var26:andThen(function(p3)
			-- upvalues: t (copy), fFlagBuildAdUpsellModule (copy), var2 (copy), p2 (copy), var30 (write), getVersionInformationStoreModule (copy), placeId (ref), var5 (copy), var16 (copy), publishSuccess (copy)
			if p3 == t then return end
			if not (typeof(p3) ~= "table" and (p3.status == "success" and (typeof(p3.version) == "string" and p3.version ~= ""))) then
				error({
					errorMessage = "save_and_publish expected status=success and a non-empty version; " .. `got status={tostring(p3.status)}, version={tostring(p3.version)}`
				})
			end
			if fFlagBuildAdUpsellModule and (typeof(p3) ~= "table" and (p3.status == "success" and (typeof(p3.version) == "string" and p3.version ~= ""))) then
				var2(false).reportMenuPublish(p2.target.universeId, p2.target.sessionId, p3.version, var30)
			end
			getVersionInformationStoreModule().clearDraft(placeId)
			var5.fetchHistory(placeId)
			var16(publishSuccess)
		end):catch(function(p3)
			-- upvalues: gameConfigurationActionsModule (copy), publishAudienceError (copy), publishError (copy), accountTooNewError (copy), getVersionInformationStoreModule (copy), placeId (ref), var5 (copy), debug (copy), var29 (write), p2 (copy), var16 (copy)
			local isTable = typeof(p3) == "table"
			local var31 = isTable and p3.stage == gameConfigurationActionsModule.PublishFailureStage.SetAudience
			local var32 = var31
			
			if var32 then
				local publishResult = p3.publishResult
				var32 = typeof(publishResult) ~= "table" and (publishResult.status == "success" and (typeof(publishResult.version) == "string" and publishResult.version ~= ""))
			end
			local var33 = if isTable and p3.responseCode == 16 then accountTooNewError elseif var32 then publishAudienceError else publishError
			
			if var32 then
				getVersionInformationStoreModule().clearDraft(placeId)
				var5.fetchHistory(placeId)
			end
			debug.log("warn", "build_experience publish failed", {
				errorMessage = if isTable and p3.errorMessage ~= nil then tostring(p3.errorMessage) else tostring(p3),
				placeId = placeId,
				responseCode = if isTable then p3.responseCode else nil,
				stage = if var31 then gameConfigurationActionsModule.PublishFailureStage.SetAudience else var29,
				universeId = p2.target.universeId
			})
			var16(var33)
		end):finally(function()
			-- upvalues: var14 (copy)
			var14(false)
		end)
	end, {
		if fFlagBuildAdUpsellModule then audience else nil, var20, var13, var5,
		p2.target.placeId, p2.target.sessionId, p2.target.universeId, var6, var10,
		var7, var8, accountTooNewError, publishAudienceError, publishError,
		publishSuccess
	})
	local testId = `{p2.testId}.actions`
	local var26 = reactModule.createElement(snackbar, {
		LayoutOrder = 1,
		title = var15,
		action = if var19 then { text = share, onActivated = var22 } else nil,
		onClose = if var19 then nil else var20,
		testId = `{p2.testId}.publish-snackbar`
	})
	
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
			PublishSnackbar = if fFlagBuildShareDisabledOnPrivateModule then var26 else reactModule.createElement(var1, {
				LayoutOrder = 1,
				isOpen = var17 == "private" and audience == privacyType.Private,
				onPressedOutside = if fFlagBuildExperienceTooltipsLightDismissModule then var23 else nil
			}, { Snackbar = var26 })
		}),
		Actions = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "row gap-small size-full-0 auto-y padding-y-medium",
			testId = testId
		}, {
			Publish = reactModule.createElement(button, {
				LayoutOrder = 1,
				text = if var11 then updateRating else publish,
				size = inputSize.Medium,
				variant = buttonVariant.Emphasis,
				fillBehavior = fillBehavior.Fill,
				isDisabled = p2.target.placeId == nil,
				isLoading = var13,
				onActivated = if var11 then var24 else var25,
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