local CorePackages = game:GetService("CorePackages")
local CoreGui = game:GetService("CoreGui")
local LocalizationService = game:GetService("LocalizationService")
local ReactModule = require(CorePackages.Packages.React)
local RoactModule = require(CorePackages.Packages.Roact)
local InGameMenuConstantsModule = require(CoreGui:WaitForChild("RobloxGui").Modules.InGameMenuConstants)
local ControllerBar = require(CorePackages.Packages.UIBlox).App.Bar.ControllerBar
local _ = require(CorePackages.Workspace.Packages.RobloxTranslator)
local Localization = require(CorePackages.Workspace.Packages.InExperienceLocales).Localization
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector

return function(p1) --[[ Line: 27 | Named "QuickMenuControllerBar" ]]
	-- upvalues: Localization (copy), LocalizationService (copy), ReactModule (copy), UseSelectorFunction (copy), RoactModule (copy), CoreGui (copy), InGameMenuConstantsModule (copy), ControllerBar (copy)
	local NewLocalization = Localization.new(LocalizationService.RobloxLocaleId)
	local RightHints = {
		{
			text = NewLocalization:Format("CoreScripts.TopBar.Respawn"),
			keyCode = Enum.KeyCode.ButtonY
		},
		{
			text = NewLocalization:Format("CoreScripts.TopBar.Leave"),
			keyCode = Enum.KeyCode.ButtonX
		}
	}
	
	if p1.chatMenuEnabled then
		table.insert(RightHints, 1, {
			text = NewLocalization:Format(if UseSelectorFunction((ReactModule.useCallback(function(p2) --[[ Line: 44 ]]
				return p2.chat.visible
			end))) then "CoreScripts.TopBar.HideChat" else "CoreScripts.TopBar.ShowChat"),
			keyCode = Enum.KeyCode.ButtonR1
		})
	end
	return ReactModule.createElement(RoactModule.Portal, { target = CoreGui }, {
		QuickMenuControllerBar = ReactModule.createElement("ScreenGui", {
			DisplayOrder = InGameMenuConstantsModule.DisplayOrder.ControllerBar
		}, {
			ControllerBar = ReactModule.createElement(ControllerBar, {
				leftHint = {
					text = NewLocalization:Format("CoreScripts.TopBar.Back"),
					keyCode = Enum.KeyCode.ButtonB
				},
				rightHints = RightHints
			})
		})
	})
end