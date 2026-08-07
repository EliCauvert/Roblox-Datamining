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
local var9 = t.strictInterface({
	isLeavingGame = t.boolean,
	onCancel = t.callback,
	sendAnalytics = t.callback
})

return roactRodux.UNSTABLE_connect2(function(p2, _) --[[ line: 69 ]]
	return { isLeavingGame = p2.leavingGame }
end, function(p3) --[[ line: 73 ]]
	-- upvalues: cancelLeavingGameModule (ref), sendAnalyticsModule (ref), constantsModule (ref)
	return {
		onCancel = function() --[[ line: 75 ]]
			-- upvalues: p3 (ref), cancelLeavingGameModule (copy), sendAnalyticsModule (copy), constantsModule (copy)
			p3(cancelLeavingGameModule())
			sendAnalyticsModule(constantsModule.AnalyticsInGameMenuName, constantsModule.AnalyticsLeaveGameName, { confirmed = constantsModule.AnalyticsCancelledName })
		end
	}
end)(function(p0) --[[ line: 31 | named "LeaveGameDialog" ]]
	-- upvalues: globalConfigModule (ref), var9 (ref), withLocalizationModule (ref), roact (ref), confirmationDialogModule (ref), sendAnalyticsModule (ref), constantsModule (ref), runService (ref), getDefaultQualityLevel (ref)
	if globalConfigModule.propValidation then
		assert(var9(p0))
	end
	return withLocalizationModule({
		bodyText = "CoreScripts.InGameMenu.ConfirmLeaveGame",
		confirmText = "CoreScripts.InGameMenu.Leave",
		titleText = "CoreScripts.InGameMenu.LeaveGameQuestion",
		cancelText = "CoreScripts.InGameMenu.Cancel"
	})(function(p1) --[[ line: 41 ]]
		-- upvalues: roact (copy), confirmationDialogModule (copy), p0 (ref), sendAnalyticsModule (copy), constantsModule (copy), runService (copy), getDefaultQualityLevel (copy)
		return roact.createElement(confirmationDialogModule, {
			bindReturnToConfirm = true,
			blurBackground = true,
			bodyText = p1.bodyText,
			confirmText = p1.confirmText,
			titleText = p1.titleText,
			cancelText = p1.cancelText,
			onCancel = p0.onCancel,
			onConfirm = function() --[[ line: 51 ]]
				-- upvalues: sendAnalyticsModule (copy), constantsModule (copy), runService (copy), getDefaultQualityLevel (copy)
				sendAnalyticsModule(constantsModule.AnalyticsInGameMenuName, constantsModule.AnalyticsLeaveGameName, { confirmed = constantsModule.AnalyticsConfirmedName })
				runService.Heartbeat:Wait()
				game:Shutdown()
				settings().Rendering.QualityLevel = getDefaultQualityLevel()
			end,
			visible = p0.isLeavingGame
		})
	end)
end)