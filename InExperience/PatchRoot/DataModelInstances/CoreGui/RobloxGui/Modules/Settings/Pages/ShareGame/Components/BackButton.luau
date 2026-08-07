local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local shareGame = robloxGui.Modules.Settings.Pages.ShareGame
local rectangleButtonModule = require(shareGame.Components.RectangleButton)
local iconButtonModule = require(shareGame.Components.IconButton)
local roactModule = require(corePackagesService.Packages.Roact)
local constantsModule = require(shareGame.Constants)
local shareGameIconsModule = require(robloxGui.Modules.Settings.Pages.ShareGame.Spritesheets.ShareGameIcons)
local themeModule = require(robloxGui.Modules.Settings.Theme)
local var8 = require(shareGame.getTranslator)()
local backButton = roactModule.PureComponent:extend("BackButton")
backButton.IconType = { Arrow = "Arrow", Cross = "Cross", None = "None" }
backButton.defaultProps = { iconType = backButton.IconType.None }
local t = {
	[backButton.IconType.Arrow] = "back",
	[backButton.IconType.Cross] = "cross"
}

local var11 = function(p0) --[[ line: 36 ]]
	-- upvalues: t (ref), shareGameIconsModule (ref), roactModule (ref), iconButtonModule (ref)
	local iconType = p0.iconType
	local visible = p0.visible
	local anchorPoint = p0.anchorPoint
	local position = p0.position
	local size = p0.size
	local zIndex = p0.zIndex
	local onClick = p0.onClick
	local var12 = t[iconType]
	
	if var12 then
		return roactModule.createElement(iconButtonModule, {
			visible = visible,
			anchorPoint = anchorPoint,
			position = position,
			size = size,
			zIndex = zIndex,
			onClick = onClick,
			iconHorizontalAlignment = Enum.HorizontalAlignment.Left,
			iconSpritePath = shareGameIconsModule:GetImagePath(),
			iconSpriteFrame = shareGameIconsModule:GetFrame(var12)
		})
	end
end

function backButton.render(p1) --[[ line: 65 ]]
	-- upvalues: backButton (ref), roactModule (ref), rectangleButtonModule (ref), var8 (ref), themeModule (ref), constantsModule (ref), var11 (ref)
	return if p1.props.iconType == backButton.IconType.None then roactModule.createElement(rectangleButtonModule, p1.props, {
		TextLabel = roactModule.createElement("TextLabel", {
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Text = var8:FormatByKey("Feature.SettingsHub.Action.InviteFriendsBack"),
			TextSize = themeModule.textSize(24, "BackButton"),
			TextColor3 = constantsModule.Color.WHITE,
			Font = themeModule.font(Enum.Font.SourceSansSemibold, "BackButton"),
			ZIndex = p1.props.zIndex
		})
	}) else var11(p1.props)
end

return backButton