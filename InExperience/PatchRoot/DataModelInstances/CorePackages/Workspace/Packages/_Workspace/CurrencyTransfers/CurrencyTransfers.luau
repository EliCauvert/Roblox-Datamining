return {
	TransferRobuxFlow = require(script.Flows.TransferRobuxFlow),
	InExperienceTransferFlow = require(script.Flows.InExperienceTransferFlow),
	renderInExperienceTransferApp = function() --[[ line: 16 ]]
		require(script.renderInExperienceTransferApp)()
	end,
	Enums = {
		TransferDirection = require(script.Enums.TransferDirection),
		TransferOrigination = require(script.Enums.TransferOrigination)
	},
	GetFFlagCurrencyTransferUseRoactNetworking = require(script.Flags.GetFFlagCurrencyTransferUseRoactNetworking),
	["jest.config"] = script["jest.config"]
}