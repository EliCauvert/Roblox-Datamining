local t = {}
local var1 = nil

function t.hideOverlay()
	-- upvalues: var1 (write)
	if var1 then
		var1:Destroy()
		var1 = nil
	end
end

function t.showOverlay(p1, p2, p3)
	-- upvalues: t (ref), var1 (write)
	t.hideOverlay()
	local textOverlay = Instance.new("Frame")
	textOverlay.Name = "TextOverlay"
	textOverlay.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
	textOverlay.BackgroundTransparency = 0.5
	textOverlay.Size = UDim2.new(0.7, 0, 0.1, 0)
	textOverlay.Position = UDim2.new(0.5, 0, 0.8, 0)
	textOverlay.AnchorPoint = Vector2.new(0.5, 0.5)
	textOverlay.ZIndex = 100
	local overlayLabel = Instance.new("TextLabel")
	overlayLabel.Name = "OverlayLabel"
	overlayLabel.Text = p1
	overlayLabel.TextColor3 = Color3.new(1, 1, 1)
	overlayLabel.TextScaled = true
	overlayLabel.TextWrapped = true
	overlayLabel.BackgroundTransparency = 1
	overlayLabel.Size = UDim2.new(0.8, 0, 0.8, 0)
	overlayLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
	overlayLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	overlayLabel.Font = Enum.Font.SourceSans
	overlayLabel.Parent = textOverlay
	overlayLabel.ZIndex = 200
	textOverlay.Parent = p3
	var1 = textOverlay
	task.spawn(function()
		-- upvalues: p2 (ref), var1 (copy), textOverlay (ref), t (copy)
		task.wait(p2)
		
		if var1 == textOverlay then
			t.hideOverlay()
		end
	end)
end

return t