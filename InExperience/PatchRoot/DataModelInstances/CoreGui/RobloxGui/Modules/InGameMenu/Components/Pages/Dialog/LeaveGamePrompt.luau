local RunService = game:GetService("RunService")
local CorePackages = game:GetService("CorePackages")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local RoactRodux = InGameMenuDependenciesModule.RoactRodux
local T = InGameMenuDependenciesModule.t
local LeavePromptModule = require(script.Parent.LeavePrompt)
local Parent = script.Parent.Parent.Parent.Parent
local WithLocalizationModule = require(Parent.Localization.withLocalization)
local ConstantsModule = require(Parent.Resources.Constants)
local CloseMenuModule = require(Parent.Thunks.CloseMenu)
local SendAnalyticsModule = require(Parent.Utility.SendAnalytics)
local GetDefaultQualityLevelFunction = require(CorePackages.Workspace.Packages.AppCommonLib).GetDefaultQualityLevel
local GetFFlagEnableVRFTUXExperienceModule = require(RobloxGui.Modules.FTUX.Flags.GetFFlagEnableVRFTUXExperience)
local IsFTUXExperienceModule = require(RobloxGui.Modules.FTUX.Utility.IsFTUXExperience)
local PlatformEnumModule = require(RobloxGui.Modules.FTUX.Enums.PlatformEnum)
local LeaveGamePrompt = Roact.PureComponent:extend("LeaveGamePrompt")
LeaveGamePrompt.validateProps = T.strictInterface({
	closeMenu = T.callback,
	canGamepadCaptureFocus = T.optional(T.boolean),
	canKeyboardCaptureFocus = T.optional(T.boolean),
	onConfirm = T.optional(T.callback)
})

function LeaveGamePrompt.init(p1)
	-- upvalues: SendAnalyticsModule (copy), ConstantsModule (copy), RunService (copy), GetDefaultQualityLevelFunction (copy)
	function p1.leaveGameConfirm()
		-- upvalues: SendAnalyticsModule (upval), ConstantsModule (upval), RunService (upval), GetDefaultQualityLevelFunction (upval)
		SendAnalyticsModule(ConstantsModule.AnalyticsInGameMenuName, ConstantsModule.AnalyticsLeaveGameName, { confirmed = ConstantsModule.AnalyticsConfirmedName })
		RunService.Heartbeat:Wait()
		game:Shutdown()
		settings().Rendering.QualityLevel = GetDefaultQualityLevelFunction()
	end
end

function LeaveGamePrompt.render(p1)
	-- upvalues: WithLocalizationModule (copy), GetFFlagEnableVRFTUXExperienceModule (copy), IsFTUXExperienceModule (copy), PlatformEnumModule (copy), Roact (copy), LeavePromptModule (copy)
	return WithLocalizationModule({
		titleText = "CoreScripts.InGameMenu.Prompt.LeaveGameTitle",
		confirmText = "CoreScripts.InGameMenu.Prompt.LeaveGame",
		cancelText = "CoreScripts.InGameMenu.Prompt.ResumeGame",
		bodyText = if GetFFlagEnableVRFTUXExperienceModule() and IsFTUXExperienceModule(PlatformEnumModule.QuestVR) then "CoreScripts.InGameMenu.Prompt.VRFTUXLeaveGameBodyText" else "CoreScripts.InGameMenu.Prompt.LeaveGameBodyText"
	})(function(p2)
		-- upvalues: Roact (upval), LeavePromptModule (upval), p1 (copy)
		return Roact.createElement(LeavePromptModule, {
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

return RoactRodux.UNSTABLE_connect2(function(p1, _)
	-- upvalues: ConstantsModule (copy)
	return {
		canGamepadCaptureFocus = p1.menuPage == ConstantsModule.LeaveGamePromptPageKey and p1.displayOptions.inputType == ConstantsModule.InputType.Gamepad and (not p1.respawn.dialogOpen and p1.currentZone == 1),
		canKeyboardCaptureFocus = p1.menuPage == ConstantsModule.LeaveGamePromptPageKey and p1.displayOptions.inputType == ConstantsModule.InputType.MouseAndKeyboard and not p1.respawn.dialogOpen
	}
end, function(Callback)
	-- upvalues: CloseMenuModule (copy), SendAnalyticsModule (copy), ConstantsModule (copy)
	return {
		closeMenu = function()
			-- upvalues: Callback (copy), CloseMenuModule (upval), SendAnalyticsModule (upval), ConstantsModule (upval)
			Callback(CloseMenuModule)
			SendAnalyticsModule(ConstantsModule.AnalyticsInGameMenuName, ConstantsModule.AnalyticsLeaveGameName, { confirmed = ConstantsModule.AnalyticsCancelledName })
		end
	}
end)(LeaveGamePrompt)