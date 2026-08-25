local runService = game:GetService("RunService")
local corePackagesService = game:GetService("CorePackages")
local linkingProtocol = require(corePackagesService.Workspace.Packages.LinkingProtocol).LinkingProtocol
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local roactRodux = inGameMenuDependenciesModule.RoactRodux
local t = inGameMenuDependenciesModule.t
local leavePromptModule = require(script.Parent.LeavePrompt)
local parent = script.Parent.Parent.Parent.Parent
local withLocalizationModule = require(parent.Localization.withLocalization)
local closeMenuModule = require(parent.Thunks.CloseMenu)
local sendAnalyticsModule = require(parent.Utility.SendAnalytics)
local constantsModule = require(parent.Resources.Constants)
local leaveToAppPrompt = roact.PureComponent:extend("LeaveToAppPrompt")
leaveToAppPrompt.validateProps = t.strictInterface({
	closeMenu = t.callback,
	canGamepadCaptureFocus = t.optional(t.boolean),
	canKeyboardCaptureFocus = t.optional(t.boolean),
	onConfirm = t.optional(t.callback),
	linkingProtocol = t.table
})
leaveToAppPrompt.defaultProps = { linkingProtocol = linkingProtocol.default }

function leaveToAppPrompt.init(p0)
	-- upvalues: sendAnalyticsModule (ref), constantsModule (ref), runService (ref)
	function p0.goToHomePage()
		-- upvalues: sendAnalyticsModule (copy), constantsModule (copy), runService (copy), p0 (ref)
		sendAnalyticsModule(constantsModule.AnalyticsLeaveToHomeName, constantsModule.AnalyticsLeaveToHomeName, { confirmed = constantsModule.AnalyticsLeaveToHomeName })
		runService.Heartbeat:Wait()
		p0.props.linkingProtocol:detectURL("roblox://navigation/home")
		game:Shutdown()
	end
end

function leaveToAppPrompt.render(p1)
	-- upvalues: withLocalizationModule (ref), roact (ref), leavePromptModule (ref)
	return withLocalizationModule({
		titleText = "CoreScripts.InGameMenu.Prompt.LeaveGameTitle",
		bodyText = "CoreScripts.InGameMenu.Prompt.LeaveGameBodyText",
		confirmText = "CoreScripts.InGameMenu.Prompt.BackToHome",
		cancelText = "CoreScripts.InGameMenu.Prompt.ResumeGame"
	})(function(p2)
		-- upvalues: roact (copy), leavePromptModule (copy), p1 (ref)
		return roact.createElement(leavePromptModule, {
			titleText = p2.titleText,
			bodyText = p2.bodyText,
			confirmText = p2.confirmText,
			cancelText = p2.cancelText,
			onConfirm = p1.props.onConfirm or p1.goToHomePage,
			onCancel = p1.props.closeMenu,
			canGamepadCaptureFocus = p1.props.canGamepadCaptureFocus,
			canKeyboardCaptureFocus = p1.props.canKeyboardCaptureFocus
		})
	end)
end

return roactRodux.UNSTABLE_connect2(function(p3, _)
	-- upvalues: constantsModule (ref)
	return {
		canGamepadCaptureFocus = p3.menuPage == constantsModule.LeaveToAppPromptPageKey and (p3.displayOptions.inputType == constantsModule.InputType.Gamepad and (not p3.respawn.dialogOpen and p3.currentZone == 1)),
		canKeyboardCaptureFocus = p3.menuPage == constantsModule.LeaveToAppPromptPageKey and (p3.displayOptions.inputType == constantsModule.InputType.MouseAndKeyboard and not p3.respawn.dialogOpen)
	}
end, function(p4)
	-- upvalues: closeMenuModule (ref)
	return {
		closeMenu = function()
			-- upvalues: p4 (ref), closeMenuModule (copy)
			p4(closeMenuModule)
		end
	}
end)(leaveToAppPrompt)