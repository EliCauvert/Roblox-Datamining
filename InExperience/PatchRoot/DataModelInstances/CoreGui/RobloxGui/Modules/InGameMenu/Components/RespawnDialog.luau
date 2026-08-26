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

return roactRodux.UNSTABLE_connect2(function(p1, _)
	return {
		isRespawning = p1.respawn.dialogOpen,
		inputType = p1.displayOptions.inputType
	}
end, function(p1)
	-- upvalues: setRespawningModule (ref), sendAnalyticsModule (ref), constantsModule (ref), respawnPlayerModule (ref)
	return {
		onCancel = function()
			-- upvalues: p1 (ref), setRespawningModule (copy), sendAnalyticsModule (copy), constantsModule (copy)
			p1(setRespawningModule(false))
			sendAnalyticsModule(constantsModule.AnalyticsInGameMenuName, constantsModule.AnalyticsRespawnCharacterName, { confirmed = constantsModule.AnalyticsCancelledName })
		end,
		onConfirm = function()
			-- upvalues: p1 (ref), respawnPlayerModule (copy)
			p1(respawnPlayerModule)
		end
	}
end)(function(p1)
	-- upvalues: roact (ref), IGMRespawnControllerBarModule (ref), withLocalizationModule (ref), confirmationDialogModule (ref)
	local function _()
		-- upvalues: roact (copy), IGMRespawnControllerBarModule (copy), p1 (ref)
		return roact.createElement(IGMRespawnControllerBarModule, { inputType = p1.inputType })
	end
	
	return withLocalizationModule({
		titleText = "CoreScripts.InGameMenu.RespawnCharacterDialogTitle",
		bodyText = "CoreScripts.InGameMenu.RespawnCharacterDialogBody",
		confirmText = "CoreScripts.InGameMenu.RespawnCharacterDialogConfirm",
		cancelText = "CoreScripts.InGameMenu.Cancel"
	})(function(p2)
		-- upvalues: roact (copy), p1 (ref), IGMRespawnControllerBarModule (copy), confirmationDialogModule (copy)
		return roact.createFragment({
			RespawnDialogControllerBar = p1.isRespawning and roact.createElement(IGMRespawnControllerBarModule, { inputType = p1.inputType }) or nil,
			ConfirmationDialog = roact.createElement(confirmationDialogModule, {
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