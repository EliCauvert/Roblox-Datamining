local parent = script:FindFirstAncestor("AppChat").Parent
local roactModule = require(parent.Roact)
local withStyle = require(parent.UIBlox).Style.withStyle
local chatLoadingIndicatorModule = require(script.Parent.ChatLoadingIndicator)
local fFlagAppIaScrollAway = require(parent.SharedFlags).FFlagAppIaScrollAway
local chatLoadingContainer = roactModule.PureComponent:extend("ChatLoadingContainer")
chatLoadingContainer.defaultProps = {
	topBarHeight = 0,
	cellHeight = 64,
	cellWidth = 375,
	topPadding = if fFlagAppIaScrollAway then 0 else nil
}

function chatLoadingContainer.render(p1)
	-- upvalues: withStyle (ref), roactModule (ref), fFlagAppIaScrollAway (ref), chatLoadingIndicatorModule (ref)
	return withStyle(function(p2)
		-- upvalues: roactModule (copy), fFlagAppIaScrollAway (copy), p1 (ref), chatLoadingIndicatorModule (copy)
		return roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ClipsDescendants = true,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = p2.Theme.BackgroundDefault.Color,
			BackgroundTransparency = p2.Tokens.Color.None.Transparency
		}, {
			UIListLayout = roactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				FillDirection = Enum.FillDirection.Vertical
			}),
			UIPadding = if fFlagAppIaScrollAway and p1.props.topPadding > 0 then roactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, p1.props.topPadding) }) else nil,
			ChatLoadingFrame = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 1, 0)
			}, {
				ChatLoadingIndicator = roactModule.createElement(chatLoadingIndicatorModule, {
					cellHeight = p1.props.cellHeight,
					cellWidth = p1.props.cellWidth
				})
			})
		})
	end)
end

return chatLoadingContainer