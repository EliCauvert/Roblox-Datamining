local getFStringPlaybackGuidModule = require(script.Parent.Parent.Flags.GetFStringPlaybackGuid)

return {
	create = function(p1, p2)
		-- upvalues: getFStringPlaybackGuidModule (ref)
		local replaySelector = Instance.new("Frame")
		replaySelector.Name = "ReplaySelector"
		replaySelector.Size = UDim2.fromOffset(300, 250)
		replaySelector.Position = UDim2.fromScale(0.5, 0.5)
		replaySelector.AnchorPoint = Vector2.new(0.5, 0.5)
		replaySelector.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		replaySelector.BorderSizePixel = 0
		replaySelector.Parent = p1.screenGui
		local UICorner = Instance.new("UICorner")
		UICorner.CornerRadius = UDim.new(0, 8)
		UICorner.Parent = replaySelector
		local titleLabel = Instance.new("TextLabel")
		titleLabel.Name = "TitleLabel"
		titleLabel.Size = UDim2.new(1, 0, 0, 30)
		titleLabel.Position = UDim2.new(0, 0, 0, 10)
		titleLabel.BackgroundTransparency = 1
		titleLabel.Text = "Enter Engine Context"
		titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		titleLabel.Font = Enum.Font.SourceSansBold
		titleLabel.TextSize = 16
		titleLabel.Parent = replaySelector
		local guidInput = Instance.new("TextBox")
		guidInput.Name = "GuidInput"
		guidInput.Size = UDim2.new(0.9, 0, 0, 40)
		guidInput.Position = UDim2.new(0.5, 0, 0, 50)
		guidInput.AnchorPoint = Vector2.new(0.5, 0)
		guidInput.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
		guidInput.TextColor3 = Color3.fromRGB(255, 255, 255)
		guidInput.PlaceholderText = "Paste GUID here..."
		guidInput.Font = Enum.Font.SourceSans
		guidInput.TextSize = 14
		guidInput.Text = getFStringPlaybackGuidModule()
		guidInput.Parent = replaySelector
		local UICorner_1 = Instance.new("UICorner")
		UICorner_1.CornerRadius = UDim.new(0, 4)
		UICorner_1.Parent = guidInput
		local closeButton = Instance.new("TextButton")
		closeButton.Name = "CloseButton"
		closeButton.Size = UDim2.fromOffset(30, 30)
		closeButton.Position = UDim2.new(1, -4, 0, 4)
		closeButton.AnchorPoint = Vector2.new(1, 0)
		closeButton.BackgroundTransparency = 1
		closeButton.Text = "X"
		closeButton.TextColor3 = Color3.fromRGB(200, 200, 200)
		closeButton.Font = Enum.Font.SourceSansBold
		closeButton.TextSize = 18
		closeButton.Parent = replaySelector
		local openReplaySelectorButton = Instance.new("TextButton")
		openReplaySelectorButton.Name = "OpenReplaySelectorButton"
		openReplaySelectorButton.Size = UDim2.fromOffset(100, 30)
		openReplaySelectorButton.Position = UDim2.new(0, 10, 0, 10)
		openReplaySelectorButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		openReplaySelectorButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		openReplaySelectorButton.Text = "Replay Input"
		openReplaySelectorButton.Font = Enum.Font.SourceSansBold
		openReplaySelectorButton.TextSize = 14
		openReplaySelectorButton.Visible = false
		openReplaySelectorButton.Parent = p1.screenGui
		local UICorner_2 = Instance.new("UICorner")
		UICorner_2.CornerRadius = UDim.new(0, 4)
		UICorner_2.Parent = openReplaySelectorButton
		openReplaySelectorButton.MouseButton1Click:Connect(function()
			-- upvalues: replaySelector (ref), openReplaySelectorButton (ref)
			replaySelector.Visible = true
			openReplaySelectorButton.Visible = false
		end)
		closeButton.MouseButton1Click:Connect(function()
			-- upvalues: replaySelector (ref), openReplaySelectorButton (ref)
			replaySelector.Visible = false
			openReplaySelectorButton.Visible = true
		end)
		local submitButton = Instance.new("TextButton")
		submitButton.Name = "SubmitButton"
		submitButton.Size = UDim2.new(0.5, 0, 0, 30)
		submitButton.Position = UDim2.new(0.5, 0, 0, 200)
		submitButton.AnchorPoint = Vector2.new(0.5, 0)
		submitButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
		submitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		submitButton.Text = "Load Replay"
		submitButton.Font = Enum.Font.SourceSansBold
		submitButton.TextSize = 14
		submitButton.Parent = replaySelector
		local UICorner_3 = Instance.new("UICorner")
		UICorner_3.CornerRadius = UDim.new(0, 4)
		UICorner_3.Parent = submitButton
		submitButton.MouseButton1Click:Connect(function()
			-- upvalues: p2 (ref), guidInput (ref)
			if p2 then
				p2(guidInput.Text)
			end
		end)
		
		return {
			Container = replaySelector,
			SetVisible = function(_, p3)
				-- upvalues: replaySelector (ref), openReplaySelectorButton (ref)
				replaySelector.Visible = p3
				openReplaySelectorButton.Visible = not p3
			end
		}
	end
}