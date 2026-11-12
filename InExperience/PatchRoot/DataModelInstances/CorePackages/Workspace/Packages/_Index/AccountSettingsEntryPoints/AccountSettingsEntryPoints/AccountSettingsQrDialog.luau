local Parent = script.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local QRCodeDisplayModule = require(Parent1.QRCodeDisplay)
local AccountSettingsPageModule = require(Parent.AccountSettingsPage)
local TranslateModule = require(Parent.translate)
local Dialog = FoundationModule.Dialog
local View = FoundationModule.View

return function(p1)
	-- upvalues: AccountSettingsPageModule (copy), ReactModule (copy), Dialog (copy), View (copy), TranslateModule (copy), QRCodeDisplayModule (copy)
	return ReactModule.createElement(Dialog.Root, {
		hasBackdrop = true,
		disablePortal = false,
		testId = "--account-settings-qr-dialog",
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