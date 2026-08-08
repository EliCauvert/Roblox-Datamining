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

local function _(p0) --[[ line: 70 | named "getSelectedAudience" ]]
	-- upvalues: t (ref), universeConfigurationModule (ref)
	return if p0 == nil then nil else t[universeConfigurationModule.getPrivacyTypeForAudiences(p0)]
end

local _ = function(p1) --[[ line: 76 | named "isVisibilityAudience" ]]
	-- upvalues: universeActivationModule (ref)
	return if p1 ~= universeActivationModule.Audience.Public then p1 == universeActivationModule.Audience.Friends else true
end

local function getAudiencesForValue(p2, p3) --[[ line: 80 ]]
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

local function AudienceRow(p4) --[[ line: 111 ]]
	-- upvalues: reactModule (ref), icon (ref), iconName (ref), iconSize (ref), view (ref), list (ref), radioGroup (ref), inputSize (ref)
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y radius-medium",
		LayoutOrder = p4.LayoutOrder,
		onActivated = if p4.isDisabled then nil else reactModule.useCallback(function() --[[ line: 112 ]]
			-- upvalues: p4 (ref)
			p4.onActivated(p4.value)
		end, { p4.onActivated, p4.value }),
		testId = `{u745}-button`
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
					testId = `{u745}-radio`,
					value = p4.value
				})
			}),
			testId = u745
		})
	})
end

local _ = function(p5, p6, p7) --[[ line: 180 | named "getSelectedAudienceFromState" ]]
	-- upvalues: t (ref), universeConfigurationModule (ref)
	if p5 ~= nil then
		return p5
	elseif not p6 then
		return nil
	end
	local audiences = p7.audiences
	
	return if audiences == nil then nil else t[universeConfigurationModule.getPrivacyTypeForAudiences(audiences)]
end

local _ = function(p8, p9, p10) --[[ line: 192 | named "getIsNonPrivateLocked" ]]
	return p9 and (if p8.eligibility ~= "Required" then p10 else true)
end

local function getUniverseActivationStore(p11) --[[ line: 200 ]]
	-- upvalues: universeActivationModule (ref)
	return universeActivationModule.getUniverseActivationStore(p11)
end

local function getQuestionnaireStore(p12) --[[ line: 204 ]]
	-- upvalues: experienceQuestionnaireModule (ref)
	return experienceQuestionnaireModule.getExperienceQuestionnaireStore(p12)
end

local function getUniverseConfigurationStore(p13) --[[ line: 208 ]]
	-- upvalues: universeConfigurationModule (ref)
	return universeConfigurationModule.getUniverseConfigurationStore(p13)
end

local function useAudienceStores() --[[ line: 212 ]]
	-- upvalues: signalsReactModule (ref), getUniverseActivationStore (ref), getQuestionnaireStore (ref), getUniverseConfigurationStore (ref)
	return {
		universeActivationStore = signalsReactModule.useSignalState(getUniverseActivationStore),
		questionnaireStore = signalsReactModule.useSignalState(getQuestionnaireStore),
		universeConfigurationStore = signalsReactModule.useSignalState(getUniverseConfigurationStore)
	}
end

local function useAudienceData(p14, p15, p16, p17, p18) --[[ line: 224 ]]
	-- upvalues: reactModule (ref), fFlagBuildRehydrateOnPublishModule (ref), debug (ref), formatErrorModule (ref), signalsReactModule (ref), fFlagBuildAudiencePublishPromptModule (ref), contentMaturityUtilsModule (ref), t (ref), universeConfigurationModule (ref)
	local var31 = reactModule.useMemo(function() --[[ line: 231 ]]
		-- upvalues: p17 (ref), p14 (ref)
		return p17.getAndFetchConfiguration(p14)
	end, { p14, p17 })
	local var32, var33 = reactModule.useState(fFlagBuildRehydrateOnPublishModule)
	
	if fFlagBuildRehydrateOnPublishModule then
		reactModule.useEffect(function() --[[ line: 238 ]]
			-- upvalues: var33 (ref), p17 (ref), p14 (ref), debug (copy), formatErrorModule (copy)
			local var57 = true
			var33(true)
			p17.refreshConfiguration(p14):catch(function(p19) --[[ line: 243 ]]
				-- upvalues: debug (copy), formatErrorModule (copy), p14 (copy)
				debug.log("warn", "AudienceConfigurationContent configuration refresh failed", { errorMessage = formatErrorModule(p19), universeId = p14 })
			end):finally(function() --[[ line: 249 ]]
				-- upvalues: var57 (write), var33 (copy)
				if var57 then
					var33(false)
				end
			end)
			
			return function() --[[ line: 255 ]]
				-- upvalues: var57 (write)
				var57 = false
			end
		end, { p17, p14 })
	end
	local var47, var48
	local var34 = reactModule.useMemo(function() --[[ line: 260 ]]
		-- upvalues: p15 (ref), p14 (ref)
		return p15.getAndFetchEligibility(p14)
	end, { p15, p14 })
	local var35 = reactModule.useMemo(function() --[[ line: 263 ]]
		-- upvalues: p15 (ref), p14 (ref)
		return p15.getAndFetchLatestSubmission(p14)
	end, { p15, p14 })
	local var36 = signalsReactModule.useSignalState(var31.data)
	local var37 = signalsReactModule.useSignalState(var31.status)
	local var38 = signalsReactModule.useSignalState(var34.data)
	local var39 = signalsReactModule.useSignalState(var34.status)
	local var40 = signalsReactModule.useSignalState(var35.data)
	local var41 = signalsReactModule.useSignalState(var35.status)
	local var42 = var37 == "Ready" and var36 ~= nil
	local var43 = var39 == "Ready" and var38 ~= nil
	local isFailed = var41 == "Failed"
	local var45 = var43 and ((var41 == "Ready" and var40 ~= nil) or isFailed)
	local _ = nil
	local _ = nil
	local var46 = nil
	
	if fFlagBuildRehydrateOnPublishModule then
		local var49 = reactModule.useMemo(function() --[[ line: 284 ]]
			-- upvalues: p16 (ref), p14 (ref)
			return p16.getAndFetchEligibility(p14)
		end, { p16, p14 })
		local var50 = signalsReactModule.useSignalState(var49.data)
		local var51 = signalsReactModule.useSignalState(var49.status)
		local var52 = if var51 ~= "Ready" then var51 == "Failed" else true
		
		if fFlagBuildAudiencePublishPromptModule then
			var46 = if not contentMaturityUtilsModule.isContentUnrated(p14) then nil elseif contentMaturityUtilsModule.isSealBroken(p14) then "RatingRequired" else "PublishRequired"
			var48 = var46 ~= nil
			var47 = var52
		else
			local var54
			local var53 = var43 and (if var38.eligibility ~= "Required" then isFailed else true)
			var48 = reactModule.useMemo(function() --[[ line: 310 ]]
				-- upvalues: contentMaturityUtilsModule (copy), p14 (ref), var53 (ref)
				return if contentMaturityUtilsModule.isSealBroken(p14) then contentMaturityUtilsModule.isContentUnrated(p14) or var53 else false
			end, { var50, var53, p14 })
			
			if var39 ~= "Ready" then
				var54 = false
				
				if var39 == "Failed" then
					var54 = if var41 ~= "Ready" then var41 == "Failed" else true
				end
				var47 = var52 and var54
			end
		end
	else
		var47 = var45
		var48 = var43 and (if var38.eligibility ~= "Required" then isFailed else true)
	end
	local var56
	local t_1 = {
		configurationData = var36,
		isAudiencesReady = var42,
		isConfigurationRefreshPending = var32,
		isEligibilityResolved = var47,
		isNonPrivateLocked = var48,
		lockReason = var46
	}
	
	if p18 ~= nil then
		var56 = p18
	elseif var42 then
		local audiences = var36.audiences
		var56 = if audiences ~= nil then nil else t[universeConfigurationModule.getPrivacyTypeForAudiences(audiences)]
	else
		var56 = nil
	end
	t_1.selectedAudience = var56
	
	return t_1
end

local function useQuestionnaireHandler(p20, p21) --[[ line: 339 ]]
	-- upvalues: useOpenWebView (ref), reactModule (ref), fFlagBuildRehydrateOnPublishModule (ref), refreshPublishEligibilityModule (ref), gameConfigurationActionsModule (ref), localizationStringsModule (ref)
	local var58 = useOpenWebView()
	local var59 = reactModule.useCallback(function() --[[ line: 342 ]]
		-- upvalues: fFlagBuildRehydrateOnPublishModule (copy), refreshPublishEligibilityModule (copy), p20 (ref), p21 (ref)
		if fFlagBuildRehydrateOnPublishModule then
			refreshPublishEligibilityModule(p20)
			
			return
		end
		p21.fetchEligibility(p20)
		p21.fetchLatestSubmission(p20)
	end, { p21, p20 })
	
	return reactModule.useCallback(function() --[[ line: 353 ]]
		-- upvalues: var58 (ref), gameConfigurationActionsModule (copy), p20 (ref), localizationStringsModule (copy), var59 (ref)
		var58(gameConfigurationActionsModule.getExperienceQuestionnaireUrl(p20), localizationStringsModule.GAME_CONFIGURATION_CREATOR_HUB, var59)
	end, { var58, var59, p20 })
end

local _ = function(p22) --[[ line: 362 | named "cancelEligibilityRecheck" ]]
	local current = p22.current
	p22.current = nil
	
	if current ~= nil then
		current:cancel()
	end
end

local function useAudienceController(p23) --[[ line: 370 ]]
	-- upvalues: useAudienceStores (ref), reactModule (ref), fFlagBuildAudiencePublishPromptModule (ref), useAudienceData (ref), useQuestionnaireHandler (ref), getAudiencesForValue (ref), fFlagBuildRehydrateOnPublishModule (ref), gameConfigurationActionsModule (ref), universeConfigurationModule (ref), debug (ref), formatErrorModule (ref), contentMaturityUtilsModule (ref)
	local var60 = useAudienceStores()
	local var61, var62 = reactModule.useState(nil)
	local var63, var64 = reactModule.useState(false)
	local var65 = nil
	
	if fFlagBuildAudiencePublishPromptModule then
		local var66 = reactModule.useRef(nil)
		var65 = var66
		reactModule.useEffect(function() --[[ line: 378 ]]
			-- upvalues: var66 (ref)
			return function() --[[ line: 379 ]]
				-- upvalues: var66 (copy)
				local current = var66.current
				var66.current = nil
				
				if current ~= nil then
					current:cancel()
				end
			end
		end, { var66, p23 })
	end
	local var67, var68 = reactModule.useState(nil)
	local var69 = useAudienceData(p23, var60.questionnaireStore, var60.universeActivationStore, var60.universeConfigurationStore, var61)
	local var70 = useQuestionnaireHandler(p23, var60.questionnaireStore)
	local configurationData = var69.configurationData
	local isAudiencesReady = var69.isAudiencesReady
	local isConfigurationRefreshPending = var69.isConfigurationRefreshPending
	local isEligibilityResolved = var69.isEligibilityResolved
	local isNonPrivateLocked = var69.isNonPrivateLocked
	local var71 = not isAudiencesReady or (var63 or isConfigurationRefreshPending)
	
	return {
		handleAudienceActivated = reactModule.useCallback(function(p24) --[[ line: 402 ]]
			-- upvalues: var68 (ref), var71 (ref), getAudiencesForValue (copy), configurationData (ref), var62 (ref), var64 (ref), var60 (ref), p23 (ref), fFlagBuildRehydrateOnPublishModule (copy), gameConfigurationActionsModule (copy), universeConfigurationModule (copy), debug (copy), formatErrorModule (copy), fFlagBuildAudiencePublishPromptModule (copy), isNonPrivateLocked (ref), var65 (write), contentMaturityUtilsModule (copy), isEligibilityResolved (ref)
			local function _() --[[ line: 403 | named "showLockedTooltip" ]]
				-- upvalues: var68 (copy), p24 (ref)
				var68(function(p25) --[[ line: 404 ]]
					-- upvalues: p24 (copy)
					return if p25 == p24 then nil else p24
				end)
			end
			
			local function applyAudienceChange() --[[ line: 409 ]]
				-- upvalues: var71 (copy), getAudiencesForValue (copy), p24 (ref), configurationData (copy), var68 (copy), var62 (copy), var64 (copy), var60 (copy), p23 (copy), fFlagBuildRehydrateOnPublishModule (copy), gameConfigurationActionsModule (copy), universeConfigurationModule (copy), debug (copy), formatErrorModule (copy)
				if var71 then
					return
				end
				local var76 = getAudiencesForValue(p24, configurationData.audiences)
				var68(nil)
				var62(p24)
				var64(true)
				var60.universeActivationStore.setAudiences(p23, var76):andThen(function(p27) --[[ line: 425 ]]
					-- upvalues: fFlagBuildRehydrateOnPublishModule (copy), gameConfigurationActionsModule (copy), p23 (copy), var60 (copy), universeConfigurationModule (copy), var76 (ref), debug (copy), formatErrorModule (copy), var62 (copy), var64 (copy)
					if fFlagBuildRehydrateOnPublishModule then
						gameConfigurationActionsModule.updateCachedAudience(p23, p27.audiences)
					else
						var60.universeConfigurationStore.updateSummary(p23, {
							privacyType = universeConfigurationModule.getPrivacyTypeForAudiences(var76),
							audiences = var76
						})
					end
					var60.universeActivationStore.activate(p23):andThen(function() --[[ line: 436 ]]
						-- upvalues: fFlagBuildRehydrateOnPublishModule (copy), var60 (copy), p23 (copy)
						if not fFlagBuildRehydrateOnPublishModule then
							var60.universeConfigurationStore.fetchConfiguration(p23)
						end
					end):catch(function(p28) --[[ line: 441 ]]
						-- upvalues: debug (copy), formatErrorModule (copy), p23 (copy), var62 (copy)
						debug.log("warn", "AudienceConfigurationContent activate after audience update failed", { errorMessage = formatErrorModule(p28), universeId = p23 })
						var62(nil)
					end):finally(function() --[[ line: 452 ]]
						-- upvalues: var64 (copy)
						var64(false)
					end)
				end):catch(function(p26) --[[ line: 456 ]]
					-- upvalues: debug (copy), formatErrorModule (copy), p23 (copy), var62 (copy), var64 (copy)
					debug.log("warn", "AudienceConfigurationContent set audiences failed", { errorMessage = formatErrorModule(p26), universeId = p23 })
					var62(nil)
					var64(false)
				end)
			end
			
			if fFlagBuildAudiencePublishPromptModule then
				local var73 = isNonPrivateLocked and p24 ~= "Private"
				
				if var73 then
					var68(function(p29) --[[ line: 404 ]]
						-- upvalues: p24 (ref)
						return if p29 == p24 then nil else p24
					end)
				end
				if var71 then return end
				if not var73 then
					var64(true)
				end
				local var74 = var65
				local current = var74.current
				var74.current = nil
				
				if current ~= nil then
					current:cancel()
				end
				if p24 == "Private" then
					applyAudienceChange()
					
					return
				elseif not var73 then
					var62(p24)
				end
				local var75 = var60.universeActivationStore.refreshEligibility(p23)
				var74.current = var75
				var75:catch(function(p31) --[[ line: 494 ]]
					-- upvalues: var74 (ref), var75 (ref), debug (copy), formatErrorModule (copy), p23 (copy)
					if var74.current == var75 then
						debug.log("warn", "AudienceConfigurationContent eligibility recheck failed", { errorMessage = formatErrorModule(p31), universeId = p23 })
					end
				end):finally(function() --[[ line: 502 ]]
					-- upvalues: var74 (ref), var75 (ref), contentMaturityUtilsModule (copy), p23 (copy), var73 (ref), var62 (copy), var64 (copy), var68 (copy), p24 (ref), applyAudienceChange (ref)
					if var74.current ~= var75 then return end
					var74.current = nil
					
					if not contentMaturityUtilsModule.isContentUnrated(p23) then
						applyAudienceChange()
						
						return
					elseif not var73 then
						var62(nil)
						var64(false)
						var68(function(p30) --[[ line: 404 ]]
							-- upvalues: p24 (copy)
							return if p30 == p24 then nil else p24
						end)
					end
				end)
				
				return
			elseif isNonPrivateLocked and p24 ~= "Private" then
				var68(function(p32) --[[ line: 404 ]]
					-- upvalues: p24 (ref)
					return if p32 == p24 then nil else p24
				end)
				
				return
			elseif isEligibilityResolved then
				applyAudienceChange()
				
				return
			end
		end, {
			configurationData, var65, var71, isEligibilityResolved, isNonPrivateLocked,
			var60.universeActivationStore, var60.universeConfigurationStore, p23
		}),
		handleQuestionnaire = var70,
		isMutationPending = var63,
		isNonPrivateLocked = var69.isNonPrivateLocked,
		lockReason = var69.lockReason,
		selectedAudience = var69.selectedAudience,
		tooltipTarget = var67
	}
end

local function AudienceHeader() --[[ line: 556 ]]
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

local function AudienceList(p33) --[[ line: 584 ]]
	-- upvalues: reactModule (ref), radioGroup (ref), list (ref), inputSize (ref), AudienceRow (ref), localizationStringsModule (ref)
	return reactModule.createElement(radioGroup.Root, {
		LayoutOrder = 2,
		Selectable = false,
		tag = "size-full-0 auto-y",
		onValueChanged = reactModule.useCallback(function(p34) --[[ line: 585 ]]
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

local function EligibilityTooltip(p35) --[[ line: 646 ]]
	-- upvalues: useTokens (ref), useScaledValue (ref), buildExperienceAudienceTooltipMaxWidth (ref), fFlagBuildAudiencePublishPromptModule (ref), localizationStringsModule (ref), reactModule (ref), popover (ref), popoverAlign (ref), radius (ref), popoverSide (ref), view (ref), text (ref)
	local var77 = fFlagBuildAudiencePublishPromptModule and p35.lockReason == "PublishRequired"
	
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
			radius = radius.Small,
			side = popoverSide.Left
		}, {
			Layout = reactModule.createElement(view, {
				tag = "col gap-xsmall auto-xy padding-x-small padding-y-small",
				sizeConstraint = {
					MaxSize = Vector2.new(useScaledValue(buildExperienceAudienceTooltipMaxWidth), 1e999)
				},
				testId = if not fFlagBuildAudiencePublishPromptModule then nil elseif var77 then `{p35.testId}-eligibility-tooltip--publish` else `{p35.testId}-eligibility-tooltip--not-eligible`
			}, {
				Title = reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "auto-xy text-title-small text-wrap text-align-x-left content-inverse-emphasis",
					Text = if var77 then localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PUBLISH_REQUIRED else localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_NOT_ELIGIBLE,
					testId = `{p35.testId}-eligibility-tooltip--header`
				}),
				Text = reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "auto-xy text-body-small text-wrap text-align-x-left content-inverse-default",
					Text = if var77 then localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PUBLISH_REQUIRED_DESCRIPTION else localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_NOT_ELIGIBLE_DESCRIPTION,
					testId = `{p35.testId}-eligibility-tooltip--text`
				})
			})
		})
	})
end

local function EligibilityBanner(p36) --[[ line: 705 ]]
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

return function(p37) --[[ line: 733 | named "AudienceConfigurationContent" ]]
	-- upvalues: useAudienceController (ref), reactModule (ref), fFlagBuildAudiencePublishPromptModule (ref), view (ref), AudienceHeader (ref), AudienceList (ref), EligibilityTooltip (ref), EligibilityBanner (ref)
	local testId = p37.testId or "audience-configuration-content"
	local var79 = useAudienceController(p37.universeId)
	local var80 = reactModule.useRef(nil)
	local var81 = reactModule.useRef(nil)
	
	return reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y padding-y-large",
		LayoutOrder = p37.layoutOrder,
		testId = testId
	}, {
		Header = reactModule.createElement(AudienceHeader),
		List = reactModule.createElement(AudienceList, {
			friendsLockIconRef = var80,
			isDisabled = fFlagBuildAudiencePublishPromptModule and var79.isMutationPending,
			isNonPrivateLocked = var79.isNonPrivateLocked,
			onAudienceActivated = var79.handleAudienceActivated,
			publicLockIconRef = var81,
			selectedAudience = var79.selectedAudience,
			testId = testId
		}),
		Tooltip = reactModule.createElement(EligibilityTooltip, {
			anchorRef = if var79.tooltipTarget == "Public" then var81 else var80,
			isOpen = var79.tooltipTarget ~= nil,
			lockReason = var79.lockReason,
			testId = testId
		}),
		ContextBanner = if var79.isNonPrivateLocked and (not fFlagBuildAudiencePublishPromptModule or var79.lockReason == "RatingRequired") then reactModule.createElement(EligibilityBanner, { onActivated = var79.handleQuestionnaire, testId = testId }) else nil
	})
end