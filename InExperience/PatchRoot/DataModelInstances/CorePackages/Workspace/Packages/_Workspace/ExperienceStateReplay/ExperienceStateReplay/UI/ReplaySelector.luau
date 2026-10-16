local GetFStringPlaybackGuidModule = require(script.Parent.Parent.Flags.GetFStringPlaybackGuid)

return {
	create = function(p1, Callback) --[[ Line: 7 ]]
		-- upvalues: GetFStringPlaybackGuidModule (copy)
		local ReplaySelector = Instance.new("Frame")
		ReplaySelector.Name = "ReplaySelector"
		ReplaySelector.Size = UDim2.fromOffset(300, 250)
		ReplaySelector.Position = UDim2.fromScale(0.5, 0.5)
		ReplaySelector.AnchorPoint = Vector2.new(0.5, 0.5)
		ReplaySelector.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		ReplaySelector.BorderSizePixel = 0
		ReplaySelector.Parent = p1.screenGui
		local Corner = Instance.new("UICorner")
		Corner.CornerRadius = UDim.new(0, 8)
		Corner.Parent = ReplaySelector
		local TitleLabel = Instance.new("TextLabel")
		TitleLabel.Name = "TitleLabel"
		TitleLabel.Size = UDim2.new(1, 0, 0, 30)
		TitleLabel.Position = UDim2.new(0, 0, 0, 10)
		TitleLabel.BackgroundTransparency = 1
		TitleLabel.Text = "Enter Engine Context"
		TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TitleLabel.Font = Enum.Font.SourceSansBold
		TitleLabel.TextSize = 16
		TitleLabel.Parent = ReplaySelector
		local GuidInput = Instance.new("TextBox")
		GuidInput.Name = "GuidInput"
		GuidInput.Size = UDim2.new(0.9, 0, 0, 40)
		GuidInput.Position = UDim2.new(0.5, 0, 0, 50)
		GuidInput.AnchorPoint = Vector2.new(0.5, 0)
		GuidInput.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
		GuidInput.TextColor3 = Color3.fromRGB(255, 255, 255)
		GuidInput.PlaceholderText = "Paste GUID here..."
		GuidInput.Font = Enum.Font.SourceSans
		GuidInput.TextSize = 14
		GuidInput.Text = GetFStringPlaybackGuidModule()
		GuidInput.Parent = ReplaySelector
		local Corner1 = Instance.new("UICorner")
		Corner1.CornerRadius = UDim.new(0, 4)
		Corner1.Parent = GuidInput
		local CloseButton = Instance.new("TextButton")
		CloseButton.Name = "CloseButton"
		CloseButton.Size = UDim2.fromOffset(30, 30)
		CloseButton.Position = UDim2.new(1, -4, 0, 4)
		CloseButton.AnchorPoint = Vector2.new(1, 0)
		CloseButton.BackgroundTransparency = 1
		CloseButton.Text = "X"
		CloseButton.TextColor3 = Color3.fromRGB(200, 200, 200)
		CloseButton.Font = Enum.Font.SourceSansBold
		CloseButton.TextSize = 18
		CloseButton.Parent = ReplaySelector
		local OpenReplaySelectorButton = Instance.new("TextButton")
		OpenReplaySelectorButton.Name = "OpenReplaySelectorButton"
		OpenReplaySelectorButton.Size = UDim2.fromOffset(100, 30)
		OpenReplaySelectorButton.Position = UDim2.new(0, 10, 0, 10)
		OpenReplaySelectorButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		OpenReplaySelectorButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		OpenReplaySelectorButton.Text = "Replay Input"
		OpenReplaySelectorButton.Font = Enum.Font.SourceSansBold
		OpenReplaySelectorButton.TextSize = 14
		OpenReplaySelectorButton.Visible = false
		OpenReplaySelectorButton.Parent = p1.screenGui
		local Corner2 = Instance.new("UICorner")
		Corner2.CornerRadius = UDim.new(0, 4)
		Corner2.Parent = OpenReplaySelectorButton
		OpenReplaySelectorButton.MouseButton1Click:Connect(function() --[[ Line: 77 ]]
			-- upvalues: ReplaySelector (copy), OpenReplaySelectorButton (copy)
			ReplaySelector.Visible = true
			OpenReplaySelectorButton.Visible = false
		end)
		CloseButton.MouseButton1Click:Connect(function() --[[ Line: 82 ]]
			-- upvalues: ReplaySelector (copy), OpenReplaySelectorButton (copy)
			ReplaySelector.Visible = false
			OpenReplaySelectorButton.Visible = true
		end)
		local SubmitButton = Instance.new("TextButton")
		SubmitButton.Name = "SubmitButton"
		SubmitButton.Size = UDim2.new(0.5, 0, 0, 30)
		SubmitButton.Position = UDim2.new(0.5, 0, 0, 200)
		SubmitButton.AnchorPoint = Vector2.new(0.5, 0)
		SubmitButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
		SubmitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		SubmitButton.Text = "Load Replay"
		SubmitButton.Font = Enum.Font.SourceSansBold
		SubmitButton.TextSize = 14
		SubmitButton.Parent = ReplaySelector
		local Corner3 = Instance.new("UICorner")
		Corner3.CornerRadius = UDim.new(0, 4)
		Corner3.Parent = SubmitButton
		SubmitButton.MouseButton1Click:Connect(function() --[[ Line: 103 ]]
			-- upvalues: Callback (copy), GuidInput (copy)
			if Callback then
				Callback(GuidInput.Text)
			end
		end)
		
		return {
			Container = ReplaySelector,
			SetVisible = function(_, Visible) --[[ Line: 113 ]]
				-- upvalues: ReplaySelector (copy), OpenReplaySelectorButton (copy)
				ReplaySelector.Visible = Visible
				OpenReplaySelectorButton.Visible = not Visible
			end
		}
	end
}