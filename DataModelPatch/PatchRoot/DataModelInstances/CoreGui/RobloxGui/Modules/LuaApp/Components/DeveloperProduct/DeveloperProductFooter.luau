local CorePackages = game:GetService("CorePackages")
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactLocalizationModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Services.RoactLocalization)
local NumberLocalization = require(CorePackages.Workspace.Packages.Localization).NumberLocalization
local TModule = require(CorePackages.Packages.t)
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local IconsCommonRobux = UIBloxModule.App.ImageSet.Images["icons/common/robux"]
local DeveloperProductFooter = RoactModule.PureComponent:extend("DeveloperProductFooter")
DeveloperProductFooter.validateProps = TModule.strictInterface({
	price = TModule.number,
	onActivated = TModule.callback,
	localization = TModule.table
})

function DeveloperProductFooter.render(p1)
	-- upvalues: RoactModule (copy), Button (copy), ButtonType (copy), IconsCommonRobux (copy), NumberLocalization (copy)
	return RoactModule.createElement(Button, {
		isDisabled = false,
		buttonType = ButtonType.PrimarySystem,
		size = UDim2.new(1, 0, 0, 35),
		icon = IconsCommonRobux,
		text = NumberLocalization.abbreviate(p1.props.price, p1.props.localization:GetLocale()),
		onActivated = p1.props.onActivated
	})
end

return (RoactServices.connect({ localization = RoactLocalizationModule })(DeveloperProductFooter))