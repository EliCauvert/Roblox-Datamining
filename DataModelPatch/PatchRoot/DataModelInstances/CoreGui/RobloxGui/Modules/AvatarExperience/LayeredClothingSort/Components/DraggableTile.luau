local NotificationService = game:GetService("NotificationService")
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local LoadableImage = UIBloxModule.App.Loading.LoadableImage
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local ExternalEventConnection = require(CorePackages.Workspace.Packages.RoactUtils).ExternalEventConnection
local ConstantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Constants)
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local DraggableTile = RoactModule.PureComponent:extend("DraggableTile")
DraggableTile.validateProps = TModule.strictInterface({
	thumbnail = TModule.string,
	ZIndex = TModule.number,
	isSelectedByTap = TModule.boolean,
	imageTransparency = TModule.number,
	AnchorPoint = TModule.Vector2,
	Position = TModule.UDim2,
	Size = TModule.UDim2,
	assetTypeId = TModule.string
})
DraggableTile.defaultProps = {
	isSelectedByTap = false,
	ZIndex = 1,
	imageTransparency = 0,
	AnchorPoint = Vector2.new(0, 0),
	Position = UDim2.fromScale(0, 0),
	Size = UDim2.fromScale(1, 1)
}
local _UDim = UDim.new(0, 10)

function DraggableTile.init(p1)
	-- upvalues: NotificationService (copy)
	p1:setState({ style = string.lower(NotificationService.SelectedTheme) })
	
	function p1.updateTheme()
		-- upvalues: p1 (copy), NotificationService (upval)
		p1:setState({ style = string.lower(NotificationService.SelectedTheme) })
	end
end

function DraggableTile.render(p1)
	-- upvalues: WithStyleFunction (copy), ConstantsModule (copy), RoactModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), ImageSetLabel (copy), LoadableImage (copy), _UDim (copy), ExternalEventConnection (copy), NotificationService (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: ConstantsModule (upval), p1 (copy), RoactModule (upval), FFlagAXMigrateAXToGlobalAutofocus (upval), ImageSetLabel (upval), LoadableImage (upval), _UDim (upval), ExternalEventConnection (upval), NotificationService (upval)
		local Theme = p2.Theme
		
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 0,
			Size = p1.props.Size,
			BackgroundColor3 = Theme.BackgroundDefault.Color,
			SizeConstraint = Enum.SizeConstraint.RelativeXX,
			ZIndex = p1.props.ZIndex,
			AnchorPoint = p1.props.AnchorPoint,
			Position = p1.props.Position,
			Selectable = if FFlagAXMigrateAXToGlobalAutofocus then true else nil
		}, {
			BackgroundImage = RoactModule.createElement(ImageSetLabel, {
				BorderSizePixel = 0,
				ZIndex = 0,
				Image = if ConstantsModule.GradientBackgroundAssetTypeIds[p1.props.assetTypeId] or p1.props.assetTypeId == ConstantsModule.AssetTypeIdStrings.HairAccessory then if p1.state.style == "dark" then "rbxasset://textures/ui/AvatarExperience/glowLight.png" else "rbxasset://textures/ui/AvatarExperience/glowDark.png" else nil,
				ImageTransparency = p1.props.imageTransparency,
				BackgroundTransparency = Theme.PlaceHolder.Transparency,
				BackgroundColor3 = Theme.PlaceHolder.Color,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.fromScale(1, 1)
			}, {
				Image = RoactModule.createElement(LoadableImage, {
					BackgroundTransparency = 1,
					ZIndex = 0,
					showFailedStateWhenLoadingFailed = true,
					useShimmerAnimationWhileLoading = true,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Image = p1.props.thumbnail,
					ImageTransparency = p1.props.imageTransparency,
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Size = UDim2.fromScale(1, 1),
					cornerRadius = _UDim
				}),
				UICorner = RoactModule.createElement("UICorner", { CornerRadius = _UDim })
			}),
			ThemeConnection = RoactModule.createElement(ExternalEventConnection, {
				event = NotificationService:GetPropertyChangedSignal("SelectedTheme"),
				callback = p1.updateTheme
			}),
			UICorner = RoactModule.createElement("UICorner", { CornerRadius = _UDim })
		})
	end)
end

return DraggableTile