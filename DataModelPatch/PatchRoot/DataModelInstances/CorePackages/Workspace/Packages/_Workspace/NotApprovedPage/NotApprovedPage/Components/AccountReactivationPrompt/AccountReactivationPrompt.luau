local NotApprovedPage = script:FindFirstAncestor("NotApprovedPage")
local Parent = NotApprovedPage.Parent
local AccountReactivationPromptButtonsModule = require(NotApprovedPage.Components.AccountReactivationPrompt.AccountReactivationPromptButtons)
local SendNotApprovedPageEventModule = require(NotApprovedPage.Utils.sendNotApprovedPageEvent)
local CanReactivateModule = require(NotApprovedPage.Utils.canReactivate)
local _ = require(NotApprovedPage.Common.Types)
local EVENTTYPES = require(Parent.NotApprovedPageShared).Constants.EVENT_TYPES
local ReactModule = require(Parent.React)
local UseStateFunction = ReactModule.useState
local UseEffectFunction = ReactModule.useEffect
local UseCallbackFunction = ReactModule.useCallback
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local PartialPageModal = require(Parent.UIBlox).App.Dialog.Modal.PartialPageModal
local UserInputService = game:GetService("UserInputService")

return ReactModule.memo(function(p1)
	-- upvalues: UseStateFunction (copy), UserInputService (copy), UseSelectorFunction (copy), UseLocalizationFunction (copy), UseEffectFunction (copy), SendNotApprovedPageEventModule (copy), EVENTTYPES (copy), CanReactivateModule (copy), UseCallbackFunction (copy), ReactModule (copy), AccountReactivationPromptButtonsModule (copy), PartialPageModal (copy), View (copy), Text (copy)
	local UseStateResult, UseStateResult2 = UseStateFunction(false)
	local Y = UserInputService.StatusBarSize.Y
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.ScreenSize
	end)
	local UseLocalizationResult = UseLocalizationFunction({
		modalTitle = "Feature.AccountReactivation.Heading.AccountDeactivated",
		messageToUser = "Feature.AccountReactivation.Content.AccountDeactivatedMessage",
		errorMessage = "Feature.AccountReactivation.Label.DefaultError"
	})
	UseEffectFunction(function()
		-- upvalues: p1 (copy), SendNotApprovedPageEventModule (upval), EVENTTYPES (upval), CanReactivateModule (upval)
		local ModerationDetail = p1.moderationDetail
		SendNotApprovedPageEventModule({
			eventType = EVENTTYPES.AccountReactivationPageRendered,
			interventionId = ModerationDetail.interventionId,
			verificationCategory = ModerationDetail.verificationCategory,
			isReactivationEligible = tostring(CanReactivateModule(ModerationDetail.punishmentTypeDescription, ModerationDetail.endDate, ModerationDetail.verificationCategory)),
			punishedUserId = ModerationDetail.punishedUserId
		})
	end, {})
	
	return ReactModule.createElement(PartialPageModal, {
		marginSize = 0,
		title = UseLocalizationResult.modalTitle,
		screenSize = UseSelectorResult,
		distanceFromTop = Y,
		footerContent = UseCallbackFunction(function()
			-- upvalues: ReactModule (upval), AccountReactivationPromptButtonsModule (upval), p1 (copy), UseStateResult2 (copy)
			return ReactModule.createElement(AccountReactivationPromptButtonsModule, {
				moderationDetail = p1.moderationDetail,
				setErrorState = UseStateResult2,
				LogoutThunk = p1.LogoutThunk
			})
		end, { p1.moderationDetail, p1.LogoutThunk })
	}, {
		Content = ReactModule.createElement(View, { tag = "auto-xy col padding-xxlarge gap-medium" }, {
			MessageToUser = ReactModule.createElement(Text, {
				tag = "auto-xy text-wrap",
				LayoutOrder = 1,
				Text = UseLocalizationResult.messageToUser
			}),
			ErrorMessage = UseStateResult and ReactModule.createElement(Text, {
				tag = "auto-xy text-wrap",
				LayoutOrder = 2,
				Text = UseLocalizationResult.errorMessage
			})
		})
	})
end)