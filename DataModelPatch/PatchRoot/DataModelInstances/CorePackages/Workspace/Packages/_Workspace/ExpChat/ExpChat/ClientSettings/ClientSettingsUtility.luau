local ExpChat = script:FindFirstAncestor("ExpChat")
local Colors = require(ExpChat.Parent.UIBlox).App.Style.Colors
local ChatWindowBackgroundColor3 = require(ExpChat.Config).ChatWindowBackgroundColor3

return {
	getBackgroundColor = function(Frame: Frame, p1)
		-- upvalues: ChatWindowBackgroundColor3 (copy), Colors (copy)
		return if Frame.BackgroundColor3 == ChatWindowBackgroundColor3 then Colors.Flint:Lerp(Frame.BackgroundColor3, p1.preferredTransparency) else Frame.BackgroundColor3
	end,
	getBackgroundTransparency = function(Frame, p1)
		return Frame.BackgroundTransparency * p1.preferredTransparency
	end
}