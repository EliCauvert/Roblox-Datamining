local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local shareGame = robloxGui.Modules.Settings.Pages.ShareGame
local rectangleButtonModule = require(shareGame.Components.RectangleButton)
local iconButtonModule = require(shareGame.Components.IconButton)
local roactModule = require(corePackagesService.Packages.Roact)
local constantsModule = require(shareGame.Constants)
local shareGameIconsModule = require(robloxGui.Modules.Settings.Pages.ShareGame.Spritesheets.ShareGameIcons)
local themeModule = require(robloxGui.Modules.Settings.Theme)
local var1 = require(shareGame.getTranslator)()
local backButton = roactModule.PureComponent:extend("BackButton")
backButton.IconType = { Arrow = "Arrow", Cross = "Cross", None = "None" }
backButton.defaultProps = { iconType = backButton.IconType.None }
local t = {
	[backButton.IconType.Arrow] = "back",
	[backButton.IconType.Cross] = "cross"
}

local var2 = function(p1)
	-- upvalues: t (ref), shareGameIconsModule (ref), roactModule (ref), iconButtonModule (ref)
	local iconType = p1.iconType
	local visible = p1.visible
	local anchorPoint = p1.anchorPoint
	local position = p1.position
	local size = p1.size
	local zIndex = p1.zIndex
	local onClick = p1.onClick
	local var3 = t[iconType]
	
	if var3 then
		return roactModule.createElement(iconButtonModule, {
			visible = visible,
			anchorPoint = anchorPoint,
			position = position,
			size = size,
			zIndex = zIndex,
			onClick = onClick,
			iconHorizontalAlignment = Enum.HorizontalAlignment.Left,
			iconSpritePath = shareGameIconsModule:GetImagePath(),
			iconSpriteFrame = shareGameIconsModule:GetFrame(var3)
		})
	end
end

function backButton.render(p1)
	-- upvalues: backButton (ref), roactModule (ref), rectangleButtonModule (ref), var1 (ref), themeModule (ref), constantsModule (ref), var2 (ref)
	return if p1.props.iconType == backButton.IconType.None then roactModule.createElement(rectangleButtonModule, p1.props, {
		TextLabel = roactModule.createElement("TextLabel", {
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Text = var1:FormatByKey("Feature.SettingsHub.Action.InviteFriendsBack"),
			TextSize = themeModule.textSize(24, "BackButton"),
			TextColor3 = constantsModule.Color.WHITE,
			Font = themeModule.font(Enum.Font.SourceSansSemibold, "BackButton"),
			ZIndex = p1.props.zIndex
		})
	}) else var2(p1.props)
end

return backButton