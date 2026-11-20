local OpenAccountSettingsModule = require(script.openAccountSettings)

return {
	["jest.config"] = script["jest.config"],
	Page = require(script.AccountSettingsPage),
	openAccountSettings = OpenAccountSettingsModule,
	QrDialogHost = function(p1)
		return require(script.QrDialogHost)(p1)
	end,
	registerLeaveRobloxConfirmation = require(script.LeaveRobloxConfirmation).register,
	registerAccountSettingsEntryPointsActions = function()
		require(script.Sdui.registerAccountSettingsEntryPointsActions)()
	end,
	Demo = {
		openAccountSettingsQrCode = function(p1, p2)
			-- upvalues: OpenAccountSettingsModule (copy)
			OpenAccountSettingsModule(p1, p2, { internal = { presentation = "QrCode" } })
		end,
		openAccountSettingsExternalBrowser = function(p1, p2)
			-- upvalues: OpenAccountSettingsModule (copy)
			OpenAccountSettingsModule(p1, p2, { internal = { presentation = "ExternalBrowser" } })
		end
	}
}