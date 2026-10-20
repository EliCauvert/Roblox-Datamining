local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local IGMRespawnControllerBarModule = require(script.Parent.IGMRespawnControllerBar)
local Parent = script.Parent.Parent
local WithLocalizationModule = require(Parent.Localization.withLocalization)
local SetRespawningModule = require(Parent.Actions.SetRespawning)
local RespawnPlayerModule = require(Parent.Thunks.RespawnPlayer)
local ConfirmationDialogModule = require(script.Parent.ConfirmationDialog)
local SendAnalyticsModule = require(Parent.Utility.SendAnalytics)
local ConstantsModule = require(Parent.Resources.Constants)

return InGameMenuDependenciesModule.RoactRodux.UNSTABLE_connect2(function(p1, _)
	return {
		isRespawning = p1.respawn.dialogOpen,
		inputType = p1.displayOptions.inputType
	}
end, function(Callback)
	-- upvalues: SetRespawningModule (copy), SendAnalyticsModule (copy), ConstantsModule (copy), RespawnPlayerModule (copy)
	return {
		onCancel = function()
			-- upvalues: Callback (copy), SetRespawningModule (upval), SendAnalyticsModule (upval), ConstantsModule (upval)
			Callback(SetRespawningModule(false))
			SendAnalyticsModule(ConstantsModule.AnalyticsInGameMenuName, ConstantsModule.AnalyticsRespawnCharacterName, { confirmed = ConstantsModule.AnalyticsCancelledName })
		end,
		onConfirm = function()
			-- upvalues: Callback (copy), RespawnPlayerModule (upval)
			Callback(RespawnPlayerModule)
		end
	}
end)(function(p1)
	-- upvalues: Roact (copy), IGMRespawnControllerBarModule (copy), WithLocalizationModule (copy), ConfirmationDialogModule (copy)
	local function _()
		-- upvalues: Roact (upval), IGMRespawnControllerBarModule (upval), p1 (copy)
		return Roact.createElement(IGMRespawnControllerBarModule, { inputType = p1.inputType })
	end
	
	return WithLocalizationModule({
		titleText = "CoreScripts.InGameMenu.RespawnCharacterDialogTitle",
		bodyText = "CoreScripts.InGameMenu.RespawnCharacterDialogBody",
		confirmText = "CoreScripts.InGameMenu.RespawnCharacterDialogConfirm",
		cancelText = "CoreScripts.InGameMenu.Cancel"
	})(function(p2)
		-- upvalues: Roact (upval), p1 (copy), IGMRespawnControllerBarModule (upval), ConfirmationDialogModule (upval)
		return Roact.createFragment({
			RespawnDialogControllerBar = p1.isRespawning and Roact.createElement(IGMRespawnControllerBarModule, { inputType = p1.inputType }) or nil,
			ConfirmationDialog = Roact.createElement(ConfirmationDialogModule, {
				bindReturnToConfirm = true,
				visible = p1.isRespawning,
				titleText = p2.titleText,
				bodyText = p2.bodyText,
				confirmText = p2.confirmText,
				cancelText = p2.cancelText,
				onCancel = p1.onCancel,
				onConfirm = p1.onConfirm,
				inputType = p1.inputType
			})
		})
	end)
end)