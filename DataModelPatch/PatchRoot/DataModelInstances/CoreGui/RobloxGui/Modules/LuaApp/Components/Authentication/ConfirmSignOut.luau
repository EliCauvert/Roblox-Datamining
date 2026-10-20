local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactLocalizationModule = require(Modules.LuaApp.Services.RoactLocalization)
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local AlertWindowModule = require(Modules.LuaApp.Components.AlertWindow)
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local GetFFlagLuaAppUseWithLocalizationModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppUseWithLocalization)
local ConfirmSignOut = RoactModule.PureComponent:extend("ConfirmSignOut")

function ConfirmSignOut.render(p1)
	-- upvalues: RoactModule (copy), AlertWindowModule (copy), GetFFlagLuaAppUseWithLocalizationModule (copy), WithLocalizationModule (copy)
	local Theme = p1.props.theme
	local ContainerWidth = p1.props.containerWidth
	local CloseAlert = p1.props.closeAlert
	local ContinueFunc = p1.props.continueFunc
	local Localization = p1.props.localization
	
	local function v16(p2)
		-- upvalues: RoactModule (upval), AlertWindowModule (upval), Theme (copy), ContainerWidth (copy), ContinueFunc (copy), CloseAlert (copy)
		return RoactModule.createElement(AlertWindowModule, {
			isConfirming = false,
			hasCancelButton = true,
			theme = Theme,
			containerWidth = ContainerWidth,
			titleText = p2.titleText,
			titleFont = Theme.AlertWindow.Title.Font,
			messageText = p2.messageText,
			messageFont = Theme.AlertWindow.Title.Font,
			buttonFont = Theme.AlertWindow.Button.Font,
			confirmButtonText = p2.confirmButtonText,
			onConfirm = ContinueFunc,
			onCancel = CloseAlert
		})
	end
	
	return if GetFFlagLuaAppUseWithLocalizationModule() then WithLocalizationModule({
		titleText = "Application.Logout.Title.Logout",
		messageText = "Application.Logout.Message.Confirmation",
		confirmButtonText = "Application.Logout.Action.Logout",
		cancelButtonText = "Feature.GamePage.LabelCancelField"
	})(v16) else v16({
		titleText = Localization:Format("Application.Logout.Title.Logout"),
		messageText = Localization:Format("Application.Logout.Message.Confirmation"),
		confirmButtonText = Localization:Format("Application.Logout.Action.Logout"),
		cancelButtonText = Localization:Format("Feature.GamePage.LabelCancelField")
	})
end

return (RoactServices.connect({ localization = RoactLocalizationModule })((RoactRoduxModule.connect(nil, function(Callback)
	-- upvalues: CloseCentralOverlayModule (copy)
	return {
		closeAlert = function()
			-- upvalues: Callback (copy), CloseCentralOverlayModule (upval)
			return Callback(CloseCentralOverlayModule())
		end
	}
end)(ConfirmSignOut))))