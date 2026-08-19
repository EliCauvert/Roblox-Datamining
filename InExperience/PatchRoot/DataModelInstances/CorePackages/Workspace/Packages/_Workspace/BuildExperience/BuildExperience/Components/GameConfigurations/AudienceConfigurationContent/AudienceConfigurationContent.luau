local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsReactModule = require(parent.SignalsReact)
local useOpenWebView = require(parent.WebViewUtils).useOpenWebView
local useLocalization = require(parent.Localization).Hooks.useLocalization
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
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
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

local function _(p0) --[[ line: 74 | named "getSelectedAudience" ]]
	-- upvalues: t (ref), universeConfigurationModule (ref)
	return if p0 == nil then nil else t[universeConfigurationModule.getPrivacyTypeForAudiences(p0)]
end

local _ = function(p1) --[[ line: 80 | named "isVisibilityAudience" ]]
	-- upvalues: universeActivationModule (ref)
	return if p1 ~= universeActivationModule.Audience.Public then p1 == universeActivationModule.Audience.Friends else true
end

local function getAudiencesForValue(p2, p3) --[[ line: 84 ]]
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

local function AudienceRow(p4) --[[ line: 115 ]]
	-- upvalues: reactModule (ref), icon (ref), iconName (ref), iconSize (ref), view (ref), list (ref), radioGroup (ref), inputSize (ref)
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y radius-medium",
		LayoutOrder = p4.LayoutOrder,
		onActivated = if p4.isDisabled then nil else reactModule.useCallback(function() --[[ line: 116 ]]
			-- upvalues: p4 (ref)
			p4.onActivated(p4.value)
		end, { p4.onActivated, p4.value }),
		testId = `{u794}-button`
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
					testId = `{u794}-radio`,
					value = p4.value
				})
			}),
			testId = u794
		})
	})
end

local _ = function(p5, p6, p7) --[[ line: 185 | named "getSelectedAudienceFromState" ]]
	-- upvalues: t (ref), universeConfigurationModule (ref)
	if p5 ~= nil then
		return p5
	elseif not p6 then
		return nil
	end
	local audiences = p7.audiences
	
	return if audiences == nil then nil else t[universeConfigurationModule.getPrivacyTypeForAudiences(audiences)]
end

local _ = function(p8, p9, p10) --[[ line: 197 | named "getIsNonPrivateLocked" ]]
	return p9 and (if p8.eligibility ~= "Required" then p10 else true)
end

local function getUniverseActivationStore(p11) --[[ line: 205 ]]
	-- upvalues: universeActivationModule (ref)
	return universeActivationModule.getUniverseActivationStore(p11)
end

local function getQuestionnaireStore(p12) --[[ line: 209 ]]
	-- upvalues: experienceQuestionnaireModule (ref)
	return experienceQuestionnaireModule.getExperienceQuestionnaireStore(p12)
end

local function getUniverseConfigurationStore(p13) --[[ line: 213 ]]
	-- upvalues: universeConfigurationModule (ref)
	return universeConfigurationModule.getUniverseConfigurationStore(p13)
end

local function useAudienceStores() --[[ line: 217 ]]
	-- upvalues: signalsReactModule (ref), getUniverseActivationStore (ref), getQuestionnaireStore (ref), getUniverseConfigurationStore (ref)
	return {
		universeActivationStore = signalsReactModule.useSignalState(getUniverseActivationStore),
		questionnaireStore = signalsReactModule.useSignalState(getQuestionnaireStore),
		universeConfigurationStore = signalsReactModule.useSignalState(getUniverseConfigurationStore)
	}
end

local function useAudienceData(p14, p15, p16, p17, p18) --[[ line: 229 ]]
	-- upvalues: reactModule (ref), fFlagBuildRehydrateOnPublishModule (ref), debug (ref), formatErrorModule (ref), signalsReactModule (ref), fFlagBuildAudiencePublishPromptModule (ref), contentMaturityUtilsModule (ref), t (ref), universeConfigurationModule (ref)
	local var33 = reactModule.useMemo(function() --[[ line: 236 ]]
		-- upvalues: p17 (ref), p14 (ref)
		return p17.getAndFetchConfiguration(p14)
	end, { p14, p17 })
	local var34, var35 = reactModule.useState(fFlagBuildRehydrateOnPublishModule)
	
	if fFlagBuildRehydrateOnPublishModule then
		reactModule.useEffect(function() --[[ line: 243 ]]
			-- upvalues: var35 (ref), p17 (ref), p14 (ref), debug (copy), formatErrorModule (copy)
			local var59 = true
			var35(true)
			p17.refreshConfiguration(p14):catch(function(p19) --[[ line: 248 ]]
				-- upvalues: debug (copy), formatErrorModule (copy), p14 (copy)
				debug.log("warn", "AudienceConfigurationContent configuration refresh failed", { errorMessage = formatErrorModule(p19), universeId = p14 })
			end):finally(function() --[[ line: 254 ]]
				-- upvalues: var59 (write), var35 (copy)
				if var59 then
					var35(false)
				end
			end)
			
			return function() --[[ line: 260 ]]
				-- upvalues: var59 (write)
				var59 = false
			end
		end, { p17, p14 })
	end
	local var49, var50
	local var36 = reactModule.useMemo(function() --[[ line: 265 ]]
		-- upvalues: p15 (ref), p14 (ref)
		return p15.getAndFetchEligibility(p14)
	end, { p15, p14 })
	local var37 = reactModule.useMemo(function() --[[ line: 268 ]]
		-- upvalues: p15 (ref), p14 (ref)
		return p15.getAndFetchLatestSubmission(p14)
	end, { p15, p14 })
	local var38 = signalsReactModule.useSignalState(var33.data)
	local var39 = signalsReactModule.useSignalState(var33.status)
	local var40 = signalsReactModule.useSignalState(var36.data)
	local var41 = signalsReactModule.useSignalState(var36.status)
	local var42 = signalsReactModule.useSignalState(var37.data)
	local var43 = signalsReactModule.useSignalState(var37.status)
	local var44 = var39 == "Ready" and var38 ~= nil
	local var45 = var41 == "Ready" and var40 ~= nil
	local isFailed = var43 == "Failed"
	local var47 = var45 and ((var43 == "Ready" and var42 ~= nil) or isFailed)
	local _ = nil
	local _ = nil
	local var48 = nil
	
	if fFlagBuildRehydrateOnPublishModule then
		local var51 = reactModule.useMemo(function() --[[ line: 289 ]]
			-- upvalues: p16 (ref), p14 (ref)
			return p16.getAndFetchEligibility(p14)
		end, { p16, p14 })
		local var52 = signalsReactModule.useSignalState(var51.data)
		local var53 = signalsReactModule.useSignalState(var51.status)
		local var54 = if var53 ~= "Ready" then var53 == "Failed" else true
		
		if fFlagBuildAudiencePublishPromptModule then
			var48 = if not contentMaturityUtilsModule.isContentUnrated(p14) then nil elseif contentMaturityUtilsModule.isSealBroken(p14) then "RatingRequired" else "PublishRequired"
			var50 = var48 ~= nil
			var49 = var54
		else
			local var56
			local var55 = var45 and (if var40.eligibility ~= "Required" then isFailed else true)
			var50 = reactModule.useMemo(function() --[[ line: 315 ]]
				-- upvalues: contentMaturityUtilsModule (copy), p14 (ref), var55 (ref)
				return if contentMaturityUtilsModule.isSealBroken(p14) then contentMaturityUtilsModule.isContentUnrated(p14) or var55 else false
			end, { var52, var55, p14 })
			
			if var41 ~= "Ready" then
				var56 = false
				
				if var41 == "Failed" then
					var56 = if var43 ~= "Ready" then var43 == "Failed" else true
				end
				var49 = var54 and var56
			end
		end
	else
		var49 = var47
		var50 = var45 and (if var40.eligibility ~= "Required" then isFailed else true)
	end
	local var58
	local t_1 = {
		configurationData = var38,
		isAudiencesReady = var44,
		isConfigurationRefreshPending = var34,
		isEligibilityResolved = var49,
		isNonPrivateLocked = var50,
		lockReason = var48
	}
	
	if p18 ~= nil then
		var58 = p18
	elseif var44 then
		local audiences = var38.audiences
		var58 = if audiences ~= nil then nil else t[universeConfigurationModule.getPrivacyTypeForAudiences(audiences)]
	else
		var58 = nil
	end
	t_1.selectedAudience = var58
	
	return t_1
end

local function useQuestionnaireHandler(p20, p21) --[[ line: 344 ]]
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), useOpenWebView (ref), reactModule (ref), fFlagBuildRehydrateOnPublishModule (ref), refreshPublishEligibilityModule (ref), gameConfigurationActionsModule (ref)
	local var60 = if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({
		creatorHub = localizationStringsModule.GAME_CONFIGURATION_CREATOR_HUB
	}) else nil).creatorHub else localizationStringsModule.GAME_CONFIGURATION_CREATOR_HUB
	local var61 = useOpenWebView()
	local var62 = reactModule.useCallback(function() --[[ line: 355 ]]
		-- upvalues: fFlagBuildRehydrateOnPublishModule (copy), refreshPublishEligibilityModule (copy), p20 (ref), p21 (ref)
		if fFlagBuildRehydrateOnPublishModule then
			refreshPublishEligibilityModule(p20)
			
			return
		end
		p21.fetchEligibility(p20)
		p21.fetchLatestSubmission(p20)
	end, { p21, p20 })
	
	return reactModule.useCallback(function() --[[ line: 366 ]]
		-- upvalues: var61 (ref), gameConfigurationActionsModule (copy), p20 (ref), var60 (ref), var62 (ref)
		var61(gameConfigurationActionsModule.getExperienceQuestionnaireUrl(p20), var60, var62)
	end, { var60, var61, var62, p20 })
end

local _ = function(p22) --[[ line: 375 | named "cancelEligibilityRecheck" ]]
	local current = p22.current
	p22.current = nil
	
	if current ~= nil then
		current:cancel()
	end
end

local function useAudienceController(p23) --[[ line: 383 ]]
	-- upvalues: useAudienceStores (ref), reactModule (ref), fFlagBuildAudiencePublishPromptModule (ref), fFlagBuildExperienceTooltipsLightDismissModule (ref), useAudienceData (ref), useQuestionnaireHandler (ref), getAudiencesForValue (ref), fFlagBuildRehydrateOnPublishModule (ref), gameConfigurationActionsModule (ref), universeConfigurationModule (ref), debug (ref), formatErrorModule (ref), contentMaturityUtilsModule (ref)
	local var63 = useAudienceStores()
	local var64, var65 = reactModule.useState(nil)
	local var66, var67 = reactModule.useState(false)
	local var68 = nil
	
	if fFlagBuildAudiencePublishPromptModule then
		local var69 = reactModule.useRef(nil)
		var68 = var69
		reactModule.useEffect(function() --[[ line: 391 ]]
			-- upvalues: var69 (ref)
			return function() --[[ line: 392 ]]
				-- upvalues: var69 (copy)
				local current = var69.current
				var69.current = nil
				
				if current ~= nil then
					current:cancel()
				end
			end
		end, { var69, p23 })
	end
	local var70, var71 = reactModule.useState(nil)
	local var72 = if fFlagBuildExperienceTooltipsLightDismissModule then reactModule.useCallback(function() --[[ line: 400 ]]
		-- upvalues: var71 (ref)
		var71(nil)
	end, {}) else nil
	local var73 = useAudienceData(p23, var63.questionnaireStore, var63.universeActivationStore, var63.universeConfigurationStore, var64)
	local var74 = useQuestionnaireHandler(p23, var63.questionnaireStore)
	local configurationData = var73.configurationData
	local isAudiencesReady = var73.isAudiencesReady
	local isConfigurationRefreshPending = var73.isConfigurationRefreshPending
	local isEligibilityResolved = var73.isEligibilityResolved
	local isNonPrivateLocked = var73.isNonPrivateLocked
	local var75 = not isAudiencesReady or (var66 or isConfigurationRefreshPending)
	
	return {
		handleAudienceActivated = reactModule.useCallback(function(p24) --[[ line: 421 ]]
			-- upvalues: var71 (ref), var75 (ref), getAudiencesForValue (copy), configurationData (ref), var65 (ref), var67 (ref), var63 (ref), p23 (ref), fFlagBuildRehydrateOnPublishModule (copy), gameConfigurationActionsModule (copy), universeConfigurationModule (copy), debug (copy), formatErrorModule (copy), fFlagBuildAudiencePublishPromptModule (copy), isNonPrivateLocked (ref), var68 (write), contentMaturityUtilsModule (copy), isEligibilityResolved (ref)
			local function _() --[[ line: 422 | named "showLockedTooltip" ]]
				-- upvalues: var71 (copy), p24 (ref)
				var71(function(p25) --[[ line: 423 ]]
					-- upvalues: p24 (copy)
					return if p25 == p24 then nil else p24
				end)
			end
			
			local function applyAudienceChange() --[[ line: 428 ]]
				-- upvalues: var75 (copy), getAudiencesForValue (copy), p24 (ref), configurationData (copy), var71 (copy), var65 (copy), var67 (copy), var63 (copy), p23 (copy), fFlagBuildRehydrateOnPublishModule (copy), gameConfigurationActionsModule (copy), universeConfigurationModule (copy), debug (copy), formatErrorModule (copy)
				if var75 then
					return
				end
				local var80 = getAudiencesForValue(p24, configurationData.audiences)
				var71(nil)
				var65(p24)
				var67(true)
				var63.universeActivationStore.setAudiences(p23, var80):andThen(function(p27) --[[ line: 444 ]]
					-- upvalues: fFlagBuildRehydrateOnPublishModule (copy), gameConfigurationActionsModule (copy), p23 (copy), var63 (copy), universeConfigurationModule (copy), var80 (ref), debug (copy), formatErrorModule (copy), var65 (copy), var67 (copy)
					if fFlagBuildRehydrateOnPublishModule then
						gameConfigurationActionsModule.updateCachedAudience(p23, p27.audiences)
					else
						var63.universeConfigurationStore.updateSummary(p23, {
							privacyType = universeConfigurationModule.getPrivacyTypeForAudiences(var80),
							audiences = var80
						})
					end
					var63.universeActivationStore.activate(p23):andThen(function() --[[ line: 455 ]]
						-- upvalues: fFlagBuildRehydrateOnPublishModule (copy), var63 (copy), p23 (copy)
						if not fFlagBuildRehydrateOnPublishModule then
							var63.universeConfigurationStore.fetchConfiguration(p23)
						end
					end):catch(function(p28) --[[ line: 460 ]]
						-- upvalues: debug (copy), formatErrorModule (copy), p23 (copy), var65 (copy)
						debug.log("warn", "AudienceConfigurationContent activate after audience update failed", { errorMessage = formatErrorModule(p28), universeId = p23 })
						var65(nil)
					end):finally(function() --[[ line: 471 ]]
						-- upvalues: var67 (copy)
						var67(false)
					end)
				end):catch(function(p26) --[[ line: 475 ]]
					-- upvalues: debug (copy), formatErrorModule (copy), p23 (copy), var65 (copy), var67 (copy)
					debug.log("warn", "AudienceConfigurationContent set audiences failed", { errorMessage = formatErrorModule(p26), universeId = p23 })
					var65(nil)
					var67(false)
				end)
			end
			
			if fFlagBuildAudiencePublishPromptModule then
				local var77 = isNonPrivateLocked and p24 ~= "Private"
				
				if var77 then
					var71(function(p29) --[[ line: 423 ]]
						-- upvalues: p24 (ref)
						return if p29 == p24 then nil else p24
					end)
				end
				if var75 then return end
				if not var77 then
					var67(true)
				end
				local var78 = var68
				local current = var78.current
				var78.current = nil
				
				if current ~= nil then
					current:cancel()
				end
				if p24 == "Private" then
					applyAudienceChange()
					
					return
				elseif not var77 then
					var65(p24)
				end
				local var79 = var63.universeActivationStore.refreshEligibility(p23)
				var78.current = var79
				var79:catch(function(p31) --[[ line: 513 ]]
					-- upvalues: var78 (ref), var79 (ref), debug (copy), formatErrorModule (copy), p23 (copy)
					if var78.current == var79 then
						debug.log("warn", "AudienceConfigurationContent eligibility recheck failed", { errorMessage = formatErrorModule(p31), universeId = p23 })
					end
				end):finally(function() --[[ line: 521 ]]
					-- upvalues: var78 (ref), var79 (ref), contentMaturityUtilsModule (copy), p23 (copy), var77 (ref), var65 (copy), var67 (copy), var71 (copy), p24 (ref), applyAudienceChange (ref)
					if var78.current ~= var79 then return end
					var78.current = nil
					
					if not contentMaturityUtilsModule.isContentUnrated(p23) then
						applyAudienceChange()
						
						return
					elseif not var77 then
						var65(nil)
						var67(false)
						var71(function(p30) --[[ line: 423 ]]
							-- upvalues: p24 (copy)
							return if p30 == p24 then nil else p24
						end)
					end
				end)
				
				return
			elseif isNonPrivateLocked and p24 ~= "Private" then
				var71(function(p32) --[[ line: 423 ]]
					-- upvalues: p24 (ref)
					return if p32 == p24 then nil else p24
				end)
				
				return
			elseif isEligibilityResolved then
				applyAudienceChange()
				
				return
			end
		end, {
			configurationData, var68, var75, isEligibilityResolved, isNonPrivateLocked,
			var63.universeActivationStore, var63.universeConfigurationStore, p23
		}),
		handleQuestionnaire = var74,
		isMutationPending = var66,
		isNonPrivateLocked = var73.isNonPrivateLocked,
		lockReason = var73.lockReason,
		onTooltipPressedOutside = var72,
		selectedAudience = var73.selectedAudience,
		tooltipTarget = var70
	}
end

local function AudienceHeader() --[[ line: 576 ]]
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), view (ref), text (ref)
	local GAME_CONFIGURATION_AUDIENCE_BODY, GAME_CONFIGURATION_AUDIENCE_PAGE_TITLE
	local var81 = if fFlagBuildLocalization then useLocalization({
		body = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_BODY,
		title = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PAGE_TITLE
	}) else nil
	local _ = nil
	local _ = nil
	
	if fFlagBuildLocalization then
		GAME_CONFIGURATION_AUDIENCE_BODY = var81.body
		GAME_CONFIGURATION_AUDIENCE_PAGE_TITLE = var81.title
	else
		GAME_CONFIGURATION_AUDIENCE_BODY = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_BODY
		GAME_CONFIGURATION_AUDIENCE_PAGE_TITLE = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PAGE_TITLE
	end
	return reactModule.createElement(view, {
		LayoutOrder = 1,
		tag = "col gap-xsmall size-full-0 auto-y"
	}, {
		Title = reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-title-large text-align-x-left content-default",
			Text = GAME_CONFIGURATION_AUDIENCE_PAGE_TITLE
		}),
		Body = reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "size-full-0 auto-y text-body-small text-wrap text-align-x-left content-default",
			Text = GAME_CONFIGURATION_AUDIENCE_BODY
		})
	})
end

local function AudienceList(p33) --[[ line: 620 ]]
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), radioGroup (ref), list (ref), inputSize (ref), AudienceRow (ref)
	local GAME_CONFIGURATION_AUDIENCE_FRIENDS, GAME_CONFIGURATION_AUDIENCE_PRIVATE, GAME_CONFIGURATION_AUDIENCE_PUBLIC
	local var82 = if fFlagBuildLocalization then useLocalization({
		friends = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_FRIENDS,
		private = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PRIVATE,
		["public"] = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PUBLIC
	}) else nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if fFlagBuildLocalization then
		GAME_CONFIGURATION_AUDIENCE_FRIENDS = var82.friends
		GAME_CONFIGURATION_AUDIENCE_PRIVATE = var82.private
		GAME_CONFIGURATION_AUDIENCE_PUBLIC = var82["public"]
	else
		GAME_CONFIGURATION_AUDIENCE_FRIENDS = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_FRIENDS
		GAME_CONFIGURATION_AUDIENCE_PRIVATE = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PRIVATE
		GAME_CONFIGURATION_AUDIENCE_PUBLIC = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PUBLIC
	end
	return reactModule.createElement(radioGroup.Root, {
		LayoutOrder = 2,
		Selectable = false,
		tag = "size-full-0 auto-y",
		onValueChanged = reactModule.useCallback(function(p34) --[[ line: 640 ]]
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
				title = GAME_CONFIGURATION_AUDIENCE_PRIVATE
			}),
			Friends = reactModule.createElement(AudienceRow, {
				LayoutOrder = 2,
				value = "Friends",
				isDisabled = p33.isDisabled,
				isLocked = p33.isNonPrivateLocked,
				lockIconRef = p33.friendsLockIconRef,
				onActivated = p33.onAudienceActivated,
				testId = p33.testId,
				title = GAME_CONFIGURATION_AUDIENCE_FRIENDS
			}),
			Public = reactModule.createElement(AudienceRow, {
				LayoutOrder = 3,
				value = "Public",
				isDisabled = p33.isDisabled,
				isLocked = p33.isNonPrivateLocked,
				lockIconRef = p33.publicLockIconRef,
				onActivated = p33.onAudienceActivated,
				testId = p33.testId,
				title = GAME_CONFIGURATION_AUDIENCE_PUBLIC
			})
		})
	})
end

local function EligibilityTooltip(p35) --[[ line: 702 ]]
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), useTokens (ref), useScaledValue (ref), buildExperienceAudienceTooltipMaxWidth (ref), fFlagBuildAudiencePublishPromptModule (ref), reactModule (ref), popover (ref), popoverAlign (ref), fFlagBuildExperienceTooltipsLightDismissModule (ref), radius (ref), popoverSide (ref), view (ref), text (ref)
	local GAME_CONFIGURATION_AUDIENCE_NOT_ELIGIBLE, GAME_CONFIGURATION_AUDIENCE_NOT_ELIGIBLE_DESCRIPTION, GAME_CONFIGURATION_AUDIENCE_PUBLISH_REQUIRED, GAME_CONFIGURATION_AUDIENCE_PUBLISH_REQUIRED_DESCRIPTION
	local var83 = if fFlagBuildLocalization then useLocalization({
		notEligible = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_NOT_ELIGIBLE,
		notEligibleDescription = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_NOT_ELIGIBLE_DESCRIPTION,
		publishRequired = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PUBLISH_REQUIRED,
		publishRequiredDescription = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PUBLISH_REQUIRED_DESCRIPTION
	}) else nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if fFlagBuildLocalization then
		GAME_CONFIGURATION_AUDIENCE_NOT_ELIGIBLE = var83.notEligible
		GAME_CONFIGURATION_AUDIENCE_NOT_ELIGIBLE_DESCRIPTION = var83.notEligibleDescription
		GAME_CONFIGURATION_AUDIENCE_PUBLISH_REQUIRED = var83.publishRequired
		GAME_CONFIGURATION_AUDIENCE_PUBLISH_REQUIRED_DESCRIPTION = var83.publishRequiredDescription
	else
		GAME_CONFIGURATION_AUDIENCE_NOT_ELIGIBLE = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_NOT_ELIGIBLE
		GAME_CONFIGURATION_AUDIENCE_NOT_ELIGIBLE_DESCRIPTION = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_NOT_ELIGIBLE_DESCRIPTION
		GAME_CONFIGURATION_AUDIENCE_PUBLISH_REQUIRED = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PUBLISH_REQUIRED
		GAME_CONFIGURATION_AUDIENCE_PUBLISH_REQUIRED_DESCRIPTION = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PUBLISH_REQUIRED_DESCRIPTION
	end
	local var84 = fFlagBuildAudiencePublishPromptModule and p35.lockReason == "PublishRequired"
	
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
				testId = if not fFlagBuildAudiencePublishPromptModule then nil elseif var84 then `{p35.testId}-eligibility-tooltip--publish` else `{p35.testId}-eligibility-tooltip--not-eligible`
			}, {
				Title = reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "auto-xy text-title-small text-wrap text-align-x-left content-inverse-emphasis",
					Text = if var84 then GAME_CONFIGURATION_AUDIENCE_PUBLISH_REQUIRED else GAME_CONFIGURATION_AUDIENCE_NOT_ELIGIBLE,
					testId = `{p35.testId}-eligibility-tooltip--header`
				}),
				Text = reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "auto-xy text-body-small text-wrap text-align-x-left content-inverse-default",
					Text = if var84 then GAME_CONFIGURATION_AUDIENCE_PUBLISH_REQUIRED_DESCRIPTION else GAME_CONFIGURATION_AUDIENCE_NOT_ELIGIBLE_DESCRIPTION,
					testId = `{p35.testId}-eligibility-tooltip--text`
				})
			})
		})
	})
end

local function EligibilityBanner(p36) --[[ line: 783 ]]
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), view (ref), icon (ref), iconName (ref), iconSize (ref), text (ref)
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
			Text = if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({
				banner = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_BANNER
			}) else nil).banner else localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_BANNER
		}),
		ExternalLink = reactModule.createElement(icon, {
			LayoutOrder = 3,
			tag = "auto-xy content-emphasis",
			name = iconName.ArrowUpRightFromSquare,
			size = iconSize.Small
		})
	})
end

return function(p37) --[[ line: 820 | named "AudienceConfigurationContent" ]]
	-- upvalues: useAudienceController (ref), reactModule (ref), fFlagBuildAudiencePublishPromptModule (ref), view (ref), AudienceHeader (ref), AudienceList (ref), EligibilityTooltip (ref), EligibilityBanner (ref)
	local testId = p37.testId or "audience-configuration-content"
	local var86 = useAudienceController(p37.universeId)
	local var87 = reactModule.useRef(nil)
	local var88 = reactModule.useRef(nil)
	
	return reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y padding-y-large",
		LayoutOrder = p37.layoutOrder,
		testId = testId
	}, {
		Header = reactModule.createElement(AudienceHeader),
		List = reactModule.createElement(AudienceList, {
			friendsLockIconRef = var87,
			isDisabled = fFlagBuildAudiencePublishPromptModule and var86.isMutationPending,
			isNonPrivateLocked = var86.isNonPrivateLocked,
			onAudienceActivated = var86.handleAudienceActivated,
			publicLockIconRef = var88,
			selectedAudience = var86.selectedAudience,
			testId = testId
		}),
		Tooltip = reactModule.createElement(EligibilityTooltip, {
			anchorRef = if var86.tooltipTarget == "Public" then var88 else var87,
			isOpen = var86.tooltipTarget ~= nil,
			lockReason = var86.lockReason,
			onPressedOutside = var86.onTooltipPressedOutside,
			testId = testId
		}),
		ContextBanner = if var86.isNonPrivateLocked and (not fFlagBuildAudiencePublishPromptModule or var86.lockReason == "RatingRequired") then reactModule.createElement(EligibilityBanner, { onActivated = var86.handleQuestionnaire, testId = testId }) else nil
	})
end