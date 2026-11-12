local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local UseOpenWebViewFunction = require(Parent.WebViewUtils).useOpenWebView
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local ExperienceQuestionnaireModule = require(Parent.DataHydration.ExperienceQuestionnaire)
local UniverseActivationModule = require(Parent.DataHydration.UniverseActivation)
local UniverseConfigurationModule = require(Parent.DataHydration.UniverseConfiguration)
local ContentMaturityUtilsModule = require(BuildExperience.utils.ContentMaturityUtils)
local GameConfigurationActionsModule = require(BuildExperience.utils.GameConfigurationActions)
local FormatErrorModule = require(BuildExperience.utils.formatError)
local RefreshPublishEligibilityModule = require(BuildExperience.utils.refreshPublishEligibility)
local RefreshAdCampaignEligibilityModule = require(BuildExperience.utils.refreshAdCampaignEligibility)
local FFlagEnableBuildAdPromotionModule = require(BuildExperience.Flags.FFlagEnableBuildAdPromotion)
local Debug = require(Parent.DataHydration.CreatorAgentChat).debug
local Icon = FoundationModule.Icon
local List = FoundationModule.List
local Popover = FoundationModule.Popover
local RadioGroup = FoundationModule.RadioGroup
local Text = FoundationModule.Text
local View = FoundationModule.View
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local InputSize = FoundationModule.Enums.InputSize
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local PopoverSide = FoundationModule.Enums.PopoverSide
local Radius = FoundationModule.Enums.Radius
local UseScaledValueFunction = FoundationModule.Hooks.useScaledValue
local UseTokensFunction = FoundationModule.Hooks.useTokens
local PrivacyType = UniverseConfigurationModule.PrivacyType
local config = {
	[PrivacyType.Private] = "Private",
	[PrivacyType.FriendsOnly] = "Friends",
	[PrivacyType.Public] = "Public"
}
local BuildExperienceAudienceTooltipMaxWidth = game:DefineFastInt("BuildExperienceAudienceTooltipMaxWidth", 220)

local function _(p1)
	-- upvalues: config (copy), UniverseConfigurationModule (copy)
	return if p1 == nil then nil else config[UniverseConfigurationModule.getPrivacyTypeForAudiences(p1)]
end

local _ = function(Friends): boolean
	-- upvalues: UniverseActivationModule (copy)
	return Friends == UniverseActivationModule.Audience.Public or Friends == UniverseActivationModule.Audience.Friends
end

local function getAudiencesForValue(p1, Audiences)
	-- upvalues: UniverseActivationModule (copy)
	local List = {}
	
	for _, audience in Audiences do
		if audience ~= UniverseActivationModule.Audience.Public and audience ~= UniverseActivationModule.Audience.Friends then
			table.insert(List, audience)
		end
	end
	if p1 == "Public" then
		table.insert(List, UniverseActivationModule.Audience.Public)
		
		return List
	end
	if p1 == "Friends" then
		table.insert(List, UniverseActivationModule.Audience.Friends)
	end
	return List
end

local function AudienceRow(Frame: Frame)
	-- upvalues: ReactModule (copy), Icon (copy), IconName (copy), IconSize (copy), View (copy), List (copy), RadioGroup (copy), InputSize (copy)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: Frame (copy)
		Frame.onActivated(Frame.value)
	end, { Frame.onActivated, Frame.value })
	local Text: string = `{Frame.testId}-row-{string.lower(Frame.value)}`
	
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y radius-medium",
		LayoutOrder = Frame.LayoutOrder,
		onActivated = if Frame.isDisabled then nil else UseResult,
		testId = `{Text}-button`
	}, {
		ListItem = ReactModule.createElement(List.Item, {
			LayoutOrder = Frame.LayoutOrder,
			title = Frame.title,
			trailing = ReactModule.createElement(View, { tag = "row align-y-center gap-medium auto-xy" }, {
				Lock = if Frame.isLocked then ReactModule.createElement(Icon, {
					LayoutOrder = 1,
					tag = "auto-xy content-default",
					name = IconName.LockClosed,
					ref = Frame.lockIconRef,
					size = IconSize.Small
				}) else nil,
				Radio = ReactModule.createElement(RadioGroup.Item, {
					LayoutOrder = 2,
					label = "",
					isDisabled = Frame.isDisabled or Frame.isLocked,
					size = InputSize.Medium,
					testId = `{Text}-radio`,
					value = Frame.value
				})
			}),
			testId = Text
		})
	})
end

local _ = function(p2, p3, p4)
	-- upvalues: config (copy), UniverseConfigurationModule (copy)
	if p2 ~= nil then
		return p2
	elseif p3 then
		local Audiences = p4.audiences
		
		return if Audiences == nil then nil else config[UniverseConfigurationModule.getPrivacyTypeForAudiences(Audiences)]
	else
		return nil
	end
end

local function getUniverseActivationStore(p2)
	-- upvalues: UniverseActivationModule (copy)
	return UniverseActivationModule.getUniverseActivationStore(p2)
end

local function getQuestionnaireStore(p2)
	-- upvalues: ExperienceQuestionnaireModule (copy)
	return ExperienceQuestionnaireModule.getExperienceQuestionnaireStore(p2)
end

local function getUniverseConfigurationStore(p2)
	-- upvalues: UniverseConfigurationModule (copy)
	return UniverseConfigurationModule.getUniverseConfigurationStore(p2)
end

local function useAudienceStores()
	-- upvalues: SignalsReactModule (copy), getUniverseActivationStore (copy), getQuestionnaireStore (copy), getUniverseConfigurationStore (copy)
	return {
		universeActivationStore = SignalsReactModule.useSignalState(getUniverseActivationStore),
		questionnaireStore = SignalsReactModule.useSignalState(getQuestionnaireStore),
		universeConfigurationStore = SignalsReactModule.useSignalState(getUniverseConfigurationStore)
	}
end

local function useAudienceData(UniverseId, UniverseActivationStore, UniverseConfigurationStore, SelectedAudience)
	-- upvalues: ReactModule (copy), Debug (copy), FormatErrorModule (copy), SignalsReactModule (copy), ContentMaturityUtilsModule (copy), config (copy), UniverseConfigurationModule (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UniverseConfigurationStore (copy), UniverseId (copy)
		return UniverseConfigurationStore.getAndFetchConfiguration(UniverseId)
	end, { UniverseId, UniverseConfigurationStore })
	local UseStateResult, UseStateResult2 = ReactModule.useState(true)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy), UniverseConfigurationStore (copy), UniverseId (copy), Debug (upval), FormatErrorModule (upval)
		local Flag = true
		UseStateResult2(true)
		UniverseConfigurationStore.refreshConfiguration(UniverseId):catch(function(Err)
			-- upvalues: Debug (upval), FormatErrorModule (upval), UniverseId (upval)
			Debug.log("warn", "AudienceConfigurationContent configuration refresh failed", {
				errorMessage = FormatErrorModule(Err),
				universeId = UniverseId
			})
		end):finally(function()
			-- upvalues: Flag (ref), UseStateResult2 (upval)
			if Flag then
				UseStateResult2(false)
			end
		end)
		
		return function()
			-- upvalues: Flag (ref)
			Flag = false
		end
	end, { UniverseConfigurationStore, UniverseId })
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseMemoResult.data)
	local HasUseSignalStateResult: boolean = SignalsReactModule.useSignalState(UseMemoResult.status) == "Ready" and UseSignalStateResult ~= nil
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(ReactModule.useMemo(function()
		-- upvalues: UniverseActivationStore (copy), UniverseId (copy)
		return UniverseActivationStore.getAndFetchEligibility(UniverseId)
	end, { UniverseActivationStore, UniverseId }).status)
	local IsSealBroken = ContentMaturityUtilsModule.isSealBroken(UniverseId)
	local RatingRequired = if ContentMaturityUtilsModule.isContentUnrated(UniverseId) then if IsSealBroken then "RatingRequired" else "PublishRequired" else nil
	local config1 = {
		configurationData = UseSignalStateResult,
		isAudiencesReady = HasUseSignalStateResult,
		isConfigurationRefreshPending = UseStateResult,
		isEligibilityResolved = UseSignalStateResult1 == "Ready" or UseSignalStateResult1 == "Failed",
		isNonPrivateLocked = RatingRequired ~= nil,
		lockReason = RatingRequired
	}
	local SelectedAudience1 = nil
	
	if SelectedAudience == nil then
		if HasUseSignalStateResult then
			local Audiences = UseSignalStateResult.audiences
			SelectedAudience1 = if Audiences == nil then nil else config[UniverseConfigurationModule.getPrivacyTypeForAudiences(Audiences)]
		else
			SelectedAudience1 = nil
		end
	else
		SelectedAudience1 = SelectedAudience
	end
	config1.selectedAudience = SelectedAudience1
	
	return config1
end

local function useQuestionnaireHandler(UniverseId, QuestionnaireStore)
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), UseOpenWebViewFunction (copy), ReactModule (copy), RefreshPublishEligibilityModule (copy), GameConfigurationActionsModule (copy)
	local CreatorHub = UseLocalizationFunction({
		creatorHub = LocalizationStringsModule.GAME_CONFIGURATION_CREATOR_HUB
	}).creatorHub
	local UseOpenWebViewResult = UseOpenWebViewFunction()
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: RefreshPublishEligibilityModule (upval), UniverseId (copy)
		RefreshPublishEligibilityModule(UniverseId)
	end, { QuestionnaireStore, UniverseId })
	
	return ReactModule.useCallback(function()
		-- upvalues: UseOpenWebViewResult (copy), GameConfigurationActionsModule (upval), UniverseId (copy), CreatorHub (copy), UseResult (copy)
		UseOpenWebViewResult(GameConfigurationActionsModule.getExperienceQuestionnaireUrl(UniverseId), CreatorHub, UseResult)
	end, { CreatorHub, UseOpenWebViewResult, UseResult, UniverseId })
end

local _ = function(p2)
	local Current = p2.current
	p2.current = nil
	
	if Current ~= nil then
		Current:cancel()
	end
end

local function useAudienceController(UniverseId)
	-- upvalues: useAudienceStores (copy), ReactModule (copy), useAudienceData (copy), useQuestionnaireHandler (copy), getAudiencesForValue (copy), GameConfigurationActionsModule (copy), FFlagEnableBuildAdPromotionModule (copy), RefreshAdCampaignEligibilityModule (copy), Debug (copy), FormatErrorModule (copy), ContentMaturityUtilsModule (copy)
	local UseAudienceStoresResult = useAudienceStores()
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseRefResult1 = nil
	local UseRefResult = ReactModule.useRef(nil)
	UseRefResult1 = UseRefResult
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy)
		return function()
			-- upvalues: UseRefResult (upval)
			local Current = UseRefResult.current
			UseRefResult.current = nil
			
			if Current ~= nil then
				Current:cancel()
			end
		end
	end, { UseRefResult, UniverseId })
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(nil)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_2 (copy)
		UseStateResult2_2(nil)
	end, {})
	local UseAudienceDataResult = useAudienceData(UniverseId, UseAudienceStoresResult.universeActivationStore, UseAudienceStoresResult.universeConfigurationStore, UseStateResult)
	local ConfigurationData = UseAudienceDataResult.configurationData
	local IsConfigurationRefreshPending = UseAudienceDataResult.isConfigurationRefreshPending
	local IsNonPrivateLocked = UseAudienceDataResult.isNonPrivateLocked
	local NoIsAudiencesReady = not UseAudienceDataResult.isAudiencesReady or (UseStateResult1 or IsConfigurationRefreshPending)
	
	return {
		handleAudienceActivated = ReactModule.useCallback(function(p2)
			-- upvalues: UseStateResult2_2 (copy), NoIsAudiencesReady (copy), getAudiencesForValue (upval), ConfigurationData (copy), UseStateResult2 (copy), UseStateResult2_1 (copy), UseAudienceStoresResult (copy), UniverseId (copy), GameConfigurationActionsModule (upval), FFlagEnableBuildAdPromotionModule (upval), RefreshAdCampaignEligibilityModule (upval), Debug (upval), FormatErrorModule (upval), IsNonPrivateLocked (copy), UseRefResult1 (ref), ContentMaturityUtilsModule (upval)
			local function _()
				-- upvalues: UseStateResult2_2 (upval), p2 (copy)
				UseStateResult2_2(function(p3)
					-- upvalues: p2 (upval)
					return if p3 == p2 then nil else p2
				end)
			end
			
			local function applyAudienceChange()
				-- upvalues: NoIsAudiencesReady (upval), getAudiencesForValue (upval), p2 (copy), ConfigurationData (upval), UseStateResult2_2 (upval), UseStateResult2 (upval), UseStateResult2_1 (upval), UseAudienceStoresResult (upval), UniverseId (upval), GameConfigurationActionsModule (upval), FFlagEnableBuildAdPromotionModule (upval), RefreshAdCampaignEligibilityModule (upval), Debug (upval), FormatErrorModule (upval)
				if not NoIsAudiencesReady then
					local AudiencesForValue = getAudiencesForValue(p2, ConfigurationData.audiences)
					UseStateResult2_2(nil)
					UseStateResult2(p2)
					UseStateResult2_1(true)
					UseAudienceStoresResult.universeActivationStore.setAudiences(UniverseId, AudiencesForValue):andThen(function(Result)
						-- upvalues: GameConfigurationActionsModule (upval), UniverseId (upval), UseAudienceStoresResult (upval), FFlagEnableBuildAdPromotionModule (upval), RefreshAdCampaignEligibilityModule (upval), Debug (upval), FormatErrorModule (upval), UseStateResult2 (upval), UseStateResult2_1 (upval)
						GameConfigurationActionsModule.updateCachedAudience(UniverseId, Result.audiences)
						UseAudienceStoresResult.universeActivationStore.activate(UniverseId):andThen(function()
							-- upvalues: FFlagEnableBuildAdPromotionModule (upval), RefreshAdCampaignEligibilityModule (upval), UniverseId (upval)
							if FFlagEnableBuildAdPromotionModule then
								RefreshAdCampaignEligibilityModule(UniverseId)
							end
						end):catch(function(Err)
							-- upvalues: Debug (upval), FormatErrorModule (upval), UniverseId (upval), UseStateResult2 (upval)
							Debug.log("warn", "AudienceConfigurationContent activate after audience update failed", {
								errorMessage = FormatErrorModule(Err),
								universeId = UniverseId
							})
							UseStateResult2(nil)
						end):finally(function()
							-- upvalues: UseStateResult2_1 (upval)
							UseStateResult2_1(false)
						end)
					end):catch(function(Err)
						-- upvalues: Debug (upval), FormatErrorModule (upval), UniverseId (upval), UseStateResult2 (upval), UseStateResult2_1 (upval)
						Debug.log("warn", "AudienceConfigurationContent set audiences failed", {
							errorMessage = FormatErrorModule(Err),
							universeId = UniverseId
						})
						UseStateResult2(nil)
						UseStateResult2_1(false)
					end)
					
					return
				end
			end
			
			local IsNotPrivate: boolean = IsNonPrivateLocked and p2 ~= "Private"
			
			if IsNotPrivate then
				UseStateResult2_2(function(p3)
					-- upvalues: p2 (copy)
					return if p3 == p2 then nil else p2
				end)
			end
			if NoIsAudiencesReady then return end
			if not IsNotPrivate then
				UseStateResult2_1(true)
			end
			local UseRefResult = UseRefResult1
			local Current = UseRefResult.current
			UseRefResult.current = nil
			
			if Current ~= nil then
				Current:cancel()
			end
			if p2 == "Private" then
				applyAudienceChange()
				
				return
			end
			if not IsNotPrivate then
				UseStateResult2(p2)
			end
			local RefreshEligibilityResult = UseAudienceStoresResult.universeActivationStore.refreshEligibility(UniverseId)
			UseRefResult.current = RefreshEligibilityResult
			RefreshEligibilityResult:catch(function(Err)
				-- upvalues: UseRefResult (copy), RefreshEligibilityResult (copy), Debug (upval), FormatErrorModule (upval), UniverseId (upval)
				if UseRefResult.current == RefreshEligibilityResult then
					Debug.log("warn", "AudienceConfigurationContent eligibility recheck failed", {
						errorMessage = FormatErrorModule(Err),
						universeId = UniverseId
					})
				end
			end):finally(function()
				-- upvalues: UseRefResult (copy), RefreshEligibilityResult (copy), ContentMaturityUtilsModule (upval), UniverseId (upval), IsNotPrivate (copy), UseStateResult2 (upval), UseStateResult2_1 (upval), UseStateResult2_2 (upval), p2 (copy), applyAudienceChange (copy)
				if UseRefResult.current ~= RefreshEligibilityResult then return end
				UseRefResult.current = nil
				
				if not ContentMaturityUtilsModule.isContentUnrated(UniverseId) then
					applyAudienceChange()
					
					return
				end
				if not IsNotPrivate then
					UseStateResult2(nil)
					UseStateResult2_1(false)
					UseStateResult2_2(function(p3)
						-- upvalues: p2 (upval)
						return if p3 == p2 then nil else p2
					end)
				end
			end)
		end, {
			ConfigurationData, UseRefResult1, NoIsAudiencesReady,
			UseAudienceDataResult.isEligibilityResolved, IsNonPrivateLocked,
			UseAudienceStoresResult.universeActivationStore,
			UseAudienceStoresResult.universeConfigurationStore, UniverseId
		}),
		handleQuestionnaire = useQuestionnaireHandler(UniverseId, UseAudienceStoresResult.questionnaireStore),
		isMutationPending = UseStateResult1,
		isNonPrivateLocked = UseAudienceDataResult.isNonPrivateLocked,
		lockReason = UseAudienceDataResult.lockReason,
		onTooltipPressedOutside = UseResult,
		selectedAudience = UseAudienceDataResult.selectedAudience,
		tooltipTarget = UseStateResult3
	}
end

local function AudienceHeader()
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), ReactModule (copy), View (copy), Text (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		body = LocalizationStringsModule.GAME_CONFIGURATION_AUDIENCE_BODY,
		title = LocalizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PAGE_TITLE
	})
	
	return ReactModule.createElement(View, {
		LayoutOrder = 1,
		tag = "col gap-xsmall size-full-0 auto-y"
	}, {
		Title = ReactModule.createElement(Text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-title-large text-align-x-left content-default",
			Text = UseLocalizationResult.title
		}),
		Body = ReactModule.createElement(Text, {
			LayoutOrder = 2,
			tag = "size-full-0 auto-y text-body-small text-wrap text-align-x-left content-default",
			Text = UseLocalizationResult.body
		})
	})
end

local function AudienceList(p2)
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), ReactModule (copy), RadioGroup (copy), List (copy), InputSize (copy), AudienceRow (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		friends = LocalizationStringsModule.GAME_CONFIGURATION_AUDIENCE_FRIENDS,
		private = LocalizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PRIVATE,
		public = LocalizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PUBLIC
	})
	
	return ReactModule.createElement(RadioGroup.Root, {
		LayoutOrder = 2,
		Selectable = false,
		tag = "size-full-0 auto-y",
		onValueChanged = ReactModule.useCallback(function(p3)
			-- upvalues: p2 (copy)
			p2.onAudienceActivated(p3)
		end, { p2.onAudienceActivated }),
		value = if p2.selectedAudience == nil then "" else p2.selectedAudience
	}, {
		List = ReactModule.createElement(List.Root, {
			isContained = true,
			hasDivider = { hasDivider = true, isInset = false },
			size = InputSize.Medium,
			testId = `{p2.testId}-list`
		}, {
			Private = ReactModule.createElement(AudienceRow, {
				LayoutOrder = 1,
				isLocked = false,
				lockIconRef = nil,
				value = "Private",
				isDisabled = p2.isDisabled,
				onActivated = p2.onAudienceActivated,
				testId = p2.testId,
				title = UseLocalizationResult.private
			}),
			Friends = ReactModule.createElement(AudienceRow, {
				LayoutOrder = 2,
				value = "Friends",
				isDisabled = p2.isDisabled,
				isLocked = p2.isNonPrivateLocked,
				lockIconRef = p2.friendsLockIconRef,
				onActivated = p2.onAudienceActivated,
				testId = p2.testId,
				title = UseLocalizationResult.friends
			}),
			Public = ReactModule.createElement(AudienceRow, {
				LayoutOrder = 3,
				value = "Public",
				isDisabled = p2.isDisabled,
				isLocked = p2.isNonPrivateLocked,
				lockIconRef = p2.publicLockIconRef,
				onActivated = p2.onAudienceActivated,
				testId = p2.testId,
				title = UseLocalizationResult.public
			})
		})
	})
end

local function EligibilityTooltip(p2)
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), UseTokensFunction (copy), UseScaledValueFunction (copy), BuildExperienceAudienceTooltipMaxWidth (copy), ReactModule (copy), Popover (copy), PopoverAlign (copy), Radius (copy), PopoverSide (copy), View (copy), Text (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		notEligible = LocalizationStringsModule.GAME_CONFIGURATION_AUDIENCE_NOT_ELIGIBLE,
		notEligibleDescription = LocalizationStringsModule.GAME_CONFIGURATION_AUDIENCE_NOT_ELIGIBLE_DESCRIPTION,
		publishRequired = LocalizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PUBLISH_REQUIRED,
		publishRequiredDescription = LocalizationStringsModule.GAME_CONFIGURATION_AUDIENCE_PUBLISH_REQUIRED_DESCRIPTION
	})
	local NotEligible = UseLocalizationResult.notEligible
	local NotEligibleDescription = UseLocalizationResult.notEligibleDescription
	local PublishRequired = UseLocalizationResult.publishRequired
	local PublishRequiredDescription = UseLocalizationResult.publishRequiredDescription
	local IsPublishRequired = p2.lockReason == "PublishRequired"
	
	return ReactModule.createElement(Popover.Root, {
		isOpen = p2.isOpen,
		testId = `{p2.testId}-eligibility-tooltip`
	}, {
		Anchor = ReactModule.createElement(Popover.Anchor, { anchorRef = p2.anchorRef }),
		Content = ReactModule.createElement(Popover.Content, {
			hasArrow = true,
			selectionGroup = false,
			align = PopoverAlign.Center,
			backgroundStyle = UseTokensFunction().Color.System.Contrast,
			onPressedOutside = p2.onPressedOutside,
			radius = Radius.Small,
			side = PopoverSide.Left
		}, {
			Layout = ReactModule.createElement(View, {
				tag = "col gap-xsmall auto-xy padding-x-small padding-y-small",
				sizeConstraint = {
					MaxSize = Vector2.new(UseScaledValueFunction(BuildExperienceAudienceTooltipMaxWidth), 1e999)
				},
				testId = if IsPublishRequired then `{p2.testId}-eligibility-tooltip--publish` else `{p28.testId}-eligibility-tooltip--not-eligible`
			}, {
				Title = ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = "auto-xy text-title-small text-wrap text-align-x-left content-inverse-emphasis",
					Text = if IsPublishRequired then PublishRequired else NotEligible,
					testId = `{p2.testId}-eligibility-tooltip--header`
				}),
				Text = ReactModule.createElement(Text, {
					LayoutOrder = 2,
					tag = "auto-xy text-body-small text-wrap text-align-x-left content-inverse-default",
					Text = if IsPublishRequired then PublishRequiredDescription else NotEligibleDescription,
					testId = `{p2.testId}-eligibility-tooltip--text`
				})
			})
		})
	})
end

local function EligibilityBanner(p2)
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), ReactModule (copy), View (copy), Icon (copy), IconName (copy), IconSize (copy), Text (copy)
	return ReactModule.createElement(View, {
		LayoutOrder = 3,
		tag = "row align-y-center gap-small size-full-0 auto-y padding-medium radius-medium bg-shift-200",
		onActivated = p2.onActivated,
		stateLayer = {},
		testId = `{p2.testId}-eligibility-banner`
	}, {
		Lock = ReactModule.createElement(Icon, {
			LayoutOrder = 1,
			tag = "auto-xy content-emphasis",
			name = IconName.LockClosed,
			size = IconSize.Small
		}),
		Text = ReactModule.createElement(Text, {
			LayoutOrder = 2,
			tag = "fill auto-y text-body-small text-align-x-left text-truncate-end content-emphasis",
			Text = UseLocalizationFunction({
				banner = LocalizationStringsModule.GAME_CONFIGURATION_AUDIENCE_BANNER
			}).banner
		}),
		ExternalLink = ReactModule.createElement(Icon, {
			LayoutOrder = 3,
			tag = "auto-xy content-emphasis",
			name = IconName.ArrowUpRightFromSquare,
			size = IconSize.Small
		})
	})
end

return function(p2)
	-- upvalues: useAudienceController (copy), ReactModule (copy), View (copy), AudienceHeader (copy), AudienceList (copy), EligibilityTooltip (copy), EligibilityBanner (copy)
	local TestId = p2.testId or "audience-configuration-content"
	local UseAudienceControllerResult = useAudienceController(p2.universeId)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local IsRatingRequired: boolean = UseAudienceControllerResult.isNonPrivateLocked and UseAudienceControllerResult.lockReason == "RatingRequired"
	
	return ReactModule.createElement(View, {
		tag = "col gap-medium size-full-0 auto-y padding-y-large",
		LayoutOrder = p2.layoutOrder,
		testId = TestId
	}, {
		Header = ReactModule.createElement(AudienceHeader),
		List = ReactModule.createElement(AudienceList, {
			friendsLockIconRef = UseRefResult,
			isDisabled = UseAudienceControllerResult.isMutationPending,
			isNonPrivateLocked = UseAudienceControllerResult.isNonPrivateLocked,
			onAudienceActivated = UseAudienceControllerResult.handleAudienceActivated,
			publicLockIconRef = UseRefResult1,
			selectedAudience = UseAudienceControllerResult.selectedAudience,
			testId = TestId
		}),
		Tooltip = ReactModule.createElement(EligibilityTooltip, {
			anchorRef = if UseAudienceControllerResult.tooltipTarget == "Public" then UseRefResult1 else UseRefResult,
			isOpen = UseAudienceControllerResult.tooltipTarget ~= nil,
			lockReason = UseAudienceControllerResult.lockReason,
			onPressedOutside = UseAudienceControllerResult.onTooltipPressedOutside,
			testId = TestId
		}),
		ContextBanner = if IsRatingRequired then ReactModule.createElement(EligibilityBanner, {
			onActivated = UseAudienceControllerResult.handleQuestionnaire,
			testId = TestId
		}) else nil
	})
end