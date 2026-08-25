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

local function _(p0)
	-- upvalues: t (ref), universeConfigurationModule (ref)
	return if p0 == nil then nil else t[universeConfigurationModule.getPrivacyTypeForAudiences(p0)]
end

local _ = function(p1)
	-- upvalues: universeActivationModule (ref)
	return if p1 ~= universeActivationModule.Audience.Public then p1 == universeActivationModule.Audience.Friends else true
end

local function getAudiencesForValue(p2, p3)
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

local function AudienceRow(p4)
	-- upvalues: reactModule (ref), icon (ref), iconName (ref), iconSize (ref), view (ref), list (ref), radioGroup (ref), inputSize (ref)
	local testId = `{p4.testId}-row-{string.lower(p4.value)}`
	
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y radius-medium",
		LayoutOrder = p4.LayoutOrder,
		onActivated = if p4.isDisabled then nil else reactModule.useCallback(function()
			-- upvalues: p4 (ref)
			p4.onActivated(p4.value)
		end, { p4.onActivated, p4.value }),
		testId = `{testId}-button`
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
					testId = `{testId}-radio`,
					value = p4.value
				})
			}),
			testId = testId
		})
	})
end

local _ = function(p5, p6, p7)
	-- upvalues: t (ref), universeConfigurationModule (ref)
	if p5 ~= nil then
		return p5
	elseif not p6 then
		return nil
	end
	local audiences = p7.audiences
	
	return if audiences == nil then nil else t[universeConfigurationModule.getPrivacyTypeForAudiences(audiences)]
end

local _ = function(p8, p9, p10)
	return p9 and (if p8.eligibility ~= "Required" then p10 else true)
end

local function getUniverseActivationStore(p11)
	-- upvalues: universeActivationModule (ref)
	return universeActivationModule.getUniverseActivationStore(p11)
end

local function getQuestionnaireStore(p12)
	-- upvalues: experienceQuestionnaireModule (ref)
	return experienceQuestionnaireModule.getExperienceQuestionnaireStore(p12)
end

local function getUniverseConfigurationStore(p13)
	-- upvalues: universeConfigurationModule (ref)
	return universeConfigurationModule.getUniverseConfigurationStore(p13)
end

local function useAudienceStores()
	-- upvalues: signalsReactModule (ref), getUniverseActivationStore (ref), getQuestionnaireStore (ref), getUniverseConfigurationStore (ref)
	return {
		universeActivationStore = signalsReactModule.useSignalState(getUniverseActivationStore),
		questionnaireStore = signalsReactModule.useSignalState(getQuestionnaireStore),
		universeConfigurationStore = signalsReactModule.useSignalState(getUniverseConfigurationStore)
	}
end

local function useAudienceData(p14, p15, p16, p17, p18)
	-- upvalues: reactModule (ref), fFlagBuildRehydrateOnPublishModule (ref), debug (ref), formatErrorModule (ref), signalsReactModule (ref), fFlagBuildAudiencePublishPromptModule (ref), contentMaturityUtilsModule (ref), t (ref), universeConfigurationModule (ref)
	local var34 = reactModule.useMemo(function()
		-- upvalues: p17 (ref), p14 (ref)
		return p17.getAndFetchConfiguration(p14)
	end, { p14, p17 })
	local var35, var36 = reactModule.useState(fFlagBuildRehydrateOnPublishModule)
	
	if fFlagBuildRehydrateOnPublishModule then
		reactModule.useEffect(function()
			-- upvalues: var36 (ref), p17 (ref), p14 (ref), debug (copy), formatErrorModule (copy)
			local var60 = true
			var36(true)
			p17.refreshConfiguration(p14):catch(function(p19)
				-- upvalues: debug (copy), formatErrorModule (copy), p14 (copy)
				debug.log("warn", "AudienceConfigurationContent configuration refresh failed", { errorMessage = formatErrorModule(p19), universeId = p14 })
			end):finally(function()
				-- upvalues: var60 (write), var36 (copy)
				if var60 then
					var36(false)
				end
			end)
			
			return function()
				-- upvalues: var60 (write)
				var60 = false
			end
		end, { p17, p14 })
	end
	local var50, var51
	local var37 = reactModule.useMemo(function()
		-- upvalues: p15 (ref), p14 (ref)
		return p15.getAndFetchEligibility(p14)
	end, { p15, p14 })
	local var38 = reactModule.useMemo(function()
		-- upvalues: p15 (ref), p14 (ref)
		return p15.getAndFetchLatestSubmission(p14)
	end, { p15, p14 })
	local var39 = signalsReactModule.useSignalState(var34.data)
	local var40 = signalsReactModule.useSignalState(var34.status)
	local var41 = signalsReactModule.useSignalState(var37.data)
	local var42 = signalsReactModule.useSignalState(var37.status)
	local var43 = signalsReactModule.useSignalState(var38.data)
	local var44 = signalsReactModule.useSignalState(var38.status)
	local var45 = var40 == "Ready" and var39 ~= nil
	local var46 = var42 == "Ready" and var41 ~= nil
	local isFailed = var44 == "Failed"
	local var48 = var46 and ((var44 == "Ready" and var43 ~= nil) or isFailed)
	local _ = nil
	local _ = nil
	local var49 = nil
	
	if fFlagBuildRehydrateOnPublishModule then
		local var52 = reactModule.useMemo(function()
			-- upvalues: p16 (ref), p14 (ref)
			return p16.getAndFetchEligibility(p14)
		end, { p16, p14 })
		local var53 = signalsReactModule.useSignalState(var52.data)
		local var54 = signalsReactModule.useSignalState(var52.status)
		local var55 = if var54 ~= "Ready" then var54 == "Failed" else true
		
		if fFlagBuildAudiencePublishPromptModule then
			var49 = if not contentMaturityUtilsModule.isContentUnrated(p14) then nil elseif contentMaturityUtilsModule.isSealBroken(p14) then "RatingRequired" else "PublishRequired"
			var51 = var49 ~= nil
			var50 = var55
		else
			local var57
			local var56 = var46 and (if var41.eligibility ~= "Required" then isFailed else true)
			var51 = reactModule.useMemo(function()
				-- upvalues: contentMaturityUtilsModule (copy), p14 (ref), var56 (ref)
				return if contentMaturityUtilsModule.isSealBroken(p14) then contentMaturityUtilsModule.isContentUnrated(p14) or var56 else false
			end, { var53, var56, p14 })
			
			if var42 ~= "Ready" then
				var57 = false
				
				if var42 == "Failed" then
					var57 = if var44 ~= "Ready" then var44 == "Failed" else true
				end
				var50 = var55 and var57
			end
		end
	else
		var50 = var48
		var51 = var46 and (if var41.eligibility ~= "Required" then isFailed else true)
	end
	local var59
	local t_1 = {
		configurationData = var39,
		isAudiencesReady = var45,
		isConfigurationRefreshPending = var35,
		isEligibilityResolved = var50,
		isNonPrivateLocked = var51,
		lockReason = var49
	}
	
	if p18 ~= nil then
		var59 = p18
	elseif var45 then
		local audiences = var39.audiences
		var59 = if audiences ~= nil then nil else t[universeConfigurationModule.getPrivacyTypeForAudiences(audiences)]
	else
		var59 = nil
	end
	t_1.selectedAudience = var59
	
	return t_1
end

local function useQuestionnaireHandler(p20, p21)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), useOpenWebView (ref), reactModule (ref), fFlagBuildRehydrateOnPublishModule (ref), refreshPublishEligibilityModule (ref), gameConfigurationActionsModule (ref)
	local var61 = if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({
		creatorHub = localizationStringsModule.GAME_CONFIGURATION_CREATOR_HUB
	}) else nil).creatorHub else localizationStringsModule.GAME_CONFIGURATION_CREATOR_HUB
	local var62 = useOpenWebView()
	local var63 = reactModule.useCallback(function()
		-- upvalues: fFlagBuildRehydrateOnPublishModule (copy), refreshPublishEligibilityModule (copy), p20 (ref), p21 (ref)
		if fFlagBuildRehydrateOnPublishModule then
			refreshPublishEligibilityModule(p20)
			
			return
		end
		p21.fetchEligibility(p20)
		p21.fetchLatestSubmission(p20)
	end, { p21, p20 })
	
	return reactModule.useCallback(function()
		-- upvalues: var62 (ref), gameConfigurationActionsModule (copy), p20 (ref), var61 (ref), var63 (ref)
		var62(gameConfigurationActionsModule.getExperienceQuestionnaireUrl(p20), var61, var63)
	end, { var61, var62, var63, p20 })
end

local _ = function(p22)
	local current = p22.current
	p22.current = nil
	
	if current ~= nil then
		current:cancel()
	end
end

local function useAudienceController(p23)
	-- upvalues: useAudienceStores (ref), reactModule (ref), fFlagBuildAudiencePublishPromptModule (ref), fFlagBuildExperienceTooltipsLightDismissModule (ref), useAudienceData (ref), useQuestionnaireHandler (ref), getAudiencesForValue (ref), fFlagBuildRehydrateOnPublishModule (ref), gameConfigurationActionsModule (ref), universeConfigurationModule (ref), debug (ref), formatErrorModule (ref), contentMaturityUtilsModule (ref)
	local var64 = useAudienceStores()
	local var65, var66 = reactModule.useState(nil)
	local var67, var68 = reactModule.useState(false)
	local var69 = nil
	
	if fFlagBuildAudiencePublishPromptModule then
		local var70 = reactModule.useRef(nil)
		var69 = var70
		reactModule.useEffect(function()
			-- upvalues: var70 (ref)
			return function()
				-- upvalues: var70 (copy)
				local current = var70.current
				var70.current = nil
				
				if current ~= nil then
					current:cancel()
				end
			end
		end, { var70, p23 })
	end
	local var71, var72 = reactModule.useState(nil)
	local var73 = if fFlagBuildExperienceTooltipsLightDismissModule then reactModule.useCallback(function()
		-- upvalues: var72 (ref)
		var72(nil)
	end, {}) else nil
	local var74 = useAudienceData(p23, var64.questionnaireStore, var64.universeActivationStore, var64.universeConfigurationStore, var65)
	local var75 = useQuestionnaireHandler(p23, var64.questionnaireStore)
	local configurationData = var74.configurationData
	local isAudiencesReady = var74.isAudiencesReady
	local isConfigurationRefreshPending = var74.isConfigurationRefreshPending
	local isEligibilityResolved = var74.isEligibilityResolved
	local isNonPrivateLocked = var74.isNonPrivateLocked
	local var76 = not isAudiencesReady or (var67 or isConfigurationRefreshPending)
	
	return {
		handleAudienceActivated = reactModule.useCallback(function(p24)
			-- upvalues: var72 (ref), var76 (ref), getAudiencesForValue (copy), configurationData (ref), var66 (ref), var68 (ref), var64 (ref), p23 (ref), fFlagBuildRehydrateOnPublishModule (copy), gameConfigurationActionsModule (copy), universeConfigurationModule (copy), debug (copy), formatErrorModule (copy), fFlagBuildAudiencePublishPromptModule (copy), isNonPrivateLocked (ref), var69 (write), contentMaturityUtilsModule (copy), isEligibilityResolved (ref)
			local function _()
				-- upvalues: var72 (copy), p24 (ref)
				var72(function(p25)
					-- upvalues: p24 (copy)
					return if p25 == p24 then nil else p24
				end)
			end
			
			local function applyAudienceChange()
				-- upvalues: var76 (copy), getAudiencesForValue (copy), p24 (ref), configurationData (copy), var72 (copy), var66 (copy), var68 (copy), var64 (copy), p23 (copy), fFlagBuildRehydrateOnPublishModule (copy), gameConfigurationActionsModule (copy), universeConfigurationModule (copy), debug (copy), formatErrorModule (copy)
				if var76 then
					return
				end
				local var81 = getAudiencesForValue(p24, configurationData.audiences)
				var72(nil)
				var66(p24)
				var68(true)
				var64.universeActivationStore.setAudiences(p23, var81):andThen(function(p27)
					-- upvalues: fFlagBuildRehydrateOnPublishModule (copy), gameConfigurationActionsModule (copy), p23 (copy), var64 (copy), universeConfigurationModule (copy), var81 (ref), debug (copy), formatErrorModule (copy), var66 (copy), var68 (copy)
					if fFlagBuildRehydrateOnPublishModule then
						gameConfigurationActionsModule.updateCachedAudience(p23, p27.audiences)
					else
						var64.universeConfigurationStore.updateSummary(p23, {
							privacyType = universeConfigurationModule.getPrivacyTypeForAudiences(var81),
							audiences = var81
						})
					end
					var64.universeActivationStore.activate(p23):andThen(function()
						-- upvalues: fFlagBuildRehydrateOnPublishModule (copy), var64 (copy), p23 (copy)
						if not fFlagBuildRehydrateOnPublishModule then
							var64.universeConfigurationStore.fetchConfiguration(p23)
						end
					end):catch(function(p28)
						-- upvalues: debug (copy), formatErrorModule (copy), p23 (copy), var66 (copy)
						debug.log("warn", "AudienceConfigurationContent activate after audience update failed", { errorMessage = formatErrorModule(p28), universeId = p23 })
						var66(nil)
					end):finally(function()
						-- upvalues: var68 (copy)
						var68(false)
					end)
				end):catch(function(p26)
					-- upvalues: debug (copy), formatErrorModule (copy), p23 (copy), var66 (copy), var68 (copy)
					debug.log("warn", "AudienceConfigurationContent set audiences failed", { errorMessage = formatErrorModule(p26), universeId = p23 })
					var66(nil)
					var68(false)
				end)
			end
			
			if fFlagBuildAudiencePublishPromptModule then
				local var78 = isNonPrivateLocked and p24 ~= "Private"
				
				if var78 then
					var72(function(p29)
						-- upvalues: p24 (ref)
						return if p29 == p24 then nil else p24
					end)
				end
				if var76 then return end
				if not var78 then
					var68(true)
				end
				local var79 = var69
				local current = var79.current
				var79.current = nil
				
				if current ~= nil then
					current:cancel()
				end
				if p24 == "Private" then
					applyAudienceChange()
					
					return
				elseif not var78 then
					var66(p24)
				end
				local var80 = var64.universeActivationStore.refreshEligibility(p23)
				var79.current = var80
				var80:catch(function(p31)
					-- upvalues: var79 (ref), var80 (ref), debug (copy), formatErrorModule (copy), p23 (copy)
					if var79.current == var80 then
						debug.log("warn", "AudienceConfigurationContent eligibility recheck failed", { errorMessage = formatErrorModule(p31), universeId = p23 })
					end
				end):finally(function()
					-- upvalues: var79 (ref), var80 (ref), contentMaturityUtilsModule (copy), p23 (copy), var78 (ref), var66 (copy), var68 (copy), var72 (copy), p24 (ref), applyAudienceChange (ref)
					if var79.current ~= var80 then return end
					var79.current = nil
					
					if not contentMaturityUtilsModule.isContentUnrated(p23) then
						applyAudienceChange()
						
						return
					elseif not var78 then
						var66(nil)
						var68(false)
						var72(function(p30)
							-- upvalues: p24 (copy)
							return if p30 == p24 then nil else p24
						end)
					end
				end)
				
				return
			elseif isNonPrivateLocked and p24 ~= "Private" then
				var72(function(p32)
					-- upvalues: p24 (ref)
					return if p32 == p24 then nil else p24
				end)
				
				return
			elseif isEligibilityResolved then
				applyAudienceChange()
				
				return
			end
		end, {
			configurationData, var69, var76, isEligibilityResolved, isNonPrivateLocked,
			var64.universeActivationStore, var64.universeConfigurationStore, p23
		}),
		handleQuestionnaire = var75,
		isMutationPending = var67,
		isNonPrivateLocked = var74.isNonPrivateLocked,
		lockReason = var74.lockReason,
		onTooltipPressedOutside = var73,
		selectedAudience = var74.selectedAudience,
		tooltipTarget = var71
	}
end

local function AudienceHeader()
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), view (ref), text (ref)
	local GAME_CONFIGURATION_AUDIENCE_BODY, GAME_CONFIGURATION_AUDIENCE_PAGE_TITLE
	local var82 = if fFlagBuildLocalization then useLocalization({
		body = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_BODY,
		title = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PAGE_TITLE
	}) else nil
	local _ = nil
	local _ = nil
	
	if fFlagBuildLocalization then
		GAME_CONFIGURATION_AUDIENCE_BODY = var82.body
		GAME_CONFIGURATION_AUDIENCE_PAGE_TITLE = var82.title
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

local function AudienceList(p33)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), radioGroup (ref), list (ref), inputSize (ref), AudienceRow (ref)
	local GAME_CONFIGURATION_AUDIENCE_FRIENDS, GAME_CONFIGURATION_AUDIENCE_PRIVATE, GAME_CONFIGURATION_AUDIENCE_PUBLIC
	local var83 = if fFlagBuildLocalization then useLocalization({
		friends = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_FRIENDS,
		private = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PRIVATE,
		["public"] = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PUBLIC
	}) else nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if fFlagBuildLocalization then
		GAME_CONFIGURATION_AUDIENCE_FRIENDS = var83.friends
		GAME_CONFIGURATION_AUDIENCE_PRIVATE = var83.private
		GAME_CONFIGURATION_AUDIENCE_PUBLIC = var83["public"]
	else
		GAME_CONFIGURATION_AUDIENCE_FRIENDS = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_FRIENDS
		GAME_CONFIGURATION_AUDIENCE_PRIVATE = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PRIVATE
		GAME_CONFIGURATION_AUDIENCE_PUBLIC = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PUBLIC
	end
	return reactModule.createElement(radioGroup.Root, {
		LayoutOrder = 2,
		Selectable = false,
		tag = "size-full-0 auto-y",
		onValueChanged = reactModule.useCallback(function(p34)
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

local function EligibilityTooltip(p35)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), useTokens (ref), useScaledValue (ref), buildExperienceAudienceTooltipMaxWidth (ref), fFlagBuildAudiencePublishPromptModule (ref), reactModule (ref), popover (ref), popoverAlign (ref), fFlagBuildExperienceTooltipsLightDismissModule (ref), radius (ref), popoverSide (ref), view (ref), text (ref)
	local GAME_CONFIGURATION_AUDIENCE_NOT_ELIGIBLE, GAME_CONFIGURATION_AUDIENCE_NOT_ELIGIBLE_DESCRIPTION, GAME_CONFIGURATION_AUDIENCE_PUBLISH_REQUIRED, GAME_CONFIGURATION_AUDIENCE_PUBLISH_REQUIRED_DESCRIPTION
	local var84 = if fFlagBuildLocalization then useLocalization({
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
		GAME_CONFIGURATION_AUDIENCE_NOT_ELIGIBLE = var84.notEligible
		GAME_CONFIGURATION_AUDIENCE_NOT_ELIGIBLE_DESCRIPTION = var84.notEligibleDescription
		GAME_CONFIGURATION_AUDIENCE_PUBLISH_REQUIRED = var84.publishRequired
		GAME_CONFIGURATION_AUDIENCE_PUBLISH_REQUIRED_DESCRIPTION = var84.publishRequiredDescription
	else
		GAME_CONFIGURATION_AUDIENCE_NOT_ELIGIBLE = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_NOT_ELIGIBLE
		GAME_CONFIGURATION_AUDIENCE_NOT_ELIGIBLE_DESCRIPTION = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_NOT_ELIGIBLE_DESCRIPTION
		GAME_CONFIGURATION_AUDIENCE_PUBLISH_REQUIRED = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PUBLISH_REQUIRED
		GAME_CONFIGURATION_AUDIENCE_PUBLISH_REQUIRED_DESCRIPTION = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PUBLISH_REQUIRED_DESCRIPTION
	end
	local var85 = fFlagBuildAudiencePublishPromptModule and p35.lockReason == "PublishRequired"
	
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
				testId = if not fFlagBuildAudiencePublishPromptModule then nil elseif var85 then `{p35.testId}-eligibility-tooltip--publish` else `{p35.testId}-eligibility-tooltip--not-eligible`
			}, {
				Title = reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "auto-xy text-title-small text-wrap text-align-x-left content-inverse-emphasis",
					Text = if var85 then GAME_CONFIGURATION_AUDIENCE_PUBLISH_REQUIRED else GAME_CONFIGURATION_AUDIENCE_NOT_ELIGIBLE,
					testId = `{p35.testId}-eligibility-tooltip--header`
				}),
				Text = reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "auto-xy text-body-small text-wrap text-align-x-left content-inverse-default",
					Text = if var85 then GAME_CONFIGURATION_AUDIENCE_PUBLISH_REQUIRED_DESCRIPTION else GAME_CONFIGURATION_AUDIENCE_NOT_ELIGIBLE_DESCRIPTION,
					testId = `{p35.testId}-eligibility-tooltip--text`
				})
			})
		})
	})
end

local function EligibilityBanner(p36)
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

return function(p37)
	-- upvalues: useAudienceController (ref), reactModule (ref), fFlagBuildAudiencePublishPromptModule (ref), view (ref), AudienceHeader (ref), AudienceList (ref), EligibilityTooltip (ref), EligibilityBanner (ref)
	local testId = p37.testId or "audience-configuration-content"
	local var87 = useAudienceController(p37.universeId)
	local var88 = reactModule.useRef(nil)
	local var89 = reactModule.useRef(nil)
	
	return reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y padding-y-large",
		LayoutOrder = p37.layoutOrder,
		testId = testId
	}, {
		Header = reactModule.createElement(AudienceHeader),
		List = reactModule.createElement(AudienceList, {
			friendsLockIconRef = var88,
			isDisabled = fFlagBuildAudiencePublishPromptModule and var87.isMutationPending,
			isNonPrivateLocked = var87.isNonPrivateLocked,
			onAudienceActivated = var87.handleAudienceActivated,
			publicLockIconRef = var89,
			selectedAudience = var87.selectedAudience,
			testId = testId
		}),
		Tooltip = reactModule.createElement(EligibilityTooltip, {
			anchorRef = if var87.tooltipTarget == "Public" then var89 else var88,
			isOpen = var87.tooltipTarget ~= nil,
			lockReason = var87.lockReason,
			onPressedOutside = var87.onTooltipPressedOutside,
			testId = testId
		}),
		ContextBanner = if var87.isNonPrivateLocked and (not fFlagBuildAudiencePublishPromptModule or var87.lockReason == "RatingRequired") then reactModule.createElement(EligibilityBanner, { onActivated = var87.handleQuestionnaire, testId = testId }) else nil
	})
end