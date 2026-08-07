return {
	createLoadingOverlay = function(loadingLabel) --[[ line: 4 ]]
		loadingLabel.LoadingOverlay = Instance.new("Frame")
		loadingLabel.LoadingOverlay.Name = "LoadingOverlay"
		loadingLabel.LoadingOverlay.BackgroundColor3 = loadingLabel.defaultBackgroundColor3
		loadingLabel.LoadingOverlay.BackgroundTransparency = loadingLabel.defaultBackgroundTransparency
		loadingLabel.LoadingOverlay.AnchorPoint = Vector2.new(0.5, 0.5)
		loadingLabel.LoadingOverlay.Position = UDim2.new(0.5, 0, 0.5, 0)
		loadingLabel.LoadingOverlay.BorderSizePixel = 0
		loadingLabel.LoadingOverlay.Size = UDim2.new(0.5, 0, 0.5, 0)
		loadingLabel.LoadingOverlay.Visible = false
		loadingLabel.LoadingOverlay.Parent = loadingLabel.screenGui
		loadingLabel.LoadingLabel = Instance.new("TextLabel")
		loadingLabel.LoadingLabel.Name = "LoadingLabel"
		loadingLabel.LoadingLabel.Font = Enum.Font.SourceSans
		loadingLabel.LoadingLabel.TextXAlignment = Enum.TextXAlignment.Center
		loadingLabel.LoadingLabel.TextYAlignment = Enum.TextYAlignment.Center
		loadingLabel.LoadingLabel.AnchorPoint = Vector2.new(0.5, 0.5)
		loadingLabel.LoadingLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
		loadingLabel.LoadingLabel.Size = UDim2.new(1, 0, 1, 0)
		loadingLabel.LoadingLabel.SizeConstraint = Enum.SizeConstraint.RelativeXY
		loadingLabel.LoadingLabel.BackgroundTransparency = 1
		loadingLabel.LoadingLabel.Text = "Loading"
		loadingLabel.LoadingLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		loadingLabel.LoadingLabel.TextScaled = true
		loadingLabel.LoadingLabel.Parent = loadingLabel.LoadingOverlay
	end
}