local SecondsToTimeStrModule = require(script.Parent.SecondsToTimeStr)

return {
	createScrubber = function(p1)
		-- upvalues: SecondsToTimeStrModule (copy)
		p1.ScrubberLoadProgress = Instance.new("Frame")
		p1.ScrubberLoadProgress.Name = "ScrubberLoadProgress"
		p1.ScrubberLoadProgress.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
		p1.ScrubberLoadProgress.BackgroundTransparency = 0.5
		p1.ScrubberLoadProgress.BorderSizePixel = 0
		p1.ScrubberLoadProgress.AnchorPoint = Vector2.new(0, 0)
		p1.ScrubberLoadProgress.Position = UDim2.new(0, 0, 0, 0)
		p1.ScrubberLoadProgress.SizeConstraint = Enum.SizeConstraint.RelativeXY
		p1.ScrubberLoadProgress.Size = UDim2.new(0, 0, 1, 0)
		p1.ScrubberLoadProgress.Parent = p1.ScrubberControlBar
		p1.ScrubberPlayProgress = Instance.new("Frame")
		p1.ScrubberPlayProgress.Name = "ScrubberPlayProgress"
		p1.ScrubberPlayProgress.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		p1.ScrubberPlayProgress.BorderSizePixel = 0
		p1.ScrubberPlayProgress.AnchorPoint = Vector2.new(0, 0)
		p1.ScrubberPlayProgress.Position = UDim2.new(0, 0, 0, 0)
		p1.ScrubberPlayProgress.SizeConstraint = Enum.SizeConstraint.RelativeXY
		p1.ScrubberPlayProgress.Size = UDim2.new(0, 0, 1, 0)
		p1.ScrubberPlayProgress.Parent = p1.ScrubberLoadProgress
		p1.ScrubberButton = Instance.new("TextButton")
		p1.ScrubberButton.Name = "ScrubberButton"
		p1.ScrubberButton.Text = ""
		p1.ScrubberButton.BackgroundTransparency = 1
		p1.ScrubberButton.BorderSizePixel = 0
		p1.ScrubberButton.AnchorPoint = Vector2.new(0, 0)
		p1.ScrubberButton.Position = UDim2.new(0, 0, 0, 0)
		p1.ScrubberButton.SizeConstraint = Enum.SizeConstraint.RelativeXY
		p1.ScrubberButton.Size = UDim2.new(1, 0, 1, 0)
		p1.ScrubberButton.Parent = p1.ScrubberControlBar
		p1.ScrubberTimeLabel = Instance.new("TextLabel")
		p1.ScrubberTimeLabel.Name = "ScrubberTimeLabel"
		p1.ScrubberTimeLabel.Font = Enum.Font.SourceSans
		p1.ScrubberTimeLabel.TextXAlignment = Enum.TextXAlignment.Center
		p1.ScrubberTimeLabel.TextYAlignment = Enum.TextYAlignment.Center
		p1.ScrubberTimeLabel.Size = UDim2.new(0.15, 0, 1.3, 0)
		p1.ScrubberTimeLabel.SizeConstraint = Enum.SizeConstraint.RelativeXY
		p1.ScrubberTimeLabel.AnchorPoint = Vector2.new(0.5, 1)
		p1.ScrubberTimeLabel.Position = UDim2.new(0, 0, 0, 0)
		p1.ScrubberTimeLabel.BorderSizePixel = 0
		p1.ScrubberTimeLabel.BackgroundColor3 = p1.defaultBackgroundColor3
		p1.ScrubberTimeLabel.BackgroundTransparency = p1.defaultBackgroundTransparency
		p1.ScrubberTimeLabel.Text = SecondsToTimeStrModule.convertSecondsToTimeStr(0)
		p1.ScrubberTimeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		p1.ScrubberTimeLabel.TextScaled = true
		p1.ScrubberTimeLabel.Parent = p1.ScrubberControlBar
		p1.ScrubberTimeLabel.Visible = false
		local Padding = Instance.new("UIPadding")
		Padding.PaddingBottom = UDim.new(0.05, 0)
		Padding.Parent = p1.ScrubberTimeLabel
		local ScrubberControlBar = p1.ScrubberControlBar
		
		if ScrubberControlBar then
			local function v3(p2)
				-- upvalues: p1 (copy), ScrubberControlBar (copy), SecondsToTimeStrModule (upval)
				local ScrubberTimeLabel = p1.ScrubberTimeLabel
				
				if not ScrubberTimeLabel then
					warn("No ScrubberTimeLabel found")
					
					return
				end
				ScrubberTimeLabel.Position = UDim2.new(0, p2 - ScrubberControlBar.AbsolutePosition.X, 0, 0)
				local X = ScrubberControlBar.AbsolutePosition.X
				local XRatio = (p2 - X) / (X + ScrubberControlBar.AbsoluteSize.X - X)
				p1.ScrubberTimeLabel.Text = SecondsToTimeStrModule.convertSecondsToTimeStr(XRatio * p1.overallLengthSeconds)
				
				if XRatio > 0.75 then
					p1.ScrubberTimeLabel.AnchorPoint = Vector2.new(1, 1)
					
					return
				else
					p1.ScrubberTimeLabel.AnchorPoint = Vector2.new(0.5, 1)
				end
			end
			
			ScrubberControlBar.MouseEnter:Connect(function(X)
				-- upvalues: p1 (copy), v3 (copy)
				p1.ScrubberTimeLabel.Visible = true
				v3(X)
			end)
			ScrubberControlBar.MouseMoved:Connect(function(X)
				-- upvalues: v3 (copy)
				v3(X)
			end)
			ScrubberControlBar.MouseLeave:Connect(function()
				-- upvalues: p1 (copy)
				p1.ScrubberTimeLabel.Visible = false
			end)
			
			return
		else
			warn("No ScrubberControlBar found")
		end
	end
}