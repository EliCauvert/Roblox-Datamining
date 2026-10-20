local CorePackages = game:GetService("CorePackages")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local RoactModule = require(CorePackages.Packages.Roact)
local ShareGame = RobloxGui.Modules.Settings.Pages.ShareGame
local Immutable = require(CorePackages.Workspace.Packages.AppCommonLib).Immutable
local ConstantsModule = require(ShareGame.Constants)
local RectangleButtonModule = require(ShareGame.Components.RectangleButton)
local ThemeModule = require(RobloxGui.Modules.Settings.Theme)
local Semibold = ThemeModule.font(Enum.Font.SourceSansSemibold, "Semibold")
local TextSizeResult = ThemeModule.textSize(19)
local InviteStatus = ConstantsModule.InviteStatus
local config = {
	[InviteStatus.Success] = "Feature.SettingsHub.Label.Invited",
	[InviteStatus.Moderated] = "Feature.SettingsHub.Label.Moderated",
	[InviteStatus.Pending] = "Feature.SettingsHub.Label.Sending"
}
local Translator = require(ShareGame.getTranslator)()
local InviteButton = RoactModule.PureComponent:extend("InviteButton")

function InviteButton.render(p1)
	-- upvalues: InviteStatus (copy), Immutable (copy), RoactModule (copy), RectangleButtonModule (copy), Semibold (copy), Translator (copy), TextSizeResult (copy), ConstantsModule (copy), config (copy)
	local AnchorPoint = p1.props.anchorPoint
	local Position = p1.props.position
	local Size = p1.props.size
	local LayoutOrder = p1.props.layoutOrder
	local ZIndex = p1.props.zIndex
	local OnInviteFunction = p1.props.onInvite
	local InviteStatus1 = p1.props.inviteStatus
	
	return if InviteStatus1 and InviteStatus1 ~= InviteStatus.Failed then RoactModule.createElement("TextLabel", {
		BackgroundTransparency = 1,
		AnchorPoint = AnchorPoint,
		Position = Position,
		Size = Size,
		Font = Semibold,
		Text = Translator:FormatByKey(config[InviteStatus1] or "Feature.SettingsHub.Label.Moderated"),
		TextSize = TextSizeResult,
		TextColor3 = ConstantsModule.Color.WHITE,
		TextXAlignment = Enum.TextXAlignment.Center,
		LayoutOrder = LayoutOrder,
		ZIndex = ZIndex
	}) else RoactModule.createElement(RectangleButtonModule, Immutable.Set(p1.props, "onClick", function()
		-- upvalues: OnInviteFunction (copy)
		OnInviteFunction()
	end), {
		InviteText = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Font = Semibold,
			Text = Translator:FormatByKey("Feature.SettingsHub.Action.InviteFriend"),
			TextSize = TextSizeResult,
			TextColor3 = ConstantsModule.Color.WHITE,
			ZIndex = ZIndex
		})
	})
end

return InviteButton