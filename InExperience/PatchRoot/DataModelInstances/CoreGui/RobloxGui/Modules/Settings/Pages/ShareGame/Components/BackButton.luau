local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local ShareGame = RobloxGui.Modules.Settings.Pages.ShareGame
local RectangleButtonModule = require(ShareGame.Components.RectangleButton)
local IconButtonModule = require(ShareGame.Components.IconButton)
local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local ConstantsModule = require(ShareGame.Constants)
local ShareGameIconsModule = require(RobloxGui.Modules.Settings.Pages.ShareGame.Spritesheets.ShareGameIcons)
local ThemeModule = require(RobloxGui.Modules.Settings.Theme)
local Translator = require(ShareGame.getTranslator)()
local BackButton = RoactModule.PureComponent:extend("BackButton")
BackButton.IconType = { Arrow = "Arrow", Cross = "Cross", None = "None" }
BackButton.defaultProps = { iconType = BackButton.IconType.None }
local config = {
	[BackButton.IconType.Arrow] = "back",
	[BackButton.IconType.Cross] = "cross"
}

local function v11(Props)
	-- upvalues: config (copy), ShareGameIconsModule (copy), RoactModule (copy), IconButtonModule (copy)
	local Visible = Props.visible
	local AnchorPoint = Props.anchorPoint
	local Position = Props.position
	local Size = Props.size
	local ZIndex = Props.zIndex
	local OnClick = Props.onClick
	local Entry = config[Props.iconType]
	
	if not Entry then return end
	return RoactModule.createElement(IconButtonModule, {
		visible = Visible,
		anchorPoint = AnchorPoint,
		position = Position,
		size = Size,
		zIndex = ZIndex,
		onClick = OnClick,
		iconHorizontalAlignment = Enum.HorizontalAlignment.Left,
		iconSpritePath = ShareGameIconsModule:GetImagePath(),
		iconSpriteFrame = ShareGameIconsModule:GetFrame(Entry)
	})
end

function BackButton.render(p1)
	-- upvalues: BackButton (copy), RoactModule (copy), RectangleButtonModule (copy), Translator (copy), ThemeModule (copy), ConstantsModule (copy), v11 (copy)
	local ZIndex = p1.props.zIndex
	
	return if p1.props.iconType == BackButton.IconType.None then RoactModule.createElement(RectangleButtonModule, p1.props, {
		TextLabel = RoactModule.createElement("TextLabel", {
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Text = Translator:FormatByKey("Feature.SettingsHub.Action.InviteFriendsBack"),
			TextSize = ThemeModule.textSize(24, "BackButton"),
			TextColor3 = ConstantsModule.Color.WHITE,
			Font = ThemeModule.font(Enum.Font.SourceSansSemibold, "BackButton"),
			ZIndex = ZIndex
		})
	}) else v11(p1.props)
end

return BackButton