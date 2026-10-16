local RunService = game:GetService("RunService")
local CorePackages = game:GetService("CorePackages")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local T = InGameMenuDependenciesModule.t
local Parent = script.Parent.Parent
local WithLocalizationModule = require(Parent.Localization.withLocalization)
local CancelLeavingGameModule = require(Parent.Actions.CancelLeavingGame)
local GlobalConfigModule = require(Parent.GlobalConfig)
local ConfirmationDialogModule = require(script.Parent.ConfirmationDialog)
local ConstantsModule = require(Parent.Resources.Constants)
local SendAnalyticsModule = require(Parent.Utility.SendAnalytics)
local GetDefaultQualityLevelFunction = require(CorePackages.Workspace.Packages.AppCommonLib).GetDefaultQualityLevel
local StrictInterfaceResult = T.strictInterface({
	isLeavingGame = T.boolean,
	onCancel = T.callback,
	sendAnalytics = T.callback
})

return InGameMenuDependenciesModule.RoactRodux.UNSTABLE_connect2(function(p1, _) --[[ Line: 69 ]]
	return { isLeavingGame = p1.leavingGame }
end, function(Callback) --[[ Line: 73 ]]
	-- upvalues: CancelLeavingGameModule (copy), SendAnalyticsModule (copy), ConstantsModule (copy)
	return {
		onCancel = function() --[[ Line: 75 ]]
			-- upvalues: Callback (copy), CancelLeavingGameModule (upval), SendAnalyticsModule (upval), ConstantsModule (upval)
			Callback(CancelLeavingGameModule())
			SendAnalyticsModule(ConstantsModule.AnalyticsInGameMenuName, ConstantsModule.AnalyticsLeaveGameName, { confirmed = ConstantsModule.AnalyticsCancelledName })
		end
	}
end)(function(p1) --[[ Line: 31 | Named "LeaveGameDialog" ]]
	-- upvalues: GlobalConfigModule (copy), StrictInterfaceResult (copy), WithLocalizationModule (copy), Roact (copy), ConfirmationDialogModule (copy), SendAnalyticsModule (copy), ConstantsModule (copy), RunService (copy), GetDefaultQualityLevelFunction (copy)
	if GlobalConfigModule.propValidation then
		assert(StrictInterfaceResult(p1))
	end
	return WithLocalizationModule({
		bodyText = "CoreScripts.InGameMenu.ConfirmLeaveGame",
		confirmText = "CoreScripts.InGameMenu.Leave",
		titleText = "CoreScripts.InGameMenu.LeaveGameQuestion",
		cancelText = "CoreScripts.InGameMenu.Cancel"
	})(function(p2) --[[ Line: 41 ]]
		-- upvalues: Roact (upval), ConfirmationDialogModule (upval), p1 (copy), SendAnalyticsModule (upval), ConstantsModule (upval), RunService (upval), GetDefaultQualityLevelFunction (upval)
		return Roact.createElement(ConfirmationDialogModule, {
			bindReturnToConfirm = true,
			blurBackground = true,
			bodyText = p2.bodyText,
			confirmText = p2.confirmText,
			titleText = p2.titleText,
			cancelText = p2.cancelText,
			onCancel = p1.onCancel,
			onConfirm = function() --[[ Line: 51 ]]
				-- upvalues: SendAnalyticsModule (upval), ConstantsModule (upval), RunService (upval), GetDefaultQualityLevelFunction (upval)
				SendAnalyticsModule(ConstantsModule.AnalyticsInGameMenuName, ConstantsModule.AnalyticsLeaveGameName, { confirmed = ConstantsModule.AnalyticsConfirmedName })
				RunService.Heartbeat:Wait()
				game:Shutdown()
				settings().Rendering.QualityLevel = GetDefaultQualityLevelFunction()
			end,
			visible = p1.isLeavingGame
		})
	end)
end)