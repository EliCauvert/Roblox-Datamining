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

return reactModule.memo(function(p1)
	-- upvalues: useRoactService (ref), roactNetworking (ref), inlineEventTypeModule (ref), reactModule (ref), makeDevSurveyRequestImplModule (ref), useTokens (ref), useLocalization (ref), inlineSurveyLocalizationKeysModule (ref), fFlagInlineSurveyEnhancements (ref), inlineSurveyPresetsModule (ref), useInlineSurveyFlowModule (ref), phaseModule (ref), surfaceWrapperModule (ref), surfaceModule (ref), noop (ref), surveyModalModule (ref), surveyPhaseSlotsModule (ref), button (ref), fillBehavior (ref), inviteBannerModule (ref), surveyCardModule (ref)
	local var1 = useRoactService(roactNetworking)
	local var2 = p1.eventType == inlineEventTypeModule.DevDoNotPushToProd
	local var3 = reactModule.useMemo(function()
		-- upvalues: var2 (ref), makeDevSurveyRequestImplModule (copy), var1 (ref)
		return if var2 then makeDevSurveyRequestImplModule.makeRequestImpl() else var1
	end, { var2, var1 })
	local var4 = useTokens()
	local var5 = useLocalization({
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
	local var6 = if fFlagInlineSurveyEnhancements then inlineSurveyPresetsModule.getPresentationConfig(p1.preset) else nil
	local var7 = useInlineSurveyFlowModule({
		networkImpl = var3,
		eventType = p1.eventType,
		hasInvite = var6 ~= nil and var6.hasInvite,
		onClose = p1.onClose,
		onComplete = p1.onComplete,
		onEligible = p1.onEligible
	})
	local phase = var7.state.phase
	local var8 = reactModule.useRef(false)
	local dismiss = var7.dismiss
	local errorType = var7.state.errorType
	reactModule.useEffect(function()
		-- upvalues: phase (ref), phaseModule (copy), errorType (ref), dismiss (ref)
		if phase == phaseModule.Error and errorType == "fetch" then
			dismiss()
		end
	end, { phase, errorType, dismiss })
	
	if phase == phaseModule.Closed then
		return if var8.current then if fFlagInlineSurveyEnhancements then reactModule.createElement(surfaceWrapperModule, {
			isOpen = false,
			children = nil,
			surface = surfaceModule.Modal,
			onClose = noop
		}) else reactModule.createElement(surveyModalModule, { isOpen = false, children = nil, onClose = noop }) else nil
	elseif phase == phaseModule.Loading or phase == phaseModule.Error and var7.state.errorType == "fetch" then
		return nil
	end
	local slots = surveyPhaseSlotsModule.getSlots(var7.state, var5, var4, {
		onAnswerChanged = var7.setAnswer,
		onSubmit = var7.submit,
		onRetry = var7.retry,
		onDismiss = var7.dismiss,
		onAccept = var7.acceptInvite
	})
	local var9 = slots.primaryAction and reactModule.createElement(button, {
		text = slots.primaryAction.text,
		variant = slots.primaryAction.variant,
		fillBehavior = fillBehavior.Fill,
		isLoading = slots.primaryAction.isLoading,
		isDisabled = slots.primaryAction.isDisabled,
		onActivated = slots.primaryAction.onActivated
	}) or nil
	
	if not fFlagInlineSurveyEnhancements or not var6 then
		var8.current = true
		
		return reactModule.createElement(surveyModalModule, {
			isOpen = true,
			onClose = var7.dismiss,
			title = slots.headerTitle,
			footer = var9,
			children = slots.body
		})
	end
	local var10 = phase == phaseModule.Invite
	local var11 = if var6.hasInvite and var10 then var6.inviteSurface or var6.surveySurface else var6.surveySurface
	local var12 = if var10 then var7.declineInvite else var7.dismiss
	
	if var11 == surfaceModule.InContent and var10 then
		return reactModule.createElement(surfaceWrapperModule, {
			surface = surfaceModule.InContent,
			onClose = var12,
			children = reactModule.createElement(inviteBannerModule, { onAccept = var7.acceptInvite })
		})
	elseif var11 == surfaceModule.Modal then
		var8.current = true
		
		return reactModule.createElement(surfaceWrapperModule, {
			isOpen = true,
			surface = surfaceModule.Modal,
			onClose = var12,
			title = slots.headerTitle,
			footer = var9,
			children = slots.body
		})
	end
	return reactModule.createElement(surfaceWrapperModule, {
		surface = surfaceModule.InContent,
		onClose = var12,
		children = reactModule.createElement(surveyCardModule, { slots = slots, onDismiss = var7.dismiss })
	})
end)