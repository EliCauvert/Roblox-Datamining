local NotApprovedPage = script:FindFirstAncestor("NotApprovedPage")
local Parent = NotApprovedPage.Parent
local ReactivateDeactivatedAccountModule = require(NotApprovedPage.Rodux.Thunks.ReactivateDeactivatedAccount)
local SetModerationStatusFunction = require(Parent.NotApprovedPageShared).SetModerationStatus
local UseLogoutModule = require(NotApprovedPage.Utils.useLogout)
local _ = require(NotApprovedPage.Common.Types)
local ReactModule = require(Parent.React)
local UseStateFunction = ReactModule.useState
local UseCallbackFunction = ReactModule.useCallback
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local GuiService = game:GetService("GuiService")
local NotificationType = require(Parent.RobloxAppEnums).NotificationType
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize

return ReactModule.memo(function(p1)
	-- upvalues: UseStateFunction (copy), UseDispatchFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), UseLogoutModule (copy), UseCallbackFunction (copy), ReactivateDeactivatedAccountModule (copy), SetModerationStatusFunction (copy), GuiService (copy), NotificationType (copy), UseLocalizationFunction (copy), ReactModule (copy), View (copy), Button (copy), ButtonVariant (copy), InputSize (copy)
	local UseStateResult, UseStateResult2 = UseStateFunction(false)
	local UseStateResult1, UseStateResult2_1 = UseStateFunction(false)
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseLogoutModuleResult = UseLogoutModule(UseStateResult2_1, p1.LogoutThunk)
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: p1 (copy), UseStateResult2 (copy), ReactivateDeactivatedAccountModule (upval), UseRoactServiceResult (copy), UseDispatchResult (copy), SetModerationStatusFunction (upval), GuiService (upval), NotificationType (upval)
		p1.setErrorState(false)
		UseStateResult2(true)
		ReactivateDeactivatedAccountModule(UseRoactServiceResult):andThen(function(_)
			-- upvalues: UseDispatchResult (upval), SetModerationStatusFunction (upval), GuiService (upval), NotificationType (upval)
			UseDispatchResult(SetModerationStatusFunction(false))
			GuiService:BroadcastNotification("", NotificationType.RESTART_LUA_APP)
		end):catch(function(_)
			-- upvalues: p1 (upval), UseStateResult2 (upval)
			p1.setErrorState(true)
			UseStateResult2(false)
		end)
	end, {
		UseDispatchResult,
		UseRoactServiceResult,
		p1.setErrorState
	})
	local UseLocalizationResult = UseLocalizationFunction({
		logoutButton = "Application.Logout.Action.Logout",
		reactivationButton = "Feature.AccountReactivation.Label.Reactivate"
	})
	
	return ReactModule.createElement(View, {
		tag = "flex-between size-full-0 auto-y col gap-small padding-x-xxlarge"
	}, {
		ReactivationButton = ReactModule.createElement(Button, {
			LayoutOrder = 1,
			text = UseLocalizationResult.reactivationButton,
			onActivated = UseCallbackResult,
			variant = ButtonVariant.Emphasis,
			size = InputSize.Medium,
			width = UDim.new(1, 0),
			isLoading = UseStateResult
		}),
		LogoutButton = ReactModule.createElement(Button, {
			LayoutOrder = 2,
			text = UseLocalizationResult.logoutButton,
			onActivated = UseLogoutModuleResult,
			variant = ButtonVariant.Standard,
			size = InputSize.Medium,
			width = UDim.new(1, 0),
			isLoading = UseStateResult1
		})
	})
end)