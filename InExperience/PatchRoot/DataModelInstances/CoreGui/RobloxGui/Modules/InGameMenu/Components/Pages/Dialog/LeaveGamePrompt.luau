local runService = game:GetService("RunService")
local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local roactRodux = inGameMenuDependenciesModule.RoactRodux
local t = inGameMenuDependenciesModule.t
local leavePromptModule = require(script.Parent.LeavePrompt)
local parent = script.Parent.Parent.Parent.Parent
local withLocalizationModule = require(parent.Localization.withLocalization)
local constantsModule = require(parent.Resources.Constants)
local closeMenuModule = require(parent.Thunks.CloseMenu)
local sendAnalyticsModule = require(parent.Utility.SendAnalytics)
local getDefaultQualityLevel = require(corePackagesService.Workspace.Packages.AppCommonLib).GetDefaultQualityLevel
local getFFlagEnableVRFTUXExperienceModule = require(robloxGui.Modules.FTUX.Flags.GetFFlagEnableVRFTUXExperience)
local isFTUXExperienceModule = require(robloxGui.Modules.FTUX.Utility.IsFTUXExperience)
local platformEnumModule = require(robloxGui.Modules.FTUX.Enums.PlatformEnum)
local leaveGamePrompt = roact.PureComponent:extend("LeaveGamePrompt")
leaveGamePrompt.validateProps = t.strictInterface({
	closeMenu = t.callback,
	canGamepadCaptureFocus = t.optional(t.boolean),
	canKeyboardCaptureFocus = t.optional(t.boolean),
	onConfirm = t.optional(t.callback)
})

function leaveGamePrompt.init(p1)
	-- upvalues: sendAnalyticsModule (ref), constantsModule (ref), runService (ref), getDefaultQualityLevel (ref)
	function p0.leaveGameConfirm()
		-- upvalues: sendAnalyticsModule (copy), constantsModule (copy), runService (copy), getDefaultQualityLevel (copy)
		sendAnalyticsModule(constantsModule.AnalyticsInGameMenuName, constantsModule.AnalyticsLeaveGameName, { confirmed = constantsModule.AnalyticsConfirmedName })
		runService.Heartbeat:Wait()
		game:Shutdown()
		settings().Rendering.QualityLevel = getDefaultQualityLevel()
	end
end

function leaveGamePrompt.render(p1)
	-- upvalues: withLocalizationModule (ref), getFFlagEnableVRFTUXExperienceModule (ref), isFTUXExperienceModule (ref), platformEnumModule (ref), roact (ref), leavePromptModule (ref)
	return withLocalizationModule({
		titleText = "CoreScripts.InGameMenu.Prompt.LeaveGameTitle",
		confirmText = "CoreScripts.InGameMenu.Prompt.LeaveGame",
		cancelText = "CoreScripts.InGameMenu.Prompt.ResumeGame",
		bodyText = if getFFlagEnableVRFTUXExperienceModule() and isFTUXExperienceModule(platformEnumModule.QuestVR) then "CoreScripts.InGameMenu.Prompt.VRFTUXLeaveGameBodyText" else "CoreScripts.InGameMenu.Prompt.LeaveGameBodyText"
	})(function(p2)
		-- upvalues: roact (copy), leavePromptModule (copy), p1 (ref)
		return roact.createElement(leavePromptModule, {
			titleText = p2.titleText,
			bodyText = p2.bodyText,
			confirmText = p2.confirmText,
			cancelText = p2.cancelText,
			onConfirm = p1.props.onConfirm or p1.leaveGameConfirm,
			onCancel = p1.props.closeMenu,
			canGamepadCaptureFocus = p1.props.canGamepadCaptureFocus,
			canKeyboardCaptureFocus = p1.props.canKeyboardCaptureFocus
		})
	end)
end

return roactRodux.UNSTABLE_connect2(function(p1, _)
	-- upvalues: constantsModule (ref)
	return {
		canGamepadCaptureFocus = p1.menuPage == constantsModule.LeaveGamePromptPageKey and (p1.displayOptions.inputType == constantsModule.InputType.Gamepad and (not p1.respawn.dialogOpen and p1.currentZone == 1)),
		canKeyboardCaptureFocus = p1.menuPage == constantsModule.LeaveGamePromptPageKey and (p1.displayOptions.inputType == constantsModule.InputType.MouseAndKeyboard and not p1.respawn.dialogOpen)
	}
end, function(p1)
	-- upvalues: closeMenuModule (ref), sendAnalyticsModule (ref), constantsModule (ref)
	return {
		closeMenu = function()
			-- upvalues: p1 (ref), closeMenuModule (copy), sendAnalyticsModule (copy), constantsModule (copy)
			p1(closeMenuModule)
			sendAnalyticsModule(constantsModule.AnalyticsInGameMenuName, constantsModule.AnalyticsLeaveGameName, { confirmed = constantsModule.AnalyticsCancelledName })
		end
	}
end)(leaveGamePrompt)