local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithNavigationFunction = require(CorePackages.Packages.RoactNavigation).withNavigation
local WithStyleFunction = UIBloxModule.Style.withStyle
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local ConstantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.AvatarRefinement.Constants)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local _UDim = UDim.new(0, 10)
local IconsMenuMoreOff = UIBloxModule.App.ImageSet.Images["icons/menu/more_off"]
local LCSortMoreButton = RoactModule.PureComponent:extend("LCSortMoreButton")
LCSortMoreButton.validateProps = TModule.strictInterface({
	Visible = TModule.union(TModule.boolean, TModule.table),
	ZIndex = TModule.number,
	asset = TModule.table,
	onUnequip = TModule.optional(TModule.callback),
	navigation = TModule.table
})

function LCSortMoreButton.init(p1)
	-- upvalues: RoactModule (copy), AvatarScreen (copy)
	p1.menuRef = RoactModule.createRef()
	
	function p1.contextMenuOpen()
		-- upvalues: p1 (copy), AvatarScreen (upval)
		p1.props.navigation.navigate(AvatarScreen.LCSortContextMenu, {
			asset = p1.props.asset,
			tilePositionY = p1.menuRef:getValue() and p1.menuRef:getValue().AbsolutePosition.Y or 0,
			onUnequip = p1.props.onUnequip
		})
	end
end

function LCSortMoreButton.render(p1)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), ConstantsModule (copy), _UDim (copy), ImageSetLabel (copy), IconsMenuMoreOff (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: RoactModule (upval), ConstantsModule (upval), p1 (copy), _UDim (upval), ImageSetLabel (upval), IconsMenuMoreOff (upval)
		local Theme = p2.Theme
		
		return RoactModule.createElement("TextButton", {
			Text = "",
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.fromOffset(ConstantsModule.Tile.ContextWidth - ConstantsModule.Tile.ShownContextWidth, 0),
			Size = UDim2.new(0, ConstantsModule.Tile.ContextWidth, 1, 0),
			BackgroundColor3 = Theme.BackgroundUIContrast.Color,
			BackgroundTransparency = Theme.BackgroundUIContrast.Transparency,
			SizeConstraint = Enum.SizeConstraint.RelativeXX,
			ZIndex = p1.props.ZIndex,
			Visible = p1.props.Visible,
			[RoactModule.Event.Activated] = p1.contextMenuOpen,
			[RoactModule.Ref] = p1.menuRef
		}, {
			UICorner = RoactModule.createElement("UICorner", { CornerRadius = _UDim }),
			ImageSetLabel = RoactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Size = UDim2.fromOffset(ConstantsModule.Tile.MoreIconSize, ConstantsModule.Tile.MoreIconSize),
				Position = UDim2.new(0.5, -4, 0.5, 0),
				Image = IconsMenuMoreOff,
				ImageTransparency = Theme.IconEmphasis.Transparency,
				ImageColor3 = Theme.IconEmphasis.Color
			})
		})
	end)
end

return (WithNavigationFunction(LCSortMoreButton))