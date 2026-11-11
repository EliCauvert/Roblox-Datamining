local AccountLockModal = script:FindFirstAncestor("AccountLockModal")
local Parent = AccountLockModal.Parent
local Players = game:GetService("Players")
local GetFIntAccountUnlockDelayMsModule = require(AccountLockModal.Flags.GetFIntAccountUnlockDelayMs)
local UnlockAccountModule = require(AccountLockModal.Utils.unlockAccount)
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FFlagAccountLockReceiverClosesModal = require(Parent.SharedFlags).FFlagAccountLockReceiverClosesModal
local FFlagShowAccountUnlockMismatchDialog = require(Parent.SharedFlags).FFlagShowAccountUnlockMismatchDialog
local FFlagAccountUnlockAllowMissingUserId = require(Parent.SharedFlags).FFlagAccountUnlockAllowMissingUserId
local GetFFlagEnhancedPersonaLivenessEventsFunction = require(Parent.SharedFlags).GetFFlagEnhancedPersonaLivenessEvents
local FoundationModule = require(Parent.Foundation)
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local Dialog = FoundationModule.Dialog
local DialogSize = FoundationModule.Enums.DialogSize
local FillBehavior = FoundationModule.Enums.FillBehavior
local IconSize = FoundationModule.Enums.IconSize
local InputSize = FoundationModule.Enums.InputSize
local Loading = FoundationModule.Loading
local View = FoundationModule.View
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local AppLogging = require(Parent.RoactServiceTags).AppLogging
local AppPage = require(Parent.RobloxAppEnums).AppPage
local AccountLockClientEventModule = require(AccountLockModal.Common.AccountLockClientEvent)
local AccountLockEventContextEnum = require(AccountLockModal.Common.Enums).AccountLockEventContextEnum

local function defaultGetLocalUserId()
	-- upvalues: Players (copy)
	local LocalPlayer = Players.LocalPlayer
	
	return if LocalPlayer then LocalPlayer.UserId else nil
end

local function routeHome(p1, Callback: (any) -> ())
	-- upvalues: AppPage (copy)
	Callback(p1.ResetNavigationHistory({ { name = AppPage.Home } }))
end

local function _(p1, Callback): boolean
	if p1 then
		local CallbackResult = Callback()
		
		return if CallbackResult and CallbackResult ~= 0 then tostring(CallbackResult) == p1 else false
	else
		return false
	end
end

local function AccountMismatchDialog(p1)
	-- upvalues: ReactModule (copy), UseLocalizationFunction (copy), Dialog (copy), DialogSize (copy), View (copy), Button (copy), ButtonVariant (copy), InputSize (copy), FillBehavior (copy)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		p1.onDismiss()
	end, { p1.onDismiss })
	local UseLocalizationResult = UseLocalizationFunction({
		title = "Feature.AccountLock.Title.WrongAccount",
		body = "Feature.AccountLock.Content.AccountMismatchDialog",
		okButton = "Feature.AccountLock.Action.Ok"
	})
	
	return ReactModule.createElement(Dialog.Root, {
		hasBackdrop = true,
		disablePortal = false,
		size = DialogSize.Medium
	}, {
		DialogTitle = ReactModule.createElement(Dialog.Title, { text = UseLocalizationResult.title }),
		DialogContent = ReactModule.createElement(Dialog.Content, nil, {
			DialogView = ReactModule.createElement(View, { tag = "col items-start fill gap-medium auto-xy" }, {
				BodyText = ReactModule.createElement(Dialog.Text, { LayoutOrder = 1, Text = UseLocalizationResult.body }),
				Footer = ReactModule.createElement(View, {
					tag = "row gap-small size-full-0 auto-y",
					LayoutOrder = 2
				}, {
					OkButton = ReactModule.createElement(Button, {
						LayoutOrder = 1,
						text = UseLocalizationResult.okButton,
						onActivated = UseResult,
						variant = ButtonVariant.Emphasis,
						size = InputSize.Medium,
						fillBehavior = FillBehavior.Fill
					})
				})
			})
		})
	})
end

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), AppLogging (copy), ReactModule (copy), GetFFlagEnhancedPersonaLivenessEventsFunction (copy), AccountLockClientEventModule (copy), AccountLockEventContextEnum (copy), defaultGetLocalUserId (copy), FFlagAccountUnlockAllowMissingUserId (copy), FFlagShowAccountUnlockMismatchDialog (copy), routeHome (copy), UnlockAccountModule (copy), GetFIntAccountUnlockDelayMsModule (copy), FFlagAccountLockReceiverClosesModal (copy), AppPage (copy), AccountMismatchDialog (copy), Loading (copy), IconSize (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AppLogging)
	local Pending, Pending2 = ReactModule.useState("Pending")
	ReactModule.useEffect(function()
		-- upvalues: GetFFlagEnhancedPersonaLivenessEventsFunction (upval), UseRoactServiceResult1 (copy), AccountLockClientEventModule (upval), AccountLockEventContextEnum (upval)
		if GetFFlagEnhancedPersonaLivenessEventsFunction() then
			UseRoactServiceResult1:logRobloxTelemetryEvent(AccountLockClientEventModule, {}, { context = AccountLockEventContextEnum.DeepLinkReceived })
			
			return
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), defaultGetLocalUserId (upval), FFlagAccountUnlockAllowMissingUserId (upval), GetFFlagEnhancedPersonaLivenessEventsFunction (upval), UseRoactServiceResult1 (copy), AccountLockClientEventModule (upval), AccountLockEventContextEnum (upval), FFlagShowAccountUnlockMismatchDialog (upval), Pending2 (copy), routeHome (upval), UseDispatchResult (copy), UnlockAccountModule (upval), UseRoactServiceResult (copy), GetFIntAccountUnlockDelayMsModule (upval), FFlagAccountLockReceiverClosesModal (upval), AppPage (upval)
		local GetLocalUserId = p1.getLocalUserId or defaultGetLocalUserId
		
		if not FFlagAccountUnlockAllowMissingUserId or p1.targetUserId and p1.targetUserId ~= "" then
			local TargetUserId = p1.targetUserId
			local IsTextMatch = nil
			
			if TargetUserId then
				local LocalUserId = GetLocalUserId()
				IsTextMatch = if LocalUserId and LocalUserId ~= 0 then tostring(LocalUserId) == TargetUserId else false
			else
				IsTextMatch = false
			end
			if not IsTextMatch then
				if GetFFlagEnhancedPersonaLivenessEventsFunction() then
					UseRoactServiceResult1:logRobloxTelemetryEvent(AccountLockClientEventModule, {}, { context = AccountLockEventContextEnum.DeepLinkMismatch })
				end
				if FFlagShowAccountUnlockMismatchDialog then
					Pending2("WrongUser")
					
					return
				else
					routeHome(p1, UseDispatchResult)
					Pending2("Done")
					
					return
				end
			end
		end
		UnlockAccountModule(UseRoactServiceResult):andThen(function()
			-- upvalues: GetFIntAccountUnlockDelayMsModule (upval), UseDispatchResult (upval), p1 (upval), UseRoactServiceResult (upval)
			task.wait(GetFIntAccountUnlockDelayMsModule() / 1000)
			
			return UseDispatchResult(p1.ApiFetchAccessStatus(UseRoactServiceResult)):catch(function() end)
		end):andThen(function()
			-- upvalues: FFlagAccountLockReceiverClosesModal (upval), UseDispatchResult (upval), p1 (upval), AppPage (upval), Pending2 (upval)
			if not FFlagAccountLockReceiverClosesModal then
				UseDispatchResult(p1.closeCentralOverlayThunk())
			end
			UseDispatchResult(p1.ResetNavigationHistory({ { name = AppPage.Home } }))
			Pending2("Done")
		end):catch(function()
			-- upvalues: routeHome (upval), p1 (upval), UseDispatchResult (upval), Pending2 (upval)
			routeHome(p1, UseDispatchResult)
			Pending2("Done")
		end)
	end, {})
	
	return if Pending == "WrongUser" then ReactModule.createElement(AccountMismatchDialog, {
		onDismiss = function()
			-- upvalues: routeHome (upval), p1 (copy), UseDispatchResult (copy), Pending2 (copy)
			routeHome(p1, UseDispatchResult)
			Pending2("Done")
		end
	}) elseif Pending == "Done" then nil else ReactModule.createElement(Loading, {
		size = IconSize.Medium,
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5)
	})
end