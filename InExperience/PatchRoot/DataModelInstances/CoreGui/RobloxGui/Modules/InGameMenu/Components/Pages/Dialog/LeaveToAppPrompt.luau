local RunService = game:GetService("RunService")
local CorePackages = game:GetService("CorePackages")
local LinkingProtocolModule = require(CorePackages.Workspace.Packages.LinkingProtocol)
local DeepLinkSource = LinkingProtocolModule.Enums.DeepLinkSource
local LinkingProtocol = LinkingProtocolModule.LinkingProtocol
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local RoactRodux = InGameMenuDependenciesModule.RoactRodux
local T = InGameMenuDependenciesModule.t
local LeavePromptModule = require(script.Parent.LeavePrompt)
local Parent = script.Parent.Parent.Parent.Parent
local WithLocalizationModule = require(Parent.Localization.withLocalization)
local CloseMenuModule = require(Parent.Thunks.CloseMenu)
local SendAnalyticsModule = require(Parent.Utility.SendAnalytics)
local ConstantsModule = require(Parent.Resources.Constants)
local LeaveToAppPrompt = Roact.PureComponent:extend("LeaveToAppPrompt")
LeaveToAppPrompt.validateProps = T.strictInterface({
	closeMenu = T.callback,
	canGamepadCaptureFocus = T.optional(T.boolean),
	canKeyboardCaptureFocus = T.optional(T.boolean),
	onConfirm = T.optional(T.callback),
	linkingProtocol = T.table
})
LeaveToAppPrompt.defaultProps = { linkingProtocol = LinkingProtocol.default }

function LeaveToAppPrompt.init(p1)
	-- upvalues: SendAnalyticsModule (copy), ConstantsModule (copy), DeepLinkSource (copy), RunService (copy)
	function p1.goToHomePage()
		-- upvalues: SendAnalyticsModule (upval), ConstantsModule (upval), p1 (copy), DeepLinkSource (upval), RunService (upval)
		SendAnalyticsModule(ConstantsModule.AnalyticsLeaveToHomeName, ConstantsModule.AnalyticsLeaveToHomeName, { confirmed = ConstantsModule.AnalyticsLeaveToHomeName })
		
		if p1.props.linkingProtocol:isInternalDlicEnabled() then
			local Home = p1.props.linkingProtocol:createInternalDlic("roblox://navigation/home", DeepLinkSource.LuaInternal)
			RunService.Heartbeat:Wait()
			p1.props.linkingProtocol:detectDeeplinkIntent(Home)
		else
			RunService.Heartbeat:Wait()
			p1.props.linkingProtocol:detectURL("roblox://navigation/home")
		end
		game:Shutdown()
	end
end

function LeaveToAppPrompt.render(p1)
	-- upvalues: WithLocalizationModule (copy), Roact (copy), LeavePromptModule (copy)
	return WithLocalizationModule({
		titleText = "CoreScripts.InGameMenu.Prompt.LeaveGameTitle",
		bodyText = "CoreScripts.InGameMenu.Prompt.LeaveGameBodyText",
		confirmText = "CoreScripts.InGameMenu.Prompt.BackToHome",
		cancelText = "CoreScripts.InGameMenu.Prompt.ResumeGame"
	})(function(p2)
		-- upvalues: Roact (upval), LeavePromptModule (upval), p1 (copy)
		return Roact.createElement(LeavePromptModule, {
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

return RoactRodux.UNSTABLE_connect2(function(p1, _)
	-- upvalues: ConstantsModule (copy)
	return {
		canGamepadCaptureFocus = p1.menuPage == ConstantsModule.LeaveToAppPromptPageKey and p1.displayOptions.inputType == ConstantsModule.InputType.Gamepad and (not p1.respawn.dialogOpen and p1.currentZone == 1),
		canKeyboardCaptureFocus = p1.menuPage == ConstantsModule.LeaveToAppPromptPageKey and p1.displayOptions.inputType == ConstantsModule.InputType.MouseAndKeyboard and not p1.respawn.dialogOpen
	}
end, function(Callback)
	-- upvalues: CloseMenuModule (copy)
	return {
		closeMenu = function()
			-- upvalues: Callback (copy), CloseMenuModule (upval)
			Callback(CloseMenuModule)
		end
	}
end)(LeaveToAppPrompt)