local onPlatformSurveys = script:FindFirstAncestor("OnPlatformSurveys")
local parent = onPlatformSurveys.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local fFlagInlineSurveyEnhancements = require(parent.SharedFlags).FFlagInlineSurveyEnhancements
local button = foundationModule.Button
local fillBehavior = foundationModule.Enums.FillBehavior
local useTokens = foundationModule.Hooks.useTokens
local makeDevSurveyRequestImplModule = require(onPlatformSurveys.Dev.makeDevSurveyRequestImpl)
local inlineEventTypeModule = require(onPlatformSurveys.Enums.InlineEventType)
local _ = require(onPlatformSurveys.Enums.InlineSurveyPreset)
local inviteBannerModule = require(onPlatformSurveys.Components.InviteBanner)
local inlineSurveyLocalizationKeysModule = require(onPlatformSurveys.Constants.InlineSurveyLocalizationKeys)
local phaseModule = require(onPlatformSurveys.Enums.Phase)
local inlineSurveyPresetsModule = require(onPlatformSurveys.Constants.InlineSurveyPresets)
local surveyPhaseSlotsModule = require(onPlatformSurveys.Components.surveyPhaseSlots)
local surfaceModule = require(onPlatformSurveys.Enums.Surface)
local surfaceWrapperModule = require(onPlatformSurveys.Components.SurfaceWrapper)
local surveyCardModule = require(onPlatformSurveys.Components.SurveyCard)
local surveyModalModule = require(onPlatformSurveys.Components.SurveyModal)
local _ = require(onPlatformSurveys.Types.InlineSurveyTypes)
local useInlineSurveyFlowModule = require(onPlatformSurveys.Hooks.useInlineSurveyFlow)

local function noop() end

return reactModule.memo(function(p0)
	-- upvalues: useRoactService (ref), roactNetworking (ref), inlineEventTypeModule (ref), reactModule (ref), makeDevSurveyRequestImplModule (ref), useTokens (ref), useLocalization (ref), inlineSurveyLocalizationKeysModule (ref), fFlagInlineSurveyEnhancements (ref), inlineSurveyPresetsModule (ref), useInlineSurveyFlowModule (ref), phaseModule (ref), surfaceWrapperModule (ref), surfaceModule (ref), noop (ref), surveyModalModule (ref), surveyPhaseSlotsModule (ref), button (ref), fillBehavior (ref), inviteBannerModule (ref), surveyCardModule (ref)
	local var16 = useRoactService(roactNetworking)
	local var17 = p0.eventType == inlineEventTypeModule.DevDoNotPushToProd
	local var18 = reactModule.useMemo(function()
		-- upvalues: var17 (ref), makeDevSurveyRequestImplModule (copy), var16 (ref)
		return if var17 then makeDevSurveyRequestImplModule.makeRequestImpl() else var16
	end, { var17, var16 })
	local var19 = useTokens()
	local var20 = useLocalization({
		surveyTitle = inlineSurveyLocalizationKeysModule.surveyTitle,
		completedTitle = inlineSurveyLocalizationKeysModule.completedTitle,
		inviteBody = inlineSurveyLocalizationKeysModule.inviteBody,
		inviteAccept = inlineSurveyLocalizationKeysModule.inviteAccept,
		next = inlineSurveyLocalizationKeysModule.next,
		send = inlineSurveyLocalizationKeysModule.send,
		done = inlineSurveyLocalizationKeysModule.done,
		errorText = inlineSurveyLocalizationKeysModule.errorText,
		retry = inlineSurveyLocalizationKeysModule.retry
	})
	local var21 = if fFlagInlineSurveyEnhancements then inlineSurveyPresetsModule.getPresentationConfig(p0.preset) else nil
	local var22 = useInlineSurveyFlowModule({
		networkImpl = var18,
		eventType = p0.eventType,
		hasInvite = var21 ~= nil and var21.hasInvite,
		onClose = p0.onClose,
		onComplete = p0.onComplete,
		onEligible = p0.onEligible
	})
	local phase = var22.state.phase
	local var23 = reactModule.useRef(false)
	local dismiss = var22.dismiss
	local errorType = var22.state.errorType
	reactModule.useEffect(function()
		-- upvalues: phase (ref), phaseModule (copy), errorType (ref), dismiss (ref)
		if phase == phaseModule.Error and errorType == "fetch" then
			dismiss()
		end
	end, { phase, errorType, dismiss })
	
	if phase == phaseModule.Closed then
		return if var23.current then if fFlagInlineSurveyEnhancements then reactModule.createElement(surfaceWrapperModule, {
			isOpen = false,
			children = nil,
			surface = surfaceModule.Modal,
			onClose = noop
		}) else reactModule.createElement(surveyModalModule, { isOpen = false, children = nil, onClose = noop }) else nil
	elseif phase == phaseModule.Loading or phase == phaseModule.Error and var22.state.errorType == "fetch" then
		return nil
	end
	local slots = surveyPhaseSlotsModule.getSlots(var22.state, var20, var19, {
		onAnswerChanged = var22.setAnswer,
		onSubmit = var22.submit,
		onRetry = var22.retry,
		onDismiss = var22.dismiss,
		onAccept = var22.acceptInvite
	})
	local var25 = slots.primaryAction and reactModule.createElement(button, {
		text = slots.primaryAction.text,
		variant = slots.primaryAction.variant,
		fillBehavior = fillBehavior.Fill,
		isLoading = slots.primaryAction.isLoading,
		isDisabled = slots.primaryAction.isDisabled,
		onActivated = slots.primaryAction.onActivated
	}) or nil
	
	if not fFlagInlineSurveyEnhancements or not var21 then
		var23.current = true
		
		return reactModule.createElement(surveyModalModule, {
			isOpen = true,
			onClose = var22.dismiss,
			title = slots.headerTitle,
			footer = var25,
			children = slots.body
		})
	end
	local var26 = phase == phaseModule.Invite
	local var27 = if var21.hasInvite and var26 then var21.inviteSurface or var21.surveySurface else var21.surveySurface
	local var28 = if var26 then var22.declineInvite else var22.dismiss
	
	if var27 == surfaceModule.InContent and var26 then
		return reactModule.createElement(surfaceWrapperModule, {
			surface = surfaceModule.InContent,
			onClose = var28,
			children = reactModule.createElement(inviteBannerModule, { onAccept = var22.acceptInvite })
		})
	elseif var27 == surfaceModule.Modal then
		var23.current = true
		
		return reactModule.createElement(surfaceWrapperModule, {
			isOpen = true,
			surface = surfaceModule.Modal,
			onClose = var28,
			title = slots.headerTitle,
			footer = var25,
			children = slots.body
		})
	end
	return reactModule.createElement(surfaceWrapperModule, {
		surface = surfaceModule.InContent,
		onClose = var28,
		children = reactModule.createElement(surveyCardModule, { slots = slots, onDismiss = var22.dismiss })
	})
end)