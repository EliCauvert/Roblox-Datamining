local ContextActionService = game:GetService("ContextActionService")
local Parent = script.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local QRCodeDisplayModule = require(Parent1.QRCodeDisplay)
local FocusNavigationUtilsModule = require(Parent1.FocusNavigationUtils)
local InputHandlersModule = require(Parent1.InputHandlers)
local _ = require(Parent1.ReactFocusNavigation)
local FFlagAccountSettingsQrDialogFocusNavigation = require(Parent1.SharedFlags).FFlagAccountSettingsQrDialogFocusNavigation
local AccountSettingsPageModule = require(Parent.AccountSettingsPage)
local TranslateModule = require(Parent.translate)
local Dialog = FoundationModule.Dialog
local View = FoundationModule.View
local NavigateBack = FocusNavigationUtilsModule.FocusNavigationEventNameEnum.NavigateBack
local EventMap = {
	[Enum.KeyCode.ButtonB] = NavigateBack,
	[Enum.KeyCode.Escape] = NavigateBack
}
local NewValue = Enum.ContextActionPriority.High.Value + 1

local function useDialogFocusRoot(Callback)
	-- upvalues: ReactModule (copy), NavigateBack (copy), InputHandlersModule (copy), ContextActionService (copy), NewValue (copy), FocusNavigationUtilsModule (copy), EventMap (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: NavigateBack (upval), InputHandlersModule (upval), Callback (copy)
		return {
			[NavigateBack] = {
				handler = InputHandlersModule.onRelease(function(p1)
					-- upvalues: Callback (upval)
					Callback()
					p1:cancel()
				end)
			}
		}
	end, { Callback })
	ReactModule.useEffect(function()
		-- upvalues: ContextActionService (upval), NewValue (upval)
		ContextActionService:BindCoreActionAtPriority("AccountSettingsQrDialogSinkBack", function()
			return Enum.ContextActionResult.Sink
		end, false, NewValue, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape)
		
		return function()
			-- upvalues: ContextActionService (upval)
			ContextActionService:UnbindCoreAction("AccountSettingsQrDialogSinkBack")
		end
	end, {})
	
	return FocusNavigationUtilsModule.useFocusRoot({
		isAutoFocusRoot = true,
		surfaceIdentifier = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum.PopUp,
		eventMap = EventMap,
		eventHandlers = UseMemoResult
	})
end

return function(p1)
	-- upvalues: AccountSettingsPageModule (copy), FFlagAccountSettingsQrDialogFocusNavigation (copy), useDialogFocusRoot (copy), ReactModule (copy), Dialog (copy), View (copy), TranslateModule (copy), QRCodeDisplayModule (copy)
	return ReactModule.createElement(Dialog.Root, {
		hasBackdrop = true,
		disablePortal = false,
		testId = "--account-settings-qr-dialog",
		ref = if FFlagAccountSettingsQrDialogFocusNavigation then useDialogFocusRoot(p1.onClose) else nil,
		onClose = p1.onClose
	}, {
		DialogTitle = ReactModule.createElement(Dialog.Title, { text = AccountSettingsPageModule.getTitle(p1.page) }),
		DialogContent = ReactModule.createElement(Dialog.Content, { LayoutOrder = 1 }, {
			ContentView = ReactModule.createElement(View, { tag = "col size-full-0 auto-y gap-medium" }, {
				DialogText = ReactModule.createElement(Dialog.Text, {
					LayoutOrder = 1,
					Text = TranslateModule("Feature.Settings.Description.AccountSettingsWebsite")
				}),
				QRCodeContainer = ReactModule.createElement(View, {
					tag = "row size-full-0 auto-y align-x-center padding-y-large",
					LayoutOrder = 2
				}, {
					QRCode = ReactModule.createElement(QRCodeDisplayModule.DisplayQRCode, {
						sideLength = 240,
						ecLevel = QRCodeDisplayModule.ECLevels.EC_LEVEL_1,
						toEncode = AccountSettingsPageModule.getUrl(p1.page)
					})
				})
			})
		})
	})
end