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

local function _(p0) --[[ line: 66 | named "isPublishedVersion" ]]
	return typeof(p0) == "table" and (p0.status == "success" and (typeof(p0.version) == "string" and p0.version ~= ""))
end

local function buildPublicAudiences(p1) --[[ line: 73 ]]
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

local _ = function(p2) --[[ line: 85 | named "getGameDetailsNavigation" ]]
	if typeof(p2.clearAppScreens) == "function" then
		return p2
	end
	local cloned = table.clone(p2)
	
	function cloned.clearAppScreens(p3) --[[ line: 91 ]]
		-- upvalues: p2 (ref)
		p2.dispatch({ type = "ClearAppScreensAction", routeNames = p3 })
	end
	
	return cloned
end

local function PreviewButton(p4) --[[ line: 107 ]]
	-- upvalues: useStore (ref), useNavigation (ref), reactModule (ref), getRootNavigation (ref), openGameDetails (ref), button (ref), localizationStringsModule (ref), inputSize (ref), buttonVariant (ref), fillBehavior (ref)
	local var30 = useStore()
	local var31 = useNavigation()
	
	return reactModule.createElement(button, {
		LayoutOrder = 2,
		text = localizationStringsModule.GAME_CONFIGURATION_PREVIEW,
		size = inputSize.Medium,
		variant = buttonVariant.Standard,
		fillBehavior = fillBehavior.Fill,
		onActivated = reactModule.useCallback(function() --[[ line: 114 ]]
			-- upvalues: getRootNavigation (copy), var31 (ref), openGameDetails (copy), p4 (ref), var30 (ref)
			local var34
			local var32 = getRootNavigation(var31)
			local var33 = tostring(p4.target.universeId)
			
			if typeof(var32.clearAppScreens) == "function" then
				var34 = var32
			else
				local cloned = table.clone(var32)
				
				function cloned.clearAppScreens(p5) --[[ line: 91 ]]
					-- upvalues: var32 (ref)
					var32.dispatch({ type = "ClearAppScreensAction", routeNames = p5 })
				end
				
				var34 = cloned
			end
			openGameDetails(var33, var34, { source = "BuildExperiencePublish" })(var30)
		end, { var31, p4.target.universeId, var30 }),
		width = UDim.new(1, 0),
		testId = `{p4.actionsTestId}-preview`
	})
end

return function(p6) --[[ line: 133 | named "PublishFooter" ]]
	-- upvalues: useSharePublishedExperience (ref), signalsReactModule (ref), placeVersionHistoryModule (ref), reactModule (ref), signalsModule (ref), universeConfigurationModule (ref), fFlagEnableProvisionalRatingModule (ref), gameConfigurationLabelsModule (ref), universeActivationModule (ref), contentMaturityUtilsModule (ref), useOpenWebView (ref), localizationStringsModule (ref), fFlagEnableShareSheet (ref), sharePublishedExperience (ref), privacyType (ref), gameConfigurationActionsModule (ref), refreshPublishEligibilityModule (ref), getVersionInformationStoreModule (ref), sendBuildExperienceEventModule (ref), buildPublicAudiences (ref), fFlagBuildRehydrateOnPublishModule (ref), experienceGuidelinesModule (ref), t (ref), debug (ref), view (ref), privateShareTooltipModule (ref), snackbar (ref), button (ref), inputSize (ref), buttonVariant (ref), fillBehavior (ref), PreviewButton (ref), friendsOnlyShareDialogModule (ref)
	local var36 = useSharePublishedExperience(p6.target.universeId)
	local var37 = signalsReactModule.useSignalState(placeVersionHistoryModule.getPlaceVersionHistoryStore)
	local var38 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 136 ]]
		-- upvalues: p6 (ref), signalsModule (copy), var37 (ref)
		return if p6.target.placeId == nil then signalsModule.createSignal(nil) else var37.getAndFetchHistory(p6.target.placeId).data
	end, { var37, p6.target.placeId }))
	local var39 = if var38 then var38.placeVersions[1] else nil
	local var40 = signalsReactModule.useSignalState(universeConfigurationModule.getUniverseConfigurationStore)
	local var41 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 149 ]]
		-- upvalues: fFlagEnableProvisionalRatingModule (copy), signalsModule (copy), var40 (ref), p6 (ref)
		return if fFlagEnableProvisionalRatingModule then var40.getAndFetchSummary(p6.target.universeId).data else signalsModule.createSignal(nil)
	end, { var40, p6.target.universeId }))
	local audience = gameConfigurationLabelsModule.getAudience(signalsReactModule.useSignalState(var40.getAndFetchConfiguration(p6.target.universeId).data))
	local var43 = false
	local var44 = nil
	
	if fFlagEnableProvisionalRatingModule then
		local var45 = signalsReactModule.useSignalState(universeActivationModule.getUniverseActivationStore)
		var44 = var45
		var43 = reactModule.useMemo(function() --[[ line: 167 ]]
			-- upvalues: contentMaturityUtilsModule (copy), p6 (ref)
			return contentMaturityUtilsModule.isSealBroken(p6.target.universeId) and contentMaturityUtilsModule.isContentUnrated(p6.target.universeId)
		end, {
			signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 163 ]]
				-- upvalues: var45 (ref), p6 (ref)
				return var45.getAndFetchEligibility(p6.target.universeId)
			end, { var45, p6.target.universeId }).data),
			p6.target.universeId
		})
	end
	local var46 = useOpenWebView()
	local var47, var48 = reactModule.useState(false)
	local var49, var50 = reactModule.useState("")
	local var51, var52 = reactModule.useState(nil)
	local var53 = var49 == localizationStringsModule.GAME_CONFIGURATION_PUBLISH_SUCCESS and (p6.target.placeId ~= nil and audience ~= nil)
	local var54 = reactModule.useCallback(function() --[[ line: 180 ]]
		-- upvalues: var50 (ref), var52 (ref)
		var50("")
		var52(nil)
	end, {})
	local var55 = reactModule.useCallback(function() --[[ line: 185 ]]
		-- upvalues: p6 (ref), var52 (ref), fFlagEnableShareSheet (copy), var36 (ref), sharePublishedExperience (copy), var50 (ref), localizationStringsModule (copy)
		if p6.target.placeId == nil then return end
		var52(nil)
		
		if fFlagEnableShareSheet then
			var36(p6.target.placeId)
			
			return
		elseif sharePublishedExperience(p6.target.placeId).copiedToClipboard then
			var50(localizationStringsModule.GAME_CONFIGURATION_LINK_COPIED)
		end
	end, { p6.target.placeId, var36 })
	local testId = `{p6.testId}.actions`
	
	return reactModule.createElement(view, {
		LayoutOrder = 3,
		tag = "col gap-small size-full-0 auto-y bg-surface-0"
	}, {
		PublishSnackbarWrapper = if var49 ~= "" then nil else reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row align-x-center size-full-0 auto-y padding-x-large"
		}, {
			PublishSnackbar = reactModule.createElement(privateShareTooltipModule, {
				LayoutOrder = 1,
				isOpen = var51 == "private" and audience == privacyType.Private
			}, {
				Snackbar = reactModule.createElement(snackbar, {
					LayoutOrder = 1,
					title = var49,
					action = if var53 then {
						text = localizationStringsModule.GAME_CONFIGURATION_SHARE,
						onActivated = reactModule.useCallback(function() --[[ line: 202 ]]
							-- upvalues: audience (ref), privacyType (copy), var52 (ref), var51 (ref), var55 (ref)
							if audience == privacyType.Private then
								var52(if var51 == "private" then nil else "private")
								
								return
							elseif audience == privacyType.FriendsOnly then
								var52("friends")
								
								return
							elseif audience == privacyType.Public then
								var55()
							end
						end, { audience, var51, var55 })
					} else nil,
					onClose = if var53 then nil else var54,
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
				text = if var43 then localizationStringsModule.GAME_CONFIGURATION_UPDATE_RATING else localizationStringsModule.GAME_CONFIGURATION_PUBLISH,
				size = inputSize.Medium,
				variant = buttonVariant.Emphasis,
				fillBehavior = fillBehavior.Fill,
				isDisabled = p6.target.placeId == nil,
				isLoading = var47,
				onActivated = if var43 then reactModule.useCallback(function() --[[ line: 224 ]]
					-- upvalues: var46 (ref), gameConfigurationActionsModule (copy), p6 (ref), localizationStringsModule (copy), refreshPublishEligibilityModule (copy)
					var46(gameConfigurationActionsModule.getExperienceQuestionnaireUrl(p6.target.universeId), localizationStringsModule.GAME_CONFIGURATION_CREATOR_HUB, function() --[[ line: 228 ]]
						-- upvalues: refreshPublishEligibilityModule (copy), p6 (copy)
						refreshPublishEligibilityModule(p6.target.universeId)
					end)
				end, { var46, p6.target.universeId }) else reactModule.useCallback(function() --[[ line: 235 ]]
					-- upvalues: var47 (ref), p6 (ref), getVersionInformationStoreModule (copy), var39 (ref), sendBuildExperienceEventModule (copy), var48 (ref), var54 (ref), var41 (ref), fFlagEnableProvisionalRatingModule (copy), gameConfigurationActionsModule (copy), buildPublicAudiences (copy), fFlagBuildRehydrateOnPublishModule (copy), var44 (write), contentMaturityUtilsModule (copy), experienceGuidelinesModule (copy), t (copy), debug (copy), var40 (ref), var37 (ref), var50 (ref), localizationStringsModule (copy)
					if var47 then return end
					local placeId = p6.target.placeId
					
					if placeId == nil then return end
					local draft = getVersionInformationStoreModule().getDraft()
					local title = nil
					local description = nil
					
					if draft ~= nil and draft.placeId == placeId then
						title = if draft.title == "" then nil else draft.title
						description = if draft.description == "" then nil else draft.description
					elseif var39 ~= nil then
						title = var39.title
						description = var39.description
					end
					local var60
					sendBuildExperienceEventModule("PUBLISH_CLICK", {
						universeId = p6.target.universeId,
						placeId = placeId,
						conversationId = p6.target.sessionId
					})
					var48(true)
					var54()
					local var58 = "save_and_publish"
					
					local function publish(p7) --[[ line: 264 ]]
						-- upvalues: var58 (write), var41 (copy), fFlagEnableProvisionalRatingModule (copy), gameConfigurationActionsModule (copy), p6 (copy), placeId (ref), title (write), description (write), buildPublicAudiences (copy)
						var58 = "save_and_publish"
						p7 = p7 or var41
						
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
					
					if fFlagEnableProvisionalRatingModule and fFlagBuildRehydrateOnPublishModule and var44 ~= nil then
						var58 = "refresh_eligibility"
						var60 = var44.refreshEligibility(p6.target.universeId):andThen(function() --[[ line: 285 ]]
							-- upvalues: contentMaturityUtilsModule (copy), p6 (copy), experienceGuidelinesModule (copy), t (copy), debug (copy), var58 (write), var40 (copy), publish (ref)
							if contentMaturityUtilsModule.isSealBroken(p6.target.universeId) and contentMaturityUtilsModule.isContentUnrated(p6.target.universeId) then
								return experienceGuidelinesModule.getExperienceGuidelinesStore().refreshDetailedGuidelines(p6.target.universeId):andThen(function() --[[ line: 292 ]]
									-- upvalues: t (copy)
									return t
								end, function(p8) --[[ line: 294 ]]
									-- upvalues: debug (copy), p6 (copy), t (copy)
									debug.log("warn", "build_experience content maturity refresh failed", {
										errorMessage = tostring(p8),
										universeId = p6.target.universeId
									})
									
									return t
								end)
							end
							var58 = "refresh_summary"
							
							return var40.refreshSummary(p6.target.universeId):andThen(function(p9) --[[ line: 309 ]]
								-- upvalues: publish (copy)
								return publish(p9)
							end)
						end)
					else
						var60 = publish()
					end
					var60:andThen(function(p11) --[[ line: 317 ]]
						-- upvalues: t (copy), getVersionInformationStoreModule (copy), placeId (ref), var37 (copy), var50 (copy), localizationStringsModule (copy)
						if p11 == t then return end
						if not (typeof(p11) ~= "table" and (p11.status == "success" and (typeof(p11.version) == "string" and p11.version ~= ""))) then
							error({
								errorMessage = "save_and_publish expected status=success and a non-empty version; " .. `got status={tostring(p11.status)}, version={tostring(p11.version)}`
							})
						end
						getVersionInformationStoreModule().clearDraft(placeId)
						var37.fetchHistory(placeId)
						var50(localizationStringsModule.GAME_CONFIGURATION_PUBLISH_SUCCESS)
					end):catch(function(p10) --[[ line: 331 ]]
						-- upvalues: fFlagBuildRehydrateOnPublishModule (copy), gameConfigurationActionsModule (copy), getVersionInformationStoreModule (copy), placeId (ref), var37 (copy), debug (copy), var58 (write), p6 (copy), var50 (copy), localizationStringsModule (copy)
						local isTable = typeof(p10) == "table"
						local var63 = fFlagBuildRehydrateOnPublishModule and (isTable and p10.stage == gameConfigurationActionsModule.PublishFailureStage.SetAudience)
						local var64 = var63
						
						if var64 then
							local publishResult = p10.publishResult
							var64 = typeof(publishResult) ~= "table" and (publishResult.status == "success" and (typeof(publishResult.version) == "string" and publishResult.version ~= ""))
						end
						if var64 then
							getVersionInformationStoreModule().clearDraft(placeId)
							var37.fetchHistory(placeId)
						end
						debug.log("warn", "build_experience publish failed", {
							errorMessage = if isTable and p10.errorMessage ~= nil then tostring(p10.errorMessage) else tostring(p10),
							placeId = placeId,
							responseCode = if isTable then p10.responseCode else nil,
							stage = if var63 then gameConfigurationActionsModule.PublishFailureStage.SetAudience else var58,
							universeId = p6.target.universeId
						})
						var50(if var64 then localizationStringsModule.GAME_CONFIGURATION_PUBLISH_AUDIENCE_ERROR else localizationStringsModule.GAME_CONFIGURATION_PUBLISH_ERROR)
					end):finally(function() --[[ line: 360 ]]
						-- upvalues: var48 (copy)
						var48(false)
					end)
				end, {
					var54, var47, var37, p6.target.placeId, p6.target.sessionId,
					p6.target.universeId, var39, var44, var40, var41
				}),
				width = UDim.new(1, 0),
				testId = `{testId}-publish`
			}),
			Preview = if p6.showPreviewButton == false then nil else reactModule.createElement(PreviewButton, { target = p6.target, actionsTestId = testId })
		}),
		FriendsOnlyShareDialog = if var51 == "friends" and audience == privacyType.FriendsOnly then reactModule.createElement(friendsOnlyShareDialogModule, {
			onCancel = reactModule.useCallback(function() --[[ line: 220 ]]
				-- upvalues: var52 (ref)
				var52(nil)
			end, {}),
			onShare = var55
		}) else nil
	})
end