local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local roactModule = require(corePackagesService.Packages.Roact)
local shareGame = robloxGui.Modules.Settings.Pages.ShareGame
local immutable = require(corePackagesService.Workspace.Packages.AppCommonLib).Immutable
local constantsModule = require(shareGame.Constants)
local rectangleButtonModule = require(shareGame.Components.RectangleButton)
local themeModule = require(robloxGui.Modules.Settings.Theme)
local semibold = themeModule.font(Enum.Font.SourceSansSemibold, "Semibold")
local var7 = themeModule.textSize(19)
local inviteStatus = constantsModule.InviteStatus
local t = {
	[inviteStatus.Success] = "Feature.SettingsHub.Label.Invited",
	[inviteStatus.Moderated] = "Feature.SettingsHub.Label.Moderated",
	[inviteStatus.Pending] = "Feature.SettingsHub.Label.Sending"
}
local var9 = require(shareGame.getTranslator)()
local inviteButton = roactModule.PureComponent:extend("InviteButton")

function inviteButton.render(p0)
	-- upvalues: inviteStatus (ref), immutable (ref), roactModule (ref), rectangleButtonModule (ref), semibold (ref), var9 (ref), var7 (ref), constantsModule (ref), t (ref)
	local anchorPoint = p0.props.anchorPoint
	local position = p0.props.position
	local size = p0.props.size
	local layoutOrder = p0.props.layoutOrder
	local zIndex = p0.props.zIndex
	local onInvite = p0.props.onInvite
	local inviteStatus_1 = p0.props.inviteStatus
	
	return if inviteStatus_1 and inviteStatus_1 ~= inviteStatus.Failed then roactModule.createElement("TextLabel", {
		BackgroundTransparency = 1,
		AnchorPoint = anchorPoint,
		Position = position,
		Size = size,
		Font = semibold,
		Text = var9:FormatByKey(t[inviteStatus_1] or "Feature.SettingsHub.Label.Moderated"),
		TextSize = var7,
		TextColor3 = constantsModule.Color.WHITE,
		TextXAlignment = Enum.TextXAlignment.Center,
		LayoutOrder = layoutOrder,
		ZIndex = zIndex
	}) else roactModule.createElement(rectangleButtonModule, immutable.Set(p0.props, "onClick", function()
		-- upvalues: onInvite (ref)
		onInvite()
	end), {
		InviteText = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Font = semibold,
			Text = var9:FormatByKey("Feature.SettingsHub.Action.InviteFriend"),
			TextSize = var7,
			TextColor3 = constantsModule.Color.WHITE,
			ZIndex = zIndex
		})
	})
end

return inviteButton