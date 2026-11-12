local OpenAccountSettingsModule = require(script.openAccountSettings)

return {
	["jest.config"] = script["jest.config"],
	Page = require(script.AccountSettingsPage),
	openAccountSettings = OpenAccountSettingsModule,
	registerAccountSettingsEntryPointsActions = function()
		require(script.Sdui.registerAccountSettingsEntryPointsActions)()
	end,
	Demo = {
		openAccountSettingsQrCode = function(p1, p2)
			-- upvalues: OpenAccountSettingsModule (copy)
			OpenAccountSettingsModule(p1, p2, { internal = { presentation = "QrCode" } })
		end
	}
}