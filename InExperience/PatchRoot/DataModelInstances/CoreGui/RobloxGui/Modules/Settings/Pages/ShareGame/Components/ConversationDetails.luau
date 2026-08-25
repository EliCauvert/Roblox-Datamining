local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local shareGame = robloxGui.Modules.Settings.Pages.ShareGame
local constantsModule = require(shareGame.Constants)
local themeModule = require(robloxGui.Modules.Settings.Theme)
local conversationDetails = themeModule.font(Enum.Font.SourceSans, "ConversationDetails")
local WHITE = constantsModule.Color.WHITE
local var5 = themeModule.textSize(19)
local conversationDetails_1 = themeModule.font(Enum.Font.SourceSans, "ConversationDetails")
local GRAY3 = constantsModule.Color.GRAY3
local conversationDetails_2 = themeModule.textSize(16, "ConversationDetails")
local conversationDetails_3 = themeModule.font(Enum.Font.SourceSans, "ConversationDetails")
local conversationDetails_4 = themeModule.textSize(16, "ConversationDetails")
local var10 = require(shareGame.getTranslator)()
local conversationDetails_5 = roactModule.PureComponent:extend("ConversationDetails")

function conversationDetails_5.render(p0)
	-- upvalues: roactModule (ref), conversationDetails_2 (ref), conversationDetails_1 (ref), GRAY3 (ref), conversationDetails_4 (ref), var10 (ref), constantsModule (ref), conversationDetails_3 (ref), var5 (ref), conversationDetails (ref), WHITE (ref)
	local title = p0.props.title
	local subtitle = p0.props.subtitle
	local presence = p0.props.presence
	local zIndex = p0.props.zIndex
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = p0.props.size,
		LayoutOrder = p0.props.layoutOrder,
		ZIndex = zIndex
	}, {
		UIListLayout = roactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 2)
		}),
		Title = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextWrapped = true,
			LayoutOrder = 0,
			Size = UDim2.new(1, 0, 0, var5),
			Text = title or "",
			Font = conversationDetails,
			TextColor3 = WHITE,
			TextSize = var5,
			TextXAlignment = Enum.TextXAlignment.Left,
			ZIndex = zIndex
		}),
		Subtitle = if subtitle ~= nil then roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextWrapped = true,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, conversationDetails_2),
			Text = subtitle,
			Font = conversationDetails_1,
			TextColor3 = GRAY3,
			TextSize = conversationDetails_2,
			TextXAlignment = Enum.TextXAlignment.Left,
			ZIndex = zIndex
		}) else nil,
		Presence = if presence ~= nil then roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, conversationDetails_4),
			Text = var10:FormatByKey(constantsModule.PresenceTextKey[presence]),
			Font = conversationDetails_3,
			TextColor3 = constantsModule.PresenceColors[presence],
			TextSize = conversationDetails_4,
			TextXAlignment = Enum.TextXAlignment.Left,
			ZIndex = zIndex
		}) else nil
	})
end

return conversationDetails_5