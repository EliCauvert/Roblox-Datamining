local v1 = script
local FFlagAmpV2WizardSharedLauncherModule = require(v1.FFlagAmpV2WizardSharedLauncher)

return {
	useAmpUpsell = require(v1.useAmpUpsell),
	useAmpUpsellLauncher = require(v1.useAmpUpsellLauncher),
	launchAmpUpsell = if FFlagAmpV2WizardSharedLauncherModule then require(v1.launchAmpUpsell) else nil,
	FFlagAmpV2WizardSharedLauncher = FFlagAmpV2WizardSharedLauncherModule,
	FFlagAmpWizardV2VpcHandoff = require(v1.FFlagAmpWizardV2VpcHandoff),
	FFlagAmpV2WizardTerminalOutcome = require(v1.FFlagAmpV2WizardTerminalOutcome),
	getOdpCheckpointDeepLinkRoute = require(v1.getOdpCheckpointDeepLinkRoute),
	openOdpFlowHandoff = require(v1.openOdpFlowHandoff),
	getAmpV2WizardRoutes = require(v1.getAmpV2WizardRoutes),
	getParentModeChromeThemeStore = require(v1.getParentModeChromeThemeStore),
	Types = require(v1.Types),
	["jest.config"] = script["jest.config"]
}