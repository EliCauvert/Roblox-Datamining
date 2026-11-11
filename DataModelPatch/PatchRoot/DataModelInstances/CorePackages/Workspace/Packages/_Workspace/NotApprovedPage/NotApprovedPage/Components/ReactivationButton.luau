local NotApprovedPage = script:FindFirstAncestor("NotApprovedPage")
local Parent = NotApprovedPage.Parent
local ReactivateAccountModule = require(NotApprovedPage.Rodux.Thunks.ReactivateAccount)
local SendNotApprovedPageEventModule = require(NotApprovedPage.Utils.sendNotApprovedPageEvent)
local Constants = require(Parent.NotApprovedPageShared).Constants
local EVENTTYPES = Constants.EVENT_TYPES
local VERIFICATIONTYPES = Constants.VERIFICATION_TYPES
local INTERVENTIONTYPES = Constants.INTERVENTION_TYPES
local PUNISHMENTTYPETOINTERVENTIONMAP = Constants.PUNISHMENT_TYPE_TO_INTERVENTION_MAP
local _ = require(NotApprovedPage.Common.Types)
local ReactModule = require(Parent.React)
local UseStateFunction = ReactModule.useState
local UseMemoFunction = ReactModule.useMemo
local UseCallbackFunction = ReactModule.useCallback
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local NavigateBackFunction = require(Parent.NavigationRodux).Thunks.NavigateBack
local AppPage = require(Parent.RobloxAppEnums).AppPage
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local FoundationModule = require(Parent.Foundation)
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local UseNotApprovedPageContextFunction = require(NotApprovedPage.Contexts.NotApprovedPageContext).useNotApprovedPageContext

return ReactModule.memo(function(p1)
	-- upvalues: UseStateFunction (copy), UseDispatchFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), UseNotApprovedPageContextFunction (copy), PUNISHMENTTYPETOINTERVENTIONMAP (copy), UseCallbackFunction (copy), EVENTTYPES (copy), SendNotApprovedPageEventModule (copy), AppPage (copy), UrlBuilder (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), NavigateBackFunction (copy), ReactivateAccountModule (copy), UseMemoFunction (copy), VERIFICATIONTYPES (copy), INTERVENTIONTYPES (copy), ReactModule (copy), Button (copy), ButtonVariant (copy), InputSize (copy)
	local UseStateResult, UseStateResult2 = UseStateFunction(false)
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local Translations = UseNotApprovedPageContextFunction().translations
	local CanReactivate = p1.canReactivate
	local ModerationDetail = p1.moderationDetail
	local VerificationCategory = ModerationDetail.verificationCategory
	local PUNISHMENTTYPETOINTERVENTION = PUNISHMENTTYPETOINTERVENTIONMAP[ModerationDetail.punishmentTypeDescription]
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: UseStateResult2 (copy), p1 (copy), EVENTTYPES (upval), SendNotApprovedPageEventModule (upval), AppPage (upval), UrlBuilder (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval)
		UseStateResult2(true)
		
		if p1.sendPageEvent then
			p1.sendPageEvent(EVENTTYPES.EmailVerificationClicked)
		else
			SendNotApprovedPageEventModule({ eventType = EVENTTYPES.EmailVerificationClicked })
		end
		local config = {
			name = AppPage.EmailVerification,
			detail = UrlBuilder.fromString("www:")()
		}
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
			
			return
		else
			UseDispatchResult(NavigateDownFunction(config))
		end
	end, { UseDispatchResult })
	local UseCallbackResult1 = UseCallbackFunction(function()
		-- upvalues: UseStateResult2 (copy), p1 (copy), EVENTTYPES (upval), SendNotApprovedPageEventModule (upval), AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateBackFunction (upval), NavigateDownFunction (upval)
		UseStateResult2(true)
		
		if p1.sendPageEvent then
			p1.sendPageEvent(EVENTTYPES.ParentVerificationClicked)
		else
			SendNotApprovedPageEventModule({ eventType = EVENTTYPES.ParentVerificationClicked })
		end
		local config = {
			name = AppPage.AmpWizardContainer,
			extraProps = {
				featureName = "CanRequestPunishmentLifting",
				entryPointEventCtx = "banScreenChargebackLiftPunishment",
				recourseData = { punishmentType = "Chargeback" },
				completionCallback = function(_, _)
					-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (upval), NavigateBackFunction (upval), UseStateResult2 (upval)
					if FFlagSignalsNavP3Dispatch then
						NavigationCommands.back()
					else
						UseDispatchResult(NavigateBackFunction())
					end
					UseStateResult2(false)
				end
			}
		}
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
			
			return
		else
			UseDispatchResult(NavigateDownFunction(config))
		end
	end, {
		UseDispatchResult,
		ModerationDetail,
		PUNISHMENTTYPETOINTERVENTION,
		p1.LogoutThunk
	})
	local UseCallbackResult2 = UseCallbackFunction(function()
		-- upvalues: UseStateResult2 (copy), p1 (copy), EVENTTYPES (upval), SendNotApprovedPageEventModule (upval), UseDispatchResult (copy), ReactivateAccountModule (upval), UseRoactServiceResult (copy), ModerationDetail (copy)
		UseStateResult2(true)
		
		if p1.sendPageEvent then
			p1.sendPageEvent(EVENTTYPES.ReactivateClicked)
		else
			SendNotApprovedPageEventModule({ eventType = EVENTTYPES.ReactivateClicked })
		end
		UseDispatchResult(ReactivateAccountModule(UseRoactServiceResult, ModerationDetail.punishmentId)):andThen(function()
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(false)
		end)
	end, {
		UseDispatchResult,
		UseRoactServiceResult,
		ModerationDetail.punishmentId
	})
	local UseMemoResult = UseMemoFunction(function()
		-- upvalues: VerificationCategory (copy), VERIFICATIONTYPES (upval), Translations (copy), UseCallbackResult1 (copy), UseCallbackResult (copy), PUNISHMENTTYPETOINTERVENTION (copy), INTERVENTIONTYPES (upval), CanReactivate (copy), UseCallbackResult2 (copy)
		return if VerificationCategory == VERIFICATIONTYPES.Parent then {
			label = Translations.parentVerificationButton,
			action = UseCallbackResult1
		} elseif VerificationCategory == VERIFICATIONTYPES.Email then {
			label = Translations.emailVerificationButton,
			action = UseCallbackResult
		} elseif PUNISHMENTTYPETOINTERVENTION == INTERVENTIONTYPES.Banned and not CanReactivate then {
			label = Translations.continueButton,
			action = function() end
		} else {
			label = Translations.continueButton,
			action = UseCallbackResult2
		}
	end, {
		CanReactivate, UseCallbackResult1, UseCallbackResult, UseCallbackResult2,
		ModerationDetail.endDate, VerificationCategory, PUNISHMENTTYPETOINTERVENTION
	})
	
	return ReactModule.createElement(Button, {
		testId = "reactivation-button",
		text = UseMemoResult.label,
		onActivated = UseMemoResult.action,
		variant = ButtonVariant.Emphasis,
		size = InputSize.Medium,
		width = UDim.new(1, 0),
		isLoading = UseStateResult,
		isDisabled = not CanReactivate or (not p1.isAgreed or UseStateResult),
		LayoutOrder = p1.layoutOrder
	})
end)