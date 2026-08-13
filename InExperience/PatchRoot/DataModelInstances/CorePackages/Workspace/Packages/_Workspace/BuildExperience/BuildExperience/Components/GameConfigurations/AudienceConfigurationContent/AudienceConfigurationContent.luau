local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local useOpenWebView = require(parent.WebViewUtils).useOpenWebView
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local experienceQuestionnaireModule = require(parent.DataHydration.ExperienceQuestionnaire)
local universeActivationModule = require(parent.DataHydration.UniverseActivation)
local universeConfigurationModule = require(parent.DataHydration.UniverseConfiguration)
local contentMaturityUtilsModule = require(buildExperience.utils.ContentMaturityUtils)
local gameConfigurationActionsModule = require(buildExperience.utils.GameConfigurationActions)
local formatErrorModule = require(buildExperience.utils.formatError)
local refreshPublishEligibilityModule = require(buildExperience.utils.refreshPublishEligibility)
local fFlagBuildAudiencePublishPromptModule = require(buildExperience.Flags.FFlagBuildAudiencePublishPrompt)
local fFlagBuildExperienceTooltipsLightDismissModule = require(buildExperience.Flags.FFlagBuildExperienceTooltipsLightDismiss)
local fFlagBuildRehydrateOnPublishModule = require(buildExperience.Flags.FFlagBuildRehydrateOnPublish)
local debug = creatorAgentChatModule.debug
local icon = foundationModule.Icon
local list = foundationModule.List
local popover = foundationModule.Popover
local radioGroup = foundationModule.RadioGroup
local text = foundationModule.Text
local view = foundationModule.View
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local inputSize = foundationModule.Enums.InputSize
local popoverAlign = foundationModule.Enums.PopoverAlign
local popoverSide = foundationModule.Enums.PopoverSide
local radius = foundationModule.Enums.Radius
local useScaledValue = foundationModule.Hooks.useScaledValue
local useTokens = foundationModule.Hooks.useTokens
local privacyType = universeConfigurationModule.PrivacyType
local t = {
	[privacyType.Private] = "Private",
	[privacyType.FriendsOnly] = "Friends",
	[privacyType.Public] = "Public"
}
local buildExperienceAudienceTooltipMaxWidth = game:DefineFastInt("BuildExperienceAudienceTooltipMaxWidth", 220)

local function _(p0) --[[ line: 71 | named "getSelectedAudience" ]]
	-- upvalues: t (ref), universeConfigurationModule (ref)
	return if p0 == nil then nil else t[universeConfigurationModule.getPrivacyTypeForAudiences(p0)]
end

local _ = function(p1) --[[ line: 77 | named "isVisibilityAudience" ]]
	-- upvalues: universeActivationModule (ref)
	return if p1 ~= universeActivationModule.Audience.Public then p1 == universeActivationModule.Audience.Friends else true
end

local function getAudiencesForValue(p2, p3) --[[ line: 81 ]]
	-- upvalues: universeActivationModule (ref)
	local t = {}
	
	for i, v in p3 do
		if not (if v ~= universeActivationModule.Audience.Public then v == universeActivationModule.Audience.Friends else true) then
			table.insert(t, v)
		end
	end
	if p2 == "Public" then
		table.insert(t, universeActivationModule.Audience.Public)
		
		return t
	elseif p2 == "Friends" then
		table.insert(t, universeActivationModule.Audience.Friends)
	end
	return t
end

local function AudienceRow(p4) --[[ line: 112 ]]
	-- upvalues: reactModule (ref), icon (ref), iconName (ref), iconSize (ref), view (ref), list (ref), radioGroup (ref), inputSize (ref)
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y radius-medium",
		LayoutOrder = p4.LayoutOrder,
		onActivated = if p4.isDisabled then nil else reactModule.useCallback(function() --[[ line: 113 ]]
			-- upvalues: p4 (ref)
			p4.onActivated(p4.value)
		end, { p4.onActivated, p4.value }),
		testId = `{u756}-button`
	}, {
		ListItem = reactModule.createElement(list.Item, {
			LayoutOrder = p4.LayoutOrder,
			title = p4.title,
			trailing = reactModule.createElement(view, { tag = "row align-y-center gap-medium auto-xy" }, {
				Lock = if p4.isLocked then reactModule.createElement(icon, {
					LayoutOrder = 1,
					tag = "auto-xy content-default",
					name = iconName.LockClosed,
					ref = p4.lockIconRef,
					size = iconSize.Small
				}) else nil,
				Radio = reactModule.createElement(radioGroup.Item, {
					LayoutOrder = 2,
					label = "",
					isDisabled = p4.isDisabled or p4.isLocked,
					size = inputSize.Medium,
					testId = `{u756}-radio`,
					value = p4.value
				})
			}),
			testId = u756
		})
	})
end

local _ = function(p5, p6, p7) --[[ line: 182 | named "getSelectedAudienceFromState" ]]
	-- upvalues: t (ref), universeConfigurationModule (ref)
	if p5 ~= nil then
		return p5
	elseif not p6 then
		return nil
	end
	local audiences = p7.audiences
	
	return if audiences == nil then nil else t[universeConfigurationModule.getPrivacyTypeForAudiences(audiences)]
end

local _ = function(p8, p9, p10) --[[ line: 194 | named "getIsNonPrivateLocked" ]]
	return p9 and (if p8.eligibility ~= "Required" then p10 else true)
end

local function getUniverseActivationStore(p11) --[[ line: 202 ]]
	-- upvalues: universeActivationModule (ref)
	return universeActivationModule.getUniverseActivationStore(p11)
end

local function getQuestionnaireStore(p12) --[[ line: 206 ]]
	-- upvalues: experienceQuestionnaireModule (ref)
	return experienceQuestionnaireModule.getExperienceQuestionnaireStore(p12)
end

local function getUniverseConfigurationStore(p13) --[[ line: 210 ]]
	-- upvalues: universeConfigurationModule (ref)
	return universeConfigurationModule.getUniverseConfigurationStore(p13)
end

local function useAudienceStores() --[[ line: 214 ]]
	-- upvalues: signalsReactModule (ref), getUniverseActivationStore (ref), getQuestionnaireStore (ref), getUniverseConfigurationStore (ref)
	return {
		universeActivationStore = signalsReactModule.useSignalState(getUniverseActivationStore),
		questionnaireStore = signalsReactModule.useSignalState(getQuestionnaireStore),
		universeConfigurationStore = signalsReactModule.useSignalState(getUniverseConfigurationStore)
	}
end

local function useAudienceData(p14, p15, p16, p17, p18) --[[ line: 226 ]]
	-- upvalues: reactModule (ref), fFlagBuildRehydrateOnPublishModule (ref), debug (ref), formatErrorModule (ref), signalsReactModule (ref), fFlagBuildAudiencePublishPromptModule (ref), contentMaturityUtilsModule (ref), t (ref), universeConfigurationModule (ref)
	local var32 = reactModule.useMemo(function() --[[ line: 233 ]]
		-- upvalues: p17 (ref), p14 (ref)
		return p17.getAndFetchConfiguration(p14)
	end, { p14, p17 })
	local var33, var34 = reactModule.useState(fFlagBuildRehydrateOnPublishModule)
	
	if fFlagBuildRehydrateOnPublishModule then
		reactModule.useEffect(function() --[[ line: 240 ]]
			-- upvalues: var34 (ref), p17 (ref), p14 (ref), debug (copy), formatErrorModule (copy)
			local var58 = true
			var34(true)
			p17.refreshConfiguration(p14):catch(function(p19) --[[ line: 245 ]]
				-- upvalues: debug (copy), formatErrorModule (copy), p14 (copy)
				debug.log("warn", "AudienceConfigurationContent configuration refresh failed", { errorMessage = formatErrorModule(p19), universeId = p14 })
			end):finally(function() --[[ line: 251 ]]
				-- upvalues: var58 (write), var34 (copy)
				if var58 then
					var34(false)
				end
			end)
			
			return function() --[[ line: 257 ]]
				-- upvalues: var58 (write)
				var58 = false
			end
		end, { p17, p14 })
	end
	local var48, var49
	local var35 = reactModule.useMemo(function() --[[ line: 262 ]]
		-- upvalues: p15 (ref), p14 (ref)
		return p15.getAndFetchEligibility(p14)
	end, { p15, p14 })
	local var36 = reactModule.useMemo(function() --[[ line: 265 ]]
		-- upvalues: p15 (ref), p14 (ref)
		return p15.getAndFetchLatestSubmission(p14)
	end, { p15, p14 })
	local var37 = signalsReactModule.useSignalState(var32.data)
	local var38 = signalsReactModule.useSignalState(var32.status)
	local var39 = signalsReactModule.useSignalState(var35.data)
	local var40 = signalsReactModule.useSignalState(var35.status)
	local var41 = signalsReactModule.useSignalState(var36.data)
	local var42 = signalsReactModule.useSignalState(var36.status)
	local var43 = var38 == "Ready" and var37 ~= nil
	local var44 = var40 == "Ready" and var39 ~= nil
	local isFailed = var42 == "Failed"
	local var46 = var44 and ((var42 == "Ready" and var41 ~= nil) or isFailed)
	local _ = nil
	local _ = nil
	local var47 = nil
	
	if fFlagBuildRehydrateOnPublishModule then
		local var50 = reactModule.useMemo(function() --[[ line: 286 ]]
			-- upvalues: p16 (ref), p14 (ref)
			return p16.getAndFetchEligibility(p14)
		end, { p16, p14 })
		local var51 = signalsReactModule.useSignalState(var50.data)
		local var52 = signalsReactModule.useSignalState(var50.status)
		local var53 = if var52 ~= "Ready" then var52 == "Failed" else true
		
		if fFlagBuildAudiencePublishPromptModule then
			var47 = if not contentMaturityUtilsModule.isContentUnrated(p14) then nil elseif contentMaturityUtilsModule.isSealBroken(p14) then "RatingRequired" else "PublishRequired"
			var49 = var47 ~= nil
			var48 = var53
		else
			local var55
			local var54 = var44 and (if var39.eligibility ~= "Required" then isFailed else true)
			var49 = reactModule.useMemo(function() --[[ line: 312 ]]
				-- upvalues: contentMaturityUtilsModule (copy), p14 (ref), var54 (ref)
				return if contentMaturityUtilsModule.isSealBroken(p14) then contentMaturityUtilsModule.isContentUnrated(p14) or var54 else false
			end, { var51, var54, p14 })
			
			if var40 ~= "Ready" then
				var55 = false
				
				if var40 == "Failed" then
					var55 = if var42 ~= "Ready" then var42 == "Failed" else true
				end
				var48 = var53 and var55
			end
		end
	else
		var48 = var46
		var49 = var44 and (if var39.eligibility ~= "Required" then isFailed else true)
	end
	local var57
	local t_1 = {
		configurationData = var37,
		isAudiencesReady = var43,
		isConfigurationRefreshPending = var33,
		isEligibilityResolved = var48,
		isNonPrivateLocked = var49,
		lockReason = var47
	}
	
	if p18 ~= nil then
		var57 = p18
	elseif var43 then
		local audiences = var37.audiences
		var57 = if audiences ~= nil then nil else t[universeConfigurationModule.getPrivacyTypeForAudiences(audiences)]
	else
		var57 = nil
	end
	t_1.selectedAudience = var57
	
	return t_1
end

local function useQuestionnaireHandler(p20, p21) --[[ line: 341 ]]
	-- upvalues: useOpenWebView (ref), reactModule (ref), fFlagBuildRehydrateOnPublishModule (ref), refreshPublishEligibilityModule (ref), gameConfigurationActionsModule (ref), localizationStringsModule (ref)
	local var59 = useOpenWebView()
	local var60 = reactModule.useCallback(function() --[[ line: 344 ]]
		-- upvalues: fFlagBuildRehydrateOnPublishModule (copy), refreshPublishEligibilityModule (copy), p20 (ref), p21 (ref)
		if fFlagBuildRehydrateOnPublishModule then
			refreshPublishEligibilityModule(p20)
			
			return
		end
		p21.fetchEligibility(p20)
		p21.fetchLatestSubmission(p20)
	end, { p21, p20 })
	
	return reactModule.useCallback(function() --[[ line: 355 ]]
		-- upvalues: var59 (ref), gameConfigurationActionsModule (copy), p20 (ref), localizationStringsModule (copy), var60 (ref)
		var59(gameConfigurationActionsModule.getExperienceQuestionnaireUrl(p20), localizationStringsModule.GAME_CONFIGURATION_CREATOR_HUB, var60)
	end, { var59, var60, p20 })
end

local _ = function(p22) --[[ line: 364 | named "cancelEligibilityRecheck" ]]
	local current = p22.current
	p22.current = nil
	
	if current ~= nil then
		current:cancel()
	end
end

local function useAudienceController(p23) --[[ line: 372 ]]
	-- upvalues: useAudienceStores (ref), reactModule (ref), fFlagBuildAudiencePublishPromptModule (ref), fFlagBuildExperienceTooltipsLightDismissModule (ref), useAudienceData (ref), useQuestionnaireHandler (ref), getAudiencesForValue (ref), fFlagBuildRehydrateOnPublishModule (ref), gameConfigurationActionsModule (ref), universeConfigurationModule (ref), debug (ref), formatErrorModule (ref), contentMaturityUtilsModule (ref)
	local var61 = useAudienceStores()
	local var62, var63 = reactModule.useState(nil)
	local var64, var65 = reactModule.useState(false)
	local var66 = nil
	
	if fFlagBuildAudiencePublishPromptModule then
		local var67 = reactModule.useRef(nil)
		var66 = var67
		reactModule.useEffect(function() --[[ line: 380 ]]
			-- upvalues: var67 (ref)
			return function() --[[ line: 381 ]]
				-- upvalues: var67 (copy)
				local current = var67.current
				var67.current = nil
				
				if current ~= nil then
					current:cancel()
				end
			end
		end, { var67, p23 })
	end
	local var68, var69 = reactModule.useState(nil)
	local var70 = if fFlagBuildExperienceTooltipsLightDismissModule then reactModule.useCallback(function() --[[ line: 389 ]]
		-- upvalues: var69 (ref)
		var69(nil)
	end, {}) else nil
	local var71 = useAudienceData(p23, var61.questionnaireStore, var61.universeActivationStore, var61.universeConfigurationStore, var62)
	local var72 = useQuestionnaireHandler(p23, var61.questionnaireStore)
	local configurationData = var71.configurationData
	local isAudiencesReady = var71.isAudiencesReady
	local isConfigurationRefreshPending = var71.isConfigurationRefreshPending
	local isEligibilityResolved = var71.isEligibilityResolved
	local isNonPrivateLocked = var71.isNonPrivateLocked
	local var73 = not isAudiencesReady or (var64 or isConfigurationRefreshPending)
	
	return {
		handleAudienceActivated = reactModule.useCallback(function(p24) --[[ line: 410 ]]
			-- upvalues: var69 (ref), var73 (ref), getAudiencesForValue (copy), configurationData (ref), var63 (ref), var65 (ref), var61 (ref), p23 (ref), fFlagBuildRehydrateOnPublishModule (copy), gameConfigurationActionsModule (copy), universeConfigurationModule (copy), debug (copy), formatErrorModule (copy), fFlagBuildAudiencePublishPromptModule (copy), isNonPrivateLocked (ref), var66 (write), contentMaturityUtilsModule (copy), isEligibilityResolved (ref)
			local function _() --[[ line: 411 | named "showLockedTooltip" ]]
				-- upvalues: var69 (copy), p24 (ref)
				var69(function(p25) --[[ line: 412 ]]
					-- upvalues: p24 (copy)
					return if p25 == p24 then nil else p24
				end)
			end
			
			local function applyAudienceChange() --[[ line: 417 ]]
				-- upvalues: var73 (copy), getAudiencesForValue (copy), p24 (ref), configurationData (copy), var69 (copy), var63 (copy), var65 (copy), var61 (copy), p23 (copy), fFlagBuildRehydrateOnPublishModule (copy), gameConfigurationActionsModule (copy), universeConfigurationModule (copy), debug (copy), formatErrorModule (copy)
				if var73 then
					return
				end
				local var78 = getAudiencesForValue(p24, configurationData.audiences)
				var69(nil)
				var63(p24)
				var65(true)
				var61.universeActivationStore.setAudiences(p23, var78):andThen(function(p27) --[[ line: 433 ]]
					-- upvalues: fFlagBuildRehydrateOnPublishModule (copy), gameConfigurationActionsModule (copy), p23 (copy), var61 (copy), universeConfigurationModule (copy), var78 (ref), debug (copy), formatErrorModule (copy), var63 (copy), var65 (copy)
					if fFlagBuildRehydrateOnPublishModule then
						gameConfigurationActionsModule.updateCachedAudience(p23, p27.audiences)
					else
						var61.universeConfigurationStore.updateSummary(p23, {
							privacyType = universeConfigurationModule.getPrivacyTypeForAudiences(var78),
							audiences = var78
						})
					end
					var61.universeActivationStore.activate(p23):andThen(function() --[[ line: 444 ]]
						-- upvalues: fFlagBuildRehydrateOnPublishModule (copy), var61 (copy), p23 (copy)
						if not fFlagBuildRehydrateOnPublishModule then
							var61.universeConfigurationStore.fetchConfiguration(p23)
						end
					end):catch(function(p28) --[[ line: 449 ]]
						-- upvalues: debug (copy), formatErrorModule (copy), p23 (copy), var63 (copy)
						debug.log("warn", "AudienceConfigurationContent activate after audience update failed", { errorMessage = formatErrorModule(p28), universeId = p23 })
						var63(nil)
					end):finally(function() --[[ line: 460 ]]
						-- upvalues: var65 (copy)
						var65(false)
					end)
				end):catch(function(p26) --[[ line: 464 ]]
					-- upvalues: debug (copy), formatErrorModule (copy), p23 (copy), var63 (copy), var65 (copy)
					debug.log("warn", "AudienceConfigurationContent set audiences failed", { errorMessage = formatErrorModule(p26), universeId = p23 })
					var63(nil)
					var65(false)
				end)
			end
			
			if fFlagBuildAudiencePublishPromptModule then
				local var75 = isNonPrivateLocked and p24 ~= "Private"
				
				if var75 then
					var69(function(p29) --[[ line: 412 ]]
						-- upvalues: p24 (ref)
						return if p29 == p24 then nil else p24
					end)
				end
				if var73 then return end
				if not var75 then
					var65(true)
				end
				local var76 = var66
				local current = var76.current
				var76.current = nil
				
				if current ~= nil then
					current:cancel()
				end
				if p24 == "Private" then
					applyAudienceChange()
					
					return
				elseif not var75 then
					var63(p24)
				end
				local var77 = var61.universeActivationStore.refreshEligibility(p23)
				var76.current = var77
				var77:catch(function(p31) --[[ line: 502 ]]
					-- upvalues: var76 (ref), var77 (ref), debug (copy), formatErrorModule (copy), p23 (copy)
					if var76.current == var77 then
						debug.log("warn", "AudienceConfigurationContent eligibility recheck failed", { errorMessage = formatErrorModule(p31), universeId = p23 })
					end
				end):finally(function() --[[ line: 510 ]]
					-- upvalues: var76 (ref), var77 (ref), contentMaturityUtilsModule (copy), p23 (copy), var75 (ref), var63 (copy), var65 (copy), var69 (copy), p24 (ref), applyAudienceChange (ref)
					if var76.current ~= var77 then return end
					var76.current = nil
					
					if not contentMaturityUtilsModule.isContentUnrated(p23) then
						applyAudienceChange()
						
						return
					elseif not var75 then
						var63(nil)
						var65(false)
						var69(function(p30) --[[ line: 412 ]]
							-- upvalues: p24 (copy)
							return if p30 == p24 then nil else p24
						end)
					end
				end)
				
				return
			elseif isNonPrivateLocked and p24 ~= "Private" then
				var69(function(p32) --[[ line: 412 ]]
					-- upvalues: p24 (ref)
					return if p32 == p24 then nil else p24
				end)
				
				return
			elseif isEligibilityResolved then
				applyAudienceChange()
				
				return
			end
		end, {
			configurationData, var66, var73, isEligibilityResolved, isNonPrivateLocked,
			var61.universeActivationStore, var61.universeConfigurationStore, p23
		}),
		handleQuestionnaire = var72,
		isMutationPending = var64,
		isNonPrivateLocked = var71.isNonPrivateLocked,
		lockReason = var71.lockReason,
		onTooltipPressedOutside = var70,
		selectedAudience = var71.selectedAudience,
		tooltipTarget = var68
	}
end

local function AudienceHeader() --[[ line: 565 ]]
	-- upvalues: reactModule (ref), view (ref), text (ref), localizationStringsModule (ref)
	return reactModule.createElement(view, {
		LayoutOrder = 1,
		tag = "col gap-xsmall size-full-0 auto-y"
	}, {
		Title = reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-title-large text-align-x-left content-default",
			Text = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PAGE_TITLE
		}),
		Body = reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "size-full-0 auto-y text-body-small text-wrap text-align-x-left content-default",
			Text = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_BODY
		})
	})
end

local function AudienceList(p33) --[[ line: 593 ]]
	-- upvalues: reactModule (ref), radioGroup (ref), list (ref), inputSize (ref), AudienceRow (ref), localizationStringsModule (ref)
	return reactModule.createElement(radioGroup.Root, {
		LayoutOrder = 2,
		Selectable = false,
		tag = "size-full-0 auto-y",
		onValueChanged = reactModule.useCallback(function(p34) --[[ line: 594 ]]
			-- upvalues: p33 (ref)
			p33.onAudienceActivated(p34)
		end, { p33.onAudienceActivated }),
		value = if p33.selectedAudience ~= nil then "" else p33.selectedAudience
	}, {
		List = reactModule.createElement(list.Root, {
			isContained = true,
			hasDivider = { hasDivider = true, isInset = false },
			size = inputSize.Medium,
			testId = `{p33.testId}-list`
		}, {
			Private = reactModule.createElement(AudienceRow, {
				LayoutOrder = 1,
				isLocked = false,
				lockIconRef = nil,
				value = "Private",
				isDisabled = p33.isDisabled,
				onActivated = p33.onAudienceActivated,
				testId = p33.testId,
				title = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PRIVATE
			}),
			Friends = reactModule.createElement(AudienceRow, {
				LayoutOrder = 2,
				value = "Friends",
				isDisabled = p33.isDisabled,
				isLocked = p33.isNonPrivateLocked,
				lockIconRef = p33.friendsLockIconRef,
				onActivated = p33.onAudienceActivated,
				testId = p33.testId,
				title = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_FRIENDS
			}),
			Public = reactModule.createElement(AudienceRow, {
				LayoutOrder = 3,
				value = "Public",
				isDisabled = p33.isDisabled,
				isLocked = p33.isNonPrivateLocked,
				lockIconRef = p33.publicLockIconRef,
				onActivated = p33.onAudienceActivated,
				testId = p33.testId,
				title = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PUBLIC
			})
		})
	})
end

local function EligibilityTooltip(p35) --[[ line: 656 ]]
	-- upvalues: useTokens (ref), useScaledValue (ref), buildExperienceAudienceTooltipMaxWidth (ref), fFlagBuildAudiencePublishPromptModule (ref), localizationStringsModule (ref), reactModule (ref), popover (ref), popoverAlign (ref), fFlagBuildExperienceTooltipsLightDismissModule (ref), radius (ref), popoverSide (ref), view (ref), text (ref)
	local var79 = fFlagBuildAudiencePublishPromptModule and p35.lockReason == "PublishRequired"
	
	return reactModule.createElement(popover.Root, {
		isOpen = p35.isOpen,
		testId = `{p35.testId}-eligibility-tooltip`
	}, {
		Anchor = reactModule.createElement(popover.Anchor, { anchorRef = p35.anchorRef }),
		Content = reactModule.createElement(popover.Content, {
			hasArrow = true,
			selectionGroup = false,
			align = popoverAlign.Center,
			backgroundStyle = useTokens().Color.System.Contrast,
			onPressedOutside = if fFlagBuildExperienceTooltipsLightDismissModule then p35.onPressedOutside else nil,
			radius = radius.Small,
			side = popoverSide.Left
		}, {
			Layout = reactModule.createElement(view, {
				tag = "col gap-xsmall auto-xy padding-x-small padding-y-small",
				sizeConstraint = {
					MaxSize = Vector2.new(useScaledValue(buildExperienceAudienceTooltipMaxWidth), 1e999)
				},
				testId = if not fFlagBuildAudiencePublishPromptModule then nil elseif var79 then `{p35.testId}-eligibility-tooltip--publish` else `{p35.testId}-eligibility-tooltip--not-eligible`
			}, {
				Title = reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "auto-xy text-title-small text-wrap text-align-x-left content-inverse-emphasis",
					Text = if var79 then localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PUBLISH_REQUIRED else localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_NOT_ELIGIBLE,
					testId = `{p35.testId}-eligibility-tooltip--header`
				}),
				Text = reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "auto-xy text-body-small text-wrap text-align-x-left content-inverse-default",
					Text = if var79 then localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PUBLISH_REQUIRED_DESCRIPTION else localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_NOT_ELIGIBLE_DESCRIPTION,
					testId = `{p35.testId}-eligibility-tooltip--text`
				})
			})
		})
	})
end

local function EligibilityBanner(p36) --[[ line: 718 ]]
	-- upvalues: reactModule (ref), view (ref), icon (ref), iconName (ref), iconSize (ref), text (ref), localizationStringsModule (ref)
	return reactModule.createElement(view, {
		LayoutOrder = 3,
		tag = "row align-y-center gap-small size-full-0 auto-y padding-medium radius-medium bg-shift-200",
		onActivated = p36.onActivated,
		stateLayer = {},
		testId = `{p36.testId}-eligibility-banner`
	}, {
		Lock = reactModule.createElement(icon, {
			LayoutOrder = 1,
			tag = "auto-xy content-emphasis",
			name = iconName.LockClosed,
			size = iconSize.Small
		}),
		Text = reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "fill auto-y text-body-small text-align-x-left text-truncate-end content-emphasis",
			Text = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_BANNER
		}),
		ExternalLink = reactModule.createElement(icon, {
			LayoutOrder = 3,
			tag = "auto-xy content-emphasis",
			name = iconName.ArrowUpRightFromSquare,
			size = iconSize.Small
		})
	})
end

return function(p37) --[[ line: 746 | named "AudienceConfigurationContent" ]]
	-- upvalues: useAudienceController (ref), reactModule (ref), fFlagBuildAudiencePublishPromptModule (ref), view (ref), AudienceHeader (ref), AudienceList (ref), EligibilityTooltip (ref), EligibilityBanner (ref)
	local testId = p37.testId or "audience-configuration-content"
	local var81 = useAudienceController(p37.universeId)
	local var82 = reactModule.useRef(nil)
	local var83 = reactModule.useRef(nil)
	
	return reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y padding-y-large",
		LayoutOrder = p37.layoutOrder,
		testId = testId
	}, {
		Header = reactModule.createElement(AudienceHeader),
		List = reactModule.createElement(AudienceList, {
			friendsLockIconRef = var82,
			isDisabled = fFlagBuildAudiencePublishPromptModule and var81.isMutationPending,
			isNonPrivateLocked = var81.isNonPrivateLocked,
			onAudienceActivated = var81.handleAudienceActivated,
			publicLockIconRef = var83,
			selectedAudience = var81.selectedAudience,
			testId = testId
		}),
		Tooltip = reactModule.createElement(EligibilityTooltip, {
			anchorRef = if var81.tooltipTarget == "Public" then var83 else var82,
			isOpen = var81.tooltipTarget ~= nil,
			lockReason = var81.lockReason,
			onPressedOutside = var81.onTooltipPressedOutside,
			testId = testId
		}),
		ContextBanner = if var81.isNonPrivateLocked and (not fFlagBuildAudiencePublishPromptModule or var81.lockReason == "RatingRequired") then reactModule.createElement(EligibilityBanner, { onActivated = var81.handleQuestionnaire, testId = testId }) else nil
	})
end