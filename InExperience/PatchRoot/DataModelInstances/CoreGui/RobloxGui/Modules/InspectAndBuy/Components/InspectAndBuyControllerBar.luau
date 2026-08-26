local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local roactModule = require(corePackagesService.Packages.Roact)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local controllerBar = require(corePackagesService.Packages.UIBlox).App.Bar.ControllerBar
local controllerShortcutKeycodesModule = require(script.Parent.Common.ControllerShortcutKeycodes)
local favorite = controllerShortcutKeycodesModule.Favorite
local tryOn = controllerShortcutKeycodesModule.TryOn
local tModule = require(corePackagesService.Packages.t)
local _ = {
	back = "CoreScripts.TopBar.Back",
	confirm = "InGame.InspectMenu.Action.Confirm",
	favorite = "InGame.InspectMenu.Action.Favorite",
	unfavorite = "InGame.InspectMenu.Action.Unfavorite",
	tryOn = "InGame.InspectMenu.Action.TryOn",
	takeOff = "InGame.InspectMenu.Action.TakeOff"
}
local inspectAndBuyControllerBar = roactModule.PureComponent:extend("InspectAndBuyControllerBar")
inspectAndBuyControllerBar.validateProps = tModule.strictInterface({
	showTryOn = tModule.boolean,
	showFavorite = tModule.boolean,
	isFavorited = tModule.boolean
})

function inspectAndBuyControllerBar.render(p1)
	-- upvalues: robloxTranslatorModule (ref), tryOn (ref), favorite (ref), roactModule (ref), coreGuiService (ref), controllerBar (ref)
	local list = {
		{
			text = robloxTranslatorModule:FormatByKey("InGame.InspectMenu.Action.Confirm"),
			keyCode = Enum.KeyCode.ButtonA
		}
	}
	
	if p1.props.showTryOn then
		table.insert(list, 1, {
			text = p1.props.tryingOn and robloxTranslatorModule:FormatByKey("InGame.InspectMenu.Action.TakeOff") or robloxTranslatorModule:FormatByKey("InGame.InspectMenu.Action.TryOn"),
			keyCode = tryOn
		})
	end
	if p1.props.showFavorite then
		table.insert(list, 1, {
			text = p1.props.isFavorited and robloxTranslatorModule:FormatByKey("InGame.InspectMenu.Action.Unfavorite") or robloxTranslatorModule:FormatByKey("InGame.InspectMenu.Action.Favorite"),
			keyCode = favorite
		})
	end
	return roactModule.createElement(roactModule.Portal, { target = coreGuiService }, {
		InspectAndBuyControllerBar = roactModule.createElement("ScreenGui", {
			DisplayOrder = 1,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		}, {
			ControllerBar = roactModule.createElement(controllerBar, {
				leftHint = {
					text = robloxTranslatorModule:FormatByKey("CoreScripts.TopBar.Back"),
					keyCode = Enum.KeyCode.ButtonB
				},
				rightHints = list
			})
		})
	})
end

return inspectAndBuyControllerBar