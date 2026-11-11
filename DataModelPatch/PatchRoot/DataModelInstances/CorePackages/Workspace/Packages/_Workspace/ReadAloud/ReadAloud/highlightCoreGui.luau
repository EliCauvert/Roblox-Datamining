local Highlights = Instance.new("Folder")
Highlights.Name = "Highlights"
Highlights.Parent = game:GetService("CoreGui")

return {
	setUpHighlight = function()
		-- upvalues: Highlights (copy)
		local ScreenGui = Instance.new("ScreenGui")
		ScreenGui.Parent = Highlights
		ScreenGui.DisplayOrder = 9999999
		local Highlight = Instance.new("Frame")
		Highlight.Name = "Highlight"
		Highlight.BackgroundTransparency = 1
		Highlight.BorderSizePixel = 0
		Highlight.Size = UDim2.new()
		Highlight.Position = UDim2.new()
		Highlight.Interactable = false
		Highlight.Parent = ScreenGui
		local Stroke = Instance.new("UIStroke")
		Stroke.Color = Color3.fromRGB(51, 95, 255)
		Stroke.Thickness = 2
		Stroke.Parent = Highlight
		local Corner = Instance.new("UICorner")
		Corner.CornerRadius = UDim.new(0, 8)
		Corner.Parent = Highlight
		
		return Highlight
	end,
	cleanUpHighlight = function()
		-- upvalues: Highlights (copy)
		Highlights:ClearAllChildren()
	end,
	highlight = function(p1, Frame: Frame)
		if Frame then
			p1.Size = UDim2.fromOffset(Frame.AbsoluteSize.X, Frame.AbsoluteSize.Y)
			p1.Position = UDim2.fromOffset(Frame.AbsolutePosition.X, Frame.AbsolutePosition.Y)
			p1.Visible = true
			
			return
		else
			p1.Visible = false
		end
	end
}