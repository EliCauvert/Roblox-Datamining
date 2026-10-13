local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local gameDetailModule = require(parent.GameDetail)
local navigationModule = require(parent.Navigation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
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
local fFlagBuildAdUpsellModule = require(buildExperience.Flags.FFlagBuildAdUpsell)
local fFlagBuildExperiencePlaytestCardPublishCtaModule = require(buildExperience.Flags.FFlagBuildExperiencePlaytestCardPublishCta)
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
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), useStore (ref), useNavigation (ref), reactModule (ref), getRootNavigation (ref), openGameDetails (ref), button (ref), inputSize (ref), buttonVariant (ref), fillBehavior (ref)
	local preview = useLocalization({
		preview = localizationStringsModule.GAME_CONFIGURATION_PREVIEW
	}).preview
	local var2 = useStore()
	local var3 = useNavigation()
	local onPreview = p2.onPreview
	
	return reactModule.createElement(button, {
		LayoutOrder = 2,
		text = preview,
		size = inputSize.Medium,
		variant = buttonVariant.Standard,
		fillBehavior = fillBehavior.Fill,
		onActivated = reactModule.useCallback(function()
			-- upvalues: getRootNavigation (copy), var3 (ref), openGameDetails (copy), p2 (ref), var2 (ref), onPreview (ref)
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
			
			if onPreview then
				onPreview()
			end
		end, { var3, p2.target.universeId, var2, onPreview }),
		width = UDim.new(1, 0),
		testId = `{p2.actionsTestId}-preview`
	})
end

return function(p2)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), useSharePublishedExperience (ref), signalsReactModule (ref), placeVersionHistoryModule (ref), universeConfigurationModule (ref), reactModule (ref), gameConfigurationLabelsModule (ref), universeActivationModule (ref), contentMaturityUtilsModule (ref), useOpenWebView (ref), privacyType (ref), fFlagEnableShareSheet (ref), sharePublishedExperience (ref), gameConfigurationActionsModule (ref), refreshPublishEligibilityModule (ref), getVersionInformationStoreModule (ref), sendBuildExperienceEventModule (ref), var1 (ref), fFlagBuildAdUpsellModule (ref), buildPublicAudiences (ref), experienceGuidelinesModule (ref), t (ref), debug (ref), fFlagBuildExperiencePlaytestCardPublishCtaModule (ref), snackbar (ref), view (ref), fFlagBuildPublishNavigationSheetModule (ref), button (ref), inputSize (ref), buttonVariant (ref), fillBehavior (ref), PreviewButton (ref), friendsOnlyShareDialogModule (ref)
	local var2 = useLocalization({
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
	local accountTooNewError = var2.accountTooNewError
	local creatorHub = var2.creatorHub
	local linkCopied = var2.linkCopied
	local publish = var2.publish
	local publishAudienceError = var2.publishAudienceError
	local publishError = var2.publishError
	local publishSuccess = var2.publishSuccess
	local share = var2.share
	local updateRating = var2.updateRating
	local var3 = useSharePublishedExperience(p2.target.universeId)
	local var4 = signalsReactModule.useSignalState(placeVersionHistoryModule.getPlaceVersionHistoryStore)
	local var5 = signalsReactModule.useSignalState(universeConfigurationModule.getUniverseConfigurationStore)
	local var6 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: var5 (ref), p2 (ref)
		return var5.getAndFetchSummary(p2.target.universeId).data
	end, { var5, p2.target.universeId }))
	local audience = gameConfigurationLabelsModule.getAudience(signalsReactModule.useSignalState(var5.getAndFetchConfiguration(p2.target.universeId).data))
	local _ = false
	local _ = nil
	local var7 = signalsReactModule.useSignalState(universeActivationModule.getUniverseActivationStore)
	local var8 = var7
	local var9 = reactModule.useMemo(function()
		-- upvalues: contentMaturityUtilsModule (copy), p2 (ref)
		return contentMaturityUtilsModule.isSealBroken(p2.target.universeId) and contentMaturityUtilsModule.isContentUnrated(p2.target.universeId)
	end, {
		signalsReactModule.useSignalState(reactModule.useMemo(function()
			-- upvalues: var7 (ref), p2 (ref)
			return var7.getAndFetchEligibility(p2.target.universeId)
		end, { var7, p2.target.universeId }).data),
		p2.target.universeId
	})
	local var10 = useOpenWebView()
	local var11, var12 = reactModule.useState(false)
	local var13, var14 = reactModule.useState("")
	local var15, var16 = reactModule.useState(nil)
	local var17 = var13 == publishSuccess and (p2.target.placeId ~= nil and (audience ~= nil and audience ~= privacyType.Private))
	local var18 = reactModule.useCallback(function()
		-- upvalues: var14 (ref), var16 (ref)
		var14("")
		var16(nil)
	end, {})
	local var19 = reactModule.useCallback(function()
		-- upvalues: p2 (ref), var16 (ref), fFlagEnableShareSheet (copy), var3 (ref), sharePublishedExperience (copy), linkCopied (ref), var14 (ref)
		if p2.target.placeId == nil then return end
		var16(nil)
		
		if fFlagEnableShareSheet then
			var3(p2.target.placeId)
			
			return
		end
		local var20 = sharePublishedExperience(p2.target.placeId)
		
		if var20 ~= nil and var20.copiedToClipboard and linkCopied ~= nil then
			var14(linkCopied)
		end
	end, { linkCopied, p2.target.placeId, var3 })
	local testId = `{p2.testId}.actions`
	
	return reactModule.createElement(view, {
		LayoutOrder = 3,
		tag = {
			["col gap-small size-full-0 auto-y"] = true,
			["bg-surface-0"] = not fFlagBuildPublishNavigationSheetModule
		}
	}, {
		PublishSnackbarWrapper = if var13 ~= "" then nil else reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row align-x-center size-full-0 auto-y padding-x-large"
		}, {
			PublishSnackbar = reactModule.createElement(snackbar, {
				LayoutOrder = 1,
				title = var13,
				action = if var17 then {
					text = share,
					onActivated = reactModule.useCallback(function()
						-- upvalues: audience (ref), privacyType (copy), var16 (ref), var19 (ref)
						if audience == privacyType.FriendsOnly then
							var16("friends")
							
							return
						elseif audience == privacyType.Public then
							var19()
						end
					end, { audience, var19 })
				} else nil,
				onClose = if var17 then nil else var18,
				testId = `{p2.testId}.publish-snackbar`
			})
		}),
		Actions = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "row gap-small size-full-0 auto-y padding-y-medium",
			testId = testId
		}, {
			Publish = reactModule.createElement(button, {
				LayoutOrder = 1,
				text = if var9 then updateRating else publish,
				size = inputSize.Medium,
				variant = buttonVariant.Emphasis,
				fillBehavior = fillBehavior.Fill,
				isDisabled = p2.target.placeId == nil,
				isLoading = var11,
				onActivated = if var9 then reactModule.useCallback(function()
					-- upvalues: var10 (ref), gameConfigurationActionsModule (copy), p2 (ref), creatorHub (ref), refreshPublishEligibilityModule (copy)
					var10(gameConfigurationActionsModule.getExperienceQuestionnaireUrl(p2.target.universeId), creatorHub, function()
						-- upvalues: refreshPublishEligibilityModule (copy), p2 (copy)
						refreshPublishEligibilityModule(p2.target.universeId)
					end)
				end, { creatorHub, var10, p2.target.universeId }) else reactModule.useCallback(function()
					-- upvalues: var11 (ref), p2 (ref), getVersionInformationStoreModule (copy), sendBuildExperienceEventModule (copy), var12 (ref), var18 (ref), var1 (copy), var6 (ref), fFlagBuildAdUpsellModule (copy), gameConfigurationActionsModule (copy), buildPublicAudiences (copy), var8 (write), contentMaturityUtilsModule (copy), experienceGuidelinesModule (copy), t (copy), debug (copy), var5 (ref), var4 (ref), fFlagBuildExperiencePlaytestCardPublishCtaModule (copy), var14 (ref), publishSuccess (ref), publishAudienceError (ref), publishError (ref), accountTooNewError (ref)
					if var11 then return end
					local placeId = p2.target.placeId
					
					if placeId == nil then return end
					local var20
					local var21 = nil
					local var22 = nil
					
					local function selectVersionNotes(p3)
						-- upvalues: getVersionInformationStoreModule (copy), placeId (ref), var21 (write), var22 (write)
						local draft = getVersionInformationStoreModule().getDraft()
						local var23 = if p3 ~= nil then nil else p3.placeVersions[1]
						
						if draft ~= nil and draft.placeId == placeId then
							var21 = if draft.title == "" then nil else draft.title
							var22 = if draft.description == "" then nil else draft.description
							
							return
						elseif var23 ~= nil then
							var21 = var23.title
							var22 = var23.description
						end
					end
					
					sendBuildExperienceEventModule("PUBLISH_CLICK", {
						universeId = p2.target.universeId,
						placeId = placeId,
						conversationId = p2.target.sessionId
					})
					var12(true)
					var18()
					local var23 = "save_and_publish"
					local var24 = false
					
					local function _(p3)
						-- upvalues: var1 (copy), p2 (copy), var24 (write)
						if typeof(p3) ~= "table" and (p3.status == "success" and (typeof(p3.version) == "string" and p3.version ~= "")) then
							var1(false).reportMenuPublish(p2.target.universeId, p2.target.sessionId, p3.version, var24)
							
							return
						end
					end
					
					local function publish(p3)
						-- upvalues: var23 (write), var6 (copy), fFlagBuildAdUpsellModule (copy), var24 (write), gameConfigurationActionsModule (copy), p2 (copy), placeId (ref), var21 (write), var22 (write), buildPublicAudiences (copy)
						var23 = "save_and_publish"
						p3 = p3 or var6
						
						if fFlagBuildAdUpsellModule then
							var24 = true
						end
						return gameConfigurationActionsModule.publishExperience({
							universeId = p2.target.universeId,
							placeId = placeId,
							title = var21,
							description = var22,
							isActive = p3 ~= nil and p3.isActive == true,
							audiences = buildPublicAudiences(if p3 then p3.audiences else nil)
						})
					end
					
					local function startPublish()
						-- upvalues: var8 (copy), publish (ref), var23 (write), p2 (copy), contentMaturityUtilsModule (copy), experienceGuidelinesModule (copy), t (copy), debug (copy), var5 (copy)
						if var8 == nil then
							return publish()
						end
						var23 = "refresh_eligibility"
						
						return var8.refreshEligibility(p2.target.universeId):andThen(function()
							-- upvalues: contentMaturityUtilsModule (copy), p2 (copy), experienceGuidelinesModule (copy), t (copy), debug (copy), var23 (copy), var5 (copy), publish (copy)
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
							var23 = "refresh_summary"
							
							return var5.refreshSummary(p2.target.universeId):andThen(function(p3)
								-- upvalues: publish (copy)
								return publish(p3)
							end)
						end)
					end
					
					local _ = nil
					local draft = getVersionInformationStoreModule().getDraft()
					
					if draft == nil or draft.placeId ~= placeId then
						var20 = var4.fetchPageHistory(placeId):andThen(selectVersionNotes, function()
							-- upvalues: getVersionInformationStoreModule (copy), placeId (ref), var21 (write), var22 (write)
							local draft = getVersionInformationStoreModule().getDraft()
							
							if draft == nil or draft.placeId ~= placeId then
								return
							end
							var21 = if draft.title == "" then nil else draft.title
							var22 = if draft.description == "" then nil else draft.description
						end):andThen(startPublish)
					else
						local draft_1 = getVersionInformationStoreModule().getDraft()
						
						if draft_1 ~= nil and draft_1.placeId == placeId then
							local _ = if draft_1.title == "" then nil else draft_1.title
							local _ = if draft_1.description == "" then nil else draft_1.description
						end
						if var8 == nil then
							var20 = publish()
						else
							var23 = "refresh_eligibility"
							var20 = var8.refreshEligibility(p2.target.universeId):andThen(function()
								-- upvalues: contentMaturityUtilsModule (copy), p2 (copy), experienceGuidelinesModule (copy), t (copy), debug (copy), var23 (write), var5 (copy), publish (ref)
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
								var23 = "refresh_summary"
								
								return var5.refreshSummary(p2.target.universeId):andThen(function(p3)
									-- upvalues: publish (copy)
									return publish(p3)
								end)
							end)
						end
					end
					var20:andThen(function(p3)
						-- upvalues: t (copy), fFlagBuildAdUpsellModule (copy), var1 (copy), p2 (copy), var24 (write), getVersionInformationStoreModule (copy), placeId (ref), var4 (copy), fFlagBuildExperiencePlaytestCardPublishCtaModule (copy), var14 (copy), publishSuccess (copy)
						if p3 == t then return end
						if not (typeof(p3) ~= "table" and (p3.status == "success" and (typeof(p3.version) == "string" and p3.version ~= ""))) then
							error({
								errorMessage = "save_and_publish expected status=success and a non-empty version; " .. `got status={tostring(p3.status)}, version={tostring(p3.version)}`
							})
						end
						if fFlagBuildAdUpsellModule and (typeof(p3) ~= "table" and (p3.status == "success" and (typeof(p3.version) == "string" and p3.version ~= ""))) then
							var1(false).reportMenuPublish(p2.target.universeId, p2.target.sessionId, p3.version, var24)
						end
						getVersionInformationStoreModule().clearDraft(placeId)
						var4.fetchHistory(placeId)
						
						if fFlagBuildExperiencePlaytestCardPublishCtaModule then
							var4.fetchLiveVersion(placeId)
						end
						var14(publishSuccess)
					end):catch(function(p3)
						-- upvalues: gameConfigurationActionsModule (copy), publishAudienceError (copy), publishError (copy), accountTooNewError (copy), getVersionInformationStoreModule (copy), placeId (ref), var4 (copy), fFlagBuildExperiencePlaytestCardPublishCtaModule (copy), debug (copy), var23 (write), p2 (copy), var14 (copy)
						local isTable = typeof(p3) == "table"
						local var25 = isTable and p3.stage == gameConfigurationActionsModule.PublishFailureStage.SetAudience
						local var26 = var25
						
						if var26 then
							local publishResult = p3.publishResult
							var26 = typeof(publishResult) ~= "table" and (publishResult.status == "success" and (typeof(publishResult.version) == "string" and publishResult.version ~= ""))
						end
						local var27 = if isTable and p3.responseCode == 16 then accountTooNewError elseif var26 then publishAudienceError else publishError
						
						if var26 then
							getVersionInformationStoreModule().clearDraft(placeId)
							var4.fetchHistory(placeId)
							
							if fFlagBuildExperiencePlaytestCardPublishCtaModule then
								var4.fetchLiveVersion(placeId)
							end
						end
						debug.log("warn", "build_experience publish failed", {
							errorMessage = if isTable and p3.errorMessage ~= nil then tostring(p3.errorMessage) else tostring(p3),
							placeId = placeId,
							responseCode = if isTable then p3.responseCode else nil,
							stage = if var25 then gameConfigurationActionsModule.PublishFailureStage.SetAudience else var23,
							universeId = p2.target.universeId
						})
						var14(var27)
					end):finally(function()
						-- upvalues: var12 (copy)
						var12(false)
					end)
				end, {
					if fFlagBuildAdUpsellModule then audience else nil, var18, var11, var4,
					p2.target.placeId, p2.target.sessionId, p2.target.universeId, var8, var5,
					var6, accountTooNewError, publishAudienceError, publishError, publishSuccess
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
		FriendsOnlyShareDialog = if var15 == "friends" and audience == privacyType.FriendsOnly then reactModule.createElement(friendsOnlyShareDialogModule, {
			onCancel = reactModule.useCallback(function()
				-- upvalues: var16 (ref)
				var16(nil)
			end, {}),
			onShare = var19
		}) else nil
	})
end