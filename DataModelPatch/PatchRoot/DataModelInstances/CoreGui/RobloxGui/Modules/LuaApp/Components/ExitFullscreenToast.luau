local CorePackages = game:GetService("CorePackages")
local CoreGui = game:GetService("CoreGui")
local Modules = CoreGui.RobloxGui.Modules
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local ConstantsModule = require(Modules.LuaApp.Constants)
local ScreenGuiWithBlurControlModule = require(Modules.LuaApp.Components.ScreenGuiWithBlurControl)
local RoactModule = require(CorePackages.Packages.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local Toast = UIBloxModule.App.Dialog.Toast
local CtrlCommandF: string = if game:GetService("UserInputService"):GetPlatform() == Enum.Platform.OSX then "Ctrl + Command + F" else "F11"

return function(_)
	-- upvalues: WithLocalizationModule (copy), WithStyleFunction (copy), RoactModule (copy), Toast (copy), CtrlCommandF (ref), CoreGui (copy), ScreenGuiWithBlurControlModule (copy), ConstantsModule (copy)
	return WithLocalizationModule({ titleText = "CommonUI.Messages.Label.ToExitFullscreen" })(function(p1)
		-- upvalues: WithStyleFunction (upval), RoactModule (upval), Toast (upval), CtrlCommandF (upval), CoreGui (upval), ScreenGuiWithBlurControlModule (upval), ConstantsModule (upval)
		return WithStyleFunction(function(_)
			-- upvalues: RoactModule (upval), Toast (upval), CtrlCommandF (upval), p1 (copy), CoreGui (upval), ScreenGuiWithBlurControlModule (upval), ConstantsModule (upval)
			return RoactModule.createElement(RoactModule.Portal, { target = CoreGui }, {
				ExitFullscreenToastScreen = RoactModule.createElement(ScreenGuiWithBlurControlModule, {
					ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
					DisplayOrder = ConstantsModule.DisplayOrder.Toast
				}, {
					Toast = RoactModule.createElement(Toast, {
						duration = 3,
						toastContent = { toastTitle = CtrlCommandF, toastSubtitle = p1.titleText }
					})
				})
			})
		end)
	end)
end