local expChat = script:FindFirstAncestor("ExpChat")
local colors = require(expChat.Parent.UIBlox).App.Style.Colors
local chatWindowBackgroundColor3 = require(expChat.Config).ChatWindowBackgroundColor3

return {
	getBackgroundColor = function(value, p0)
		-- upvalues: chatWindowBackgroundColor3 (ref), colors (ref)
		return if value.BackgroundColor3 == chatWindowBackgroundColor3 then colors.Flint:Lerp(value.BackgroundColor3, p0.preferredTransparency) else value.BackgroundColor3
	end,
	getBackgroundTransparency = function(value, p1)
		return value.BackgroundTransparency * p1.preferredTransparency
	end
}