local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local roactRodux = inGameMenuDependenciesModule.RoactRodux
local IGMRespawnControllerBarModule = require(script.Parent.IGMRespawnControllerBar)
local parent = script.Parent.Parent
local withLocalizationModule = require(parent.Localization.withLocalization)
local setRespawningModule = require(parent.Actions.SetRespawning)
local respawnPlayerModule = require(parent.Thunks.RespawnPlayer)
local confirmationDialogModule = require(script.Parent.ConfirmationDialog)
local sendAnalyticsModule = require(parent.Utility.SendAnalytics)
local constantsModule = require(parent.Resources.Constants)

return roactRodux.UNSTABLE_connect2(function(p2, _)
	return {
		isRespawning = p2.respawn.dialogOpen,
		inputType = p2.displayOptions.inputType
	}
end, function(p3)
	-- upvalues: setRespawningModule (ref), sendAnalyticsModule (ref), constantsModule (ref), respawnPlayerModule (ref)
	return {
		onCancel = function()
			-- upvalues: p3 (ref), setRespawningModule (copy), sendAnalyticsModule (copy), constantsModule (copy)
			p3(setRespawningModule(false))
			sendAnalyticsModule(constantsModule.AnalyticsInGameMenuName, constantsModule.AnalyticsRespawnCharacterName, { confirmed = constantsModule.AnalyticsCancelledName })
		end,
		onConfirm = function()
			-- upvalues: p3 (ref), respawnPlayerModule (copy)
			p3(respawnPlayerModule)
		end
	}
end)(function(p0)
	-- upvalues: roact (ref), IGMRespawnControllerBarModule (ref), withLocalizationModule (ref), confirmationDialogModule (ref)
	local function _()
		-- upvalues: roact (copy), IGMRespawnControllerBarModule (copy), p0 (ref)
		return roact.createElement(IGMRespawnControllerBarModule, { inputType = p0.inputType })
	end
	
	return withLocalizationModule({
		titleText = "CoreScripts.InGameMenu.RespawnCharacterDialogTitle",
		bodyText = "CoreScripts.InGameMenu.RespawnCharacterDialogBody",
		confirmText = "CoreScripts.InGameMenu.RespawnCharacterDialogConfirm",
		cancelText = "CoreScripts.InGameMenu.Cancel"
	})(function(p1)
		-- upvalues: roact (copy), p0 (ref), IGMRespawnControllerBarModule (copy), confirmationDialogModule (copy)
		return roact.createFragment({
			RespawnDialogControllerBar = p0.isRespawning and roact.createElement(IGMRespawnControllerBarModule, { inputType = p0.inputType }) or nil,
			ConfirmationDialog = roact.createElement(confirmationDialogModule, {
				bindReturnToConfirm = true,
				visible = p0.isRespawning,
				titleText = p1.titleText,
				bodyText = p1.bodyText,
				confirmText = p1.confirmText,
				cancelText = p1.cancelText,
				onCancel = p0.onCancel,
				onConfirm = p0.onConfirm,
				inputType = p0.inputType
			})
		})
	end)
end)