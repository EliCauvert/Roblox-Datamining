local OnPlatformSurveys = script:FindFirstAncestor("OnPlatformSurveys")
local Parent = OnPlatformSurveys.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local FFlagInlineSurveyEnhancements = require(Parent.SharedFlags).FFlagInlineSurveyEnhancements
local Button = FoundationModule.Button
local FillBehavior = FoundationModule.Enums.FillBehavior
local UseTokensFunction = FoundationModule.Hooks.useTokens
local MakeDevSurveyRequestImplModule = require(OnPlatformSurveys.Dev.makeDevSurveyRequestImpl)
local InlineEventTypeModule = require(OnPlatformSurveys.Enums.InlineEventType)
local _ = require(OnPlatformSurveys.Enums.InlineSurveyPreset)
local InviteBannerModule = require(OnPlatformSurveys.Components.InviteBanner)
local InlineSurveyLocalizationKeysModule = require(OnPlatformSurveys.Constants.InlineSurveyLocalizationKeys)
local PhaseModule = require(OnPlatformSurveys.Enums.Phase)
local InlineSurveyPresetsModule = require(OnPlatformSurveys.Constants.InlineSurveyPresets)
local SurveyPhaseSlotsModule = require(OnPlatformSurveys.Components.surveyPhaseSlots)
local SurfaceModule = require(OnPlatformSurveys.Enums.Surface)
local SurfaceWrapperModule = require(OnPlatformSurveys.Components.SurfaceWrapper)
local SurveyCardModule = require(OnPlatformSurveys.Components.SurveyCard)
local SurveyModalModule = require(OnPlatformSurveys.Components.SurveyModal)
local _ = require(OnPlatformSurveys.Types.InlineSurveyTypes)
local UseInlineSurveyFlowModule = require(OnPlatformSurveys.Hooks.useInlineSurveyFlow)

local function noop() --[[ Line: 48 ]] end

return ReactModule.memo(function(p1) --[[ Line: 50 | Named "InlineSurvey" ]]
	-- upvalues: UseRoactServiceFunction (copy), RoactNetworking (copy), InlineEventTypeModule (copy), ReactModule (copy), MakeDevSurveyRequestImplModule (copy), UseTokensFunction (copy), UseLocalizationFunction (copy), InlineSurveyLocalizationKeysModule (copy), FFlagInlineSurveyEnhancements (copy), InlineSurveyPresetsModule (copy), UseInlineSurveyFlowModule (copy), PhaseModule (copy), SurfaceWrapperModule (copy), SurfaceModule (copy), noop (copy), SurveyModalModule (copy), SurveyPhaseSlotsModule (copy), Button (copy), FillBehavior (copy), InviteBannerModule (copy), SurveyCardModule (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local IsEventTypeMatch = p1.eventType == InlineEventTypeModule.DevDoNotPushToProd
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 53 ]]
		-- upvalues: IsEventTypeMatch (copy), MakeDevSurveyRequestImplModule (upval), UseRoactServiceResult (copy)
		return if IsEventTypeMatch then MakeDevSurveyRequestImplModule.makeRequestImpl() else UseRoactServiceResult
	end, { IsEventTypeMatch, UseRoactServiceResult })
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		surveyTitle = InlineSurveyLocalizationKeysModule.surveyTitle,
		completedTitle = InlineSurveyLocalizationKeysModule.completedTitle,
		inviteBody = InlineSurveyLocalizationKeysModule.inviteBody,
		inviteAccept = InlineSurveyLocalizationKeysModule.inviteAccept,
		next = InlineSurveyLocalizationKeysModule.next,
		send = InlineSurveyLocalizationKeysModule.send,
		done = InlineSurveyLocalizationKeysModule.done,
		errorText = InlineSurveyLocalizationKeysModule.errorText,
		retry = InlineSurveyLocalizationKeysModule.retry
	})
	local PresentationConfig = if FFlagInlineSurveyEnhancements then InlineSurveyPresetsModule.getPresentationConfig(p1.preset) else nil
	local UseInlineSurveyFlowModuleResult = UseInlineSurveyFlowModule({
		networkImpl = UseMemoResult,
		eventType = p1.eventType,
		hasInvite = PresentationConfig ~= nil and PresentationConfig.hasInvite,
		onClose = p1.onClose,
		onComplete = p1.onComplete,
		onEligible = p1.onEligible
	})
	local Phase = UseInlineSurveyFlowModuleResult.state.phase
	local UseRefResult = ReactModule.useRef(false)
	local DismissFunction = UseInlineSurveyFlowModuleResult.dismiss
	local ErrorType = UseInlineSurveyFlowModuleResult.state.errorType
	ReactModule.useEffect(function() --[[ Line: 88 ]]
		-- upvalues: Phase (copy), PhaseModule (upval), ErrorType (copy), DismissFunction (copy)
		if Phase == PhaseModule.Error and ErrorType == "fetch" then
			DismissFunction()
		end
	end, { Phase, ErrorType, DismissFunction })
	
	if Phase == PhaseModule.Closed then
		return if UseRefResult.current then if FFlagInlineSurveyEnhancements then ReactModule.createElement(SurfaceWrapperModule, {
			isOpen = false,
			children = nil,
			surface = SurfaceModule.Modal,
			onClose = noop
		}) else ReactModule.createElement(SurveyModalModule, { isOpen = false, children = nil, onClose = noop }) else nil
	elseif Phase == PhaseModule.Loading or Phase == PhaseModule.Error and UseInlineSurveyFlowModuleResult.state.errorType == "fetch" then
		return nil
	else
		local Slots = SurveyPhaseSlotsModule.getSlots(UseInlineSurveyFlowModuleResult.state, UseLocalizationResult, UseTokensResult, {
			onAnswerChanged = UseInlineSurveyFlowModuleResult.setAnswer,
			onSubmit = UseInlineSurveyFlowModuleResult.submit,
			onRetry = UseInlineSurveyFlowModuleResult.retry,
			onDismiss = UseInlineSurveyFlowModuleResult.dismiss,
			onAccept = UseInlineSurveyFlowModuleResult.acceptInvite
		})
		local Element = Slots.primaryAction and ReactModule.createElement(Button, {
			text = Slots.primaryAction.text,
			variant = Slots.primaryAction.variant,
			fillBehavior = FillBehavior.Fill,
			isLoading = Slots.primaryAction.isLoading,
			isDisabled = Slots.primaryAction.isDisabled,
			onActivated = Slots.primaryAction.onActivated
		}) or nil
		
		if not FFlagInlineSurveyEnhancements or not PresentationConfig then
			UseRefResult.current = true
			
			return ReactModule.createElement(SurveyModalModule, {
				isOpen = true,
				onClose = UseInlineSurveyFlowModuleResult.dismiss,
				title = Slots.headerTitle,
				footer = Element,
				children = Slots.body
			})
		end
		local IsPhaseMatch = Phase == PhaseModule.Invite
		local InviteSurface = PresentationConfig.hasInvite and IsPhaseMatch and PresentationConfig.inviteSurface or PresentationConfig.surveySurface
		local DeclineInvite = if IsPhaseMatch then UseInlineSurveyFlowModuleResult.declineInvite else UseInlineSurveyFlowModuleResult.dismiss
		
		if InviteSurface == SurfaceModule.InContent and IsPhaseMatch then
			return ReactModule.createElement(SurfaceWrapperModule, {
				surface = SurfaceModule.InContent,
				onClose = DeclineInvite,
				children = ReactModule.createElement(InviteBannerModule, { onAccept = UseInlineSurveyFlowModuleResult.acceptInvite })
			})
		elseif InviteSurface == SurfaceModule.Modal then
			UseRefResult.current = true
			
			return ReactModule.createElement(SurfaceWrapperModule, {
				isOpen = true,
				surface = SurfaceModule.Modal,
				onClose = DeclineInvite,
				title = Slots.headerTitle,
				footer = Element,
				children = Slots.body
			})
		else
			return ReactModule.createElement(SurfaceWrapperModule, {
				surface = SurfaceModule.InContent,
				onClose = DeclineInvite,
				children = ReactModule.createElement(SurveyCardModule, {
					slots = Slots,
					onDismiss = UseInlineSurveyFlowModuleResult.dismiss
				})
			})
		end
	end
end)