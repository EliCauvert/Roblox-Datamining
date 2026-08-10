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

local function _(p0) --[[ line: 68 | named "isPublishedVersion" ]]
	return typeof(p0) == "table" and (p0.status == "success" and (typeof(p0.version) == "string" and p0.version ~= ""))
end

local function buildPublicAudiences(p1) --[[ line: 75 ]]
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

local _ = function(p2) --[[ line: 87 | named "getGameDetailsNavigation" ]]
	if typeof(p2.clearAppScreens) == "function" then
		return p2
	end
	local cloned = table.clone(p2)
	
	function cloned.clearAppScreens(p3) --[[ line: 93 ]]
		-- upvalues: p2 (ref)
		p2.dispatch({ type = "ClearAppScreensAction", routeNames = p3 })
	end
	
	return cloned
end

local function PreviewButton(p4) --[[ line: 109 ]]
	-- upvalues: useStore (ref), useNavigation (ref), reactModule (ref), getRootNavigation (ref), openGameDetails (ref), button (ref), localizationStringsModule (ref), inputSize (ref), buttonVariant (ref), fillBehavior (ref)
	local var31 = useStore()
	local var32 = useNavigation()
	
	return reactModule.createElement(button, {
		LayoutOrder = 2,
		text = localizationStringsModule.GAME_CONFIGURATION_PREVIEW,
		size = inputSize.Medium,
		variant = buttonVariant.Standard,
		fillBehavior = fillBehavior.Fill,
		onActivated = reactModule.useCallback(function() --[[ line: 116 ]]
			-- upvalues: getRootNavigation (copy), var32 (ref), openGameDetails (copy), p4 (ref), var31 (ref)
			local var35
			local var33 = getRootNavigation(var32)
			local var34 = tostring(p4.target.universeId)
			
			if typeof(var33.clearAppScreens) == "function" then
				var35 = var33
			else
				local cloned = table.clone(var33)
				
				function cloned.clearAppScreens(p5) --[[ line: 93 ]]
					-- upvalues: var33 (ref)
					var33.dispatch({ type = "ClearAppScreensAction", routeNames = p5 })
				end
				
				var35 = cloned
			end
			openGameDetails(var34, var35, { source = "BuildExperiencePublish" })(var31)
		end, { var32, p4.target.universeId, var31 }),
		width = UDim.new(1, 0),
		testId = `{p4.actionsTestId}-preview`
	})
end

return function(p6) --[[ line: 135 | named "PublishFooter" ]]
	-- upvalues: useSharePublishedExperience (ref), signalsReactModule (ref), placeVersionHistoryModule (ref), reactModule (ref), signalsModule (ref), universeConfigurationModule (ref), fFlagEnableProvisionalRatingModule (ref), gameConfigurationLabelsModule (ref), universeActivationModule (ref), contentMaturityUtilsModule (ref), useOpenWebView (ref), localizationStringsModule (ref), fFlagEnableShareSheet (ref), sharePublishedExperience (ref), privacyType (ref), gameConfigurationActionsModule (ref), refreshPublishEligibilityModule (ref), getVersionInformationStoreModule (ref), sendBuildExperienceEventModule (ref), buildPublicAudiences (ref), fFlagBuildRehydrateOnPublishModule (ref), experienceGuidelinesModule (ref), t (ref), debug (ref), fFlagBuildPublishAccountTooNewErrorModule (ref), view (ref), privateShareTooltipModule (ref), snackbar (ref), button (ref), inputSize (ref), buttonVariant (ref), fillBehavior (ref), PreviewButton (ref), friendsOnlyShareDialogModule (ref)
	local var37 = useSharePublishedExperience(p6.target.universeId)
	local var38 = signalsReactModule.useSignalState(placeVersionHistoryModule.getPlaceVersionHistoryStore)
	local var39 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 138 ]]
		-- upvalues: p6 (ref), signalsModule (copy), var38 (ref)
		return if p6.target.placeId == nil then signalsModule.createSignal(nil) else var38.getAndFetchHistory(p6.target.placeId).data
	end, { var38, p6.target.placeId }))
	local var40 = if var39 then var39.placeVersions[1] else nil
	local var41 = signalsReactModule.useSignalState(universeConfigurationModule.getUniverseConfigurationStore)
	local var42 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 151 ]]
		-- upvalues: fFlagEnableProvisionalRatingModule (copy), signalsModule (copy), var41 (ref), p6 (ref)
		return if fFlagEnableProvisionalRatingModule then var41.getAndFetchSummary(p6.target.universeId).data else signalsModule.createSignal(nil)
	end, { var41, p6.target.universeId }))
	local audience = gameConfigurationLabelsModule.getAudience(signalsReactModule.useSignalState(var41.getAndFetchConfiguration(p6.target.universeId).data))
	local var44 = false
	local var45 = nil
	
	if fFlagEnableProvisionalRatingModule then
		local var46 = signalsReactModule.useSignalState(universeActivationModule.getUniverseActivationStore)
		var45 = var46
		var44 = reactModule.useMemo(function() --[[ line: 169 ]]
			-- upvalues: contentMaturityUtilsModule (copy), p6 (ref)
			return contentMaturityUtilsModule.isSealBroken(p6.target.universeId) and contentMaturityUtilsModule.isContentUnrated(p6.target.universeId)
		end, {
			signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 165 ]]
				-- upvalues: var46 (ref), p6 (ref)
				return var46.getAndFetchEligibility(p6.target.universeId)
			end, { var46, p6.target.universeId }).data),
			p6.target.universeId
		})
	end
	local var47 = useOpenWebView()
	local var48, var49 = reactModule.useState(false)
	local var50, var51 = reactModule.useState("")
	local var52, var53 = reactModule.useState(nil)
	local var54 = var50 == localizationStringsModule.GAME_CONFIGURATION_PUBLISH_SUCCESS and (p6.target.placeId ~= nil and audience ~= nil)
	local var55 = reactModule.useCallback(function() --[[ line: 182 ]]
		-- upvalues: var51 (ref), var53 (ref)
		var51("")
		var53(nil)
	end, {})
	local var56 = reactModule.useCallback(function() --[[ line: 187 ]]
		-- upvalues: p6 (ref), var53 (ref), fFlagEnableShareSheet (copy), var37 (ref), sharePublishedExperience (copy), var51 (ref), localizationStringsModule (copy)
		if p6.target.placeId == nil then return end
		var53(nil)
		
		if fFlagEnableShareSheet then
			var37(p6.target.placeId)
			
			return
		elseif sharePublishedExperience(p6.target.placeId).copiedToClipboard then
			var51(localizationStringsModule.GAME_CONFIGURATION_LINK_COPIED)
		end
	end, { p6.target.placeId, var37 })
	local testId = `{p6.testId}.actions`
	
	return reactModule.createElement(view, {
		LayoutOrder = 3,
		tag = "col gap-small size-full-0 auto-y bg-surface-0"
	}, {
		PublishSnackbarWrapper = if var50 ~= "" then nil else reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row align-x-center size-full-0 auto-y padding-x-large"
		}, {
			PublishSnackbar = reactModule.createElement(privateShareTooltipModule, {
				LayoutOrder = 1,
				isOpen = var52 == "private" and audience == privacyType.Private
			}, {
				Snackbar = reactModule.createElement(snackbar, {
					LayoutOrder = 1,
					title = var50,
					action = if var54 then {
						text = localizationStringsModule.GAME_CONFIGURATION_SHARE,
						onActivated = reactModule.useCallback(function() --[[ line: 204 ]]
							-- upvalues: audience (ref), privacyType (copy), var53 (ref), var52 (ref), var56 (ref)
							if audience == privacyType.Private then
								var53(if var52 == "private" then nil else "private")
								
								return
							elseif audience == privacyType.FriendsOnly then
								var53("friends")
								
								return
							elseif audience == privacyType.Public then
								var56()
							end
						end, { audience, var52, var56 })
					} else nil,
					onClose = if var54 then nil else var55,
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
				text = if var44 then localizationStringsModule.GAME_CONFIGURATION_UPDATE_RATING else localizationStringsModule.GAME_CONFIGURATION_PUBLISH,
				size = inputSize.Medium,
				variant = buttonVariant.Emphasis,
				fillBehavior = fillBehavior.Fill,
				isDisabled = p6.target.placeId == nil,
				isLoading = var48,
				onActivated = if var44 then reactModule.useCallback(function() --[[ line: 226 ]]
					-- upvalues: var47 (ref), gameConfigurationActionsModule (copy), p6 (ref), localizationStringsModule (copy), refreshPublishEligibilityModule (copy)
					var47(gameConfigurationActionsModule.getExperienceQuestionnaireUrl(p6.target.universeId), localizationStringsModule.GAME_CONFIGURATION_CREATOR_HUB, function() --[[ line: 230 ]]
						-- upvalues: refreshPublishEligibilityModule (copy), p6 (copy)
						refreshPublishEligibilityModule(p6.target.universeId)
					end)
				end, { var47, p6.target.universeId }) else reactModule.useCallback(function() --[[ line: 237 ]]
					-- upvalues: var48 (ref), p6 (ref), getVersionInformationStoreModule (copy), var40 (ref), sendBuildExperienceEventModule (copy), var49 (ref), var55 (ref), var42 (ref), fFlagEnableProvisionalRatingModule (copy), gameConfigurationActionsModule (copy), buildPublicAudiences (copy), fFlagBuildRehydrateOnPublishModule (copy), var45 (write), contentMaturityUtilsModule (copy), experienceGuidelinesModule (copy), t (copy), debug (copy), var41 (ref), var38 (ref), var51 (ref), localizationStringsModule (copy), fFlagBuildPublishAccountTooNewErrorModule (copy)
					if var48 then return end
					local placeId = p6.target.placeId
					
					if placeId == nil then return end
					local draft = getVersionInformationStoreModule().getDraft()
					local title = nil
					local description = nil
					
					if draft ~= nil and draft.placeId == placeId then
						title = if draft.title == "" then nil else draft.title
						description = if draft.description == "" then nil else draft.description
					elseif var40 ~= nil then
						title = var40.title
						description = var40.description
					end
					local var61
					sendBuildExperienceEventModule("PUBLISH_CLICK", {
						universeId = p6.target.universeId,
						placeId = placeId,
						conversationId = p6.target.sessionId
					})
					var49(true)
					var55()
					local var59 = "save_and_publish"
					
					local function publish(p7) --[[ line: 266 ]]
						-- upvalues: var59 (write), var42 (copy), fFlagEnableProvisionalRatingModule (copy), gameConfigurationActionsModule (copy), p6 (copy), placeId (ref), title (write), description (write), buildPublicAudiences (copy)
						var59 = "save_and_publish"
						p7 = p7 or var42
						
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
					
					if fFlagEnableProvisionalRatingModule and fFlagBuildRehydrateOnPublishModule and var45 ~= nil then
						var59 = "refresh_eligibility"
						var61 = var45.refreshEligibility(p6.target.universeId):andThen(function() --[[ line: 287 ]]
							-- upvalues: contentMaturityUtilsModule (copy), p6 (copy), experienceGuidelinesModule (copy), t (copy), debug (copy), var59 (write), var41 (copy), publish (ref)
							if contentMaturityUtilsModule.isSealBroken(p6.target.universeId) and contentMaturityUtilsModule.isContentUnrated(p6.target.universeId) then
								return experienceGuidelinesModule.getExperienceGuidelinesStore().refreshDetailedGuidelines(p6.target.universeId):andThen(function() --[[ line: 294 ]]
									-- upvalues: t (copy)
									return t
								end, function(p8) --[[ line: 296 ]]
									-- upvalues: debug (copy), p6 (copy), t (copy)
									debug.log("warn", "build_experience content maturity refresh failed", {
										errorMessage = tostring(p8),
										universeId = p6.target.universeId
									})
									
									return t
								end)
							end
							var59 = "refresh_summary"
							
							return var41.refreshSummary(p6.target.universeId):andThen(function(p9) --[[ line: 311 ]]
								-- upvalues: publish (copy)
								return publish(p9)
							end)
						end)
					else
						var61 = publish()
					end
					var61:andThen(function(p11) --[[ line: 319 ]]
						-- upvalues: t (copy), getVersionInformationStoreModule (copy), placeId (ref), var38 (copy), var51 (copy), localizationStringsModule (copy)
						if p11 == t then return end
						if not (typeof(p11) ~= "table" and (p11.status == "success" and (typeof(p11.version) == "string" and p11.version ~= ""))) then
							error({
								errorMessage = "save_and_publish expected status=success and a non-empty version; " .. `got status={tostring(p11.status)}, version={tostring(p11.version)}`
							})
						end
						getVersionInformationStoreModule().clearDraft(placeId)
						var38.fetchHistory(placeId)
						var51(localizationStringsModule.GAME_CONFIGURATION_PUBLISH_SUCCESS)
					end):catch(function(p10) --[[ line: 333 ]]
						-- upvalues: fFlagBuildRehydrateOnPublishModule (copy), gameConfigurationActionsModule (copy), fFlagBuildPublishAccountTooNewErrorModule (copy), localizationStringsModule (copy), getVersionInformationStoreModule (copy), placeId (ref), var38 (copy), debug (copy), var59 (write), p6 (copy), var51 (copy)
						local isTable = typeof(p10) == "table"
						local var64 = fFlagBuildRehydrateOnPublishModule and (isTable and p10.stage == gameConfigurationActionsModule.PublishFailureStage.SetAudience)
						local var65 = var64
						
						if var65 then
							local publishResult = p10.publishResult
							var65 = typeof(publishResult) ~= "table" and (publishResult.status == "success" and (typeof(publishResult.version) == "string" and publishResult.version ~= ""))
						end
						local var66 = if fFlagBuildPublishAccountTooNewErrorModule and (isTable and p10.responseCode == 16) then localizationStringsModule.GAME_CONFIGURATION_PUBLISH_ACCOUNT_TOO_NEW_ERROR elseif var65 then localizationStringsModule.GAME_CONFIGURATION_PUBLISH_AUDIENCE_ERROR else localizationStringsModule.GAME_CONFIGURATION_PUBLISH_ERROR
						
						if var65 then
							getVersionInformationStoreModule().clearDraft(placeId)
							var38.fetchHistory(placeId)
						end
						debug.log("warn", "build_experience publish failed", {
							errorMessage = if isTable and p10.errorMessage ~= nil then tostring(p10.errorMessage) else tostring(p10),
							placeId = placeId,
							responseCode = if isTable then p10.responseCode else nil,
							stage = if var64 then gameConfigurationActionsModule.PublishFailureStage.SetAudience else var59,
							universeId = p6.target.universeId
						})
						var51(var66)
					end):finally(function() --[[ line: 367 ]]
						-- upvalues: var49 (copy)
						var49(false)
					end)
				end, {
					var55, var48, var38, p6.target.placeId, p6.target.sessionId,
					p6.target.universeId, var40, var45, var41, var42
				}),
				width = UDim.new(1, 0),
				testId = `{testId}-publish`
			}),
			Preview = if p6.showPreviewButton == false then nil else reactModule.createElement(PreviewButton, { target = p6.target, actionsTestId = testId })
		}),
		FriendsOnlyShareDialog = if var52 == "friends" and audience == privacyType.FriendsOnly then reactModule.createElement(friendsOnlyShareDialogModule, {
			onCancel = reactModule.useCallback(function() --[[ line: 222 ]]
				-- upvalues: var53 (ref)
				var53(nil)
			end, {}),
			onShare = var56
		}) else nil
	})
end