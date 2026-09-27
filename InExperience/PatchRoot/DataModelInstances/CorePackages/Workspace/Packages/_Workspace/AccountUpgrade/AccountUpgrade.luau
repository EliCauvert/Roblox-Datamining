return {
	AccountUpgradeAppShellFlow = require(script.AppShell.AccountUpgradeAppShellFlow),
	AccountUpgradeField = require(script.AccountUpgradeField),
	AccountUpgradeError = require(script.AccountUpgradeError),
	AccountUpgradeFlow = require(script.AccountUpgradeFlow),
	Components = require(script.Components),
	Eligibility = require(script.Eligibility),
	FlowSpec = require(script.FlowSpec),
	Hooks = require(script.Hooks),
	InExperienceController = require(script.InExperience.InExperienceController),
	Utils = require(script.Utils),
	SuccessModal = require(script.SuccessModal),
	["jest.config"] = script["jest.config"]
}