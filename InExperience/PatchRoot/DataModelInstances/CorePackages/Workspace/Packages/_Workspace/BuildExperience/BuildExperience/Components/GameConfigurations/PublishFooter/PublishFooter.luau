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

local function _(p0) --[[ line: 69 | named "isPublishedVersion" ]]
	return typeof(p0) == "table" and (p0.status == "success" and (typeof(p0.version) == "string" and p0.version ~= ""))
end

local function buildPublicAudiences(p1) --[[ line: 76 ]]
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

local _ = function(p2) --[[ line: 88 | named "getGameDetailsNavigation" ]]
	if typeof(p2.clearAppScreens) == "function" then
		return p2
	end
	local cloned = table.clone(p2)
	
	function cloned.clearAppScreens(p3) --[[ line: 94 ]]
		-- upvalues: p2 (ref)
		p2.dispatch({ type = "ClearAppScreensAction", routeNames = p3 })
	end
	
	return cloned
end

local function PreviewButton(p4) --[[ line: 110 ]]
	-- upvalues: useStore (ref), useNavigation (ref), reactModule (ref), getRootNavigation (ref), openGameDetails (ref), button (ref), localizationStringsModule (ref), inputSize (ref), buttonVariant (ref), fillBehavior (ref)
	local var32 = useStore()
	local var33 = useNavigation()
	
	return reactModule.createElement(button, {
		LayoutOrder = 2,
		text = localizationStringsModule.GAME_CONFIGURATION_PREVIEW,
		size = inputSize.Medium,
		variant = buttonVariant.Standard,
		fillBehavior = fillBehavior.Fill,
		onActivated = reactModule.useCallback(function() --[[ line: 117 ]]
			-- upvalues: getRootNavigation (copy), var33 (ref), openGameDetails (copy), p4 (ref), var32 (ref)
			local var36
			local var34 = getRootNavigation(var33)
			local var35 = tostring(p4.target.universeId)
			
			if typeof(var34.clearAppScreens) == "function" then
				var36 = var34
			else
				local cloned = table.clone(var34)
				
				function cloned.clearAppScreens(p5) --[[ line: 94 ]]
					-- upvalues: var34 (ref)
					var34.dispatch({ type = "ClearAppScreensAction", routeNames = p5 })
				end
				
				var36 = cloned
			end
			openGameDetails(var35, var36, { source = "BuildExperiencePublish" })(var32)
		end, { var33, p4.target.universeId, var32 }),
		width = UDim.new(1, 0),
		testId = `{p4.actionsTestId}-preview`
	})
end

return function(p6) --[[ line: 136 | named "PublishFooter" ]]
	-- upvalues: useSharePublishedExperience (ref), signalsReactModule (ref), placeVersionHistoryModule (ref), reactModule (ref), signalsModule (ref), universeConfigurationModule (ref), fFlagEnableProvisionalRatingModule (ref), gameConfigurationLabelsModule (ref), universeActivationModule (ref), contentMaturityUtilsModule (ref), useOpenWebView (ref), localizationStringsModule (ref), fFlagEnableShareSheet (ref), sharePublishedExperience (ref), privacyType (ref), gameConfigurationActionsModule (ref), refreshPublishEligibilityModule (ref), getVersionInformationStoreModule (ref), sendBuildExperienceEventModule (ref), buildPublicAudiences (ref), fFlagBuildRehydrateOnPublishModule (ref), experienceGuidelinesModule (ref), t (ref), debug (ref), fFlagBuildPublishAccountTooNewErrorModule (ref), view (ref), privateShareTooltipModule (ref), fFlagBuildExperienceTooltipsLightDismissModule (ref), snackbar (ref), button (ref), inputSize (ref), buttonVariant (ref), fillBehavior (ref), PreviewButton (ref), friendsOnlyShareDialogModule (ref)
	local var38 = useSharePublishedExperience(p6.target.universeId)
	local var39 = signalsReactModule.useSignalState(placeVersionHistoryModule.getPlaceVersionHistoryStore)
	local var40 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 139 ]]
		-- upvalues: p6 (ref), signalsModule (copy), var39 (ref)
		return if p6.target.placeId == nil then signalsModule.createSignal(nil) else var39.getAndFetchHistory(p6.target.placeId).data
	end, { var39, p6.target.placeId }))
	local var41 = if var40 then var40.placeVersions[1] else nil
	local var42 = signalsReactModule.useSignalState(universeConfigurationModule.getUniverseConfigurationStore)
	local var43 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 152 ]]
		-- upvalues: fFlagEnableProvisionalRatingModule (copy), signalsModule (copy), var42 (ref), p6 (ref)
		return if fFlagEnableProvisionalRatingModule then var42.getAndFetchSummary(p6.target.universeId).data else signalsModule.createSignal(nil)
	end, { var42, p6.target.universeId }))
	local audience = gameConfigurationLabelsModule.getAudience(signalsReactModule.useSignalState(var42.getAndFetchConfiguration(p6.target.universeId).data))
	local var45 = false
	local var46 = nil
	
	if fFlagEnableProvisionalRatingModule then
		local var47 = signalsReactModule.useSignalState(universeActivationModule.getUniverseActivationStore)
		var46 = var47
		var45 = reactModule.useMemo(function() --[[ line: 170 ]]
			-- upvalues: contentMaturityUtilsModule (copy), p6 (ref)
			return contentMaturityUtilsModule.isSealBroken(p6.target.universeId) and contentMaturityUtilsModule.isContentUnrated(p6.target.universeId)
		end, {
			signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 166 ]]
				-- upvalues: var47 (ref), p6 (ref)
				return var47.getAndFetchEligibility(p6.target.universeId)
			end, { var47, p6.target.universeId }).data),
			p6.target.universeId
		})
	end
	local var48 = useOpenWebView()
	local var49, var50 = reactModule.useState(false)
	local var51, var52 = reactModule.useState("")
	local var53, var54 = reactModule.useState(nil)
	local var55 = var51 == localizationStringsModule.GAME_CONFIGURATION_PUBLISH_SUCCESS and (p6.target.placeId ~= nil and audience ~= nil)
	local var56 = reactModule.useCallback(function() --[[ line: 183 ]]
		-- upvalues: var52 (ref), var54 (ref)
		var52("")
		var54(nil)
	end, {})
	local var57 = reactModule.useCallback(function() --[[ line: 188 ]]
		-- upvalues: p6 (ref), var54 (ref), fFlagEnableShareSheet (copy), var38 (ref), sharePublishedExperience (copy), var52 (ref), localizationStringsModule (copy)
		if p6.target.placeId == nil then return end
		var54(nil)
		
		if fFlagEnableShareSheet then
			var38(p6.target.placeId)
			
			return
		elseif sharePublishedExperience(p6.target.placeId).copiedToClipboard then
			var52(localizationStringsModule.GAME_CONFIGURATION_LINK_COPIED)
		end
	end, { p6.target.placeId, var38 })
	local var58 = reactModule.useCallback(function() --[[ line: 205 ]]
		-- upvalues: audience (ref), privacyType (copy), var54 (ref), var53 (ref), var57 (ref)
		if audience == privacyType.Private then
			var54(if var53 == "private" then nil else "private")
			
			return
		elseif audience == privacyType.FriendsOnly then
			var54("friends")
			
			return
		elseif audience == privacyType.Public then
			var57()
		end
	end, { audience, var53, var57 })
	local var59 = reactModule.useCallback(function() --[[ line: 223 ]]
		-- upvalues: var54 (ref)
		var54(nil)
	end, {})
	local testId = `{p6.testId}.actions`
	
	return reactModule.createElement(view, {
		LayoutOrder = 3,
		tag = "col gap-small size-full-0 auto-y bg-surface-0"
	}, {
		PublishSnackbarWrapper = if var51 ~= "" then nil else reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row align-x-center size-full-0 auto-y padding-x-large"
		}, {
			PublishSnackbar = reactModule.createElement(privateShareTooltipModule, {
				LayoutOrder = 1,
				isOpen = var53 == "private" and audience == privacyType.Private,
				onPressedOutside = if fFlagBuildExperienceTooltipsLightDismissModule then var59 else nil
			}, {
				Snackbar = reactModule.createElement(snackbar, {
					LayoutOrder = 1,
					title = var51,
					action = if var55 then {
						text = localizationStringsModule.GAME_CONFIGURATION_SHARE,
						onActivated = var58
					} else nil,
					onClose = if var55 then nil else var56,
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
				text = if var45 then localizationStringsModule.GAME_CONFIGURATION_UPDATE_RATING else localizationStringsModule.GAME_CONFIGURATION_PUBLISH,
				size = inputSize.Medium,
				variant = buttonVariant.Emphasis,
				fillBehavior = fillBehavior.Fill,
				isDisabled = p6.target.placeId == nil,
				isLoading = var49,
				onActivated = if var45 then reactModule.useCallback(function() --[[ line: 227 ]]
					-- upvalues: var48 (ref), gameConfigurationActionsModule (copy), p6 (ref), localizationStringsModule (copy), refreshPublishEligibilityModule (copy)
					var48(gameConfigurationActionsModule.getExperienceQuestionnaireUrl(p6.target.universeId), localizationStringsModule.GAME_CONFIGURATION_CREATOR_HUB, function() --[[ line: 231 ]]
						-- upvalues: refreshPublishEligibilityModule (copy), p6 (copy)
						refreshPublishEligibilityModule(p6.target.universeId)
					end)
				end, { var48, p6.target.universeId }) else reactModule.useCallback(function() --[[ line: 238 ]]
					-- upvalues: var49 (ref), p6 (ref), getVersionInformationStoreModule (copy), var41 (ref), sendBuildExperienceEventModule (copy), var50 (ref), var56 (ref), var43 (ref), fFlagEnableProvisionalRatingModule (copy), gameConfigurationActionsModule (copy), buildPublicAudiences (copy), fFlagBuildRehydrateOnPublishModule (copy), var46 (write), contentMaturityUtilsModule (copy), experienceGuidelinesModule (copy), t (copy), debug (copy), var42 (ref), var39 (ref), var52 (ref), localizationStringsModule (copy), fFlagBuildPublishAccountTooNewErrorModule (copy)
					if var49 then return end
					local placeId = p6.target.placeId
					
					if placeId == nil then return end
					local draft = getVersionInformationStoreModule().getDraft()
					local title = nil
					local description = nil
					
					if draft ~= nil and draft.placeId == placeId then
						title = if draft.title == "" then nil else draft.title
						description = if draft.description == "" then nil else draft.description
					elseif var41 ~= nil then
						title = var41.title
						description = var41.description
					end
					local var64
					sendBuildExperienceEventModule("PUBLISH_CLICK", {
						universeId = p6.target.universeId,
						placeId = placeId,
						conversationId = p6.target.sessionId
					})
					var50(true)
					var56()
					local var62 = "save_and_publish"
					
					local function publish(p7) --[[ line: 267 ]]
						-- upvalues: var62 (write), var43 (copy), fFlagEnableProvisionalRatingModule (copy), gameConfigurationActionsModule (copy), p6 (copy), placeId (ref), title (write), description (write), buildPublicAudiences (copy)
						var62 = "save_and_publish"
						p7 = p7 or var43
						
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
					
					if fFlagEnableProvisionalRatingModule and fFlagBuildRehydrateOnPublishModule and var46 ~= nil then
						var62 = "refresh_eligibility"
						var64 = var46.refreshEligibility(p6.target.universeId):andThen(function() --[[ line: 288 ]]
							-- upvalues: contentMaturityUtilsModule (copy), p6 (copy), experienceGuidelinesModule (copy), t (copy), debug (copy), var62 (write), var42 (copy), publish (ref)
							if contentMaturityUtilsModule.isSealBroken(p6.target.universeId) and contentMaturityUtilsModule.isContentUnrated(p6.target.universeId) then
								return experienceGuidelinesModule.getExperienceGuidelinesStore().refreshDetailedGuidelines(p6.target.universeId):andThen(function() --[[ line: 295 ]]
									-- upvalues: t (copy)
									return t
								end, function(p8) --[[ line: 297 ]]
									-- upvalues: debug (copy), p6 (copy), t (copy)
									debug.log("warn", "build_experience content maturity refresh failed", {
										errorMessage = tostring(p8),
										universeId = p6.target.universeId
									})
									
									return t
								end)
							end
							var62 = "refresh_summary"
							
							return var42.refreshSummary(p6.target.universeId):andThen(function(p9) --[[ line: 312 ]]
								-- upvalues: publish (copy)
								return publish(p9)
							end)
						end)
					else
						var64 = publish()
					end
					var64:andThen(function(p11) --[[ line: 320 ]]
						-- upvalues: t (copy), getVersionInformationStoreModule (copy), placeId (ref), var39 (copy), var52 (copy), localizationStringsModule (copy)
						if p11 == t then return end
						if not (typeof(p11) ~= "table" and (p11.status == "success" and (typeof(p11.version) == "string" and p11.version ~= ""))) then
							error({
								errorMessage = "save_and_publish expected status=success and a non-empty version; " .. `got status={tostring(p11.status)}, version={tostring(p11.version)}`
							})
						end
						getVersionInformationStoreModule().clearDraft(placeId)
						var39.fetchHistory(placeId)
						var52(localizationStringsModule.GAME_CONFIGURATION_PUBLISH_SUCCESS)
					end):catch(function(p10) --[[ line: 334 ]]
						-- upvalues: fFlagBuildRehydrateOnPublishModule (copy), gameConfigurationActionsModule (copy), fFlagBuildPublishAccountTooNewErrorModule (copy), localizationStringsModule (copy), getVersionInformationStoreModule (copy), placeId (ref), var39 (copy), debug (copy), var62 (write), p6 (copy), var52 (copy)
						local isTable = typeof(p10) == "table"
						local var67 = fFlagBuildRehydrateOnPublishModule and (isTable and p10.stage == gameConfigurationActionsModule.PublishFailureStage.SetAudience)
						local var68 = var67
						
						if var68 then
							local publishResult = p10.publishResult
							var68 = typeof(publishResult) ~= "table" and (publishResult.status == "success" and (typeof(publishResult.version) == "string" and publishResult.version ~= ""))
						end
						local var69 = if fFlagBuildPublishAccountTooNewErrorModule and (isTable and p10.responseCode == 16) then localizationStringsModule.GAME_CONFIGURATION_PUBLISH_ACCOUNT_TOO_NEW_ERROR elseif var68 then localizationStringsModule.GAME_CONFIGURATION_PUBLISH_AUDIENCE_ERROR else localizationStringsModule.GAME_CONFIGURATION_PUBLISH_ERROR
						
						if var68 then
							getVersionInformationStoreModule().clearDraft(placeId)
							var39.fetchHistory(placeId)
						end
						debug.log("warn", "build_experience publish failed", {
							errorMessage = if isTable and p10.errorMessage ~= nil then tostring(p10.errorMessage) else tostring(p10),
							placeId = placeId,
							responseCode = if isTable then p10.responseCode else nil,
							stage = if var67 then gameConfigurationActionsModule.PublishFailureStage.SetAudience else var62,
							universeId = p6.target.universeId
						})
						var52(var69)
					end):finally(function() --[[ line: 368 ]]
						-- upvalues: var50 (copy)
						var50(false)
					end)
				end, {
					var56, var49, var39, p6.target.placeId, p6.target.sessionId,
					p6.target.universeId, var41, var46, var42, var43
				}),
				width = UDim.new(1, 0),
				testId = `{testId}-publish`
			}),
			Preview = if p6.showPreviewButton == false then nil else reactModule.createElement(PreviewButton, { target = p6.target, actionsTestId = testId })
		}),
		FriendsOnlyShareDialog = if var53 == "friends" and audience == privacyType.FriendsOnly then reactModule.createElement(friendsOnlyShareDialogModule, { onCancel = var59, onShare = var57 }) else nil
	})
end