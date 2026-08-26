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

local function _(p1)
	-- upvalues: t (ref), universeConfigurationModule (ref)
	return if p1 == nil then nil else t[universeConfigurationModule.getPrivacyTypeForAudiences(p1)]
end

local _ = function(p1)
	-- upvalues: universeActivationModule (ref)
	return if p1 ~= universeActivationModule.Audience.Public then p1 == universeActivationModule.Audience.Friends else true
end

local function getAudiencesForValue(p1, p2)
	-- upvalues: universeActivationModule (ref)
	local t = {}
	
	for i, v in p2 do
		if not (if v ~= universeActivationModule.Audience.Public then v == universeActivationModule.Audience.Friends else true) then
			table.insert(t, v)
		end
	end
	if p1 == "Public" then
		table.insert(t, universeActivationModule.Audience.Public)
		
		return t
	elseif p1 == "Friends" then
		table.insert(t, universeActivationModule.Audience.Friends)
	end
	return t
end

local function AudienceRow(p3)
	-- upvalues: reactModule (ref), icon (ref), iconName (ref), iconSize (ref), view (ref), list (ref), radioGroup (ref), inputSize (ref)
	local testId = `{p3.testId}-row-{string.lower(p3.value)}`
	
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y radius-medium",
		LayoutOrder = p3.LayoutOrder,
		onActivated = if p3.isDisabled then nil else reactModule.useCallback(function()
			-- upvalues: p3 (ref)
			p3.onActivated(p3.value)
		end, { p3.onActivated, p3.value }),
		testId = `{testId}-button`
	}, {
		ListItem = reactModule.createElement(list.Item, {
			LayoutOrder = p3.LayoutOrder,
			title = p3.title,
			trailing = reactModule.createElement(view, { tag = "row align-y-center gap-medium auto-xy" }, {
				Lock = if p3.isLocked then reactModule.createElement(icon, {
					LayoutOrder = 1,
					tag = "auto-xy content-default",
					name = iconName.LockClosed,
					ref = p3.lockIconRef,
					size = iconSize.Small
				}) else nil,
				Radio = reactModule.createElement(radioGroup.Item, {
					LayoutOrder = 2,
					label = "",
					isDisabled = p3.isDisabled or p3.isLocked,
					size = inputSize.Medium,
					testId = `{testId}-radio`,
					value = p3.value
				})
			}),
			testId = testId
		})
	})
end

local _ = function(p3, p4, p5)
	-- upvalues: t (ref), universeConfigurationModule (ref)
	if p3 ~= nil then
		return p3
	elseif not p4 then
		return nil
	end
	local audiences = p5.audiences
	
	return if audiences == nil then nil else t[universeConfigurationModule.getPrivacyTypeForAudiences(audiences)]
end

local _ = function(p3, p4, p5)
	return p4 and (if p3.eligibility ~= "Required" then p5 else true)
end

local function getUniverseActivationStore(p3)
	-- upvalues: universeActivationModule (ref)
	return universeActivationModule.getUniverseActivationStore(p3)
end

local function getQuestionnaireStore(p3)
	-- upvalues: experienceQuestionnaireModule (ref)
	return experienceQuestionnaireModule.getExperienceQuestionnaireStore(p3)
end

local function getUniverseConfigurationStore(p3)
	-- upvalues: universeConfigurationModule (ref)
	return universeConfigurationModule.getUniverseConfigurationStore(p3)
end

local function useAudienceStores()
	-- upvalues: signalsReactModule (ref), getUniverseActivationStore (ref), getQuestionnaireStore (ref), getUniverseConfigurationStore (ref)
	return {
		universeActivationStore = signalsReactModule.useSignalState(getUniverseActivationStore),
		questionnaireStore = signalsReactModule.useSignalState(getQuestionnaireStore),
		universeConfigurationStore = signalsReactModule.useSignalState(getUniverseConfigurationStore)
	}
end

local function useAudienceData(p3, p4, p5, p6, p7)
	-- upvalues: reactModule (ref), fFlagBuildRehydrateOnPublishModule (ref), debug (ref), formatErrorModule (ref), signalsReactModule (ref), fFlagBuildAudiencePublishPromptModule (ref), contentMaturityUtilsModule (ref), t (ref), universeConfigurationModule (ref)
	local var1 = reactModule.useMemo(function()
		-- upvalues: p6 (ref), p3 (ref)
		return p6.getAndFetchConfiguration(p3)
	end, { p3, p6 })
	local var2, var3 = reactModule.useState(fFlagBuildRehydrateOnPublishModule)
	
	if fFlagBuildRehydrateOnPublishModule then
		reactModule.useEffect(function()
			-- upvalues: var3 (ref), p6 (ref), p3 (ref), debug (copy), formatErrorModule (copy)
			local var4 = true
			var3(true)
			p6.refreshConfiguration(p3):catch(function(p8)
				-- upvalues: debug (copy), formatErrorModule (copy), p3 (copy)
				debug.log("warn", "AudienceConfigurationContent configuration refresh failed", { errorMessage = formatErrorModule(p8), universeId = p3 })
			end):finally(function()
				-- upvalues: var4 (write), var3 (copy)
				if var4 then
					var3(false)
				end
			end)
			
			return function()
				-- upvalues: var4 (write)
				var4 = false
			end
		end, { p6, p3 })
	end
	local var4, var5
	local var6 = reactModule.useMemo(function()
		-- upvalues: p4 (ref), p3 (ref)
		return p4.getAndFetchEligibility(p3)
	end, { p4, p3 })
	local var7 = reactModule.useMemo(function()
		-- upvalues: p4 (ref), p3 (ref)
		return p4.getAndFetchLatestSubmission(p3)
	end, { p4, p3 })
	local var8 = signalsReactModule.useSignalState(var1.data)
	local var9 = signalsReactModule.useSignalState(var1.status)
	local var10 = signalsReactModule.useSignalState(var6.data)
	local var11 = signalsReactModule.useSignalState(var6.status)
	local var12 = signalsReactModule.useSignalState(var7.data)
	local var13 = signalsReactModule.useSignalState(var7.status)
	local var14 = var9 == "Ready" and var8 ~= nil
	local var15 = var11 == "Ready" and var10 ~= nil
	local isFailed = var13 == "Failed"
	local var16 = var15 and ((var13 == "Ready" and var12 ~= nil) or isFailed)
	local _ = nil
	local _ = nil
	local var17 = nil
	
	if fFlagBuildRehydrateOnPublishModule then
		local var18 = reactModule.useMemo(function()
			-- upvalues: p5 (ref), p3 (ref)
			return p5.getAndFetchEligibility(p3)
		end, { p5, p3 })
		local var19 = signalsReactModule.useSignalState(var18.data)
		local var20 = signalsReactModule.useSignalState(var18.status)
		local var21 = if var20 ~= "Ready" then var20 == "Failed" else true
		
		if fFlagBuildAudiencePublishPromptModule then
			var17 = if not contentMaturityUtilsModule.isContentUnrated(p3) then nil elseif contentMaturityUtilsModule.isSealBroken(p3) then "RatingRequired" else "PublishRequired"
			var5 = var17 ~= nil
			var4 = var21
		else
			local var22
			local var23 = var15 and (if var10.eligibility ~= "Required" then isFailed else true)
			var5 = reactModule.useMemo(function()
				-- upvalues: contentMaturityUtilsModule (copy), p3 (ref), var23 (ref)
				return if contentMaturityUtilsModule.isSealBroken(p3) then contentMaturityUtilsModule.isContentUnrated(p3) or var23 else false
			end, { var19, var23, p3 })
			
			if var11 ~= "Ready" then
				var22 = false
				
				if var11 == "Failed" then
					var22 = if var13 ~= "Ready" then var13 == "Failed" else true
				end
				var4 = var21 and var22
			end
		end
	else
		var4 = var16
		var5 = var15 and (if var10.eligibility ~= "Required" then isFailed else true)
	end
	local var24
	local t_1 = {
		configurationData = var8,
		isAudiencesReady = var14,
		isConfigurationRefreshPending = var2,
		isEligibilityResolved = var4,
		isNonPrivateLocked = var5,
		lockReason = var17
	}
	
	if p7 ~= nil then
		var24 = p7
	elseif var14 then
		local audiences = var8.audiences
		var24 = if audiences ~= nil then nil else t[universeConfigurationModule.getPrivacyTypeForAudiences(audiences)]
	else
		var24 = nil
	end
	t_1.selectedAudience = var24
	
	return t_1
end

local function useQuestionnaireHandler(p3, p4)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), useOpenWebView (ref), reactModule (ref), fFlagBuildRehydrateOnPublishModule (ref), refreshPublishEligibilityModule (ref), gameConfigurationActionsModule (ref)
	local var1 = if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({
		creatorHub = localizationStringsModule.GAME_CONFIGURATION_CREATOR_HUB
	}) else nil).creatorHub else localizationStringsModule.GAME_CONFIGURATION_CREATOR_HUB
	local var2 = useOpenWebView()
	local var3 = reactModule.useCallback(function()
		-- upvalues: fFlagBuildRehydrateOnPublishModule (copy), refreshPublishEligibilityModule (copy), p3 (ref), p4 (ref)
		if fFlagBuildRehydrateOnPublishModule then
			refreshPublishEligibilityModule(p3)
			
			return
		end
		p4.fetchEligibility(p3)
		p4.fetchLatestSubmission(p3)
	end, { p4, p3 })
	
	return reactModule.useCallback(function()
		-- upvalues: var2 (ref), gameConfigurationActionsModule (copy), p3 (ref), var1 (ref), var3 (ref)
		var2(gameConfigurationActionsModule.getExperienceQuestionnaireUrl(p3), var1, var3)
	end, { var1, var2, var3, p3 })
end

local _ = function(p3)
	local current = p3.current
	p3.current = nil
	
	if current ~= nil then
		current:cancel()
	end
end

local function useAudienceController(p3)
	-- upvalues: useAudienceStores (ref), reactModule (ref), fFlagBuildAudiencePublishPromptModule (ref), fFlagBuildExperienceTooltipsLightDismissModule (ref), useAudienceData (ref), useQuestionnaireHandler (ref), getAudiencesForValue (ref), fFlagBuildRehydrateOnPublishModule (ref), gameConfigurationActionsModule (ref), universeConfigurationModule (ref), debug (ref), formatErrorModule (ref), contentMaturityUtilsModule (ref)
	local var1 = useAudienceStores()
	local var2, var3 = reactModule.useState(nil)
	local var4, var5 = reactModule.useState(false)
	local var6 = nil
	
	if fFlagBuildAudiencePublishPromptModule then
		local var7 = reactModule.useRef(nil)
		var6 = var7
		reactModule.useEffect(function()
			-- upvalues: var7 (ref)
			return function()
				-- upvalues: var7 (copy)
				local current = var7.current
				var7.current = nil
				
				if current ~= nil then
					current:cancel()
				end
			end
		end, { var7, p3 })
	end
	local var8, var9 = reactModule.useState(nil)
	local var10 = if fFlagBuildExperienceTooltipsLightDismissModule then reactModule.useCallback(function()
		-- upvalues: var9 (ref)
		var9(nil)
	end, {}) else nil
	local var11 = useAudienceData(p3, var1.questionnaireStore, var1.universeActivationStore, var1.universeConfigurationStore, var2)
	local var12 = useQuestionnaireHandler(p3, var1.questionnaireStore)
	local configurationData = var11.configurationData
	local isAudiencesReady = var11.isAudiencesReady
	local isConfigurationRefreshPending = var11.isConfigurationRefreshPending
	local isEligibilityResolved = var11.isEligibilityResolved
	local isNonPrivateLocked = var11.isNonPrivateLocked
	local var13 = not isAudiencesReady or (var4 or isConfigurationRefreshPending)
	
	return {
		handleAudienceActivated = reactModule.useCallback(function(p4)
			-- upvalues: var9 (ref), var13 (ref), getAudiencesForValue (copy), configurationData (ref), var3 (ref), var5 (ref), var1 (ref), p3 (ref), fFlagBuildRehydrateOnPublishModule (copy), gameConfigurationActionsModule (copy), universeConfigurationModule (copy), debug (copy), formatErrorModule (copy), fFlagBuildAudiencePublishPromptModule (copy), isNonPrivateLocked (ref), var6 (write), contentMaturityUtilsModule (copy), isEligibilityResolved (ref)
			local function _()
				-- upvalues: var9 (copy), p4 (ref)
				var9(function(p5)
					-- upvalues: p4 (copy)
					return if p5 == p4 then nil else p4
				end)
			end
			
			local function applyAudienceChange()
				-- upvalues: var13 (copy), getAudiencesForValue (copy), p4 (ref), configurationData (copy), var9 (copy), var3 (copy), var5 (copy), var1 (copy), p3 (copy), fFlagBuildRehydrateOnPublishModule (copy), gameConfigurationActionsModule (copy), universeConfigurationModule (copy), debug (copy), formatErrorModule (copy)
				if var13 then
					return
				end
				local var14 = getAudiencesForValue(p4, configurationData.audiences)
				var9(nil)
				var3(p4)
				var5(true)
				var1.universeActivationStore.setAudiences(p3, var14):andThen(function(p5)
					-- upvalues: fFlagBuildRehydrateOnPublishModule (copy), gameConfigurationActionsModule (copy), p3 (copy), var1 (copy), universeConfigurationModule (copy), var14 (ref), debug (copy), formatErrorModule (copy), var3 (copy), var5 (copy)
					if fFlagBuildRehydrateOnPublishModule then
						gameConfigurationActionsModule.updateCachedAudience(p3, p5.audiences)
					else
						var1.universeConfigurationStore.updateSummary(p3, {
							privacyType = universeConfigurationModule.getPrivacyTypeForAudiences(var14),
							audiences = var14
						})
					end
					var1.universeActivationStore.activate(p3):andThen(function()
						-- upvalues: fFlagBuildRehydrateOnPublishModule (copy), var1 (copy), p3 (copy)
						if not fFlagBuildRehydrateOnPublishModule then
							var1.universeConfigurationStore.fetchConfiguration(p3)
						end
					end):catch(function(p6)
						-- upvalues: debug (copy), formatErrorModule (copy), p3 (copy), var3 (copy)
						debug.log("warn", "AudienceConfigurationContent activate after audience update failed", { errorMessage = formatErrorModule(p6), universeId = p3 })
						var3(nil)
					end):finally(function()
						-- upvalues: var5 (copy)
						var5(false)
					end)
				end):catch(function(p5)
					-- upvalues: debug (copy), formatErrorModule (copy), p3 (copy), var3 (copy), var5 (copy)
					debug.log("warn", "AudienceConfigurationContent set audiences failed", { errorMessage = formatErrorModule(p5), universeId = p3 })
					var3(nil)
					var5(false)
				end)
			end
			
			if fFlagBuildAudiencePublishPromptModule then
				local var14 = isNonPrivateLocked and p4 ~= "Private"
				
				if var14 then
					var9(function(p5)
						-- upvalues: p4 (ref)
						return if p5 == p4 then nil else p4
					end)
				end
				if var13 then return end
				if not var14 then
					var5(true)
				end
				local var15 = var6
				local current = var15.current
				var15.current = nil
				
				if current ~= nil then
					current:cancel()
				end
				if p4 == "Private" then
					applyAudienceChange()
					
					return
				elseif not var14 then
					var3(p4)
				end
				local var16 = var1.universeActivationStore.refreshEligibility(p3)
				var15.current = var16
				var16:catch(function(p5)
					-- upvalues: var15 (ref), var16 (ref), debug (copy), formatErrorModule (copy), p3 (copy)
					if var15.current == var16 then
						debug.log("warn", "AudienceConfigurationContent eligibility recheck failed", { errorMessage = formatErrorModule(p5), universeId = p3 })
					end
				end):finally(function()
					-- upvalues: var15 (ref), var16 (ref), contentMaturityUtilsModule (copy), p3 (copy), var14 (ref), var3 (copy), var5 (copy), var9 (copy), p4 (ref), applyAudienceChange (ref)
					if var15.current ~= var16 then return end
					var15.current = nil
					
					if not contentMaturityUtilsModule.isContentUnrated(p3) then
						applyAudienceChange()
						
						return
					elseif not var14 then
						var3(nil)
						var5(false)
						var9(function(p5)
							-- upvalues: p4 (copy)
							return if p5 == p4 then nil else p4
						end)
					end
				end)
				
				return
			elseif isNonPrivateLocked and p4 ~= "Private" then
				var9(function(p5)
					-- upvalues: p4 (ref)
					return if p5 == p4 then nil else p4
				end)
				
				return
			elseif isEligibilityResolved then
				applyAudienceChange()
				
				return
			end
		end, {
			configurationData, var6, var13, isEligibilityResolved, isNonPrivateLocked,
			var1.universeActivationStore, var1.universeConfigurationStore, p3
		}),
		handleQuestionnaire = var12,
		isMutationPending = var4,
		isNonPrivateLocked = var11.isNonPrivateLocked,
		lockReason = var11.lockReason,
		onTooltipPressedOutside = var10,
		selectedAudience = var11.selectedAudience,
		tooltipTarget = var8
	}
end

local function AudienceHeader()
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), view (ref), text (ref)
	local GAME_CONFIGURATION_AUDIENCE_BODY, GAME_CONFIGURATION_AUDIENCE_PAGE_TITLE
	local var1 = if fFlagBuildLocalization then useLocalization({
		body = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_BODY,
		title = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PAGE_TITLE
	}) else nil
	local _ = nil
	local _ = nil
	
	if fFlagBuildLocalization then
		GAME_CONFIGURATION_AUDIENCE_BODY = var1.body
		GAME_CONFIGURATION_AUDIENCE_PAGE_TITLE = var1.title
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

local function AudienceList(p3)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), radioGroup (ref), list (ref), inputSize (ref), AudienceRow (ref)
	local GAME_CONFIGURATION_AUDIENCE_FRIENDS, GAME_CONFIGURATION_AUDIENCE_PRIVATE, GAME_CONFIGURATION_AUDIENCE_PUBLIC
	local var1 = if fFlagBuildLocalization then useLocalization({
		friends = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_FRIENDS,
		private = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PRIVATE,
		["public"] = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PUBLIC
	}) else nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if fFlagBuildLocalization then
		GAME_CONFIGURATION_AUDIENCE_FRIENDS = var1.friends
		GAME_CONFIGURATION_AUDIENCE_PRIVATE = var1.private
		GAME_CONFIGURATION_AUDIENCE_PUBLIC = var1["public"]
	else
		GAME_CONFIGURATION_AUDIENCE_FRIENDS = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_FRIENDS
		GAME_CONFIGURATION_AUDIENCE_PRIVATE = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PRIVATE
		GAME_CONFIGURATION_AUDIENCE_PUBLIC = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PUBLIC
	end
	return reactModule.createElement(radioGroup.Root, {
		LayoutOrder = 2,
		Selectable = false,
		tag = "size-full-0 auto-y",
		onValueChanged = reactModule.useCallback(function(p4)
			-- upvalues: p3 (ref)
			p3.onAudienceActivated(p4)
		end, { p3.onAudienceActivated }),
		value = if p3.selectedAudience ~= nil then "" else p3.selectedAudience
	}, {
		List = reactModule.createElement(list.Root, {
			isContained = true,
			hasDivider = { hasDivider = true, isInset = false },
			size = inputSize.Medium,
			testId = `{p3.testId}-list`
		}, {
			Private = reactModule.createElement(AudienceRow, {
				LayoutOrder = 1,
				isLocked = false,
				lockIconRef = nil,
				value = "Private",
				isDisabled = p3.isDisabled,
				onActivated = p3.onAudienceActivated,
				testId = p3.testId,
				title = GAME_CONFIGURATION_AUDIENCE_PRIVATE
			}),
			Friends = reactModule.createElement(AudienceRow, {
				LayoutOrder = 2,
				value = "Friends",
				isDisabled = p3.isDisabled,
				isLocked = p3.isNonPrivateLocked,
				lockIconRef = p3.friendsLockIconRef,
				onActivated = p3.onAudienceActivated,
				testId = p3.testId,
				title = GAME_CONFIGURATION_AUDIENCE_FRIENDS
			}),
			Public = reactModule.createElement(AudienceRow, {
				LayoutOrder = 3,
				value = "Public",
				isDisabled = p3.isDisabled,
				isLocked = p3.isNonPrivateLocked,
				lockIconRef = p3.publicLockIconRef,
				onActivated = p3.onAudienceActivated,
				testId = p3.testId,
				title = GAME_CONFIGURATION_AUDIENCE_PUBLIC
			})
		})
	})
end

local function EligibilityTooltip(p3)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), useTokens (ref), useScaledValue (ref), buildExperienceAudienceTooltipMaxWidth (ref), fFlagBuildAudiencePublishPromptModule (ref), reactModule (ref), popover (ref), popoverAlign (ref), fFlagBuildExperienceTooltipsLightDismissModule (ref), radius (ref), popoverSide (ref), view (ref), text (ref)
	local GAME_CONFIGURATION_AUDIENCE_NOT_ELIGIBLE, GAME_CONFIGURATION_AUDIENCE_NOT_ELIGIBLE_DESCRIPTION, GAME_CONFIGURATION_AUDIENCE_PUBLISH_REQUIRED, GAME_CONFIGURATION_AUDIENCE_PUBLISH_REQUIRED_DESCRIPTION
	local var1 = if fFlagBuildLocalization then useLocalization({
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
		GAME_CONFIGURATION_AUDIENCE_NOT_ELIGIBLE = var1.notEligible
		GAME_CONFIGURATION_AUDIENCE_NOT_ELIGIBLE_DESCRIPTION = var1.notEligibleDescription
		GAME_CONFIGURATION_AUDIENCE_PUBLISH_REQUIRED = var1.publishRequired
		GAME_CONFIGURATION_AUDIENCE_PUBLISH_REQUIRED_DESCRIPTION = var1.publishRequiredDescription
	else
		GAME_CONFIGURATION_AUDIENCE_NOT_ELIGIBLE = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_NOT_ELIGIBLE
		GAME_CONFIGURATION_AUDIENCE_NOT_ELIGIBLE_DESCRIPTION = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_NOT_ELIGIBLE_DESCRIPTION
		GAME_CONFIGURATION_AUDIENCE_PUBLISH_REQUIRED = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PUBLISH_REQUIRED
		GAME_CONFIGURATION_AUDIENCE_PUBLISH_REQUIRED_DESCRIPTION = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PUBLISH_REQUIRED_DESCRIPTION
	end
	local var2 = fFlagBuildAudiencePublishPromptModule and p3.lockReason == "PublishRequired"
	
	return reactModule.createElement(popover.Root, {
		isOpen = p3.isOpen,
		testId = `{p3.testId}-eligibility-tooltip`
	}, {
		Anchor = reactModule.createElement(popover.Anchor, { anchorRef = p3.anchorRef }),
		Content = reactModule.createElement(popover.Content, {
			hasArrow = true,
			selectionGroup = false,
			align = popoverAlign.Center,
			backgroundStyle = useTokens().Color.System.Contrast,
			onPressedOutside = if fFlagBuildExperienceTooltipsLightDismissModule then p3.onPressedOutside else nil,
			radius = radius.Small,
			side = popoverSide.Left
		}, {
			Layout = reactModule.createElement(view, {
				tag = "col gap-xsmall auto-xy padding-x-small padding-y-small",
				sizeConstraint = {
					MaxSize = Vector2.new(useScaledValue(buildExperienceAudienceTooltipMaxWidth), 1e999)
				},
				testId = if not fFlagBuildAudiencePublishPromptModule then nil elseif var2 then `{p3.testId}-eligibility-tooltip--publish` else `{p35.testId}-eligibility-tooltip--not-eligible`
			}, {
				Title = reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "auto-xy text-title-small text-wrap text-align-x-left content-inverse-emphasis",
					Text = if var2 then GAME_CONFIGURATION_AUDIENCE_PUBLISH_REQUIRED else GAME_CONFIGURATION_AUDIENCE_NOT_ELIGIBLE,
					testId = `{p3.testId}-eligibility-tooltip--header`
				}),
				Text = reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "auto-xy text-body-small text-wrap text-align-x-left content-inverse-default",
					Text = if var2 then GAME_CONFIGURATION_AUDIENCE_PUBLISH_REQUIRED_DESCRIPTION else GAME_CONFIGURATION_AUDIENCE_NOT_ELIGIBLE_DESCRIPTION,
					testId = `{p3.testId}-eligibility-tooltip--text`
				})
			})
		})
	})
end

local function EligibilityBanner(p3)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), view (ref), icon (ref), iconName (ref), iconSize (ref), text (ref)
	return reactModule.createElement(view, {
		LayoutOrder = 3,
		tag = "row align-y-center gap-small size-full-0 auto-y padding-medium radius-medium bg-shift-200",
		onActivated = p3.onActivated,
		stateLayer = {},
		testId = `{p3.testId}-eligibility-banner`
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

return function(p3)
	-- upvalues: useAudienceController (ref), reactModule (ref), fFlagBuildAudiencePublishPromptModule (ref), view (ref), AudienceHeader (ref), AudienceList (ref), EligibilityTooltip (ref), EligibilityBanner (ref)
	local testId = p3.testId or "audience-configuration-content"
	local var1 = useAudienceController(p3.universeId)
	local var2 = reactModule.useRef(nil)
	local var3 = reactModule.useRef(nil)
	
	return reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y padding-y-large",
		LayoutOrder = p3.layoutOrder,
		testId = testId
	}, {
		Header = reactModule.createElement(AudienceHeader),
		List = reactModule.createElement(AudienceList, {
			friendsLockIconRef = var2,
			isDisabled = fFlagBuildAudiencePublishPromptModule and var1.isMutationPending,
			isNonPrivateLocked = var1.isNonPrivateLocked,
			onAudienceActivated = var1.handleAudienceActivated,
			publicLockIconRef = var3,
			selectedAudience = var1.selectedAudience,
			testId = testId
		}),
		Tooltip = reactModule.createElement(EligibilityTooltip, {
			anchorRef = if var1.tooltipTarget == "Public" then var3 else var2,
			isOpen = var1.tooltipTarget ~= nil,
			lockReason = var1.lockReason,
			onPressedOutside = var1.onTooltipPressedOutside,
			testId = testId
		}),
		ContextBanner = if var1.isNonPrivateLocked and (not fFlagBuildAudiencePublishPromptModule or var1.lockReason == "RatingRequired") then reactModule.createElement(EligibilityBanner, { onActivated = var1.handleQuestionnaire, testId = testId }) else nil
	})
end