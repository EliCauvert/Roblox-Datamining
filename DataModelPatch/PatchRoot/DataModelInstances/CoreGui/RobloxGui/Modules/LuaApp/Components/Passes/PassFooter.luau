local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactLocalizationModule = require(Modules.LuaApp.Services.RoactLocalization)
local NumberLocalization = require(CorePackages.Workspace.Packages.Localization).NumberLocalization
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local TModule = require(CorePackages.Packages.t)
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local IconsCommonRobux = UIBloxModule.App.ImageSet.Images["icons/common/robux"]
local PassFooter = RoactModule.PureComponent:extend("PassFooter")
PassFooter.validateProps = TModule.strictInterface({
	price = TModule.number,
	userOwnsPass = TModule.boolean,
	onActivated = TModule.callback,
	localization = TModule.table
})

function PassFooter.render(p1)
	-- upvalues: WithLocalizationModule (copy), NumberLocalization (copy), RoactModule (copy), Button (copy), ButtonType (copy), IconsCommonRobux (copy)
	local Localization = p1.props.localization
	local Price = p1.props.price
	local UserOwnsPass = p1.props.userOwnsPass
	
	return WithLocalizationModule({ owned = "Feature.Catalog.Label.Owned" })(function(p2)
		-- upvalues: UserOwnsPass (copy), NumberLocalization (upval), Price (copy), Localization (copy), RoactModule (upval), Button (upval), ButtonType (upval), IconsCommonRobux (upval), p1 (copy)
		return RoactModule.createElement(Button, {
			buttonType = ButtonType.PrimarySystem,
			size = UDim2.new(1, 0, 0, 35),
			icon = if UserOwnsPass then nil else IconsCommonRobux,
			text = if UserOwnsPass then p2.owned else NumberLocalization.abbreviate(Price, Localization:GetLocale()),
			isDisabled = UserOwnsPass,
			onActivated = p1.props.onActivated
		})
	end)
end

return (RoactServices.connect({ localization = RoactLocalizationModule })(PassFooter))