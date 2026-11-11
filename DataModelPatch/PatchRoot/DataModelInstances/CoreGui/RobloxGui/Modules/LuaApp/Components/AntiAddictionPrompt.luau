local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local ConstantsModule = require(Modules.LuaApp.Constants)
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local AppGuiService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppGuiService
local AppUserInputService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppUserInputService
local ScreenGuiWithBlurControlModule = require(Modules.LuaApp.Components.ScreenGuiWithBlurControl)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local LogoutModule = require(Modules.LuaApp.Thunks.Authentication.Logout)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local AppPageModule = require(Modules.LuaApp.AppPage)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local LuaLogoutReasonNamesModule = require(Modules.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames)
local SetScreenGuiBlurModule = require(Modules.LuaApp.Actions.SetScreenGuiBlur)
local AntiAddictionPrompt = RoactModule.PureComponent:extend("AntiAddictionPrompt")

function AntiAddictionPrompt.init(p1)
	local GuiService = p1.props.guiService
	local Networking = p1.props.networking
	p1.state = { screenSize = Vector2.new(0, 0) }
	
	function p1.changeScreenSize(Frame: Frame)
		-- upvalues: p1 (copy)
		if p1.state.screenSize ~= Frame.AbsoluteSize then
			p1:setState({ screenSize = Frame.AbsoluteSize })
		end
	end
	
	function p1.OkCallback(...)
		-- upvalues: p1 (copy)
		if p1.props.okCallback then
			p1.props.okCallback(...)
		end
	end
	
	function p1.LogoutCallback()
		-- upvalues: p1 (copy), Networking (copy), GuiService (copy)
		p1.props.logout(Networking, GuiService)
		
		if p1.props.logoutCallback then
			p1.props.logoutCallback()
		end
	end
end

function AntiAddictionPrompt.render(p1)
	-- upvalues: RoactModule (copy), InteractiveAlert (copy), ButtonType (copy), ScreenGuiWithBlurControlModule (copy), ConstantsModule (copy), WithLocalizationModule (copy)
	local Message = p1.props.message
	local LockOut = p1.props.lockOut
	local LogoutCallback = LockOut and p1.LogoutCallback or p1.OkCallback
	local FocusedTextBox = p1.props.userInputService:GetFocusedTextBox()
	
	if FocusedTextBox then
		FocusedTextBox:ReleaseFocus()
	end
	local function v28(p2)
		-- upvalues: RoactModule (upval), InteractiveAlert (upval), Message (copy), ButtonType (upval), LogoutCallback (copy), p1 (copy), ScreenGuiWithBlurControlModule (upval), ConstantsModule (upval), LockOut (copy)
		return RoactModule.createElement(ScreenGuiWithBlurControlModule, {
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
			DisplayOrder = ConstantsModule.DisplayOrder.AntiAddictionPrompt,
			OnTopOfCoreBlur = LockOut
		}, {
			Overlay = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Active = true,
				Selectable = false,
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundColor3 = Color3.new()
			}, {
				AlertWindow = RoactModule.createElement(InteractiveAlert, {
					title = p2.alertTitle,
					bodyText = Message,
					buttonStackInfo = {
						buttons = {
							{
								buttonType = ButtonType.PrimarySystem,
								props = { onActivated = LogoutCallback, text = p2.buttonText }
							}
						}
					},
					screenSize = p1.state.screenSize
				})
			})
		})
	end
	
	return WithLocalizationModule({
		alertTitle = "CommonUI.Messages.Label.Alert",
		buttonText = if LockOut then "Application.Logout.Action.Logout" else "CommonUI.Messages.Action.OK"
	})(function(p2)
		-- upvalues: v28 (copy)
		return v28(p2)
	end)
end

function AntiAddictionPrompt.didMount(p1)
	if p1.props.lockOut then
		p1.props.setScreenGuiBlur(true)
	end
end

function AntiAddictionPrompt.willUnmount(p1)
	if p1.props.lockOut then
		p1.props.setScreenGuiBlur(false)
	end
end

return (RoactServices.connect({
	guiService = AppGuiService,
	userInputService = AppUserInputService,
	networking = RoactNetworkingModule
})((RoactRoduxModule.connect(nil, function(Callback)
	-- upvalues: AppPageModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy), SetScreenGuiBlurModule (copy), ConstantsModule (copy), LogoutModule (copy), LuaLogoutReasonNamesModule (copy)
	return {
		openLogoutPage = function()
			-- upvalues: AppPageModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownModule (upval)
			local config = { name = AppPageModule.LogoutConfirmation }
			
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
				
				return
			else
				Callback(NavigateDownModule(config))
			end
		end,
		setScreenGuiBlur = function(p1)
			-- upvalues: Callback (copy), SetScreenGuiBlurModule (upval), ConstantsModule (upval)
			Callback(SetScreenGuiBlurModule("AntiAddictionPrompt", p1, ConstantsModule.DisplayOrder.AntiAddictionPrompt))
		end,
		logout = function(p1, p2)
			-- upvalues: Callback (copy), LogoutModule (upval), LuaLogoutReasonNamesModule (upval)
			Callback(LogoutModule(p1, p2, LuaLogoutReasonNamesModule.AntiAddiction))
		end
	}
end)(AntiAddictionPrompt))))