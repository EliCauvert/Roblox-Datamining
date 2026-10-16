local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
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
local refreshAdCampaignEligibilityModule = require(buildExperience.utils.refreshAdCampaignEligibility)
local fFlagBuildExperienceTooltipsLightDismissModule = require(buildExperience.Flags.FFlagBuildExperienceTooltipsLightDismiss)
local fFlagEnableBuildAdPromotionModule = require(buildExperience.Flags.FFlagEnableBuildAdPromotion)
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

local function useAudienceData(p3, p4, p5, p6)
	-- upvalues: reactModule (ref), debug (ref), formatErrorModule (ref), signalsReactModule (ref), contentMaturityUtilsModule (ref), t (ref), universeConfigurationModule (ref)
	local var1
	local var2 = reactModule.useMemo(function()
		-- upvalues: p5 (ref), p3 (ref)
		return p5.getAndFetchConfiguration(p3)
	end, { p3, p5 })
	local var3, var4 = reactModule.useState(true)
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), p5 (ref), p3 (ref), debug (copy), formatErrorModule (copy)
		local var5 = true
		var4(true)
		p5.refreshConfiguration(p3):catch(function(p7)
			-- upvalues: debug (copy), formatErrorModule (copy), p3 (copy)
			debug.log("warn", "AudienceConfigurationContent configuration refresh failed", { errorMessage = formatErrorModule(p7), universeId = p3 })
		end):finally(function()
			-- upvalues: var5 (write), var4 (copy)
			if var5 then
				var4(false)
			end
		end)
		
		return function()
			-- upvalues: var5 (write)
			var5 = false
		end
	end, { p5, p3 })
	local var5 = signalsReactModule.useSignalState(var2.data)
	local var6 = signalsReactModule.useSignalState(var2.status) == "Ready" and var5 ~= nil
	local var7 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: p4 (ref), p3 (ref)
		return p4.getAndFetchEligibility(p3)
	end, { p4, p3 }).status)
	local var8 = if not contentMaturityUtilsModule.isContentUnrated(p3) then nil elseif contentMaturityUtilsModule.isSealBroken(p3) then "RatingRequired" else "PublishRequired"
	local t_1 = {
		configurationData = var5,
		isAudiencesReady = var6,
		isConfigurationRefreshPending = var3,
		isEligibilityResolved = if var7 ~= "Ready" then var7 == "Failed" else true,
		isNonPrivateLocked = var8 ~= nil,
		lockReason = var8
	}
	
	if p6 ~= nil then
		var1 = p6
	elseif var6 then
		local audiences = var5.audiences
		var1 = if audiences ~= nil then nil else t[universeConfigurationModule.getPrivacyTypeForAudiences(audiences)]
	else
		var1 = nil
	end
	t_1.selectedAudience = var1
	
	return t_1
end

local function useQuestionnaireHandler(p3, p4)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), useOpenWebView (ref), reactModule (ref), refreshPublishEligibilityModule (ref), gameConfigurationActionsModule (ref)
	local creatorHub = useLocalization({
		creatorHub = localizationStringsModule.GAME_CONFIGURATION_CREATOR_HUB
	}).creatorHub
	local var1 = useOpenWebView()
	local var2 = reactModule.useCallback(function()
		-- upvalues: refreshPublishEligibilityModule (copy), p3 (ref)
		refreshPublishEligibilityModule(p3)
	end, { p4, p3 })
	
	return reactModule.useCallback(function()
		-- upvalues: var1 (ref), gameConfigurationActionsModule (copy), p3 (ref), creatorHub (ref), var2 (ref)
		var1(gameConfigurationActionsModule.getExperienceQuestionnaireUrl(p3), creatorHub, var2)
	end, { creatorHub, var1, var2, p3 })
end

local _ = function(p3)
	local current = p3.current
	p3.current = nil
	
	if current ~= nil then
		current:cancel()
	end
end

local function useAudienceController(p3)
	-- upvalues: useAudienceStores (ref), reactModule (ref), fFlagBuildExperienceTooltipsLightDismissModule (ref), useAudienceData (ref), useQuestionnaireHandler (ref), getAudiencesForValue (ref), gameConfigurationActionsModule (ref), fFlagEnableBuildAdPromotionModule (ref), refreshAdCampaignEligibilityModule (ref), debug (ref), formatErrorModule (ref), contentMaturityUtilsModule (ref)
	local var1 = useAudienceStores()
	local var2, var3 = reactModule.useState(nil)
	local var4, var5 = reactModule.useState(false)
	local _ = nil
	local var6 = reactModule.useRef(nil)
	local var7 = var6
	reactModule.useEffect(function()
		-- upvalues: var6 (ref)
		return function()
			-- upvalues: var6 (copy)
			local current = var6.current
			var6.current = nil
			
			if current ~= nil then
				current:cancel()
			end
		end
	end, { var6, p3 })
	local var8, var9 = reactModule.useState(nil)
	local var10 = if fFlagBuildExperienceTooltipsLightDismissModule then reactModule.useCallback(function()
		-- upvalues: var9 (ref)
		var9(nil)
	end, {}) else nil
	local var11 = useAudienceData(p3, var1.universeActivationStore, var1.universeConfigurationStore, var2)
	local var12 = useQuestionnaireHandler(p3, var1.questionnaireStore)
	local configurationData = var11.configurationData
	local isAudiencesReady = var11.isAudiencesReady
	local isConfigurationRefreshPending = var11.isConfigurationRefreshPending
	local isEligibilityResolved = var11.isEligibilityResolved
	local isNonPrivateLocked = var11.isNonPrivateLocked
	local var13 = not isAudiencesReady or (var4 or isConfigurationRefreshPending)
	
	return {
		handleAudienceActivated = reactModule.useCallback(function(p4)
			-- upvalues: var9 (ref), var13 (ref), getAudiencesForValue (copy), configurationData (ref), var3 (ref), var5 (ref), var1 (ref), p3 (ref), gameConfigurationActionsModule (copy), fFlagEnableBuildAdPromotionModule (copy), refreshAdCampaignEligibilityModule (copy), debug (copy), formatErrorModule (copy), isNonPrivateLocked (ref), var7 (write), contentMaturityUtilsModule (copy)
			local function _()
				-- upvalues: var9 (copy), p4 (ref)
				var9(function(p5)
					-- upvalues: p4 (copy)
					return if p5 == p4 then nil else p4
				end)
			end
			
			local function applyAudienceChange()
				-- upvalues: var13 (copy), getAudiencesForValue (copy), p4 (ref), configurationData (copy), var9 (copy), var3 (copy), var5 (copy), var1 (copy), p3 (copy), gameConfigurationActionsModule (copy), fFlagEnableBuildAdPromotionModule (copy), refreshAdCampaignEligibilityModule (copy), debug (copy), formatErrorModule (copy)
				if var13 then
					return
				end
				local var14 = getAudiencesForValue(p4, configurationData.audiences)
				var9(nil)
				var3(p4)
				var5(true)
				var1.universeActivationStore.setAudiences(p3, var14):andThen(function(p5)
					-- upvalues: gameConfigurationActionsModule (copy), p3 (copy), var1 (copy), fFlagEnableBuildAdPromotionModule (copy), refreshAdCampaignEligibilityModule (copy), debug (copy), formatErrorModule (copy), var3 (copy), var5 (copy)
					gameConfigurationActionsModule.updateCachedAudience(p3, p5.audiences)
					var1.universeActivationStore.activate(p3):andThen(function()
						-- upvalues: fFlagEnableBuildAdPromotionModule (copy), refreshAdCampaignEligibilityModule (copy), p3 (copy)
						if fFlagEnableBuildAdPromotionModule then
							refreshAdCampaignEligibilityModule(p3)
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
			local current = var7.current
			var7.current = nil
			
			if current ~= nil then
				current:cancel()
			end
			if p4 == "Private" then
				applyAudienceChange()
				
				return
			elseif not var14 then
				var3(p4)
			end
			local var15 = var1.universeActivationStore.refreshEligibility(p3)
			var7.current = var15
			var15:catch(function(p5)
				-- upvalues: var7 (ref), var15 (ref), debug (copy), formatErrorModule (copy), p3 (copy)
				if var7.current == var15 then
					debug.log("warn", "AudienceConfigurationContent eligibility recheck failed", { errorMessage = formatErrorModule(p5), universeId = p3 })
				end
			end):finally(function()
				-- upvalues: var7 (ref), var15 (ref), contentMaturityUtilsModule (copy), p3 (copy), var14 (ref), var3 (copy), var5 (copy), var9 (copy), p4 (ref), applyAudienceChange (ref)
				if var7.current ~= var15 then return end
				var7.current = nil
				
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
		end, {
			configurationData, var7, var13, isEligibilityResolved, isNonPrivateLocked,
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
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), reactModule (ref), view (ref), text (ref)
	local var1 = useLocalization({
		body = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_BODY,
		title = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PAGE_TITLE
	})
	
	return reactModule.createElement(view, {
		LayoutOrder = 1,
		tag = "col gap-xsmall size-full-0 auto-y"
	}, {
		Title = reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-title-large text-align-x-left content-default",
			Text = var1.title
		}),
		Body = reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "size-full-0 auto-y text-body-small text-wrap text-align-x-left content-default",
			Text = var1.body
		})
	})
end

local function AudienceList(p3)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), reactModule (ref), radioGroup (ref), list (ref), inputSize (ref), AudienceRow (ref)
	local var1 = useLocalization({
		friends = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_FRIENDS,
		private = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PRIVATE,
		["public"] = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PUBLIC
	})
	
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
				title = var1.private
			}),
			Friends = reactModule.createElement(AudienceRow, {
				LayoutOrder = 2,
				value = "Friends",
				isDisabled = p3.isDisabled,
				isLocked = p3.isNonPrivateLocked,
				lockIconRef = p3.friendsLockIconRef,
				onActivated = p3.onAudienceActivated,
				testId = p3.testId,
				title = var1.friends
			}),
			Public = reactModule.createElement(AudienceRow, {
				LayoutOrder = 3,
				value = "Public",
				isDisabled = p3.isDisabled,
				isLocked = p3.isNonPrivateLocked,
				lockIconRef = p3.publicLockIconRef,
				onActivated = p3.onAudienceActivated,
				testId = p3.testId,
				title = var1["public"]
			})
		})
	})
end

local function EligibilityTooltip(p3)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), useTokens (ref), useScaledValue (ref), buildExperienceAudienceTooltipMaxWidth (ref), reactModule (ref), popover (ref), popoverAlign (ref), fFlagBuildExperienceTooltipsLightDismissModule (ref), radius (ref), popoverSide (ref), view (ref), text (ref)
	local var1 = useLocalization({
		notEligible = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_NOT_ELIGIBLE,
		notEligibleDescription = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_NOT_ELIGIBLE_DESCRIPTION,
		publishRequired = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PUBLISH_REQUIRED,
		publishRequiredDescription = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PUBLISH_REQUIRED_DESCRIPTION
	})
	local isPublishRequired = p3.lockReason == "PublishRequired"
	
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
				testId = if isPublishRequired then `{p3.testId}-eligibility-tooltip--publish` else `{p30.testId}-eligibility-tooltip--not-eligible`
			}, {
				Title = reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "auto-xy text-title-small text-wrap text-align-x-left content-inverse-emphasis",
					Text = if isPublishRequired then var1.publishRequired else var1.notEligible,
					testId = `{p3.testId}-eligibility-tooltip--header`
				}),
				Text = reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "auto-xy text-body-small text-wrap text-align-x-left content-inverse-default",
					Text = if isPublishRequired then var1.publishRequiredDescription else var1.notEligibleDescription,
					testId = `{p3.testId}-eligibility-tooltip--text`
				})
			})
		})
	})
end

local function EligibilityBanner(p3)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), reactModule (ref), view (ref), icon (ref), iconName (ref), iconSize (ref), text (ref)
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
			Text = useLocalization({
				banner = localizationStringsModule.GAME_CONFIGURATION_AUDIENCE_BANNER
			}).banner
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
	-- upvalues: useAudienceController (ref), reactModule (ref), view (ref), AudienceHeader (ref), AudienceList (ref), EligibilityTooltip (ref), EligibilityBanner (ref)
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
			isDisabled = var1.isMutationPending,
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
		ContextBanner = if var1.isNonPrivateLocked and var1.lockReason == "RatingRequired" then reactModule.createElement(EligibilityBanner, { onActivated = var1.handleQuestionnaire, testId = testId }) else nil
	})
end