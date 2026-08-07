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
local gameConfigurationLabelsModule = require(buildExperience.utils.GameConfigurationLabels)
local refreshPublishEligibilityModule = require(buildExperience.utils.refreshPublishEligibility)
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
local buildExperienceAudienceTooltipMaxWidth = game:DefineFastInt("BuildExperienceAudienceTooltipMaxWidth", 220)

local function getSelectedAudience(p0) --[[ line: 56 ]]
	-- upvalues: universeActivationModule (ref)
	if p0 == nil then
		return nil
	elseif p0 then
		for i, v in p0 do
			if v == universeActivationModule.Audience.Public then
				return "Public"
			end
		end
		for i, v in p0 do
			if v == universeActivationModule.Audience.Friends then
				return "Friends"
			end
		end
	end
	return "Private"
end

local function _(p1) --[[ line: 78 | named "isVisibilityAudience" ]]
	-- upvalues: universeActivationModule (ref)
	return if p1 ~= universeActivationModule.Audience.Public then p1 == universeActivationModule.Audience.Friends else true
end

local function getAudiencesForValue(p2, p3) --[[ line: 82 ]]
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
		onActivated = reactModule.useCallback(function() --[[ line: 113 ]]
			-- upvalues: p4 (ref)
			p4.onActivated(p4.value)
		end, { p4.onActivated, p4.value })
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
					isDisabled = p4.isLocked,
					size = inputSize.Medium,
					testId = `{p4.testId}-row-{string.lower(p4.value)}-radio`,
					value = p4.value
				})
			}),
			testId = `{p4.testId}-row-{string.lower(p4.value)}`
		})
	})
end

local _ = function(p5, p6, p7) --[[ line: 176 | named "getSelectedAudienceFromState" ]]
	-- upvalues: getSelectedAudience (ref)
	return if p5 == nil then if p6 then getSelectedAudience(p7.audiences) else nil else p5
end

local _ = function(p8, p9, p10) --[[ line: 188 | named "getIsNonPrivateLocked" ]]
	return p9 and (if p8.eligibility ~= "Required" then p10 else true)
end

local function getUniverseActivationStore(p11) --[[ line: 196 ]]
	-- upvalues: universeActivationModule (ref)
	return universeActivationModule.getUniverseActivationStore(p11)
end

local function getQuestionnaireStore(p12) --[[ line: 200 ]]
	-- upvalues: experienceQuestionnaireModule (ref)
	return experienceQuestionnaireModule.getExperienceQuestionnaireStore(p12)
end

local function getUniverseConfigurationStore(p13) --[[ line: 204 ]]
	-- upvalues: universeConfigurationModule (ref)
	return universeConfigurationModule.getUniverseConfigurationStore(p13)
end

local function useAudienceStores() --[[ line: 208 ]]
	-- upvalues: signalsReactModule (ref), getUniverseActivationStore (ref), getQuestionnaireStore (ref), getUniverseConfigurationStore (ref)
	return {
		universeActivationStore = signalsReactModule.useSignalState(getUniverseActivationStore),
		questionnaireStore = signalsReactModule.useSignalState(getQuestionnaireStore),
		universeConfigurationStore = signalsReactModule.useSignalState(getUniverseConfigurationStore)
	}
end

local function useAudienceData(p14, p15, p16, p17, p18) --[[ line: 220 ]]
	-- upvalues: reactModule (ref), fFlagBuildRehydrateOnPublishModule (ref), debug (ref), signalsReactModule (ref), contentMaturityUtilsModule (ref), getSelectedAudience (ref)
	local var30 = reactModule.useMemo(function() --[[ line: 227 ]]
		-- upvalues: p17 (ref), p14 (ref)
		return p17.getAndFetchConfiguration(p14)
	end, { p14, p17 })
	local var31, var32 = reactModule.useState(fFlagBuildRehydrateOnPublishModule)
	
	if fFlagBuildRehydrateOnPublishModule then
		reactModule.useEffect(function() --[[ line: 234 ]]
			-- upvalues: var32 (ref), p17 (ref), p14 (ref), debug (copy)
			local var53 = true
			var32(true)
			p17.refreshConfiguration(p14):catch(function(p19) --[[ line: 239 ]]
				-- upvalues: debug (copy), p14 (copy)
				debug.log("warn", "AudienceConfigurationContent configuration refresh failed", { errorMessage = tostring(p19), universeId = p14 })
			end):finally(function() --[[ line: 245 ]]
				-- upvalues: var53 (write), var32 (copy)
				if var53 then
					var32(false)
				end
			end)
			
			return function() --[[ line: 251 ]]
				-- upvalues: var53 (write)
				var53 = false
			end
		end, { p17, p14 })
	end
	local var46, var45
	local var33 = reactModule.useMemo(function() --[[ line: 256 ]]
		-- upvalues: p15 (ref), p14 (ref)
		return p15.getAndFetchEligibility(p14)
	end, { p15, p14 })
	local var34 = reactModule.useMemo(function() --[[ line: 259 ]]
		-- upvalues: p15 (ref), p14 (ref)
		return p15.getAndFetchLatestSubmission(p14)
	end, { p15, p14 })
	local var35 = signalsReactModule.useSignalState(var30.data)
	local var36 = signalsReactModule.useSignalState(var30.status)
	local var37 = signalsReactModule.useSignalState(var33.data)
	local var38 = signalsReactModule.useSignalState(var33.status)
	local var39 = signalsReactModule.useSignalState(var34.data)
	local var40 = signalsReactModule.useSignalState(var34.status)
	local var41 = var36 == "Ready" and var35 ~= nil
	local var42 = var38 == "Ready" and var37 ~= nil
	local isFailed = var40 == "Failed"
	local var44 = var42 and ((var40 == "Ready" and var39 ~= nil) or isFailed)
	local _ = nil
	local _ = nil
	
	if fFlagBuildRehydrateOnPublishModule then
		local var52
		local var47 = reactModule.useMemo(function() --[[ line: 279 ]]
			-- upvalues: p16 (ref), p14 (ref)
			return p16.getAndFetchEligibility(p14)
		end, { p16, p14 })
		local var48 = signalsReactModule.useSignalState(var47.data)
		local var49 = signalsReactModule.useSignalState(var47.status)
		local var50 = var42 and (if var37.eligibility ~= "Required" then isFailed else true)
		var46 = reactModule.useMemo(function() --[[ line: 291 ]]
			-- upvalues: contentMaturityUtilsModule (copy), p14 (ref), var50 (ref)
			return if contentMaturityUtilsModule.isSealBroken(p14) then contentMaturityUtilsModule.isContentUnrated(p14) or var50 else false
		end, { var48, var50, p14 })
		local var51 = if var49 ~= "Ready" then var49 == "Failed" else true
		
		if var38 ~= "Ready" then
			var52 = false
			
			if var38 == "Failed" then
				var52 = if var40 ~= "Ready" then var40 == "Failed" else true
			end
			var45 = var51 and var52
		end
	else
		var45 = var44
		var46 = var42 and (if var37.eligibility ~= "Required" then isFailed else true)
	end
	return {
		configurationData = var35,
		isAudiencesReady = var41,
		isConfigurationRefreshPending = var31,
		isEligibilityResolved = var45,
		isNonPrivateLocked = var46,
		selectedAudience = if p18 ~= nil then if var41 then getSelectedAudience(var35.audiences) else nil else p18
	}
end

local function useQuestionnaireHandler(p20, p21) --[[ line: 320 ]]
	-- upvalues: useOpenWebView (ref), reactModule (ref), fFlagBuildRehydrateOnPublishModule (ref), refreshPublishEligibilityModule (ref), gameConfigurationActionsModule (ref), localizationStringsModule (ref)
	local var54 = useOpenWebView()
	local var55 = reactModule.useCallback(function() --[[ line: 323 ]]
		-- upvalues: fFlagBuildRehydrateOnPublishModule (copy), refreshPublishEligibilityModule (copy), p20 (ref), p21 (ref)
		if fFlagBuildRehydrateOnPublishModule then
			refreshPublishEligibilityModule(p20)
			
			return
		end
		p21.fetchEligibility(p20)
		p21.fetchLatestSubmission(p20)
	end, { p21, p20 })
	
	return reactModule.useCallback(function() --[[ line: 334 ]]
		-- upvalues: var54 (ref), gameConfigurationActionsModule (copy), p20 (ref), localizationStringsModule (copy), var55 (ref)
		var54(gameConfigurationActionsModule.getExperienceQuestionnaireUrl(p20), localizationStringsModule.GAME_CONFIGURATION_CREATOR_HUB, var55)
	end, { var54, var55, p20 })
end

local function useAudienceController(p22) --[[ line: 343 ]]
	-- upvalues: useAudienceStores (ref), reactModule (ref), useAudienceData (ref), useQuestionnaireHandler (ref), getAudiencesForValue (ref), fFlagBuildRehydrateOnPublishModule (ref), gameConfigurationActionsModule (ref), gameConfigurationLabelsModule (ref), debug (ref)
	local var56 = useAudienceStores()
	local var57, var58 = reactModule.useState(nil)
	local var59, var60 = reactModule.useState(false)
	local var61, var62 = reactModule.useState(nil)
	local var63 = useAudienceData(p22, var56.questionnaireStore, var56.universeActivationStore, var56.universeConfigurationStore, var57)
	local var64 = useQuestionnaireHandler(p22, var56.questionnaireStore)
	local configurationData = var63.configurationData
	local isAudiencesReady = var63.isAudiencesReady
	local isConfigurationRefreshPending = var63.isConfigurationRefreshPending
	local isEligibilityResolved = var63.isEligibilityResolved
	local isNonPrivateLocked = var63.isNonPrivateLocked
	
	return {
		handleAudienceActivated = reactModule.useCallback(function(p23) --[[ line: 364 ]]
			-- upvalues: isNonPrivateLocked (ref), var62 (ref), isAudiencesReady (ref), isEligibilityResolved (ref), var59 (ref), isConfigurationRefreshPending (ref), getAudiencesForValue (copy), configurationData (ref), var58 (ref), var60 (ref), var56 (ref), p22 (ref), fFlagBuildRehydrateOnPublishModule (copy), gameConfigurationActionsModule (copy), gameConfigurationLabelsModule (copy), debug (copy)
			if isNonPrivateLocked and p23 ~= "Private" then
				var62(function(p24) --[[ line: 366 ]]
					-- upvalues: p23 (ref)
					return if p24 == p23 then nil else p23
				end)
				
				return
			elseif isAudiencesReady and isEligibilityResolved and (not var59 and not isConfigurationRefreshPending) then
				local var65 = getAudiencesForValue(p23, configurationData.audiences)
				var62(nil)
				var58(p23)
				var60(true)
				var56.universeActivationStore.setAudiences(p22, var65):andThen(function(p26) --[[ line: 392 ]]
					-- upvalues: fFlagBuildRehydrateOnPublishModule (copy), gameConfigurationActionsModule (copy), p22 (copy), var56 (copy), gameConfigurationLabelsModule (copy), var65 (ref), debug (copy), var58 (copy), var60 (copy)
					if fFlagBuildRehydrateOnPublishModule then
						gameConfigurationActionsModule.updateCachedAudience(p22, p26.audiences)
					else
						var56.universeConfigurationStore.updateSummary(p22, {
							privacyType = gameConfigurationLabelsModule.getAudience({ audiences = var65 }),
							audiences = var65
						})
					end
					var56.universeActivationStore.activate(p22):andThen(function() --[[ line: 403 ]]
						-- upvalues: fFlagBuildRehydrateOnPublishModule (copy), var56 (copy), p22 (copy)
						if not fFlagBuildRehydrateOnPublishModule then
							var56.universeConfigurationStore.fetchConfiguration(p22)
						end
					end):catch(function(p27) --[[ line: 408 ]]
						-- upvalues: debug (copy), p22 (copy), var58 (copy)
						debug.log("warn", "AudienceConfigurationContent activate after audience update failed", { errorMessage = tostring(p27), universeId = p22 })
						var58(nil)
					end):finally(function() --[[ line: 419 ]]
						-- upvalues: var60 (copy)
						var60(false)
					end)
				end):catch(function(p25) --[[ line: 423 ]]
					-- upvalues: debug (copy), p22 (copy), var58 (copy), var60 (copy)
					debug.log("warn", "AudienceConfigurationContent set audiences failed", { errorMessage = tostring(p25), universeId = p22 })
					var58(nil)
					var60(false)
				end)
				
				return
			end
		end, {
			configurationData, isAudiencesReady, isConfigurationRefreshPending,
			isEligibilityResolved, var59, isNonPrivateLocked,
			var56.universeActivationStore, var56.universeConfigurationStore, p22
		}),
		handleQuestionnaire = var64,
		isNonPrivateLocked = var63.isNonPrivateLocked,
		selectedAudience = var63.selectedAudience,
		tooltipTarget = var61
	}
end

local function AudienceHeader() --[[ line: 454 ]]
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

local function AudienceList(p28) --[[ line: 481 ]]
	-- upvalues: reactModule (ref), radioGroup (ref), list (ref), inputSize (ref), AudienceRow (ref), localizationStringsModule (ref)
	return reactModule.createElement(radioGroup.Root, {
		LayoutOrder = 2,
		Selectable = false,
		tag = "size-full-0 auto-y",
		onValueChanged = reactModule.useCallback(function(p29) --[[ line: 482 ]]
			-- upvalues: p28 (ref)
			p28.onAudienceActivated(p29)
		end, { p28.onAudienceActivated }),
		value = if p28.selectedAudience ~= nil then "" else p28.selectedAudience
	}, {
		List = reactModule.createElement(list.Root, {
			isContained = true,
			hasDivider = { hasDivider = true, isInset = false },
			size = inputSize.Medium,
			testId = `{p28.testId}-list`
		}, {
			Private = reactModule.createElement(AudienceRow, {
				LayoutOrder = 1,
				isLocked = false,
				lockIconRef = nil,
				value = "Private",
				onActivated = p28.onAudienceActivated,
				testId = p28.testId,
				title = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PRIVATE
			}),
			Friends = reactModule.createElement(AudienceRow, {
				LayoutOrder = 2,
				value = "Friends",
				isLocked = p28.isNonPrivateLocked,
				lockIconRef = p28.friendsLockIconRef,
				onActivated = p28.onAudienceActivated,
				testId = p28.testId,
				title = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_FRIENDS
			}),
			Public = reactModule.createElement(AudienceRow, {
				LayoutOrder = 3,
				value = "Public",
				isLocked = p28.isNonPrivateLocked,
				lockIconRef = p28.publicLockIconRef,
				onActivated = p28.onAudienceActivated,
				testId = p28.testId,
				title = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PUBLIC
			})
		})
	})
end

local function EligibilityTooltip(p30) --[[ line: 539 ]]
	-- upvalues: useTokens (ref), useScaledValue (ref), buildExperienceAudienceTooltipMaxWidth (ref), reactModule (ref), popover (ref), popoverAlign (ref), radius (ref), popoverSide (ref), view (ref), text (ref), localizationStringsModule (ref)
	return reactModule.createElement(popover.Root, {
		isOpen = p30.isOpen,
		testId = `{p30.testId}-eligibility-tooltip`
	}, {
		Anchor = reactModule.createElement(popover.Anchor, { anchorRef = p30.anchorRef }),
		Content = reactModule.createElement(popover.Content, {
			hasArrow = true,
			selectionGroup = false,
			align = popoverAlign.Center,
			backgroundStyle = useTokens().Color.System.Contrast,
			radius = radius.Small,
			side = popoverSide.Left
		}, {
			Layout = reactModule.createElement(view, {
				tag = "col gap-xsmall auto-xy padding-x-small padding-y-small",
				sizeConstraint = {
					MaxSize = Vector2.new(useScaledValue(buildExperienceAudienceTooltipMaxWidth), 1e999)
				}
			}, {
				Title = reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "auto-xy text-title-small text-wrap text-align-x-left content-inverse-emphasis",
					Text = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_NOT_ELIGIBLE,
					testId = `{p30.testId}-eligibility-tooltip--header`
				}),
				Text = reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "auto-xy text-body-small text-wrap text-align-x-left content-inverse-default",
					Text = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_NOT_ELIGIBLE_DESCRIPTION,
					testId = `{p30.testId}-eligibility-tooltip--text`
				})
			})
		})
	})
end

local function EligibilityBanner(p31) --[[ line: 586 ]]
	-- upvalues: reactModule (ref), view (ref), icon (ref), iconName (ref), iconSize (ref), text (ref), localizationStringsModule (ref)
	return reactModule.createElement(view, {
		LayoutOrder = 3,
		tag = "row align-y-center gap-small size-full-0 auto-y padding-medium radius-medium bg-shift-200",
		onActivated = p31.onActivated,
		stateLayer = {},
		testId = `{p31.testId}-eligibility-banner`
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

return function(p32) --[[ line: 614 | named "AudienceConfigurationContent" ]]
	-- upvalues: useAudienceController (ref), reactModule (ref), view (ref), AudienceHeader (ref), AudienceList (ref), EligibilityTooltip (ref), EligibilityBanner (ref)
	local testId = p32.testId or "audience-configuration-content"
	local var67 = useAudienceController(p32.universeId)
	local var68 = reactModule.useRef(nil)
	local var69 = reactModule.useRef(nil)
	
	return reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y padding-y-large",
		LayoutOrder = p32.layoutOrder,
		testId = testId
	}, {
		Header = reactModule.createElement(AudienceHeader),
		List = reactModule.createElement(AudienceList, {
			friendsLockIconRef = var68,
			isNonPrivateLocked = var67.isNonPrivateLocked,
			onAudienceActivated = var67.handleAudienceActivated,
			publicLockIconRef = var69,
			selectedAudience = var67.selectedAudience,
			testId = testId
		}),
		Tooltip = reactModule.createElement(EligibilityTooltip, {
			anchorRef = if var67.tooltipTarget == "Public" then var69 else var68,
			isOpen = var67.tooltipTarget ~= nil,
			testId = testId
		}),
		ContextBanner = if var67.isNonPrivateLocked then reactModule.createElement(EligibilityBanner, { onActivated = var67.handleQuestionnaire, testId = testId }) else nil
	})
end