local gameInvite = script:FindFirstAncestor("GameInvite")
local parent = gameInvite.Parent
local reactModule = require(parent.React)
local useStyle = require(parent.UIBlox).Core.Style.useStyle
local sidePadding = require(gameInvite.GameInviteConstants).Layout.SidePadding

return function(p1)
	-- upvalues: useStyle (ref), reactModule (ref), sidePadding (ref)
	local var1 = useStyle()
	local theme = var1.Theme
	local font = var1.Font
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		Size = p1.size,
		LayoutOrder = p1.layoutOrder
	}, {
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, sidePadding),
			PaddingRight = UDim.new(0, sidePadding)
		}),
		CustomText = reactModule.createElement("TextLabel", {
			TextWrapped = true,
			BackgroundTransparency = 1,
			Text = p1.promptMessage,
			TextSize = font.BaseSize * font.Body.RelativeSize,
			TextColor3 = theme.TextEmphasis.Color,
			TextTransparency = theme.TextEmphasis.Transparency,
			Font = font.Body.Font,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextTruncate = Enum.TextTruncate.AtEnd,
			Size = UDim2.new(1, 0, 1, 0)
		})
	})
end