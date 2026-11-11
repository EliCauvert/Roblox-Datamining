local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local UseLocalizationModule = require(Modules.LuaApp.Hooks.useLocalization)
local PartialPageModal = require(CorePackages.Packages.UIBlox).App.Dialog.Modal.PartialPageModal
local GetFFlagBottomAnchorXDLCodeModalModule = require(Modules.LuaApp.Flags.GetFFlagBottomAnchorXDLCodeModal)

return function(p1)
	-- upvalues: UseLocalizationModule (copy), RoactModule (copy), PartialPageModal (copy), GetFFlagBottomAnchorXDLCodeModalModule (copy)
	return RoactModule.createElement(PartialPageModal, {
		title = UseLocalizationModule({
			alertTitle = "Authentication.CrossDevice.Heading.QuickLogin"
		}).alertTitle,
		screenSize = p1.screenSize,
		onCloseClicked = p1.onCloseClicked,
		position = UDim2.new(0.5, 0, 0.5, 0),
		anchorPoint = if GetFFlagBottomAnchorXDLCodeModalModule() then Vector2.new(0.5, 0) else Vector2.new(0.5, 0.5)
	}, { ViewContainer = p1.loginCode })
end