local httpService = game:GetService("HttpService")
local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local logger = require(parent.Loggers).Logger
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local useOpenWebView = require(parent.WebViewUtils).useOpenWebView
local experienceQuestionnaireModule = require(parent.DataHydration.ExperienceQuestionnaire)
local universeActivationModule = require(parent.DataHydration.UniverseActivation)
local universeConfigurationModule = require(parent.DataHydration.UniverseConfiguration)
local gameConfigurationActionsModule = require(buildExperience.utils.GameConfigurationActions)
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
local var10 = nil

local function formatDebugTable(p0, p1) --[[ line: 59 ]]
	-- upvalues: var10 (write)
	if p1 >= 2 then
		return "{ ... }"
	end
	local t = {}
	
	for i, v in p0 do
		table.insert(t, `{tostring(i)} = {var10(v, p1 + 1)}`)
	end
	return "{ " .. table.concat(t, ", ") .. " }"
end

var10 = function(p2, p3) --[[ line: 72 ]]
	-- upvalues: httpService (ref), formatDebugTable (ref)
	if typeof(p2) ~= "table" then
		return tostring(p2)
	end
	local ok, status = pcall(function() --[[ line: 77 ]]
		-- upvalues: httpService (copy), p2 (ref)
		return httpService:JSONEncode(p2)
	end)
	
	return if ok and status ~= nil then status else formatDebugTable(p2, p3 or 0)
end

local function getSelectedAudience(p4) --[[ line: 87 ]]
	-- upvalues: universeActivationModule (ref)
	if p4 == nil then
		return nil
	elseif p4 then
		for i, v in p4 do
			if v == universeActivationModule.Audience.Public then
				return "Public"
			end
		end
		for i, v in p4 do
			if v == universeActivationModule.Audience.Friends then
				return "Friends"
			end
		end
	end
	return "Private"
end

local function _(p5) --[[ line: 109 | named "isVisibilityAudience" ]]
	-- upvalues: universeActivationModule (ref)
	return if p5 ~= universeActivationModule.Audience.Public then p5 == universeActivationModule.Audience.Friends else true
end

local function getAudiencesForValue(p6, p7) --[[ line: 113 ]]
	-- upvalues: universeActivationModule (ref)
	local t = {}
	
	for i, v in p7 do
		if not (if v ~= universeActivationModule.Audience.Public then v == universeActivationModule.Audience.Friends else true) then
			table.insert(t, v)
		end
	end
	if p6 == "Public" then
		table.insert(t, universeActivationModule.Audience.Public)
		
		return t
	elseif p6 == "Friends" then
		table.insert(t, universeActivationModule.Audience.Friends)
	end
	return t
end

local function AudienceRow(p8) --[[ line: 143 ]]
	-- upvalues: reactModule (ref), icon (ref), iconName (ref), iconSize (ref), view (ref), list (ref), radioGroup (ref), inputSize (ref)
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y radius-medium",
		LayoutOrder = p8.LayoutOrder,
		onActivated = reactModule.useCallback(function() --[[ line: 144 ]]
			-- upvalues: p8 (ref)
			p8.onActivated(p8.value)
		end, { p8.onActivated, p8.value })
	}, {
		ListItem = reactModule.createElement(list.Item, {
			LayoutOrder = p8.LayoutOrder,
			title = p8.title,
			trailing = reactModule.createElement(view, { tag = "row align-y-center gap-medium auto-xy" }, {
				Lock = if p8.isLocked then reactModule.createElement(icon, {
					LayoutOrder = 1,
					tag = "auto-xy content-default",
					name = iconName.LockClosed,
					ref = p8.lockIconRef,
					size = iconSize.Small
				}) else nil,
				Radio = reactModule.createElement(radioGroup.Item, {
					LayoutOrder = 2,
					label = "",
					isDisabled = p8.isLocked,
					size = inputSize.Medium,
					testId = `{p8.testId}-row-{string.lower(p8.value)}-radio`,
					value = p8.value
				})
			}),
			testId = `{p8.testId}-row-{string.lower(p8.value)}`
		})
	})
end

local _ = function(p9, p10, p11) --[[ line: 206 | named "getSelectedAudienceFromState" ]]
	-- upvalues: getSelectedAudience (ref)
	return if p9 == nil then if p10 then getSelectedAudience(p11.audiences) else nil else p9
end

local _ = function(p12, p13, p14) --[[ line: 218 | named "getIsNonPrivateLocked" ]]
	return p13 and (if p12.eligibility ~= "Required" then p14 else true)
end

local function getUniverseActivationStore(p15) --[[ line: 226 ]]
	-- upvalues: universeActivationModule (ref)
	return universeActivationModule.getUniverseActivationStore(p15)
end

local function getQuestionnaireStore(p16) --[[ line: 230 ]]
	-- upvalues: experienceQuestionnaireModule (ref)
	return experienceQuestionnaireModule.getExperienceQuestionnaireStore(p16)
end

local function getUniverseConfigurationStore(p17) --[[ line: 234 ]]
	-- upvalues: universeConfigurationModule (ref)
	return universeConfigurationModule.getUniverseConfigurationStore(p17)
end

local function useAudienceStores() --[[ line: 238 ]]
	-- upvalues: signalsReactModule (ref), getUniverseActivationStore (ref), getQuestionnaireStore (ref), getUniverseConfigurationStore (ref)
	return {
		universeActivationStore = signalsReactModule.useSignalState(getUniverseActivationStore),
		questionnaireStore = signalsReactModule.useSignalState(getQuestionnaireStore),
		universeConfigurationStore = signalsReactModule.useSignalState(getUniverseConfigurationStore)
	}
end

local function useAudienceData(p18, p19, p20, p21) --[[ line: 250 ]]
	-- upvalues: reactModule (ref), signalsReactModule (ref), getSelectedAudience (ref)
	local var28 = reactModule.useMemo(function() --[[ line: 256 ]]
		-- upvalues: p20 (ref), p18 (ref)
		return p20.getAndFetchConfiguration(p18)
	end, { p18, p20 })
	local var29 = reactModule.useMemo(function() --[[ line: 259 ]]
		-- upvalues: p19 (ref), p18 (ref)
		return p19.getAndFetchEligibility(p18)
	end, { p19, p18 })
	local var30 = reactModule.useMemo(function() --[[ line: 262 ]]
		-- upvalues: p19 (ref), p18 (ref)
		return p19.getAndFetchLatestSubmission(p18)
	end, { p19, p18 })
	local var31 = signalsReactModule.useSignalState(var28.data)
	local var32 = signalsReactModule.useSignalState(var28.status)
	local var33 = signalsReactModule.useSignalState(var29.data)
	local var34 = signalsReactModule.useSignalState(var29.status)
	local var35 = signalsReactModule.useSignalState(var30.data)
	local var36 = signalsReactModule.useSignalState(var30.status)
	local var37 = var32 == "Ready" and var31 ~= nil
	local var38 = var34 == "Ready" and var33 ~= nil
	local isFailed = var36 == "Failed"
	
	return {
		configurationData = var31,
		isAudiencesReady = var37,
		isNonPrivateLocked = var38 and (if var33.eligibility ~= "Required" then isFailed else true),
		isQuestionnaireEligibilityResolved = var38 and ((var36 == "Ready" and var35 ~= nil) or isFailed),
		selectedAudience = if p21 ~= nil then if var37 then getSelectedAudience(var31.audiences) else nil else p21
	}
end

local function useQuestionnaireHandler(p22, p23) --[[ line: 288 ]]
	-- upvalues: useOpenWebView (ref), reactModule (ref), gameConfigurationActionsModule (ref)
	local var40 = useOpenWebView()
	local var41 = reactModule.useCallback(function() --[[ line: 291 ]]
		-- upvalues: p23 (ref), p22 (ref)
		p23.fetchEligibility(p22)
		p23.fetchLatestSubmission(p22)
	end, { p23, p22 })
	
	return reactModule.useCallback(function() --[[ line: 296 ]]
		-- upvalues: var40 (ref), gameConfigurationActionsModule (copy), p22 (ref), var41 (ref)
		var40(gameConfigurationActionsModule.getExperienceQuestionnaireUrl(p22), "Creator Hub", var41)
	end, { var40, var41, p22 })
end

local function useAudienceController(p24) --[[ line: 305 ]]
	-- upvalues: useAudienceStores (ref), reactModule (ref), useAudienceData (ref), useQuestionnaireHandler (ref), getAudiencesForValue (ref), logger (ref), var10 (write)
	local var42 = useAudienceStores()
	local var43, var44 = reactModule.useState(nil)
	local var45, var46 = reactModule.useState(false)
	local var47, var48 = reactModule.useState(nil)
	local var49 = useAudienceData(p24, var42.questionnaireStore, var42.universeConfigurationStore, var43)
	local var50 = useQuestionnaireHandler(p24, var42.questionnaireStore)
	local configurationData = var49.configurationData
	local isAudiencesReady = var49.isAudiencesReady
	local isNonPrivateLocked = var49.isNonPrivateLocked
	local isQuestionnaireEligibilityResolved = var49.isQuestionnaireEligibilityResolved
	
	return {
		handleAudienceActivated = reactModule.useCallback(function(p25) --[[ line: 320 ]]
			-- upvalues: isNonPrivateLocked (ref), var48 (ref), isAudiencesReady (ref), isQuestionnaireEligibilityResolved (ref), var45 (ref), getAudiencesForValue (copy), configurationData (ref), var44 (ref), var46 (ref), var42 (ref), p24 (ref), logger (copy), var10 (copy)
			if isNonPrivateLocked and p25 ~= "Private" then
				var48(function(p26) --[[ line: 322 ]]
					-- upvalues: p25 (ref)
					return if p26 == p25 then nil else p25
				end)
				
				return
			elseif isAudiencesReady and isQuestionnaireEligibilityResolved and not var45 then
				local var51 = getAudiencesForValue(p25, configurationData.audiences)
				var48(nil)
				var44(p25)
				var46(true)
				var42.universeActivationStore.setAudiences(p24, var51):andThen(function() --[[ line: 340 ]]
					-- upvalues: var42 (copy), p24 (copy), logger (copy), var10 (copy), var44 (copy), var46 (copy)
					var42.universeActivationStore.activate(p24):andThen(function() --[[ line: 343 ]]
						-- upvalues: var42 (copy), p24 (copy)
						var42.universeConfigurationStore.fetchConfiguration(p24)
					end):catch(function(p28) --[[ line: 346 ]]
						-- upvalues: logger (copy), p24 (copy), var10 (copy), var44 (copy)
						logger:warning("AudienceConfigurationContent: failed to activate universe {} after audience update: {}", p24, var10(p28))
						var44(nil)
					end):finally(function() --[[ line: 354 ]]
						-- upvalues: var46 (copy)
						var46(false)
					end)
				end):catch(function(p27) --[[ line: 358 ]]
					-- upvalues: logger (copy), p24 (copy), var10 (copy), var44 (copy), var46 (copy)
					logger:warning("AudienceConfigurationContent: failed to set audiences for universe {}: {}", p24, var10(p27))
					var44(nil)
					var46(false)
				end)
				
				return
			end
		end, {
			configurationData, isAudiencesReady, var45, isNonPrivateLocked,
			isQuestionnaireEligibilityResolved, var42.universeActivationStore,
			var42.universeConfigurationStore, p24
		}),
		handleQuestionnaire = var50,
		isNonPrivateLocked = var49.isNonPrivateLocked,
		selectedAudience = var49.selectedAudience,
		tooltipTarget = var47
	}
end

local function AudienceHeader() --[[ line: 389 ]]
	-- upvalues: reactModule (ref), view (ref), text (ref)
	return reactModule.createElement(view, {
		LayoutOrder = 1,
		tag = "col gap-xsmall size-full-0 auto-y"
	}, {
		Title = reactModule.createElement(text, {
			LayoutOrder = 1,
			Text = "Experience Audience",
			tag = "size-full-0 auto-y text-title-large text-align-x-left content-default"
		}),
		Body = reactModule.createElement(text, {
			LayoutOrder = 2,
			Text = "Choose who can play after you publish this experience.",
			tag = "size-full-0 auto-y text-body-small text-wrap text-align-x-left content-default"
		})
	})
end

local function AudienceList(p29) --[[ line: 416 ]]
	-- upvalues: reactModule (ref), radioGroup (ref), list (ref), inputSize (ref), AudienceRow (ref)
	return reactModule.createElement(radioGroup.Root, {
		LayoutOrder = 2,
		Selectable = false,
		tag = "size-full-0 auto-y",
		onValueChanged = reactModule.useCallback(function(p30) --[[ line: 417 ]]
			-- upvalues: p29 (ref)
			p29.onAudienceActivated(p30)
		end, { p29.onAudienceActivated }),
		value = if p29.selectedAudience ~= nil then "" else p29.selectedAudience
	}, {
		List = reactModule.createElement(list.Root, {
			isContained = true,
			hasDivider = { hasDivider = true, isInset = false },
			size = inputSize.Medium,
			testId = `{p29.testId}-list`
		}, {
			Private = reactModule.createElement(AudienceRow, {
				LayoutOrder = 1,
				isLocked = false,
				lockIconRef = nil,
				title = "Private",
				value = "Private",
				onActivated = p29.onAudienceActivated,
				testId = p29.testId
			}),
			Friends = reactModule.createElement(AudienceRow, {
				LayoutOrder = 2,
				title = "Friends",
				value = "Friends",
				isLocked = p29.isNonPrivateLocked,
				lockIconRef = p29.friendsLockIconRef,
				onActivated = p29.onAudienceActivated,
				testId = p29.testId
			}),
			Public = reactModule.createElement(AudienceRow, {
				LayoutOrder = 3,
				title = "Public",
				value = "Public",
				isLocked = p29.isNonPrivateLocked,
				lockIconRef = p29.publicLockIconRef,
				onActivated = p29.onAudienceActivated,
				testId = p29.testId
			})
		})
	})
end

local function EligibilityTooltip(p31) --[[ line: 474 ]]
	-- upvalues: useTokens (ref), useScaledValue (ref), buildExperienceAudienceTooltipMaxWidth (ref), reactModule (ref), popover (ref), popoverAlign (ref), radius (ref), popoverSide (ref), view (ref), text (ref)
	return reactModule.createElement(popover.Root, {
		isOpen = p31.isOpen,
		testId = `{p31.testId}-eligibility-tooltip`
	}, {
		Anchor = reactModule.createElement(popover.Anchor, { anchorRef = p31.anchorRef }),
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
					Text = "Not eligible for this audience",
					tag = "auto-xy text-title-small text-wrap text-align-x-left content-inverse-emphasis",
					testId = `{p31.testId}-eligibility-tooltip--header`
				}),
				Text = reactModule.createElement(text, {
					LayoutOrder = 2,
					Text = "Expand your audience eligibility on Creator Hub.",
					tag = "auto-xy text-body-small text-wrap text-align-x-left content-inverse-default",
					testId = `{p31.testId}-eligibility-tooltip--text`
				})
			})
		})
	})
end

local function EligibilityBanner(p32) --[[ line: 521 ]]
	-- upvalues: reactModule (ref), view (ref), icon (ref), iconName (ref), iconSize (ref), text (ref)
	return reactModule.createElement(view, {
		LayoutOrder = 3,
		tag = "row align-y-center gap-small size-full-0 auto-y padding-medium radius-medium bg-shift-200",
		onActivated = p32.onActivated,
		stateLayer = {},
		testId = `{p32.testId}-eligibility-banner`
	}, {
		Lock = reactModule.createElement(icon, {
			LayoutOrder = 1,
			tag = "auto-xy content-emphasis",
			name = iconName.LockClosed,
			size = iconSize.Small
		}),
		Text = reactModule.createElement(text, {
			LayoutOrder = 2,
			Text = "Expand your audience eligibility on Creator Hub",
			tag = "fill auto-y text-body-small text-align-x-left text-truncate-end content-emphasis"
		}),
		ExternalLink = reactModule.createElement(icon, {
			LayoutOrder = 3,
			tag = "auto-xy content-emphasis",
			name = iconName.ArrowUpRightFromSquare,
			size = iconSize.Small
		})
	})
end

return function(p33) --[[ line: 549 | named "AudienceConfigurationContent" ]]
	-- upvalues: useAudienceController (ref), reactModule (ref), view (ref), AudienceHeader (ref), AudienceList (ref), EligibilityTooltip (ref), EligibilityBanner (ref)
	local testId = p33.testId or "audience-configuration-content"
	local var53 = useAudienceController(p33.universeId)
	local var54 = reactModule.useRef(nil)
	local var55 = reactModule.useRef(nil)
	
	return reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y padding-large",
		LayoutOrder = p33.layoutOrder,
		testId = testId
	}, {
		Header = reactModule.createElement(AudienceHeader),
		List = reactModule.createElement(AudienceList, {
			friendsLockIconRef = var54,
			isNonPrivateLocked = var53.isNonPrivateLocked,
			onAudienceActivated = var53.handleAudienceActivated,
			publicLockIconRef = var55,
			selectedAudience = var53.selectedAudience,
			testId = testId
		}),
		Tooltip = reactModule.createElement(EligibilityTooltip, {
			anchorRef = if var53.tooltipTarget == "Public" then var55 else var54,
			isOpen = var53.tooltipTarget ~= nil,
			testId = testId
		}),
		ContextBanner = if var53.isNonPrivateLocked then reactModule.createElement(EligibilityBanner, { onActivated = var53.handleQuestionnaire, testId = testId }) else nil
	})
end