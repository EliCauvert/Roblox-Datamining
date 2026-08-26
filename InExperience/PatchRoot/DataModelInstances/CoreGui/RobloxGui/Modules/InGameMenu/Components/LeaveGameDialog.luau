local runService = game:GetService("RunService")
local corePackagesService = game:GetService("CorePackages")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local roactRodux = inGameMenuDependenciesModule.RoactRodux
local t = inGameMenuDependenciesModule.t
local parent = script.Parent.Parent
local withLocalizationModule = require(parent.Localization.withLocalization)
local cancelLeavingGameModule = require(parent.Actions.CancelLeavingGame)
local globalConfigModule = require(parent.GlobalConfig)
local confirmationDialogModule = require(script.Parent.ConfirmationDialog)
local constantsModule = require(parent.Resources.Constants)
local sendAnalyticsModule = require(parent.Utility.SendAnalytics)
local getDefaultQualityLevel = require(corePackagesService.Workspace.Packages.AppCommonLib).GetDefaultQualityLevel
local var1 = t.strictInterface({
	isLeavingGame = t.boolean,
	onCancel = t.callback,
	sendAnalytics = t.callback
})

return roactRodux.UNSTABLE_connect2(function(p1, _)
	return { isLeavingGame = p1.leavingGame }
end, function(p1)
	-- upvalues: cancelLeavingGameModule (ref), sendAnalyticsModule (ref), constantsModule (ref)
	return {
		onCancel = function()
			-- upvalues: p1 (ref), cancelLeavingGameModule (copy), sendAnalyticsModule (copy), constantsModule (copy)
			p1(cancelLeavingGameModule())
			sendAnalyticsModule(constantsModule.AnalyticsInGameMenuName, constantsModule.AnalyticsLeaveGameName, { confirmed = constantsModule.AnalyticsCancelledName })
		end
	}
end)(function(p1)
	-- upvalues: globalConfigModule (ref), var1 (ref), withLocalizationModule (ref), roact (ref), confirmationDialogModule (ref), sendAnalyticsModule (ref), constantsModule (ref), runService (ref), getDefaultQualityLevel (ref)
	if globalConfigModule.propValidation then
		assert(var1(p1))
	end
	return withLocalizationModule({
		bodyText = "CoreScripts.InGameMenu.ConfirmLeaveGame",
		confirmText = "CoreScripts.InGameMenu.Leave",
		titleText = "CoreScripts.InGameMenu.LeaveGameQuestion",
		cancelText = "CoreScripts.InGameMenu.Cancel"
	})(function(p2)
		-- upvalues: roact (copy), confirmationDialogModule (copy), p1 (ref), sendAnalyticsModule (copy), constantsModule (copy), runService (copy), getDefaultQualityLevel (copy)
		return roact.createElement(confirmationDialogModule, {
			bindReturnToConfirm = true,
			blurBackground = true,
			bodyText = p2.bodyText,
			confirmText = p2.confirmText,
			titleText = p2.titleText,
			cancelText = p2.cancelText,
			onCancel = p1.onCancel,
			onConfirm = function()
				-- upvalues: sendAnalyticsModule (copy), constantsModule (copy), runService (copy), getDefaultQualityLevel (copy)
				sendAnalyticsModule(constantsModule.AnalyticsInGameMenuName, constantsModule.AnalyticsLeaveGameName, { confirmed = constantsModule.AnalyticsConfirmedName })
				runService.Heartbeat:Wait()
				game:Shutdown()
				settings().Rendering.QualityLevel = getDefaultQualityLevel()
			end,
			visible = p1.isLeavingGame
		})
	end)
end)