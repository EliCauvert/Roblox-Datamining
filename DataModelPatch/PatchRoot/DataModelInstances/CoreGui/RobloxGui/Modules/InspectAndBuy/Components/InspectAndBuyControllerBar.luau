local CorePackages = game:GetService("CorePackages")
local CoreGui = game:GetService("CoreGui")
local RoactModule = require(CorePackages.Packages.Roact)
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local ControllerBar = require(CorePackages.Packages.UIBlox).App.Bar.ControllerBar
local ControllerShortcutKeycodesModule = require(script.Parent.Common.ControllerShortcutKeycodes)
local Favorite = ControllerShortcutKeycodesModule.Favorite
local TryOn = ControllerShortcutKeycodesModule.TryOn
local TModule = require(CorePackages.Packages.t)
local InspectAndBuyControllerBar = RoactModule.PureComponent:extend("InspectAndBuyControllerBar")
InspectAndBuyControllerBar.validateProps = TModule.strictInterface({
	showTryOn = TModule.boolean,
	showFavorite = TModule.boolean,
	isFavorited = TModule.boolean
})

function InspectAndBuyControllerBar.render(p1)
	-- upvalues: RobloxTranslatorModule (copy), TryOn (copy), Favorite (copy), RoactModule (copy), CoreGui (copy), ControllerBar (copy)
	local List = {
		{
			text = RobloxTranslatorModule:FormatByKey("InGame.InspectMenu.Action.Confirm"),
			keyCode = Enum.KeyCode.ButtonA
		}
	}
	
	if p1.props.showTryOn then
		table.insert(List, 1, {
			text = p1.props.tryingOn and RobloxTranslatorModule:FormatByKey("InGame.InspectMenu.Action.TakeOff") or RobloxTranslatorModule:FormatByKey("InGame.InspectMenu.Action.TryOn"),
			keyCode = TryOn
		})
	end
	if p1.props.showFavorite then
		table.insert(List, 1, {
			text = p1.props.isFavorited and RobloxTranslatorModule:FormatByKey("InGame.InspectMenu.Action.Unfavorite") or RobloxTranslatorModule:FormatByKey("InGame.InspectMenu.Action.Favorite"),
			keyCode = Favorite
		})
	end
	return RoactModule.createElement(RoactModule.Portal, { target = CoreGui }, {
		InspectAndBuyControllerBar = RoactModule.createElement("ScreenGui", {
			DisplayOrder = 1,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		}, {
			ControllerBar = RoactModule.createElement(ControllerBar, {
				leftHint = {
					text = RobloxTranslatorModule:FormatByKey("CoreScripts.TopBar.Back"),
					keyCode = Enum.KeyCode.ButtonB
				},
				rightHints = List
			})
		})
	})
end

return InspectAndBuyControllerBar