local NotApprovedPage = script:FindFirstAncestor("NotApprovedPage")
local Parent = NotApprovedPage.Parent
local VRService = game:GetService("VRService")
local ReactModule = require(Parent.React)
local UseCallbackFunction = ReactModule.useCallback
local UseEffectFunction = ReactModule.useEffect
local UseRefFunction = ReactModule.useRef
local UseStateFunction = ReactModule.useState
local UseMemoFunction = ReactModule.useMemo
local FoundationModule = require(Parent.Foundation)
local Coachmark = FoundationModule.Coachmark
local OverlayProvider = FoundationModule.OverlayProvider
local PopoverSide = FoundationModule.Enums.PopoverSide
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local _ = require(Parent.ReactFocusNavigation)
local UseAppFocusRootFunction = FocusNavigationUtilsModule.useAppFocusRoot
local CanReactivateModule = require(NotApprovedPage.Utils.canReactivate)
local GetVRSurfaceGuiModule = require(NotApprovedPage.Utils.getVRSurfaceGui)
local HasAnyCommutationModule = require(NotApprovedPage.Utils.hasAnyCommutation)
local InputHandlersModule = require(Parent.InputHandlers)
local _ = require(NotApprovedPage.Common.Types)
local UseNotApprovedPageContextFunction = require(NotApprovedPage.Contexts.NotApprovedPageContext).useNotApprovedPageContext
local PUNISHMENTTYPETOINTERVENTIONMAP = require(Parent.NotApprovedPageShared).Constants.PUNISHMENT_TYPE_TO_INTERVENTION_MAP

return ReactModule.memo(function(p1)
	-- upvalues: UseRefFunction (copy), UseStateFunction (copy), UseNotApprovedPageContextFunction (copy), VRService (copy), GetVRSurfaceGuiModule (copy), PUNISHMENTTYPETOINTERVENTIONMAP (copy), CanReactivateModule (copy), HasAnyCommutationModule (copy), UseCallbackFunction (copy), UseMemoFunction (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), UseAppFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), UseEffectFunction (copy), ReactModule (copy), OverlayProvider (copy), Coachmark (copy), PopoverSide (copy), PopoverAlign (copy)
	local UseRefResult = UseRefFunction(nil)
	local UseStateResult, UseStateResult2 = UseStateFunction(false)
	local UseNotApprovedPageContextResult = UseNotApprovedPageContextFunction()
	local Translations = UseNotApprovedPageContextResult.translations
	local CommutationEligibility = UseNotApprovedPageContextResult.commutationEligibility
	local VRSurfaceGuiModule = if VRService.VREnabled then GetVRSurfaceGuiModule() else nil
	local ModerationDetail = p1.moderationDetail
	local VerificationCategory = ModerationDetail.verificationCategory
	local NoUseStateResult: boolean = CanReactivateModule(PUNISHMENTTYPETOINTERVENTIONMAP[ModerationDetail.punishmentTypeDescription], ModerationDetail.endDate, VerificationCategory) and (not (VerificationCategory and VerificationCategory ~= "") and (not HasAnyCommutationModule(CommutationEligibility) and (not p1.hasNavigatedForward and not UseStateResult)))
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(true)
	end, {})
	local UseAppFocusRootResult = UseAppFocusRootFunction({
		isAutoFocusRoot = true,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
		isFocusable = NoUseStateResult,
		customEventHandlers = UseMemoFunction(function()
			-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), UseCallbackResult (copy)
			return {
				[FocusNavigationEventNameEnum.NavigateBack] = {
					handler = InputHandlersModule.onRelease(function(p2)
						-- upvalues: UseCallbackResult (upval)
						p2.cancelled = true
						UseCallbackResult()
					end)
				}
			}
		end, { UseCallbackResult })
	})
	local UseCallbackResult1 = UseCallbackFunction(function(Current)
		-- upvalues: UseRefResult (copy), UseAppFocusRootResult (copy)
		UseRefResult.current = Current
		
		if type(UseAppFocusRootResult) == "function" then
			UseAppFocusRootResult(Current)
		end
	end, { UseAppFocusRootResult })
	UseEffectFunction(function()
		-- upvalues: UseRefResult (copy)
		if UseRefResult.current then
			UseRefResult.current.SelectionBehaviorDown = Enum.SelectionBehavior.Stop
			UseRefResult.current.SelectionBehaviorLeft = Enum.SelectionBehavior.Stop
			UseRefResult.current.SelectionBehaviorRight = Enum.SelectionBehavior.Stop
			UseRefResult.current.SelectionBehaviorUp = Enum.SelectionBehavior.Stop
			UseRefResult.current.SelectionGroup = true
		end
	end, { NoUseStateResult })
	
	return ReactModule.createElement(OverlayProvider, { gui = VRSurfaceGuiModule }, {
		Coachmark = ReactModule.createElement(Coachmark, {
			title = Translations.reactivationNoticeHeading,
			text = Translations.reactivationNoticeDescription,
			isOpen = NoUseStateResult,
			side = PopoverSide.Top,
			align = PopoverAlign.Center,
			anchorRef = p1.anchorRef,
			onClose = UseCallbackResult,
			ref = UseCallbackResult1
		})
	})
end)