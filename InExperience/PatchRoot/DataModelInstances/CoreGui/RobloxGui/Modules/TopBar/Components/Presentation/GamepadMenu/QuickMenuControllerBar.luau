local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local localizationService = game:GetService("LocalizationService")
local reactModule = require(corePackagesService.Packages.React)
local roactModule = require(corePackagesService.Packages.Roact)
local inGameMenuConstantsModule = require(robloxGui.Modules.InGameMenuConstants)
local controllerBar = require(corePackagesService.Packages.UIBlox).App.Bar.ControllerBar
local _ = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local localization = require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization
local useSelector = require(corePackagesService.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local _ = {
	back = "CoreScripts.TopBar.Back",
	leave = "CoreScripts.TopBar.Leave",
	respawn = "CoreScripts.TopBar.Respawn",
	showChat = "CoreScripts.TopBar.ShowChat",
	hideChat = "CoreScripts.TopBar.HideChat"
}

return function(p0)
	-- upvalues: localization (ref), localizationService (ref), reactModule (ref), useSelector (ref), roactModule (ref), coreGuiService (ref), inGameMenuConstantsModule (ref), controllerBar (ref)
	local var7 = localization.new(localizationService.RobloxLocaleId)
	local list = {
		{
			text = var7:Format("CoreScripts.TopBar.Respawn"),
			keyCode = Enum.KeyCode.ButtonY
		},
		{
			text = var7:Format("CoreScripts.TopBar.Leave"),
			keyCode = Enum.KeyCode.ButtonX
		}
	}
	
	if p0.chatMenuEnabled then
		table.insert(list, 1, {
			text = var7:Format(if useSelector(reactModule.useCallback(function(p1)
				return p1.chat.visible
			end)) then "CoreScripts.TopBar.HideChat" else "CoreScripts.TopBar.ShowChat"),
			keyCode = Enum.KeyCode.ButtonR1
		})
	end
	return reactModule.createElement(roactModule.Portal, { target = coreGuiService }, {
		QuickMenuControllerBar = reactModule.createElement("ScreenGui", {
			DisplayOrder = inGameMenuConstantsModule.DisplayOrder.ControllerBar
		}, {
			ControllerBar = reactModule.createElement(controllerBar, {
				leftHint = {
					text = var7:Format("CoreScripts.TopBar.Back"),
					keyCode = Enum.KeyCode.ButtonB
				},
				rightHints = list
			})
		})
	})
end