local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local RoactModule = require(Parent.Roact)
local WithStyleFunction = require(Parent.UIBlox).Style.withStyle
local ChatLoadingIndicatorModule = require(script.Parent.ChatLoadingIndicator)
local FFlagAppIaScrollAway = require(Parent.SharedFlags).FFlagAppIaScrollAway
local FFlagAppThemeHalloween2026ChatBackgroundModule = require(AppChat.Flags.FFlagAppThemeHalloween2026ChatBackground)
local ChatLoadingContainer = RoactModule.PureComponent:extend("ChatLoadingContainer")
ChatLoadingContainer.defaultProps = {
	topBarHeight = 0,
	cellHeight = 64,
	cellWidth = 375,
	topPadding = if FFlagAppIaScrollAway then 0 else nil
}

function ChatLoadingContainer.render(p1)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), FFlagAppThemeHalloween2026ChatBackgroundModule (copy), FFlagAppIaScrollAway (copy), ChatLoadingIndicatorModule (copy)
	local PageBackgroundTransparency = p1.props.pageBackgroundTransparency
	
	return WithStyleFunction(function(p2)
		-- upvalues: RoactModule (upval), FFlagAppThemeHalloween2026ChatBackgroundModule (upval), PageBackgroundTransparency (copy), FFlagAppIaScrollAway (upval), p1 (copy), ChatLoadingIndicatorModule (upval)
		return RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ClipsDescendants = true,
			Name = if FFlagAppThemeHalloween2026ChatBackgroundModule then "ChatLoadingContainer" else nil,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = p2.Theme.BackgroundDefault.Color,
			BackgroundTransparency = if PageBackgroundTransparency == nil then p2.Tokens.Color.None.Transparency else PageBackgroundTransparency
		}, {
			UIListLayout = RoactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				FillDirection = Enum.FillDirection.Vertical
			}),
			UIPadding = if FFlagAppIaScrollAway and p1.props.topPadding > 0 then RoactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, p1.props.topPadding) }) else nil,
			ChatLoadingFrame = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 1, 0)
			}, {
				ChatLoadingIndicator = RoactModule.createElement(ChatLoadingIndicatorModule, {
					cellHeight = p1.props.cellHeight,
					cellWidth = p1.props.cellWidth,
					pageBackgroundTransparency = PageBackgroundTransparency
				})
			})
		})
	end)
end

return ChatLoadingContainer