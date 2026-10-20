local AccountLockModal = script:FindFirstAncestor("AccountLockModal")
local AccountLockModalTitleModule = require(AccountLockModal.Components.AccountLockModalTitle)
local AccountLockModalContentModule = require(AccountLockModal.Components.AccountLockModalContent)
local AccountLockModalFooterModule = require(AccountLockModal.Components.AccountLockModalFooter)
local AccountLockContextModule = require(AccountLockModal.Contexts.AccountLockContext)
local Parent = AccountLockModal.Parent
local ReactModule = require(Parent.React)
local UseEffectFunction = ReactModule.useEffect
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local AppLogging = require(Parent.RoactServiceTags).AppLogging
local FoundationModule = require(Parent.Foundation)
local Dialog = FoundationModule.Dialog
local DialogSize = FoundationModule.Enums.DialogSize
local View = FoundationModule.View

return ReactModule.memo(function(p1)
	-- upvalues: UseRoactServiceFunction (copy), AppLogging (copy), AccountLockModal (copy), UseEffectFunction (copy), ReactModule (copy), AccountLockContextModule (copy), Dialog (copy), DialogSize (copy), AccountLockModalTitleModule (copy), View (copy), AccountLockModalContentModule (copy), AccountLockModalFooterModule (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(AppLogging)
	local AccountLockClientEventModule = require(AccountLockModal.Common.AccountLockClientEvent)
	local AccountLockEventContextEnum = require(AccountLockModal.Common.Enums).AccountLockEventContextEnum
	UseEffectFunction(function()
		-- upvalues: UseRoactServiceResult (copy), AccountLockClientEventModule (copy), AccountLockEventContextEnum (copy)
		UseRoactServiceResult:logRobloxTelemetryEvent(AccountLockClientEventModule, {}, { context = AccountLockEventContextEnum.Init })
	end, nil)
	
	return ReactModule.createElement(AccountLockContextModule.Provider, {}, {
		children = ReactModule.createElement(Dialog.Root, { size = DialogSize.Medium }, {
			DialogTitle = ReactModule.createElement(AccountLockModalTitleModule, {}),
			DialogContent = ReactModule.createElement(Dialog.Content, nil, {
				DialogView = ReactModule.createElement(View, { tag = "col fill auto-xy items-start gap-medium" }, {
					DialogContentText = ReactModule.createElement(AccountLockModalContentModule, {}),
					DialogFooter = ReactModule.createElement(AccountLockModalFooterModule, {
						Logout = p1.Logout,
						ResetNavigationHistory = p1.ResetNavigationHistory,
						ApiFetchAccessStatus = p1.ApiFetchAccessStatus,
						ChallengeError = p1.ChallengeError,
						closeCentralOverlayThunk = p1.closeCentralOverlayThunk
					})
				})
			})
		})
	})
end)