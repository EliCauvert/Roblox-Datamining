local Frame = nil
local CreateTemporaryOverlayModule = {
	hideOverlay = function()
		-- upvalues: Frame (ref)
		if Frame then
			Frame:Destroy()
			Frame = nil
		end
	end
}

function CreateTemporaryOverlayModule.showOverlay(Text, Duration, Parent)
	-- upvalues: CreateTemporaryOverlayModule (copy), Frame (ref)
	CreateTemporaryOverlayModule.hideOverlay()
	local TextOverlay = Instance.new("Frame")
	TextOverlay.Name = "TextOverlay"
	TextOverlay.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
	TextOverlay.BackgroundTransparency = 0.5
	TextOverlay.Size = UDim2.new(0.7, 0, 0.1, 0)
	TextOverlay.Position = UDim2.new(0.5, 0, 0.8, 0)
	TextOverlay.AnchorPoint = Vector2.new(0.5, 0.5)
	TextOverlay.ZIndex = 100
	local OverlayLabel = Instance.new("TextLabel")
	OverlayLabel.Name = "OverlayLabel"
	OverlayLabel.Text = Text
	OverlayLabel.TextColor3 = Color3.new(1, 1, 1)
	OverlayLabel.TextScaled = true
	OverlayLabel.TextWrapped = true
	OverlayLabel.BackgroundTransparency = 1
	OverlayLabel.Size = UDim2.new(0.8, 0, 0.8, 0)
	OverlayLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
	OverlayLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	OverlayLabel.Font = Enum.Font.SourceSans
	OverlayLabel.Parent = TextOverlay
	OverlayLabel.ZIndex = 200
	TextOverlay.Parent = Parent
	Frame = TextOverlay
	task.spawn(function()
		-- upvalues: Duration (copy), Frame (upval), TextOverlay (copy), CreateTemporaryOverlayModule (upval)
		task.wait(Duration)
		
		if Frame == TextOverlay then
			CreateTemporaryOverlayModule.hideOverlay()
		end
	end)
end

return CreateTemporaryOverlayModule