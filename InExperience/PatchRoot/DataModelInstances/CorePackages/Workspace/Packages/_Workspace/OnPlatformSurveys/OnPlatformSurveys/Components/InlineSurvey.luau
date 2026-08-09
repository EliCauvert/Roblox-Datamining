local onPlatformSurveys = script:FindFirstAncestor("OnPlatformSurveys")
local parent = onPlatformSurveys.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local button = foundationModule.Button
local fillBehavior = foundationModule.Enums.FillBehavior
local useTokens = foundationModule.Hooks.useTokens
local makeDevSurveyRequestImplModule = require(onPlatformSurveys.Dev.makeDevSurveyRequestImpl)
local inlineEventTypeModule = require(onPlatformSurveys.Enums.InlineEventType)
local inlineSurveyLocalizationKeysModule = require(onPlatformSurveys.Constants.InlineSurveyLocalizationKeys)
local surveyPhaseSlotsModule = require(onPlatformSurveys.Components.surveyPhaseSlots)
local surveyModalModule = require(onPlatformSurveys.Components.SurveyModal)
local _ = require(onPlatformSurveys.Types.InlineSurveyTypes)
local useInlineSurveyFlowModule = require(onPlatformSurveys.Hooks.useInlineSurveyFlow)

local function noop() --[[ line: 36 ]] end

return reactModule.memo(function(p0) --[[ line: 38 | named "InlineSurvey" ]]
	-- upvalues: useRoactService (ref), roactNetworking (ref), inlineEventTypeModule (ref), reactModule (ref), makeDevSurveyRequestImplModule (ref), useTokens (ref), useLocalization (ref), inlineSurveyLocalizationKeysModule (ref), useInlineSurveyFlowModule (ref), surveyModalModule (ref), noop (ref), surveyPhaseSlotsModule (ref), button (ref), fillBehavior (ref)
	local var10 = useRoactService(roactNetworking)
	local var11 = p0.eventType == inlineEventTypeModule.DevDoNotPushToProd
	local var12 = reactModule.useMemo(function() --[[ line: 41 ]]
		-- upvalues: var11 (ref), makeDevSurveyRequestImplModule (copy), var10 (ref)
		return if var11 then makeDevSurveyRequestImplModule.makeRequestImpl() else var10
	end, { var11, var10 })
	local var13 = useTokens()
	local var14 = useLocalization({
		surveyTitle = inlineSurveyLocalizationKeysModule.surveyTitle,
		completedTitle = inlineSurveyLocalizationKeysModule.completedTitle,
		send = inlineSurveyLocalizationKeysModule.send,
		done = inlineSurveyLocalizationKeysModule.done,
		errorText = inlineSurveyLocalizationKeysModule.errorText,
		retry = inlineSurveyLocalizationKeysModule.retry
	})
	local var15 = useInlineSurveyFlowModule({
		networkImpl = var12,
		eventType = p0.eventType,
		onClose = p0.onClose,
		onComplete = p0.onComplete,
		onEligible = p0.onEligible
	})
	local phase = var15.state.phase
	local var16 = reactModule.useRef(false)
	local dismiss = var15.dismiss
	local errorType = var15.state.errorType
	reactModule.useEffect(function() --[[ line: 70 ]]
		-- upvalues: phase (ref), errorType (ref), dismiss (ref)
		if phase == "error" and errorType == "fetch" then
			dismiss()
		end
	end, { phase, errorType, dismiss })
	
	if phase == "closed" then
		return if var16.current then reactModule.createElement(surveyModalModule, { isOpen = false, children = nil, onClose = noop }) else nil
	elseif phase == "loading" or phase == "error" and var15.state.errorType == "fetch" then
		return nil
	end
	local slots = surveyPhaseSlotsModule.getSlots(var15.state, var14, var13, {
		onAnswerChanged = var15.setAnswer,
		onSubmit = var15.submit,
		onRetry = var15.retry,
		onDismiss = var15.dismiss
	})
	var16.current = true
	
	return reactModule.createElement(surveyModalModule, {
		isOpen = true,
		onClose = var15.dismiss,
		title = slots.headerTitle,
		footer = slots.primary and reactModule.createElement(button, {
			text = slots.primary.text,
			variant = slots.primary.variant,
			fillBehavior = fillBehavior.Fill,
			isLoading = slots.primary.isLoading,
			isDisabled = slots.primary.isDisabled,
			onActivated = slots.primary.onActivated
		}) or nil,
		children = slots.body
	})
end)