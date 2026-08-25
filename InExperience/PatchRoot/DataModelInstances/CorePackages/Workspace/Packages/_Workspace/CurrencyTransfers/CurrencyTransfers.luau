return {
	TransferRobuxFlow = require(script.Flows.TransferRobuxFlow),
	InExperienceTransferFlow = require(script.Flows.InExperienceTransferFlow),
	renderInExperienceTransferApp = function()
		require(script.renderInExperienceTransferApp)()
	end,
	Enums = {
		TransferDirection = require(script.Enums.TransferDirection),
		TransferOrigination = require(script.Enums.TransferOrigination)
	},
	GetFFlagCurrencyTransferUseRoactNetworking = require(script.Flags.GetFFlagCurrencyTransferUseRoactNetworking),
	IncomingTransferHomepagePromptDismiss = {
		createCallbacks = function(p0)
			return require(script.Utils.IncomingTransferHomepagePromptDismiss).createCallbacks(p0)
		end
	},
	getSduiEconomyRegister = function()
		return require(script.System.SduiEconomyRegister)
	end,
	["jest.config"] = script["jest.config"]
}