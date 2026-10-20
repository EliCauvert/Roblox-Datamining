local CorePackages = game:GetService("CorePackages")
local DashModule = require(CorePackages.Packages.Dash)
local TModule = require(CorePackages.Packages.t)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local WithStyleFunction = UIBloxModule.Style.withStyle
local IconButton = UIBloxModule.App.Button.IconButton
local IconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local TopBarModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Components.TopBar.TopBar)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local ManageButton = RoactModule.PureComponent:extend("ManageButton")
ManageButton.validateProps = TModule.strictInterface({
	formFactor = TModule.string,
	isCompactView = TModule.boolean,
	isSearching = TModule.boolean,
	setVisible = DashModule.isCallable,
	cancelSearch = DashModule.isCallable,
	activateSearch = DashModule.isCallable,
	buttonRef = TModule.optional(TModule.table),
	navigation = TModule.table
})

function ManageButton.init(p1)
	-- upvalues: AvatarScreen (copy)
	function p1.showManageCostumesCallback()
		-- upvalues: p1 (copy), AvatarScreen (upval)
		p1.props.navigation.navigate(AvatarScreen.ManageOutfitPage)
	end
end

function ManageButton.render(p1)
	-- upvalues: WithStyleFunction (copy), TopBarModule (copy), RoactModule (copy), IconButton (copy), Images (copy), IconSize (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: TopBarModule (upval), p1 (copy), RoactModule (upval), IconButton (upval), Images (upval), IconSize (upval)
		return RoactModule.createElement(IconButton, {
			size = UDim2.new(0, TopBarModule.getIconButtonSize(p1.props.formFactor), 1, 0),
			icon = Images["icons/common/settings"],
			iconSize = IconSize.Medium,
			iconColor3 = p2.Theme.IconEmphasis.Color,
			iconTransparency = p2.Theme.IconEmphasis.Transparency,
			onActivated = p1.showManageCostumesCallback,
			buttonRef = p1.props.buttonRef
		})
	end)
end

return (RoactNavigationModule.withNavigation(ManageButton))