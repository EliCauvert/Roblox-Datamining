return {
	createLoadingOverlay = function(p1) --[[ Line: 4 ]]
		p1.LoadingOverlay = Instance.new("Frame")
		p1.LoadingOverlay.Name = "LoadingOverlay"
		p1.LoadingOverlay.BackgroundColor3 = p1.defaultBackgroundColor3
		p1.LoadingOverlay.BackgroundTransparency = p1.defaultBackgroundTransparency
		p1.LoadingOverlay.AnchorPoint = Vector2.new(0.5, 0.5)
		p1.LoadingOverlay.Position = UDim2.new(0.5, 0, 0.5, 0)
		p1.LoadingOverlay.BorderSizePixel = 0
		p1.LoadingOverlay.Size = UDim2.new(0.5, 0, 0.5, 0)
		p1.LoadingOverlay.Visible = false
		p1.LoadingOverlay.Parent = p1.screenGui
		p1.LoadingLabel = Instance.new("TextLabel")
		p1.LoadingLabel.Name = "LoadingLabel"
		p1.LoadingLabel.Font = Enum.Font.SourceSans
		p1.LoadingLabel.TextXAlignment = Enum.TextXAlignment.Center
		p1.LoadingLabel.TextYAlignment = Enum.TextYAlignment.Center
		p1.LoadingLabel.AnchorPoint = Vector2.new(0.5, 0.5)
		p1.LoadingLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
		p1.LoadingLabel.Size = UDim2.new(1, 0, 1, 0)
		p1.LoadingLabel.SizeConstraint = Enum.SizeConstraint.RelativeXY
		p1.LoadingLabel.BackgroundTransparency = 1
		p1.LoadingLabel.Text = "Loading"
		p1.LoadingLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		p1.LoadingLabel.TextScaled = true
		p1.LoadingLabel.Parent = p1.LoadingOverlay
	end
}