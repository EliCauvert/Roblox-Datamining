local HttpService = game:GetService("HttpService")
local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local Logger = require(Parent.Loggers).Logger
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local UseOpenWebViewFunction = require(Parent.WebViewUtils).useOpenWebView
local ExperienceQuestionnaireModule = require(Parent.DataHydration.ExperienceQuestionnaire)
local UniverseActivationModule = require(Parent.DataHydration.UniverseActivation)
local UniverseConfigurationModule = require(Parent.DataHydration.UniverseConfiguration)
local GameConfigurationActionsModule = require(BuildExperience.utils.GameConfigurationActions)
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
local BuildExperienceAudienceTooltipMaxWidth = game:DefineFastInt("BuildExperienceAudienceTooltipMaxWidth", 220)
local Callback = nil

local function formatDebugTable(Input, p1: number): string
	-- upvalues: Callback (ref)
	if p1 >= 2 then
		return "{ ... }"
	end
	local List = {}
	
	for i, value in Input do
		table.insert(List, `{tostring(i)} = {Callback(value, p1 + 1)}`)
	end
	return "{ " .. table.concat(List, ", ") .. " }"
end

Callback = function(Input, p2)
	-- upvalues: HttpService (copy), formatDebugTable (copy)
	if typeof(Input) == "table" then
		local Success, Result = pcall(function()
			-- upvalues: HttpService (upval), Input (copy)
			return HttpService:JSONEncode(Input)
		end)
		
		return if Success and Result ~= nil then Result else formatDebugTable(Input, p2 or 0)
	else
		return (tostring(Input))
	end
end

local function getSelectedAudience(Audiences): string?
	-- upvalues: UniverseActivationModule (copy)
	if Audiences == nil then
		return nil
	end
	if Audiences then
		for _, audience in Audiences do
			if audience == UniverseActivationModule.Audience.Public then
				return "Public"
			end
		end
		for _, audience1 in Audiences do
			if audience1 == UniverseActivationModule.Audience.Friends then
				return "Friends"
			end
		end
	end
	return "Private"
end

local function _(Friends): boolean
	-- upvalues: UniverseActivationModule (copy)
	return Friends == UniverseActivationModule.Audience.Public or Friends == UniverseActivationModule.Audience.Friends
end

local function getAudiencesForValue(p2, Audiences)
	-- upvalues: UniverseActivationModule (copy)
	local List = {}
	
	for _, audience in Audiences do
		if audience ~= UniverseActivationModule.Audience.Public and audience ~= UniverseActivationModule.Audience.Friends then
			table.insert(List, audience)
		end
	end
	if p2 == "Public" then
		table.insert(List, UniverseActivationModule.Audience.Public)
		
		return List
	end
	if p2 == "Friends" then
		table.insert(List, UniverseActivationModule.Audience.Friends)
	end
	return List
end

local function AudienceRow(Frame: Frame)
	-- upvalues: ReactModule (copy), Icon (copy), IconName (copy), IconSize (copy), View (copy), List (copy), RadioGroup (copy), InputSize (copy)
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y radius-medium",
		LayoutOrder = Frame.LayoutOrder,
		onActivated = ReactModule.useCallback(function()
			-- upvalues: Frame (copy)
			Frame.onActivated(Frame.value)
		end, { Frame.onActivated, Frame.value })
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
					isDisabled = Frame.isLocked,
					size = InputSize.Medium,
					testId = `{Frame.testId}-row-{string.lower(Frame.value)}-radio`,
					value = Frame.value
				})
			}),
			testId = `{Frame.testId}-row-{string.lower(Frame.value)}`
		})
	})
end

local _ = function(p3, p4, p5)
	-- upvalues: getSelectedAudience (copy)
	return if p3 == nil then if p4 then getSelectedAudience(p5.audiences) else nil else p3
end

local _ = function(p3, p4, p5)
	return p4 and (p3.eligibility == "Required" or p5)
end

local function getUniverseActivationStore(p3)
	-- upvalues: UniverseActivationModule (copy)
	return UniverseActivationModule.getUniverseActivationStore(p3)
end

local function getQuestionnaireStore(p3)
	-- upvalues: ExperienceQuestionnaireModule (copy)
	return ExperienceQuestionnaireModule.getExperienceQuestionnaireStore(p3)
end

local function getUniverseConfigurationStore(p3)
	-- upvalues: UniverseConfigurationModule (copy)
	return UniverseConfigurationModule.getUniverseConfigurationStore(p3)
end

local function useAudienceStores()
	-- upvalues: SignalsReactModule (copy), getUniverseActivationStore (copy), getQuestionnaireStore (copy), getUniverseConfigurationStore (copy)
	return {
		universeActivationStore = SignalsReactModule.useSignalState(getUniverseActivationStore),
		questionnaireStore = SignalsReactModule.useSignalState(getQuestionnaireStore),
		universeConfigurationStore = SignalsReactModule.useSignalState(getUniverseConfigurationStore)
	}
end

local function useAudienceData(p3, QuestionnaireStore, UniverseConfigurationStore, p4)
	-- upvalues: ReactModule (copy), SignalsReactModule (copy), getSelectedAudience (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UniverseConfigurationStore (copy), p3 (copy)
		return UniverseConfigurationStore.getAndFetchConfiguration(p3)
	end, { p3, UniverseConfigurationStore })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: QuestionnaireStore (copy), p3 (copy)
		return QuestionnaireStore.getAndFetchEligibility(p3)
	end, { QuestionnaireStore, p3 })
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: QuestionnaireStore (copy), p3 (copy)
		return QuestionnaireStore.getAndFetchLatestSubmission(p3)
	end, { QuestionnaireStore, p3 })
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseMemoResult.data)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(UseMemoResult1.data)
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(UseMemoResult2.data)
	local UseSignalStateResult3 = SignalsReactModule.useSignalState(UseMemoResult2.status)
	local HasUseSignalStateResult: boolean = SignalsReactModule.useSignalState(UseMemoResult.status) == "Ready" and UseSignalStateResult ~= nil
	local HasUseSignalStateResult1: boolean = SignalsReactModule.useSignalState(UseMemoResult1.status) == "Ready" and UseSignalStateResult1 ~= nil
	local IsFailed = UseSignalStateResult3 == "Failed"
	
	return {
		configurationData = UseSignalStateResult,
		isAudiencesReady = HasUseSignalStateResult,
		isNonPrivateLocked = HasUseSignalStateResult1 and (UseSignalStateResult1.eligibility == "Required" or IsFailed),
		isQuestionnaireEligibilityResolved = HasUseSignalStateResult1 and (UseSignalStateResult3 == "Ready" and UseSignalStateResult2 ~= nil or IsFailed),
		selectedAudience = if p4 == nil then if HasUseSignalStateResult then getSelectedAudience(UseSignalStateResult.audiences) else nil else p4
	}
end

local function useQuestionnaireHandler(p3, QuestionnaireStore)
	-- upvalues: UseOpenWebViewFunction (copy), ReactModule (copy), GameConfigurationActionsModule (copy)
	local UseOpenWebViewResult = UseOpenWebViewFunction()
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: QuestionnaireStore (copy), p3 (copy)
		QuestionnaireStore.fetchEligibility(p3)
		QuestionnaireStore.fetchLatestSubmission(p3)
	end, { QuestionnaireStore, p3 })
	
	return ReactModule.useCallback(function()
		-- upvalues: UseOpenWebViewResult (copy), GameConfigurationActionsModule (upval), p3 (copy), UseResult (copy)
		UseOpenWebViewResult(GameConfigurationActionsModule.getExperienceQuestionnaireUrl(p3), "Creator Hub", UseResult)
	end, { UseOpenWebViewResult, UseResult, p3 })
end

local function useAudienceController(UniverseId)
	-- upvalues: useAudienceStores (copy), ReactModule (copy), useAudienceData (copy), useQuestionnaireHandler (copy), getAudiencesForValue (copy), Logger (copy), Callback (ref)
	local UseAudienceStoresResult = useAudienceStores()
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(nil)
	local UseAudienceDataResult = useAudienceData(UniverseId, UseAudienceStoresResult.questionnaireStore, UseAudienceStoresResult.universeConfigurationStore, UseStateResult)
	local ConfigurationData = UseAudienceDataResult.configurationData
	local IsAudiencesReady = UseAudienceDataResult.isAudiencesReady
	local IsNonPrivateLocked = UseAudienceDataResult.isNonPrivateLocked
	local IsQuestionnaireEligibilityResolved = UseAudienceDataResult.isQuestionnaireEligibilityResolved
	
	return {
		handleAudienceActivated = ReactModule.useCallback(function(p3)
			-- upvalues: IsNonPrivateLocked (copy), UseStateResult2_2 (copy), IsAudiencesReady (copy), IsQuestionnaireEligibilityResolved (copy), UseStateResult1 (copy), getAudiencesForValue (upval), ConfigurationData (copy), UseStateResult2 (copy), UseStateResult2_1 (copy), UseAudienceStoresResult (copy), UniverseId (copy), Logger (upval), Callback (upval)
			if IsNonPrivateLocked and p3 ~= "Private" then
				UseStateResult2_2(function(p4)
					-- upvalues: p3 (copy)
					return if p4 == p3 then nil else p3
				end)
				
				return
			end
			if IsAudiencesReady and IsQuestionnaireEligibilityResolved and not UseStateResult1 then
				local AudiencesForValue = getAudiencesForValue(p3, ConfigurationData.audiences)
				UseStateResult2_2(nil)
				UseStateResult2(p3)
				UseStateResult2_1(true)
				UseAudienceStoresResult.universeActivationStore.setAudiences(UniverseId, AudiencesForValue):andThen(function()
					-- upvalues: UseAudienceStoresResult (upval), UniverseId (upval), Logger (upval), Callback (upval), UseStateResult2 (upval), UseStateResult2_1 (upval)
					UseAudienceStoresResult.universeActivationStore.activate(UniverseId):andThen(function()
						-- upvalues: UseAudienceStoresResult (upval), UniverseId (upval)
						UseAudienceStoresResult.universeConfigurationStore.fetchConfiguration(UniverseId)
					end):catch(function(Err)
						-- upvalues: Logger (upval), UniverseId (upval), Callback (upval), UseStateResult2 (upval)
						Logger:warning("AudienceConfigurationContent: failed to activate universe {} after audience update: {}", UniverseId, Callback(Err))
						UseStateResult2(nil)
					end):finally(function()
						-- upvalues: UseStateResult2_1 (upval)
						UseStateResult2_1(false)
					end)
				end):catch(function(Err)
					-- upvalues: Logger (upval), UniverseId (upval), Callback (upval), UseStateResult2 (upval), UseStateResult2_1 (upval)
					Logger:warning("AudienceConfigurationContent: failed to set audiences for universe {}: {}", UniverseId, Callback(Err))
					UseStateResult2(nil)
					UseStateResult2_1(false)
				end)
				
				return
			end
		end, {
			ConfigurationData, IsAudiencesReady, UseStateResult1, IsNonPrivateLocked,
			IsQuestionnaireEligibilityResolved,
			UseAudienceStoresResult.universeActivationStore,
			UseAudienceStoresResult.universeConfigurationStore, UniverseId
		}),
		handleQuestionnaire = useQuestionnaireHandler(UniverseId, UseAudienceStoresResult.questionnaireStore),
		isNonPrivateLocked = UseAudienceDataResult.isNonPrivateLocked,
		selectedAudience = UseAudienceDataResult.selectedAudience,
		tooltipTarget = UseStateResult3
	}
end

local function AudienceHeader()
	-- upvalues: ReactModule (copy), View (copy), Text (copy)
	return ReactModule.createElement(View, {
		LayoutOrder = 1,
		tag = "col gap-xsmall size-full-0 auto-y"
	}, {
		Title = ReactModule.createElement(Text, {
			LayoutOrder = 1,
			Text = "Experience Audience",
			tag = "size-full-0 auto-y text-title-large text-align-x-left content-default"
		}),
		Body = ReactModule.createElement(Text, {
			LayoutOrder = 2,
			Text = "Choose who can play after you publish this experience.",
			tag = "size-full-0 auto-y text-body-small text-wrap text-align-x-left content-default"
		})
	})
end

local function AudienceList(p3)
	-- upvalues: ReactModule (copy), RadioGroup (copy), List (copy), InputSize (copy), AudienceRow (copy)
	return ReactModule.createElement(RadioGroup.Root, {
		LayoutOrder = 2,
		Selectable = false,
		tag = "size-full-0 auto-y",
		onValueChanged = ReactModule.useCallback(function(p4)
			-- upvalues: p3 (copy)
			p3.onAudienceActivated(p4)
		end, { p3.onAudienceActivated }),
		value = if p3.selectedAudience == nil then "" else p3.selectedAudience
	}, {
		List = ReactModule.createElement(List.Root, {
			isContained = true,
			hasDivider = { hasDivider = true, isInset = false },
			size = InputSize.Medium,
			testId = `{p3.testId}-list`
		}, {
			Private = ReactModule.createElement(AudienceRow, {
				LayoutOrder = 1,
				isLocked = false,
				lockIconRef = nil,
				title = "Private",
				value = "Private",
				onActivated = p3.onAudienceActivated,
				testId = p3.testId
			}),
			Friends = ReactModule.createElement(AudienceRow, {
				LayoutOrder = 2,
				title = "Friends",
				value = "Friends",
				isLocked = p3.isNonPrivateLocked,
				lockIconRef = p3.friendsLockIconRef,
				onActivated = p3.onAudienceActivated,
				testId = p3.testId
			}),
			Public = ReactModule.createElement(AudienceRow, {
				LayoutOrder = 3,
				title = "Public",
				value = "Public",
				isLocked = p3.isNonPrivateLocked,
				lockIconRef = p3.publicLockIconRef,
				onActivated = p3.onAudienceActivated,
				testId = p3.testId
			})
		})
	})
end

local function EligibilityTooltip(p3)
	-- upvalues: UseTokensFunction (copy), UseScaledValueFunction (copy), BuildExperienceAudienceTooltipMaxWidth (copy), ReactModule (copy), Popover (copy), PopoverAlign (copy), Radius (copy), PopoverSide (copy), View (copy), Text (copy)
	return ReactModule.createElement(Popover.Root, {
		isOpen = p3.isOpen,
		testId = `{p3.testId}-eligibility-tooltip`
	}, {
		Anchor = ReactModule.createElement(Popover.Anchor, { anchorRef = p3.anchorRef }),
		Content = ReactModule.createElement(Popover.Content, {
			hasArrow = true,
			selectionGroup = false,
			align = PopoverAlign.Center,
			backgroundStyle = UseTokensFunction().Color.System.Contrast,
			radius = Radius.Small,
			side = PopoverSide.Left
		}, {
			Layout = ReactModule.createElement(View, {
				tag = "col gap-xsmall auto-xy padding-x-small padding-y-small",
				sizeConstraint = {
					MaxSize = Vector2.new(UseScaledValueFunction(BuildExperienceAudienceTooltipMaxWidth), 1e999)
				}
			}, {
				Title = ReactModule.createElement(Text, {
					LayoutOrder = 1,
					Text = "Not eligible for this audience",
					tag = "auto-xy text-title-small text-wrap text-align-x-left content-inverse-emphasis",
					testId = `{p3.testId}-eligibility-tooltip--header`
				}),
				Text = ReactModule.createElement(Text, {
					LayoutOrder = 2,
					Text = "Expand your audience eligibility on Creator Hub.",
					tag = "auto-xy text-body-small text-wrap text-align-x-left content-inverse-default",
					testId = `{p3.testId}-eligibility-tooltip--text`
				})
			})
		})
	})
end

local function EligibilityBanner(p3)
	-- upvalues: ReactModule (copy), View (copy), Icon (copy), IconName (copy), IconSize (copy), Text (copy)
	return ReactModule.createElement(View, {
		LayoutOrder = 3,
		tag = "row align-y-center gap-small size-full-0 auto-y padding-medium radius-medium bg-shift-200",
		onActivated = p3.onActivated,
		stateLayer = {},
		testId = `{p3.testId}-eligibility-banner`
	}, {
		Lock = ReactModule.createElement(Icon, {
			LayoutOrder = 1,
			tag = "auto-xy content-emphasis",
			name = IconName.LockClosed,
			size = IconSize.Small
		}),
		Text = ReactModule.createElement(Text, {
			LayoutOrder = 2,
			Text = "Expand your audience eligibility on Creator Hub",
			tag = "fill auto-y text-body-small text-align-x-left text-truncate-end content-emphasis"
		}),
		ExternalLink = ReactModule.createElement(Icon, {
			LayoutOrder = 3,
			tag = "auto-xy content-emphasis",
			name = IconName.ArrowUpRightFromSquare,
			size = IconSize.Small
		})
	})
end

return function(p3)
	-- upvalues: useAudienceController (copy), ReactModule (copy), View (copy), AudienceHeader (copy), AudienceList (copy), EligibilityTooltip (copy), EligibilityBanner (copy)
	local TestId = p3.testId or "audience-configuration-content"
	local UseAudienceControllerResult = useAudienceController(p3.universeId)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	
	return ReactModule.createElement(View, {
		tag = "col gap-medium size-full-0 auto-y padding-y-large",
		LayoutOrder = p3.layoutOrder,
		testId = TestId
	}, {
		Header = ReactModule.createElement(AudienceHeader),
		List = ReactModule.createElement(AudienceList, {
			friendsLockIconRef = UseRefResult,
			isNonPrivateLocked = UseAudienceControllerResult.isNonPrivateLocked,
			onAudienceActivated = UseAudienceControllerResult.handleAudienceActivated,
			publicLockIconRef = UseRefResult1,
			selectedAudience = UseAudienceControllerResult.selectedAudience,
			testId = TestId
		}),
		Tooltip = ReactModule.createElement(EligibilityTooltip, {
			anchorRef = if UseAudienceControllerResult.tooltipTarget == "Public" then UseRefResult1 else UseRefResult,
			isOpen = UseAudienceControllerResult.tooltipTarget ~= nil,
			testId = TestId
		}),
		ContextBanner = if UseAudienceControllerResult.isNonPrivateLocked then ReactModule.createElement(EligibilityBanner, {
			onActivated = UseAudienceControllerResult.handleQuestionnaire,
			testId = TestId
		}) else nil
	})
end